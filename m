Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE3E2CD8CAA
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jun 2026 15:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3neVONgdAVcEZX3f1l1KWGoYXB46SXm/tOXseRIlMNM=; b=LtQ/2E2e30wWzqRLcI56MR6ItW
	BGTZtFgd+w4mZXF1MONvw7W5TgqGJcPHCsdt2fHQDs71pWh36e+VKnrqPtoD/ka8n/iwsKUZsSpqc
	0DXKs1mqtJnuZ97ChqrcDpElSgi6W7z90midwfPvZbV571aE+HC0cpLlnCNCNm0Dcbb5lQ72ZNa9u
	rBRSulD+G/EOPIu0VRHaJnV+ejwppA0DYDHk6Gf1ASK1j+xuwOxZERG74WnVavefg8jTldfgl20Jo
	snsCieoL250Ag71C78i+OHju9VIpHEXpYRmMoWTSpral/7u0A7KepWb3lOL3w54GYdog1bRxNxkcs
	r0YUQJQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWy8y-00000005sbQ-26kV;
	Tue, 09 Jun 2026 15:13:32 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWy8u-00000005sUF-2pn8
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Jun 2026 15:13:30 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-68bfcf11050so10362346a12.0
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Jun 2026 08:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781018007; x=1781622807; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3neVONgdAVcEZX3f1l1KWGoYXB46SXm/tOXseRIlMNM=;
        b=MMuT71MFJgjuYq8WME89dNukzF1e5ZW19SzkvcISaX729UNyQCrSH3/CIwcHLT3+kc
         iKlt6LimEFnzLGyEYXPShoZlxU3bNuEr8CYd2u4yS9JrXrM8jZYha539qJL4IK+3oytJ
         lOT1JtQWim2mEJDLbS5IW4XCl4n4zAMwF4uaWdyX62de9w+Raq8UyOxCNbZV9ZVx/VCz
         F5VJsW5SwAW/CAMijaqpgF207t7rq7gDimBMJHkcvZmT4phlpQJoABPt2vl3c9mzve7o
         G3tGYpbaKO5c0Pnk8QGrBtDouqLlARpAhiWFviLU/ThM0/Wd6M0Z5Pc6EXBZy/8zKDOG
         5DrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781018007; x=1781622807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3neVONgdAVcEZX3f1l1KWGoYXB46SXm/tOXseRIlMNM=;
        b=h9+Y/1C1ep0uur0vlCdNosiXRIy7+axYArgtpmo4U8c+gTZvTWqz8A9L7wUkRs7xd6
         HYLsrQ9Nk1dBb4rxJ9t9pxd5HwANARekAqSTiuRXr5Zgwtj3i+mFMiRt7rQcMg91sYAw
         nSXoqngbwa0SPKXR/c1iBY65N00ygfbPLRSghbd7Un8M7OccrR0s1PjJQOAYkjmsLjQc
         nBcuXJoq9XPbuPelHCqh9iMyRtMl6v3OrDt0NTWa05YyXDF1lBIbxbN4spE6rTpcdsNS
         kwvSinxg8soSSf/8nu6vAk+IkWzRF4HPFyVWK67iSn6JbulwY3fV6p1V6Oxmo5kpoohz
         0gww==
X-Forwarded-Encrypted: i=1; AFNElJ/F5mjcBTpj9C9Uyd8SjTDxHi7FKxyBKY48hOa19YiTQJV5yNtIXlW3suCTt0fdCkLspSkq09qguPn/zlP04g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzL74BjH59gGuekXiZz5hkUlT5n2lYLOrF6lneRAp1yTvTIDala
	L/2vrEbs7d8g36lnpaXCD38g/Rs8m/9UXszi/KrEn6JDF7rd7MY9zGTK
X-Gm-Gg: Acq92OFIAEvNUYzbdzV3xN5tXfRb5kNYLOx3pNHMzuFyQtNmSUmqyhiO6sqeS8/F/UX
	7CD2avIjJzcsAEUSsXR5YpvssC/hUPZEEqEApaSZG+Vi4TjSMT8YaTRk7laD+QcdmLz1by+ITNX
	/nbeUb+DGl6KPLjoBSEIaXP8vohyMgAP1a+yj2OvCs76QjcpuWy0VjjCSGLtYBmxm8Nd7QEDtzO
	qpTGoUnzT92Oe7CzqHRWkLz6DD4hWCfe+DUAwShqTU8dsiTgOYBV45vM1hs7g7gAp5Cf/6wHx8C
	QrTX3dLnfAhxKJFaaboYZQmZKd9dv7+kKa6Qdc3h49xBWK/C4jUQ1P15gtqJmooCo2SRn6dx2gF
	q75pE7+pOsqnD9J7KR9NOyCmh7cJTXMl82xIdPr7WatQ6Xcz6DfG+cJXyGSUeVsMZtnE1/yexBb
	sS999BtDX0wF9iTDw0iTHo5g7mVUQRWRhl
X-Received: by 2002:a17:906:d552:b0:bd9:2b46:99b0 with SMTP id a640c23a62f3a-bf93a00a5c3mr170280066b.49.1781018006681;
        Tue, 09 Jun 2026 08:13:26 -0700 (PDT)
Received: from Ansuel-XPS24 ([2.195.136.12])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-bf0517721e5sm1073637866b.9.2026.06.09.08.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:13:26 -0700 (PDT)
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
Subject: [PATCH net-next v6 08/12] of: property: fw_devlink: Add support for "pcs-handle"
Date: Tue,  9 Jun 2026 17:12:04 +0200
Message-ID: <20260609151212.29469-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260609151212.29469-1-ansuelsmth@gmail.com>
References: <20260609151212.29469-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_081328_781140_7A934602 
X-CRM114-Status: GOOD (  10.81  )
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

Add support for parsing PCS binding so that fw_devlink can
enforce the dependency with Ethernet port.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/of/property.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 136946f8b746..e6584a2f705d 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1392,6 +1392,7 @@ DEFINE_SIMPLE_PROP(access_controllers, "access-controllers", "#access-controller
 DEFINE_SIMPLE_PROP(pses, "pses", "#pse-cells")
 DEFINE_SIMPLE_PROP(power_supplies, "power-supplies", NULL)
 DEFINE_SIMPLE_PROP(mmc_pwrseq, "mmc-pwrseq", NULL)
+DEFINE_SIMPLE_PROP(pcs_handle, "pcs-handle", "#pcs-cells")
 DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)
 DEFINE_SUFFIX_PROP(gpio, "-gpio", "#gpio-cells")
 
@@ -1548,6 +1549,7 @@ static const struct supplier_bindings of_supplier_bindings[] = {
 	{ .parse_prop = parse_interrupts, },
 	{ .parse_prop = parse_interrupt_map, },
 	{ .parse_prop = parse_access_controllers, },
+	{ .parse_prop = parse_pcs_handle, },
 	{ .parse_prop = parse_regulators, },
 	{ .parse_prop = parse_gpio, },
 	{ .parse_prop = parse_gpios, },
-- 
2.53.0


