Return-Path: <SRS0=bJmk=MY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D509C4338F
	for <linux-mediatek@archiver.kernel.org>; Sun,  1 Aug 2021 04:06:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64C6B60F9D
	for <linux-mediatek@archiver.kernel.org>; Sun,  1 Aug 2021 04:06:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 64C6B60F9D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kVmC5R3Z0r71PmoNgRLwTwI4UmxeiAZdqoNeS0aOIDQ=; b=VaG2Vda5qaDSZl
	IhqpQnkdENhOmn2qRPdiuRdOpsC8Iv8mS8Vg4b6erlXmkjRIyG2XjxourkqJ0JpYyF98ANLwLR7eY
	jRt8ENGMPX7dN9jQXpT1NHfeR0Y2JhJ1y3xpxi8M2THg877SvDSQeiLN91PGm07sJoTmINIZ/LyP4
	ajgOKZHNBgz/1+rBbxUlnpAn4izE7MAAj2TqUVfn/AIttNGwxnpQ+9wlrAD9Cyp2Z8nUYpQLUGrUL
	L4diDbVafuODagSstGNTDbdJBHrYMzOWqkS0kT6OhG0s3/hIM6oB+wr/lFIy4Ybp2YS3lxjxEJPPZ
	6y6z3tOD6m8Iqhui1vRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mA2kP-00Cnal-7S; Sun, 01 Aug 2021 04:06:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mA2k2-00CnW3-Dm; Sun, 01 Aug 2021 04:06:23 +0000
X-UUID: d876deb8c17749728899e04399dde261-20210731
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=tVl842wftAnMAO9fwQ64B34pCPAJw05tuHgSke2JKe4=; 
 b=dbzLUR83Ce9VLmSPaj6VG0DZdllOSrqsZH7ZbtX27GSfLFJvNpabx8MVSceOqjQPgjj+WVQ3qBLto6kGQaUps13pnY0qRlv1yJH9sr7a4jzagEc6xOgSvr/MSmBhY7djcFCATedXeGK5qeEwJXSWm/Jp72AXTdBL+7oXOHDf+WI=;
X-UUID: d876deb8c17749728899e04399dde261-20210731
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 243653215; Sat, 31 Jul 2021 21:06:18 -0700
Received: from MTKMBS33N1.mediatek.inc (172.27.4.75) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 31 Jul 2021 21:06:17 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sun, 1 Aug 2021 12:06:14 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Sun, 1 Aug 2021 12:06:13 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC: <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <ck.hu@mediatek.com>,
 <stonea168@163.com>, <huijuan.xie@mediatek.com>, <rex-bc.chen@mediatek.com>,
 <shuijing.li@mediatek.com>, <robh+dt@kernel.org>,
 <devicetree@vger.kernel.org>, Jitao Shi <jitao.shi@mediatek.com>
Subject: [PATCH v4 2/2] dt-bindings: mediatek: add force_dsi_end_without_null
Date: Sun, 1 Aug 2021 12:05:44 +0800
Message-ID: <20210801040544.104135-2-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210801040544.104135-1-jitao.shi@mediatek.com>
References: <20210801040544.104135-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 274FAD2CEAB345486A9ACF4D6C3725599FB588F1E24F37B11444DDF0626652F32000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210731_210622_512521_8370D538 
X-CRM114-Status: UNSURE (   8.90  )
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

The force_dsi_end_without_null requires the dsi host ent at
the same time in line.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 .../bindings/display/bridge/analogix,anx7625.yaml           | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
index ab48ab2f4240..8b868a6a3d60 100644
--- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
@@ -43,6 +43,11 @@ properties:
   vdd33-supply:
     description: Regulator that provides the supply 3.3V power.
 
+  force_dsi_end_without_null:
+    description: |
+      Requires the dsi host send the dsi packets on all lanes aligned
+      at the end.
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -87,6 +92,7 @@ examples:
             vdd10-supply = <&pp1000_mipibrdg>;
             vdd18-supply = <&pp1800_mipibrdg>;
             vdd33-supply = <&pp3300_mipibrdg>;
+            force_dsi_end_without_null;
 
             ports {
                 #address-cells = <1>;
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
