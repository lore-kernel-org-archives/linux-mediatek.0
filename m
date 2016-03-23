From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFCv2: PATCH 2/2] mtd: mediatek: driver for MTK Smart Device
 Gen1 NAND
Date: Tue, 22 Mar 2016 20:29:44 -0400
Message-ID: <56F1E378.3000107@linaro.org>
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
>> +
>> > +static struct sdg1_ecc_if *sdg1_ecc_get(struct device_node *np)
>> > +{
>> > +	struct platform_device *pdev;
>> > +	struct sdg1_ecc *ecc;
>> > +
>> > +	pdev = of_find_device_by_node(np);
>> > +	if (!pdev || !platform_get_drvdata(pdev))
>> > +		return ERR_PTR(-EPROBE_DEFER);
>> > +
>> > +	get_device(&pdev->dev);
>> > +	ecc = platform_get_drvdata(pdev);
>> > +
>> > +	clk_prepare_enable(ecc->clk);
>> > +	ecc->dev = &pdev->dev;
> ecc->dev should be assigned in ->probe().
>

fyi this was just copied verbatim from

static struct jz4780_bch *jz4780_bch_get(struct device_node *np)
{
    struct platform_device *pdev;
    struct jz4780_bch *bch;

    pdev = of_find_device_by_node(np);
    if (!pdev || !platform_get_drvdata(pdev))
        return ERR_PTR(-EPROBE_DEFER);

    get_device(&pdev->dev);

    bch = platform_get_drvdata(pdev);
    clk_prepare_enable(bch->clk);

    bch->dev = &pdev->dev;
    return bch;
}
