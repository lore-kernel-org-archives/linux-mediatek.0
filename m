Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 865DECAC587
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Sep 2025 13:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HxXWRqnFqGYPd1tnhNthT3WKgGhl9VmDbyQfQ/+snwM=; b=Zcz4eDU8G0OKrcOVq/CurI4Y1k
	DaW2K6UhNi0blp9FmZKvaZfavQxgtSa9cSdeckt5SrOVid8YCNz94ObRcMaoSwSA2VloY6jt6Hof/
	b8PxLZZ8phFixkc+yO9/zo5ElD1jm+F+RrJCJdSJMxY3b7+AHdXWV00eXhpJbYkA6JHpRzAjf4C/v
	ooznwAz06ZUPZimsd3OjK4kmhNTKRuRdxqXqg5+j7ENjS4dddIssKwgg7j+1+yaP58LVObxSt3eUS
	VoJT9yS/fmrn+uYtAaDhMDo23s0chvLF6EZBdc6GgaR7pFPY8cwcqiSHZ9WOFvJcWUKFW2CpYUiAk
	4iU35ujw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwhXb-00000003IG7-1w9A;
	Thu, 11 Sep 2025 13:40:47 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwhXZ-00000003IBt-1BtI
	for linux-mediatek@lists.infradead.org;
	Thu, 11 Sep 2025 13:40:46 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-45cb6428c46so9348135e9.1
        for <linux-mediatek@lists.infradead.org>; Thu, 11 Sep 2025 06:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757598043; x=1758202843; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HxXWRqnFqGYPd1tnhNthT3WKgGhl9VmDbyQfQ/+snwM=;
        b=LuzYoaeIwBP/661kiEex5XMCP1X+2Bogc0ZF8mEvAPSOjDLNgnOFQ21d3eqlge23Qp
         c9rJXePqnILKsmkh1zb0i843NKQzTj4szlTeM//DnFdu1SiUCqoN3uJsxdmg3Py5E0xc
         93Io+NosvgD3g/AR6siuNSCwzLm+PfS7qImaOzwccrVk9V3tkGBqzagoAtrhE+yau2Od
         AzaV3Y1STZ/xZHjNz6GlDIA74eiyc5AH5ffmdxNt9HnsEvHiZuUB+nAI4+2ABK/tDNME
         16mf2CcjZiJuoJvYRE00hNlqKIkZNT1tRTjsbMc5tTbYHeJ0knQE5t56+fV8KF2N03nd
         /YmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757598043; x=1758202843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HxXWRqnFqGYPd1tnhNthT3WKgGhl9VmDbyQfQ/+snwM=;
        b=t2WvSFIpVrp3pU+3NbtmCN6CIXCjb6TeMf7jZfkAozSb+7mCgJH4Hhj5YUf8cHr7/K
         2JxfVR8KOw1MwIJG6B3mE2GyIDmTWW9DE4owoVqGvor2wAGnOPfV3fQNOFaWpWYB3qGv
         CCJ686WHQb57ts3BCkc8AyBpXxlPnS9YwfLmT83kDfMofJWAylGiR3t/hg3sLPBrwhSk
         1LPZ4WUwLKh90k8M/MzZbAegiUvj3Xrf81hhw8ksvO/F/a8SOh7hcyWWwF4u1mTJhMRW
         uv1AshbdgG954D+B4bBHpI4MmO9EoONtuPY3MKG8nZFwyJBj/BvIO7UoLwp7MSIYAU9D
         dRTA==
X-Forwarded-Encrypted: i=1; AJvYcCVPyKb7Q+e+FoQ4kl3cVMiiyldwYm8oFNECXfl9ei/g/lTi73+8vkyNffBGcMg48PIEa0lZBF7vcI7kK9HszQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywtnsi3x5GBwpjDnqlMgnlqwtJDp2iGhrcfdbVuZ6iVmIDqcE43
	0+AC18XFEhFMaKmLiJUv5dibkkEISz7dzaht9O70VcOCWAclufBdJi5H
X-Gm-Gg: ASbGncvWy/NgW07+ngINfeQ8Kms0WrN5mozl0TEXZaxRnyXrdOFgLG6+7uKPyaAzDY7
	E5nRJShNyVXurAOdx3uIu5/XdBcKwrXGbs35A8wLNA7Baz9uAxJuMI/dxO/oY/VGHqhuD8QCc/Y
	NvfK91+jaZmfE0kYQPb6XQ68DyloKmF+vsUNl5MZxrgEdC1bhAwX4jgKjkGxUo6uw5PEBFo7Bde
	RPkuCxmwqqldsAiKFPGXg1rNwmGo4RPuPEO23gh/wuLv1zaF9JzruVlyjidYSiDv3SBZg8VDqPC
	/0jod6CM/+Mdfi85PQPWTnNcVwgiWOR4EH80legOBBmDUqDuCljjr02iZYmOeZESH8RiRAJoP5x
	StbeTeeZqaCDfOd7IUivKEjKcu26QWrK1uIx1CdVP1mObi86GOoVWc2sQFLFCgyetND17022dou
	3Bm5dA2A==
X-Google-Smtp-Source: AGHT+IG2KpWHVxRYHBojS5qhqOAZS3ZPHK9ADJy0kEMpbU3Dfi9X/AHkq0y0EQaVaEvtw7HYElj84g==
X-Received: by 2002:a05:600c:1d16:b0:45d:dd94:7c09 with SMTP id 5b1f17b1804b1-45ddde955c3mr180709415e9.1.1757598043155;
        Thu, 11 Sep 2025 06:40:43 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45e037d741asm23413475e9.23.2025.09.11.06.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 06:40:41 -0700 (PDT)
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
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [net-next PATCH v17 8/8] MAINTAINERS: add myself as maintainer for AN8855
Date: Thu, 11 Sep 2025 15:39:23 +0200
Message-ID: <20250911133929.30874-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250911133929.30874-1-ansuelsmth@gmail.com>
References: <20250911133929.30874-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_064045_369093_F52B5D49 
X-CRM114-Status: GOOD (  10.13  )
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
---
 MAINTAINERS | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b81595e9ea95..818fe884fb0a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -740,6 +740,22 @@ S:	Maintained
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
+F:	drivers/net/dsa/an8855.c
+F:	drivers/net/dsa/an8855.h
+F:	drivers/net/phy/air_an8855.c
+F:	drivers/nvmem/an8855-efuse.c
+
 AIROHA PCIE PHY DRIVER
 M:	Lorenzo Bianconi <lorenzo@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.51.0


