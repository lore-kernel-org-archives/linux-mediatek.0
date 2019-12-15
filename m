Return-Path: <SRS0=PXBb=2F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12214C43603
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Dec 2019 10:48:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC0AE206CB
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Dec 2019 10:48:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ewQbcw1c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC0AE206CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HjaZK46HDWPP+KIyc0brRJUL5Ael/H9XYbsGd92A3lE=; b=ewQbcw1c7WzHlh
	c6rHNvfB27JoUxip9rYzd9teK4S/HIYLinCYkRmLl6VlMcfuobeTKldctdMQlsK/2bBW1Xk9iHEQR
	ccKRZaRBvPqaLUyQsDvB9WaZzbwr6NNnvipsBaO2Zdx7S2rBbx1D3qyBMedmguUWlLA5fpl99qkZe
	70Trr4j2uKk94p3CcCPBowUpnKXfN4UZxNkYl0+tJHV4Dae0ljwEgHr9aj670H1Unyv+aXzAeJBX/
	KGHA2LF4R5h3y34y2ZPS7+ePEZNlhF5eOcw13uLyterzdmZyZoeySQTFXF6MR4nfVCUs+wUOja9eW
	HVzbyszb+vQ/p7QziE5g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1igRS6-00027t-9L; Sun, 15 Dec 2019 10:48:42 +0000
Received: from inca-roads.misterjones.org ([213.251.177.50])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1igRS2-00026x-IL; Sun, 15 Dec 2019 10:48:40 +0000
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=why)
 by cheepnis.misterjones.org with esmtpsa (TLSv1.2:AES256-GCM-SHA384:256)
 (Exim 4.80) (envelope-from <maz@kernel.org>)
 id 1igRRq-0007sB-2S; Sun, 15 Dec 2019 11:48:26 +0100
Date: Sun, 15 Dec 2019 10:48:24 +0000
From: Marc Zyngier <maz@kernel.org>
To: Yangtao Li <tiny.windzz@gmail.com>
Subject: Re: [PATCH 10/10] soc: qcom: convert to devm_platform_ioremap_resource
Message-ID: <20191215104824.658889d3@why>
In-Reply-To: <20191214175447.25482-10-tiny.windzz@gmail.com>
References: <20191214175447.25482-1-tiny.windzz@gmail.com>
 <20191214175447.25482-10-tiny.windzz@gmail.com>
Organization: Approximate
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: tiny.windzz@gmail.com, khilman@baylibre.com,
 leoyang.li@nxp.com, khalasa@piap.pl, john@phrozen.org, matthias.bgg@gmail.com,
 agross@kernel.org, bjorn.andersson@linaro.org, kgene@kernel.org,
 krzk@kernel.org, mripard@kernel.org, wens@csie.org, ssantosh@kernel.org,
 jun.nie@linaro.org, shawnguo@kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on cheepnis.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191215_024838_751053_AD68F9C5 
X-CRM114-Status: GOOD (  11.71  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: john@phrozen.org, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, khilman@baylibre.com, krzk@kernel.org,
 wens@csie.org, agross@kernel.org, linux-arm-msm@vger.kernel.org,
 mripard@kernel.org, khalasa@piap.pl, ssantosh@kernel.org,
 matthias.bgg@gmail.com, linux-amlogic@lists.infradead.org,
 bjorn.andersson@linaro.org, linux-arm-kernel@lists.infradead.org,
 shawnguo@kernel.org, linux-mips@vger.kernel.org, leoyang.li@nxp.com,
 kgene@kernel.org, linux-mediatek@lists.infradead.org, jun.nie@linaro.org,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, 14 Dec 2019 17:54:47 +0000
Yangtao Li <tiny.windzz@gmail.com> wrote:

> Use devm_platform_ioremap_resource() to simplify code.
> 
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---
>  drivers/soc/qcom/llcc-qcom.c    | 7 +------
>  drivers/soc/qcom/qcom-geni-se.c | 4 +---
>  drivers/soc/qcom/qcom_aoss.c    | 4 +---
>  drivers/soc/qcom/qcom_gsbi.c    | 5 +----
>  drivers/soc/qcom/spm.c          | 4 +---
>  5 files changed, 5 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
> index 429b5a60a1ba..99e19df76889 100644
> --- a/drivers/soc/qcom/llcc-qcom.c
> +++ b/drivers/soc/qcom/llcc-qcom.c
> @@ -387,7 +387,6 @@ static int qcom_llcc_remove(struct platform_device *pdev)
>  static struct regmap *qcom_llcc_init_mmio(struct platform_device *pdev,
>  		const char *name)
>  {
> -	struct resource *res;
>  	void __iomem *base;
>  	struct regmap_config llcc_regmap_config = {
>  		.reg_bits = 32,
> @@ -396,11 +395,7 @@ static struct regmap *qcom_llcc_init_mmio(struct platform_device *pdev,
>  		.fast_io = true,
>  	};
>  
> -	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
> -	if (!res)
> -		return ERR_PTR(-ENODEV);
> -
> -	base = devm_ioremap_resource(&pdev->dev, res);
> +	base = devm_platform_ioremap_resource(pdev, 0);

What guarantees do you have that entry 0 matches name?

I find these changes pointless: they don't add much to the readability
or maintainability of the code, and instead introduce creative bugs.

	M.
-- 
Jazz is not dead. It just smells funny...

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
