Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17AFDC36002
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Apr 2025 20:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9DTqIB1KXItguWXeNYQcNwaI7W5L7sSNfK7n5CdOhYU=; b=ge+64G6Vj7dSTkzLAc0MioWwMU
	19zXnEo1J7ZouEhELeaSKmfHzl4+CTdf1DxNeyN5rYTm/eWxD4QoThw8NMLsl7uCfNWwwDzTMZZ4o
	a8RG6OL/MF/0BLhxhXE44fKRcXFzer0ZTCJYc/urftIt1bx6u3eGCaW1tmhe2X5ZCV9vVFX+gNh9i
	mYHaRGisfKEUFzPFyc1mS0GskmulMe4ZzM/O+vbugmu3dVUHUQ6hrTaf7fQFxXYqcS0mXV6CLT6mP
	7bvpY5/N6GmNkdsBcJztPiFZwWiWYhQnULqD1w9Yr0ajWxCk0u4oMNCQjoTCdZvf9JUJfXyls02FW
	TeQNG+BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1WK1-0000000FkhW-35MM;
	Sun, 06 Apr 2025 20:10:25 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1WJy-0000000FkgM-47v9
	for linux-mediatek@lists.infradead.org;
	Sun, 06 Apr 2025 20:10:24 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43ce4e47a85so2686845e9.0
        for <linux-mediatek@lists.infradead.org>; Sun, 06 Apr 2025 13:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743970221; x=1744575021; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9DTqIB1KXItguWXeNYQcNwaI7W5L7sSNfK7n5CdOhYU=;
        b=VZw0QPKkEoUnLYvotp52DrDACGCYxXA8AamPVEzKqa/qHUiKfgFh3tGgT3o4GKIzOB
         fMkNBjAThl+osIhGhq8lwRwOdu9JMPm6XgkUj9qqVln7NFP8oLwchjEmFXpK583CNoqF
         UzYNi999zr793NFvQBv5TgZOMRNj5V2u5dwc+wjHQkVk5vEEBUaP3T1plljtbpfYs8Fk
         X/ASQgkTmo8yDhHWTEuQyK5Jo1TuQjH560fDshv1cmHJLyAA7lxaeqIgz7dZNQo5DLdr
         sMuBRMRk6bNCtBKy4ILd7WNiqQQ+wY5+dJxtZCIR5a7Pbok+ENadWsFtTGPQmKWhIVgl
         m4/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743970221; x=1744575021;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9DTqIB1KXItguWXeNYQcNwaI7W5L7sSNfK7n5CdOhYU=;
        b=jJk5H6A05T4ppiwnxvhL4IWkIdzNu0H98xFyK0u4nfEjbbvHvOfpcCVQiA3e9DRHSB
         i1LtiW8xJ0nXiva9Tnto9lS4eu7+ihsam/vLBtCrvuRQo1j7ynifb+WQwpKlQycB44dz
         Q7hjsCHdjfiyoCiRWGrk5+6DzZnz06LbhPsvJV6WH7hMnpahQO8/n5N7H/y6Aa82QYA0
         IBaf4pLwPt+hxPX0YUcPyeDhsGyi77YmB5h1xswviIM+o/bszSUNNnkHdMZOkSHihavI
         KyBJkROP7zmbCFqW9aAirZk6Bi9BeQsZEn9ezx8PaDGnk9/64NeO52Sv6x5c8lavsJcl
         juww==
X-Forwarded-Encrypted: i=1; AJvYcCXq45u3IpxlsodBB9gye9X/93XhO7JejGDadUMJyunjJyHuA+XMZAMtxTOXami/qkSTwr5xTrbY/IK3CQRXuw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzrTFvW60JsJ2R/tXD//eOC13a3nRBsywIpgr4ep6JnQy+6ZA9R
	wmSEBGrExSFsKNojQOSMPaxn1LcC7Ri7hHX9ereL5sYMwSTnIwtCgGwJky8Oefk=
X-Gm-Gg: ASbGncsH+mdCZ/In02ce1yoAisE3hak2S0ASuxdxWX0jLUuxo67oYRUjnPKAcLH6rmI
	qfl/94T8kei38teu8TiBxIAR56A52Vdh4VFZZx3ysZQDjYCnvlw29ljsqQIvHRWPd7Cx6pDJqdl
	u5WYgNFCMM08Y9LKYLw7evP6l0m8+y/x7F/bPiJwZI4gj4mSywlACC/cdGlQqdl0asxsE4/t/Vt
	OXVKKuXBE9VDIhyEroRcKXCaZna0DL+SYmHPCzzxE5CSdu4wE5rA8NX8KU+MA4MzY2dDdnvUlxG
	Pma0nAvRTXr3aF1FrzM6p/JdBouswGuh/F2XYH2XtCNzY9RhazqDvw==
X-Google-Smtp-Source: AGHT+IEaJAv7cq8up/ZJcJ41xkkrRi1H6wbFP+rMyncmJcukHJubfsFDxahu/j9T6NCNJr3cSnjNkA==
X-Received: by 2002:a05:600c:548c:b0:43b:bbb9:e25f with SMTP id 5b1f17b1804b1-43ecfa05765mr31050015e9.6.1743970221127;
        Sun, 06 Apr 2025 13:10:21 -0700 (PDT)
Received: from shite.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301acec9sm10080656f8f.40.2025.04.06.13.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 13:10:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] Bluetooth: btmrvl_sdio: Fix wakeup source leaks on device unbind
Date: Sun,  6 Apr 2025 22:10:16 +0200
Message-ID: <20250406201017.47727-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_131023_044017_97DB55F8 
X-CRM114-Status: GOOD (  10.27  )
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

Device can be unbound or probe can fail, so driver must also release
memory for the wakeup source.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/bluetooth/btmrvl_sdio.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btmrvl_sdio.c b/drivers/bluetooth/btmrvl_sdio.c
index 07cd308f7abf..93932a0d8625 100644
--- a/drivers/bluetooth/btmrvl_sdio.c
+++ b/drivers/bluetooth/btmrvl_sdio.c
@@ -100,7 +100,9 @@ static int btmrvl_sdio_probe_of(struct device *dev,
 			}
 
 			/* Configure wakeup (enabled by default) */
-			device_init_wakeup(dev, true);
+			ret = devm_device_init_wakeup(dev);
+			if (ret)
+				return dev_err_probe(dev, ret, "Failed to init wakeup\n");
 		}
 	}
 
-- 
2.45.2


