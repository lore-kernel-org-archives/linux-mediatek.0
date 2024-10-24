Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7BEFD0BB63
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Oct 2024 06:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pXMUNc/LORv2j86/u57jzQlk6FOM7Zoz5+8UmtPcmgU=; b=sM4L0pRIC24qbTiKyXuVbTnRKU
	Sdh3zbQCOL5gfG769XybxdjnNZWUx1kV/DlW0nVZ2b9zy+gzHMHH5Udx/ggz9/HsPs1M6F1Bq4zeR
	1m4dDnhnwGtcm5hypFvfxJJET6arDMRTa+UeNWLJebOuMvZURX7X0PnzUOqpQz/GcUE8tix2UZNt7
	UE5JiF7G7prhcNebl0+5ZM1ms+1yLy61ZuV4HQp9qU2E4BYOGlhYEIoRAbSsOfRaiP+xEU+s/auel
	9p4ZYO/o4QLGciqjpQ6PA6HkrW1ax40Xx5tPZw4YRbKyAO8Kg1aRtGMEFRg1FqjUB/05+JHXAAzf2
	sg9qX5IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3r9g-0000000GtA7-0rxn;
	Thu, 24 Oct 2024 06:17:08 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3r6f-0000000GsUC-3Sr9
	for linux-mediatek@lists.infradead.org;
	Thu, 24 Oct 2024 06:14:04 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6e59dc7df64so7436207b3.1
        for <linux-mediatek@lists.infradead.org>; Wed, 23 Oct 2024 23:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729750441; x=1730355241; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pXMUNc/LORv2j86/u57jzQlk6FOM7Zoz5+8UmtPcmgU=;
        b=IXgfvbYsY1d1Uw/bAd3dB6/xLCclHbu32zXuO3GvjhL7npcJRsFYVrb+fGvlKoBRN0
         FfDjNvnVGTCvrlf7gAWFUQGCSA3HMLGBI4+JoNBSWE2RSeWsBr8eIpg3OYpWH6xUjR19
         qvBX8h9RuXV04oBKHr4cpzp/5f0ycG20QYlgBmZEUlgDw1P2Q/K1uDKQZ6iwHJ0AzGxP
         KFGnto3GNLU0Lb642lPh/S9Mgf0mNrjQNwphZWJdD/OsA/C7WSuKPD51+W9GlViGwvps
         W/Jvo9ZlyG8EdIHYjrRJ8rYQyolFK2MZ2wSKCsV2KAG0GMcKwu8prR31KPEKJyqTrH4v
         Vk7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729750441; x=1730355241;
        h=content-transfer-encoding:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pXMUNc/LORv2j86/u57jzQlk6FOM7Zoz5+8UmtPcmgU=;
        b=UYEvFPjMifOUIH/2a4AsGsjZUb6BuJUYrsioPDMX+Z3cW5wd0j99s22EVYZRr3ZjOO
         JjEBTg1lEimMSf6nolTroSowTF1kkzv759PBuR+lIHJDU13cXXK/Mj3Y1C54MQduLTjN
         7EWalwniHrMTQknFZ6actcXV3JBSWOLsNhdposlp6F/43Dvfpqak7IKEVVn8rIY8yGfU
         zjz+5qfE9faCkV/W05QSUT89Oy5mQK8ABD08JfyWrvK3ZbHtSKvnLc+Bf3/RiOyMexY/
         uu7LkkC+B66uLH3Aks6ys5hDSGrfOclUxnkImYj++Uh6OjHMvyTRtZw1cezMVp2nZKz0
         UOMw==
X-Forwarded-Encrypted: i=1; AJvYcCXINZi8kdn2EeWKHEzQNv6vaD+q2fJ5HhHbuNImajPp2rtUt5P1UhAK5sicXduZlOasb+siIap7Aon5Fm4U9w==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywgowm4EgC9N4Ni3xS5gS31GxJdd/2xZ/Nvz8OI0gKFhCegehWC
	iY5X8Vj356wRMuW7PJyX/ny469JgwZhQ3B0QFzNBP99Je5D5VeKM6MikNl9tnYiwomo+8B+31Yn
	xCyNYysVHUjfTUQ==
X-Google-Smtp-Source: AGHT+IEvWKI797qzaVIyJQytUKUTuDrxqDTilc69F1bH77+J3k5wYMBvLRY6cYuzVgsPwwCo2eftygSjpmQuXoI=
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:965e:f81d:c9fb:b352])
 (user=saravanak job=sendgmr) by 2002:a05:690c:9c06:b0:6e3:c4cb:689b with SMTP
 id 00721157ae682-6e866350bbfmr483267b3.4.1729750440665; Wed, 23 Oct 2024
 23:14:00 -0700 (PDT)
Date: Wed, 23 Oct 2024 23:13:43 -0700
In-Reply-To: <20241024061347.1771063-1-saravanak@google.com>
Message-Id: <20241024061347.1771063-3-saravanak@google.com>
Mime-Version: 1.0
References: <20241024061347.1771063-1-saravanak@google.com>
X-Mailer: git-send-email 2.47.0.105.g07ac214952-goog
Subject: [PATCH 2/3] phy: tegra: xusb: Set fwnode for xusb port devices
From: Saravana Kannan <saravanak@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	JC Kuo <jckuo@nvidia.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Saravana Kannan <saravanak@google.com>, 
	"=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=" <nfraprado@collabora.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_231401_927512_7C406A2C 
X-CRM114-Status: GOOD (  11.96  )
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

fwnode needs to be set for a device for fw_devlink to be able to
track/enforce its dependencies correctly. Without this, you'll see error
messages like this when the supplier has probed and tries to make sure
all its fwnode consumers are linked to it using device links:

tegra-xusb-padctl 3520000.padctl: Failed to create device link (0x180) with=
 1-0008

Reported-by: Jon Hunter <jonathanh@nvidia.com>
Closes: https://lore.kernel.org/all/20240910130019.35081-1-jonathanh@nvidia=
.com/
Tested-by: Jon Hunter <jonathanh@nvidia.com>
Suggested-by: "N=C3=ADcolas F. R. A. Prado" <nfraprado@collabora.com>
Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/phy/tegra/xusb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
index cfdb54b6070a..0a2096085971 100644
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -543,7 +543,7 @@ static int tegra_xusb_port_init(struct tegra_xusb_port =
*port,
=20
 	device_initialize(&port->dev);
 	port->dev.type =3D &tegra_xusb_port_type;
-	port->dev.of_node =3D of_node_get(np);
+	device_set_node(&port->dev, of_fwnode_handle(of_node_get(np)));
 	port->dev.parent =3D padctl->dev;
=20
 	err =3D dev_set_name(&port->dev, "%s-%u", name, index);
--=20
2.47.0.105.g07ac214952-goog


