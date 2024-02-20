Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6FE1C48BC4
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Feb 2024 09:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Cpm4Z8YcqW1pU8FkfVmKvD7vvfltD+VL86sKjFeu79Q=; b=ZIX8WhgfWb8ly+h2jYxKJlHan3
	NFPk1lONkixUAY8vSR+VwLylqoWDcdk47+JDVGyqGzWXM2Oa0dtPE1pbAWoGGH0XXYngftZ1oJTZW
	z8c/f38N5SnJ1v+g/l+9XlE6WRmZR5nZPBRyffQdojAbNkbGNZpQAWZrO7KxVxYb1j0+aoAqeZbhR
	SzklzQ21qvgIBxC1w1xltmuD08UD2gvuzTbKbHRJcmXML20QO201C7yY9ECZIZm8GfY0KI1F0psfh
	U9nefCQf18NHRrF8ZG61IyYfZaE93v4YCQFvFpU3XJdfQbc51SOu85l7GN8l4XYJ/Ew5CKTD5GGLi
	mivwVT+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcMZA-0000000E1ey-1kJQ;
	Tue, 20 Feb 2024 09:37:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcMZ1-0000000E1bI-13iz;
	Tue, 20 Feb 2024 09:37:24 +0000
X-UUID: a2e53e78cfd311ee9a263b4415211400-20240220
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Cpm4Z8YcqW1pU8FkfVmKvD7vvfltD+VL86sKjFeu79Q=;
	b=TOKTE1Z+2mfZmeeF7x8+N/3z++RoqEyuTiMseAGR2zCsHwacViFUIxa4LUqj00sghdFhlE6suWRuh68pefGc9J0MEIcsNfKfSGZg+Z1J9mw/SUeFnwRNA1qqgoLIc6nq3OGYeu9PWAxJly0HfEK1BWMA92tmYaVcAOwb9DGlRHs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:82d92d0d-babd-4ea0-80da-d39f33be405b,IP:0,U
	RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:6f543d0,CLOUDID:5964fefe-c16b-4159-a099-3b9d0558e447,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: a2e53e78cfd311ee9a263b4415211400-20240220
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 670551389; Tue, 20 Feb 2024 02:37:17 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 20 Feb 2024 17:37:12 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 20 Feb 2024 17:37:12 +0800
From: Shawn Sung <shawn.sung@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	"Hsiao Chien Sung" <shawn.sung@mediatek.corp-partner.google.com>
Subject: [PATCH v3 0/1] Filter modes according to hardware capability
Date: Tue, 20 Feb 2024 17:37:10 +0800
Message-ID: <20240220093711.20546-1-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.759200-8.000000
X-TMASE-MatchedRID: ATi5SS6xZln8rQJMqxBG8BlckvO1m+JccuFRT+prg4ZGL0g1nVmkYZgC
	Mlq+sZ+fOyZ2mg3CStONpw2JbH/pLNm0JHSAKf2wA9lly13c/gFKPIx+MJF9o5soi2XrUn/J8m+
	hzBStansUGm4zriL0oQtuKBGekqUpnH7sbImOEBSNfc3Pw1BhgWBA1CBIH/I6EO0lIp72XzxQi5
	Kp9S4aVP1xKjgX1cLXC0qYZTpU9PeK4SmSDNGOLF6OHnj3Ynoi2s3WaI3nzqlJmt82E/eyBQGH0
	CAFIQWsmb5gmylW+PbGS+seVPx64j6Qrn3xh/cy
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.759200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 1182ACC9B0C5F753CD224FFF2226C5525ADE82CBFF4FA67B9CCCA626148E760C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_013723_321365_2DA78D88 
X-CRM114-Status: UNSURE (   7.18  )
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

Changes in v3:
- Add more information to the comment

Changes in v2:
- Refined the filtering formula
- Add the .mode_valid hook to the hardware that causes the limitation

Hsiao Chien Sung (1):
  drm/mediatek: Filter modes according to hardware capability

 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  4 ++
 drivers/gpu/drm/mediatek/mtk_disp_merge.c     | 65 +++++++++++++++++++
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   | 17 +++++
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c       | 17 +++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |  1 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   | 12 ++++
 6 files changed, 116 insertions(+)

--
2.18.0


