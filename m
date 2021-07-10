Return-Path: <SRS0=Fd5v=MC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C95DC07E95
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Jul 2021 08:17:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 098B4613B6
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Jul 2021 08:17:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 098B4613B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o/TeMZQOKiuu0UhGdw2I5affbSFIIxtaARjMI37Yh4M=; b=TxN5O8mFaK5R2W
	IpvJVf3H0C/zq/Gu/BZ+HSh/qztM1n1WBiY/GP/7+RxNNEHnz2chYq+9ncshXTVjrH5kVi0jUCKmK
	4mfSnCBG8NXyjfF95ZiI7uMPPFg8ackaZRjSLuGEzb1o+xYhVfoaGhYedpuOhUp06d6zZ/q9EYzI6
	T/o9Muoq26bErjjpR036udifZ7aQyGhI7tYL+XF4gtFwdeSGLhU7eK0VWrFj1XRRAZCWDu4jdjotO
	QCxOfurf03Cb/K6C5nmWjMIh/RJ3cbX3jqDG0VG+XsW6UM8PPsFS1M0qE228UVW9YdgIjMU16fLde
	cW5zdHaiVF7MK9Nu9Xpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m28B9-003LUN-Tj; Sat, 10 Jul 2021 08:17:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m28B4-003LSz-TM; Sat, 10 Jul 2021 08:17:38 +0000
X-UUID: fb8341d165ce4705bf4bbbcfde7953cd-20210710
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=sEXOn0hSOqKjEvcuAaL3NiZpk3UqBSxj+/qUK97psJc=; 
 b=gcQwflhX9jz6Q/yB6CXg3N5U5Fmt9YwMJ/bosDU5K5bOdkgpastKbbamic468S53U08VbKNeowon4InkjRwS/3O1EDT0hgowf7ey1ER81fvqYjClO8rnB+SnecRG/WVl+ZmhJhLd/2k2JAOjXl4do96fV+o57l2W+Mq7+ph5+CY=;
X-UUID: fb8341d165ce4705bf4bbbcfde7953cd-20210710
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 879063578; Sat, 10 Jul 2021 01:17:29 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 10 Jul 2021 01:17:27 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 10 Jul 2021 16:17:26 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 10 Jul 2021 16:17:25 +0800
From: Zhiyong Tao <zhiyong.tao@mediatek.com>
To: <robh+dt@kernel.org>, <linus.walleij@linaro.org>, <mark.rutland@arm.com>, 
 <matthias.bgg@gmail.com>, <sean.wang@kernel.org>
CC: <srv_heupstream@mediatek.com>, <zhiyong.tao@mediatek.com>,
 <hui.liu@mediatek.com>, <eddie.huang@mediatek.com>,
 <light.hsieh@mediatek.com>, <biao.huang@mediatek.com>,
 <hongzhou.yang@mediatek.com>, <sean.wang@mediatek.com>,
 <seiya.wang@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>
Subject: [PATCH v10 1/2] dt-bindings: pinctrl: mt8195: add rsel define
Date: Sat, 10 Jul 2021 16:17:21 +0800
Message-ID: <20210710081722.1828-2-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210710081722.1828-1-zhiyong.tao@mediatek.com>
References: <20210710081722.1828-1-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210710_011735_356370_72E3E8D1 
X-CRM114-Status: UNSURE (   8.08  )
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

This patch adds rsel define for mt8195.

Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
---
 include/dt-bindings/pinctrl/mt65xx.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/dt-bindings/pinctrl/mt65xx.h b/include/dt-bindings/pinctrl/mt65xx.h
index 7e16e58fe1f7..f5934abcd1bd 100644
--- a/include/dt-bindings/pinctrl/mt65xx.h
+++ b/include/dt-bindings/pinctrl/mt65xx.h
@@ -16,6 +16,15 @@
 #define MTK_PUPD_SET_R1R0_10 102
 #define MTK_PUPD_SET_R1R0_11 103
 
+#define MTK_PULL_SET_RSEL_000  200
+#define MTK_PULL_SET_RSEL_001  201
+#define MTK_PULL_SET_RSEL_010  202
+#define MTK_PULL_SET_RSEL_011  203
+#define MTK_PULL_SET_RSEL_100  204
+#define MTK_PULL_SET_RSEL_101  205
+#define MTK_PULL_SET_RSEL_110  206
+#define MTK_PULL_SET_RSEL_111  207
+
 #define MTK_DRIVE_2mA  2
 #define MTK_DRIVE_4mA  4
 #define MTK_DRIVE_6mA  6
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
