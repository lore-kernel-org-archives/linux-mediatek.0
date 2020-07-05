Return-Path: <SRS0=Yo4y=AQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEAA9C433E0
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jul 2020 06:49:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 808D720870
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jul 2020 06:49:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mvV/83Jz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="LGcveeIF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 808D720870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E3A9TY3atkoPaPJK3DxlhrzdZ4XsJAdjM1gvP7/5qLo=; b=mvV/83JzgAgYdo2AvB3nxJoguq
	5xRoYvQ1zNq0PrtM/V4aEgR4/UffQNDXDnVtT0puPLsn6FEyn5XqTez1eMajTT362HvSn5bu1QfkP
	9tODqfNZPORBB1q5r9XM2PHL0uaf4va2tssJ0yr6fLjoL7OBCm97kow4QSLg2wbHg4Muu570A92C9
	D1SIiRNWRFDUkt/xqoGVlJR9skFnWaVuTWe6qsN0WlbkUMvX0Y9fS7s6b70HA1L1PG1D+iKTnsWeH
	HY6vk6SzL2aSty+Q00bE5zU6jb8xykT3oI5H1ffftAw1RVmMU3a2C2WxZicjZZ48g2U2o1GYB6A7D
	1R5gCHyA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrySO-0008Ia-Iz; Sun, 05 Jul 2020 06:48:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrySD-0008Ao-Sx; Sun, 05 Jul 2020 06:48:46 +0000
X-UUID: abc75ff36d1840beae2da73030338e76-20200704
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=6iMO0gk0hP4QF47/XhMn9JchKU1Qvxhv+Lh5xkKouP0=; 
 b=LGcveeIFCW/T1pJjYFrBAFvLaCRC+ExcAoJXrGrEyO0u6rsQPt7Zg5OmjWCTENmBGKmrD7Mv8CNGCOCNoY16htddT0eja7S36Z2nMhkYWDplgcFDR0HXyuo8PwUn6sNhmvGtpMujLxYjvnBbFSbw5IrHyxbWdFiuvPHH2we3ZeA=;
X-UUID: abc75ff36d1840beae2da73030338e76-20200704
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <dennis-yc.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 166167779; Sat, 04 Jul 2020 22:48:29 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 4 Jul 2020 23:48:36 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 5 Jul 2020 14:48:35 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sun, 5 Jul 2020 14:48:36 +0800
From: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, Bibby Hsieh
 <bibby.hsieh@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>
Subject: Subject: [PATCH v1 0/8] support cmdq helper function on mt6779
 platform
Date: Sun, 5 Jul 2020 14:48:27 +0800
Message-ID: <1593931715-32761-1-git-send-email-dennis-yc.hsieh@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200705_024846_118481_26D31004 
X-CRM114-Status: UNSURE (   7.40  )
X-CRM114-Notice: Please train this message.
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
Cc: wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, HS Liao <hs.liao@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch support more gce helper function on mt6779 platform.

depends on patch: support gce on mt6779 platform

and depends on following applied patches
soc: mediatek: cmdq: add set event function
soc: mediatek: cmdq: export finalize function
soc: mediatek: cmdq: add assign function

Change since v1:
- Rename cmdq_mbox_shift() to cmdq_get_shift_pa().


Dennis YC Hsieh (8):
  soc: mediatek: cmdq: add address shift in jump
  soc: mediatek: cmdq: add write_s function
  soc: mediatek: cmdq: add write_s_mask function
  soc: mediatek: cmdq: add read_s function
  soc: mediatek: cmdq: add write_s value function
  soc: mediatek: cmdq: add write_s_mask value function
  soc: mediatek: cmdq: add jump function
  soc: mediatek: cmdq: add clear option in cmdq_pkt_wfe api

 drivers/gpu/drm/mediatek/mtk_drm_crtc.c  |   2 +-
 drivers/soc/mediatek/mtk-cmdq-helper.c   | 113 ++++++++++++++++++++++-
 include/linux/mailbox/mtk-cmdq-mailbox.h |   6 +-
 include/linux/soc/mediatek/mtk-cmdq.h    |  93 ++++++++++++++++++-
 4 files changed, 206 insertions(+), 8 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
