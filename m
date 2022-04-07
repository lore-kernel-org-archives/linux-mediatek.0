Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D238C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Apr 2022 05:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/MMnyUtTh8ssIWnZ0k8EuwhW0teQxVwXgK/+jRLQK4c=; b=hSsZH34Bl20xoA
	lcvKOiQ++7TR/jzeq5pGbLSYUMZbfeK3kB8ZT+lhLhC5y7qkJ/Tbg5l4E+mC+Uy5z0H1TnE8i4FF3
	ViN2zFOfDpC2RGgdGiPWC0rkMzCoXmBZfycruLb8h8H2/3fC/HftLCQQEANQY8wznfP3J6KNwb35v
	l5vC65jqpNgVybT3cs0RTxdbl9T5Aub7Vsz/wnDxjmDfE2YcRPIUnZsQGGQUa0ZqaG9+MuMyF72Vg
	Gj8DosCoahXzwO6wXzWQGXYePV/igIc6YKRPKbQvHcGypj2zzrWyuno7PML3j6o9aZ691o+7AjKA/
	jAvE5YtNeQ85incbftvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncLAJ-009bmd-Q1; Thu, 07 Apr 2022 05:58:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncLAH-009bm8-3J; Thu, 07 Apr 2022 05:58:42 +0000
X-UUID: a31305a8090b4b118f33f4d5ec928e98-20220406
X-UUID: a31305a8090b4b118f33f4d5ec928e98-20220406
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 58466090; Wed, 06 Apr 2022 22:58:34 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 Apr 2022 22:58:32 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 7 Apr 2022 13:58:30 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 7 Apr 2022 13:58:30 +0800
Message-ID: <f04154f2908d3420bc48ed35273a1d4866bd40af.camel@mediatek.com>
Subject: Re: [RESEND v17 3/7] soc: mediatek: add mtk-mmsys support for
 mt8195 vdosys0
From: CK Hu <ck.hu@mediatek.com>
To: jason-jh.lin <jason-jh.lin@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Chun-Kuang
 Hu" <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
CC: David Airlie <airlied@linux.ie>, <singo.chang@mediatek.com>, "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>, <postmaster@vger.kernel.org>, "Fabien
 Parent" <fparent@baylibre.com>, John 'Warthog9' Hawley
 <warthog9@eaglescrag.net>, <linux-stm32@st-md-mailman.stormreply.com>,
 <roy-cw.yeh@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, <devicetree@vger.kernel.org>, Daniel Vetter
 <daniel@ffwll.ch>, <nancy.lin@mediatek.com>,
 <linux-mediatek@lists.infradead.org>, <hsinyi@chromium.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <moudy.ho@mediatek.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Thu, 7 Apr 2022 13:58:30 +0800
In-Reply-To: <20220407030409.9664-4-jason-jh.lin@mediatek.com>
References: <20220407030409.9664-1-jason-jh.lin@mediatek.com>
 <20220407030409.9664-4-jason-jh.lin@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_225841_192335_9DD34E39 
X-CRM114-Status: GOOD (  18.27  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Jason:

On Thu, 2022-04-07 at 11:04 +0800, jason-jh.lin wrote:
> 1. Add mt8195 mmsys compatible for vdosys0.
> 2. Add mt8195 routing table settings and fix build fail.
> 3. Add clock name, clock driver name and routing table into the
> driver data
>    of mt8195 vdosys0.
> 4. Add get match data by clock name function and clock platform
> labels
>    to identify which mmsys node is corresponding to vdosys0.
> 
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> 

[snip]

>  
> +static const struct mtk_mmsys_driver_data mt8195_vdosys0_driver_data
> = {
> +	.clk_name = "cfg_vdo0",
> +	.clk_driver = "clk-mt8195-vdo0",
> +	.routes = mmsys_mt8195_routing_table,
> +	.num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
> +};
> +
> 

[snip]

>  
> +static int mtk_mmsys_get_match_data_by_clk_name(const struct
> mtk_mmsys_driver_data **data,
> +						struct device *dev)
> +{
> +	int i;
> +	struct clk *clk;
> +	const char *clk_name;
> +	const struct of_device_id *of_id =
> of_match_node(mtk_clk_platform_labels,
> +							 dev->of_node);
> +	const struct mtk_mmsys_driver_data *drvdata[] = {
> +		&mt8195_vdosys0_driver_data,
> +	};
> +
> +	if (!of_id || !of_id->data) {
> +		dev_err(dev, "Can't find match clk platform labels\n");
> +		return -EINVAL;
> +	}
> +
> +	clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(clk)) {
> +		dev_err(dev, "failed to get mmsys clk\n");
> +		return PTR_ERR(clk);
> +	}
> +
> +	clk_name = __clk_get_name(clk);
> +	if (!clk_name) {
> +		dev_err(dev, "invalid mmsys clk name\n");
> +		return -EINVAL;
> +	}
> +
> +	for (i = 0; i < ARRAY_SIZE(drvdata); i++)
> +		if (strncmp(drvdata[i]->clk_name, clk_name,
> strlen(clk_name)) == 0 &&

Why not

strcmp(drvdata[i]->clk_name, clk_name) == 0

Regards,
CK

> +		    strncmp(drvdata[i]->clk_driver, of_id->data,
> strlen(of_id->data)) == 0) {
> +			*data = drvdata[i];
> +			return 0;
> +		}
> +
> +	return -EINVAL;
> +}
> +
>  


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
