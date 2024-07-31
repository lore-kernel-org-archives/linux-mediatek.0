Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 617C9C3DA7F
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Jul 2024 03:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UNo1lCfbQqGMSbbgOcd9nX2zDqzbGx3C0Iq0m1Inhbk=; b=r2KTIa/YEFhecPxUBb8Dno2iG2
	nvKJ02CkgA/15JiyiVcHdwJBKX3I48YhvRSozMXrCT6OiQQAgKV3XTYCsFIVA0b/n7R3CribuOXn7
	+8n3QFpzfH+SqNsg1/eoNPYruimw3D34QDhGLB46+rT2fDfx90Rn4Da9s2G/O+JnWlxBrk0fMqeC+
	fRWu7S9fyRZ8vvR0G+09Yoqhx+lWK7lyV8VNkjbkjyvOCUJfOy6kC3oN2UbBiLTFsRr85xYeBuHK4
	3WqZbW/9cPOIXkbvVlQdyrKLM62+OtTPbeawArTCBbYN0nvlKBVGM8/BOXAw5tE/M87mHsAQTsW89
	7sTUmNZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ0HC-0000000HCV6-0Dr3;
	Wed, 31 Jul 2024 03:45:22 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ0GL-0000000HCCK-38TE
	for linux-mediatek@lists.infradead.org;
	Wed, 31 Jul 2024 03:44:31 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-7ab34117cc2so3540574a12.0
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Jul 2024 20:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1722397468; x=1723002268; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UNo1lCfbQqGMSbbgOcd9nX2zDqzbGx3C0Iq0m1Inhbk=;
        b=jlM4CLQ3Uab+jRF76knpurAAgu/NVoDqkZAtd7FxrEdX4dNJMHtt6mXL09PEorKn7F
         cQ3cgGBpIbc2V9Iig7g0qxCsj8A0+bqSD+osTWtVMLTGVSk7p5sl8cRSLwKBsznh5h+Z
         0ZqTEEtXSY/fPGSSVpT4l1pnZjC0J9yTYtZTA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722397468; x=1723002268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UNo1lCfbQqGMSbbgOcd9nX2zDqzbGx3C0Iq0m1Inhbk=;
        b=FFzsBqJ+yLMAYqRkGrlUPf8dJf7DRObYq1y8sUgQo5/lX5SERrGOIM9FFZ6gHD8yzi
         dftkTKDi4alTmVXRn4FLJnAkAjqbyv3y5aVwUgHbv1JirVgf4sJQr6jAqqbImJ7sbCbV
         qKZRkVUuSU4LwyeEaIy2CDw+KYwLdm0Qxw6SrnErVvmbahNio5Pu7PEx2cFGUSpDKD2O
         8TbS8m/EftxqR1Q3N8Bu3CYrQe3wAkDZhXWbyWRaroOQRU/QV4vhYb/SV9Hc26ZNTLlq
         uybv3RPHxXFiz/5zZJnsTmnkYvm96cKf/kbU6miGLASReBk09e+qvAwa9vv09aNlS8rg
         7UoA==
X-Forwarded-Encrypted: i=1; AJvYcCVQLotnGy2cpcGMlC4I/0V/KmkclItyRiQvMRJjLAt4XNjEeQraR5MJY0TaJ3z+Bcguhq85qSfZjf7ZEnY/auTXd9JkH9HxvoI+M/6qfOtIpXj/
X-Gm-Message-State: AOJu0YytKNnQeAtsWXGlLySpUQrEepe5vnmS6iy3/0X3jbNp4wZkJk3m
	QuochnyIs77y3ANN2Y5e+DwF7IXk83HzOOXXj67BRVriOEUUSQWTdB4GH/45OwzMFUqNYAjnWss
	=
X-Google-Smtp-Source: AGHT+IE4FtnaiOt7PwGIeleyxseVrMrvg2bK54AvWowVA2QcZrnOLaPels+TJcjIfagIHeg10n/CWA==
X-Received: by 2002:a05:6a21:328c:b0:1c3:b47d:d53f with SMTP id adf61e73a8af0-1c4a12e1129mr17571072637.25.1722397468531;
        Tue, 30 Jul 2024 20:44:28 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:1cfb:e012:babc:3f68])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead81230bsm9093008b3a.120.2024.07.30.20.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 20:44:28 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: mediatek: mt8395-nio-12l: Mark USB 3.0 on xhci1 as disabled
Date: Wed, 31 Jul 2024 11:44:09 +0800
Message-ID: <20240731034411.371178-3-wenst@chromium.org>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
In-Reply-To: <20240731034411.371178-1-wenst@chromium.org>
References: <20240731034411.371178-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_204429_793756_5AF27F43 
X-CRM114-Status: GOOD (  10.55  )
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

USB 3.0 on xhci1 is not used, as the controller shares the same PHY as
pcie1. The latter is enabled to support the M.2 PCIe WLAN card on this
design.

Mark USB 3.0 as disabled on this controller using the
"mediatek,u3p-dis-msk" property.

Fixes: 96564b1e2ea4 ("arm64: dts: mediatek: Introduce the MT8395 Radxa NIO 12L board")
Cc: <stable@vger.kernel.org>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
index 4b5f6cf16f70..096fa999aa59 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
@@ -898,6 +898,7 @@ &xhci1 {
 	usb2-lpm-disable;
 	vusb33-supply = <&mt6359_vusb_ldo_reg>;
 	vbus-supply = <&vsys>;
+	mediatek,u3p-dis-msk = <1>;
 	status = "okay";
 };
 
-- 
2.46.0.rc1.232.g9752f9e123-goog


