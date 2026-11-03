Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADCA606A327
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2026 13:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=r25MK8yK;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wcC32mY7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9Sz0PIKYs8NuCQn6JiJ89kLrieWO1D2BZeF63W11fao=; b=r25MK8yKkPwIqD
	pojuCo4FWKFYKpEyYzS2Pqmr7oSsGRaSpTMexCV4G+CXE00suwTI+cDmxLtBIEYfj4eZZncq0tIRh
	lr+zumCElSlmtroxMlomz/Seh4W6JmBV0biyzQfcQbrn40PIIM1deEc0+2n7Z++txgi8ArlDy2VRC
	vL1o8dJ4tT5dvR0UKozvWUyGfwDX+g4Gzp7n5He35rTmfgc4H5qPvv+++8dL5W3NQZ/j5xtiiB1+n
	ri/iUfRk664KMZK3EbWKytCOMof2EV3bJazBWwFBkuVQCil0XeGyA9tq+By2VFgiWfNRZbaiMZClC
	dS/02bsoeNe/rJNp5v9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEfs-00000002a3f-3gOk;
	Tue, 03 Nov 2026 13:35:40 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEfm-00000002ZyU-3Nyz
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Nov 2026 13:35:37 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-48dfdd0678dso2929758f8f.0
        for <linux-mediatek@lists.infradead.org>; Tue, 03 Nov 2026 05:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793712933; x=1794317733; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Sz0PIKYs8NuCQn6JiJ89kLrieWO1D2BZeF63W11fao=;
        b=wcC32mY7/rsUMvq+yvBEYAlIGlGBDRmJIXb+Yuiw69KmR5Bocekve4yhpRrVcnYWr6
         jhhIwuwOykK14Elt1sfQi+yzBWRMLSFX+dYnVzZy+ofsX3vzu2nrNmAamblPgfLF/d6R
         5+RtF5I380GbMytvEAAH4SNsxYspX/mvdvw8/c5UBAUuqVHFQAGEfUQ1HA2RJasa+N61
         24d0/awmSAm4dxU375jgf/iQKaxpjy1sv7DNpwaX7xl7A+f6JbGNmfeVtIWe8cUrF97M
         VNN+u76fdL7xQXZVpaNTTvPBaHmldU+zDxdQ3ZiGhAG1HdvucleWJdqJWiKQnslC+0q2
         UynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712933; x=1794317733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9Sz0PIKYs8NuCQn6JiJ89kLrieWO1D2BZeF63W11fao=;
        b=CMHmsYLeUr0euJflcN95djACcu7f7e3wzhQ/3bxeUXW3xRFXGZpuAohbQFOkavejis
         4pzlS70ZWgWiR4eeVsReHrsaOoO+47Mq3tT48AWpCBzUPGZKmNw46vv0P8/QyroE/WjO
         X3/zlQGpmeYT+uV4t/p/nhGOueFbDEL/WnNI8+NU1CS8JJ1Cf0pvsgl4HH10gEJzvNsj
         MJRkpUvzCc5mNoq6AkJ1DIzZkb7w7tEWFVA2mhXP9lZVevzq8gw2nfusJUsmwZ2GNJSV
         Dbei9pkcDfLwA2Wbq6sl4UqU80e7KlCNNXzJayRNZkFGQGoWcG6YZ8XQv3rDOGFwZ2ES
         Ppbw==
X-Forwarded-Encrypted: i=1; AKwUvBxRpTL2Ac74hepG6kbaAN6dlMJnH1WhiU47OkoyaUtGf4rwKJrF1XK1nkGRflesuWI2MsLar3XsiUjTbjfMqA==@lists.infradead.org
X-Gm-Message-State: APuU4Z9CTLgBooiJQFxjPjAdbxGHKw0UeBbdpwxOHJdBQYTQ/fKIFzSk
	cDx3i4w6xNhNKAiTno8sXmdMSY1wkFptDtnSzXt6eYWFVuzUCmlXgvKk
