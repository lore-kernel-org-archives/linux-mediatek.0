Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 693DAC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Dec 2021 15:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ba6uYijtFly1QsKMgY2SQedaRAeTPuZ0LojpPytmMg=; b=LxjXqSb+6IksMQNn5I445H3btW
	tsiyjFrcdwfsS8xx9E1uIoCmP3p4iG+Gkank6IGwfhnSDNTvBeMGtc1lrDCfhih5Q27qMLV6SdaLe
	urMwzt3yGN5phbxNHanLNRyQTE45CRN/ZySvbL0hSDML4+GLoANRebXhLdP7na5sKs9uUAiUmNH5W
	ITfxJJLNMgLJqWbNMHXHnmwV0QiCkA7X+ZxO5cXT3X8mfUaFkU3mfB/2tDNXsn0tLUALx1XLI2fTn
	CxdVSw1jqw38i3L7go1PAuvPxdzKV40Uu/63EHm+jJ0bGSite0GiIAF4jVPvjZVTudf/8oM7paTTB
	RdSIDtdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muFcP-004Op5-3f; Mon, 06 Dec 2021 15:09:29 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muFbk-004ORx-Nb; Mon, 06 Dec 2021 15:08:50 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 3EA2A1F4487E
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1638803327; bh=GD5jS7X5MjRddXaASD9ovBpWNoicoY2OOGjVAS/Fkj0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=QmP9p/Xwn1DTDiTckK3f6PgxBAGeY1jfb3zUdAdtQ4HX70clXe1dHJl4ACRNYJMTw
 ufL5NI0KUbX79T48BORKnDJIcqB/hVvvk2ZE+77/+LmCctOasRbPaOqt92dqro/Tbw
 4Kn0b2XXytIRKaB+UhpCecMReNcm4M6aZ+Q4c7J78IJ0T8tjhCIvz83uy04OIDEK3/
 rMS4dwOVFThMJ8C8YJDqdmdSYqT517aYtIkMEupKIBOIlOdLsIrsSCXjiHVwenRslH
 3jjGKxEg/4qZ4b5rMbUruztYedI9xeS+tHs4u+ETj9ZJDhGLENR4ZsLJY1iBFUeHCk
 vSH3nnqDpp8BQ==
Subject: Re: [PATCH 3/4] memory: mtk-smi: Add sleep ctrl function
To: Yong Wu <yong.wu@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org, youlin.pei@mediatek.com,
 anan.sun@mediatek.com, lc.kan@mediatek.com, yi.kuo@mediatek.com,
 anthony.huang@mediatek.com
References: <20211203064027.14993-1-yong.wu@mediatek.com>
 <20211203064027.14993-4-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <f2ffd08a-44c3-9458-1bd8-68e3c0755611@collabora.com>
