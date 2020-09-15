Return-Path: <SRS0=MDtk=CY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88E72C433E2
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 17:36:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0008120678
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 17:36:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xU1OiJTn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FaDdYcrR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0008120678
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3PJRMXalp2pwXD0sb5Bo21YEsnnI1Nil+B8bNzi+SGs=; b=xU1OiJTnVmUvElDux2AMBaRm/H
	cFiEWo2/FCLaHhYS2Xg0Jv6Ky4chPESWg6u8QeDqoV0iuul/lQeX1IWxHdVJosTv9667xE5lvuNLm
	TgvcMiUHIpfgW9BtmuDq+rzfJUIePnnapqWV1oyuDuNVCfD1naNj0F6Ct6UH5GW5VSrw13jpwTxvL
	mvYAgXffaxhUBa7G5fDEZW25en0yjoqaubu91T2bKcpO4XCjQK2LDsIgz1MmZAi/NDlJsV9RZVoxv
	p8KmQs0w0ELb7iUQ4sflzbT5vkbtJuaAwbop8ifs0HQUz4o0Xpnq7NMH3FIP8+R9PpTliAAONBEhS
	PXxKJqKQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIEsk-0003mP-VX; Tue, 15 Sep 2020 17:36:43 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIEsP-0003fT-CF; Tue, 15 Sep 2020 17:36:22 +0000
Received: by mail-pf1-x442.google.com with SMTP id c196so2396899pfc.0;
 Tue, 15 Sep 2020 10:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=9+aE1ELAzgYKqHHzeFiypxalT4hgfY/xIUQkiDN+va0=;
 b=FaDdYcrR0aifpyTmq+TIfvqHdxcsTDpOBU2FMOsc7dG9l61ku8FivcMgAUhnQW2hA4
 xmkubi7hfP5sUbH7Nu9St0cci4gzseHoNbijYT17Z4dr5E/6nQlUgouOFY4sx6RnvT7r
 yHJCm3Ktc9iGTRKcxGV58f5zFF5JbGBzRzlBJw6SwF7DoebbS+7uUVPhQQmDKGIdZErY
 +GflYC0nMP5p4Wvrp+n6kYVoFaBnA5ATDPSRKiuxHOm3eW4qWgbj/424Q8mab6T//7YD
 ccxT3VztIFFl9+e94on1Rd/zS9DMp8WJSbVUStASPhbKsQu7+GPdIMLnoWJYfPPSp2Tq
 QoKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=9+aE1ELAzgYKqHHzeFiypxalT4hgfY/xIUQkiDN+va0=;
 b=d9W+f2i/4IKJgdXz7h/3/uAaNmxnLfj4ejab9FdiKqqcNO51nDGqxWmeuSxG6z/D7W
 D5UpZqtTr2cl0jH36CVtbK1t8vksHmx29ObQwAbkDLsTqC/oBpxnjl7jwQvAy1PlFnFy
 x5hqLXvmXdcd5oQRHhOpZJ9h7HNopN0EjrPDFR+lUC2TsFILGFEupOXpUu56FLFEMpn+
 V10eHwRAlpAOgYqCh3xmUyZPUwnMy1U+AoFoSlKqAH0aYapkVIiWD1S4081YIKn7Vvxh
 Rr7dIf0wPpGOmdCf/0Ih9bKOU3ch+kvMlBjjqyacjPMX0m1EvVLhQpnGz4pbqoaTCNin
 WpeQ==
X-Gm-Message-State: AOAM532lMoWCD7mrkitIpgH4KmCFWp3qFUiFNxrRUuQ2g8p0YqE2/pRW
 hupOcX0Xd+DspHMfQxT//m8=
X-Google-Smtp-Source: ABdhPJxVyXSCl2RPLvVB5n4rRYLsOtrFkc1vvGg0hXwSIaOeSQ0tF5wwWOR83BrjvzlI+LzXUrVe2w==
X-Received: by 2002:a63:4559:: with SMTP id u25mr15052932pgk.162.1600191378923; 
 Tue, 15 Sep 2020 10:36:18 -0700 (PDT)
Received: from localhost.localdomain ([123.110.251.138])
 by smtp.gmail.com with ESMTPSA id x3sm14025926pfq.49.2020.09.15.10.36.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 15 Sep 2020 10:36:18 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: jic23@kernel.org,
	matthias.bgg@gmail.com
Subject: [PATCH v4 1/3] dt-bindings: iio: adc: add bindings doc for MT6360 ADC
Date: Wed, 16 Sep 2020 01:36:07 +0800
Message-Id: <1600191369-28040-2-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600191369-28040-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1600191369-28040-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_133621_507363_A5D9DEAB 
X-CRM114-Status: GOOD (  14.87  )
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
Cc: gene_chen@richtek.com, lars@metafoo.de, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com, benjamin.chao@mediatek.com,
 linux-mediatek@lists.infradead.org, pmeerw@pmeerw.net, knaack.h@gmx.de,
 Wilma.Wu@mediatek.com, linux-arm-kernel@lists.infradead.org,
 shufan_lee@richtek.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Gene Chen <gene_chen@richtek.com>

This change adds the binding doc for the MT6360 ADC.

Signed-off-by: Gene Chen <gene_chen@richtek.com>
---
 .../bindings/iio/adc/mediatek,mt6360.yaml          | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/mediatek,mt6360.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/mediatek,mt6360.yaml b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6360.yaml
new file mode 100644
index 0000000..2fa2fe7
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6360.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/mediatek,mt6360.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek MT6360 and similar ADCs
+
+maintainers:
+  - Gene Chen <gene_chen@richtek.com>
+
+description: |
+  Family of simple ADCs with i2c interface and internal references.
+
+properties:
+  compatible:
+    const: mediatek,mt6360-adc
+
+  "#io-channel-cells":
+    const: 1
+
+required:
+  - compatible
+  - "#io-channel-cells"
+
+examples:
+  - |
+    adc {
+      compatible = "mediatek,mt6360-adc";
+      #io-channel-cells = <1>;
+    };
+...
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
