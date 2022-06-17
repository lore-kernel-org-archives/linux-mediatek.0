Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB50C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 10:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yvPqZfjXU+LK5+5bGrX4dNa0lyaeq0gKOLiN1Tw5ueA=; b=B2lspM3RmhkuUT2kMXYJH+ov7Y
	3gwLpa6shsXobsW6KpXI2u2E2j4Sgu6isErAseB1tAzE/3IEmioZxxkoqEQF/04ErlOQbO7oeC/KR
	lzk5vOerZLIhaJjQYXL7dylOJk2+gwx5XZ+MUG+znmb9d7UXDhjTOjaLOjzq99NXSv1yUiKUEGF6C
	R6BDpjZOSVy59WSepoYFFuIqXW8C99SI9ynkeV+fvYwDcq8fabyLytDrC2Bdd/KWlyk68SOax2Qdf
	1DvFDYjC1zTIg5XZ8qLeAFUUAUxrFCdRhvvOsaJjUgAjoGXVcdGPKnyvEJaTeSR5vX/0/fXFC6pGh
	1psz4gBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2922-006uuR-Fk; Fri, 17 Jun 2022 10:16:50 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o291r-006uss-Cr; Fri, 17 Jun 2022 10:16:40 +0000
X-UUID: 4eab0bdcea484639b8b490b92d81a0cd-20220617
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:2323994a-d7a6-47db-9ca2-8ea51ac770b4,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:d959a4f6-e099-41ba-a32c-13b8bfe63214,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 4eab0bdcea484639b8b490b92d81a0cd-20220617
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 763930343; Fri, 17 Jun 2022 03:16:33 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 17 Jun 2022 03:10:44 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Fri, 17 Jun 2022 18:10:43 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 17 Jun 2022 18:10:43 +0800
Message-ID: <a3c480a3aa87b87c707b92bc80040764d2434a03.camel@mediatek.com>
Subject: Re: [PATCH v2 2/2] clk: mediatek: clk-mt8195-vdo1: Reparent and set
 rate on vdo1_dpintf's parent
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
Date: Fri, 17 Jun 2022 18:10:42 +0800
In-Reply-To: <20220617093424.75589-3-angelogioacchino.delregno@collabora.com>
References: <20220617093424.75589-1-angelogioacchino.delregno@collabora.com>
	 <20220617093424.75589-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_031639_488220_59F6658D 
X-CRM114-Status: GOOD (  11.76  )
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
> Like it was done for the vdo0_dp_intf0_dp_intf clock (used for eDP),
> add the CLK_SET_RATE_PARENT flag to CLK_VDO1_DPINTF (used for DP)
> and also fix its parent clock name as it has to be "top_dp" for two
> reasons:
>  - This is its real parent!
>  - Likewise to eDP/VDO0 counterpart, we need clock source
>    selection on CLK_TOP_DP.
> 
> Signed-off-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> Fixes: 269987505ba9 ("clk: mediatek: Add MT8195 vdosys1 clock
> support")
> 
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


