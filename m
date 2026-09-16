Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B46C982C4
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2026 07:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JKZMmlDJFNSMtO9huPhOVTb/TTA3LxjwLBEnHIboH44=; b=ebSGVhesO+Ham/oY2M2lAevBni
	OM3LrTxjoXgbogDBh0CHr6hWZLorOR+l85V77BjB+0wJwGoyGykt8BZ2fU4ZaGavWjNBcd4fHZZ/I
	mgSjVFdJZzTlwd8LEPb9Yzr2TdLB+3VMuVajLi/TIm16fDi2FBsaS8YJVh+8VyDuyK2CrzhBixoSC
	K1uRlIi7I0ldUzXFQWL6sYZcmFYcTKhmIwoAW5ZwYKDwidSZp3jQvnGLNhbU4mfXtUiSmWkxIHfW1
	pBhl5v6Rttxy2cipSxj3HSdxSpMjGeAFCtcXBI7gpMoEtN5PkiaInQNu4yAXFhDS1z3SnZkgGuePh
	exJS47mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6kYE-00000008eHN-1e0a;
	Wed, 16 Sep 2026 07:59:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6kXu-00000008e42-481g
	for linux-mediatek@bombadil.infradead.org;
	Wed, 16 Sep 2026 07:59:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=JKZMmlDJFNSMtO9huPhOVTb/TTA3LxjwLBEnHIboH44=; b=p0VhloZWpjipvmI12IgAYsnH7M
	b4/qvmJT4Ie33GGvl3kcwTbvp4zvAI2EC0OTvN13woMMLiHqq2Y6c8WYNWdkhe7Ay+TKaOFJFPKqU
	92IaZPGYc0VZdVAktEGTHevO6dbsE4TkFE5A4cWU6ULc/rgRMvrhqijGCwcAG71zZKkNnKoTSTkyh
	V8LACoLduXiF8VX7j+9GIefmL7Goy8u1GzR3cCvTd84R34CxB41QnYTvaEPYyCEN4YAcZeZIJtFNG
	aTNRZNTLfxGM8DjYH0E4vB8VV1SHed8bPKHQqeFrTf2fJPjQDJqS6CxRwut+xt9xCBROmNp8ta+RV
	8P/VPeyg==;
