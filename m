Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08602C5CFDB
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Aug 2026 09:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KvAGMH2SF3OadC27x/m+3YmCq7OMNQ6xjFpJG6wyIOs=; b=M1KkHEyLnleQMtMbgeVhAtEmOt
	V6CCxe6nqCLYsTvHZl5WzthTQYMZK5aHtNPUPHHnVZNhw9jAQyomOBnNyo+4Qk2NXyC9j7XH8SQzs
	in/7jEik95OBgwrWmcThyTr//SOFpX5V7d88+/2D4uJ/l0zo/3IkwWp4PodxEsr89dY/wMd2QSlMc
	+cDCTEjzXWcWgyPm7KKW7cSfLmY5qPCOAa6u200GLNort22khXqycvL05f2tzzHYBoRa5HJ+WUatG
	ISsoKwRKIA3LIHjk6P2ybeCM4NffWG4MyQQqSMOR/B0pXTcRI8cEv9uIZtNM/i2WWJ2BhPOtVuF4Z
	arQhlLMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtinX-0000000DjTX-3ybB;
	Tue, 11 Aug 2026 09:29:27 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtinQ-0000000DjKB-2Tsz
	for linux-mediatek@lists.infradead.org;
	Tue, 11 Aug 2026 09:29:23 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-495590dde14so8395025e9.0
        for <linux-mediatek@lists.infradead.org>; Tue, 11 Aug 2026 02:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786440559; x=1787045359; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KvAGMH2SF3OadC27x/m+3YmCq7OMNQ6xjFpJG6wyIOs=;
        b=CuGw0iBVhEIBquqo9Z8wfZHZ506a9ay1+o4/CaHU+oGhcgLhi76CcmGXszK4t2p0gq
         /s++UNZJz7lhfPgnvPWmU0FszZdgxOuEpX0Q7DwZ5UrEsm7rFTO6TyemN7XxXLX+I94n
         KSqitBGBym9Gjg/u+Wy34Y3Hs3fI36Z2oxHARHP3h+2v2KQ5Oml8na538FDGWFrYC21w
         vYHA5EUV8PxxL4yKpn2X9wPSjLksBOlCLZU6ogmFFVUfredzxw7Td37UiDre6OzeQDdK
         cHJPH+SKfMSTin/+xh+S649BsXP2He8ZM+MFqX+tk6VSZA0QEsChmQo7QdQZc47GGfpn
         tTAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786440559; x=1787045359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KvAGMH2SF3OadC27x/m+3YmCq7OMNQ6xjFpJG6wyIOs=;
        b=pmmxTqBxRuBOINz+KbzvJVXEFMGzqJm+RifFpwkhOe8JZNM10fYv+9f+h/kK6R6IWr
         Z+C288qKriA6CDcC2RfGJDWpJFuh/bB8rWy8MbATb0bdho8129soV3bcaD8L6FMbt596
         5gR2Y/Pmeg2/4B3XxU3iv1SWL7+XaNyPgBlr8NEiSai0Cr1bUO9N1e3urUKtkpRYDgPL
         Q53SQWD6ZFKWq/msBbmlXKWECDfFOYQtzz8izYg729ylomYADMY/jGoexAIZhIMNTZM5
         xqB8VTxan8hQUJqeaVxe47NkSe0wAaMjZq+oZ0c0MEfi1YM/lOOyBarq+nqRl1OIvwOH
         a9LQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp1ytBsNfp8uzTJ/OvcHp1naexbd40Q1LVI8FDIhRuDz3wEA0LuOVccQt0xo9oz7OQS64vlxcALsrdFfv7ZUQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxkIEE0LPcat/RY6VvZB84MJu0UD5UCyInrJG1tul3LdtgXO2nU
	Fy9jnCR8ahKqUn0DwwBYxwgiTE4LWr6qkmYRGN33wsMzGWMEOxxck6IC
X-Gm-Gg: AR+sD13F7+8ZrzvjPkaGPMSgYKVbMz+rGXlL6+E0aqzi773guGYIxHBhZtNDgluW8iv
	7wdiUPsfmYZRTrLmvPvvZK7q4TzFKXIFNOLBC6x7DN/YW7GDakl9AMGVBguqIiXf/wiOeadA7HO
	mm0hFhszI4KWecILLcooPSNrM9EOKEu6QVjmb7DfRAqDiW8dbTKSmJnwqumzSVkgnrg5rvss8GL
	GE4YqOXdWzPMdQ8UAWrCmHlF0rQnkirX0vWMAj/Oemiudw0wesUOe9bbcwYhYpWn3HFie+uZUdk
	EmwJk+y+zvM1cEAO9M6lYMmJ1aVsPeTeFFsnz682PQ3Sp2p3RRQ5Idtd9cgzhMcAkr3+4UKCa2G
	cszoyFhUHLAdwYLwVTxxcMv2F9vvw0StG0mrNz2Sspg5dGb7coK8W7pQ6H8zHGHndG3XhwcalYl
	/R00YtRBbO5OlIgNXTDL0KPFoAJogXZ4xh2phqpjoXoiaPjhW2sB5VXDK1C7v5z0hD6uqe/xQDz
	Us6O0c9R5tOrlPDqIuK3Ux4ukkZAnY02Dz3Xa8EQlpDXaIJ
X-Received: by 2002:a05:600c:1385:b0:499:6faf:336e with SMTP id 5b1f17b1804b1-4997846c8f8mr35438295e9.13.1786440558763;
        Tue, 11 Aug 2026 02:29:18 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4997402a89bsm56135735e9.0.2026.08.11.02.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 02:29:18 -0700 (PDT)
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
Subject: [PATCH net-next v13 08/12] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Tue, 11 Aug 2026 11:28:33 +0200
Message-ID: <20260811092843.673837-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260811092843.673837-1-ansuelsmth@gmail.com>
References: <20260811092843.673837-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_022920_640307_783F4C75 
X-CRM114-Status: UNSURE (   9.33  )
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


