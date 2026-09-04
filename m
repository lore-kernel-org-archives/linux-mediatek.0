Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78FA8C79F83
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2026 08:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RQ5BUQyX60lAwoXOtJvq7hs8kBNzpXHT7+FU5vNuJYE=; b=nuB7kbCfeWThuXmhGr1WkzBEfB
	SbvgHF31b0ieC7a/kWkeDyKPsYQeorXDbpiXsS+6WnmQTqbYFwkerb1FwNNIhLls94aIYlViNkb2l
	grAszMWc/qnCTW85bQTEtB/mfVZKNnAsrCuMPySrAZQy+6gbq57nVQiZX275Z9rH8QFnjFONie4IK
	uOO6341onUCXsVQTU7M1PfKBvwBQLyV4YLtlhDx4WLoHWVLnUtK4hMU4VWlw+BzMNNOMQX71nEVH1
	LxczPd+Yen/GJxhpTstjX3DGvc7gy8A7qC/OF0DqtqCFWD0XA5oZecvauysIX8S62gBNgPUE7e9mi
	snWi5DdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PVL-00000001Pew-1N06;
	Fri, 04 Sep 2026 08:42:35 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PVI-00000001PcL-1QMs
	for linux-mediatek@lists.infradead.org;
	Fri, 04 Sep 2026 08:42:33 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2d715f4a587so11750525ad.2
        for <linux-mediatek@lists.infradead.org>; Fri, 04 Sep 2026 01:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788511352; x=1789116152; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RQ5BUQyX60lAwoXOtJvq7hs8kBNzpXHT7+FU5vNuJYE=;
        b=MtmsNAesD1/5zGGxGW+DJW60QwikMGkAVJkaFzWLsnEqczKgQuhc35e26dV6d+9lrT
         8twlzlnJJv/P7r/pwqNhiM3dlDd9Jpoa6j6JOoyeGJKQ5qVX2Ie5maeN8jdo3nUupSjY
         m5yUA8Qp08kG1wAAJuupwN/f+G9j43I1UiDlU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511352; x=1789116152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RQ5BUQyX60lAwoXOtJvq7hs8kBNzpXHT7+FU5vNuJYE=;
        b=DPJ0voz1cStg176KN3/93yOG7YpbrsZLmlmJiZe6d1GKKwpeXNRGGhwjiEcixD5UGY
         SYkF0D5NcMpcJadoqThH+UTri/CeyGL7PGVI/QL+6y7tp2OMyBsjwjTSUJUO1QLNWChq
         xGEEcNfiV2zUBbQfuG3ghCCqCNGgBZokI/wZsIrmvLWuYvvz0yDEZjIKawqvh2zHj09f
         CoX714cIs1KgmDMYI2rja6E59CwDzBEpuLox5ZMtnRNixZBvMiIkElmuA8X/WRHHeuGs
         1uTV4QEc4bY2D03VupAoRe6CwckNna3nG4GBGsmoTwdMPXylUhSVuPL1DtB4eHYW0VZw
         BzsQ==
X-Forwarded-Encrypted: i=1; AKwUvByDSNlW7KaXNUs+gwfuYK68WSRJOKIax9xLq0+ja8oEAM+xozZJXOsIzdSTfIq424fnNOIdtx8qzV0n7eSyPg==@lists.infradead.org
X-Gm-Message-State: AFuF++nuyzsxFfFEFQwk6b7JzyszigqKEW7DqChonA+3PvlvhjbVOyo/
	c4c2L7MInp01rwOXfMli3v7NbIB6eir74D+ug6F88dnwpwavAHbIMPtrKLX9KJsHCA==
X-Gm-Gg: AYBFou0wQxtm1tfXlzpymTC3ymi46nyghEJbKKtF6Y597sd+4g2/SPpPm6qHXXqhwQJ
	pmejH42OPNI/OJ4yQwstXqV2cGRBnyUEAwgdIj3h+b5DuSwi5TYB5jr/KZJve6OHr7x5CbwpFLX
	F6pzTKZtjlYtmLjJnvyxDy5Zns9YPrlW3GeTOXTc//5ztCQTKnUmDnEY2DKjoTFJTNU13FkC+Uk
	IMw0lrgYXWCnpSaFvXbaNrmDernIFBwi1SKJm/xvhTOFYf43ibLfDAsyfq4EgdUoI7OILijkeJq
	widYAfZY1r5zn+ZVzLF4fqt1+TiO04nSvsStacYQP/9mpjHlv/Yx7ajQHcvJE/D0RS/PXWd8Efq
	lUfwa1edQBAGM/gE04JQYEhIfqOV3RUsKCG2GdULq4vlqrijlthaSzyGCVfTISNPz5115tMq7ig
	0k1iFfMuq/y85usoHxoGGsqLxQJ1ZnWIQpTIFHzxc7Bf7fEuR6Ih42nIH7yUwMEN3Mg50SrYvoG
	yRdd89hmrjP5+L5ZH0tPtJyt3CFEhB+Z6tyoO1U+inY
X-Received: by 2002:a17:90b:1d4f:b0:398:9be5:b417 with SMTP id 98e67ed59e1d1-39b26221eb1mr7387796a91.18.1788511351714;
        Fri, 04 Sep 2026 01:42:31 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:343:bf21:3095:9c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm3343538a91.9.2026.09.04.01.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:42:31 -0700 (PDT)
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
Cc: Wei Deng <wei.deng@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
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
Subject: [PATCH v8 04/16] usb: hub: Use assign_bit() in usb_hub_set_port_power()
Date: Fri,  4 Sep 2026 16:41:43 +0800
Message-ID: <20260904084158.1341550-5-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
In-Reply-To: <20260904084158.1341550-1-wenst@chromium.org>
References: <20260904084158.1341550-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_014232_388346_0F7E4D6C 
X-CRM114-Status: GOOD (  12.28  )
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

usb_hub_set_port_power() open-codes assign_bit(). Just use the
assign_bit() macro instead. This makes subsequent additions to
usb_hub_set_port_power() easier to read.

This change does not introduce any functional changes.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Attributing suggestion to Andy, since the change was originally
requested as part of a review.

Changes since v4:
- New patch (split out from "usb: hub: Power on connected M.2 E-key
  connectors with power sequencing API") (Andy)
---
 drivers/usb/core/hub.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 3345b3298daf..16e03ec8d1ab 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -10,6 +10,7 @@
  * Released under the GPLv2 only.
  */
 
+#include <linux/bitops.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
 #include <linux/module.h>
@@ -899,10 +900,7 @@ int usb_hub_set_port_power(struct usb_device *hdev, struct usb_hub *hub,
 	if (ret)
 		return ret;
 
-	if (set)
-		set_bit(port1, hub->power_bits);
-	else
-		clear_bit(port1, hub->power_bits);
+	assign_bit(port1, hub->power_bits, set);
 	return 0;
 }
 
-- 
2.55.0.979.g7e5102b832-goog


