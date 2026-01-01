Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D3DEED630
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jan 2026 17:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NZ9wR2ReHBYF/AExO/WGqvTNzHA5m3q65auZ2OTpjQM=; b=nQnEnt0o/k6KV7cRinE/KXpep2
	yzjbAUBLCLgiU1Ko2rZWS8K5B8iVw+988cveT4plGmyPqicvE13Sd21/Tns4iBDiKpz8CUk48sV5n
	92v1zCpTHYTSCADBTpJ8zfjRT4NzytIM2jrlCGsE/ZSmX1IOUuR99RKqBwGgDkyqjRr5CygTo5NrB
	QjrIijS+8qH7tzhRqBVu1EbP2YfoGSFk1fW+qsCAVH+epLjYg0jtEdhzYDP1kFeEuF8R8vgThkJsQ
	ooO4BKb0MEXJh5gVcOv7oPqmllTJ4wh7CQJjq0JbWusogGtX7DO+Xd4Udp+eRSifSkCCN6ZThmEYC
	eK4tjIdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbMDm-00000007NN0-0P0C;
	Thu, 01 Jan 2026 17:12:22 +0000
Received: from mx4.wp.pl ([212.77.101.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbMDi-00000007NLi-3rOn
	for linux-mediatek@lists.infradead.org;
	Thu, 01 Jan 2026 17:12:20 +0000
Received: (wp-smtpd smtp.wp.pl 25178 invoked from network); 1 Jan 2026 18:12:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1767287534; bh=NZ9wR2ReHBYF/AExO/WGqvTNzHA5m3q65auZ2OTpjQM=;
          h=From:To:Cc:Subject;
          b=kFW7bhvN9BxEmu+7B2mW3oWjdvnYnU+N1cWxWqg/of50k2cFP9LHWo+8rrMalhkMe
           4g+fRhE+ypAZiJh65gQrpR09G37HoitAQDuqYu7TDW337tk6VMC2F+op4uXyxlgR9r
           6sG7dpKJ/JeV13i03W4T8W+8OAjuqAopPYcS5aEo7+GTxFtGbtS3E7PeuheeFDqKWX
           eYp70Ifz6bPi/JxpQ2vtWGRVu8jFP1FABtT3eJeAxT9T9RNR1SJsFQ+Jutn1Mh72gY
           hxREG8Ry3SU0qE/tKrrKlP6S76JWbCd+tSDdLTLnKSt0+6o342U7l2SvyOPRTphh6q
           ATf6tDaTuctOg==
Received: from 83.5.157.18.ipv4.supernova.orange.pl (HELO laptop-olek.lan) (olek2@wp.pl@[83.5.157.18])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <ansuelsmth@gmail.com>; 1 Jan 2026 18:12:14 +0100
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: ansuelsmth@gmail.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	chester.a.unal@arinc9.com,
	sergio.paracuellos@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	tsbogend@alpha.franken.de,
	angelogioacchino.delregno@collabora.com,
	linux-crypto@vger.kernel.org,
	linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Aleksander Jan Bajkowski <olek2@wp.pl>
Subject: [PATCH 1/2] dt-bindings: crypto: Add support for Mediatek MT7621 SoC
Date: Thu,  1 Jan 2026 18:12:04 +0100
Message-ID: <20260101171212.1861241-1-olek2@wp.pl>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-DKIM-Status: good (id: wp.pl)                                                      
X-WP-MailID: 105dc3b8181124504b8ee5fad02c645f
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000007 [wYQR]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_091219_427889_390D3462 
X-CRM114-Status: UNSURE (   7.39  )
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

Add compatible for Airoha AN7583 SoC. The implementation is exactly the
same os in the Airoha SoC.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
 .../bindings/crypto/inside-secure,safexcel-eip93.yaml          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
index 997bf9717f9e..8ccff64f5c1c 100644
--- a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
+++ b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
@@ -33,6 +33,9 @@ properties:
       - items:
           - const: airoha,en7581-eip93
           - const: inside-secure,safexcel-eip93ies
+      - items:
+          - const: mediatek,mt7621-eip93
+          - const: inside-secure,safexcel-eip93ies
       - items:
           - not: {}
             description: Need a SoC specific compatible
-- 
2.47.3


