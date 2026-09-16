Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB562C982CF
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2026 23:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tmAu67PdIVI7V1UutpEDvX/bujznCInbK+OAzRMwn/o=; b=kP8sLpqiTiEEGGZqoZ5dxHI8h1
	ew+IyFuZx0rg26/x7mLniBMGI313B0khQjcjqW55fW2TIGeQ0sAw7ayhm95l+9W2/U01OHkh2LiBh
	UTFq1W+Ibp4EOm9uuYIkH43jfHbrIQ/AWUU0MP/p/LG/zY04BwemSgsbbXzXdyeKzYJ2zkNtHXbRq
	W3jrlRYz4gYm2vtxAO2QLeNiTk6Gryn8hR5M5TGzHXZOxVxR+uj2eljWW3DJZ5lmlT3fAzOflCQbU
	eGy1y7aDrdxYs3y+YvqIjV3I3rQ2pE1DD1XHLlpk4LGmVSCBA5RIzG+Z0v8Z/4JcBwe6EwNt9DcnO
	CmNsaJ4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6zQj-0000000AGnH-2MVE;
	Wed, 16 Sep 2026 23:52:45 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6zQa-0000000AGas-2yPr
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Sep 2026 23:52:37 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482f633ece3so170225f8f.3
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Sep 2026 16:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789602755; x=1790207555; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tmAu67PdIVI7V1UutpEDvX/bujznCInbK+OAzRMwn/o=;
        b=qD9AzMv3PPZGXo8RtZ0fnfMPIAm7ahwLC9Oy1iwd2DvR6EsawZkmYGvXjfo3PeOyqY
         2e4ip5lsvLeA72FgATT9oD02j7Vl/DvxsCxGEVWkP1hdSYuM5t5dILOaxF118ly8RJGp
         2Ux/ZKpEeyex7VeMxz9bJ0rI/DXDQ1JOWjMpupLQsPDumvLqzzhm9iKJb8N7RMjpF+sx
         gQOzi5N/2ExRnnWclsyEhPw3JGe3Nl0Z31PHS//Id4bLbxkiobmvA9mmXa8Vu0f9CJpq
         p+XbP17XUhS6E2uEffEEePDxI1teTo+IS7NpnDCP8UTix4OWpxbY4QRMk7+hF38ToPli
         bnJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789602755; x=1790207555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tmAu67PdIVI7V1UutpEDvX/bujznCInbK+OAzRMwn/o=;
        b=GHTqQdv0x/Gz2mzO9LI0rqiP7hz0XZqgbH/jbjvByl4436w/9l1iN/Y+650uJ/xu24
         LgjoSvjytrYZY3zV/0HmpfRfaNgCderRh3CtwtAL0bWKQuqb+zJpVsGuhb9GA4HdQAwq
         gBC/Fp6SZWE0hFV9idfxms35EnlC8QobObitp99d/1y+upAsij8RxGmmP+HUNTnPaHv/
         bVOGC/8IkRduBUmyOIL1ap1Q+KteVns7gaIrq4HMwxZqqTVGgoh3TN4xDNo8POXAWvaY
         hgjbvRMUYbwkycALkz3MoBbE3qh6R4n0+LoLPFNGDTvanrOqaje0MbSv2kORIHnJdghQ
         Raiw==
X-Forwarded-Encrypted: i=1; AKwUvByP9Co0lpe8R8JIyOHBlHsvCZjDoEZe/XK2GUNElS3nwdBbCA4SW39FQZ4F2mJsQaSiwIVOlWPBfLp0oKKG9w==@lists.infradead.org
X-Gm-Message-State: AFuF++nLURWWKehdZz/U1K1QcrtNNZrBVMNie0/vXKksuurjk71tFNwi
	XQd6/xRN1Or/eUHT0R3RgRoc5xzrefCtgEkldlA4KNGyT94s4EtmRksF
X-Gm-Gg: AYBFou1ZMFUfc4Eo4M9m1Yn4x3xMzrQMls23R5oQ6v8aE0lMzw3CRGTprKnDeH/deMh
	2d8q5jksOFr3EOcS/hNm+EnYK4lqkQYK6fhZp7ycOtVD9B25LcGydBbE7rMD+ZUR2RmJOrkVmuq
	RzTPdHKYWmRDhI4+pND5EE8q/OgJBfHaKS4AT+hCbRDhsW1RQbAxvQZJ4ECXU8Rwum5U4M2zzaz
	tRRDNadof/7HJh8/ZZ/A3OnadAbG4jMAM4dy9GpuNRT8qJZNUJ/9xSr/40yOWf1QdWJf24zAQvg
	EggqSrmv2EuR+R5jkbH+cNEFRyk4uhu5XKMJkHwpHfpnLvq7s+R06HscCHHnAOSDyYZ6/6AAbeo
	WkPkMqlevmPWwLZG0XOxuSXrUUK/LmvYHDpoMiqtxb/xR0i3tCry0vcOHLlsD0Fm2x7f0nTaKC/
	qsNt5bBj8W7zfLcrluGxAC2TmBHjk9cxlwr6XEpqI4AWMRxhUGQLjfoLsT0KnM0rn+xN58wNFRG
	OhvtiKnyy3AIRVzoUA5aYKDxcKeeChfJc3FEkqecOS5Lcei0UlfHz9ftfgp8R8=
X-Received: by 2002:a05:6000:2304:b0:487:b32:9d6f with SMTP id ffacd0b85a97d-4870cf25729mr5407208f8f.22.1789602754931;
        Wed, 16 Sep 2026 16:52:34 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4870bef7687sm11861104f8f.1.2026.09.16.16.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 16:52:33 -0700 (PDT)
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
Subject: [PATCH net-next v16 08/12] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Thu, 17 Sep 2026 01:51:34 +0200
Message-ID: <20260916235200.20712-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916235200.20712-1-ansuelsmth@gmail.com>
References: <20260916235200.20712-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_165236_780067_0C121996 
X-CRM114-Status: UNSURE (   9.35  )
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
index 0e04d92d1b09..35e20ddd018b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9755,6 +9755,15 @@ F:	include/uapi/linux/if_bridge.h
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


