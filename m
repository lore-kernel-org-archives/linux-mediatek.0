Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F3CC54EE9
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Sep 2022 08:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LjdTy1xd5BYoKHJkgGQjVcamnY1XU8R1SpCmvWnZVUs=; b=xu7PyltftAIiyEyuhZy79u9F7e
	aiBEIegmfVFp37sbNFjkdDnz5B3RACGwbpQ5nS2bNEzV7+ZPvt9J8flBu9y/RUKocevEGnBvKNCLx
	79uOobb5cm0HryyB0PVEPAziqcX/YGRJOm9OoP+q5uOr1BjkbTM634zRM0AV3EI8nJC1NuNb8qqcW
	+na6pqjM528mymNoK8Ohx5+kUBn7U+lTj94Iyp87N5QVN5AylNtc8UyCqXWz9VblrcV2inaYZnh8j
	cB1Nu90d489DLqV7ANXtKi/Kk0uvTUZ55aoao1ygRVhUTuB9RLXp74kJA1kEC2p6umWowdj2n4Zjh
	aSV44peQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU2Vg-002CmY-Vr; Fri, 02 Sep 2022 08:58:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU2Ve-002Cfq-Fu; Fri, 02 Sep 2022 08:58:43 +0000
X-UUID: b21d17f545114927908960be10634177-20220902
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=LjdTy1xd5BYoKHJkgGQjVcamnY1XU8R1SpCmvWnZVUs=;
	b=AQYfPnEB1lf1xCywnf/7nQX5ptfQ8yrDYBoQKx81Q3s5mCiHpvqOApsZXr2E1ZU8YRUU4kxXXe2PmUWi0DV4bgtVB/v/2Knnh20nyTn7SmBSjdhOGNzgoeDwVU1s5dkB8jygWgdU+eUKSHr/5qq8kWdnnRy5O3R/jpvX52jv9f8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:b7bfa9ad-9f20-4a0e-be3f-deeab5d0e01e,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:d25a6756-e800-47dc-8adf-0c936acf4f1b,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: b21d17f545114927908960be10634177-20220902
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1354851970; Fri, 02 Sep 2022 01:58:35 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 2 Sep 2022 16:57:58 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 2 Sep 2022 16:57:58 +0800
Message-ID: <e5e925911c428cab87bbe12cda1dd657e1bb5075.camel@mediatek.com>
Subject: Re: [PATCH v17 10/10] drm/mediatek: dp: Audio support for MT8195
From: CK Hu <ck.hu@mediatek.com>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
	<p.zabel@pengutronix.de>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <mripard@kernel.org>,
	<tzimmermann@suse.de>, <matthias.bgg@gmail.com>, <deller@gmx.de>,
	<airlied@linux.ie>
CC: <msp@baylibre.com>, <granquet@baylibre.com>, <jitao.shi@mediatek.com>,
	<wenst@chromium.org>, <angelogioacchino.delregno@collabora.com>,
	<liangxu.xu@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-fbdev@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 2 Sep 2022 16:57:58 +0800
In-Reply-To: <20220901044149.16782-11-rex-bc.chen@mediatek.com>
References: <20220901044149.16782-1-rex-bc.chen@mediatek.com>
	 <20220901044149.16782-11-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_015842_540115_003A30D6 
X-CRM114-Status: GOOD (  12.31  )
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

Hi, Bo-Chen:

On Thu, 2022-09-01 at 12:41 +0800, Bo-Chen Chen wrote:
> From: Guillaume Ranquet <granquet@baylibre.com>
> 
> This patch adds audio support to the DP driver for MT8195 with up to
> 8
> channels.
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dp.c     | 482
> +++++++++++++++++++++++++-
>  drivers/gpu/drm/mediatek/mtk_dp_reg.h |  51 +++
>  2 files changed, 532 insertions(+), 1 deletion(-)
> 
> 

[snip]

> +#define MTK_DP_ENC0_P0_308C			0x308c
> +#define CH_STATUS_0_DP_ENC0_P0_MASK			GENMASK(15, 0)
> +#define MTK_DP_ENC0_P0_3090			0x3090
> +#define CH_STATUS_1_DP_ENC0_P0_MASK			GENMASK(15, 0)
> +#define MTK_DP_ENC0_P0_3094			0x3094
> +#define CH_STATUS_2_DP_ENC0_P0_MASK			GENMASK(7, 0)
> +#define MTK_DP_ENC0_P0_30A0			0x30a0

Useless, so drop it.

Regards,
CK

> +#define DP_ENC0_30A0_MASK				(BIT(7) |
> BIT(8) | BIT(12))
> +#define MTK_DP_ENC0_P0_30A4			0x30a4
> +#define AU_TS_CFG_DP_ENC0_P0_MASK			GENMASK(7, 0)
> +#define MTK_DP_ENC0_P0_30A8			0x30a8
> 


