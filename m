From: Jorge Ramirez <jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 2/2] mtd: mediatek: driver for MTK Smart Device Gen1
 NAND
Date: Tue, 10 May 2016 10:50:31 -0400
Message-ID: <5731F537.9040009@linaro.org>
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
>> +	if (config->codec == ECC_ENC) {
>> >+		/* configure ECC encoder (in bits) */
>> >+		enc_sz = config->enc_len << 3;
>> >+
>> >+		reg = ecc_bit | (config->ecc_mode << ECC_MODE_SHIFT);
>> >+		reg |= (enc_sz << ECC_MS_SHIFT);
>> >+		writel(reg, ecc->regs + ECC_ENCCNFG);
>> >+
>> >+		if (config->ecc_mode != ECC_NFI_MODE)
>> >+			writel(lower_32_bits(config->addr),
>> >+				ecc->regs + ECC_ENCDIADDR);
>> >+
>> >+	} else {
>> >+		/* configure ECC decoder (in bits) */
>> >+		dec_sz = config->dec_len;
>> >+
>> >+		reg = ecc_bit | (config->ecc_mode << ECC_MODE_SHIFT);
>> >+		reg |= (dec_sz << ECC_MS_SHIFT) | DEC_CNFG_CORRECT;
>> >+		reg |= DEC_EMPTY_EN;
>> >+		writel(reg, ecc->regs + ECC_DECCNFG);
>> >+
>> >+		if (config->sec_mask)
>> >+			ecc->sec_mask = 1 << (config->sec_mask - 1);
>> >+	}
> I see that some of the logic could be shared between the ENC and DEC
> cases.

I guess you are referring to
reg = ecc_bit | (config->ecc_mode << ECC_MODE_SHIFT);

ok...

> BTW, why do you multiply enc_len by 8 (bits to byte conversion), but
> don't do that for dec_len?
>

just as needed by the hardware:
the config is in bits, the encoder register requires bytes, the decoder 
register requires bits.
