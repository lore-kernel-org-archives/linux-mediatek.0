Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0540AC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Oct 2022 12:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6wRO0Ski3oiIKQo95bwnitVyc5U6gggiNVVs48nENCY=; b=p2EXNbOxKOx5/57h7le+tFRo09
	2yx1qQFzPmeejWRIFL9keXONIj8A5qh/1sDidugCOqmiwijdHj7HGVI65nxEXQdwK4YFDwcW0C4k4
	cPMQxKGoVQgcPDuwOmu1ie5qLY0s5NqH9RXOQUwtyotflpTBg9JGe0lqBtuW8QzzViV6IJSP/N3kC
	MXipMIwCt/V9kJjhroefElAMhWYJaoPn0UT6c+95P9u4WS+ImYnJU49NJi6lCMms/5HEMw5M+keJs
	5Y9BHOotuZZlquiOPgSa6XZxWYVxGtQsZR8cApl9FORZjFrDXnWUB5+k/q1Sf+BEfeNTtbMpp2L7F
	FsAcK9Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogQEL-002Ojr-Kg; Thu, 06 Oct 2022 12:44:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogQE9-002Ogq-Lp; Thu, 06 Oct 2022 12:43:51 +0000
X-UUID: 2702bb6605574642a4fbe6b7014dc865-20221006
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=6wRO0Ski3oiIKQo95bwnitVyc5U6gggiNVVs48nENCY=;
	b=EjtVCQVYf2doyl76KIN9MJg6E0Pax5ORPmseaUWcHAvgzsVZ4vRqAaTnKWq3MDjAOtLz9i0OLkFP66CrlhiYLbaGJRfVNc0QkpIwqkE73H3Jskmn1nCmWjVo4wzn0yRgPmIqcRpmJFgxpdHeP0flNf5US/TMD4TxcLeWPgAttVo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:9eb9bd17-ce9e-4db7-86fd-8f15db77c3f8,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:9665bab8-daef-48a8-8c50-40026d6a74c2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 2702bb6605574642a4fbe6b7014dc865-20221006
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <roger.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1276565488; Thu, 06 Oct 2022 05:43:46 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 6 Oct 2022 19:43:10 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 6 Oct 2022 19:43:10 +0800
Message-ID: <3540598ae0383394e0ebdc684a048fdfb94d2810.camel@mediatek.com>
Subject: Re: [PATCH 4/8] soc: mediatek: mtk-svs: delete superfluous platform
 data entries
From: Roger Lu <roger.lu@mediatek.com>
To: <matthias.bgg@kernel.org>, <jia-wei.chang@mediatek.com>
CC: <nfraprado@collabora.com>, <khilman@baylibre.com>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<angelogioacchino.delregno@collabora.com>, Matthias Brugger
	<matthias.bgg@gmail.com>
Date: Thu, 6 Oct 2022 19:43:10 +0800
In-Reply-To: <20220928155519.31977-5-matthias.bgg@kernel.org>
References: <20220928155519.31977-1-matthias.bgg@kernel.org>
	 <20220928155519.31977-5-matthias.bgg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_054349_753381_75D362A1 
