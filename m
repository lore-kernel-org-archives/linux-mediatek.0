Return-Path: <SRS0=9HTA=M7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A20AC4338F
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Aug 2021 13:02:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2600260C40
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Aug 2021 13:02:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2600260C40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Jha/MINrsbVrboLCYc+Lpn4BV6RuT3kieAN9Eo5AHRo=; b=pLUqEO+bijaiTw
	jXx2FUGCV2fyDEv9zX0gMrYZvmPcH4jPr3858SlUjij8TGs2OF0TB/oRNC9SG9rMB7ftZazrvnKZt
	k4h65lNzbV6FTf98kJOWiw0pEpF4WNNBaCf/PGZMnZsLvfLrZQsGYIsuJ6CcJ1ixeHK5sxljs+1SY
	BY2eA1zygfPO6Lx4rrgSx/Uazk2jDVHIIgh6NLKRaDqPLeMWGtpQC153WjUqTBGQrSMVLvuTLJnCT
	YX2lcVL8Vwzl2E0RbUPIC4XVrZbB2lFCt/XRt3mAxcJtjpgeLVbYQ4Et/GE0rbdj++BaPYY54fYqv
	+hS91AHk5PSa5Ux1yKYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCiRm-00FrWs-Sk; Sun, 08 Aug 2021 13:02:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCiRj-00FrVP-26
 for linux-mediatek@lists.infradead.org; Sun, 08 Aug 2021 13:02:33 +0000
X-UUID: 015c5facc0e64c1bbddb8a3c09bbb4f5-20210808
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=eBKwn3UIs1bNPL1Ouc323k00v/xyunt4iMB9qsdRbMw=; 
 b=rVMJGgCsyA88gF7b5OhhOWIqwIjQ+6k1ATXHjkbguR7ce5v2OcSI5FZKIMO/QL0yWNhEGAm61RsIqzMFVEfvOynMqVJGjkaZEVwp8oznE6QojEiy+LQeMh3jRtHmt30cOB4ZrYsOvNNFPhOeXAhIvzrhOLZwnEA5SvObzCQi/04=;
X-UUID: 015c5facc0e64c1bbddb8a3c09bbb4f5-20210808
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1855389522; Sun, 08 Aug 2021 06:02:28 -0700
Received: from MTKMBS33N2.mediatek.inc (172.27.4.76) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 8 Aug 2021 05:52:26 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sun, 8 Aug 2021 20:52:20 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Sun, 8 Aug 2021 20:52:19 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg
 <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC: <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <yingjoe.chen@mediatek.com>, <eddie.huang@mediatek.com>,
 <cawa.cheng@mediatek.com>, <bibby.hsieh@mediatek.com>, <ck.hu@mediatek.com>,
 <stonea168@163.com>, Jitao Shi <jitao.shi@mediatek.com>
Subject: [PATCH v2 0/3] seperate panel power control from panel
 prepare/unprepare
Date: Sun, 8 Aug 2021 20:52:15 +0800
Message-ID: <20210808125218.63029-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TM-SNTS-SMTP: DE77C0201CE914943298746E6C2A3EE716D29A464B218995FB944623E5021A742000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210808_060231_139788_7007F864 
X-CRM114-Status: UNSURE (   5.20  )
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

Changes since v1:
 - Fix null point when dsi next bridge isn't a panel.
 - "dsi mmsys reset" is implement by
   https://patchwork.kernel.org/project/linux-mediatek/list/?series=515355

Jitao Shi (3):
  drm/panel: seperate panel power control from panel prepare/unprepare
  drm/panel: boe-tv101wum-n16 seperate the panel power control
  drm/mediatek: fine tune the dsi panel's power sequence

 drivers/gpu/drm/bridge/panel.c                | 17 +++++
 drivers/gpu/drm/drm_panel.c                   | 38 ++++++++++
 drivers/gpu/drm/mediatek/mtk_dsi.c            | 29 ++++++--
 .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 72 +++++++++++++------
 include/drm/drm_bridge.h                      |  2 +
 include/drm/drm_panel.h                       | 17 +++++
 6 files changed, 148 insertions(+), 27 deletions(-)

-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
