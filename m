Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 742C4CD8CA4
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jun 2026 15:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s1RxjqPGCItI5U8gOH4PdQCpjTve/F/Wr30HG8OpZBE=; b=atkLPiL2LFovcCyWHUD4rHI/zA
	iO2oGMv1Ea7p37FOrPkaxaR9uv8Pzox49RZKIc0bsmtO/VnHGGafebNYV9BzleBQ7dbe3bvFWOK7E
	oBv3HGul73nL1lqRhd0Ak1emyMB8lWdSqTL4U5zjxOSQC4E108Q99PjNm7h9j/F5MDu469Q04YK8v
	n0w5vyaDa9LF6zcrrXZwY/9jNxGZmLKmmLBeeeEt1e/7X7OvaB75oQ7y77twbItI3fI6k8q+XqXQd
	jIJ1uq7GYxk0uOnH5+BEKs/uiN+C3O+F0ticrmcoFowVHHuat9lMbTKK/FNwzP5/Yf78IGtjph/Pd
	2Iy9/JvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWy8w-00000005sYA-1PmT;
	Tue, 09 Jun 2026 15:13:30 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWy8r-00000005sOe-1uX3
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Jun 2026 15:13:27 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-bef47b1ac01so855370566b.2
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Jun 2026 08:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781018003; x=1781622803; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s1RxjqPGCItI5U8gOH4PdQCpjTve/F/Wr30HG8OpZBE=;
        b=ZqLzRhIFv8jMHSkyWk/OrWwhqHkls5gAFopmmajVWALTiTvla1dUyGrnHOVOlGU6AF
         JKqjNrtlA4rncuSRVs1rqylA84+cMbWNg7LhANdqYQzdF5yf2THoe3Uo8jaFWCXnUhWy
         iQD/LNocSgGojHn/BlDeLE2fotbWNucsJXpAn+E+C9iZNuFWSmwrkMSaiZOsNksn2Ac0
         gfOo8ZgXaj270uQ6gM33WMxJAxxI/m70hTTKtHfeE3xH16zzH7Ot1tk2rvq5YwV4+lqw
         dgDq2YPWqC00GGBcF44YyNpM0rGyXd4AX6Hy4HbM9Mx0EtbLxtnVwQwmG3zic20+TIfA
         zcww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781018003; x=1781622803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s1RxjqPGCItI5U8gOH4PdQCpjTve/F/Wr30HG8OpZBE=;
        b=oSNTlHX/a3syOIs5D8nLDzkVAcsUjA5uZOPFiH8cZ+H1j94/zW3PuXjJhqoPAHyPjF
         5q7A1tGFafpgoM1OcgLoPJF8vtdelkvTffgL+gv8tnfa7nvJJk7P3k4LSeS1JCAzmW9l
         KFRA7lSV5l/gFtGdO8pIZJrDkxFPcktj4gDgBhDMVTCi6BQ5S/+qUtcNLBi6++xMxNIc
         iVGdaC5gC8APvL+6eR9ij+evsoi09yU9347TLsmqO30UQzMzYmAuzdI9xNrE0whzwMtc
         5wbVCu/xXsVCsdmnHsWhCh9uqTcqPNWP3FrbZSpx+e7OSYHav5Rp4718gpyWFtw6i5B3
         Fr3A==
X-Forwarded-Encrypted: i=1; AFNElJ/s29n+mPEEXO1R2YlRNUFQ9P6mX/Dgnxuar2oDT9QlByP1xPBPFvUyPUl47hdykuduCyg4et3pjpgWudCnaw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyrmYEbrmnsJsaY9ljlmJfDCX4iKS+ZeU4ZhdpFQGQjMSEbj0MM
	6W+Q7XHAreh3mC7+q8d6+LaFP1HL5p4YE1XY/a7XaFA4XDNQMfO9niAu
X-Gm-Gg: Acq92OGUc/7VQPpF+eItJFPWUg7Ob6lyach53P4xWJJHoTdWBJCy12fyflg8VnB3KBd
	OBaN08Q209eLNfqjKhfsx3zooqrfPTFkLjtwndHxDEcoVBksfHgdUCIgNY2e7HIXApczuNqscC0
	X63BVY1k4qjVESqpOpjoVPFGbVH4+m7NR4WyBsIUkzhq9DusA2gURRfLvej9ceAmyPAqI63rsrh
	9rG+wbY7ZX1cTg0iWmIjXZhENJTz29fcAjqDT8T0hBpVbDhnTObp4/IBze/5l0jMj2s7GF69i/x
	Mo7tLuRyEsZYuNVAtK+gGWXzTYlx0lev5OX2KdboB3SVSfduJTYqaVBckp177ecz3b7qANJiuCU
	TrlkFj1q8D87nTqBuHjNhfb28CKCxQQznbGPFmQDi6KOi+lSGjx011fvsW4GZmpQH9s8gXNU/hH
	Yi1I54ABX4lg1YpZ+8i2niUJpoLznLmJB2
X-Received: by 2002:a17:907:724a:b0:bef:1df6:12de with SMTP id a640c23a62f3a-bf36cdcebf5mr953590666b.0.1781018003482;
        Tue, 09 Jun 2026 08:13:23 -0700 (PDT)
Received: from Ansuel-XPS24 ([2.195.136.12])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-bf0517721e5sm1073637866b.9.2026.06.09.08.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:13:23 -0700 (PDT)
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
	llvm@lists.linux.dev
Subject: [PATCH net-next v6 07/12] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Tue,  9 Jun 2026 17:12:03 +0200
Message-ID: <20260609151212.29469-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260609151212.29469-1-ansuelsmth@gmail.com>
References: <20260609151212.29469-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_081325_739432_4F08D3D7 
X-CRM114-Status: UNSURE (   9.39  )
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
index eb8cdcc76324..8174f005ab43 100644
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


