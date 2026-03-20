Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE47108B8E2
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Mar 2026 09:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=adEsW4WDO6/yYr4EE9AOtjTKebHalCyQ0oy6UHL4ksw=; b=4f2HDICW+3a0REteD/AYvNZaZL
	5vwYRxZxuc/QkGfpnCx7dzja3T/7GzrZ6HYyTZPd6XfW7AFoTPODQMp3pnML4k5uKw1et64twgG+K
	lxnwpskLt7rLX3iXx8R13uJUqes0SJxD/cOW2qpVVXaw5R9Ub+3fsQeYQVziA1XdoTU1MhJM+bAKD
	NX8CXuWRQRTGZpSeH09vhq06eMZ6Cjfm6obfyrDy5AtD+MTWeWKPt6rafR+RNsjOK5G94/bzzZ4DC
	FoK+rNglyVcBE47jK5Qxk4I1SxykMZijmxrnHStnJKaMaHrr9KVWY42rpETNFohKpX2xj/lVWCcZU
	Vtq21SCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3WNS-0000000CVNi-33aE;
	Fri, 20 Mar 2026 09:42:46 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3WNR-0000000CVNO-2hhm
	for linux-mediatek@bombadil.infradead.org;
	Fri, 20 Mar 2026 09:42:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=adEsW4WDO6/yYr4EE9AOtjTKebHalCyQ0oy6UHL4ksw=; b=K7nhhgGeWbEw66tfIYxvAArvB3
	cUW0b8SPMoOUQMNg+/y929qmvX1N+coxT1DV3ePKED9M/tx0tRbhjoKwJr9TmdwDizXMSawcda01h
	rxv7Lv4tJBnZnQq8/GK4LpVXAUuTn8pmQR1YoaJdurSfKfoWrya7kEGQjZZrk/ig6oBxZ0HgStY6g
	YcCsRLt494YT/pIYvuNAeo9VuhRRPckf/mqQO+AuCJIM0OCzTXgbMY3xlT4bNnTyNwY83eQH9vQ6s
	8bqQb0umPB7bkttALyRxYprK1G4+TmSdUkdFDsBNc4Oy8mvcSI1BeUdJXWZ5m2HOF5ZSGaudUqRGG
	HBoWFYGQ==;
Received: from mail.cjdns.fr ([5.135.140.105])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3WNO-00000007Z3u-27qx
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Mar 2026 09:42:44 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 14831360312;
	Fri, 20 Mar 2026 10:42:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1773999746; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=adEsW4WDO6/yYr4EE9AOtjTKebHalCyQ0oy6UHL4ksw=;
	b=WEv14gnEW+Iumxr6mJNRYe5NuD2hCFp73HrAK74QfYKcBoUxNfTrPRe5qp6J/vRimdOh/L
	7MdArBoZuUFbJ6IM/3chA7Pfaz7Fo1HMQHn5JUw5odFs+voRzikvMRnNZnYAZvQX0MkhZO
	RtxY/JZQ2l/3O16UQQmtGLv63usi7nPMjhvc10zJBALA+Ze5TvebGgtm3PvSpuEnlimgFJ
	WVWCyKoDChXCu23MBiQr6VRXSpF/+FJpFhmYZnvo75F0uB0X63DjJsv7wnC4LZbywhgUSs
	CuafUgEA1+rA52h2bNZiFN/TeGwEe7kZ54wxwIY5uXvhZHCnum0UIeJfiO7CnQ==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-pci@vger.kernel.org
Cc: linux-mips@vger.kernel.org,
	naseefkm@gmail.com,
	ryder.lee@mediatek.com,
	bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ansuelsmth@gmail.com,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH v3 1/2] dt-bindings: PCI: mediatek: Add support for EcoNet EN7528
Date: Fri, 20 Mar 2026 09:42:11 +0000
Message-Id: <20260320094212.696671-2-cjd@cjdns.fr>
In-Reply-To: <20260320094212.696671-1-cjd@cjdns.fr>
References: <20260320094212.696671-1-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_094242_654140_ECA11BD9 
X-CRM114-Status: UNSURE (   6.45  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Introduce EcoNet EN7528 SoC compatible in MediaTek PCIe controller
binding.

EcoNet PCIe controller has the same configuration model as
Mediatek v2 but is initiallized more similarly to an MT7621
PCIe.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 .../bindings/pci/mediatek-pcie.yaml           | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie.yaml
index 0b8c78ec4f91..7e1b0876c291 100644
--- a/Documentation/devicetree/bindings/pci/mediatek-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/mediatek-pcie.yaml
@@ -14,6 +14,7 @@ properties:
     oneOf:
       - enum:
           - airoha,an7583-pcie
+          - econet,en7528-pcie
           - mediatek,mt2712-pcie
           - mediatek,mt7622-pcie
           - mediatek,mt7629-pcie
@@ -226,6 +227,31 @@ allOf:
 
         mediatek,pbus-csr: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: econet,en7528-pcie
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+
+        clock-names:
+          maxItems: 1
+
+        reset: false
+
+        reset-names: false
+
+        power-domains: false
+
+        mediatek,pbus-csr: false
+
+      required:
+        - phys
+        - phy-names
+
 unevaluatedProperties: false
 
 examples:
-- 
2.39.5


