From: Jorge Ramirez <jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 2/2] mtd: mediatek: driver for MTK Smart Device Gen1
 NAND
Date: Tue, 10 May 2016 10:37:32 -0400
Message-ID: <5731F22C.902@linaro.org>
References: <1461946642-1842-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1461946642-1842-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <20160510141335.442d3d7b@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20160510141335.442d3d7b@bbrezillon>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On 05/10/2016 08:13 AM, Boris Brezillon wrote:
>> +#define ECC_IDLE_REG(x)		((x) == ECC_ENC ? ECC_ENCIDLE : ECC_DECIDLE)
>> >+#define ECC_IDLE_MASK(x)	((x) == ECC_ENC ? ENC_IDLE : DEC_IDLE)
> No need for this macro, it's always bit0, so just define an ECC_IDLE
> macro and use it for both decoder and encoder.

this was only done for consistency to help people reading the code (same 
for codec_enable, codec_disable).
I suppose I could remove macros and just write 0 and 1 to the registers 
if you prefer that.

>
> There seems to be some kind of pattern in your ENC/DEC registers.
> ENC registers start at 0 and DEC ones at 0x100.
> CNF register is always at 0x4 + mode/dir_offset (ie 0x100 for DEC and
> 0x0 for ENC), ...
> Maybe you should define common macros for those registers, and choose
> the base offset depending on the mode you're operating in (encoding or
> decoding).

Not sure if you are familiar with George Lakoff and his book "Don't 
Think Of An Elephant! Know Your Values And Frame The Debate" but the key 
message is not to engage in a discussion when you disagree with the 
terms used by your counterpart since you wont be able to frame the 
argument (the book is actually very interesting if politics and and the 
political debate is something that interest you)

I explicitly chose not to talk about modes, instead I chose the engine 
driver to talk about the codecs it controls; for me mode is a higher 
level concept that I didn't have a need for since in this case the mode 
is a 1-1 relationship to the codec. So when you tell me about the mode 
the engine is operating in I'd rather say the codec that the ecc engine 
is accessing. I hope it makes sense.

if you want to talk about modes instead of the encoders and decoders 
that is fine since you are the maintainer.
I can rewrite the relevant parts of the driver but I honestly see no value.

why did I wrote these macros? just for readability since they are simple 
conditionals.
So coming back to your second question, I not sure why I would use a 
base offset when I already have the map. I wouldn't.

>
>> >+#define ECC_IRQ_REG(x)		((x) == ECC_ENC ? ECC_ENCIRQ_EN : ECC_DECIRQ_EN)
>> >+#define ECC_IRQ_EN(x)		((x) == ECC_ENC ? ENC_IRQEN : DEC_IRQEN)
>> >+#define ECC_CTL_REG(x)		((x) == ECC_ENC ? ECC_ENCCON : ECC_DECCON)
>> >+#define ECC_CODEC_ENABLE(x)	((x) == ECC_ENC ? ENC_EN : DEC_EN)
>> >+#define ECC_CODEC_DISABLE(x)	((x) == ECC_ENC ? ENC_DE : DEC_DE)
