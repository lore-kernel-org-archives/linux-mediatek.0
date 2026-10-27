Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC27606A31B
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2026 14:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Qp2niySK;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KKEOh0OC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=f+FSGmmtRncCiBbsjEjoljPu87wlMKlOjOPIMoQyEbs=; b=Qp2niySKt3MnY1hPL/DVMkdiKn
	j7NSGIzVlqGAgBWIPxz2kWBeeULPuTKr4Rck7B4+70YC2X4CrLJC4yJm427CbyicZXB8CcYb0koD1
	+vmDsxnR3YODu7pb24wVz3Bpy5eARV67zI0BY+vordUQGXrJhMVIb0PF9dcU+LfhGGoGZKbWKWhd7
	bnRl+54EhhSXNoBkoJGHvhMk1y+YrJUiiWt/PVYDU/lrQONJfdyLRbMWT29SEo2938+Jdg+F2oEXs
	DiFvV72ItOsLuBiBX+vQqEQ/VvsaarHZQIiCIk3LrlenlskjwaleapN2BJC9/oASmMFJ4c+91Nnia
	d152PA1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLiLX-000000053LW-0AEL;
	Tue, 27 Oct 2026 14:40:15 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLiLU-000000053K5-37fd
	for linux-mediatek@lists.infradead.org;
	Tue, 27 Oct 2026 14:40:14 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-48dfdd0678dso3071972f8f.0
        for <linux-mediatek@lists.infradead.org>; Tue, 27 Oct 2026 07:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793112010; x=1793716810; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f+FSGmmtRncCiBbsjEjoljPu87wlMKlOjOPIMoQyEbs=;
        b=KKEOh0OCCiSQHf9eC9Ywxkm0kTo2udI2YJ6Tw0cQaZUAFTwmj/p9fClkyyZOJ6kGft
         fkybD2DuK2urSMCjv9pSJ7IWxUJwBcbTK9jJ8p6drSep3tGEO2FqxIsUsc7eLT/b+rp9
         wn2yq4LhKo7mpRItZZ7AW9WRNEAcmHXa0zNC2lSovbrwNl/FRqi2CjhjJo719m306min
         l39B0IqWNuQ2du/ICU/QM9X9ZmTw2xEYgYfouWk/IbXNzXIZ8l581TXYT8T12H3zihm+
         /0sYY68WKLC/7V6Qc9cq4wZc7y+i1S0E5D3hc7wrgaABl/NmNWsCocizYgm1ADRoj5yO
         ryvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793112010; x=1793716810;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f+FSGmmtRncCiBbsjEjoljPu87wlMKlOjOPIMoQyEbs=;
        b=ZsLnV0s0OJyNeqpBtSE5BfOMLzMuq2tfIWJFBNNJ2UkqMTY+ChbZ61mxU7g4v1jnx7
         MJCh+0Iv6g3O0oxWEFLCIUOrDjdlMA/aPJiiF3enG8NMzNYN2q/ZfZLqrVWtoRzrWf60
         DH/vrTSiOq8Ydicw6dSDllb5MJyzoLfqxtpl8d4u9DOdx2fBVeDf/tO9sd9COXUqlrax
         31Q0twDB7Ej2tWlO8pQwaQlvQQHZ+BTqy9eYtEThViB/fAkZT2np6PDtvpOLHWDLDajx
         utVUIFPpP7pmaIK6SLZYnKK5iinkUmjHLqfVrlF5oxjibkdEUwClikezfDxkAQzfLKGJ
         tH7g==
X-Forwarded-Encrypted: i=1; AKwUvByeZ9GT36EbJFd3JBiPLfayHtKpt1kBtfBZBAkEmjfTwwhMpqkzHOvy0rtWX11rqqLEbxNVxsWog7GK2/RmkQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYKilGeDvrj/s4FP/ibZtz9sSX3Lwd5QtH66eVFypQTZBXje7mZ6
	JowUXHmSYkvHk/f8wPa8v5V8u1ldq3CDIoaA23t4PH+cfrVLKNZ3pBPG
X-Gm-Gg: AYBFou2LDUb7kSF/GxO80sls5k7ryIygOdJNxezpbSh7TyJzUh/wYXjLYPZiPFurzE6
	pGaD3loPmubBOIomzPDuO7mfUsD8EUf2kOmkwsOmS9Y5SZNB+AwVl8U3QdTZrCm4/TUUgdNUBRb
	/qzV95nxvMrvRh141AHMloLqNS0k9q0n5TzfhW/4LeyBgvvWYsu0PQ9QqmnMBKG+OB5rsT18HoO
	UEBqKRL355mJuOqQm8jOC1sAsqZ6eEfTy80tWax0tspG7kdS50y03/QQ/+k5FY510LtyndmNCfs
	yixzDPkEuKUWa1N6ICQELHpjaEzsHW+SpboCatiF1ECNN3/hw+MWKpoV+0wIJ9p8x8BxU6vpb/t
	mAj/k7HbdQoI4MV79yurZ2pmTsuqif4mOyv2ioXROkvL4X4cNR53mf6dX9br0oT65nsYRn/6UH+
	hjeYpJavfg5ibAsNpMiXgSd7oqcj9bzIYgNTZGGqj1KOh7D8LFp7QTWwtHd7i9qCcut+8McFMEL
	FYI3t47Hl9YDjRGnUDQ5a8RmEbVuNWU5b8o0WF7o01EopRNgPbnufVnz8sGzTtgvPBfuDrg/0y4
	fGotyDAqqGL8bjgnpde7aoC4Kmqjr7V8mqSyMrPnZRopg018UILM+9cwt4BZ
X-Received: by 2002:a05:6000:24c6:b0:48e:3cec:b852 with SMTP id ffacd0b85a97d-48e3ebb0fcdmr20256092f8f.40.1793112010059;
        Tue, 27 Oct 2026 07:40:10 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb846sm23354151f8f.25.2026.10.27.07.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 07:40:09 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Chaotian Jing <chaotian.jing@mediatek.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wenbin Mei <wenbin.mei@mediatek.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: mmc: mtk-sd: Document support for Airoha AN7581 SoC
Date: Tue, 27 Oct 2026 15:40:00 +0100
Message-ID: <20261027144002.10606-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_074012_802202_D1B85F64 
X-CRM114-Status: GOOD (  10.57  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add dedicated compatible for Airoha AN7581 SoC integrated MMC controller.
The MMC controller is based on the MT7988 with the difference that it does
have a single clock controlling it.

Add the dedicated compatible to describe the 2 register requirement and
permit to define only 2 clock (the main one and a fixed clock for HS)

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
Changes v2:
- Also add compatible to restrict clock-names for source and hclk
 Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
index a4d032224dce..704d59360bcb 100644
--- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
+++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
@@ -14,6 +14,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - airoha,an7581-mmc
           - mediatek,mt2701-mmc
           - mediatek,mt2712-mmc
           - mediatek,mt6779-mmc
@@ -182,6 +183,7 @@ allOf:
       properties:
         compatible:
           enum:
+            - airoha,an7581-mmc
             - mediatek,mt2701-mmc
             - mediatek,mt6779-mmc
             - mediatek,mt6795-mmc
@@ -238,6 +240,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - airoha,an7581-mmc
               - mediatek,mt7986-mmc
               - mediatek,mt7988-mmc
               - mediatek,mt8183-mmc
-- 
2.55.0


