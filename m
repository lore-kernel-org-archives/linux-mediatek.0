Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3991C4167B
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Nov 2023 11:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ihe5CWoYwzVYQa0PIBn4FXCZubjqfqZzL14QGGmAy2E=; b=BmF2scpkrx8ifV9QLK0s1Dtk9p
	yt4FqUTtOyzZvclAgflAPVm/SmRayBbs6OhIniTGY+nkmM5izvPQKaxVjz/vTLNT/OoF42vqI+Rz7
	HTSi4DlAT9xDvSZ/OK/qTXXF4UMSUNBcF4N7GtgZkPb5+ntqXkbipTPF70QN2suIFlJvr6LNQ/yqd
	vsKelytGgKlgrnE4I5+zXxgML6J0qkDGx0PXJrFXDPH5YC+1t4Kgoh/k3McUG0d7tign4tzd8kkVS
	2F6fjNgsxjynUreYalh4zEuey3kSUZ11Zpt8lKTkjQEKPeO2T7h97XVglXUOYakePgWf1Pazw/QK5
	EKSSz31w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2V3C-00DiyE-1i;
	Mon, 13 Nov 2023 11:24:18 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2V38-00DiuL-2N;
	Mon, 13 Nov 2023 11:24:15 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4083cd3917eso35021265e9.3;
        Mon, 13 Nov 2023 03:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699874652; x=1700479452; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihe5CWoYwzVYQa0PIBn4FXCZubjqfqZzL14QGGmAy2E=;
        b=XSp3Wq95qHSPVrEEuXP3vWilJO/przl/TwJ2WAWbvQYWYn37OCflibRa7RvDQL92jP
         JAe6NitEPU5tJLQ/WTCwFlkw8jsBzueD40e7TYTzJwcXbAlHOK6f5J8m9ykx89R1RRN6
         GVfkKeqS9PXd8oXj+4oBn+IKrXElXgnGUR5YwMweVj5QDywLZ51+L/wfI1NHeYdUSd+J
         0AyjjBOu1pGudZClUlihBk5YSYdG80gRj5T9D7BxQ/NeuvvtzYsTkhOON4YzbfNrxcX9
         5wyISi149gZvUlsU+DZFP/427n4qkk5hX6ax0I+NVLj/IkmP54n7YCeTR99ch6geq+ZQ
         /VgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699874652; x=1700479452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihe5CWoYwzVYQa0PIBn4FXCZubjqfqZzL14QGGmAy2E=;
        b=CkogFnpZAdqsTQmYgi9Csnt0e1ibF4aaBL8bPFzOYQst03xarFL9VmykpKExlDYuC6
         ugg13gPfry2NbXaOhoGP7AL8GAZnauJAWdtf3kCj+AsxydA6GgpDv5yukBWKjAwDK8cf
         DT7Y6ihUPSPtuDbuPj6qu9IOct5gmuq339ksfphaL+ZzR/QsnvYhqrCwDswmRyRxJ5nP
         F55NRD06WhkmEW4Ts5AXitxzAIdc+GTbGjpZDRX7/TYhedCC3vXnrPWrynt5fGT72/xU
         bLHcBmdIY0I7iEmKiD/FINXt2T0ITJr4gQSrq4MgFQk4ybN14W7D5PyC1ddxuNO+EEzE
         FVzg==
X-Gm-Message-State: AOJu0YwtbUiMS/aGGOm1K2xWO3T3l5DphI9DJiDIVwXI/QDr2kDFhd9e
	L3BmlNT3sXe10NIUCppno+w=
X-Google-Smtp-Source: AGHT+IEb96vRjjDVhf2WWvt4ATSMI0ZIHMZT2M821fnApL0F6zP0tqP/mZlSqQGsQCCeZ+/3gKjOXw==
X-Received: by 2002:a05:600c:4f09:b0:405:336b:8307 with SMTP id l9-20020a05600c4f0900b00405336b8307mr5644653wmq.7.1699874651755;
        Mon, 13 Nov 2023 03:24:11 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c22-6e16-fe00-2223-08ff-fe18-0310.c22.pool.telefonica.de. [2a01:c22:6e16:fe00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id l19-20020a05600c4f1300b0040772138bb7sm13565787wmq.2.2023.11.13.03.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 03:24:11 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 12/20] drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c: remove I2C_CLASS_DDC support
Date: Mon, 13 Nov 2023 12:23:36 +0100
Message-ID: <20231113112344.719-13-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231113112344.719-1-hkallweit1@gmail.com>
References: <20231113112344.719-1-hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_032414_775182_A6E5B0A9 
X-CRM114-Status: GOOD (  13.14  )
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

After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
Class-based device auto-detection is a legacy mechanism and shouldn't
be used in new code. So we can remove this class completely now.

Preferably this series should be applied via the i2c tree.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
index d675c954b..54e46e440 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
@@ -297,7 +297,6 @@ static int mtk_hdmi_ddc_probe(struct platform_device *pdev)
 
 	strscpy(ddc->adap.name, "mediatek-hdmi-ddc", sizeof(ddc->adap.name));
 	ddc->adap.owner = THIS_MODULE;
-	ddc->adap.class = I2C_CLASS_DDC;
 	ddc->adap.algo = &mtk_hdmi_ddc_algorithm;
 	ddc->adap.retries = 3;
 	ddc->adap.dev.of_node = dev->of_node;


