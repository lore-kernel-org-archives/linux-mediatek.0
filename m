Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7984C77B75
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 May 2023 12:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3GlYa/gtfioHyiBI/gLtS8VjxT1YVLAproZrb+Hou0E=; b=k9hnXu2zqoAPQX
	EuxbF2VCQh1IxpcPpjdpqsdUFjnyNgNyUyOgYpWCdWmKzkOh08PPMHLFZ7lmSRmoUpKUxztPVX8xS
	npHOatOLJBHK7Hd78NM7peumx4wg56cthvg0uKNgQgj8Ak6OZkBjL9K6ITWsz+PFFJu31L5aFLS25
	dFMDP8hJ9KoSBKPpmzV066bhTtNTZCvkqxPSD61yZbMYHWJW68Jc4Cn3NR3ovWmF5p9hXpBYoJy7Q
	edir++PAI4Fdop7GUso5VtbbGX8GdQ60dnzh/JOLFFivV6B4KYZQtaaT3WLgEZ80JxDlB/GSYj8lI
	SmquBo7F756UO9yKECpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q14SK-006P2J-1I;
	Mon, 22 May 2023 12:16:04 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q14SB-006Ovx-1g;
	Mon, 22 May 2023 12:15:56 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-96fffe11714so109776366b.0;
        Mon, 22 May 2023 05:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684757752; x=1687349752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3GlYa/gtfioHyiBI/gLtS8VjxT1YVLAproZrb+Hou0E=;
        b=BgHNA/IgLsWdLuIeKOa8zdj4FeAFmGxSiYseC398PviO1oB4odqcU/Fy6xwJz6Z+xe
         QkjbiKKEogz0fAmjMPXXTbJlYwq9tsk33H/ouTCFbp2kQ2b5WCY+bB+CPyM4UOWf3E/3
         VZzR3UYCSFAAugbKGJgcNmUzz8sZLkVz03gOb7NqrvwJE7QhVGS4X3mi3y/cXJXtn3KK
         tu3fN7K9Nqw/XcA/4dCvTz1gR7yO/o/mr4SYMqROKTdTr9K5HoOCdgmfClfySWYtowsr
         e4N96toLkYBKv64gc3foWTYSGC5ICtn0EoUIQZNzU+SmjVK9t6rRUBrWtD7LYnH5kA8Q
         MpXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684757752; x=1687349752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3GlYa/gtfioHyiBI/gLtS8VjxT1YVLAproZrb+Hou0E=;
        b=W1yRszZuE4l/DHxYwwuwJkaUwLwqKf6cje1NVY3iVGfScqayr+YicZtdSTef6AEkS6
         wMI+q2J29zpL5BY0zmAVuY16ll4G6uoNhEsBlbd3dvKaE0xRxy1891NEoQseTM0NirwI
         3IeicHDmYUTlyTVpjHbOCytNYnaoE0j7sICL/SelIbz7XJfevA42mKSmhxP6v3yp6oK7
         tQBYich+Cs8ikpSFod3gjsepnhVxLnTJOgxl9vpj/7R2UmOPMl/HgtbG7ppdkkbkyGT5
         S+pO6Da/72etm+KDOVmBMR7FxQ3Wj0kV/Cc2mjfkw7pd0xKLPMRXKUIILpdbTyIIQvSm
         h7lw==
X-Gm-Message-State: AC+VfDzm0aOHXibUV1L4OYixXp7X7i574T3LKb3lWvEqXAroP0dvAw4U
	5y93nHAkGkJq3GdKxnP8JNw=
X-Google-Smtp-Source: ACHHUZ5ALSJj0jSyx6S9HSdgBAy7lcuTZBOXYIWapLqX0i4YXHmwid/evs1keI+Wl2F7gyxCa8wGXA==
X-Received: by 2002:a17:907:d1c:b0:96f:df95:28a0 with SMTP id gn28-20020a1709070d1c00b0096fdf9528a0mr3477558ejc.55.1684757751614;
        Mon, 22 May 2023 05:15:51 -0700 (PDT)
Received: from arinc9-PC.. ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id y26-20020a17090614da00b009659fed3612sm2999950ejc.24.2023.05.22.05.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 05:15:51 -0700 (PDT)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH net-next 02/30] net: dsa: mt7530: use p5_interface_select as data type for p5_intf_sel
Date: Mon, 22 May 2023 15:15:04 +0300
Message-Id: <20230522121532.86610-3-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230522121532.86610-1-arinc.unal@arinc9.com>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_051555_554629_B0747404 
X-CRM114-Status: GOOD (  12.19  )
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
Cc: mithat.guner@xeront.com, Richard van Schagen <vschagen@cs.com>, linux-kernel@vger.kernel.org, Richard van Schagen <richard@routerhints.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, netdev@vger.kernel.org, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

Use the p5_interface_select enumeration as the data type for the
p5_intf_sel field. This ensures p5_intf_sel can only take the values
defined in the p5_interface_select enumeration.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Acked-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/dsa/mt7530.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index 845f5dd16d83..415d8ea07472 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -675,7 +675,7 @@ struct mt7530_port {
 
 /* Port 5 interface select definitions */
 enum p5_interface_select {
-	P5_DISABLED = 0,
+	P5_DISABLED,
 	P5_INTF_SEL_PHY_P0,
 	P5_INTF_SEL_PHY_P4,
 	P5_INTF_SEL_GMAC5,
@@ -768,7 +768,7 @@ struct mt7530_priv {
 	bool			mcm;
 	phy_interface_t		p6_interface;
 	phy_interface_t		p5_interface;
-	unsigned int		p5_intf_sel;
+	enum p5_interface_select p5_intf_sel;
 	u8			mirror_rx;
 	u8			mirror_tx;
 	struct mt7530_port	ports[MT7530_NUM_PORTS];
-- 
2.39.2


