Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5BB3C77B78
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Apr 2023 19:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=623I+b9sj9JQHMoE8gUBonB4YWYfafGdl6RvYOXiA9s=; b=Am/ZKcrefa0UaPoQqHU6/yjWNa
	l3nx0TmvjokE4aL/y/0DfttNR77UznwbCnwyuQ4YyIMvi0zGjW5cRBpm4nGRhK+AEbzVFinsfpZX1
	53p6nK4akw1qB1DJ/nO5z4bMLvMAGpbEW18sKG4ZDMPeERBZZFbeiSyPbTAdcCePYAIu5yvUscGkl
	Vh6NdxIGkXfgHwk117DXi8Xe0NuJrJwr4KplnwyB78bCJDfKjBKfYyhwi2685GjsB4b1OXjRKUym6
	LV5XcT7cqnnDoxCbflzVQw1ilUdkch3nZi687pHs5NFTKugYUman7RKDYaR9MeXPkHwHHMJ5tesCM
	ncDUyt4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prkkq-004hJ7-1y;
	Wed, 26 Apr 2023 19:24:40 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prkkl-004hHm-22
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Apr 2023 19:24:38 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3f19323259dso63727775e9.3
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Apr 2023 12:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1682537073; x=1685129073;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=623I+b9sj9JQHMoE8gUBonB4YWYfafGdl6RvYOXiA9s=;
        b=txkwhL2liSvbgv2V/br5OZELzu6PxeKpE67gU/OpfSZOLRPr0Q4IV/1S3HnN8lZxEB
         ULpXoOzuVoXSeHCYF68J/dRTwZmz+IVYElEolOaUDHtcxkLXqj6+IvkayBKFSIAFU4Cp
         Cj5tlC/+5zaEq08fnKxONhIGkLIlq+eUak7jnRM0QfKTF3Q521FOP1ObWWn8JWtjgHZT
         5YcQnB8aF+8t67t/8ISkHQy+Wb2BIvnvRly7vLpGjbQg82slREEwpsVsnd0eS6Bg6v2u
         XynQPcxW3uibdKTUncqjLaGbT6tgNC7YGI8ux5ZLDPpwboRld+QuiKDSuGlsw8iWee/9
         BaFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682537073; x=1685129073;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=623I+b9sj9JQHMoE8gUBonB4YWYfafGdl6RvYOXiA9s=;
        b=AGYPudL1o2rLmTFbkEQ5w6TItSwQu/wJyISfRvTmGpdKHs0qyEXFtUTF44ecZHUZmB
         ehKLO+J6x/ugw4l5DxEN47QP4NRlJeSEIcfMfQ/WHmq+HjOVpF3uWVNM8o+PQ2cufsNW
         3ITy3JeGUDRcfPW44SUx67vLMvjGzDYUFs7H+1vRIG7QYKGXPRsdgkeexpITUV/kRnp2
         FHwH3iTC0ZlNPCKBavS6OJsB4dQOj9xnw/BRsrrUKTG4oDfm17oZ3kMrnqnK1y+rUYbX
         m2EnwNPKGpQH6thyltdc01Fa8RNMX/0UxeTusr0aaNu/rTQiDrnRpa41msljXQvb0dez
         77rA==
X-Gm-Message-State: AAQBX9dJ4ND9jCfvtLDQ1f5GSNa0O1xTxcwzZHm/9nKf+cl0SLzL2aB5
	iC8hNyBrBgL8mcj+FzmfmJJ2HQ==
X-Google-Smtp-Source: AKy350b61s1hT/fGboWfJrsEyVqrqX9zy/B/kQ0qe65IuuQ1Z++YEaoBMpkDWIvqEtn+zzLVEq47Sw==
X-Received: by 2002:a7b:cb47:0:b0:3f0:967e:2cfb with SMTP id v7-20020a7bcb47000000b003f0967e2cfbmr14555881wmj.36.1682537072613;
        Wed, 26 Apr 2023 12:24:32 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id m6-20020a05600c4f4600b003ee5fa61f45sm22482137wmq.3.2023.04.26.12.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 12:24:31 -0700 (PDT)
