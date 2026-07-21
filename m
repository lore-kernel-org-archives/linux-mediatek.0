Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CBFDC44529
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2026 06:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f0rgL0VJ5kE0g1GPB7mxKos5pVHLgytmLF2hovXGdFw=; b=1Y430P1Y+7539YcSRltwnQoV2v
	VPsSjrnr314+yuN4n4G30ct7VBOTovgnUgp0J4rfX0gb3l7j1p0WqIzSWZ/b1KMEWbldD4teguWAp
	qjzx9jvhkNjwaTJQwebbaTQxORlIMG6zvgBDciWziOeY1n59VpwSHe71TGp4pXHLpKHU2982ZV4N8
	vS2ItP3nMQik+tgk4dd4K5HyHfk8lao32wgkUzB4J2VgWKNP4ojU6JTURjUQmBu4hcB9lCAErXm/3
	Z0uQZumNgwL4hs5co/fcFD0V1F6ZJaotj/Y/CauKDPQh4XhBbLeVFUrxLdSDNkaa5DjbAxbvrCkf6
	OFlsrPHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4O2-00000008akI-2QW3;
	Tue, 21 Jul 2026 06:55:30 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4Nq-00000008aWY-47sO
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Jul 2026 06:55:20 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2cf50c6f235so29443825ad.0
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Jul 2026 23:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784616918; x=1785221718; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f0rgL0VJ5kE0g1GPB7mxKos5pVHLgytmLF2hovXGdFw=;
        b=C6q8vt57mFAlh6C1ObtWGzsOhpZ/u7CEPGGDioTuYG6vKEUEMJ/odXqlOqsoptqEU5
         W2a76urNdzUK9yIj5rCHgpPe4Su5oRc9nzSnSwvR+MXPxxGolbJdfaQ7UCxqVMzxD4Cp
         7yhbIA2Joj4sxMNlwycI6xC/ol4WHsKf6l5JQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784616918; x=1785221718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f0rgL0VJ5kE0g1GPB7mxKos5pVHLgytmLF2hovXGdFw=;
        b=eMl5CfZdRVqr4Fxy2bWBD+QD7CpCdoFhaRvAUcgyEMnfGhTtVaAJV4W+IWcl0vhNxO
         yZJCXLq2Csk4w1msEACrUnAxvj3qwC2Krn+7RWFjKaQNYQZF+kzQmka4W/vKbl45Pgf7
         Eoed1soL6ksJa3Y102P2IWADrlZroBcZROUPzhc53dG12/SP7kQ68zR3Vz2jmI21goVa
         zaltMGHxJ5r7ZyHuV09GYqf/d3bRQIFbTDwLIEiD0Tsc8Y7Q+nnvIwOrT7kB989C4pQe
         0wEZz2WkmKcqu6oITaye3uRg0urQbJs1PQxO54uVKdN0dheXqFLcFs22FuoSUt4s62Uh
         tOdw==
X-Forwarded-Encrypted: i=1; AHgh+RqEs9O+EAKVbmbBKS652iDVJSsvyKu1zzBtFV02/WGzqUrkPsswLKWhgoskOSNQB5yjdiwssckqRoVol30PiA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyf4IU77pxDyIwjmEXFAjXKddIoRs2jq3qcu0uESDL6RrJk5ki1
	0niVAVLJUC0mdBH3HOHNViFPLeZCmnFXsJ82sS+o1pmenqxLh3vIJRCdsN4585OXnA==
X-Gm-Gg: AR+sD13c1xnRYh0lhvxqvqkPEpBNHZs2Wf89/QmaFAm1nRFTGaZmzBJdYJO8GDrH6Sg
	MdIunWhshVqA2CuyxM/9U7NNt7OcA0gMsZV+ApDFjeirFffzeynDwzbz6D0rL/M8fyyFMF+02IQ
	GNGkDVw5UisTitk8q+o44roSnP0cowlDi83aSQX7/Zhxv1PqlVH1zneSKhwL/FOVZyiLYybQ3lE
	yQmQakRDcxCO3dK+nkiVGuXrhZq01VDVHxXPGNL7knhFdxxYL8hYkeySAcImW7dQw39EpkTS86x
	4WWX4VV8U7+A/Vc/1m0MYRPx+gI00TEIVaiJOvMwq2Lj2TAuQZfBYmuGYiNT2yu+olLHMMYw966
	KF5qWV/HbvNC5QhbtO75N3tILlJFCHdWgr64ozoZowlWRAe4y9VIqxUUbb3c+1OHxRGCsIwRqEm
	hUnIoKcuTgjGuWgmXaE7ecJa73rQOe8/84lCxW1246IgL+ZwkiMCtmsy3RSwEp09ZsNFhkKg==
X-Received: by 2002:a17:902:f64d:b0:2cc:df15:91de with SMTP id d9443c01a7336-2cf349d30b8mr204344825ad.42.1784616918417;
        Mon, 20 Jul 2026 23:55:18 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448ee77sm69716005ad.4.2026.07.20.23.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:55:18 -0700 (PDT)
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
Subject: [PATCH v6 09/16] usb: hub: Use usb_hub_set_port_power() to control port power everywhere
Date: Tue, 21 Jul 2026 14:54:04 +0800
Message-ID: <20260721065413.2306137-10-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260721065413.2306137-1-wenst@chromium.org>
References: <20260721065413.2306137-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_235519_026088_0E14A15F 
X-CRM114-Status: GOOD (  12.38  )
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
index 6671b5e45191..a5c5038e1604 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -976,11 +976,8 @@ static void hub_power_on(struct usb_hub *hub, bool do_delay)
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
@@ -5437,7 +5434,7 @@ static void hub_port_connect(struct usb_hub *hub, int port1, u16 portstatus,
 		if (hub_is_port_power_switchable(hub)
 				&& !usb_port_is_power_on(port_dev, portstatus)
 				&& !port_dev->port_owner)
-			set_port_feature(hdev, port1, USB_PORT_FEAT_POWER);
+			usb_hub_set_port_power(hdev, hub, port1, true);
 
 		if (portstatus & USB_PORT_STAT_ENABLE)
 			goto done;
-- 
2.55.0.229.g6434b31f56-goog


