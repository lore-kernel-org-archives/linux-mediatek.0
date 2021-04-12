Return-Path: <SRS0=8MWw=JJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25D0EC433ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 11:52:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4EC260BD3
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 11:52:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4EC260BD3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UcavJmhnnxSWA8nHMPLCunRKp9DV7lXYxMTGDkpk970=; b=dvvPylHdt+GheLRH0Pyvm8+c0P
	fD5Kt69jNkTaOyDrA1232PvdT/m53OAKpgFw59Fe8LF7DidGY/2GlC4ohdgaWEm0y8D5GJOqWvTNp
	9tp81dScrYblXjuVOKsgaD9a6EHx0oK62pdDq5fLHttxIqA9g2Yh44MkTkN+d9tbOEXgKTQaQIGqQ
	0q87fZDVQbc5Uy6hzh99sJq/o9rTv0z0/hwITUVPFU4bw2HQcVkSP/0jXZUF2aXW3BrrsUnGkkilc
	6gqJLHLFVCQlUx2AcMF3K7p00P11SewjXv1jJnAjJk436vYqpBX1Pf/HW5a9oAGgU1g9h4ZBJR9Gr
	EpVi0DEA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVv7D-006bmr-RU; Mon, 12 Apr 2021 11:52:27 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVv6i-006bim-Te; Mon, 12 Apr 2021 11:51:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=QoN1N5XdliJ0KxFm7mKYVIL52PcJTGXdRtzjaLyXQLg=; b=o/5tB1Y2Psj4hGOK7yZRbIIAwc
 PESJoVxNymRSKxNhIpAjxQIbHVRlteIHnrKrW4JHeTDImqnPFCJnx0iPuaADWEVw7dx+/MF/dXzPF
 TzsLeuZcGkcLqt2D8mZIFCnHwMjcPtR10CYdlI9oCy1UFSgQ4KcjzPJf9Tnh42Aym6FZjWZ+vo9FF
 egdcpSn67eCIrjW04zffK/b1srnhbDbvP3WsM8MIpX+Z33FtlJa9QnT5d6wnqIhVWBqorv0OvV6tx
 UpYMjawcVGBR7Q1zykQWQT/AG23lnb191cSLqH8tv9iu+9ewiJOUc8/U1hqPI2ZEArtl8x5jM56dR
 VYV+y3ww==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVv6e-006C4O-0y; Mon, 12 Apr 2021 11:51:55 +0000
X-UUID: 6c8a64e61ad546878681f2d3f4033e57-20210412
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=QoN1N5XdliJ0KxFm7mKYVIL52PcJTGXdRtzjaLyXQLg=; 
 b=Qm0Gbli+v4OCvK8Tvbi1u2RebZu4kYv9bqni3UhIL496ulRvrMt8e7Yd17CEiW8IP1W0ep6OgW57CgAxduWAq7BuN6EDIDjHuhOWT+xBiKboOeM0aJeys1ZnTv+eeT8EKeG0ubCeYZqovVK/9bbVja3jAbjIVjuzHG1rPR5BHjQ=;
X-UUID: 6c8a64e61ad546878681f2d3f4033e57-20210412
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 14754892; Mon, 12 Apr 2021 04:51:48 -0700
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Apr 2021 04:51:47 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Apr 2021 19:51:39 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 12 Apr 2021 19:51:32 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Jassi Brar
 <jassisinghbrar@gmail.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Dennis YC Hsieh
 <dennis-yc.hsieh@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4, 0/3] support gce on mt8192 platform
Date: Mon, 12 Apr 2021 19:51:27 +0800
Message-ID: <1618228290-18413-1-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-TM-SNTS-SMTP: D059E56A9E027C630B0A08F5195CDBA2F4E06AF4687A772A470905E4A6B707132000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_045153_851673_57AE2EB5 
X-CRM114-Status: GOOD (  10.85  )
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

Change since v3:
-fix review comment in v2

Change since v2:
- add controy_by_sw for mt8192

Change since v1:
- move out shift jump patch
- remove useless patch

Yongqiang Niu (3):
  dt-binding: gce: add gce header file for mt8192
  arm64: dts: mt8192: add gce node
  mailbox: cmdq: add mt8192 support

 .../devicetree/bindings/mailbox/mtk-gce.txt        |   7 +-
 arch/arm64/boot/dts/mediatek/mt8192.dtsi           |  10 +
 drivers/mailbox/mtk-cmdq-mailbox.c                 |  10 +
 include/dt-bindings/gce/mt8192-gce.h               | 335 +++++++++++++++++++++
 4 files changed, 359 insertions(+), 3 deletions(-)
 create mode 100644 include/dt-bindings/gce/mt8192-gce.h

-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
