Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 784E5C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Apr 2022 19:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V/U49ooXAfWMohLScnHU6p2DJ30WU7zsF0fREJaYatY=; b=jKppeZAPo6LrXu
	oBuTFmBlgWEMc7iXNv+VLfKK32+e84FJwMagJFiXVlpUslVd4G74uEMv3pl9RHzoeJoHkwIQWvgzR
	ZAn2PckLCKl3JevU2JbwSEHlN4r0bP+xA1eWv2Ex9Txqmw21Sd5n4j8MBtlkxKtduH685az4TGLKs
	iPSoYTZID5n2qBJ1XpgQYQfHGLFw9LAK0Mw1SqXp4dbzMISLm31WD+PGJ4z4nAOBgMadhhqC/A0lc
	gnSOzGv30G7r05zfh1TFmEZpop8pqkQIaC6PfTs2DF8j0LnJADaJpKI5arBFV6Jjwokid7yZVjVjg
	B1cpaA2RHHhNhTh83CLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbpKU-002T5q-Lf; Tue, 05 Apr 2022 19:59:06 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbpJe-002Saf-E1; Tue, 05 Apr 2022 19:58:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eYk0gPFR2AUPJs0yZA7OBgLex9V+UAce7tSCv+EmtqU=; b=k4UniureN6YlXO0aih+66IQ0FY
 fKjeyCxoY8+22msCQUFMtQ5w1kwhF4L9zr4naG6u7600N0/f5u/FLGk8ImAf4WYbXq+zuQuBTTH6V
 8MpWsrgHU0KMFhHxjpd6lHw5z8SCZ9utBfNbolYxcsAHgwQ7cWqL1mF9BtfoTYblg10Q=;
Received: from p200300daa70ef200456864e8b8d10029.dip0.t-ipconnect.de
 ([2003:da:a70e:f200:4568:64e8:b8d1:29] helo=Maecks.lan)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1nbpJP-00035V-3W; Tue, 05 Apr 2022 21:57:59 +0200
From: Felix Fietkau <nbd@nbd.name>
To: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v2 01/14] dt-bindings: net: mediatek: add optional properties
 for the SoC ethernet core
Date: Tue,  5 Apr 2022 21:57:42 +0200
Message-Id: <20220405195755.10817-2-nbd@nbd.name>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220405195755.10817-1-nbd@nbd.name>
References: <20220405195755.10817-1-nbd@nbd.name>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_125814_670413_90370E15 
X-CRM114-Status: UNSURE (   9.25  )
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

From: Lorenzo Bianconi <lorenzo@kernel.org>

Introduce dma-coherent, cci-control and hifsys optional properties to
the mediatek ethernet controller bindings

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 Documentation/devicetree/bindings/net/mediatek-net.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/mediatek-net.txt b/Documentation/devicetree/bindings/net/mediatek-net.txt
index 72d03e07cf7c..13cb12ee4ed6 100644
--- a/Documentation/devicetree/bindings/net/mediatek-net.txt
+++ b/Documentation/devicetree/bindings/net/mediatek-net.txt
@@ -41,6 +41,12 @@ Required properties:
 - mediatek,pctl: phandle to the syscon node that handles the ports slew rate
 	and driver current: only for MT2701 and MT7623 SoC
 
+Optional properties:
+- dma-coherent: present if dma operations are coherent
+- mediatek,cci-control: phandle to the cache coherent interconnect node
+- mediatek,hifsys: phandle to the mediatek hifsys controller used to provide
+	various clocks and reset to the system.
+
 * Ethernet MAC node
 
 Required properties:
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