X-CRM114-Status: GOOD (  22.35  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Matthias Sir,

On Wed, 2022-09-28 at 17:55 +0200, matthias.bgg@kernel.org wrote:
> From: Matthias Brugger <matthias.bgg@gmail.com>
> 
> The platform name and efuse parsing function pointer are only used while
> probing the device. Use them from the svs_platform_data struct instead.
> 
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---
> 
>  drivers/soc/mediatek/mtk-svs.c | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
> index 8342627f8dea..482cc8d7e7cf 100644
> --- a/drivers/soc/mediatek/mtk-svs.c
> +++ b/drivers/soc/mediatek/mtk-svs.c
> @@ -311,14 +311,12 @@ static const u32 svs_regs_v2[] = {
>  
>  /**
>   * struct svs_platform - svs platform control
> - * @name: svs platform name
>   * @base: svs platform register base
>   * @dev: svs platform device
>   * @main_clk: main clock for svs bank
>   * @pbank: svs bank pointer needing to be protected by spin_lock section
>   * @banks: svs banks that svs platform supports
>   * @rst: svs platform reset control
> - * @efuse_parsing: svs platform efuse parsing function pointer
>   * @efuse_max: total number of svs efuse
>   * @tefuse_max: total number of thermal efuse
>   * @regs: svs platform registers map
> @@ -327,14 +325,12 @@ static const u32 svs_regs_v2[] = {
>   * @tefuse: thermal efuse data received from NVMEM framework
>   */
>  struct svs_platform {
> -	char *name;
>  	void __iomem *base;
>  	struct device *dev;
>  	struct clk *main_clk;
>  	struct svs_bank *pbank;
>  	struct svs_bank *banks;
>  	struct reset_control *rst;
> -	bool (*efuse_parsing)(struct svs_platform *svsp);
>  	size_t efuse_max;
>  	size_t tefuse_max;
>  	const u32 *regs;
> @@ -2009,7 +2005,7 @@ static bool svs_is_efuse_data_correct(struct
> svs_platform *svsp)
>  	svsp->efuse_max /= sizeof(u32);
>  	nvmem_cell_put(cell);
>  
> -	return svsp->efuse_parsing(svsp);
> +	return true;
>  }

Based on the current coding design, I think this function can be removed. We can
rename/refactor `svs_thermal_efuse_get_data()` to `svs_get_efuse_data()` as
below. Is this acceptable? Thanks.

int svs_get_efuse_data(struct svs_platform *svsp, const char *nvmem_cell_name)
{
        struct nvmem_cell *cell;

        /* Thermal efuse parsing */
        cell = nvmem_cell_get(svsp->dev, nvmem_cell_name);
        if (IS_ERR_OR_NULL(cell)) {
                dev_err(svsp->dev, "no \"%s\"? %ld\n", nvmem_cell_name,
PTR_ERR(cell));
                return PTR_ERR(cell);
        }

        svsp->tefuse = nvmem_cell_read(cell, &svsp->tefuse_max);
        if (IS_ERR(svsp->tefuse)) {
                dev_err(svsp->dev, "cannot read thermal efuse: %ld\n",
                        PTR_ERR(svsp->tefuse));
                nvmem_cell_put(cell);
                return PTR_ERR(svsp->tefuse);
        }

        svsp->tefuse_max /= sizeof(u32);
        nvmem_cell_put(cell);

        return 0;
}

>  
>  static struct device *svs_get_subsys_device(struct svs_platform *svsp,
> @@ -2338,9 +2334,7 @@ static int svs_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	svsp->dev = &pdev->dev;
> -	svsp->name = svsp_data->name;
>  	svsp->banks = svsp_data->banks;
> -	svsp->efuse_parsing = svsp_data->efuse_parsing;
>  	svsp->regs = svsp_data->regs;
>  	svsp->bank_max = svsp_data->bank_max;
>  
> @@ -2351,6 +2345,12 @@ static int svs_probe(struct platform_device *pdev)
>  	if (!svs_is_efuse_data_correct(svsp)) {
>  		dev_notice(svsp->dev, "efuse data isn't correct\n");
>  		ret = -EPERM;
> +		goto svs_probe_free_efuse;
> +	}
> +

Remove `svs_is_efuse_data_correct()` and add below get-efuse-data function.

	ret = svs_get_efuse_data(svsp, "svs-calibration-data");
	if (ret)
		goto svs_probe_free_efuse;

> +	if (!svsp_data->efuse_parsing(svsp)) {
> +		dev_notice(svsp->dev, "efuse data parsing failed\n");
> +		ret = -EPERM;
>  		goto svs_probe_free_resource;
>  	}
>  
> @@ -2367,7 +2367,7 @@ static int svs_probe(struct platform_device *pdev)
>  	}
>  
>  	ret = devm_request_threaded_irq(svsp->dev, svsp_irq, NULL, svs_isr,
> -					IRQF_ONESHOT, svsp->name, svsp);
> +					IRQF_ONESHOT, svsp_data->name, svsp);
>  	if (ret) {
>  		dev_err(svsp->dev, "register irq(%d) failed: %d\n",
>  			svsp_irq, ret);
> @@ -2416,11 +2416,13 @@ static int svs_probe(struct platform_device *pdev)
>  	clk_disable_unprepare(svsp->main_clk);
>  
>  svs_probe_free_resource:

For current coding design, I suggest we rename the goto-label to
`svs_probe_free_tefuse` to identify the resource we free.

> -	if (!IS_ERR_OR_NULL(svsp->efuse))
> -		kfree(svsp->efuse);
>  	if (!IS_ERR_OR_NULL(svsp->tefuse))
>  		kfree(svsp->tefuse);
>  
> +svs_probe_free_efuse:
> +	if (!IS_ERR_OR_NULL(svsp->efuse))
> +		kfree(svsp->efuse);
> +
>  	return ret;
>  }
>  

Sincerely,
Roger Lu.


