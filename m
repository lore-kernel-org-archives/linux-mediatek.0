Return-Path: <SRS0=tGyr=OO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 336F9C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Sep 2021 08:17:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED30A61039
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Sep 2021 08:17:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ED30A61039
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7vwSmb+u1AqsxcltorNBsCZ2SmTzaDcJcawD3Zm9V54=; b=vctDHNUnr2hTkn
	0hXhh9I1ohe7jnpy1g/L8a5YkRMuTlG0/D3ZwzU4wbZT+cFLJ8stcJ4FoIjTuYs3Equ5rhWWzS0fV
	+V4fiI4CJhjc9GniOcngliPvwSY0614JIZ6Tua6VZT6R12134l9DL2TmDERUFhtRRlwFpM8UQPP64
	EgV/4M1E9NBnVEStc3AIt8tREMCq3qky43arhMeA465jZPRTaz9Z/W0Wjad05taz1sSF49tkesGS6
	jyP8yRR13J4nm7LKdec7+cHY7K71W+b2eGS0JHVNclYuzqnS4gsygra+doy4slAIVOymHSpe56QCd
	B7Lix9vxABlyBNT8zGYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTgOD-00DTUt-4q; Fri, 24 Sep 2021 08:17:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTgNy-00DTRz-Fg; Fri, 24 Sep 2021 08:16:47 +0000
X-UUID: ca9c336b773247bb831ad1e1ba23a471-20210924
X-UUID: ca9c336b773247bb831ad1e1ba23a471-20210924
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 210518024; Fri, 24 Sep 2021 01:16:43 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 24 Sep 2021 01:06:47 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 24 Sep 2021 16:06:45 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 24 Sep 2021 16:06:44 +0800
From: Zhiyong Tao <zhiyong.tao@mediatek.com>
To: <robh+dt@kernel.org>, <linus.walleij@linaro.org>, <mark.rutland@arm.com>, 
 <matthias.bgg@gmail.com>, <sean.wang@kernel.org>
CC: <srv_heupstream@mediatek.com>, <zhiyong.tao@mediatek.com>,
 <hui.liu@mediatek.com>, <light.hsieh@mediatek.com>,
 <biao.huang@mediatek.com>, <hongzhou.yang@mediatek.com>,
 <sean.wang@mediatek.com>, <seiya.wang@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-gpio@vger.kernel.org>, Rob Herring <robh@kernel.org>
Subject: [PATCH v14 1/5] dt-bindings: pinctrl: mt8195: add rsel define
Date: Fri, 24 Sep 2021 16:06:28 +0800
Message-ID: <20210924080632.28410-2-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924080632.28410-1-zhiyong.tao@mediatek.com>
References: <20210924080632.28410-1-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210924_011646_557596_BF74DC64 
X-CRM114-Status: UNSURE (   8.63  )
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
Acked-by: Rob Herring <robh@kernel.org>
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
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
