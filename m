Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52877C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 01:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=S2ALH10CiIJ9QarbU1oFFB9yUYMcWtOsqvnVKD2phWs=; b=JJTszDSNPQegWROE4QsJvAJGCv
	4me5HXAhxXWKfJNe0ZbmnfpiirAzqlJ1vKkTkRUKzskcG8TRn1gRjxgMweMvTYyImmOmoOpVBhOi+
	vRgP8pkbt5VtfUeVOEADLSlWR++KFMpi7enpFHRV9jRm0I9camBJBSSS3KdW9RSa7+uo0DIEp9NDq
	gZU1cJ2S5/wTBk6nq6/ATPlnXJgwUQygK3ENtNeOQhDA52QsKHOoXfvG7xnJ/Pqw2lD/4R6GWv+Rj
	71ScyXX4n1KwmZoc+EDfnFe2Er++qEiVvJ35qGO4VUXr6AFgSUplGh+EAEvJzHDVlTtrASGuHQe8j
	1epyQDDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6Mhp-008wxR-R9; Wed, 29 Jun 2022 01:41:25 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6Mhf-008wt5-6G; Wed, 29 Jun 2022 01:41:16 +0000
Received: by mail-pj1-x102c.google.com with SMTP id i8-20020a17090aee8800b001ecc929d14dso226301pjz.0;
        Tue, 28 Jun 2022 18:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=S2ALH10CiIJ9QarbU1oFFB9yUYMcWtOsqvnVKD2phWs=;
        b=Wtpkw/+ZZca6AButPmm3hgE1RwtlB7vp2QjhuYjzW9XWR5P8J835GNQ9GfSeFSr4Kh
         9A2cK63SET+iyqCW2bFPd0GgSjFj0viFFM2+MD/kKYKPhLzkWvjhdugQsWd5rzaRbZhR
         WCEh+IW2w975E9HgFUnPNMC0N0mXMy8x2LaUP43iNQuvM9XlXEqO3AELxs9RKI29vkfw
         JP1EAjSd8W+1XpcKznqvQBolr6YlNyaYggL+MqqtmWlPs7zAKGVYN9TmisZPAS4OanZb
         MWx8xF5OrGr7gCEKgUbMq2LUGYEbYXjAZ1AkOm1OsQsbh2/HTf8eNDPVqCiBGnLWX2dV
         /pdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=S2ALH10CiIJ9QarbU1oFFB9yUYMcWtOsqvnVKD2phWs=;
        b=WFANLAclSp73z8yTRlgD6LfDcd9NyNfDHi/kBYarvyNEfMTQO2Z3Rf8NcnysgicjuZ
         eDdsmXxhs5Sh6kuIS2BthdpfRxpjbxXeDWy9oQH4/2QLJz1ss2yQSiRgDSVqBVaU6Wn8
         XhvRNvnNMbgqCjzXe29ceriFwh1QZVo9BNovz3+xrIqmK2JRoTLHIfCM570/gp7RAiko
         lbp+vJBVYs4lg8vBNf0T1Jf3gOMqyGqf2TIGFGErj69GG5BSEbNfsXMuT2kLvr8b0NLD
         vrbHEvR9qYnduMOwu5SSXVWU/Hhbh0j/CgF7BFQKM/CAz1YasEJBaNNv4milAzUlvUx4
         jC6Q==
X-Gm-Message-State: AJIora/pgPacL7kBJxdxtJ5JaReS+tuY37VamuyUBRhQPlcaPlkHR78U
	btB9ls780aBlrxmzRQinT00=
X-Google-Smtp-Source: AGRyM1v8CXE6gypzs36wg8Rh/T42PFlavrif+6TTtAf/MYaXBleCdFPsSq11fHsVxknSlLyhqjDIcA==
X-Received: by 2002:a17:902:ab87:b0:16a:82a9:feb7 with SMTP id f7-20020a170902ab8700b0016a82a9feb7mr8011328plr.37.1656466869173;
        Tue, 28 Jun 2022 18:41:09 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46a:3e21:914b:bb3e:3e56:4806])
        by smtp.gmail.com with ESMTPSA id u15-20020aa7838f000000b0052592a8ef62sm7182965pfm.110.2022.06.28.18.41.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jun 2022 18:41:08 -0700 (PDT)
From: cy_huang <u0084500@gmail.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	matthias.bgg@gmail.com,
	chiaen_wu@richtek.com,
	alice_chen@richtek.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	ChiYuan Huang <cy_huang@richtek.com>
Subject: [PATCH 1/2] regulator: mt6370: Use 'fwnode_gpiod_get_index' to fix gpio parsing
Date: Wed, 29 Jun 2022 09:41:00 +0800
Message-Id: <1656466861-7737-1-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_184115_275250_45F6F68F 
X-CRM114-Status: GOOD (  12.07  )
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

From: ChiYuan Huang <cy_huang@richtek.com>

From the common binding, 'enable-gpio' or 'enable-gpios' are all well
for external 'enable' gpio.

'gpiod_get_from_of_node' only parse the 'enable' property, it need to
add the gpio suffix. It's more convenient to use fwnode_gpiod_get_index.
Although fwnode parsing is not preferred, but 'of_parse_cb' already can
guarantee the callback will only be used by regulator of_node parsing.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
 drivers/regulator/mt6370-regulator.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/mt6370-regulator.c b/drivers/regulator/mt6370-regulator.c
index bc356b4..949b2c7 100644
--- a/drivers/regulator/mt6370-regulator.c
+++ b/drivers/regulator/mt6370-regulator.c
@@ -153,7 +153,8 @@ static int mt6370_of_parse_cb(struct device_node *np,
 	struct gpio_desc *enable_gpio;
 	int ret;
 
-	enable_gpio = gpiod_get_from_of_node(np, "enable", 0, GPIOD_OUT_HIGH |
+	enable_gpio = fwnode_gpiod_get_index(of_fwnode_handle(np), "enable", 0,
+					     GPIOD_OUT_HIGH |
 					     GPIOD_FLAGS_BIT_NONEXCLUSIVE,
 					     desc->name);
 	if (IS_ERR(enable_gpio)) {
-- 
2.7.4


