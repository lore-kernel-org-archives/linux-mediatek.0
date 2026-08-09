Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A947C5AD7B
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Aug 2026 20:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KvAGMH2SF3OadC27x/m+3YmCq7OMNQ6xjFpJG6wyIOs=; b=t0UKOkomKjYAoUJX/6/ZaV9Fof
	gBcSyxe8RQz9bHNugXXdbqq8HgXKIRD+yMzBe9yWeRHghLBmt73n0qt8cVrNZxwgHbPi762rgkQmb
	ZffPkwB38lE94pru809/D9vyXEpQ++l3qZqjBMwhm/Hn8JiKMUmyKCCkFT63gQVHBVNrl9myDfDvs
	ulrfNy+3lBHU9FVPDS52nKaxI+hs4I7Obo11TON9CCcnZL6KJILnudVtMILbKlsz+uLigqXyoXOPF
	nnYUTSI8566sDz5POPlj+luf5zDRVq9qQf9A+22En35p3RbdP1wOdfPKVclrpVX/3EqrIzo8aMDIm
	ybFA1IEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtABT-0000000AgG3-0BSq;
	Sun, 09 Aug 2026 20:31:51 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtABQ-0000000Ag9D-1BsR
	for linux-mediatek@lists.infradead.org;
	Sun, 09 Aug 2026 20:31:49 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4980dc26022so12039715e9.1
        for <linux-mediatek@lists.infradead.org>; Sun, 09 Aug 2026 13:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786307506; x=1786912306; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KvAGMH2SF3OadC27x/m+3YmCq7OMNQ6xjFpJG6wyIOs=;
        b=FYfyY/XQ0ptWuUyQi70kmtXr8OH5uw3quMM81tBxPiQoggjRHBdDLxCLWqCiOwIQGa
         mmruWLSGSZ+hItkVgRiBiNbx1EUNf/416o94WQRci97EmpXYN9Bd/NAhkOsogCLgGBMl
         XL1aI42cuqIOY8EOor3IJic1hprZIou0DFx2iiRITMp5hDI49v/hzxuf4BDA3ykZGjAA
         I8TxtJAU0JtwLiIiC0TUbOET5OecRbRrK8UgSoklYqecWmmyK3f4i1kp0fA/poKt7erJ
         wk0LLPuOrEuBKE2q7gkBcOJXEkHlwz/eJvTlrzLIFFcvr41Q2QRitO10s1903bonPyb+
         uxRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786307506; x=1786912306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KvAGMH2SF3OadC27x/m+3YmCq7OMNQ6xjFpJG6wyIOs=;
        b=bzkS6R8QMaOu+crZ+Oi0qrDn/kXMOcUl5eG2L/EEFXhBSLEykvGZPI8Zfo2+H6gNdI
         b/radF6Jp4I1JelM12b0G4amLaY6Ygi+Kv4knt8T4jVpAlX75CDDqnf32GZLGLkgs+Ny
         ssqc8a004Ld2uBP8h8cG8wd3LIIcgyDAglr4alSp4/U4jGUihfoWoLKax9boNNMGeKNg
         jpqWpKfVSCahFJcBWelPqBaGNwiQu5LOdL8nsL48aAYHzy1hSCCB61vG9/Siaulk+zLj
         6QxpPjHf0tt0vjH7RTG4PZq1k9bSrAj4k+bGsymxt2pwn5mdyi2aT94unxP9p9iK3vP1
         nQkQ==
X-Forwarded-Encrypted: i=1; AHgh+RrUbEeybjuS27KmOrv58IdSEHo93FCBy1xLe3m7RLu4cAS2DWvGsFhgaTouxka+WWD0zQs77IpM0O0pK+Ze+A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+nJ5F+XG9QA/kUDzilGdET0+6dz/Kgph7oFUKTw6b4b5utr1O
	GCEZAXVBGHkhz6Eid+FQBgblVZMdqlZwta3fVxuvVaRmEU4tp21XJVSN
X-Gm-Gg: AR+sD11LRT59xYYLUTA+YIFt92ECmxz0EuASJ9jrhmLmHMhUljrWBmYxmQWvfHrbz7d
	Gn3gw85zJLTImCdJO7AoUrlItDSANN+Yv6AG4aPokTleMbnU/z6cEYrtQxsx4w1+MW1VHZN2wlu
	qPSwW7FfsRjRe1yGmsdj45k8QJBU7kGzlcbOAYxDCVVbx+qdg4d+Dq5qlP+xttGnGtUE2ygXMI8
	bvUxBhaPZFAyfnS7PFdL+ixvqfd5yal/UoeEv9Jwqp3ZqQIuWnpogUsqBQuUXwjTYSEUaupkqW8
	I5cjQ/VBTl6NgbjftZ/7G1lb9n9aPsoeNC8r6ecpD/GIFGMgrdb1aA9UceO1B1DzNw2QicV2IXw
	bnisFrM4rDmw6LTiNDpQ8Fh/qhK/u6yFunnQjoWe6AR95L33pdFuQgdh70moX2KrDAsXaH1pIm3
	BWw1xOXrZqvVKznDghDGzpanhMkbZLRWkFcQJF9d06smDex34iQUQdq47kaHDxOAFfskdWR2EJ7
	lB9spmtgdj3Tfj44sdlKtZ2KQUsJohnaVTIlQugkEvubwom2zAvHQzEmcKg
X-Received: by 2002:a05:600c:5251:b0:499:5b04:6920 with SMTP id 5b1f17b1804b1-4995b04695bmr259698705e9.16.1786307506550;
        Sun, 09 Aug 2026 13:31:46 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4995e9ea92csm229357065e9.4.2026.08.09.13.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 13:31:46 -0700 (PDT)
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
Subject: [PATCH net-next v12 08/12] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Sun,  9 Aug 2026 22:31:05 +0200
Message-ID: <20260809203116.640271-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260809203116.640271-1-ansuelsmth@gmail.com>
References: <20260809203116.640271-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_133148_349454_25AB875D 
X-CRM114-Status: UNSURE (   9.52  )
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
index 08e43bc09735..e3ded0e4a115 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9688,6 +9688,15 @@ F:	include/uapi/linux/if_bridge.h
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
2.53.0


