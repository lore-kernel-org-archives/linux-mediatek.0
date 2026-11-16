Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5C2606A323
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 16:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jIzsbsK/;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=dvQndlhr;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wmIByTpK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=geHgxObFWVvRZemosAYU/Jzp3fHhQwXYyeBLmeYyX4s=; b=jIzsbsK/yl/EUe
	eM7D/j9K39UxaDLM/nwdvwxbpaxUVYxdWnqtzeRUV4LCfVmetmt2Rr9fhVPvDdjlYYCdSzUiPoy4F
	x4X372oj/0YvbIHhV9Bpr7eG6RaIFCl0UrlLjUUPVioJB7aHqzn6bciRDM0s5ci1nnOcUHXZbE+9P
	UkVI2icey98whDKk7TsA0dx3RBByY2fMrYAKvhw8ZI+XKyvUa4ll1z+357OK/2FNYF54JdQjTmql0
	RzkYWSkVQtxULISBNL3jMZu4wsEUBbkmg9pVOIfa5C+k5p6h6KJfKPp5sRjEpyaLYUnU5d12Rpx1d
	7pPxG7RJJFY4Wy1eJ8Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzfm-00000003FwX-2bxx;
	Mon, 16 Nov 2026 16:35:14 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzfN-00000003FUt-3kCd
	for linux-mediatek@bombadil.infradead.org;
	Mon, 16 Nov 2026 16:34:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=geHgxObFWVvRZemosAYU/Jzp3fHhQwXYyeBLmeYyX4s=; b=dvQndlhrO4PhyPW4I6Fqey+HYx
	pZxMClbmEpkagFlGcCrsmzoQh1PBW7Pbrtt5YZ+fuVk1r77hHKrE879HK9O4DBR8Lp4yx0nrj/o3P
	1BTzVL6m+BmomioMWyw9RyidjXc3PHpFd8jqVxmjoR/le5nfgLFG3NJj3r1d6Z0qIfhvY0GnWb7qv
	fHRPm9oskyAojvcxViavLmKgz9zCXqvM3k/34LcclNLrMkBQTH1CcxC54WnLwMplNGTnH+U/K8xeE
	UUfb9cBUdNLzTUyXJ24fHAz2RQB55NAIHC6POxGWYnkNTIu4qYjXPFVSuNhTptbzmgPbyAO+1ci+U
	dlYRuYig==;
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzfK-00000002Abb-3O2T
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Nov 2026 16:34:48 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-4a33359c1b3so109063f8f.3
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2026 08:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794846885; x=1795451685; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=geHgxObFWVvRZemosAYU/Jzp3fHhQwXYyeBLmeYyX4s=;
        b=wmIByTpKgqaF9HQlweSgnr/U5eEcNVVDj9lHcz3bREPrMrpo1TDaH36IAYhA9/9Ykk
         FSpHw88KcQ7dPp6DexkaX0A+lllSzcFullBkpwrqIr7UpdzNO/m1mQtH80F5IjjrHtXM
         Ugtz7doO9EGdKrYMw4JB51COvLH8N0sQ15zjkUE4kVf7H6UscirhTY/Vd8EU1o0H7TNj
         gNHSXcZZ4eMx7hWJt/40YEWDGX9I3XYMPKC9IetUmemTu+5H/Aeq/exg/rVyOw27CZb4
         9Icgn7dea7U8W/p5Me3bLSaD/kwZMRdGF5QiVKqqryLEMtZKly61ng+QSemXgc2Y/Vcz
         eXzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846885; x=1795451685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=geHgxObFWVvRZemosAYU/Jzp3fHhQwXYyeBLmeYyX4s=;
        b=S+qbVIdETZQVDLTp9yT0N+t3IV/TjicOTg3PuWs2hFlPXXnZp0ZlztSJ12p3cBSBVi
         1yb2bxEi/A/kQn3uQasH3I16ZYTW/gnDm0W7zso/ba53eH8AQlevy1DyU7gKFVBRa+UD
         pdfSV64gUh/Q9J2QyqcbWK+VWO4ZUddHY32eZhd3bhQVogZ3KiISQgiNsq6mLS20Efcj
         7hJTLVU+KaTzM/yM1lqKGV+SmRAIgULlmhD7euYK4HQXjVWauk4kLEKEDJmnxzpb0GAl
         91j7eGfl8GCa6bN/nhFq29zh86mbz5AME4PQCrlP9Dnkpro1RFe1cQAhayA4AbLtGs1h
         V97g==
X-Forwarded-Encrypted: i=1; AL+hErH6KCuu9dHIzAEwqTReXxy5hxJ2xAWLEMWq+NKm2mWvUUUfN0JKovy66c+8eiQjWFqw/2R5bY0NvE4V8zVbfA==@lists.infradead.org
X-Gm-Message-State: APuU4Z+Gahcj0MQ9q9swIkKnJGITQT4grCq6ffkWwBg9YXF7VhPIDNaS
	LzO1P0TqwM3Y6XOtuYC9boquWy5wwuYqCf5L9sQbgPqOmeuGdk8YVlVr
X-Gm-Gg: AZFdTZcu/IxUvoq685LWa0U0PL7yF3p7gvTFlGxhrfaRIYBPbqydQlBpAp0FA/WdUhl
	fT+yXhdShhAoeUH6v9gQj29Xct7WUAdFz/gJA2BE9hu/+3QJ3+fKzLuU5iFvaFs99FkEAax/hYC
	rn9M91dch4lVpLBqL9k3uSeHZ2RnbugBiLcP5Hn8sjyVU1/hPT6WbiVbFlbORNxhjkjvXP98e+W
	w3DWwn9x/KnlT7aynGs3GJWXFv1baNrueEe48dfv7F1W7cMsSX5HUKeXxRwnds0aT9YWGdAmhER
	mytYFOLKxBiAXOjgvBSh02xzwR7HPxTueKctOY4h8UqN5t3qBSuVtjXZ8pUtwsipKUyJxndCN5U
	TclyebupbB/5QfbxnrhOQ1JrVu08JOVP0hpxZaDFEUpxp0szmSa6VvsUDKh82Kl/zz05NesStL5
	P6aSwmm+8Bi+arbL1D+bGtQpVe3GiLZr7hNq4qR5gw1wltQy9cOlkL8A3uedztMsjAZcu+aa2Q8
	WF7I60qWY4qWrfmNi+WuhWMchKU6XD83wb97iPEMAH0wiBRN4ywdD79EZANSrmfNUoQc8Nrmtvy
	3JdgEK6b56P7OpTMNokxd1vGMFrQGmzpm8AkTEzGIIk6f98xxk1/vmmqdjykMBsQAFvDdkv3HVD
	ft9yqwl84Gjf18ryowSM28bQbhMIn97KXsg==
X-Received: by 2002:a5d:5f05:0:b0:48e:720a:ccaf with SMTP id ffacd0b85a97d-49c6e4a344emr23224419f8f.5.1794846885071;
        Mon, 16 Nov 2026 08:34:45 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm23840506f8f.8.2026.11.16.08.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:34:44 -0800 (PST)
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
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v21 11/15] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Mon, 16 Nov 2026 17:33:55 +0100
Message-ID: <20261116163412.551438-13-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116163412.551438-1-ansuelsmth@gmail.com>
References: <20261116163412.551438-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_163446_925131_F0FD6749 
X-CRM114-Status: UNSURE (   8.64  )
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


