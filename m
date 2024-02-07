Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3CD0C4828D
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Feb 2024 02:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/9iu+hMwKPmAX48lO9etKmHZlNn7fbipD6oy4YQb2Tg=; b=IVJOgXDqzNNnDlA2zwhY03lGjw
	2qWBiJ5AhToHIc5qlOIuWwGPQHZn/CeaXb0if/DS7ZQktZFUNWvy9AnKSdNbBF56vFZkQYO3MsmPE
	68aFh2lNJhFZmjTilsErQN+kdvSlyGZIqWLJymCD2dAsx1DLtKhO4ccB/ZpeKuzNS1qcwDf0u5kSj
	4rcfUyTEC5MI53/fgFr+2ba3n9jRt/4UIDUFwm00GzTG1doQmORrqEYLWtrEy8qzeof9LNRG+kQKO
	6gD4kkgltcp4kHoKiKZq1CxvpSxOv2YPL+Jl0xN9SiosA1uN9Kj2hG6Q4mb9sDWtgVMol2yHhgBNt
	/AsrvOcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXXT9-00000009RSt-47Vl;
	Wed, 07 Feb 2024 02:15:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXXT6-00000009RRp-3ofq;
	Wed, 07 Feb 2024 02:15:22 +0000
X-UUID: bb8b1166c55e11ee9a263b4415211400-20240206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=/9iu+hMwKPmAX48lO9etKmHZlNn7fbipD6oy4YQb2Tg=;
	b=HcW7hEqGBQufACMgjZNDoelGzZvYhcNUYpjsGV2WDbpTVKMtxLgdX4QjQaJ26GMAHkXE5lA0qPo6v1baMyIFCIuiSgZAfdEDpSS9WCQkq/n1ybbfwmVMlm0HysQ5rYJ8OkIYO7hIM3L7YD+IIuVV8VeI7BTDNCItfU5fNG+yRyc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:0326bb80-4a51-45a8-8668-c0295b646416,IP:0,U
	RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:6f543d0,CLOUDID:3eae1a8f-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: bb8b1166c55e11ee9a263b4415211400-20240206
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1217579574; Tue, 06 Feb 2024 19:15:15 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 7 Feb 2024 10:15:12 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 7 Feb 2024 10:15:12 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	"Hsiao Chien Sung" <shawn.sung@mediatek.corp-partner.google.com>
Subject: [PATCH v2 0/1] Filter modes according to hardware capability
Date: Wed, 7 Feb 2024 10:15:09 +0800
Message-ID: <20240207021510.24035-1-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.759200-8.000000
X-TMASE-MatchedRID: ATi5SS6xZln8rQJMqxBG8BlckvO1m+JccuFRT+prg4ZGL0g1nVmkYcDV
	CJRGn8Ul9thk9nbRgmWNpw2JbH/pLNm0JHSAKf2wA9lly13c/gFKPIx+MJF9o5soi2XrUn/J8m+
	hzBStansUGm4zriL0oQtuKBGekqUpnH7sbImOEBSNLjMwRubhFIJLAWlgYBj9j6bYDnm5z3RGIG
	Ft1pWKyYS780tUCheZS3sQQCJQ7LTHajbg+Suzu1HfVNA9wjvktgZwSK5A7V1Jmt82E/eyBQGH0
	CAFIQWsmb5gmylW+PbGS+seVPx64j6Qrn3xh/cy
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.759200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 1498373DF5AC87AD7C57785CDAB8BEF926E2F60C2A869894C2EAB08A0702ACA22000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_181520_983535_1043E010 
X-CRM114-Status: UNSURE (   7.04  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>

This series is based on mediatek-drm-next branch of
kernel/git/chunkuang.hu/linux.git.

Changes in v2:
- Refined the filtering formula
- Add the .mode_valid hook to the hardware that causes the limitation

Hsiao Chien Sung (1):
  drm/mediatek: Filter modes according to hardware capability

 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  4 ++
 drivers/gpu/drm/mediatek/mtk_disp_merge.c     | 56 +++++++++++++++++++
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   | 17 ++++++
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c       | 17 ++++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |  1 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   | 12 ++++
 6 files changed, 107 insertions(+)

--
2.18.0