Received: from mail-pz2-x11.google.com ([2607:f8b0:4864:3b::11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6kXr-00000007baC-08ic
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Sep 2026 07:59:09 +0000
Received: by mail-pz2-x11.google.com with SMTP id 41be03b00d2f7-cc4cdc0d663so353326a12.3
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Sep 2026 00:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789545545; x=1790150345; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JKZMmlDJFNSMtO9huPhOVTb/TTA3LxjwLBEnHIboH44=;
        b=mZEz8L0lPEU9rioo7FTNWiW1RihtUcm+uTeoKdESbxTdI/11r83oLaIHu6/sGdtNA5
         xHNt6RA8vy/8LhDaEKmd+1AjAPADqOojmUPfQv2IiaoOdXMl9uDBTGOBxtExdD54S3D9
         VCn11Ze8AYoF4QvrvfpmV5f1Ncl15bjNViEFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789545545; x=1790150345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JKZMmlDJFNSMtO9huPhOVTb/TTA3LxjwLBEnHIboH44=;
        b=zBDgj6MWK3tXRHMGHXvjeibd/oaz7/WRND3tuN/Mu8081NJ+7PknDA6Wg+JN2VOZMv
         hHXbAazqturn0Vc4rCkxLd9jQMs1wOCz1j0c13TzcwkZjsVguWkrsLYZXmweL2u6ESjG
         OpJN5RteOgRTe/+ZE589Gjhod0XEntyNbUhaOJvBN2tTUTYt99U46cqSWXzlC+/Cdel7
         YktXl9YDg10+JY908r4llebwobN6ct/V6QH6y8nf0BkAlgysGOAS0i6qsUumskMa2jEP
         JnDCP/Vkiec4Ii/Iw7H5X5KgJCFNOFlaA7Dp9RJjD0IaZrYmm1dMwtS4Xc5BxK8rtkdi
         Pj+g==
X-Forwarded-Encrypted: i=1; AKwUvByUnC2bxJCDm6g+G2nX37x3EXb3a7xiRPhHvSUpo3kqYtWuH2OwnciV3Zeaz8TYWXUQI36c+ZEQeit9QzUwkQ==@lists.infradead.org
X-Gm-Message-State: AFuF++nHVWwVLQTLFIJxGl9bwOxH1xcqhGH4ODLPEgGdd65zskzvmJoC
	Tw5zQHrjk3y3Z2VhGyf/B7uCq3drb4Wjl0+eMm8qzSPu08QQHdvAxkbzGdIVa9xjDA==
X-Gm-Gg: AYBFou1KKVtjxLLwKP0e1qTnNqsxvwrVPdPoDKJ9OWKjdExYC8jrEniB//mIYbbjAZz
	dv9RCqmuz7WOK6z7PBN3OJPOJtizhwYw0sScE1Ca+QKrbjNjaarQADJ3nzF73PUW0PPq9rTK3VA
	nWXIItX5f3ppoJwXTpNOr91RIgEnKPC8td/ftQxP0nf1esaGfBZ3a5Z9kjcJpZGTPmmhK+eG0VR
	I8ghvo7If2r4tuhqQgIFvLdbMnP8yf9bpdLBk7TzIV0rSIefzwbD30xMZgJzWdw2zDoEhJ0ngv0
	ADboHnL728jcwEZt/fDQ1hG2ZUOdnjxdWcESFwbYHgZhysqscenu8Th41eCLuhBCAw6fuy5daJF
	2ajIgSRT0zsXMB9zd634Kk+PMMZoJCmrZM5qzu0fOcKK9a1GOCht8DUoM1MJ9vBieXR+Jut4q1j
	XX/McfdJ0kpCOonHMy9f0+1AsXT+BhEDu1Gdx18tV0UX5cVaslUz1gC4F5Ugj6Ro2M08H1q+yZf
	CMC5vjRTbgRbASdS5W7ZH2VB/GpCibKyWNwiv1xzH5yNVh0scPMsg/2FQ==
X-Received: by 2002:a17:90b:440c:b0:39d:fea0:c17 with SMTP id 98e67ed59e1d1-39e1e309c21mr3793724a91.8.1789545544841;
        Wed, 16 Sep 2026 00:59:04 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b7acba2sm4348197a91.16.2026.09.16.00.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:59:04 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v9 08/15] usb: hub: Use usb_hub_set_port_power() to control port power everywhere
Date: Wed, 16 Sep 2026 15:57:34 +0800
Message-ID: <20260916075745.3549953-9-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
In-Reply-To: <20260916075745.3549953-1-wenst@chromium.org>
References: <20260916075745.3549953-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_085907_238626_287858D9 
X-CRM114-Status: GOOD (  12.10  )
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

There are still some instances in the USB hub driver where port power is
directly controlled by toggling the USB_PORT_FEAT_POWER feature flag.

Switch these instances over to usb_hub_set_port_power() so that only one
unified function to do this exists. This makes adding external power
control with the power sequencing API easier and consistently applied.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- New patch
---
 drivers/usb/core/hub.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 1a98ccfe2664..f309ceea1969 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -979,11 +979,8 @@ static void hub_power_on(struct usb_hub *hub, bool do_delay)
 		dev_dbg(hub->intfdev, "trying to enable port power on "
 				"non-switchable hub\n");
 	for (port1 = 1; port1 <= hub->hdev->maxchild; port1++)
-		if (test_bit(port1, hub->power_bits))
-			set_port_feature(hub->hdev, port1, USB_PORT_FEAT_POWER);
-		else
-			usb_clear_port_feature(hub->hdev, port1,
-						USB_PORT_FEAT_POWER);
+		usb_hub_set_port_power(hub->hdev, hub, port1,
+				       test_bit(port1, hub->power_bits));
 	if (do_delay)
 		msleep(hub_power_on_good_delay(hub));
 }
@@ -5461,7 +5458,7 @@ static void hub_port_connect(struct usb_hub *hub, int port1, u16 portstatus,
 		if (hub_is_port_power_switchable(hub)
 				&& !usb_port_is_power_on(port_dev, portstatus)
 				&& !port_dev->port_owner)
-			set_port_feature(hdev, port1, USB_PORT_FEAT_POWER);
+			usb_hub_set_port_power(hdev, hub, port1, true);
 
 		if (portstatus & USB_PORT_STAT_ENABLE)
 			goto done;
-- 
2.55.0.1032.g73a4cd73de-goog


