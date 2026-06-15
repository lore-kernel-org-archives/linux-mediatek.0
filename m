Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD6ECD98C5
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jun 2026 12:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3neVONgdAVcEZX3f1l1KWGoYXB46SXm/tOXseRIlMNM=; b=GdSYFqTQ8G3b5TYUnS7YWaDrMG
	C1YShlI7roFUct02mdZy4SQ81DfU+w1V4++El7pIJzD4j+qvLNXtaLvyYReEp27oMJ9yjLaPa2NTU
	BKWsa5B6e77nCwevO09gDvClD4jYqhsHJA65a9fOYL5VLFVfDgDnD/iS9jbpJjaH6m7Gjb4JR6EVA
	LdXM/5wXAEFywFHr5751Q26vs54WoSSAnkg1GCkq/Ey3mBhTUk32Zc0PZSmZhDGOVZQYfY06wjSu2
	wOk62GBxbZO4VktLhNAthmZmUSdttOYcP5V1X8AylI9NHzXUKQKQ7FqbMAH/FuNUa1LSeObTPrPMw
	diK5C4/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6T6-0000000EBq5-3Y8O;
	Mon, 15 Jun 2026 12:31:08 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6Sp-0000000EBVG-0Kz9
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Jun 2026 12:30:52 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-45eea68dd6fso1664127f8f.2
        for <linux-mediatek@lists.infradead.org>; Mon, 15 Jun 2026 05:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781526649; x=1782131449; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3neVONgdAVcEZX3f1l1KWGoYXB46SXm/tOXseRIlMNM=;
        b=r7xHCa9bQufmFBR5UFODKSdmwZzNw8WirLxrw2hPNkmHcCeSo39Ct6uFef1FExb3Dl
         U7S6zQZIwVX8n8kKoo6joHM8CLKa2Ou3tIpgfyMubnGZGJOhDTIf4Vm4Oa4U53qYNvrZ
         Q7VOWYeWeXkfQBc5EoV9LlO4u02ru2jjc5WHzkZxJGZUuhUHHbHZ9rN7BfWOIzsMpojt
         +ItPTucZyInhs7PGvI4SORwhBP0Ii4Rz3IDRBPEPUsGJZ14Nlx/14DVenvABsJaqSKro
         cEupeogHqorWyA7NkNHhDR95YTL7hrzcaTBD9zXTUCKGWM1zkS4BTMB47aas+L/tYEL1
         h2FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781526649; x=1782131449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3neVONgdAVcEZX3f1l1KWGoYXB46SXm/tOXseRIlMNM=;
        b=fW77xT/aMvYO4U52CwvQKPxbYJljKWNpriTTKjCIhkhlQcZOkgQrJ/CY4gS00ruEtN
         HWY6hf6GxQrGNqh0clt3r/b5vGWi+Hl1hreYSMwcg1mAh7FG0NQb8gRk0Y0EeC53P54j
         o0n6eKHgzK/NKuPoXhI/IEM+65p35U0Ms+AHRvxu7nNr000OExRT33tE0k1esFtxLmeM
         8HBrrBwSct4FzVN3yzKIvNsgsZ7faBTQQfn4UENNaMH6rxuikjiTWf7I/MnExZgsdwCC
         8+HdKRAZk9zj7QRREChJeYXImKILkHv/Shmeybkd8RwIR/5fF4m66zuMoGOZSUTTlQOf
         GwSg==
X-Forwarded-Encrypted: i=1; AFNElJ/1bc0KLgNtPwjAfgvgm6QZrqUdUP9AcxpCnccLariwAtVnf1VnPBU8+5qF42fYwhoL3yLQKpHMuU+QyQIBgQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YznFulYCVsqmF0NnMplcLsVMrAkA23JxW+WmkyjX8xz8NsnDG2R
	iOhlKmm9xeqKat4x/5zKKvhKiPzDrONnZHXA9YbbRh2vs64ihf9F7aC9
X-Gm-Gg: Acq92OE3yhYpqKkkt8cKBvX48Aab+PtSk0sqdR1hWnbWWKwhp9ul4CP6JpAYttwpv5M
	S+vArxVYBKmTOL2fXifLHSDKv4YePjMu7ReaIHGDjmsCaDtHmMeRZ6fYeY7bP5gSOkXDQUq5lwR
	47+elG/aa/13Ntdi7DkWf2pTm+yJnDE7Q+M6QPHhbY42Re7iwv3+4eLzbzW5cRL9MdT7KfSfCWH
	RMQvS/Cx6gCwtH+5caIUL3P3aht2sbX4RBQlo7Hyq6C5qXiA4dFBcrGPui6Vxp91ZNyDEKWyyL2
	fe/jUdXLLUIglZlOeYI2O3zlnrFrSc6hivmo7v1xxjd1aFmO+JR5gNpCAM6wvaVyAeacIBCTmpS
	JpzYFuZ8mLkA93q7w0S4B1qBvRUm+GoSK5lO92NDg0d+EBpgAMfC4Yt/RdWE+3m8ZVue4x5f4tn
	gzRp5zAC9/WxDVRJU1Z04WTyNjVBrQMbHdgnhuCeM2kAl2/Gj4ZuTVrkjXeNOYeLStOQ==
X-Received: by 2002:a05:600c:3585:b0:490:b642:ce29 with SMTP id 5b1f17b1804b1-490ec4d4f71mr195103365e9.8.1781526648835;
        Mon, 15 Jun 2026 05:30:48 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-88-103.ip49.fastwebnet.it. [93.34.88.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-490ea95c512sm191426435e9.2.2026.06.15.05.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 05:30:48 -0700 (PDT)
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
Subject: [PATCH net-next v7 08/12] of: property: fw_devlink: Add support for "pcs-handle"
Date: Mon, 15 Jun 2026 14:29:44 +0200
Message-ID: <20260615122950.22281-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260615122950.22281-1-ansuelsmth@gmail.com>
References: <20260615122950.22281-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_053051_146504_55E82602 
X-CRM114-Status: GOOD (  11.07  )
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


