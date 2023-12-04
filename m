Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E7CC4167B
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Dec 2023 13:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JhveuIYK06wfqt8kGf/aLwyUhsineVPuaNNzi8Qc7lo=; b=bIWx7KeKTd2AGOYTYxzQTq2jME
	OfbUCZhzrNjDZp4G2hc3+u8I+pMZGhRtNcb5HAhj1m++GAiyHnmUMbj7Ha06evRMKlujDFAYzck6H
	cTf4gDmPwjH3XjBV9QvuoJ8ggGAZ5mkYAhCmVQtvagDpFhtobo2d9SLIl+hF4RdHpfvAjKK+lgqEq
	roYY8QbvanPFLFJjQOhHLE/imdZTzy7I06cIqlRTkqwTqE98vsRLhlEN9AA3AZGhwpkgPVViH4mSH
	x6W9ivaIwlD65ru9k1+yu4S8U++v4i1PL3hojCdNYcFj2eseOj3DxQSDQMv/IwkXEi3hIKj3PFV7e
	6HCLp98A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rA9QL-004hkm-0N;
	Mon, 04 Dec 2023 13:55:49 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rA9QG-004hje-35;
	Mon, 04 Dec 2023 13:55:46 +0000
Received: from eugen-station.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ehristev)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 404936607090;
	Mon,  4 Dec 2023 13:55:41 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701698141;
	bh=rc5z0F8Kx/z+8iRI8N73XFwXfGPlHr+ZADWzQGOaWT4=;
	h=From:To:Cc:Subject:Date:From;
	b=TqzVjrnSas5WSvUk/WyXzci3l+kuks+ivbA8tf2ngWGM3LnZOW9E0g3MelxVFEvHG
	 6DTBe67rrHQlL0/ux/IPu8+V2gTfW0ukIAxod1BI9BB9iKxYRjHADM+aJN33wSp8pu
	 Qc2IKgX1oIS98mxVi+7joP9GKOOd6X6HrXAeDvnIVsG8jRzb6w6/QxT3KfOEOqwx7T
	 0Kqa/QvUYnFYZTURWcT6VwsUGaa3yfm5IW60TXryko6XduEUhJjoXchY2N43iNKLxH
	 ZSj5b1MSAMxP0creAgNmS2Kgqn6tpQY2sGD2YMFhFo686JhAu0q0WrEBw6W0T6JCr+
	 46SjkloX+h4hw==
From: Eugen Hristev <eugen.hristev@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	angelogioacchino.delregno@collabora.com,
	matthias.bgg@gmail.com,
	Eugen Hristev <eugen.hristev@collabora.com>
Subject: [PATCH] arm64: dts: mediatek: mt8186: fix address warning for ADSP mailboxes
Date: Mon,  4 Dec 2023 15:55:33 +0200
Message-Id: <20231204135533.21327-1-eugen.hristev@collabora.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_055545_330698_BEE7DF4A 
X-CRM114-Status: UNSURE (   9.38  )
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

Fix warnings reported by dtbs_check :

arch/arm64/boot/dts/mediatek/mt8186.dtsi:1163.35-1168.5: Warning (simple_bus_reg):
 /soc/mailbox@10686000: simple-bus unit address format error, expected "10686100"
arch/arm64/boot/dts/mediatek/mt8186.dtsi:1170.35-1175.5: Warning (simple_bus_reg):
 /soc/mailbox@10687000: simple-bus unit address format error, expected "10687100"

by having the right bus address as node name.

Fixes: 379cf0e639ae ("arm64: dts: mediatek: mt8186: Add ADSP mailbox nodes")
Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index d57d8ed487b8..ae06f987ac3b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -1160,14 +1160,14 @@ adsp: adsp@10680000 {
 			status = "disabled";
 		};
 
-		adsp_mailbox0: mailbox@10686000 {
+		adsp_mailbox0: mailbox@10686100 {
 			compatible = "mediatek,mt8186-adsp-mbox";
 			#mbox-cells = <0>;
 			reg = <0 0x10686100 0 0x1000>;
 			interrupts = <GIC_SPI 361 IRQ_TYPE_LEVEL_HIGH 0>;
 		};
 
-		adsp_mailbox1: mailbox@10687000 {
+		adsp_mailbox1: mailbox@10687100 {
 			compatible = "mediatek,mt8186-adsp-mbox";
 			#mbox-cells = <0>;
 			reg = <0 0x10687100 0 0x1000>;
-- 
2.34.1


