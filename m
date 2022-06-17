Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C07C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 10:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CDCLGUas5CPFLIiy8De0ZC3hG2YyAFVEmNlM5OHt24s=; b=wbXh1uWgxzx8XY86efmo/lFwb2
	2fCT9g7NDdI4dAg9e/spPj2GmLY8Y15R3NmZ/WWiSfqRFX4wJg5BIdtUFOAbF3RFXBIZdWEYpWrLi
	c0E2AzaLguB5EVK2oejQBd0qDga4xq0ukJ4n20mv0q1zOjGDzuI3j/28nt+OtfklbbVevW4kiBcbP
	s30Bbipd9MXEnzzWcklUz9jLyEd1PMnMd+73XQBatqhcfG0F05PYFEnxvfRehd8ic+aXLheSq2g6F
	+gs404wkPLWpLvgopA5gSP/k2KD2cCXyeDqVlYLdiApgE4vYnVrjAQaS8LLWQtsMy4d/U3rUesFep
	E1jgqaPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o28w1-006tXl-VA; Fri, 17 Jun 2022 10:10:37 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o28vj-006tRq-00; Fri, 17 Jun 2022 10:10:20 +0000
X-UUID: 51e329ac31e642eb80c2b728667e0152-20220617
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:d2c9e71c-777d-4cab-8019-5f58459da92d,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:317ee748-4c92-421c-ad91-b806c0f58b2a,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 51e329ac31e642eb80c2b728667e0152-20220617
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1253254767; Fri, 17 Jun 2022 03:10:13 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 17 Jun 2022 03:10:05 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 17 Jun 2022 18:10:04 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 17 Jun 2022 18:10:04 +0800
Message-ID: <1b5c83ce0b2257f931b270c87cf2c6845ec1b004.camel@mediatek.com>
Subject: Re: [PATCH v2 1/2] clk: mediatek: clk-mt8195-vdo0: Set rate on
 vdo0_dp_intf0_dp_intf's parent
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>
CC: "sboyd@kernel.org" <sboyd@kernel.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "wenst@chromium.org" <wenst@chromium.org>, "Miles
 Chen =?UTF-8?Q?=28=E9=99=B3=E6=B0=91=E6=A8=BA=29?="
	<Miles.Chen@mediatek.com>, "chun-jie.chen@mediatek.com"
	<chun-jie.chen@mediatek.com>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Date: Fri, 17 Jun 2022 18:10:03 +0800
In-Reply-To: <20220617093424.75589-2-angelogioacchino.delregno@collabora.com>
References: <20220617093424.75589-1-angelogioacchino.delregno@collabora.com>
	 <20220617093424.75589-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_031019_086732_C47F7EF9 
X-CRM114-Status: GOOD (  10.36  )
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

On Fri, 2022-06-17 at 17:34 +0800, AngeloGioacchino Del Regno wrote:
> Add the CLK_SET_RATE_PARENT flag to the CLK_VDO0_DP_INTF0_DP_INTF
> clock: this is required to trigger clock source selection on
> CLK_TOP_EDP, while avoiding to manage the enablement of the former
> separately from the latter in the displayport driver.
> 
> Signed-off-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> Fixes: 70282c90d4a2 ("clk: mediatek: Add MT8195 vdosys0 clock
> support")
> ---


Hello Angelo,

Thanks for this series.
I can use this series to do modetest using MT8195 Tomato Chromebook for
both dp and edp in kernel v5.19-rc1.

Therefore,
Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
and,
Reviewed-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>

BRs,
Bo-Chen


