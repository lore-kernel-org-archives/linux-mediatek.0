Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB77EC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 May 2022 06:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=F5GYIE5tj9HO+dnWxJn20xghxsmqi/XJTzSFeKDYz7g=; b=l4zT4a9Gcsl952
	en8YQPrhusfnJQXM7dfamWs0s/cpb/nsVkgv7Mga/a0pFI6ani7jL1TTuBgK/J4NUKQqgqrOIZoxH
	a2zH5SqJDT1q6qkiJnkJ7PIWdj36prfPrSsDSUmiVrjgPobj3PaKoVYiKza4IixB2ptyWOSB4LM1p
	fCHIYuNljl8B8a1fApd8TvHAgvSg3Rv7wPwaCYbpQn+ccmCEIDzBdDr5x9pEd4sfDyerhvpEPyWbj
	AqeOwcXqxL6e4IFdBttbrg8SDMaDPai4X/EERN3AaCTkzhdNuIH3CETliu6OaFONnI7o3DEafTT+i
	sfvIFPmXAooYRXQDHaWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1np2LY-00ASk8-PO; Thu, 12 May 2022 06:30:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1np2L8-00ASFV-Ut; Thu, 12 May 2022 06:30:24 +0000
X-UUID: f7b321c75a344401b7c2d6395a2f1f09-20220511
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:3d309737-ec18-4ece-8924-2ec6435b6485, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:3738eff1-ab23-4aed-a67b-f96514452486,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: f7b321c75a344401b7c2d6395a2f1f09-20220511
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 920556558; Wed, 11 May 2022 23:30:18 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 May 2022 23:30:16 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 May 2022 14:30:14 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 12 May 2022 14:30:13 +0800
From: <xinlei.lee@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <matthias.bgg@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <rex-bc.chen@mediatek.com>, <jitao.shi@mediatek.com>, Xinlei Lee
 <xinlei.lee@mediatek.com>
Subject: [PATCH v6,
 0/4] Cooperate with DSI RX devices to modify dsi funcs and delay mipi
 high to cooperate with panel sequence
Date: Thu, 12 May 2022 14:30:08 +0800
Message-ID: <1652337012-9053-1-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_233023_031787_8EE2A6B0 
X-CRM114-Status: UNSURE (   5.36  )
X-CRM114-Notice: Please train this message.
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

From: Xinlei Lee <xinlei.lee@mediatek.com>

In upstream-v5.8, dsi_enable will operate panel_enable, but this
modification has been moved in v5.9. In order to ensure the timing of
dsi_power_on/off and the timing of pulling up/down the MIPI signal,
the modification of v5.9 is synchronized in this series of patches.

Change since v5:
1. Merged [v5,1/5] drm/mediatek: Adjust the timing of mipi signal from
LP00 to LP11 to [v5,4/5] drm/mediatek: keep dsi as LP00 before dcs cmds
transfer, because in (v5,1/5) to adjust the dsi func sequence in order
to move to lane_ready func together in (v5, 4/5).

Changes since v4:
1. Dsi func modified to atomic operation.
2. Added fix tag.
3. Removed lane_ready print statement.

Changes since v3:
1. Rebase kernel-5.18-rc1.
2. Added dsi_enable protection.
3. Encapsulates the dsi_lane_ready function.

Changes since v2:
1. Rebase linux-next.

Changes since v1:
1. Dsi sequence marked with patch adjustment.
2. Fixes: mtk_dsi: Use the drm_panel_bridge.

Jitao Shi (2):
  drm/mediatek: Separate poweron/poweroff from enable/disable and define
    new funcs
  drm/mediatek: keep dsi as LP00 before dcs cmds transfer

Xinlei Lee (2):
  drm/mediatek: Modify dsi funcs to atomic operations
  drm/mediatek: Add pull-down MIPI operation in mtk_dsi_poweroff
    function

 drivers/gpu/drm/mediatek/mtk_dsi.c | 93 ++++++++++++++++++++----------
 1 file changed, 63 insertions(+), 30 deletions(-)

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
