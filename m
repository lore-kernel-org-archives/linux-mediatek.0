Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAC96CAC5A5
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Sep 2025 16:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fflFUJ8qQbNaxRKBEyO0cvPh290inuRrjenYXN7UmxA=; b=dBeNKbicMSUJe1A0TFtTB8qv5T
	rpInKCSZopo8nNf/L02kYl2XNQ3sLip+l0ExfxgarbAHYIO7CwpTySOCh5hHnlvcFXzwRqnZ0473W
	ZDr1Kze3fQb5vNrm/NGp0aON+Nm/G9QgNb8f1oj1okQyTtciFuxeFYK99j1Th8z8TXMJaCvdjxeEh
	5E7n6/uUxWwqfPSVHZF1sdUSeAmaBlZfJqPD01q+DaopwZduEVSHGUYj8RD5M/B5hB0bsoW9fLMP9
	37D3TkbM1hdzelqqB+ZPG0X6pJyhpKecndx0OWseGvELtMtUkEX2aQBe8Ly/HmHn+Ixf1G0jCRT+N
	CtWFHUjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v00Or-00000005c6q-4BKx;
	Sat, 20 Sep 2025 16:25:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v00ON-00000005bes-1JiO;
	Sat, 20 Sep 2025 16:24:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AE4BB44CF6;
	Sat, 20 Sep 2025 16:24:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8FEDAC19421;
	Sat, 20 Sep 2025 16:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758385493;
	bh=toiotQoCuOHY3r8fjBEqFvdcaLzdfuNUoadqTtlC8VA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=f+AJHisYqErkJVCDWtIJ4urc/elhs9aKb6QExunwVTxnJVjUW21aX7uilFGGiKz2D
	 Ed76aB+KHrOgMBIdBQUw1jyiFP46x8GjHW5npw+F4bv8UMVih8R+uYxcaMEOyEnWvD
	 BjXOdbSRSOAy84R6Z1KACFYMAOzHJREDbtu89l9JfNg/2H5IZdQLwXxM1aAmdmdlpz
	 B+5PnpT7HPyIgUAEXDyYyCsWO9OcnZVELEBs8B8pYhfjNEPdl5q0J/CQ95UiJ/dAmo
	 xoi6czTzjruSWN+GGMqXCaqMuPgxeLpDwMA9ICaoQL4R9dMpL+sbciBR/rGTWYQjQC
	 DnZZMsWUPGAUg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88419CAC5AD;
	Sat, 20 Sep 2025 16:24:53 +0000 (UTC)
From: Cristian Cozzolino via B4 Relay <devnull+cristian_ci.protonmail.com@kernel.org>
Date: Sat, 20 Sep 2025 20:23:34 +0200
Subject: [PATCH 09/10] dt-bindings: arm: mediatek: Add MT6582 yarisxl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250920-mt6582-v1-9-b887720f577d@protonmail.com>
References: <20250920-mt6582-v1-0-b887720f577d@protonmail.com>
In-Reply-To: <20250920-mt6582-v1-0-b887720f577d@protonmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 phone-devel@vger.kernel.org, 
 Cristian Cozzolino <cristian_ci@protonmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758392693; l=847;
 i=cristian_ci@protonmail.com; s=20250620; h=from:subject:message-id;
 bh=8QNDDRlIA0pWOB1+uvCR+bTE1fSSumhUEQ1GcGuja2s=;
 b=ecd6hSS6PNAV3+HGWu4LFm6ykdQjzGl4ilAIbSH3jsNcyh3dQc/hX/W9+goC+OpIwSEe4pPnm
 1wQFm/810XYBviG/VAjn3Fo3MgoMSoj7QP1agb12YM4DYkdCN2SAd7z
X-Developer-Key: i=cristian_ci@protonmail.com; a=ed25519;
 pk=xH5IvIPUNHV1Q8R0/pq2CfuVFR/wTiAyuyi6IwedjZY=
X-Endpoint-Received: by B4 Relay for cristian_ci@protonmail.com/20250620
 with auth_id=438
X-Original-From: Cristian Cozzolino <cristian_ci@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_092455_409931_2D243E2B 
X-CRM114-Status: UNSURE (   8.06  )
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
Reply-To: cristian_ci@protonmail.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Cristian Cozzolino <cristian_ci@protonmail.com>

Add an entry for Alcatel Pop C7 (OT-7041D) smartphone board, named
yarisxl, based on MT6582 SoC.

Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index f04277873694880d14d78acd39b6c9725394c2f2..5dce019cc998fb7498d7ce60afedb46011fff345 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -38,6 +38,7 @@ properties:
           - const: mediatek,mt6580
       - items:
           - enum:
+              - alcatel,yarisxl
               - prestigio,pmt5008-3g
           - const: mediatek,mt6582
       - items:

-- 
2.49.0



