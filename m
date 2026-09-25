Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32769C98328
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2026 18:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iwRhMt+5vac5hO6j1jom6ApG+G2j4KoZScdlfZjmEqs=; b=kgveF3ThWWGn8SDUFsikLVjqab
	dIaylx3bKF77ASSpYQXp/ntK1qFiNDKFe3fvKgt2M+tZ67gSMDVdDuboqw3l8eiVYGe4laPsfD3LU
	5qCHXuQXfocd3NIPa9sgIMNkhD1+JhWxLIL6OcJGVK5/Qu3+3xIsBb/PHov5JEtGDKtCsreiQ1oei
	ulxfnlmCgCiNuNbY3FpJX6ubwUlF++zi/VDNo4uAgZmHH2HLmgkl9nUEbBbXxFp35NUY5UkIymQs9
	NMwjsv2FXSok/3beQR08SSEZBIh6JBjoH2J3fGJwuVotUxcxfnMZ/1aYvPrXsSsMHMfjPBKR3JaBI
	5v9WB6/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAAcE-0000000E8fR-3zSv;
	Fri, 25 Sep 2026 18:25:47 +0000
Received: from mail-wm2-f12.google.com ([74.125.225.140])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAAbf-0000000E8F9-2CSC
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Sep 2026 18:25:12 +0000
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ff23af865so8376605e9.2
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Sep 2026 11:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790360709; x=1790965509; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iwRhMt+5vac5hO6j1jom6ApG+G2j4KoZScdlfZjmEqs=;
        b=gToUccgldEQdOljSL4NTv+1pDQlYVdo2V9LAAf8E11da9b48xDdENXmh1uTeaR+U0x
         3FZCAB20bQZnJp54o90f1QqK7XrXL2IRDjJDOnh/2otzoxXcp0IdZqXlnDGS3us6BE5C
         A05tQkIzCoNv8QtjDXbS2rKbqogC/VxJAslOOLbJSOloTnLHxcApinemLLSxK/UnJ3bw
         YMogrll6dniymSWhzcky1nga0MAQeRFeufT6vIxh4KbTpGgj5ewXFe/35Uwsy9VrIx9n
         jPpltg6EX4gdclTwDExAbQneKawci4bgLTAZqvnct8ET+y3v1wR7WRulBa6iU1GeO5yK
         O3mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790360709; x=1790965509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=iwRhMt+5vac5hO6j1jom6ApG+G2j4KoZScdlfZjmEqs=;
        b=FEQVhKUu9hbgVM3fdJ1OiYLLCB/xeQqsxM81VHnh2nsyJlfX9vzregTAl4SDKsfAzP
         DvEmVX1qMBMwznL0RTly7iEATR2/8egKPswQrEeITK+Ldi7twcOWPgWhvmeNP/kISZit
         8vWfeK3ejIG2OM3du1ZMy6LynncIzagNAOYqRKgxNfkxTlgiEhrcL6wVgYVtNgj8SjMW
         HCjwpl3ogUtB4zFqLdqLPedbd/HFQss1y2MSfT/bA7BqecfI5kmSkfycRMvsOIEBuKOR
         zBCThhw863ztPhhkf/4d61niu8jkrblV+1T63Z2cAN8Fhe4qM1oSXxkZX1+Hj01+lUE5
         iPOg==
X-Forwarded-Encrypted: i=1; AKwUvByNkI9kLG/l6LpZDaqOW3m2wl23VS8/AZLwQtTE+39i4jDrEfnZ54pf2zzhtQVUJVxakYkAndsJNWtcux7kNg==@lists.infradead.org
X-Gm-Message-State: AFuF++m3uRwf7zegY5y1kBM09U8cJeV9o1C/QyOollcnivT02wWo/sRK
	O+fv/Nmfm8UUTncGwblN7Hc1YwZzP01tameFaZgTkvQwGJTXTeCKKcQZ
X-Gm-Gg: AYBFou1VybEY2uhThHNP5PICcp/KotZqZ/6pUbbkh0XZ05A0tdrIlWL25iQsD2T2Msv
	UKbTzzuoH6gCqB2ups531i/I73ZN7c8Lxx2t6QLNhK3ZOexoMxQOOH3pzH73uaF4/m+GTXXHpIu
	ngwKFpB6QmPeyw7xdz/PhOquG8Zm4jpqEf1TbePCFw0gDopixd/uJ4nrbUe5UaoJ+1qjOqZIBGf
	eNFpPjvjuLCIM7jYldmJDzKkgYq14wdIfyVmwJtwPqLVxxZTQeFrA61XCZYSqJFF+MQy7SjyJls
	xYz8ROZXPm1luxk5w2OkupCFHneZxELfNA2fVL+XGEGbDW7br6dtH1CuManMywSGstzrSUpJcj8
	dHK9NZjBkeJZ/mV7KGiOjBGIG9PJs4tJilWqmY4sLaTU/NUQeJWNJAEdbOO8kjQtH8amqgQkL5Y
	hTPc8yFshJdU4UkUDrT/JLRhpP0jUXQtBNhshA2EETFQazqEjfHA7errR1QdV6Z085TLuYRZ1PO
	+jcNDdUTQjHJDJjuCJ7ma6h4lshvEDy1Dff9Mx3nf7j+MbzUBoTFeQ2m2vlpQgn
X-Received: by 2002:a05:600c:4704:b0:49c:fc6e:a3d8 with SMTP id 5b1f17b1804b1-49fe66ee908mr111606035e9.23.1790360709128;
        Fri, 25 Sep 2026 11:25:09 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-29-83-136.business.telecomitalia.it. [79.29.83.136])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fe5dfa6a7sm266231245e9.12.2026.09.25.11.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 11:25:08 -0700 (PDT)
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
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v23 7/9] MAINTAINERS: add myself as maintainer for Airoha AN8855 Switch
Date: Fri, 25 Sep 2026 20:24:29 +0200
Message-ID: <20260925182435.21207-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925182435.21207-1-ansuelsmth@gmail.com>
References: <20260925182435.21207-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_112511_577235_9D3CE38E 
X-CRM114-Status: GOOD (  10.00  )
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
index 6de1ff058db6..f6749933aa0b 100644
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
+F:	drivers/net/dsa/an8855.c
+F:	drivers/net/dsa/an8855.h
+F:	drivers/net/phy/air_an8855.c
+F:	drivers/nvmem/an8855-efuse.c
+
 AIROHA PCIE PHY DRIVER
 M:	Lorenzo Bianconi <lorenzo@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.55.0


