Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C16EC531D0
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2026 09:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OWdXeAE8uA9DV3aiiuBfjSr6VRPTM+UnFjc1T+sgsLA=; b=sILivvqTRHagufWEARpNoAJTsT
	9B5+SCQ0AV8+9XO1yUY4CEP5OkZeEvarAHdfE7JHAiTNUrpA6nU3mIB1BZJtoz8BD26ZqK8cGtCn1
	mG/ETUFbHh/7Ckrc/6dbl6udGwG5l24lJdLj029ZqTpte19fGChfQ5IHpEkABCiFQCirrx3dMU0dZ
	vmDAT0neIGSoXOOCi5poLJbdbHbLQh0V8TEsGzCpo7AWHdLQkHBqvxV1Xoeh/Zun7BzgjwaoUrekG
	I79pAIWwl3nvgIVjq0nd1orhERK7iQYo3bTNEEXywIhaNGYHxLF2YZGRu7bWOmh7QVnWfE+LfHm5V
	3+waxCbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woHS2-00000002J0m-0LfK;
	Mon, 27 Jul 2026 09:16:46 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woHRw-00000002Iuv-28oL
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Jul 2026 09:16:41 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-84862b0d5aeso2420659b3a.2
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Jul 2026 02:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785143800; x=1785748600; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OWdXeAE8uA9DV3aiiuBfjSr6VRPTM+UnFjc1T+sgsLA=;
        b=bz5736Yq5ct0WJDNWlVt2k9Jk5ja99M2KtK+i2bd2VsWoOULsJUr0wu21RuMxXRfpX
         fJYt7yvVd16iCheuRvxHJNO6RuU+d1hy7tBjFvP1wBoUx1ysvJDuSfcHmyJPkvJk76n3
         je9wKWRG9Pi/RFqJ8xtKKioW6dBRFwM+7ooQU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785143800; x=1785748600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OWdXeAE8uA9DV3aiiuBfjSr6VRPTM+UnFjc1T+sgsLA=;
        b=eC8WJagskqMMohljodQXXpPssmwBH+fZtlyH9Dt5EnM9A96/VQleVJQBPzcPpsqxFQ
         aOEgQhWguLk9LFBIvlQ061qV7FjbxLUPEHfxzfSAGIwR3Nr0FXDsSV2tolmN5cOcP2P+
         cZH1ZfEIpGyGQXN7TMLVx0v0d+zcELKC6wGBYHkpQiDmcPgEd+4J4Nv/Qgho0aFsomAq
         d0IWCWFbinnRFo93TaU8J03L8NfQrs2i0diat0GqMfwggzaRlMsqDv3cbwwlQnL6glEz
         qxko5fM2ERbeJotwZEjPs27XxN9NapFg2VrBlDerGXHeScvlKxZ7jWFDUk3kcsqAs5Y0
         ZYbw==
X-Forwarded-Encrypted: i=1; AHgh+Rpg5KezBOI9cZ4zC3LNq90H04dDbLZjEXICKu9NW8nSQ5CXutRlmEY4FhsKMFj+TDA3G8Ilt8ZpCJIVsuW8mg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2WXL1yEWk4THe+o7VsVJBohLwVMbCDbAjioTqYYEMZYH8t88C
	06GOt6vkfRZK45mM8p29j00ezIR5YhfL4DksCSpbZCY+9SNzSmytR2mhNLWhIAI66g==
X-Gm-Gg: AR+sD114faYXczruuFg8lov6EDsoabuohXEXzicckOk9bVfaNGFNyhMDoW6ONGwJLd7
	HUTGHm8Owvr+DnEWHigAvYkB8Fo3i1G563xsThhNzk637AXBxYzGmiPPT5qVja8sPqSHceZ5L2W
	d5oMyHERuv8Qap5Jft7Gb25R3836fuPoRHM3pIoSo+sMziq1lpjvzq48jJP//CO2rVKDDrUKh8p
	TNR1RA959Sh9UTNo2Zaw/LLCDD+joaNyhRusMCidDCPrBI2KpQelfv44YdFz7xHtewXUE9fo5hL
	20c9jLEZNYii81OcLxp7RKbrW8IUhcjyW8TZbH+Pzirs1QMcuBO2Zz1BarCr+O/fHhMQcrYMlEl
	YS+yyXHe7DniQoUg77nDiX033YY/Naolu3lDOof1xDECzzma5+qRd+uAm2MDCkI69XudNQZmUOr
	6UCV9J77Ee82PN1BjOOVM/UzsGcZdHHAyWboBy+VLvaOy7TC0KpaFmB3/zZA==
X-Received: by 2002:a05:6a00:4c11:b0:847:8b0f:2508 with SMTP id d2e1a72fcca58-84e5942eaecmr6235745b3a.13.1785143799693;
        Mon, 27 Jul 2026 02:16:39 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:440:c713:a2b0:6f14])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb662329fsm2870049a12.9.2026.07.27.02.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:16:39 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alessio Belle <alessio.belle@imgtec.com>,
	Luigi Santivetti <luigi.santivetti@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	imagination@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	YoungJoon Lee <getfeus@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 3/5] dt-bindings: gpu: powervr-rogue: Add MediaTek MT8173 GPU
Date: Mon, 27 Jul 2026 17:15:52 +0800
Message-ID: <20260727091555.1023910-4-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260727091555.1023910-1-wenst@chromium.org>
References: <20260727091555.1023910-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_021640_553608_606153C7 
X-CRM114-Status: UNSURE (   8.88  )
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

The MediaTek MT8173 comes with a PowerVR Rogue GX6250, which is one
of the Series6XT GPUs, another sub-family of the Rogue family.

This was part of the very first few versions of the PowerVR submission,
but was later dropped.

[1] https://lore.kernel.org/dri-devel/6eeccb26e09aad67fb30ffcd523c793a43c79c2a.camel@imgtec.com/

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index a6bccb600a57..e9218e0f363d 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -16,6 +16,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - mediatek,mt8173-gpu
               - renesas,r8a7796-gpu
               - renesas,r8a77961-gpu
           - const: img,img-gx6250
-- 
2.55.0.229.g6434b31f56-goog


