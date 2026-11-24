Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B20C60A382F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2026 09:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SaXFTK6z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=nQiUts7mTWd7FNT4qvqNZ1vMEkZwawFBIwwo6WGDSL4=; b=SaXFTK6zJqJRnj
	SxCXMk06Bj0H5Low9qi+TPIoH7q3W2IzY9xSNlShu2voVK+kKkqb33kQWdfTePxWSWFuPEQ8w/oDV
	hTxO3FAuBJ4UenmZ0foYpBgzku5YA76hNP1S0X3xHwlLe3DYbVghL5RayV1mIWeJb8CUxdw6ttU+c
	/06EPRQt9dEMuKOb5L9X/sb58RmvfBEK8y2CXFqA5LZdgdb79hp7n/7KQnNsixaWSCgPWBSxYrDAs
	nRHLUJ+YHvMJjYwqE7fP5KS63bP+qNMCuHz/8IBAqcLsjTY/s2FZecrR8y5nFcii/gN+ImdZJMs/i
	JloIiBZ2ihmmPwCuQyxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVn1i-000000065Vo-1VMJ;
	Tue, 24 Nov 2026 09:41:26 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVn1d-000000065R1-3JQY
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Nov 2026 09:41:24 +0000
Received: from [2a04:4540:1403:dffc:4a09:a431:737f:f29f] (helo=bertha10..)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <john@phrozen.org>)
	id 1xVn1O-007e57-0E;
	Tue, 24 Nov 2026 10:41:06 +0100
From: John Crispin <john@phrozen.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Ahmed Naseef <naseefkm@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Christian Marangi <ansuelsmth@gmail.com>,
	devicetree@vger.kernel.org,
	lei.dong@airoha.com,
	Linqi.zhang@airoha.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	mfd@lists.linux.dev,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Rajeev.kumar@airoha.com,
	upstream@airoha.com,
	Weifeng.xu@airoha.com,
	zhengping.zhang@airoha.com,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 5/9] dt-bindings: mfd: syscon: add airoha,an7589-iomux
Date: Tue, 24 Nov 2026 10:40:55 +0100
Message-Id: <20261124094059.3882014-6-john@phrozen.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124094059.3882014-1-john@phrozen.org>
References: <20261124094059.3882014-1-john@phrozen.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_014121_828197_D3463FBA 
X-CRM114-Status: UNSURE (   7.37  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Airoha AN7589 IOMUX block holds the 4 bit mode field of each pin.
The pin controller reaches it through the airoha,iomux phandle. Add it
to the syscon compatibles.

Signed-off-by: John Crispin <john@phrozen.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v4:
- Add the Acked-by of Conor.

Changes in v3:
- New patch, split out of the pinctrl binding (Lee, Conor).

 Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 4d0cf16fa820..8bd9e8b8a8a8 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -24,6 +24,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - airoha,an7589-iomux
               - airoha,en7581-pbus-csr
               - al,alpine-sysfabric-service
               - allwinner,sun8i-a83t-system-controller
-- 
2.34.1


