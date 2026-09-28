Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 255F9CA5FA2
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Sep 2026 19:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qqRtnc/P+rZ8ziC43+o+bBxfq5eQjgc6WRa/25o2wJM=; b=Qi9G8t9lyYZDOBXIui+vzFqUr/
	W34GE4zYxKjrDakNSXycr92jQIcDg+5E9hLTO4iXxrWg3RDqIanoHiY7FAiIg0CFEfqPS6/GPQogz
	Y379vUz1DPG9vKQKC3ksH7faMHkJfrzcgCw4yvoU2dwd3joX9E1mEW/fJ5uBIHcO9yOLb5zDecuj1
	Cr1peZ7cKAXMgwSULLrNP8JRVuM9XOi1F2n16pHXkkptUkdobZKFmw7HrcjBb5Bc9i1lZ0mpd5IdW
	/YbtteHGssszcoGTCU1bflmqBUgPFs0f1tcChwImwkTvwQ7rHkds/lh/wk7HiZlvzY5qJS+NJCgGu
	PaACrfAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBHJP-00000001V1J-2Jlf;
	Mon, 28 Sep 2026 19:46:55 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBHIh-00000001UbN-3GqB
	for linux-mediatek@lists.infradead.org;
	Mon, 28 Sep 2026 19:46:12 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-48439feca17so2609735f8f.1
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Sep 2026 12:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790624770; x=1791229570; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qqRtnc/P+rZ8ziC43+o+bBxfq5eQjgc6WRa/25o2wJM=;
        b=e/TCH2w/PENC4e14UdUMtakCwlk/3nku/Gs2213jV5ah/ggIMQ0KlvdeV7w09u8qPE
         aA2l6tC9suf3q/HtrYBZWeIUwDPYhsf4gMkBCIHOgjl2wO9OcCUrC0bmOfh6flrsU+5u
         Q1c3Dw+MAfIdAcZumesoExtHEbGCe1BGFf32CTgb9agkDHHC5EFuYuaIicd54f3s8GLN
         v68CuNts7nAFwX9sCfAyre2NkQulku8bF1BbEuuVALYfwHVk2tlflfooaOVooRSKAHb4
         RHwtuY3GlfMujdm7QBpjmyeA6LhFJvgdCSKnNILXkcSxsJ7epwdMTcJhS3FDTvu3aCF+
         0DFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790624770; x=1791229570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qqRtnc/P+rZ8ziC43+o+bBxfq5eQjgc6WRa/25o2wJM=;
        b=vJQCKaE/jlXH+Q3DfTqNj1DLFSN+/TxJZ0oAgTjS27ESC/I1tnmNp1P3x7V6zk6S/X
         qVyBhW0kvJXXEHKYhQTEFNK//UcpQGr980zBOUo9lwBTuvGxWiOv/YDgxKra5LlgrF1P
         JgZ7U+B0i20/Q8utYDEoZhPb/foWxZGHvZssDJq8Q9G4aSFZ/UNqsW2HqpYvsiaKjuaR
         VlBaGHYoGSNy3dSNxIrOTxbzBydmnbr01hCfrMm86gqs25QoRUKZpoBlK1aVenmd1ooW
         XM+3aYfThvNmOnMNcrEa62KzF9pxYYUvjOfotzZxBZyGS8jYyOwObT5ztHckd7UpWyUc
         rtmA==
X-Forwarded-Encrypted: i=1; AKwUvBxRWv/uVBjE0BFcXN5srxGiddE1cqLHBEzK6ESEbOZf3qBkZg1HV39JU0ePTOKjquArBZCrG7MZLQBPCWOFpA==@lists.infradead.org
X-Gm-Message-State: AFq9FYL7gjAPUEdNdtngol2SFhoDIGQWwnZvndYrWfKGxCufiHftonzW
	C5Wy0UkCjis11+1m0GvTk/NlfWQdnYyt4NDHOjtPDn+/Zo4oMuu3gKhv
X-Gm-Gg: AYBFou0gKlMdKzor9Yz9UwI5/5Ioene1L+gxfo1GW7VkxMrrQkgCtF2wVsvMb/fyvGM
	Nk7ExG4R5qf0U+b6W0WvcQxGGiJeimOQBJi0V/+tRGSnb785ufm4EKhmNN34An32nnVEBWv7CO4
	W4GQpbGliztnqhKS7hPEIbwYR+Ishc4KShQqqwPSWirj2Yp0OgTO8k6D3nSpkZTQ8gBsk6VB2mM
	OSbHcZcY0Hl8Bwx13N9rk3o8rZUFsugtpRSB37xkUlZXmStgPFLrAIFDqcEMnXhGtc1KZBYr1Sl
	FwQwoQaADLyyu/pOcyGyUz3HQsn9Ceyn3SyH5Rrlzmwr0A96vtidBtC5xdlE/jhIOtzA5WxDDf0
	MoYW5xd+gYHs2hH+VWbHzWLXpeYXS48RMAVjDgsV0ntate1msQDvTemygXs7p6u4zbTQ+cwgy9j
	Lz7eLTjFmkhIhgRYT5QVaatl0lB53puATPGre6HUjAn2MkF1LFJ5LtkYPZWzKgRhcOq+BiY29F6
	9lFTYwMrah3v1Ky7YqqxxJJ/7vdGxxAxtl7qylINWFidGuF8NRzZDHYPJAIPsu7
X-Received: by 2002:a05:6000:3110:b0:485:ac35:5c5d with SMTP id ffacd0b85a97d-48871725321mr27594766f8f.15.1790624770026;
        Mon, 28 Sep 2026 12:46:10 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-82-57-191-234.retail.telecomitalia.it. [82.57.191.234])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48af071532dsm1527706f8f.20.2026.09.28.12.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 12:46:09 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	Joris Vaisvila <joey@tinyisr.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH net-next v24 07/10] MAINTAINERS: add myself as maintainer for Airoha AN8855 Switch
Date: Mon, 28 Sep 2026 21:45:06 +0200
Message-ID: <20260928194511.41878-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928194511.41878-1-ansuelsmth@gmail.com>
References: <20260928194511.41878-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_124611_835584_262D9E7B 
X-CRM114-Status: GOOD (  10.20  )
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

Add myself as maintainer for AN8855 DSA driver and all the related
subdriver (mfd, mdio, phy, nvmem)

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 MAINTAINERS | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6de1ff058db6..59e6385b2c50 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -759,6 +759,22 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
 F:	drivers/net/ethernet/airoha/
 
+AIROHA AN8855 DSA DRIVER
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
+F:	Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
+F:	Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
+F:	Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml
+F:	drivers/mfd/airoha-an8855.c
+F:	drivers/net/dsa/mediatek/an8855.c
+F:	drivers/net/dsa/mediatek/an8855.h
+F:	drivers/net/phy/air_an8855.c
+F:	drivers/nvmem/an8855-efuse.c
+
 AIROHA PCIE PHY DRIVER
 M:	Lorenzo Bianconi <lorenzo@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.55.0


