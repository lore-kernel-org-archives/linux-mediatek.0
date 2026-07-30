Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20B1EC55160
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2026 10:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IidZjb6Sk1gCBpTKPlKzd/sIpZV6ZnvffkT6vIVNonY=; b=OWY5N7cwn1cgKEULHeC64JrwTs
	1a5zzXHwNYqs2ZkPF7Q6W6LqrGS/BPHLpNI19mU7uV04qp9g8bgj72x/12ztkw12KbaznSft6YnYl
	t5wwUL5vInP0uY6dCaK7nw8OkmQew/vkQ1NQHHVqrVzh1hardOupXZw+ebQrjRcjZk37bJkqLrJ2F
	afXDmgq/pd193uWaKDPaeLSmAsOzJtY3wTSxF8/H2QHuo7rDt1jujbY0kGg7uhWEjx2tLsp0j5wbO
	aA6/kxfTOxLppjZP06ma8Zi8fNe83PfH2/sF0OSu14C5IbD6hEqB3rFTVlyFxBVvdEpRhlSHwdiir
	tZAF7tCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNxY-0000000AC6d-08JI;
	Thu, 30 Jul 2026 10:25:52 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNwu-0000000ABbG-1tM4
	for linux-mediatek@lists.infradead.org;
	Thu, 30 Jul 2026 10:25:16 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4954dff6536so11666365e9.0
        for <linux-mediatek@lists.infradead.org>; Thu, 30 Jul 2026 03:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785407111; x=1786011911; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IidZjb6Sk1gCBpTKPlKzd/sIpZV6ZnvffkT6vIVNonY=;
        b=mAVgbuGhr6362l8f60v184bcjEg6aQ8efrwrEEj+d/ylnLgKhHBWj67VL9KCp/C/Hg
         jwuHi/C+XgAf21eOGOw4mSj2D05ZHzftn9B+F3LI7gNKxMm6SDtQKFeklxaWR+yVrbHD
         ldKr69Ha6SLNG2u04bHC79cjuKAVHAZv1Xlf1CWll3wWUTJgbGBmf+QfFjsWTZor2XZ9
         ZvJcO6K7YGNXEq8vbS2tvzHhh1hQl6eCN6jC6uHEOTQ3rWh7hU3bmQA32Oxau4ko49uO
         j7EZGeCanwNLUojvX0j0VCAkFgBt4jlP25RjXXuIYKzVFvHkiv14SMEn8wPgGW+HpArj
         J9fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785407111; x=1786011911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=IidZjb6Sk1gCBpTKPlKzd/sIpZV6ZnvffkT6vIVNonY=;
        b=fINkYbpM7g4PNbajZRz1wF0F2uQoDbXay3BE3IqTIVJ+PLFvvSmg0JAjH1b9aj1LS5
         IPfIkF44FXhmOtqG6kZRJ5cwmgcFHorNwF+2A7jtbfrTSjSPKWMa2/Cs95CpgRSkQvBw
         tsLj+XeyfETUmc8nxYH7Acd3Au4DGwYEEyIeMJ+4TRbLQ5avk68Xs3GooAZiIH+1c6h/
         gVRfXbz/TTQFssYQDA+rC4+F7HPL0r/FZItPU9Y5zwkEAkilXyD4nYWjRfRWh1gLLJJS
         qOzXb5e6cVD06Xtj3vNHd79wVWUa9fmOcZV4jF7LPJWRPCETqqpeZlrVfVA1YG2E7jek
         aBKw==
X-Forwarded-Encrypted: i=1; AHgh+RrQ23p1FM6O8WEE8rFuJkWR5rV4nF6h6nqkt1Z93q0YsGsEJSq6y+ZZdTfgr2Jwg+R4A/SmACChu0WIw4CA5w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxSMoLq+fdFowZAJvbfGYCMDbZBeuQLQJ7lEP0XPVBmfCcEXYAq
	0oJ3pVQ0NBL57QnAyjHEDfC3D1MDKhlwBknA+7rXdpcZpXykd4xLhXlu
X-Gm-Gg: AR+sD10bWseWf9O29vgQoAVlBlImBBfh/1V7KoXNJqzOSvnLqOW4/hhaghIZx6iLSu9
	fwZCZDFP/lO/QZO01gzqaZ1dMRgyfM73GdrElvzqnzKEBFAooFcUcB6iNTPEl158tLpvvuIgruW
	JCow6WTbjncZR0q1twAI7aVRpOAdoQZNIlUeMxDj0NS0fIEqvdhJDAeoiEa6CZdN7i/X5y1TA3F
	GF7VAsc8Or7+/vfofbk4TpbMJiS5JDdzF8IFGo2j/QxvPt8LwkI00ml6z+dy1f/hvC8/RuGMxgk
	/Sh9caoYpjwqUsExCxVuNQK0r7ioYyCeRklkj4+j66aRif2JY487o8jS/NQ66dAlWEIwOjvBl1K
	L6y7v1tCeQvW9P8cyolTOGR7l4TVjDa22qHCQWhNgOldPQRt9qsvIC4Z5AFAse8AzNGaVLt+zCb
	g9sUg9vWxt8xo6CCpWAWMTO31XiKRk/X6cEvSXNkogtiFFaoga/baa5W58C+6r8Y6DZyGJBlQl3
	7PzxMEmd1i/k4y2HEK68ycyxF2mkoUZmnUCx+sXz3dqF46xZ3iYzQ==
X-Received: by 2002:a05:600c:4fcc:b0:493:c773:c3f4 with SMTP id 5b1f17b1804b1-49800ea1af7mr28621295e9.22.1785407110623;
        Thu, 30 Jul 2026 03:25:10 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-11-254-126.retail.telecomitalia.it. [87.11.254.126])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-498011fd5fesm44720295e9.7.2026.07.30.03.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 03:25:10 -0700 (PDT)
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
Subject: [PATCH net-next v10 07/11] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Thu, 30 Jul 2026 12:24:18 +0200
Message-ID: <20260730102444.1967900-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260730102444.1967900-1-ansuelsmth@gmail.com>
References: <20260730102444.1967900-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_032512_587351_3919CB6C 
X-CRM114-Status: UNSURE (   9.25  )
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
index 3d17b7b143c4..3ea995241522 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9697,6 +9697,15 @@ F:	include/uapi/linux/if_bridge.h
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


