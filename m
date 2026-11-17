Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CDD606A31C
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 12:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pz+QuKZo;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n4y9BiHr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=T78nEvmP8RTyHYN9q4ooPSC+f+0+Xl/WE0BGeWSTHkM=; b=pz+QuKZou8Fgur
	FDZBXDUZeICBv/BR8ULugDTgmKZWGFcKyaA58OwdgVGcDgDctoUGUXIqrt5rZkkDS/1Wecl+XFVIX
	eYTVyJTebejvXiiomE0crj0XhS5Q3vzj8H2U+7IZ8dA2XA/GloWN3DRUjQlqEddWXfQeykDeIjmWW
	A34/o0GPiSlmRuj4qzXWYteTEUL0q5HP5hTx5NcErdKaqJMpHjg7z5E1e1wvIyjtEIXyxaoUsXGaB
	Xu1tYnkkJuBwYukHFnyPAhkPvmQCqSb12QxqBWghx7VkaQ7tyGHp3Hl6lmCMguwNJ+SMIrVAKZQYk
	C125PxoHBUO0krtRqOtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIVW-00000005gnq-2RQ5;
	Tue, 17 Nov 2026 12:41:54 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIUC-00000005fPy-1IYr
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Nov 2026 12:40:39 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so27912795e9.1
        for <linux-mediatek@lists.infradead.org>; Tue, 17 Nov 2026 04:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919231; x=1795524031; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=T78nEvmP8RTyHYN9q4ooPSC+f+0+Xl/WE0BGeWSTHkM=;
        b=n4y9BiHrq+a9xz/wZurQl3HKknOoOaDnYnWCGNXye8GtdQGQd33v7wkaxLnRUz6pTd
         7wJ12RORupePyRO4LOoM/cur7Vp84cNvB7CXjfrDsnXV8FmMWBu9/Gx3QRZ8/F+o/ZWV
         6mp9HfraEGvzv03bP5i0ZAQgesRlPvgk8oATDIf3PUJ1RB8hoKl+Wl7E6S33AEz87qXq
         DEJ6HNctNU2cM7CsXh+CVWmJG5ggPRCSswLxUKZcEeURGnJIxWcqAV5e6tntLdG3jR3I
         wFn/RCrp9Wje74d0jO44Da+7nndbi13kbyWEsD/xuFBdO+wvsDchIUmtYX0OOabhCcwG
         EAcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919231; x=1795524031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=T78nEvmP8RTyHYN9q4ooPSC+f+0+Xl/WE0BGeWSTHkM=;
        b=s2OQM819ytUzXGvviJ4TcnmHFZThrHRQrvJXXp7yxRRIKUyxVPwzQ7tzPgrAljNXow
         n2eqmWtEcVsARD9N1sYNZAYJk6MGeF1Tz7UiyqSvrWnG9kIyeHaWnZe2n8XcaLoyBCk7
         sl+NqsXaxWMb98RlTxajC9Gq0oxVc3ef3qJGlNSQ/9H+4A8+PYvwqG1H+QwShfg7Mx/b
         aRB8dcrUHEcgQEzEblYfldvzAs8mW29vcDBSvlbYwnPhBbF7DZ8nCSUtkEHbZ9CpEwX+
         M5uaZL0QiJ1RiH6gljJVAT4SoAg18yBH0kWZ8fcLuiHh40RR/o4zEi0q6C1upFvPlCiV
         oUhA==
X-Forwarded-Encrypted: i=1; AL+hErFBe6Z7HoajOspKvU+MRbFfEQbmnWcwzu5PtGgR55AFUAtxQngSgyn3cIHMgVi7tJTvvDD5eTu0qYDCtVrWIw==@lists.infradead.org
X-Gm-Message-State: APuU4Z9b2JWse0b00ergFDqzUlr4S6XckeU3RCrtq5MSf/I9KtARvxPL
	A8EaII6Z4nODkJwei8geJFkZTlRWg8QqezC6fPcH4UWsfr8vcAhl+X6D
X-Gm-Gg: AYBFou2DbCSkoAmeOfolTvc5BRgOQ/b/4sUds9585kaobXX/TyfwUBxlXXlYj4Wh3a4
	PpsYbVVLXbL7YhJkOIdxDmxPPgrkvtLgyG7TwoGBUHQRNBhdkiupo/uCYNKgCT0DvfUIpnBRIbV
	b0AayOXa70RtJ/wth1lHhn/JWuKlPmeu+21LVzOWYxgjr35hdjbj4rMYAdaP0vGxU1kpBGAx42I
	1+4NLhfn5y77idjN1Hads0yTKUzdPdnQoxYXz+Ludxzbw/bxptVXzTYFDEAr6loV0lKn3jjrQQW
	87I3wGctzZmF+lvM2L2UdNTHCL3RIsUjxSiFY1NLoNrhaJkr+1yyX2qC+o0qNwLHActeDPMREQp
	ugJxofbZT6USlxTQLZxfxCWXUhOlzaiyc87k0nJSU1JRGQEg1o2uFPPo6eDCiBLRyWQsffqL5xv
	/hepNwgOiFy/0ymXHYrlmshCxFZoMmNkcvuyfUDqgi7egnG9jBfraOot6dyWlSVafz2BDSarvTb
	HK6jWQhuiNADW+dU7ZjmAMCrXgk184ES6dCmhAqI1UW3Ga5mORsaxP4RDR3rOR/4IbXdUVJ1RT8
	maGV4rjvoQYbxYuEX+e2WvA3Uno+Ykby0ILEPYwdRtMm3ikQaFfACTO5FI1rlJ/3B0XrIfHyGD8
	qWUx6tag7aVz3VCkuU7xODJeyfK9rGkqSDw==
X-Received: by 2002:a05:600c:c4a2:b0:4bb:7581:2bb9 with SMTP id 5b1f17b1804b1-4bb75812c05mr102919215e9.22.1794919230626;
        Tue, 17 Nov 2026 04:40:30 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb78386902sm73367065e9.1.2026.11.17.04.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:40:30 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
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
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
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
Subject: [PATCH net-next v22 11/15] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Tue, 17 Nov 2026 13:39:51 +0100
Message-ID: <20261117123956.11981-12-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261117123956.11981-1-ansuelsmth@gmail.com>
References: <20261117123956.11981-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_044034_083625_427CE345 
X-CRM114-Status: UNSURE (   9.68  )
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
index 32e218c0fe68..ccd2d04c5a07 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10034,6 +10034,15 @@ F:	include/uapi/linux/if_bridge.h
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