X-Gm-Gg: AYBFou2Z8zS0wN3F4P63j5UaeZUY+upXF3MFLFbVS4YiQNXcxDzNEnubAzzIZOtk8+K
	OL+UnVYrORaUMhI77bTVyymvyhp5lgvCNTlwBFF25lHpaljnounV1luvRZwye7tQcihbFSUdw5Y
	7598OoHW9afFDs5u15ZjmKkl/DKMJ+PG8HJf/oi75eonTToydTGvIqnkDCK9lILaNtCJTccXv7V
	eiB9xACdNA3IwE8x/+cElzX/NeY6azMoJR19JAyuLHWqjOMJjdNhikqko3xSSGiCnldJKb/t2F2
	bTeeKuJgsKlj5DVPTi2npShsTt0giRE9gxzdMQD+eu6syFOMJLZUzz91RsGdPK+Aa1ny8y1r6Vx
	tao90EMjxi3rj48Gb6WmJI+J3Mb5Z7UfUPqOMrjbewOs96kl+CiTUsBTrEsk4vaaHUk8GuStMgp
	NjfxCWo46jCTZeXU1UgbJQRjO3SWY0vL9Y4xGeNnTPPv5LZWLfXppJTfGLU03sEhYauK0zP0/mD
	VyTncsslSktRP1roeoCwAzjR4YDimRvCXyDe/BM+OQGlgq+ZpTm0687B0wU3ReQvUbI5ysT5/OF
	D/FLg83yaZRdsDGspFSWaH9N8WSsMPgbsfssO4l+srIoeBKdEsm4nIeFlJK38y9hL0bMC8B6o5n
	aBeNWg3n6OziRcZoZAORC3hxUwIBGciFUCbd6iGGmhE1N5qKhvfO1VrYPjpmyAdQuxECaB56EH8
	BynOZDSkMA/OqyR8t9Dhc0J1UZFm2fNXLjf3QUY2c5Ro21Bx4rZDCS3q4pwuvUujqAvM2mY8YyZ
	dEj
X-Received: by 2002:a05:6000:26c8:b0:48d:f014:63ee with SMTP id ffacd0b85a97d-48e6e3040a3mr28458056f8f.20.1793712932549;
        Tue, 03 Nov 2026 05:35:32 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-d09e-6586-7547-87ae.ipv6.o2.cz. [2a00:1028:8388:a84e:d09e:6586:7547:87ae])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b80eb1sm26661746f8f.34.2026.11.03.05.35.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 05:35:31 -0800 (PST)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	JB Tsai <jb.tsai@mediatek.com>,
	Allan Wang <allan.wang@mediatek.com>,
	Quan Zhou <quan.zhou@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next 1/2] wifi: mt76: allow LEDs with only brightness_set_blocking
Date: Tue,  3 Nov 2026 14:35:27 +0100
Message-ID: <20261103133528.53197-2-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261103133528.53197-1-pepe.schlehofer@gmail.com>
References: <20261103133528.53197-1-pepe.schlehofer@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_053536_450942_DA6923D0 
X-CRM114-Status: GOOD (  12.21  )
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

mt76_led_init() and mt76_led_cleanup() skip the LED unless the driver
sets brightness_set or blink_set. A USB driver that switches its LED
through register writes has to sleep and can only provide
brightness_set_blocking. Accept that callback as well.

Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mac80211.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index c9762082f473..e3eea578a97c 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -193,13 +193,21 @@ static const struct cfg80211_sar_capa mt76_sar_capa = {
 	.freq_ranges = &mt76_sar_freq_ranges[0],
 };
 
+static bool mt76_led_has_ops(struct mt76_phy *phy)
+{
+	struct led_classdev *cdev = &phy->leds.cdev;
+
+	return cdev->brightness_set || cdev->brightness_set_blocking ||
+	       cdev->blink_set;
+}
+
 static int mt76_led_init(struct mt76_phy *phy)
 {
 	struct mt76_dev *dev = phy->dev;
 	struct ieee80211_hw *hw = phy->hw;
 	struct device_node *np = dev->dev->of_node;
 
-	if (!phy->leds.cdev.brightness_set && !phy->leds.cdev.blink_set)
+	if (!mt76_led_has_ops(phy))
 		return 0;
 
 	np = of_get_child_by_name(np, "led");
@@ -242,7 +250,7 @@ static int mt76_led_init(struct mt76_phy *phy)
 
 static void mt76_led_cleanup(struct mt76_phy *phy)
 {
-	if (!phy->leds.cdev.brightness_set && !phy->leds.cdev.blink_set)
+	if (!mt76_led_has_ops(phy))
 		return;
 
 	led_classdev_unregister(&phy->leds.cdev);
-- 
2.54.0 (Apple Git-157)


