Return-Path: <SRS0=ob7z=MH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A770C5CFC2
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 17:40:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45E6960FEB
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 17:40:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45E6960FEB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C4EHYJmwtEITd77G+fDvbQmYgCahY8f13cd4U0P4d4s=; b=msvzQlHkz3SPmB
	ct06uwNS+JCfCOMipfUCDZqxn3mES4EFauS8BOWPkpyfQN9gYKrZsQDQ2BXu1bDxXtjblPKDpSkUj
	roFCc6MybgsNqL+h5TQ9CW9gNfYcgqlJcgcdai6nZJV53ZMBzN1V3TT4+UAn64kWCmpNcpS8xZuCj
	4N+4e+/FpThtX2wNbICfDG8qgUhjulJnmYoZF1HtqJI9xfwY/r/WoTQyV4Gk1PaInntqW4AGQsN6X
	xtCKLm0k2Hp+JdpTo8egHpXtDlZPW42QkY44Ji9UCV36dBHUY7fnI602PPlFA7ZDxql01cRzobQVX
	yrG/06XO5xEQ38ZFcORA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m45LX-001no2-Qu; Thu, 15 Jul 2021 17:40:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m45JN-001mrD-TX; Thu, 15 Jul 2021 17:38:15 +0000
X-UUID: a4d49502594044d4bbedc8c5f919a556-20210715
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=6rEl/oU/9aQV8BvCPFKaiTDNwkUjrNvD0Z/Ar0JKSqU=; 
 b=sbe4hKtJ/s7TIXBAvPhcZC3QQinr7ikGirk7mZ1+rdp77FuvrSnbyxkegcAJgR+k1YoLB5f71AVaE07kQYS4jQjp0luXiVwKiy/OsxtAbxgZ0Ggeaa87hH92WB+3Q9NmFO1Y4p+BgIO1n3t51eeoPJQzZI70VcJs9t2RIfZoBKM=;
X-UUID: a4d49502594044d4bbedc8c5f919a556-20210715
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 212749975; Thu, 15 Jul 2021 10:38:08 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Jul 2021 10:38:07 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 16 Jul 2021 01:37:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 16 Jul 2021 01:37:52 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>
CC: <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <fshao@google.com>,
 <jason-jh.lin@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>
Subject: [PATCH v3 03/12] dt-bindings: mediatek: display: add MERGE additional
 description
Date: Fri, 16 Jul 2021 01:37:41 +0800
Message-ID: <20210715173750.10852-4-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210715173750.10852-1-jason-jh.lin@mediatek.com>
References: <20210715173750.10852-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210715_103813_995474_CA8123E4 
X-CRM114-Status: GOOD (  11.83  )
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

1. clock drivers of MERGE
   The MERGE controller may have 2 clock inputs.
   The second clock of MERGE is async clock which is controlling
   the async buffer between MERGE and other display function blocks.

2. MERGE fifo settings enable
   The setting of merge fifo is mainly provided for the display
   latency buffer. To ensure that the back-end panel display data
   will not be underrun, a little more data is needed in the fifo.
   According to the merge fifo settings, when the water level is
   detected to be insufficient, it will trigger RDMA sending
   ultra and preulra command to SMI to speed up the data rate.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
 .../bindings/display/mediatek/mediatek,disp.yaml     | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.yaml
index 910bb9ce61d6..8beeb9c3c057 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.yaml
@@ -237,6 +237,9 @@ properties:
     description: clock drivers
       See Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
       For most function blocks this is just a single clock input.
+      The MERGE controller may have 2 clock inputs. The second clock of MERGE is async clock,
+      which is controlling the synchronous process between MERGE and other display function
+      blocks cross clock domain.
       Only the DSI and DPI controller nodes have multiple clock inputs. These are documented
       in mediatek,dsi.txt and mediatek,dpi.yaml, respectively.
       An exception is that the mt8183 mutex is always free running with no clocks property.
@@ -270,6 +273,15 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32
     enum: [8*1024, 5*1024, 2*1024]
 
+  mediatek,merge-fifo-en:
+    description: MERGE fifo settings enable
+      The setting of merge fifo is mainly provided for the display latency buffer.
+      To ensure that the back-end panel display data will not be underrun,
+      a little more data is needed in the fifo. According to the merge fifo settings,
+      when the water level is detected to be insufficient, it will trigger RDMA sending
+      ultra and preulra command to SMI to speed up the data rate.
+    type: boolean
+
   power-domains:
     description: A phandle and PM domain specifier as defined by bindings of
       the power controller specified by phandle. See
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
