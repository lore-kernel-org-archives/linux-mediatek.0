Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C88D7C4167B
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Dec 2022 12:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F0LQcrjzcqyHGx/EG+ZxulY1MidQR+dP6F+oRvG3vQs=; b=1c1Mp7k+YjLXWENEmcQrXjnhvv
	ANlejld2g4lWSRv5RPcj4Uj+firM2f8MFbSWzXxM7XwUQDejFu3TDSNBl+poP38gP+lKrobJpEI8F
	QZELoBMY23aEzxqGqQYGyHRTp5rER88/QPDsW5JTM3IjTOVc9kkxYPIoViSsnXXXHPc2b4Wbyd8AZ
	4ZaUBTdUJSx7RvvyFuR7/aaIU3gezx+oFVBIHu56UljFFTna5MPDXvdvHJIT86ahhbTKJz+hXKWfY
	3EojEb8V+Bs0aSwgWan/FqvvaepkK6b8ohgFSHcJOGX2MxhtHwRVplIMTIxrbNUZaCpl4YzjjV4uL
	O/Ydv/Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAVT3-004lkk-KX; Wed, 28 Dec 2022 12:23:33 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAVSa-004lXt-Ms
	for linux-mediatek@lists.infradead.org; Wed, 28 Dec 2022 12:23:06 +0000
Received: by mail-pf1-x42f.google.com with SMTP id g20so2377840pfb.3
        for <linux-mediatek@lists.infradead.org>; Wed, 28 Dec 2022 04:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F0LQcrjzcqyHGx/EG+ZxulY1MidQR+dP6F+oRvG3vQs=;
        b=x/ZSlQ8pHG3xkV8dK6KyzVm22eyZhu3j80eOGMvGPMwCebW/JYa9bvXGKtSFn8vbV5
         5aC30qO+FGeVDqa6hM3f99d42d8Y+EUt0EWm8TFlq/4TkyPTXHubCPe6BK6txdD2JPJ/
         cYErJ2c2Ye/cFe9UA9HJlFki7EhknDZ7YBu+183MID3AA4U4OWc421E+CU5jvpKL53Wq
         SkMh7FCqoS9IAMN7cCNgH84NXgJcgvj083upOmOktH6ErMszWA+rp4ftCOeuQOWRWfUg
         VRaZLGm0Ka0jC0o/RtTXruMlZ0UTjdD0si5vTQceCk80DTEva2K3MqCzm6l5oU4u0gWG
         SGmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F0LQcrjzcqyHGx/EG+ZxulY1MidQR+dP6F+oRvG3vQs=;
        b=r543tV1aPfOaBH5S8XX8zyz8rcXF2aQeGw9hrutoyYa4Tvk5UZ49nsxyayEp4ornva
         uesnV9SziuEjDBudUlOh+o9FyYgcBp+LQm4o+HPS9k1MlfbShYOYJbBGQ4Hc1/0s1Yh0
         13+n+LXVL0dV4/zi64KdQPO9yfP1vnqHMeIjqt1WrkFU4uZ3OTs9jcPguH8uiIzIP9O7
         p3xrWEiFNoGNzAFsz0chABpQ6ezZes7Hk4KcWbsiMBI6WTheI5tui5YWy0hZSKwGaTRu
         XP5JulJt25GKzTwH3juR+nqVWsXxJDiZam2fDpocKFHNXScpMxWWWduEEKk5FyvFHw7g
         xCzg==
X-Gm-Message-State: AFqh2krTGEIA/+M34QbwFrRLxFCOW3dNGDp/N5xGovEqOI4C4qnYrQEt
	UCAeFbQTMFTlDUF9VWuV1OvPW0VFHwRnL37/
X-Google-Smtp-Source: AMrXdXudRa1wP9H6e6vGFfQm6qY0zfkdkBMEcZaDW22e10mqSIjt3bIqPJ0YRH0r2IRG0HPaz0kP6g==
X-Received: by 2002:a62:16d5:0:b0:580:f58f:efb3 with SMTP id 204-20020a6216d5000000b00580f58fefb3mr14897592pfw.15.1672230182928;
        Wed, 28 Dec 2022 04:23:02 -0800 (PST)
Received: from localhost.localdomain (202.60.225.077.static.cyberec.com. [202.60.225.77])
        by smtp.gmail.com with ESMTPSA id h1-20020a056a00000100b0058124f92399sm5236074pfk.219.2022.12.28.04.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 04:23:02 -0800 (PST)
From: tongjian <tongjian@huaqin.corp-partner.google.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	angelogioacchino.delregno@collabora.com,
	nfraprado@collabora.com,
	jiaxin.yu@mediatek.com,
	chunxu.li@mediatek.com,
	ajye_huang@compal.corp-partner.google.com,
	tongjian@huaqin.corp-partner.google.com
Cc: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ASoC: dt-bindings: mt8186-mt6366: add new compatible for max98360a
Date: Wed, 28 Dec 2022 20:22:30 +0800
Message-Id: <20221228122230.3818533-3-tongjian@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221228122230.3818533-1-tongjian@huaqin.corp-partner.google.com>
References: <20221228122230.3818533-1-tongjian@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221228_042304_790861_F88F1F78 
X-CRM114-Status: UNSURE (   6.95  )
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

Adds new compatible string "mt8186-mt6366-rt5682s-max98360-sound" for machines
with max98360a and rt5682s.

Signed-off-by: tongjian <tongjian@huaqin.corp-partner.google.com>
---
 .../devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml  | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml b/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
index 9d3139990237..aa23b0024c46 100644
--- a/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
@@ -16,6 +16,7 @@ properties:
   compatible:
     enum:
       - mediatek,mt8186-mt6366-rt1019-rt5682s-sound
+      - mediatek,mt8186-mt6366-rt5682s-max98360-sound
 
   mediatek,platform:
     $ref: "/schemas/types.yaml#/definitions/phandle"
-- 
2.25.1


