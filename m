Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F11EC47072
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Nov 2023 08:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lnUk2lN233lJF/YyaHvDp2l8ZWBM31IpiG9Lcizf72Y=; b=Rc495qj1hB5mh90gRzNn/frTq1
	/4EgHU6f7/SN76tTT7mniBCgKAsmply/FR1EBuqtJ+Tm1J8GG+ryehLXEp+6wMZygOyLHoS3gmxia
	TulM5mMMcyrxiFP4WtY7UtK5zwJJ21TfE28zzj7ENZxSuMOBSXFcPTQ0o+hdqGVZL4V5aPv8s7z4y
	Igoo1857rUaezXvy8hapVwzyUZqcnv6T7G307ailU/leAS6mASkKf4jpA9QpskzyLcuQKzVvah6lY
	Fm/lLDQDnHmHjthp2n/4fq1KsE88DBjnTvqv3c0dcELa3dPvIBs33dPU3VMVGxt+JHK60LsI8tl9l
	3ZwYGLsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3Beo-000GaE-1u;
	Wed, 15 Nov 2023 08:53:58 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3Bel-000GWO-2z
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Nov 2023 08:53:57 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-5be24d41bb8so497629a12.0
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Nov 2023 00:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1700038425; x=1700643225; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lnUk2lN233lJF/YyaHvDp2l8ZWBM31IpiG9Lcizf72Y=;
        b=WOz1Hrejd5Bf8tgqS+szCOQiGsh1n4v8Tzw8MdkL7o2axr7m273f8vrjMYLBOSuaDH
         eRcWo85wuvA4GviaKM22O+ey37VIelFUoQjTkJoGT9sLU4tNtKb9FcNJ7PvnDyj3GBLZ
         OIdKyhQK8akBG9c/9vQJbbFe2UhVnv5VCe6ZYKZlji99judidZRVobBiUtZ4d9eeotEk
         mPSm7FqsaF3RSh8Siewd87+dObjw+HU+wAweYttbohSzGL6HZ4cNhEVY1rW9RN+kvf9X
         kVNvxWarrduGhFySe+2HsmSyb9tNMoeXHT3y/wyAAh4XM3qHP6s7u/9XI7MSrH7bbZy9
         kBrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700038425; x=1700643225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lnUk2lN233lJF/YyaHvDp2l8ZWBM31IpiG9Lcizf72Y=;
        b=mxaoSvOeOzYk61Z7FP0MM7wAuMnN4ia1fw2Ehl2drbIC7BKxdj9wuNXG2f5pdS51jI
         d9EZ+4OZvUuxI+sQm3VYyiyAb7HdM2OiXVGM/wooUj/tgW2EX3GHCgNEJTLaD58DgoBZ
         mMQAfRWElqf6eQPdlVs2zK7IZkPQEL7Ng9v/e2dSub7UzAjiq2inD+cFggbHd4dDr7PQ
         vKCJwpz3+auF5DsfwbGNf6w6cshE8+/6s/SnOZUybXT95gzHQvofb53iga4KwAU8lE2n
         KuWjhELBdxsJjVJikiFmmQe+BIOSoG2MM1btu/ezUSKucjGBiDyX9OxAaHpPT+TrljFV
         AKBw==
X-Gm-Message-State: AOJu0YyN4iziyI5E5F3rQVv1FTJqarS6pOBrN8ejvAMNGOeavoEg8Gam
	NvD5Egw8s0M206q9UkMcHlQFvA==
X-Google-Smtp-Source: AGHT+IHCRg8yR2isWSv43aT/ebQoEqKAeoNhc8rfjNK2yfWx8K2LfWkPlYhSyz4U1v21f1Sa+o8yKQ==
X-Received: by 2002:a17:90b:17c7:b0:283:2873:88ad with SMTP id me7-20020a17090b17c700b00283287388admr7290369pjb.10.1700038425431;
        Wed, 15 Nov 2023 00:53:45 -0800 (PST)
Received: from localhost.localdomain ([101.78.151.194])
        by smtp.gmail.com with ESMTPSA id z2-20020a17090ad78200b002794fe14cabsm8331449pju.12.2023.11.15.00.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 00:53:45 -0800 (PST)
From: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	angelogioacchino.delregno@collabora.com,
	perex@perex.cz,
	allen-kh.cheng@mediatek.com,
	kuninori.morimoto.gx@renesas.com
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Rui Zhou <zhourui@huaqin.corp-partner.google.com>
Subject: [PATCH v4 1/3] ASoC: dt-bindings: mt8188-mt6359: add es8326 support
Date: Wed, 15 Nov 2023 16:53:27 +0800
Message-Id: <20231115085329.541764-2-zhourui@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231115085329.541764-1-zhourui@huaqin.corp-partner.google.com>
References: <20231115085329.541764-1-zhourui@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231115_005355_969356_CA39A775 
X-CRM114-Status: UNSURE (   7.69  )
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

Add compatible string "mediatek,mt8188-es8326" to support new board
with es8326 codec.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
---
 .../devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
index 4c8c95057ef7..f94ad0715e32 100644
--- a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
@@ -15,6 +15,7 @@ allOf:
 properties:
   compatible:
     enum:
+      - mediatek,mt8188-es8326
       - mediatek,mt8188-mt6359-evb
       - mediatek,mt8188-nau8825
       - mediatek,mt8188-rt5682s
-- 
2.25.1


