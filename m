Return-Path: <SRS0=Yz5u=2N=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7ECAC2D0C0
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Dec 2019 07:26:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6A54206D3
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Dec 2019 07:26:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NTi/68jL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="hPz3RnaV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6A54206D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YPwZQL4wWkuvnsg4krzsZeqdzAC+Z60THd6iytbDFtE=; b=NTi/68jLAwvzOT9EJvJuB4dj8
	eQD9D2poFKhYfq3bb4U1JhDW85d/rvsX0PxTHJQBYc34DSZn6WQkVo8eugCMO+dQqwCOne/s1nQwk
	vbj8riHZe79QgFJQ7XQBor4hP8uAFTcusBdKYSfOPb51+FY+c9O0cDYJOHAtnLeKGCixM5p1eTO8y
	dYmc04TOSGwNjcUZiwd81Sw/Vki41GBW9nRAnAfdHvY/nR4/y26dEw0Nqre8KtkAW/jE3mjnaBl4s
	j+8z1nNOZJ0Q7JLFUmruwPjt/q5vzu4Ea3h730aVPTYn1+YE4G5Ejqzb+o0Q1lA0htLJhz6jb06Yq
	eSYm46luA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ijI6O-0005m0-46; Mon, 23 Dec 2019 07:26:04 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ijI6L-0005ku-7c; Mon, 23 Dec 2019 07:26:02 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBN7PSNE092418;
 Mon, 23 Dec 2019 01:25:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1577085928;
 bh=TZCdQwanBajUmjnrjOmrqqKE92Iuel2n9DhlReItHps=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=hPz3RnaVl31ARYBIL0RBmD5SzKuqviJ1KkCDboXFBZxeOJ9IcZzvmsXZHdkQFxI6B
 Oz2OLdqF2IrpsXzqxe/wyQ6tZKGMEnhZuTUXG072+jQU9lzBfvdxi3+C27Z7O3J3z1
 A7WMeFB+ewaknC0/CBCcFJqM/AZiK2GJJxucI/+g=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBN7PSuh040126
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 23 Dec 2019 01:25:28 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 23
 Dec 2019 01:25:27 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 23 Dec 2019 01:25:27 -0600
Received: from [192.168.2.14] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBN7PL0n037979;
 Mon, 23 Dec 2019 01:25:21 -0600
Subject: Re: [PATCH 9/9] memory: omap-gpmc: switch to platform_get_irq
To: Yangtao Li <tiny.windzz@gmail.com>, <ssantosh@kernel.org>,
 <paul@crapouillou.net>, <matthias.bgg@gmail.com>, <tony@atomide.com>,
 <lukasz.luba@arm.com>, <kgene@kernel.org>, <krzk@kernel.org>,
 <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
 <allison@lohutok.net>, <tglx@linutronix.de>, <yong.wu@mediatek.com>,
 <jroedel@suse.de>, <evgreen@chromium.org>, <rfontana@redhat.com>,
 <digetx@gmail.com>, <pdeschrijver@nvidia.com>, <john@phrozen.org>,
 <alexios.zavras@intel.com>, <sboyd@kernel.org>,
 <kstewart@linuxfoundation.org>, <info@metux.net>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-omap@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-tegra@vger.kernel.org>
References: <20191222185034.4665-1-tiny.windzz@gmail.com>
 <20191222185034.4665-9-tiny.windzz@gmail.com>
From: Roger Quadros <rogerq@ti.com>
Message-ID: <7dc78b4c-d1a7-a990-669c-8d3ddbacee0d@ti.com>
Date: Mon, 23 Dec 2019 09:25:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191222185034.4665-9-tiny.windzz@gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191222_232601_354905_AF0F72D1 
X-CRM114-Status: GOOD (  16.31  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On 22/12/2019 20:50, Yangtao Li wrote:
> platform_get_resource(pdev, IORESOURCE_IRQ) is not recommended for
> requesting IRQ's resources, as they can be not ready yet. Using
> platform_get_irq() instead is preferred for getting IRQ even if it
> was not retrieved earlier.
> 
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>

Acked-by: Roger Quadros <rogerq@ti.com>

> ---
>   drivers/memory/omap-gpmc.c | 10 +++-------
>   1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
> index eff26c1b1394..6dd19d168f75 100644
> --- a/drivers/memory/omap-gpmc.c
> +++ b/drivers/memory/omap-gpmc.c
> @@ -2366,13 +2366,9 @@ static int gpmc_probe(struct platform_device *pdev)
>   	if (IS_ERR(gpmc_base))
>   		return PTR_ERR(gpmc_base);
>   
> -	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
> -	if (!res) {
> -		dev_err(&pdev->dev, "Failed to get resource: irq\n");
> -		return -ENOENT;
> -	}
> -
> -	gpmc->irq = res->start;
> +	gpmc->irq = platform_get_irq(pdev, 0);
> +	if (gpmc->irq < 0)
> +		return gpmc->irq;
>   
>   	gpmc_l3_clk = devm_clk_get(&pdev->dev, "fck");
>   	if (IS_ERR(gpmc_l3_clk)) {
> 

-- 
cheers,
-roger

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
