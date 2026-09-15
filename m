Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D71EEC88E7D
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2026 09:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kLWSmlyXJzRPOS1GeQ3EyJF1epHoFNqr/jbcGqxOmCY=; b=jqbhMwgRrTjeboL0hsxndO2Z5D
	R7KoC1iY0oOpG8h5XBaJINQqrQ1qLC8uenABMMVCt7NsPLe2OvxpHo/VCTkejdqA3ZhCb1i5SEKBs
	gQ16CbXbpOmgSTrnrOxMLoQj5lKTdM5Wx6Ti15YXfim574/4/mDuNvB5Gua9MzJRp+5VEhS74kq99
	Z5ajc+hcPkNV68q7MqHWtSRQu4RxHcYtFU4lVQRCMzLjp+Rf/atPmepD6R+OjlqgdpTKff3gq+jqs
	+usjkvn1swbuDLkWV9P6dHs4rFoFdBGGCkx7jVHihze2J5xzS5tEX09rgahSoo7MJ3l97NknaeXWm
	YzwWAykw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6P4D-00000005iof-2xDI;
	Tue, 15 Sep 2026 09:03:05 +0000
Received: from mail-ej2-f12.google.com ([74.125.228.140])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6P48-00000005iit-3ffA
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Sep 2026 09:03:02 +0000
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f7db0so8496766b.3
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Sep 2026 02:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789462979; x=1790067779; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kLWSmlyXJzRPOS1GeQ3EyJF1epHoFNqr/jbcGqxOmCY=;
        b=ShFSqJVQmyuuXiIIXrALM6aXvdaRmcDxUawKxVPDDDx4xbi/FmXf87JTD39+uTNguA
         MipyuiPr+/FELboK1KAyFRtQYDt24D1qkzbk5xsvs/0h3nRh1PDZQ5BTwNVh1GD+VzYQ
         6xhOSNLl1CJZ84uZFkbywjgCK1NnE9SQ9Yqo2bOo6HwfF6dJMf6kTntH7+qQGczjd4FV
         FnUse+FuviCXfHH1lPp8jsCPcM5ke62xNGXF+JLCFo2EpmDTmutezbKfbFLVOTwWtHg0
         eZm/b1rGaJmKCCA0pTTUCUcMBIzRL555sZjlnXp8ZNloALnksfoF/54qygA14d2L3OuT
         7+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789462979; x=1790067779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kLWSmlyXJzRPOS1GeQ3EyJF1epHoFNqr/jbcGqxOmCY=;
        b=OhovrloHnvjNi44S30nV5qsxSQkxMSwsZQgmoSvLA9Cjx96zmuaxYU87TMvWgF1/gl
         b9F2vP02gxOyYtgSZNuQenrXunSL0O57gc1sQHRQHrCcEMZ8zLQX9zAHCyTsjgn8ai1Q
         L6aDHAeYjvw9m0emVDPncBx8mSP1rSVCdRnChfxK0E1ljbUQZhXb8oAHBOJC4fR7Ir5a
         jTfQc/U/VsQQmqx+rd+OSKjK5TUjnce0ePyDTNYQQM1BT017blsvFCnQjK7o5pqO0GY+
         HwBS7ymCB5h/Oqk+cO2auYwHm4eNfqtGVt7LCVTcixwR7njT/GOEAWJP5946Wl4/5D1M
         EWSg==
X-Forwarded-Encrypted: i=1; AKwUvBwSK26+HlL0/BoaRcL5QdVmy1Eigr9F93NKm5A3oQ628dhrtENrJMAupAu67a5tM32QeJa0wo4IhUeHm0gX0g==@lists.infradead.org
X-Gm-Message-State: AFuF++nsA/iV4x+ToeILvFf7nz52szz57aAqQyomryoY6if20naxEHV5
	kMike7AafLV2o9Bpncg2UHn5Pu3D+nsWO4sw5M1RgSVeJ37vc1lCamef