Date: Mon, 6 Dec 2021 16:08:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211203064027.14993-4-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_070849_091979_B58AA701 
X-CRM114-Status: GOOD (  33.64  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 03/12/21 07:40, Yong Wu ha scritto:
> sleep control means that when the larb go to sleep, we should wait a bit
> until all the current commands are finished. thus, when the larb runtime
> suspend, we need enable this function to wait until all the existed
> command are finished. when the larb resume, just disable this function.
> This function only improve the safe of bus. Add a new flag for this
> function. Prepare for mt8186.
> 
> Signed-off-by: Anan Sun <anan.sun@mediatek.com>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>   drivers/memory/mtk-smi.c | 39 +++++++++++++++++++++++++++++++++++----
>   1 file changed, 35 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
> index b883dcc0bbfa..4b59b28e4d73 100644
> --- a/drivers/memory/mtk-smi.c
> +++ b/drivers/memory/mtk-smi.c
> @@ -8,6 +8,7 @@
>   #include <linux/device.h>
>   #include <linux/err.h>
>   #include <linux/io.h>
> +#include <linux/iopoll.h>
>   #include <linux/module.h>
>   #include <linux/of.h>
>   #include <linux/of_platform.h>
> @@ -32,6 +33,10 @@
>   #define SMI_DUMMY			0x444
>   
>   /* SMI LARB */
> +#define SMI_LARB_SLP_CON                0x00c
> +#define SLP_PROT_EN                     BIT(0)
> +#define SLP_PROT_RDY                    BIT(16)
> +
>   #define SMI_LARB_CMD_THRT_CON		0x24
>   #define SMI_LARB_THRT_RD_NU_LMT_MSK	GENMASK(7, 4)
>   #define SMI_LARB_THRT_RD_NU_LMT		(5 << 4)
> @@ -81,6 +86,7 @@
>   
>   #define MTK_SMI_FLAG_THRT_UPDATE	BIT(0)
>   #define MTK_SMI_FLAG_SW_FLAG		BIT(1)
> +#define MTK_SMI_FLAG_SLEEP_CTL		BIT(2)
>   #define MTK_SMI_CAPS(flags, _x)		(!!((flags) & (_x)))
>   
>   struct mtk_smi_reg_pair {
> @@ -371,6 +377,24 @@ static const struct of_device_id mtk_smi_larb_of_ids[] = {
>   	{}
>   };
>   
> +static int mtk_smi_larb_sleep_ctrl(struct device *dev, bool to_sleep)
> +{
> +	struct mtk_smi_larb *larb = dev_get_drvdata(dev);
> +	int ret = 0;
> +	u32 tmp;
> +
> +	if (to_sleep) {
> +		writel_relaxed(SLP_PROT_EN, larb->base + SMI_LARB_SLP_CON);
> +		ret = readl_poll_timeout_atomic(larb->base + SMI_LARB_SLP_CON,
> +						tmp, !!(tmp & SLP_PROT_RDY), 10, 1000);
> +		if (ret)
> +			dev_warn(dev, "sleep ctrl is not ready(0x%x).\n", tmp);
> +	} else {
> +		writel_relaxed(0, larb->base + SMI_LARB_SLP_CON);
> +	}
> +	return ret;
> +}
> +
>   static int mtk_smi_device_link_common(struct device *dev, struct device **com_dev)
>   {
>   	struct platform_device *smi_com_pdev;
> @@ -477,24 +501,31 @@ static int __maybe_unused mtk_smi_larb_resume(struct device *dev)
>   {
>   	struct mtk_smi_larb *larb = dev_get_drvdata(dev);
>   	const struct mtk_smi_larb_gen *larb_gen = larb->larb_gen;
> -	int ret;
> +	int ret = 0;
>   
>   	ret = clk_bulk_prepare_enable(larb->smi.clk_num, larb->smi.clks);
> -	if (ret < 0)
> +	if (ret)
>   		return ret;
>   
> +	if (MTK_SMI_CAPS(larb->larb_gen->flags_general, MTK_SMI_FLAG_SLEEP_CTL))
> +		ret = mtk_smi_larb_sleep_ctrl(dev, false);
> +
>   	/* Configure the basic setting for this larb */
>   	larb_gen->config_port(dev);
>   
> -	return 0;
> +	return ret;
>   }
>   
>   static int __maybe_unused mtk_smi_larb_suspend(struct device *dev)
>   {
>   	struct mtk_smi_larb *larb = dev_get_drvdata(dev);
> +	int ret = 0;
> +
> +	if (MTK_SMI_CAPS(larb->larb_gen->flags_general, MTK_SMI_FLAG_SLEEP_CTL))
> +		ret = mtk_smi_larb_sleep_ctrl(dev, true);

Sorry but what happens if SLP_PROT_RDY is not getting set properly?
 From what I can understand in the commit description that you wrote, if we reach
the timeout, then the LARB transactions are not over....

I see that you are indeed returning a failure here, but you are also turning off
the clocks regardless of whether we get a failure or a success; I'm not sure that
this is right, as this may leave the hardware in an unpredictable state (since
there were some more LARB transactions that didn't go through), leading to crashes
at system resume (or when retyring to suspend).

>   
>   	clk_bulk_disable_unprepare(larb->smi.clk_num, larb->smi.clks);
> -	return 0;
> +	return ret;
>   }
>   
>   static const struct dev_pm_ops smi_larb_pm_ops = {
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
