Return-Path: <SRS0=ht0X=4O=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E21D9C4BA0B
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 03:48:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B54AC222C2
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 03:48:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZcBaQetz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="opZEQT5B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B54AC222C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NzyWc3L6yUcfGO9geDlo0Id9thJNGCfQriDSJ7Ub2Tk=; b=ZcBaQetzYSYVSR
	HOQrskn1WYKyvhz/dtqPaT1eXJfq0fw6bpc8w2R+RoXWeX4Zqr/y8DlD8c3THom9OeekCDCDZNlLg
	BTuaSLVtkkkPm0EmvmmHbksRZu/mVp8cIzuOT5sNZxPyMGgVyHZ1n717tMgI5SeMvWz2hvnk0rwWg
	5CndtbIT0tEBtzrKg5MtLOGgYuNzurrLkaUCHugf1xoN2XOwgFi+niF+cN4kkqeXk0kL+M32eujdR
	9EZwknMwv1TJmPe7c/d/UgHKygpKmqegx6C59O3RRLJf+paGSHbUocjE5Wds3bmWak8KUij6yk2pw
	h1UwljLXRsKIo5bC9jrQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6ngL-0000z4-F3; Wed, 26 Feb 2020 03:48:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6ngJ-0000xB-Jy; Wed, 26 Feb 2020 03:48:20 +0000
X-UUID: 7ed3760767e84e878af8faef6f92256b-20200225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=nh2s25XhkWJkMUS7wIRow/JMcFuv2C5dPCJ4XGFkezc=; 
 b=opZEQT5BmAxmywzC0NpXMzvnI2sSr9jKbSMe6cNzIb8fJZrqRshudSyGVNL8eqMFaGbbgy3kLycgkg1Co1+N5nTShtnVxWBQ7vYcDY4kE/EHHpGMcSeteOQhVrwARuLFgmyAYMkJQpy1vVeniLW1Vk3IZRzUJQKggrh1/+irW1s=;
X-UUID: 7ed3760767e84e878af8faef6f92256b-20200225
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <gtk_ruiwang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 581682116; Tue, 25 Feb 2020 19:48:17 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 25 Feb 2020 19:38:53 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 26 Feb 2020 11:37:24 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 26 Feb 2020 11:35:56 +0800
From: <gtk_ruiwang@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
Subject: [PATCH] mediatek: move MT8173 VPU FW to subfolder
Date: Wed, 26 Feb 2020 11:36:46 +0800
Message-ID: <20200226033646.20949-2-gtk_ruiwang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200226033646.20949-1-gtk_ruiwang@mediatek.com>
References: <20200226033646.20949-1-gtk_ruiwang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200225_194819_667841_DCBA8065 
X-CRM114-Status: UNSURE (   6.23  )
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
Cc: gtk_ruiwang@mediatek.com, Maoguang Meng <maoguang.meng@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>, srv_heupstream@mediatek.com,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Longfei Wang <longfei.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 Tomasz Figa <tfiga@chromium.org>, linux-mediatek@lists.infradead.org,
 PoChun.Lin@mediatek.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: gtk_ruiwang <gtk_ruiwang@mediatek.com>

Currently vpu_d.bin and vpu_p.bin are at the root of
linux-firmware git tree, it's not appropriate so we move
them to subfolder mediatek/mt8173

Release Version: 1.1.4

Signed-off-by: Rui Wang <gtk_ruiwang@mediatek.com>
---
 vpu_d.bin => mediatek/mt8173/vpu_d.bin | Bin
 vpu_p.bin => mediatek/mt8173/vpu_p.bin | Bin
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename vpu_d.bin => mediatek/mt8173/vpu_d.bin (100%)
 rename vpu_p.bin => mediatek/mt8173/vpu_p.bin (100%)

diff --git a/vpu_d.bin b/mediatek/mt8173/vpu_d.bin
similarity index 100%
rename from vpu_d.bin
rename to mediatek/mt8173/vpu_d.bin
diff --git a/vpu_p.bin b/mediatek/mt8173/vpu_p.bin
similarity index 100%
rename from vpu_p.bin
rename to mediatek/mt8173/vpu_p.bin
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
