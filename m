Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9C7606DE93
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2026 00:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yRFeLxPA;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XtD9VEup
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=geHgxObFWVvRZemosAYU/Jzp3fHhQwXYyeBLmeYyX4s=; b=yRFeLxPAHdClNC
	3EqHqpC5jlWQCnRtwsMdBhVIlMkngpvrunPBhKMuidqJ6I+0pAgjM1nMMxdn2cJkonA0IIJOJtkhn
	xWy1J71arKWWploK78jhLYGafWiHQ7Lj/fY9M09J2p1pqWQkO1IgTCySIEw8DlrILXjB+TH2hx42m
	s71j6BjCJ//5KfOiKnhVwoVkd1dSuPkd52ftW9jwi2/1w0FKS2nSLZCvLwS5aCHXYlZLcgavBRw8u
	I9C+Vt6U/isdtW36M+m0xlq8wJktVhhqQ86IAD70Wh9+IS3mLevf93qoNCYlKnM6S+EY6t+U2uUoi
	aXUZs++P+wb4tQNcFg3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfE0-0000000BJjm-2Djm;
	Fri, 13 Nov 2026 00:33:04 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfDv-0000000BJWv-03zs
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Nov 2026 00:33:01 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-49a92144733so120790f8f.0
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Nov 2026 16:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794529977; x=1795134777; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=geHgxObFWVvRZemosAYU/Jzp3fHhQwXYyeBLmeYyX4s=;
        b=XtD9VEupLL7Q6NRec05o0Xn3z9JRZ9ajE5HKwzQLtFDGRiC8LyZkHHyuoPNKUcqDUI
         TULU3EX9rwiQFmA4yNK4yRci0oXsKfnrlJfaxS8b/etvaViy26SSW9CMqEhDpUrxqFQp
         18oHRNh/D6sEO+NyevcqWjflczkDWamx15RV7Ii9lkuwFQ/0bU9CwWvQrPpDAmazA9cW
         Q+O9jXNAlBty0VkMVegvAiaQAOTUsrIuWJyc99lYwxY4QarMZUwo2iDIX3GgfxYXBEEw
         /qFEFemd+8cwWdH7JGC0i6ZjEVNFRXNptjXTTPWnDySpZ1b7aJPpjN0uYV55ww+O2wsu
         WMCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794529977; x=1795134777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=geHgxObFWVvRZemosAYU/Jzp3fHhQwXYyeBLmeYyX4s=;
        b=WHcULua1eu04H8iVLcFw5cl15OrJzgTP5bmuzjFZ5wkFe4cCpcq/ADrVA4WPBTI7zz
         lLDt7xCwVklddkb7BGBuMAG0VyK3Sov7D9V7pmEhloslGgQGs2dZHHnvhFq6ILl4EfWG
         uQhwWMzYHB/UHy0vwf9q99YMcLX8FKWLUGLaPwuxqa8ACE96Cwt/8x5kYXPoEtij2kj0
         gBykD+X5+AA8YgrBu1REYbJ7ECH1BkNKIJ9Kap2AQlMYqHkjqpAlHTTF93mufoFN+rAe
         tJTgoG6ixTghz/5asCa7r8P9KoTJIl9SUHt5U+7qFQtKNw886qqrvdzDPXlDodCAff8G
         RERg==
X-Forwarded-Encrypted: i=1; AL+hErFDdXrqGsOv+oUuJD9SteKINQ+Ezt9zo9Z+gw7eAP7CSp795n1goZSiCXXbBNqkuVqdRPIfFeR9l45XgTw8Dg==@lists.infradead.org
X-Gm-Message-State: APuU4Z8A2M1Aue8zJ87hUC+xi8MXD+ov1QCwXXcbnK9Z3SyVz3dgeoId
	ASZGsSjQoEM5M2chEvMmqxTj/0w6Pl48nhzxI9maoqdP6DUfq7SqaNc1
X-Gm-Gg: AYBFou1UqSJr9V6iS7rC8IUD3KUlbOW408nWQCj2yw3VTMRRM0c8tnSiZhesBhtWfXs
	OMYwNUAwrb0oSt6rRFOzy1YVWeOIZPgtfuAroll5ETGvyoh7wP97znxYQPyUedYG7CPuRmCZHR1
	sXSqJRTPTud6NOtM64onK82lt7kHMsJzuUrGyw/rpOuGDWDfeu5A0gwip/eCbWpj9gSrLxoSG61
	kakwIx5/RRdTyKnbUgPv5LrnmmOPqLiWefd15lzhl2s1RtY4WuX8ArjOjna5oqRzxZ5FE79f37G
	k3vw3B0fmxKNqsbimfMJwj5MW0gRVsZXVQOKRdCjWvb4Zrh3/M2NqnM0PGzoawo39RJUemzkuQG
	3OGG+indNR/f0y0bWWFz2JIg7cI33WTHuqyhgYAhQLcBibaj0iJZQJYlHd3iR0O1gwIWKkWCjiZ
	7Jc3KreDSyv14Ww9bL0u+5TxBbKOK8/xNEmRS8pkjKTMxhcjfzctwh3v3kqDYO12HrrN6gK5hDH
	gvD9VFSUb4bIzOABXAGNnuSsmmKm1PrKaQUX8dugYTEPYi3DZ0si+V7EeeoM9tXAuZk6DuJMn4V
	ni8/JmSs2UnZl4tJ9hEFv41roWMiPnZ7rBrm80zWizrm5WcILCGmhOgK71chNhSrsduMVAN3Huz
	xlFSL4mQZP3JjWM/H+RiBpreeDB04u1sajBMNM+F0u5AiqEFwf19gmA==
X-Received: by 2002:a05:6000:490a:b0:487:1662:cf4c with SMTP id ffacd0b85a97d-49c6dc01394mr2183917f8f.7.1794529976835;
        Thu, 12 Nov 2026 16:32:56 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-212-171-11-167.retail.telecomitalia.it. [212.171.11.167])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm2029768f8f.23.2026.11.12.16.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:32:56 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
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
Subject: [PATCH net-next v19 11/15] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Fri, 13 Nov 2026 01:32:01 +0100
Message-ID: <20261113003217.197757-12-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113003217.197757-1-ansuelsmth@gmail.com>
References: <20261113003217.197757-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_163259_159958_D4CE94E7 
X-CRM114-Status: UNSURE (   9.06  )
X-CRM114-Notice: Please train this message.
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

List all the files of the Ethernet PCS subsystem and add myself as
maintainer.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 893b0670a7b6..44c116f6cfd8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10033,6 +10033,15 @@ F:	include/uapi/linux/if_bridge.h
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


