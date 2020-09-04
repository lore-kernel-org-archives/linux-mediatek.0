Return-Path: <SRS0=heX2=CN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04635C433E2
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 11:00:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE4DB2074D
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 11:00:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YKIeOQB8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="mbfzMJdQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE4DB2074D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i/bK215HYKxPtV7A0LCc+DbDiTyaIAjFcTd3wZPlV7s=; b=YKIeOQB8FCEyrB3u/EW54vsyXG
	fF0qFt2htDmnZeUFl7jz+jz1wgFedo9DS1bn/lYpQRxZjSbyLzSuiH4fAoe5B1K8LNHkOa4reWNru
	+CCiUKf0QVIpBKbj8LDGLgmwwayIzOUjSLHT+0EN80JBv+nAKwLM590jQheV794ZaK2bGBkXejyBH
	3Tohvabbd8lk4uybYtAmDz++aqun+AVC/3Du/ix2g0s8IBcH9IhJjUioau5GTd+pYGx8wlgOi4bBT
	83Q5c+PSazVijDG+M/RqXkGl4ARm9bQplfplOE1DNAJHdKL0XrF049pPGLvbK1HAgwOhcV2WoWPzD
	35W2IVEg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kE9Sb-0008Pc-Qt; Fri, 04 Sep 2020 11:00:49 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kE9SS-0008M6-EG; Fri, 04 Sep 2020 11:00:41 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
 by mxout1.routing.net (Postfix) with ESMTP id 1407E4026B;
 Fri,  4 Sep 2020 11:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
 s=20200217; t=1599217229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=DXWunT6/1oNeLvT/FMsXBR2HIErDGDCvRZEkb2LPbhU=;
 b=mbfzMJdQ5aIC4rkeOeCzXpVZ4rxaoYZIYGpWAvoU0cVbfERXsjipPqZWVy1yY9CjS3k5yN
 0JVVKhL9gdwN9bTa5lcZK4bDOjUTUFonAdLrjEWoN8gRVSqnRNzUCJmfTHh3gpoEvxitb1
 imA54I3xXc9FhWom/zIHN2K2gttkXYI=
Received: from localhost.localdomain (fttx-pool-217.61.147.193.bambit.de
 [217.61.147.193])
 by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 2B322360469;
 Fri,  4 Sep 2020 11:00:28 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v6 0/4] make hdmi work on bananapi-r2
Date: Fri,  4 Sep 2020 12:59:58 +0200
Message-Id: <20200904110002.88966-1-linux@fw-web.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_070041_006528_2F8D6BFF 
X-CRM114-Status: GOOD (  12.54  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>, Sean Wang <sean.wang@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

This Patch-Series adds missing Patches/Bugfixes to get hdmi working
on BPI-R2

v5->v6:
 - drop parts already merged to mediatek-drm-next
 - include lima-regulator-patch
 - rebase on changes in mediatek-drm-next tree (hdmi/hdmi-phy patches)
 - fix compatible of hdmi0 because of changes in hdmi-driver
v4->v5:
 - rebased on 5.9-rc1
 - move existing display-related dts nodes to new mt7623n.dtsi
   because mt7623a does not have gpu
 - add new display nodes to this new dtsi
v3->v4:
 - fix removed const in "add ddp routing for mt7623"
 - change subjects to "drm/mediatek:..."
 - add documentation for mt7623-* compatibles
 - dropped redundant display_components node (mmsys compatible)
 - add reviewd-by collected in v3
v2->v3:
 - use own mmsys-routing for mt7623 instead of code getting different
   routing from dts
 - remove ddp routing bls -> dpi from bpir2/rfb dts
 - updated some commit-Messages as suggested by CK Hu
v1->v2:
 - using get_possible_crtc API instead of hardcoded
 - drop unused dts-nodes
 - refine commit-messages as far as i can :)
   "config component output by device node port" is needed to fix a WARN_ON()
   "fix boot up for 720 and 480 but 1080" fixes flickering, 
     which may cause also some resolutions not working on some TFT

Alex Ryabchenko (1):
  arm: dts: mt7623: add lima related regulator

Frank Wunderlich (1):
  arm: dts: mt7623: move display nodes to separate mt7623n.dtsi

Ryder Lee (1):
  arm: dts: mt7623: add display subsystem related device nodes

chunhui dai (1):
  drm/mediatek: disable tmds on mt2701

 arch/arm/boot/dts/mt7623.dtsi                 | 123 -------
 arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts |  87 ++++-
 arch/arm/boot/dts/mt7623n-rfb-emmc.dts        |  74 ++++-
 arch/arm/boot/dts/mt7623n.dtsi                | 306 ++++++++++++++++++
 drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c    |   1 +
 drivers/phy/mediatek/phy-mtk-hdmi.c           |   3 +
 drivers/phy/mediatek/phy-mtk-hdmi.h           |   1 +
 7 files changed, 469 insertions(+), 126 deletions(-)
 create mode 100644 arch/arm/boot/dts/mt7623n.dtsi

-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
