Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD6B8CD98E2
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jun 2026 12:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z7ibR1uk6j3yRvHUeSG7+Ts5vUBpNZwTn1NirzFE3FA=; b=UMOtKFxhCqPvE+AJAKRjXdUSVJ
	gv1myxhbfMpLSe7uLwNGdlMGgBBuPvaxOUQWotK1UPqv4xwRXyRXZ42P+keOHtDvXialhqGbq2plZ
	oPQt2KWCKvjkJVGyyBdxdn06F7bht2lrrZZx7byBlcS/2PueqAAktU+wpmZSzlQeIGnEdeEdsjyYr
	uxHmGfF8n73XAbLA6K6zUDhe8N9/VKsKzMrBLiaT/u6GbGM+6CAmSdsI0Bxz7RwI+Cz2nApCp9jEj
	gukw/g/JGD9QddG+OEzpGK6yTQFrOjNv+/RTcb2jlttZTatVaMQ7jlUeXMgKrqUQks3VfdeN6FuHa
	L0c2a8kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6T5-0000000EBnq-1iw4;
	Mon, 15 Jun 2026 12:31:07 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6Sm-0000000EBSW-3OlX
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Jun 2026 12:30:50 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-490b3637b90so24831525e9.3
        for <linux-mediatek@lists.infradead.org>; Mon, 15 Jun 2026 05:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781526647; x=1782131447; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z7ibR1uk6j3yRvHUeSG7+Ts5vUBpNZwTn1NirzFE3FA=;
        b=YVbmy/I2vAsLOk3WBEnzOJW8kswwSqSaM5ILaxhIEawle1KDqZWGOBfxyU82SZ2Gee
         tP+77sPEuvEv4wjJpCIJJhc3xts2/thjYWg87JhM/LPcYJrRGTOy+1G90t+3PsmRPTCs
         hfE1/shtbY+SHJspMQFNM0afRCAR8/WQo4KlzMucnG5lvBy6lcjNOa1zVdLy4w/fA3Q+
         0/x/FA7HRw9w1Ja2uDJaVnULu2XmhLp+5dCEzfDuhVk7qg5Do2B9tZcUVuG41VnuDuDW
         yzFpXzy3yBKnD6aaw0cyekQXaXUfuiSHBeBlzY1yIw7ed0u3806Rktka8ECMaSYPQomf
         yqWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781526647; x=1782131447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z7ibR1uk6j3yRvHUeSG7+Ts5vUBpNZwTn1NirzFE3FA=;
        b=kwXSK4AAhdQpWLrMbvFKo0opW05ZOtqRR7dQywhB01ekiTZpINmMCLMgK3w689X8ez
         0JtwdEwB1Ba8IhmYtIwYJCfgd6ckzF+eGPnqb/Y18uxRBIHwiDJGnuy8dQMd55KJZq7N
         OxxgmSyQONXBSyS1bBxPct1M1GPmZ3++jh98jqVJBaulE8kYOhYWFcDmtVvZ2FNi3HU8
         T2RvGKn5i0K+i+NKK/eQz/aIvfoOXEmOWO954qfiZQ09cbbTpXtA76VTybX+DHLG3LqE
         30UhqAmKl+23T1xVvzmqwMOH7Z7rLM1Pr2lVDKT60glco2LtguY7W6DA9AZFv9Zyw8Ab
         kxOQ==
X-Forwarded-Encrypted: i=1; AFNElJ/282dv5ZvRyHykgxesxKR/kZOoOjlmo4r/BslLBAGSzejNeTHjPaSoDlH3AOowFh6xzrrn5+9l3nGf34gzQw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzoBPegcwKxJFL6edL9fYLv9rx0pZ3JFhtpN6y8yLhld4LWEsr5
	NzHdSYoQGgE9T+kP/Jd4/ZWPymezRah9vJ/AJ+P0/uXIxOiIBq/CxPc8
X-Gm-Gg: Acq92OEq57knYQkES3OjIO+dwEtXEK8cNnwOBnqEzKlsD9HAG1HB7oz7CeZHEmxxr5D
	w2Z17bQrR8Gm8E1AKPcXXqi3Dt9KIxUt6/hBVRJ1T2COnl4/iwGmMpr6Chr0H/BThPNAlo6HwR5
	kCtmFtVi/w75xH7z+aEdo0SWR04upbss92SabdXcXYBO6jks6mFq1XUEC8zZ9/xn+ROX5IiCTvt
	jejLcCpEDEvYdecfeS+vn2LjnwuyAKN4Gn18tu7IgAenE+kj2B69jlBZZ8aBxgFJmfCcYS13kN7
	ztxsZ6HvdszD/eVQnu3YyJ8QpIRv+id18Wdfj7fIgkzqJ7JJ7hyjCZg6tbYXzPTun7rf3NBYv/V
	D03YDUqAThdicrquE93Odi33Lcv+9ojZgDewodKw+XPaL5P6ZjYrw8L6R/xV/+lJ5IKeTAD2lDm
	7JpvpKH+8fI2VEIu0YAefasZHHMcGA7iGq+JKi9RUEhTqcz/mSlSd0gWo=
X-Received: by 2002:a05:600c:800f:b0:490:b06a:649e with SMTP id 5b1f17b1804b1-492201436f9mr121572525e9.25.1781526646890;
        Mon, 15 Jun 2026 05:30:46 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-88-103.ip49.fastwebnet.it. [93.34.88.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-490ea95c512sm191426435e9.2.2026.06.15.05.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 05:30:46 -0700 (PDT)
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
Subject: [PATCH net-next v7 07/12] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Mon, 15 Jun 2026 14:29:43 +0200
Message-ID: <20260615122950.22281-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260615122950.22281-1-ansuelsmth@gmail.com>
References: <20260615122950.22281-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_053049_164655_874B24B0 
X-CRM114-Status: UNSURE (   9.10  )
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


