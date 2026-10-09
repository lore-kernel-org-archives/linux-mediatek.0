Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B06CA6015
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Oct 2026 16:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lZx5wg1ErozEok9d3MibAXierPMpJi4B3Ch88R20ArI=; b=SKEB5iOy8HCUnyQ8nHynDC4WXu
	tMmmZmMG4x6O5SEKMGAJaoTHaOZGRLkzR5CAlhWCIME4KSHS1bok3J1UjzVnzhlSrmadR4msCVj8y
	+xCrikQ4eYy6jwBwDwzueZF3oANEKkbD//Xk4fSri00vl4qvPY5EXDlKyG92W9xocqnNsS9sog46Z
	IhahAjYoNGjy1rk4zuAyL8E9LAR2D7JV6/2G9LKxexBQ7ZdAttje+N/MSevw8659aX0l9wRa8sBRc
	zz9hVSSVjm9Wf4WuW48+2InSshcNej2MJrxrnfUD23KBBrzqW/CEc+vnrv6ikN7fJScQJuqtzarpQ
	mQTyTftg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFDC0-00000006ccZ-1n3t;
	Fri, 09 Oct 2026 16:11:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFDBx-00000006cXT-1e1h
	for linux-mediatek@bombadil.infradead.org;
	Fri, 09 Oct 2026 16:11:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=lZx5wg1ErozEok9d3MibAXierPMpJi4B3Ch88R20ArI=; b=h5p0+HW/E+p4v5eqB0ir5IoBWm
	zCOwm5n4LBnkz/iJusns0p5u/jB9etv1LqBdeVxUd5HNMKbeYs08wYW6SvfIh9PfGWbWyL7Jf6bIi
	PX9edWr/yc2pj9U7gucTyxYYmT6SzcyuPedJDq5nznMowbIvfvHdBM7BD/YWsvKhYOtHOdfck+blT
	wxuK8IhkRCjppnBP7ML8500Yu6JDVHcSc2lnjGuZASykibnQX2NC3tjzFE+3Fyu8yrrFEqUewlyQj
	dQabKhksYwIMJXmt6DnGFsD/z3vPK5AVhsuSkPg2broscxFSNhjaSELmDsw1fdzBHqgS0DvypyOgV
	Ixi0KGaA==;
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xFDBu-0000000BOnW-2aBx
	for linux-mediatek@lists.infradead.org;
	Fri, 09 Oct 2026 16:11:28 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a02753c04fso21595e9.3
        for <linux-mediatek@lists.infradead.org>; Fri, 09 Oct 2026 09:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791562285; x=1792167085; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lZx5wg1ErozEok9d3MibAXierPMpJi4B3Ch88R20ArI=;
        b=dWQBIBN2bpfj0FeMvvBjhWRFfMoidTDQ9i10IsZNOsEFIADf7CfD8txkKRPIIm+O63
         O8BxN+i4G2kzpVbW/+qWFGBzrtq+VqsPGBaS7kKlkbuQ0sjr0k7nlEC7EVzuv8dN9OhJ
         gBgDbNe1f4S5+4X5/IDNkmNXosgCDhlhhEzx9qrvBo4+lTWsCTeHjMeDLecGhO71MpMu
         MZN4bkCL6XgcaxLB4wGouX6eSXJs6Zv7v336TgekUVDBZdPTeFYN1IPcREd8Z2O/cHi/
         m7nRUpv5E994+AjaE2MlpO7OHdml337IUL9PHPiBFgd2lICe17PkfwO96sB0hCz1Ws6n
         MYTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791562285; x=1792167085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lZx5wg1ErozEok9d3MibAXierPMpJi4B3Ch88R20ArI=;
        b=gDIknH//4uLGcy/mVBqrCT1kSIueTlP+d9lerFGeBKCwrVAkSKQ7VBOVoyPERSLp/Q
         33MyTLBcufHpV5Xwk2JBqHDaRn2wrNm7/hjODK/JTiMBP8pnRd8VOxtBsedBOeJ3ZtVL
         oH+fOsOnZ2DzL0xawt1b+0MFy1LvRBQMBe6lvdIj34yvV7qzujMO6yLxt+eneVgXMuu9
         MwVsf1E3aVWPs6tPaq9d+YzGsVtne4Vwa5NPwzrdi7P6kC7SuFvy5GAffXEMRS0pwZle
         bIcecfxriVaQGzzSkHjvZU1n8VQGPjjcKMvfFyC7MeHMSGKeeB3aTdRV7lGg8pK6IA1a
         5ogA==
X-Forwarded-Encrypted: i=1; AKwUvBzWm0mR4/odvnUCZDiipCRUyw4eM8UsQN7cJoHYVQYcn/4LHvjyt6B6tZCIvWgtgZuwPXyERS+RVsruPEaS8g==@lists.infradead.org
X-Gm-Message-State: AFuF++nL14td2cXa3qT9u6mbusOq9GdgcH9X62otDI/WvG8iC8rrcI7D
	z3Pauv7O/W5bwq+TpB8DCpaxuyYoo/jGRQKvtxz05b0bI5qnsYw3Wj3E
X-Gm-Gg: AYBFou1rGvVvrAAf8dJ8OR34hFZBX37iiZonNxSPoe123k+Y0SeCfnBasAA/4Ugya4W
	KchjVhxWoTR7dMYtB+qDS0O2/tkKx64Zbh/+6pjO5ttZeoAlZxQesQR3FCwbRLXf58C221uWGrL
	bnPwMR9Pbmb16jRsNrOBP8YiUSKA06y+9fHNl9q8WF+Ok8UasAuGSyChMWiNtYOMHvA5RbT1Iv7
	gQADgtjJvjYoVSLIhpMMkm2kJSzPHOVh+JOLI2Qd2ID3yukKNBuXSufm/ujL8XnPkR+7Qrt5f4l
	knmSEKGZjQFeVx4XgjUbke20YPugtXT/JlDROzMQALo6s4Pg6Q5YiCC3sGt5NSrtjSxjynLQXRs
	iFKqFpkq23BBSPZz9f6b+PtuLzDhf36pixAF2F1BUbL6RmqBq0TkhxvyWcZ8XB50P7zx8mC2126
	7GLQwfQNuRBod3+J2+m+F52C5vF9YXctKwgH2suCyzVE+n30P7a/5jxNOHSLvOSrC4PwLOVpQy3
	tG2AWFqdWtp2NTklNPBVSw9UNCRxDcReLzo+98Ax53Zcy5ccpRfGbQhAATe+VHepN9sBOvllka7
	VjVYrb7mEDg5jWU3Fw==
X-Received: by 2002:a05:600c:6388:b0:4a1:6f78:8419 with SMTP id 5b1f17b1804b1-4a18e3ee8f9mr48332405e9.0.1791562285176;
        Fri, 09 Oct 2026 09:11:25 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-213-45-9-252.retail.telecomitalia.it. [213.45.9.252])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48db94e2f08sm4744701f8f.15.2026.10.09.09.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 09:11:24 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
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
Subject: [PATCH net-next v25 07/10] MAINTAINERS: add myself as maintainer for Airoha AN8855 Switch
Date: Fri,  9 Oct 2026 18:10:52 +0200
Message-ID: <20261009161102.38961-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009161102.38961-1-ansuelsmth@gmail.com>
References: <20261009161102.38961-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_171126_857446_740FBD3E 
X-CRM114-Status: GOOD (  11.49  )
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
index 509b35b5a0e7..53dcff93f896 100644
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