From: amergnat@baylibre.com
Date: Wed, 26 Apr 2023 21:24:20 +0200
Subject: [PATCH] usb: mtu3: Don't check the USB3 status bits if the max
 speed is USB2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230426-usb-mtu3-improvement-v1-1-1cf02434b478@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAGN6SWQC/23OSw6CMBSF4a2Qjr0WqFJwK8ZBHxe5gz7SlsaEs
 HfBscN/8J2cjWVMhJk9mo0lrJQp+CO6S8PMovwbgezRrG970d76AdaswZVVALmYQkWHvoCUdhq
 lxXmakR1Uq4ygk/JmOfEaeR2uApLpeAmRDHdlFMOd/xs7fUw40+d36/na9y9zOhGspgAAAA==
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexandre Bailon <abailon@baylibre.com>, 
 Fabien Parent <fparent@baylibre.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1260; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=lnjx8kcqUDfgilr0fGyRB+NAq/rLS5pv35XuHVTlGDc=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkSXpvI7p5QNlCaGzZG7dVJB/7HfFq9BIZoExjwmkv
 080ExUCJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZEl6bwAKCRArRkmdfjHURY+HD/
 4hwG+Mdt3GhTLAJLObbayoktgbVLjxIFDSoY/xq48qazZ9BPkPhY2Qte2zfBbTjYjy8rJ2mBsSiRB0
 eZ1CCWQSwaCsiT//hW2xlKAjSPb4k5ceRUF0HssuEtBokGnZMK95x5J+FcEiS5OwRnd/BDc/Xx/cHE
 0UoYi5hMJUiUtJA0yQzSRmwL1k7c7mTZrM3v60qAU2/EV1V04OdQUOifGw2d2BaY4WGRhEyiu2C8gM
 NyiCGqXNsvHTLKdQsNQ1YXFi8g8NIT3NNzAmLAd8W8RjnRCP8i3icnvygNKzm6mDY5JEtgbdSt3u9L
 NUKgxtJ6UF7TQNEb8BjY1aAS0aGyKRJ5O936nOq0HY0oIMKqWqSD4vk3GTugAIkWGSjtFKp3qS/gp2
 9imZjJlZtyK8jMF0N1frygUANSKcqd/1oIS0qSB7YgR6yPv99JJEqzxHyr1QfPLbZPfklU1lRbAASZ
 I1v1/PZROhA8SSc5FRGiceKuOJ+v25kBk92Jjs0oPwraLRVxDPqCTBd8nFyslj+Hc4QocqgNpCi7I+
 /unp2jqRGVoo9iEh3kZp/AJ2CNPySp9rCsfeZo1xX2c4PBb1eBvrCnv9eXhl+VUTadHPpgipqHFcHU
 PvCjX56Zf08oS7nE6mMbS0m1gESio5CeRG0Ps3FhjWsOBc4c1KvLuT1kjIDA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_122435_887336_19F1757E 
X-CRM114-Status: GOOD (  12.49  )
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

From: Alexandre Bailon <abailon@baylibre.com>

If the IP is U3, the driver will check some USB3 status bits.
This could fail if only USB2 is used.
This only check these bits if USB operate at USB3 speed.

Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
This patch is ported from downstream. Without this fix, USB doesn't
work if USB2 protocol is used first.
---
 drivers/usb/mtu3/mtu3_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/mtu3/mtu3_core.c b/drivers/usb/mtu3/mtu3_core.c
index a3a6282893d0..00dba871aff8 100644
--- a/drivers/usb/mtu3/mtu3_core.c
+++ b/drivers/usb/mtu3/mtu3_core.c
@@ -100,7 +100,7 @@ static int mtu3_device_enable(struct mtu3 *mtu)
 
 	mtu3_clrbits(ibase, U3D_SSUSB_IP_PW_CTRL2, SSUSB_IP_DEV_PDN);
 
-	if (mtu->u3_capable) {
+	if (mtu->u3_capable && mtu->max_speed >= USB_SPEED_SUPER) {
 		check_clk = SSUSB_U3_MAC_RST_B_STS;
 		mtu3_clrbits(ibase, SSUSB_U3_CTRL(0),
 			(SSUSB_U3_PORT_DIS | SSUSB_U3_PORT_PDN |

---
base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
change-id: 20230426-usb-mtu3-improvement-77d987def9fe

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>


