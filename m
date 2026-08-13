Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26154C5DF67
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2026 08:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u3TXL1NZ/aRbhtWQeEIAK86zXlmYDZTCC23cn6TScuc=; b=4amU24P71SwQfkL4tLDiHkiMv4
	gYFQrjDsBDs0AymZIo2Sxy7ulnS5Zen+rEr8wOEgZPZPmQzOecdb+Nh4Ab+3oh9Kv18QQKTB3mGJo
	qLVljsK2G1KFvwqIBv9AZSaAc+UEmxOe7uWRxpgey260/M9WxkHj+f69BtQa4G1fUdPNX+6FQqPTa
	UmOsIRygDXWE3hQHjPcLO2zIN4iPJtIB4qyj4PXBxdLc0juAK8xGRy5zLzS181YBsqPqtkXUUi+o6
	4sA7AqEK88wh8uYxZNSuHd2RpbPf5Va344lcZQ1t0SY2I7NLyZKYj+Fx29C3svGeKEySj4Tq/b8hK
	U94yquPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQv4-000000009jo-032T;
	Thu, 13 Aug 2026 08:36:10 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQv1-000000009eZ-3Qaj
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Aug 2026 08:36:08 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-49954b88fffso4879615e9.0
        for <linux-mediatek@lists.infradead.org>; Thu, 13 Aug 2026 01:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786610166; x=1787214966; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=u3TXL1NZ/aRbhtWQeEIAK86zXlmYDZTCC23cn6TScuc=;
        b=Y7iCDYiPgEHp0sZ13tZfDQXDXo9Mph9sa9FIYbikAlLE18KgXDude/Rc+fkTT2Ikm6
         0yAOyc50cmJSKHoj5aIjpdI7+YrFoljnLX0/9Nxrqt9S+0yFqdpaZd+As2xqkSf5OPbZ
         ycg6vxEq8ajeH3ylR5wDxG0xEnx0cSeIEGQt12aq92BWiHn132jtSIQvP7PPjb1igXDb
         AJLoS5atpIf+SEbLNOzd+54VsvUH1g1ASX7hpQ49+MTOjcp9xF0geJQ72IC4N57d9HyN
         0V5dLfK98KB78N4gLVaX8Z0wwDJ7sN+hT3Mhpq4tO3iO2vzYFocB0eT1dqMt5iu5wUXZ
         sSow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786610166; x=1787214966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=u3TXL1NZ/aRbhtWQeEIAK86zXlmYDZTCC23cn6TScuc=;
        b=CJ9AfdZpYgX+aH+bCPdcwSjv+cea4I8c5viAyuX6NPInUBSmWHySFmnIZnUSfNQ9B3
         oA30CtmHjb0Da+LmHt2njzsc4Yi5y62EWbKsZgsPavtyVsr668SE/kFLqT3JKMZYJbRz
         m8dvY+778MCgV4kE884jFpQkW54Xh/vWmC3aOtyutToc+JFqxYSxbzH6h2rsPmBJjfbC
         yMM3P47/qYSIFGyVMyUPVZ7siSfLUAFdp6QyupPUFXaDDcs0uNHMJkYB5v5sq4zhQA2J
         C3bHh8HgYblxlP2OQvMgWnfs8qhfGV4mSnxA9h+msAuCi4g2fQVmGmPzhwIYs0rX2qiL
         PPiA==
X-Forwarded-Encrypted: i=1; AHgh+RokYiH42EE4RfY9BOWUGj2nhb84EZExz+Ghc/gSJrVmf1UY7Xd+ycuuHeSRbz7H0dmF8dlwFJoZSzXtguE0Kw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzU0KgoelIEoT3QPfAKf75pYDX2ZjLk+izhQrQsU1OWhVBoM9WI
	y3VbZ5jNU7Kd5zc9xXa/YCUVB7vWBPXEzTId5VbNtKVreRIeKzBwLqnE
X-Gm-Gg: AR+sD12xGhiM9x+zUwJVuQBc6Hr6ftAr/hj9HLwJ0TrmAzJaILci//BOvAnwN0l/Ae+
	zNWxvgZUyAUEB2w78MHpebpgSytrKpNZAVL1cQgLnPWlDW1G6MQtCQPqTXccpjHS6y7AULfXBTN
	xGnkHStgYf1ZFk8g+S2G5G8z01AdvCpISChZPBLO2s7La6KSXyNAZ0XQ5QlC++fMfpncDEGVFE/
	oIMTUs/qJrsIGP2cOyeCCgWsIDTg3MAgEuV3Fnr9da3u19Tfo9OIlBeTwPIS9/HthDSWHlsroyN
	g4wN4u1y3tNWoG7vt23vrvq/MrKfL9Pi7pSi9kOWuHHESdWeL0we51NVxuR2Es4pWcTa6D+F+LX
	oGd7ww1cO7UgDazLcIBGLTltBeRpkA2XMTpTazoIp9u2c3BE/a3W/OvvNU8okcji0N6oR8PqrwX
	XFk3QLhL6rjgv3qCrDjPokYfXN/dEMcnvKYW/VMbIScHw982yUSwQ3aL1mofyI49AcUtNI9S2w/
	NbmvPp92Gk1t875tzhzbeSdFw+p+g1N0qEBHyEbur3dD8mT
X-Received: by 2002:a05:600c:474a:b0:499:80ce:827b with SMTP id 5b1f17b1804b1-499821bcff7mr43640125e9.4.1786610165898;
        Thu, 13 Aug 2026 01:36:05 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4998216d082sm45804425e9.13.2026.08.13.01.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 01:36:05 -0700 (PDT)
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
Subject: [PATCH v14 08/12] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Thu, 13 Aug 2026 10:35:13 +0200
Message-ID: <20260813083536.970196-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813083536.970196-1-ansuelsmth@gmail.com>
References: <20260813083536.970196-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_013607_869721_23082B17 
X-CRM114-Status: UNSURE (   9.21  )
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
index e0e7fae5b92f..04db742696ac 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9690,6 +9690,15 @@ F:	include/uapi/linux/if_bridge.h
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