X-Gm-Gg: AYBFou0jZEttskKTZM2bpa6yZSXNQXK+4dMZUr8IJxdXCb0tlCuTWlLynve037JiOco
	2Zj4Q7Fc7/qr/OyoHFacM7h8QRQzpNkIhP3ICBmIeX4+jfIkfBUSZr0kIa2Airuqkh6gDcY/eh9
	PLQioxMErtCglEUBO1YBnv3TWry3eXoF/oWpGG+kLvPq/4PNTHdAUZheUhD3FrmlS9lWNTxqXve
	VgKBZbyHByP9UhGcruV2OEpTcu9xkG0LjSyHauGP5FBq6IH2ydaQsdtg3hmoRtY4wqx/czb5EuK
	5uqgqIkNqnG7Zm1qd0v5Q12icred4uAPqH0X+2YY3xAoHuOx5uXL9PKVengAJdZ96CYuMkfgO6b
	w+pJM5a1CZo5u2fLrcgJ9bZ3LnCn6jHDFpTbU5df/ffQ9k7g5NE9yoHNHmxkGBZgAmjFpoTA1B5
	WR8dr6UBjMXen85A41KblLG0tAtUoffPKlO64fPl8tJ5SZFpTL1YASw1Xr7b1YEqY3HqlFYN1SL
	srZGe9YqOIJtCAfHtbX8Ck+FjRWExqxT23Zv1wNkC4+vr4Jpvhj/DN947qPUwXQkl2Ac2d7LOFo
	Jx7he41y0jKyusZOIi6YgPhzilzUG3UYau/FMaa8j6gB2AuQqbTk8Yem1tMJ92mSfy79JSPUuBJ
	8qqgNyBdiBOr1iSRXjnxOmlSuHw4qp+TZNyfEZGM7MYpq2UjNQOIl6oKcjmK1AMuaWlgK7DPKZ5
	Ehzv01Q8z7nRKvYJH1d9rE8CQenHMO4UYjBmVHbSgdKPP911pqnC4nspTrDPCsC0r2aLV/BCALo
	SlQ1aasces=
X-Received: by 2002:a17:907:9407:b0:c29:4634:5c99 with SMTP id a640c23a62f3a-c29d771747dmr18032566b.4.1789462978527;
        Tue, 15 Sep 2026 02:02:58 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-b.c.oa7bb030819b2a894-tp.internal (88.71.12.34.bc.googleusercontent.com. [34.12.71.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4cf01sm546369266b.1.2026.09.15.02.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:02:57 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH 5/6] usb: mtu3: add missing pm_runtime_dont_use_autosuspend() calls
Date: Tue, 15 Sep 2026 09:02:22 +0000
Message-ID: <20260915090223.1346-6-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915090223.1346-1-joshua.crofts1@gmail.com>
References: <20260915090223.1346-1-joshua.crofts1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_020300_947472_8B06D90C 
X-CRM114-Status: GOOD (  10.60  )
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

The comm_init_err label in mtu3_probe() and mtu3_remove() both call
pm_runtime_disable() on error or device teardown, but don't call
pm_runtime_dont_use_autosuspend(), causing resource leaks.

Add the missing pm_runtime_dont_use_autosuspend().

Found using Coccinelle.

Fixes: df2069acb005 ("usb: Add MediaTek USB3 DRD driver")
Fixes: fa6f59e28c61 ("usb: mtu3: support runtime PM for host mode")
Cc: <stable@vger.kernel.org>
Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 drivers/usb/mtu3/mtu3_plat.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/mtu3/mtu3_plat.c b/drivers/usb/mtu3/mtu3_plat.c
index b4f4c776adb9..ce64c36a98f7 100644
--- a/drivers/usb/mtu3/mtu3_plat.c
+++ b/drivers/usb/mtu3/mtu3_plat.c
@@ -445,6 +445,7 @@ static int mtu3_probe(struct platform_device *pdev)
 comm_init_err:
 	pm_runtime_put_noidle(dev);
 	pm_runtime_disable(dev);
+	pm_runtime_dont_use_autosuspend(dev);
 	ssusb_debugfs_remove_root(ssusb);
 
 	return ret;
@@ -483,6 +484,7 @@ static void mtu3_remove(struct platform_device *pdev)
 	ssusb_rscs_exit(ssusb);
 	ssusb_debugfs_remove_root(ssusb);
 	pm_runtime_disable(&pdev->dev);
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
 }
-- 
2.47.3


