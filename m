Return-Path: <SRS0=Uf5e=NV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A368DC432BE
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Aug 2021 00:37:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67EB560F42
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Aug 2021 00:37:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 67EB560F42
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sACqdIOlerdvY31EgX8qga2mHjJJaqQ7VlHJDrK9liU=; b=yEfYQLvPQ+nrer
	VlbMHM0T95PZpB5Uhhly3MPWK7FmQiJPvOOEtkT+NU2M1hlRbWFdrcsBauyHFi1+iCpaOfC1hamzr
	tIGtoUKJ/JF1t1NKJFDvfiVqIPTY4KST19L4bTn4Z+b+O2y8SahNHQtwQIMeqLkwgUkQT2VcDqzoz
	CNT3qRAjBCeKfmaZRfQNeXrNfzdHiF9Dp/eUkw1RzFg3UCC9CAG7Cc7F60a7hR/Nxn6D1Dqj1i6h/
	xZT6H8wk1Ab+iZ0LHTvzoAqxBOoWzvoopbkHHCHohB1ZhkAKiR7h1X+04qogPISXmbXImikvP3LcQ
	6RR3OZsgVf6ft/RDiwWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKVI8-00GBGZ-7F; Mon, 30 Aug 2021 00:36:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKVHf-00GB6r-LW; Mon, 30 Aug 2021 00:36:23 +0000
X-UUID: 5b6d7a32771a4698aa39ce7eafc666d3-20210829
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=zLMgc9QTJoJLmCdEsmLXyX18f9hP7nFOvEHChE2Fx/s=; 
 b=b/5JnUzrNUPbnzYahCVbehEAJbzcTHxcyW9dEcR5ysVVqHzQH4KijNbMGVGMvdCjyWF4ZM9fnOdXyM7VWAWJdja40d2Av/QV1UUL1vez5i0j5fEJYi2KZp5ZFIh/rdI0/Cumu+tfk+8J5o5jJB12ADEsHO0Ju5ykUCJoQ8BTnKo=;
X-UUID: 5b6d7a32771a4698aa39ce7eafc666d3-20210829
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 740886761; Sun, 29 Aug 2021 17:36:16 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 29 Aug 2021 17:36:15 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 30 Aug 2021 08:36:14 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 30 Aug 2021 08:36:14 +0800
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
Subject: [PATCH v11 2/4] dt-bindings: pinctrl: mt8195: change pull up/down
 description
Date: Mon, 30 Aug 2021 08:36:01 +0800
Message-ID: <20210830003603.31864-3-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210830003603.31864-1-zhiyong.tao@mediatek.com>
References: <20210830003603.31864-1-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210829_173619_735656_57047F81 
X-CRM114-Status: GOOD (  10.07  )
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

Change pull up/down description

Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
---
 .../bindings/pinctrl/pinctrl-mt8195.yaml      | 32 +++++++++++++++++--
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
index 2f12ec59eee5..a341ed9f0095 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
@@ -85,9 +85,35 @@ patternProperties:
           2/4/6/8/10/12/14/16mA in mt8195.
         enum: [0, 1, 2, 3, 4, 5, 6, 7]
 
-      bias-pull-down: true
-
-      bias-pull-up: true
+      bias-pull-down:
+        description: |
+          For pull down type is normal, it don't need add RSEL & R1R0 define
+          and resistance value.
+          For pull down type is PUPD/R0/R1 type, it can add R1R0 define to
+          set different resistance. It can support "MTK_PUPD_SET_R1R0_00" &
+          "MTK_PUPD_SET_R1R0_01" & "MTK_PUPD_SET_R1R0_10" & "MTK_PUPD_SET_R1R0_11"
+          define in mt8195.
+          For pull down type is RSEL, it can add RSEL define & resistance value(ohm)
+          to set different resistance. It can support "MTK_PULL_SET_RSEL_000" &
+          "MTK_PULL_SET_RSEL_001" & "MTK_PULL_SET_RSEL_010" & "MTK_PULL_SET_RSEL_011" &
+          "MTK_PULL_SET_RSEL_100" & "MTK_PULL_SET_RSEL_101" & "MTK_PULL_SET_RSEL_110" &
+          "MTK_PULL_SET_RSEL_111" define in mt8195. It can also support resistance value(ohm)
+          "75000" & "5000" in mt8195.
+
+      bias-pull-up:
+        description: |
+          For pull up type is normal, it don't need add RSEL & R1R0 define
+          and resistance value.
+          For pull up type is PUPD/R0/R1 type, it can add R1R0 define to
+          set different resistance. It can support "MTK_PUPD_SET_R1R0_00" &
+          "MTK_PUPD_SET_R1R0_01" & "MTK_PUPD_SET_R1R0_10" & "MTK_PUPD_SET_R1R0_11"
+          define in mt8195.
+          For pull up type is RSEL, it can add RSEL define & resistance value(ohm)
+          to set different resistance. It can support "MTK_PULL_SET_RSEL_000" &
+          "MTK_PULL_SET_RSEL_001" & "MTK_PULL_SET_RSEL_010" & "MTK_PULL_SET_RSEL_011" &
+          "MTK_PULL_SET_RSEL_100" & "MTK_PULL_SET_RSEL_101" & "MTK_PULL_SET_RSEL_110" &
+          "MTK_PULL_SET_RSEL_111" define in mt8195. It can also support resistance value(ohm)
+          "1000" & "1500" & "2000" & "3000" & "4000" & "5000" & "10000" & "75000" in mt8195.
 
       bias-disable: true
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
