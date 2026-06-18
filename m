Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B4BBCD98F7
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jun 2026 12:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z7ibR1uk6j3yRvHUeSG7+Ts5vUBpNZwTn1NirzFE3FA=; b=WRm0mYmO+30/T9RUL2Kuln1f0O
	KuK1mOJfiklrL28cP7KWBdzzvpBFL0Y1ZUdHeyRNng4V7fzW0x3mxdjje1zGPRKrXqoOuCfBcmAV7
	qXSq8JEZirsbZge1AMGMf6KmbX3BUGtHcllGpMwI+7lr4EBArPZMgd7VZiM3QZjuBn31EyoXcwjvC
	AxQ4bbixmNjqF64VR0inYa2/LakeXs2qtVwxy2ZLcbBqlGCQybbzwy1K9ubW2wQ+mqIOc2Wy33nYi
	IhXOgBeY0IZAqD2Jesb731WzoP6gGT8fWJpSiaJD84QzTY6DUHLAtApa2+vNcrf9TP+gi5Iy6WxYd
	0D3aK3AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waCKQ-00000001Iju-04GJ;
	Thu, 18 Jun 2026 12:58:42 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waCKB-00000001INl-27iL
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Jun 2026 12:58:28 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-490c0c92cffso6072025e9.2
        for <linux-mediatek@lists.infradead.org>; Thu, 18 Jun 2026 05:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781787505; x=1782392305; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z7ibR1uk6j3yRvHUeSG7+Ts5vUBpNZwTn1NirzFE3FA=;
        b=VSSHJPVwohiYn0aXt5yzURk4JY9kKPQW3kuWEjqAyl4Fo8gpDe20HE1bVsaT09FUta
         aNte+D9FzqtGhAZL1C4tvbfih427QRb8Er36LSdMceX7k+tMh5tN39FSXtQ7U/vVUvnY
         0VlnGYPrc+olIrr6fF5mVuzqxop7PB89XldxEfwyM/cp09eVcJOzkySdXNdPJI9ka77G
         LPaQB1T4H6uo5MY+rx6cW/CUaVrggf0trLzzUHNsFl/PO8A+Wyqj8XKVlsXr8lDeiv7b
         IPZ2DcTTC98ITKJsLT8v+fcbTCuWpPZ67mfZOc0yPnco5Rg5vyKOnZqu3JE4QhGH01LE
         XhpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781787505; x=1782392305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z7ibR1uk6j3yRvHUeSG7+Ts5vUBpNZwTn1NirzFE3FA=;
        b=ZdUhPL4x+rpYnwcy8IAoaBO0lwC5B+5qw3f4dkbJnFDgj8lSQ6nGIJB8LCpdMYiU4j
         sa63AtMD9N9ZyoEOhvItBnWK1fr6tUF17Jm9Kvn4oPJoOtyJqdFx0x83WR2O398hCFEi
         w7QeCRWrA53D1cTG67iYaKWtMGWh1OphkY6pr2Da9BgP47MmylmAGVqnofHTozMtKyBJ
         amhFW5+OshbIWCGRZnkxCXBEiN1F8z/X2/Kwn6MQ1lIpkSSNU+7s6R9QG+D3YfIUi8MV
         7UvKymF2jn2XSvFq7ywcKJ7GlAN9+Jy7WQQ+aGfFEeH0upnJSk7OfZXJELYvS+SSaysf
         iw0Q==
X-Forwarded-Encrypted: i=1; AFNElJ8EN9WxWxNn+GZMJLIOzRuQ29wXHz+HNU7llFr1QM9Y3mFvf18uLiHLa00YWpCiHQN7AgYUD82cQudHYoKdTg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzuwg6zJj3OsIWVN9F1knAFuzhwFzHgbgWbNx5ID443F40WcR2M
	TCLy9cyH7ZIiiRa4CoMkCYiNpDbbRZ4aOvQfXcSoOv2zZsuo2xbEAoU8
X-Gm-Gg: AfdE7ckPxz+jvMV+6G4rbVwl0fjbVGduQHbrF2yOmTRupF9S0bEggEyZA/u4oVk5S05
	lff0AxnXL1Y2WsSy4oF/D5y80Lcxtz6yU1p1HCKIznHivWkdYnR8preV837af9/3qQbgLdJTGmY
	1Gw+cxDediM/3UO0cqZEGJucdHgRXYAxlywYSKvNNY3XjPVac1DBB9Lsi0OtAk53v/Zj+5tXhm3
	GxD3jG6zY68XeS6/Lh8WdiWPaWJBtSggTuAhr6LYj43XG1I2kduXcH27LEYJJ3RzejZv4VaGR/X
	J7B22SLH48Z8VdyoDUYH8sinsoeu3ZCEWC7Ow9eqUuPZC5PHZff8jh7Dh5OEUjT52jldY9Jrw6H
	4hNb6pEesH+ZS8TYAgLeHSHxvQoiQxd+R+a1drLF5ppOulVZtIEAbkOl8EpbYjEL+Bp5qW6xBwt
	ZpY5J+YZp6krwKmc3QV6dphnkuv+GS8BsQywNT/103FNqjs3UO4fxGI22UJ/8kfQ==
X-Received: by 2002:a05:600c:2947:b0:490:6237:5200 with SMTP id 5b1f17b1804b1-492333f5dbamr93229425e9.10.1781787505189;
        Thu, 18 Jun 2026 05:58:25 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-88-103.ip49.fastwebnet.it. [93.34.88.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49230a458f2sm241451585e9.3.2026.06.18.05.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 05:58:24 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
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
	Saravana Kannan <saravanak@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [RFC PATCH net-next v8 07/12] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Thu, 18 Jun 2026 14:57:15 +0200
Message-ID: <20260618125752.1223-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260618125752.1223-1-ansuelsmth@gmail.com>
References: <20260618125752.1223-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_055827_701610_0F6517E6 
X-CRM114-Status: UNSURE (   9.17  )
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
index cc1dde0c9067..ef3ef5096d08 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9593,6 +9593,15 @@ F:	include/uapi/linux/if_bridge.h
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


