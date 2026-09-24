Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB368C98325
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2026 23:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jGcuL1ZJ6RVaONcJJiN1h0QlP/SsYqFMDoH2EucUXRI=; b=i/TnTsXlumhivfAvw6Jlrex1sr
	7JKtpHcTb2kgma9q9En86RzDUew7mFFAmtc6xcYhtmaHYYbsTLBsTnnyvsImXipXwRxchAY3P3sBU
	c7VUlibDYZ0EAhAB8vJgO5E++V+F6q1bsdwXmLONR3q8SgAsE92DZsghnEta7XMue/YrwS6IhjrDz
	ZUIKrlHMYP1nkO7FnZF5+JrCYigSMdZY13KT/E16wparnJFnH2Nloiwep/1lZ/PWYXkbS1V06oWiR
	22NcjPNQLhzkE5GEGd9PI6lU5pJ1P3iy0ZwuVUlZeuq8WU11yuG6k0YSCY8jG1iR0ifJtuqbBWcG9
	wiFwLhXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9sSv-0000000CLol-3uao;
	Thu, 24 Sep 2026 23:02:57 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9sSm-0000000CLYY-0X6P
	for linux-mediatek@lists.infradead.org;
	Thu, 24 Sep 2026 23:02:50 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912d3931so2618615e9.3
        for <linux-mediatek@lists.infradead.org>; Thu, 24 Sep 2026 16:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790290966; x=1790895766; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jGcuL1ZJ6RVaONcJJiN1h0QlP/SsYqFMDoH2EucUXRI=;
        b=HINEzT0Egs5H1y23QEdCF5weyQgqNV4/VQfwdA15klzuFHT0gc7Iab+EUclECS1CBj
         W6DKT9vbo4KA2SxzL6Ex61pnCSfVVf0gVtJ3DmOvtts8KP9lpdSUln/tAJeswW00B+uO
         PZgia761jlOd8TdnmjV0oS9moB6tsZE8xFsR0YCnd+LtySmzTrxwwuitSCXuow1AAkUa
         Pmj/kdFw6AiM/e0BbkCb7vZAzQ1f/FVoXy5YC81a4wCJZAxTlnv1kcAm4DX/CFBFOtoh
         nPZXwkqkesQXVBhdbUyENukGdTbGqT3bpcFC+09AqL65HxO1AaLIh3oebG93Gsxrqodh
         mKnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790290966; x=1790895766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jGcuL1ZJ6RVaONcJJiN1h0QlP/SsYqFMDoH2EucUXRI=;
        b=oU70Vb1nwX4y+zz3oW9DVlHrzClCVSZCXGHQyGVNqFztRrv6WZKw0MWNomErUvTr1M
         yaK1fSXgcui3NOK+JXZAIaQYADEXerRbn1mLTHiYgvyA2aA394zKW/3LpwOs1UDvA298
         EOOaoETTW3mz9jgY+hAmvwTjTl1h7IpastY45gBq4z53znBCd//hapQOS+LNR0JNXRJV
         wkXnAPfz9N3aWm86MQuMLt5s3xknIBhPWBDzGJXGzQp6/V8ioWgeZaR4P/l+ud7aKHiS
         CK+80kddWjyhT3xhN+eiQgP4rLVKw7SBMiEJ7y0+DTHZBHY4JeGuvUrO8j1lrez0MmCJ
         cogw==
X-Forwarded-Encrypted: i=1; AKwUvBxROk4AUGnKsfkF8WLRBrhxS+6XXCIYbvUzT8+aKuJRobfRnLGQDtzrmtydvNZcb223IYjGw1wK4Afna81cLA==@lists.infradead.org
X-Gm-Message-State: AFuF++lhWFJgQqHp52nofMgrRD0s5maO80ePg3SVGm+J4JM1Sr8gymsu
	QtPld1BoT96cCmQQLu6XId03cnEumye24iCCfNszzfs9uAWCyL5mAEld
X-Gm-Gg: AYBFou0n/J5A9+BVsDz3VBb5cjkzam8l6yhx92DyejxUHeJWdGGFNfLBoed1VisFyRo
	MWNCR83HI8AWWpM62ihEKqwOG0z4UtxS9ahuvpwfybbqFbjhKxx6aqeGJ/m1TnaU5Crb5QmJB0Y
	BKMVFbTRY2cKbC2LhocLjfeQgn1xCIDMLXCQBXrHKLaPRQuHNz4zggOf4AdIPjJCRTr2TsKRGUH
	V3ixxQhQjGpQuDrqGVIfFTx5rCqMptD00PUgiXBMeW3uzlhMGjwmqYTrBOebubblqvKJyMOYSDz
	qHL2vWtYsTz+WlBhaM9SkcAFXEPPphDPnHYrvi0LR3SY9WrHvJul+kwwjiEW1VRHguJrh+HS5xC
	S/qnsfQQjIqRFRz/FEc7qTZ9M5hYWTOvZErAtqlrcR/QS673cRP7ga5ZjrSpGrIXfaIbXD1VlFE
	dW2xi/ecmerENpGr8UjYTHxjEusPbbqTy3fZ18eMBjR546XxiFpf9k8gIjpfG46YvkRUhcuOXbp
	yzeJZKmrYkzBjj8+RqcZEd/LY7AR2c8iaRpDMJHqDH33BCKDrkMF6lp0rgtKZjS
X-Received: by 2002:a05:600c:37c6:b0:49e:81db:4926 with SMTP id 5b1f17b1804b1-49fe66ca0d1mr65872935e9.5.1790290966498;
        Thu, 24 Sep 2026 16:02:46 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-29-83-136.business.telecomitalia.it. [79.29.83.136])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49ff06cbe57sm12288175e9.13.2026.09.24.16.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 16:02:46 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v17 08/12] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Fri, 25 Sep 2026 01:01:49 +0200
Message-ID: <20260924230211.11519-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924230211.11519-1-ansuelsmth@gmail.com>
References: <20260924230211.11519-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_160249_314836_D31D06B4 
X-CRM114-Status: UNSURE (   9.51  )
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

List all the files of the Ethernet PCS subsystem and add myself as
maintainer.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6de1ff058db6..a572e845b8a3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9757,6 +9757,15 @@ F:	include/uapi/linux/if_bridge.h
 F:	include/linux/netfilter_bridge/
 F:	net/bridge/
 
+ETHERNET PCS SUBSYSTEM
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	Documentation/networking/pcs.rst
+F:	drivers/net/pcs/pcs.c
+F:	include/linux/pcs/pcs-provider.h
+F:	include/linux/pcs/pcs.h
+
 ETHERNET PHY LIBRARY
 M:	Andrew Lunn <andrew@lunn.ch>
 M:	Heiner Kallweit <hkallweit1@gmail.com>
-- 
2.55.0


