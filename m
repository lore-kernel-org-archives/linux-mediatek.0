Return-Path: <SRS0=ob7z=MH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F1ACC5CFC2
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 17:39:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3EC360FEB
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 17:39:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3EC360FEB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+OvqhJQyXOmjRhH1Xn6r4+lXJTAS68LWQjAWZuB9bO4=; b=UHF4MZGiD5eXmu
	pUjdr0PlFyRQSKSYSWz2hPbpELLwV+I60oXuIbxPwY+BC53sjvE8FVaVP1F3+xGhhK6wbpQZLYbrv
	UcbO9tKKD/q4l+3bN7MZQCaPx+ZrUANWMUqL4PfJI0qmKXc4v0f9WfigNQclKt96waT/5at1d+MZk
	lgvXGA6XP/5pUajYI0pWaBZT6ZdIfTs5oKEmahScSIx1DHnHEhbikKp/USeyG9LwOzwN9J/UPqkKz
	ExNm9vt5uoHOLNgb/mrP50RKrebgb6RLMmhGm7D0VGFFjvjVPDMyqkH6wLF1uC8lx3NL99AYRgJL4
	RU0TiDFziVXDjrKBlWAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m45Ku-001nRT-Gf; Thu, 15 Jul 2021 17:39:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m45JM-001mrD-89; Thu, 15 Jul 2021 17:38:13 +0000
X-UUID: e968caab75f6455c838efc2d6e8506a0-20210715
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Zna0lObLfRuRy7RyaAKOJ1BW6kB8ukyc1FpZVaE8Mp4=; 
 b=VrEJxzG1h6mr7O/L2cBcnrBbOvNaAU10a+YM7z5n0KpdUY2fS5atnZru6FbhQMDvFZxJfdud7o41JMe2q3/i0ObhfkQoGdOMNPhLIVxOmvfyqByGQncEso+PrAOH1zrc8HgWknVhcqgm3DR8JGQmBxbYtiEIUSSGZfSqkMdpnLM=;
X-UUID: e968caab75f6455c838efc2d6e8506a0-20210715
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1370075439; Thu, 15 Jul 2021 10:38:02 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Jul 2021 10:38:01 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 16 Jul 2021 01:37:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 16 Jul 2021 01:37:53 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>
CC: <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <fshao@google.com>,
 <jason-jh.lin@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>
Subject: [PATCH v3 06/12] dt-bindings: arm: mediatek: add definition for
 mt8195 mmsys
Date: Fri, 16 Jul 2021 01:37:44 +0800
Message-ID: <20210715173750.10852-7-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210715173750.10852-1-jason-jh.lin@mediatek.com>
References: <20210715173750.10852-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210715_103812_365066_CA614603 
X-CRM114-Status: UNSURE (   9.07  )
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

There are 2 display hardware path in mt8195, namely vdosys0 and
vdosys1, so add their definition in mtk-mmsys documentation.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
 .../bindings/arm/mediatek/mediatek,mmsys.yaml | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
index ea31c7c2792c..e6cd6e2173d4 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
@@ -66,6 +66,16 @@ properties:
               - mediatek,mt8192-mmsys
           - enum:
               - syscon
+      - items:
+          - enum:
+              - mediatek,mt8195-vdosys0
+          - enum:
+              - syscon
+      - items:
+          - enum:
+              - mediatek,mt8195-vdosys1
+          - enum:
+              - syscon
 
   reg:
     maxItems: 1
@@ -99,4 +109,18 @@ examples:
         #clock-cells = <1>;
     };
 
+    vdosys0: syscon@1c01a000 {
+        compatible = "mediatek,mt8195-vdosys0", "syscon";
+        reg = <0 0x1c01a000 0 0x1000>;
+        #clock-cells = <1>;
+        mboxes = <&gce1 0 CMDQ_THR_PRIO_4>;
+    };
+
+    vdosys1: syscon@1c100000 {
+        compatible = "mediatek,mt8195-vdosys1", "syscon";
+        reg = <0 0x1c100000 0 0x1000>;
+        #clock-cells = <1>;
+        mboxes = <&gce1 1 CMDQ_THR_PRIO_4>;
+    };
+
 ...
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
