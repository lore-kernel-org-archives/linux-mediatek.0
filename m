Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9149FFCC9DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2026 09:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7hRZKxmDkekxeTijUMv0DHtFKCuWghYPEZ/UxQrV0i0=; b=toKWWnIq4xSr3k4RbW4S31Ahkh
	WnDlThcQennYoaTud6fSjMil9ZYKAN+AX376EZX45ia5qJ7gmICcdBv6/xIgLjZM1t67g+E2ufqPH
	UhwRy3LEteZXgAwgXPXCOkERB8RmWv2exk/FGgFmlNqDBXDWvBs/y2UGyOvAhIrpi+fJHOgYHjoUF
	J9waseTZ1tZyPkmOT9p7Khn0GaBeMUa0KXnP2OXA+bcUjQCE+fMf+SWaiP1fkc0NbIWuUI0d7ynEg
	aZMSkNWcmWmGt6HC2gUoGMqQJkVvFbhcYfDgWKTRl9xJYuupal3JiXAjNAPk+sFZDu+WnvVPY0Uuk
	qZ6KRHhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztGC-000000094Wv-2stg;
	Tue, 10 Mar 2026 09:20:16 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztGA-000000094VT-15hD
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Mar 2026 09:20:15 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-8299f1ca86fso1836179b3a.0
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Mar 2026 02:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773134414; x=1773739214; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7hRZKxmDkekxeTijUMv0DHtFKCuWghYPEZ/UxQrV0i0=;
        b=CMmuBp+NCRoecLLxCwzUY/fBJ/Uu/JM7YWxqmQ+qVDJXue0kl8b4VNf3qWOAF2Aa7N
         pmUh1tuKyeSkfjz7nudlatL9123bKEDz0q9HUr+cS2fFgICCVmmyktkdo+EOr50Akrxg
         7wFgUBH8pKfQDk5STv1vDenFGEqOOLXu4SzTA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773134414; x=1773739214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7hRZKxmDkekxeTijUMv0DHtFKCuWghYPEZ/UxQrV0i0=;
        b=YcZHgQDSyCnseMQvnjUZCxnQr4glALGy/emv8vk+f98k3K32E/niP8/z+mNZOkWSna
         uPGOSNX9Gjz5E/wM4k5ZfDrMomPmOeTFZE+yA8cOT+P0SQdxEnDp7dR+gQwF0TaTEwN5
         CKpIXT6AI+FVphNXqLVlAcu6+hexQErnSvMTgrfnR6j1qJLedcVVtWzqRFw/1LgtKdWZ
         GFk9WEFkVBkfARjveHr1+pB/+3sr9pjFO4Knuo+s3WNHWskthU7906183k1bikQRoPej
         OMJ9Hssv+OZc//KRtI+1Hg4dSIviZuEoxpbSVR2jkAe4R6PIGf1tcn4E4HR3EJ+6E6Ic
         wAMw==
X-Forwarded-Encrypted: i=1; AJvYcCXFYnHcmJva19t5OOIJwjrqNDM3NwwaFB8CMljsoYQNUhjT9U9r1CyjcPOjzhE/2mUX4pNKJKEAQsbY5+cb+g==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywpt49jqqfV/2HQ/i6IQ+M0C9r3qjVKUQTZlkJmceSB9H0qQDva
	Y6Ae/Vd1RGczwvjO2xCMeiqMdS/w3JJt1d7Es3Ih8NDiF/smalx38XI0ZlHseve2NA==
X-Gm-Gg: ATEYQzz8FWwbwoiqKS6jEX9qa44bgfpdogIai1rm+v/P8VlAo3zKNQ3bc+u0AkkEYf9
	XT9QTMvu5YFrGozTeFClylyNoy4ygOXo/hxOqHcW0L7ZEH70+SERorvAoq8H0Sxo7qRuLHcKkyr
	zoTHkykKyH11jlni7OTQF0C8x5IAcmryV3ts+3slzQ9u/jk9iSp54aPjkFeL08zkEYcBuKKyoGB
	l7QWlGXnzNrPdctytvdMXKO2HCNcdZBPPh+G1iOHyfwgzooaxzmpyK2JXPGNgIF0bIfiGbuRof8
	wbqla7as6Mjw8WQu4AmAbuFqECVR+OnIrHXLPo5dYnGlcgwiF5z/+7PJVt7KaemmLnJ+sk38l4g
	2t15SjpNFsaWIcWEeUb/LTX++qYrNIRAE5rwKdFxeB44jAp8lhykC0LpybroFaozZJgWx3utgvQ
	69Z5vUAOWEWVNBZjRIWa4kcNCYn4br0CUrxFBQd/JheWrHC9I6A+DRMre7+EOCeHM/CywlnUMy5
	llhZ9Cx
X-Received: by 2002:a05:6a00:13a4:b0:827:32d7:6690 with SMTP id d2e1a72fcca58-829a2d88478mr12094733b3a.13.1773134413720;
        Tue, 10 Mar 2026 02:20:13 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:ee38:e01e:e888:6900])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a48a3b74sm16965190b3a.45.2026.03.10.02.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 02:20:13 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v4 6/7] PCI: mediatek-gen3: Disable device if further setup fails
Date: Tue, 10 Mar 2026 17:19:45 +0800
Message-ID: <20260310091947.2742004-7-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
In-Reply-To: <20260310091947.2742004-1-wenst@chromium.org>
References: <20260310091947.2742004-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_022014_300942_E5D7C9DE 
X-CRM114-Status: GOOD (  12.76  )
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

If further setup fails after the device is powered on and link training
succeeds, we want to place the device back in a quiescence state to
avoid unintended activity and save power. This also helps with power
state tracking and balancing once pwrctrl API is integrated.

Power down the device in the error paths of mtk_pcie_startup_port() and
mtk_pcie_probe().

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v3:
- Adapted to movement of existing setup code
  - Cleanup in mtk_pcie_setup() moved to mtk_pcie_probe()
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 3e5386c4cb35..f1a70b92cc9f 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -556,10 +556,14 @@ static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
 		dev_err(pcie->dev,
 			"PCIe link down, current LTSSM state: %s (%#x)\n",
 			ltssm_state, val);
-		return err;
+		goto err_power_down_device;
 	}
 
 	return 0;
+
+err_power_down_device:
+	mtk_pcie_device_power_down(pcie);
+	return err;
 }
 
 #define MTK_MSI_FLAGS_REQUIRED (MSI_FLAG_USE_DEF_DOM_OPS	| \
@@ -1219,6 +1223,7 @@ static int mtk_pcie_probe(struct platform_device *pdev)
 	return 0;
 
 err_power_down_pcie:
+	mtk_pcie_device_power_down(pcie);
 	mtk_pcie_power_down(pcie);
 err_tear_down_irq:
 	mtk_pcie_irq_teardown(pcie);
-- 
2.53.0.473.g4a7958ca14-goog


