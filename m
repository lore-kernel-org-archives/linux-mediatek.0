Return-Path: <SRS0=TVmU=BN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFCFEC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 08:57:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C18722070A
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 08:57:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="niESIbie";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Qbx+M2M6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C18722070A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pQ2IBT6lxMriKint+U1/1ZgJq3w3JdXcZes1O7C4bdA=; b=niESIbieBz025c0psorC8HcwM
	y1iPEa/byIjaEepVmeOE9jtmKWXh7yjY1ORHDLsrNPlhmi8bH48sz0Ul8mgtm0x+2Hlf91IZ+lYfm
	TTCTMKbZZT5vLlHrtwAlZRKkTg8G4LEVjHr3Mnjv2ngtd5ZOUWnuTJhjCiVLhPlDOrjDTOXDGqAKk
	dAowy4dVqCt6ManUHWt2DNYvdGKbVVLjhV0v3frlFfYsbu5L3I5r7wNqi9fIQvCRNLuuEJyk4mI2M
	H2D8OEhGnZfX/OoKM8Rs5+i4HJwSgQBc0Ph2RxMetm8IJpiiQpBvdJecPXjy5WcjoqL4O1v8eEQHw
	dKqm/Y3jQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2WI1-0003KW-HA; Mon, 03 Aug 2020 08:57:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2WHx-0003IU-Gq; Mon, 03 Aug 2020 08:57:46 +0000
X-UUID: 72358e28dfc146549fd7841c6cc0664d-20200803
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=fPWsFbLSz9VhS0OLeT45kMuZ4kCWME6UPnLlJF67d3Y=; 
 b=Qbx+M2M6uWZC3F69MI+vhimedN2Vthdf4CbtFLiar3B2zc+ioDYLEUNZnuMwoPJKC4apJUOJNSUQiUJSiEVspQvW4CsVqh4sHs74xaXDN72+mTjcI6hDZ9pZpKsN7oOc9Zj/5swq2eQex+xrNGkez0RDymoOOqjLxX7mIxGQ9tk=;
X-UUID: 72358e28dfc146549fd7841c6cc0664d-20200803
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1310846859; Mon, 03 Aug 2020 00:57:33 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 3 Aug 2020 01:57:38 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 3 Aug 2020 16:57:35 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 3 Aug 2020 16:57:35 +0800
From: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 2/3] regulator: bindings: Add document for MT6315 regulator
Date: Mon, 3 Aug 2020 16:57:26 +0800
Message-ID: <1596445047-2975-3-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1596445047-2975-1-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1596445047-2975-1-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_045745_737329_466C9461 
X-CRM114-Status: GOOD (  14.69  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add device tree binding information for mt6315 regulator driver.
Example bindings for mt6315 are added.

Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
---
 .../bindings/regulator/mt6315-regulator.txt        | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mt6315-regulator.txt

diff --git a/Documentation/devicetree/bindings/regulator/mt6315-regulator.txt b/Documentation/devicetree/bindings/regulator/mt6315-regulator.txt
new file mode 100644
index 0000000..1c14537
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mt6315-regulator.txt
@@ -0,0 +1,45 @@
+Mediatek MT6315 Regulator
+
+Required properties:
+- compatible: Must be one of the following.
+	"mediatek,mt6315_3-regulator"
+	"mediatek,mt6315_6-regulator"
+	"mediatek,mt6315_7-regulator"
+- reg: SPMI slave id.
+- regulators: List of regulators provided by this controller.
+  The definition for each of these nodes is defined using the standard binding
+  for regulators at Documentation/devicetree/bindings/regulator/regulator.txt.
+
+The valid names for regulators are:
+BUCK:
+  vbuck1, vbuck3, vbuck4
+
+Example:
+	mt6315_3: mt6315@3 {
+		compatible = "mediatek,mt6315_3-regulator";
+		reg = <0x3 0 0xb 1>;
+
+		mt6315_3_vbuck1: vbuck1 {
+			regulator-compatible = "vbuck1";
+			regulator-min-microvolt = <300000>;
+			regulator-max-microvolt = <1193750>;
+			regulator-enable-ramp-delay = <256>;
+			regulator-allowed-modes = <0 1 2 4>;
+		};
+
+		mt6315_3_vbuck3: vbuck3 {
+			regulator-compatible = "vbuck3";
+			regulator-min-microvolt = <300000>;
+			regulator-max-microvolt = <1193750>;
+			regulator-enable-ramp-delay = <256>;
+			regulator-allowed-modes = <0 1 2 4>;
+		};
+
+		mt6315_3_vbuck3: vbuck3 {
+			regulator-compatible = "vbuck3";
+			regulator-min-microvolt = <300000>;
+			regulator-max-microvolt = <1193750>;
+			regulator-enable-ramp-delay = <256>;
+			regulator-allowed-modes = <0 1 2 4>;
+		};
+	};
-- 
2.6.4
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
