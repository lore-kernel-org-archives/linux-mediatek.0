Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF26AC04FF9
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Apr 2024 15:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ngpZb20B2h9Qc9IbX5I/ZiczUNGoVVnils8jWsBLdA=; b=n12fQRGrySzHttDGgD9hUNgweP
	ljl7UvI4RZ+BpEAJIm8TdHGrcENW5ie+GaChygyp4jGIjYxZ5nk0nu8TUydBvH1G0d8+BLVFzv804
	Bog/skvp7qdujnFxGS48oN23VELnlduGT/EitAT9SzZcxaLpodmgpTpENXmfqSFYzPe5+BQF04agf
	Q9Dzq41dskSwnIccDQ9MnIgRzIltQOvGxAUFc+yka6W56CDJVUXd/6gIoobHd/2K+T3panI5Igeuo
	xPtR85eo8jQn2CZUREUZm0mBTP75Fa8mVHJpPS/cA1OeV95i/kh3DE6AZK3VfYCls5Mp0ZvUAWFR5
	oRzBqx+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwl9g-0000000Crzl-1MXt;
	Tue, 16 Apr 2024 15:55:32 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwl7y-0000000Cqrs-2Oso
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Apr 2024 15:53:50 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-570097653faso3256612a12.0
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Apr 2024 08:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713282825; x=1713887625; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ngpZb20B2h9Qc9IbX5I/ZiczUNGoVVnils8jWsBLdA=;
        b=W0QbOGix3YknA4ZSV6EZiWMKC3mCx7ObaYvbGWfW3OTBlJuaQkjGCGCTiR/+5dzGyE
         ZEpMF+vTWodozAveVRdaCkHafaYKop6r/ZNpbi5/Z4fuXviJOKYFITD+NlZbWcW5XETr
         pboo3gDMcrQtCCKZFd75hWjNS+rWV9KNWpirsdbtuSmT0WxLuUjlwugnrpAnh91f+R5G
         uV9c8BH1ayOHvpshayngvmGjg91yf3LuEqgCj+KDCH3AZ8MfgxCF9W0/wAWfxJtxpClC
         IjibKzk8PMX9SbeA+vk7d+jek2xsI1KIkppkGymluVm1yWQr7pq9c1bNBmjen7hu2Tx2
         bYvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713282825; x=1713887625;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ngpZb20B2h9Qc9IbX5I/ZiczUNGoVVnils8jWsBLdA=;
        b=czzyvhpruPvik5GsZHsI3gBUDpr8mYjk0tfQoyM4vKHprj2Rbsz470Y9nSxBZnsDxT
         DPKBe2IP60VGclFYo9cIxnaAM52nUWEyDmDUdtnyxk0ueaFci7e6Eq+CYbeP/EtCj6S4
         qSmNB2/uZY33L/s/LQtvW4Rja7KdHVLlgM0d4NbZCC9l6q6JgORVi2fRb/lGe7ArGejU
         GrT2uYk7WEejWerntOdo7zntc1qnD0/sWhO8EYNNfujsa6n/wHnlJ96H6mO2ij6fFBUn
         AtDzXr2yxT0D1yRquMMbla4dVSYeMCx9KK5ht/GFc/7LecPCN+zM/Yiqzkkbm2p0wD/b
         saeg==
X-Forwarded-Encrypted: i=1; AJvYcCWnRgYyDvP2dGi0fFZFrHgkOe6Ugb9r68HGGq6mTAI5yGNFZRjVdM4AeTE9dEAxTEyBpsC05I4kywq8qGSqF6E3D9TwA0d1pLKFWwJWOrcz+wD2
X-Gm-Message-State: AOJu0Yy7EVLEMVv+J9TvoRfYEfslWhCjweUHb5YYuAFM8/UNaJRJqgl3
	D8RX6UJerb02HhSblSPnCXeszAJWM5NXRZahIzaNuafTw+OAh2FlMCAYxRqG8jw=
X-Google-Smtp-Source: AGHT+IHS8gkjj052p63IxLAZQoDwSNpts+GSvD3Ttdv8alHt/Cx4qP4IbNw7Ik0JeHFuC8d5NxqZ8A==
X-Received: by 2002:a17:906:70b:b0:a52:6e54:1c96 with SMTP id y11-20020a170906070b00b00a526e541c96mr3885284ejb.15.1713282825054;
        Tue, 16 Apr 2024 08:53:45 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id d12-20020a170906174c00b00a52567ca1b6sm4156691eje.94.2024.04.16.08.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 08:53:44 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 16 Apr 2024 17:53:17 +0200
Subject: [PATCH v2 16/18] arm64: defconfig: enable display connector
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v2-16-33ce8864b227@baylibre.com>
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
In-Reply-To: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=693; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=woF6NgCy9sWp4jU9xhCym7WDVQPI/tzmO1lBDEzOVXQ=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmHp7qIwtSSbyVpXRpUFOdzU8YlXuq4amJoGc3u/12
 S1MzvACJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZh6e6gAKCRArRkmdfjHURd5DEA
 CxggRzPxIw7OeYNeMDqJ2rnFJ5h7mlJ9X2EP80Dokttj2mIP4Bk+vPXL/6hYoAmzTjqzWSaiekP1h5
 a2SWzg4kNXkdFyooQxYqwPPXjeM0+sJETbmIWw6c8v2ePq8ZYCsJmKO1bqaI99a3OLVwRA1G2jlrIl
 zzBJe4HOehi4zwzV4FFxaDRznY1+sPKrT7fNcham2SDvEeoI5flZvTAm3j1hKMYVO049HUWJ1pNTZo
 dLFiwMlTUHLQJvdFuuzahgPAk3UgJkTW8BVqGDf9vA3wcnlfDrVostJvktfroFrgFd56zqvGUgVJza
 mH2J4qvmYVlaz5wiQZdgtgN8BGQopSjvQCwFacVTz98+UdmmNmEjxp3SC79KGYJdUSZDfLcWORGlzy
 gLkB6ZuHZSJI+y/CEXRz8bdVfKFoYCGZsYx5z0WcRQginyxYUzPd/NOofzxfd6sxeXLE9DJZyrDAgX
 TObwzMlqvAes96Z5e1PUy/juWu9QKPIZmGCNFfjdo/0dpKzTSRI+14BTGvPULQhxrrdu57vJLFVeuR
 MleDRGDahrsn6feV2eDPRhMHNTWBLMGuP10Nr7V6N9yHirzp/jJK5ZIB1ibq0LWVgLH7KSvKmxFiKL
 uwHmdBqyhnNhKh7m6Dt/emc6Hcusn/f0ocbUSLIHNvWwDZsIU4b6ngOBc1kw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_085346_897848_C1BC90CF 
X-CRM114-Status: UNSURE (   8.90  )
X-CRM114-Notice: Please train this message.
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

Enable this feature for the i350-evk HDMI connector support.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index fce98a150014..1df337882835 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -872,6 +872,7 @@ CONFIG_DRM_PANEL_STARTEK_KD070FHFID015=m
 CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
 CONFIG_DRM_PANEL_VISIONOX_VTDR6130=m
 CONFIG_DRM_FSL_LDB=m
+CONFIG_DRM_DISPLAY_CONNECTOR=m
 CONFIG_DRM_LONTIUM_LT8912B=m
 CONFIG_DRM_LONTIUM_LT9611=m
 CONFIG_DRM_LONTIUM_LT9611UXC=m

-- 
2.25.1


