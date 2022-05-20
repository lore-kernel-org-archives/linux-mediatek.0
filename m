Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28781C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 03:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r6yUDwSS5qKghBV/6nBeVG79DgvhaFwwNqENOTvKHd0=; b=fcGb6Bl+QqiNbT
	rxGvPju7/G5QSdRChD+qBDbP3qVGTvcmlOa8X2cq59q0zeyse9sw38d7wLQn+8twHn3HKS+ki0KFr
	RkGmQIvqWiJd0Wm/Syym8Z+fdM0L939ODx1SenVqAhOhqIKyYMXAsAVYbESGHP5ioJVpMNEOjTe1K
	D6htbLyG0TVbRlYosdXHC8l97t6cMJ2k95KcLv5lGzjTdnwoIgVugHeYU+Ry08OXtH25E4WHNLkmL
	xGsSfEfiDzDehTLrcS1c7/J8aX/sPgtQGTNXgwrX8ZY1WbmBIDfZZDKG2rg+7X/r53EjWFyIgOln5
	2BGQ/OIIT9ETB1U1viLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrt9L-00AG3v-RP; Fri, 20 May 2022 03:17:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrt99-00AFxO-1B; Fri, 20 May 2022 03:17:48 +0000
X-UUID: 4d8b63ecf3c8485ea2bf29ca46ac73d6-20220519
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:1fdb63a5-b9b9-478e-88d3-c70861919331, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:14,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:14
X-CID-META: VersionHash:2a19b09, CLOUDID:b4dee1e2-edbf-4bd4-8a34-dfc5f7bb086d,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:3,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: 4d8b63ecf3c8485ea2bf29ca46ac73d6-20220519
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1692161880; Thu, 19 May 2022 20:17:40 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 19 May 2022 20:17:39 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 May 2022 11:17:37 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 20 May 2022 11:17:37 +0800
Message-ID: <319484715f582c210c275ef23d020e802579c738.camel@mediatek.com>
Subject: Re: [PATCH v7,3/4] drm/mediatek: keep dsi as LP00 before dcs cmds
 transfer
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <xinlei.lee@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <matthias.bgg@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <jitao.shi@mediatek.com>, "# 5 . 10 . x : b255d51e3967 : sched : Modify dsi
 funcs to atomic	  operations" <stable@vger.kernel.org>
Date: Fri, 20 May 2022 11:17:36 +0800
In-Reply-To: <1653012007-11854-4-git-send-email-xinlei.lee@mediatek.com>
References: <1653012007-11854-1-git-send-email-xinlei.lee@mediatek.com>
 <1653012007-11854-4-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_201747_112935_7FFD4BBA 
X-CRM114-Status: GOOD (  11.30  )
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

On Fri, 2022-05-20 at 10:00 +0800, xinlei.lee@mediatek.com wrote:
> From: Jitao Shi <jitao.shi@mediatek.com>
> 
> To comply with the panel sequence, hold the mipi signal to LP00
> before the dcs cmds transmission,
> and pull the mipi signal high from LP00 to LP11 until the start of
> the dcs cmds transmission.
> The normal panel timing is :
> (1) pp1800 DC pull up
> (2) avdd & avee AC pull high
> (3) lcm_reset pull high -> pull low -> pull high
> (4) Pull MIPI signal high (LP11) -> initial code -> send video
> data(HS mode)
> The power-off sequence is reversed.
> If dsi is not in cmd mode, then dsi will pull the mipi signal high in
> the mtk_output_dsi_enable function.
> The delay in lane_ready func is the reaction time of dsi_rx after
> pulling up the mipi signal.
> 
> Fixes: 2dd8075d2185 ("drm/mediatek: mtk_dsi: Use the drm_panel_bridge
> API")
> 
> Cc: <stable@vger.kernel.org> # 5.10.x: b255d51e3967: sched: Modify
> dsi funcs to atomic operations
> Cc: <stable@vger.kernel.org> # 5.10.x: 72c69c977502: sched: Separate
> poweron/poweroff from enable/disable and define new funcs
> Cc: <stable@vger.kernel.org> # 5.10.x
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---

Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
