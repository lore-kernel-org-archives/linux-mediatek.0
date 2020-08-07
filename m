Return-Path: <SRS0=9FsO=BR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4D2DC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2020 02:34:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7763A2177B
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2020 02:34:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ts33jVsg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="MC/sTLyL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="bSQPwX3Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7763A2177B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QczYVrDRBc4lNDBcnrCRPnj/bq8B1C1SXrJSFSZU2ec=; b=ts33jVsgAyZPq8vDw7NFrfi1r
	0dHlAFNpA67LzqLqaG2/hZWiT80v5irz/Z89o88eeb628F+IgcheoNLBvVAZEPHS6x9DQYECEFuR4
	8xOWF/18dihG9XUof5itjE6AJwxdWoXaacZcR71ZOxdCsS3iAfJrlahMqLKLglq+AYmQVK96hZznm
	UoXksSSQu7qeZA+FhQHKv7JCgwwPhY5bY3wnXMPg13Yij+AflMJBHNM8z1kMb9IV4ciBfEwc1dYYB
	6ks1CULXpRW78/4+slAcm6iHonB7zUf6PYtInfd1GeI5fpd0HSPWaUyFhN7G5ggMHy/N5+T9qCiQt
	zo+ExB1KA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3sD5-0000Zl-GV; Fri, 07 Aug 2020 02:34:19 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3sD2-0000Z0-AU; Fri, 07 Aug 2020 02:34:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=2RA0I88lr0d0hGwKF//MrgxKAUGZdVtcyAh7Z0um5Ig=; b=MC/sTLyL2ikz670+JqBuu+gUcL
 F3Q9Pvoqxlq7ReX2kgY9PdlnhzhjD1GStlNtntHF4V3bKE+ct1Md8oNo13+oXurhBe/GvHtNsqUEf
 teWw4B6b8Qsc/Hl/UrYNbbfJqorYR4KPUP3azM8kQncgEgNVJgIH6cisGBWS4CuEzPhJqJbA1BSA2
 7DuyQX/NeJCINirRs798ZZYwx7OzXHyWfEhAG5GmcrQsp58zm+BuOuSz+6dosIufmfuzksBLOZdrG
 f9Mi42A3uZqtZPnjMO67luiL6MASR5ZgsSWQN3og0sadZvHQUIe7J1vIdWrhgKwyzGPSiF2C8RSv+
 m8OoCmvA==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3sCy-0006bR-J2; Fri, 07 Aug 2020 02:34:15 +0000
X-UUID: 52402fabfc994725bdff4799b401b84c-20200806
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=2RA0I88lr0d0hGwKF//MrgxKAUGZdVtcyAh7Z0um5Ig=; 
 b=bSQPwX3YwHHfu6w+JntOF7IjPxfTOk2KUcqZwb/t5P4qK7qLO8zvd6S2IVrBH48u5uvGL9SH18JjOK5NWY4bmzWE6YWKlHBCBa+/9xMeQ23WO3rDlGqCPOzbhc8xwuM5FBjbwm4lATqldq24NIEhVFTbKhbr+Ehs0JxwqkWfvAQ=;
X-UUID: 52402fabfc994725bdff4799b401b84c-20200806
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <neal.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1692955778; Thu, 06 Aug 2020 18:32:33 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 Aug 2020 19:22:32 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 7 Aug 2020 10:22:29 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 7 Aug 2020 10:22:29 +0800
From: Neal Liu <neal.liu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v5 1/2] dt-bindings: devapc: add bindings for mtk-devapc
Date: Fri, 7 Aug 2020 10:22:27 +0800
Message-ID: <1596766948-29767-2-git-send-email-neal.liu@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1596766948-29767-1-git-send-email-neal.liu@mediatek.com>
References: <1596766948-29767-1-git-send-email-neal.liu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 663649B994C2112320BBB7D16ACB11D475D2A51A1B91E389F6AA87C6DCA507042000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200807_033413_178148_337F512E 
X-CRM114-Status: GOOD (  13.56  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 lkml <linux-kernel@vger.kernel.org>, linux-mediatek@lists.infradead.org,
 Neal Liu <neal.liu@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add bindings for mtk-devapc.

Signed-off-by: Neal Liu <neal.liu@mediatek.com>
---
 .../devicetree/bindings/soc/mediatek/devapc.yaml   |   58 ++++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/devapc.yaml

diff --git a/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml b/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
new file mode 100644
index 0000000..6c763f8
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# # Copyright 2020 MediaTek Inc.
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/soc/mediatek/devapc.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: MediaTek Device Access Permission Control driver
+
+description: |
+  MediaTek bus fabric provides TrustZone security support and data
+  protection to prevent slaves from being accessed by unexpected masters.
+  The security violation is logged and sent to the processor for further
+  analysis and countermeasures.
+
+maintainers:
+  - Neal Liu <neal.liu@mediatek.com>
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt6779-devapc
+
+  reg:
+    description: The base address of devapc register bank
+    maxItems: 1
+
+  interrupts:
+    description: A single interrupt specifier
+    maxItems: 1
+
+  clocks:
+    description: Contains module clock source and clock names
+    maxItems: 1
+
+  clock-names:
+    description: Names of the clocks list in clocks property
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mt6779-clk.h>
+
+    devapc: devapc@10207000 {
+      compatible = "mediatek,mt6779-devapc";
+      reg = <0x10207000 0x1000>;
+      interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_LOW>;
+      clocks = <&infracfg_ao CLK_INFRA_DEVICE_APC>;
+      clock-names = "devapc-infra-clock";
+    };
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
