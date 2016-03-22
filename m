From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFCv2: PATCH 2/2] mtd: mediatek: driver for MTK Smart Device
 Gen1 NAND
Date: Tue, 22 Mar 2016 19:43:13 -0400
Message-ID: <56F1D891.8010603@linaro.org>
References: <1458653560-2679-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1458653560-2679-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <20160322175850.2722c389@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20160322175850.2722c389@bbrezillon>
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
Cc: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On 03/22/2016 12:58 PM, Boris Brezillon wrote:
>> +typedef void (*release)(struct sdg1_ecc_if *);
>> > +typedef int (*decode)(struct sdg1_ecc_if *);
>> > +typedef void (*init) (struct sdg1_ecc_if *);
>> > +
>> > +struct sdg1_ecc_if {
>> > +	release	release;
>> > +	control control;
>> > +	config config;
>> > +	encode encode;
>> > +	decode decode;
>> > +	check check;
>> > +	init init;
>> > +};
>> > +
>> > +struct sdg1_ecc_if *of_sdg1_ecc_get(struct device_node *);
> I think you should directly return a pointer to the sdg1_ecc instance
> here.
> AFAICS, the "interface" appraoch is useless, all you need is a set of
> exported functions, which all takes the sdg1_ecc pointer as a first
> argument and a set of extra arguments depending on the function.
> See what's done in the jz4780_bch.c driver.
>

yes I am of the contrary opinion (why export a number of functions when you can
just export an interface and keep a clear encapsulation).
as a matter of fact the interface exposes the dependency with the engine while a
random number of function calls does not (with the interface approach eventually
we might be able to have a common ecc interface some day, maybe)

anyway, working on v3 now. thanks for the detailed review as always (and sorry
for the clear fuck ups like the size 0 array in the wrong place...argh!)
