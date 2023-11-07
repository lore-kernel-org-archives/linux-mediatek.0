Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA9BEC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Nov 2023 03:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VjGaQ8sVwrPooKgFfF0wW26z1K35zhfD1sFsbJjKhvk=; b=2W+dzurod6SkOeXTE5NP/FriA1
	j3cZ2qi/KCLxjftwz/o2W9UsHr/iHEqueHWhCIOiJx0r6aFgKCfn5Ir3nMuGLqO38gtIivUcfP9NU
	KipXaqlaOG1fBWp+/Jn11cjacHgFRn5cYe7GKDBZUqXad4EPang1GIgq0Bm/r9R+L5HPdprr5frMC
	vTI5X3k6Kaw1ikUAFYJYbGL9p5pJ/Es+XrWU7Qz8/vL5zyzhQHou0YniSKuoai9VjX/7hdwwKJfav
	Cx2kDgtVelxFyP6jRBk5Dmc+2Sd2RA20nWZ9GS5HfPwKTGf6rhYP2vVtwsHniqBbHaxGq9LAvOs2N
	m6Q1EfkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0CYh-000PDa-2T;
	Tue, 07 Nov 2023 03:15:19 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0CYe-000PDA-2o
	for linux-mediatek@lists.infradead.org;
	Tue, 07 Nov 2023 03:15:18 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-5b97ca78da8so3509622a12.3
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Nov 2023 19:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1699326916; x=1699931716; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VjGaQ8sVwrPooKgFfF0wW26z1K35zhfD1sFsbJjKhvk=;
        b=wu9KfEavPn0kvEelbGyPqbRLSLY1x433uPHM2bQEYa5juUndvO6BC1nQ7h+D75K/hW
         p5/BzjwrKPlfPfKlptBPnt7pBZ4WP7Y22KEehSsLiEIqYNuObHIK4Zvm7YdTLzLmKe6v
         0xLA3ULJNFvrafIMVFF7oyD97VyVQ0jIGVIytFDWjEW3ZHF8W8Tb5HN091khMGiWoMcg
         31UAEtpqqc+7HBlCS/teS1AV/f/txLr9XuBTjkdyAA9hwLC2k6gvLEutawa7hrGAd2A/
         1hEqdx1qCJ2pB2aY6T5wndebLNaIMgoN3ADD1bMAyukE3qscq7Nzb+IPh2y1c7HT/HD2
         O2SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699326916; x=1699931716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VjGaQ8sVwrPooKgFfF0wW26z1K35zhfD1sFsbJjKhvk=;
        b=fGluUAGTdCVYOPvi+5sy8CthWACXv5eFOZYuU9UDXkUYjWnnOjSPfWrBORe3NPPLzg
         cwdsCZeojglZFS63JE7RwnbSVH1Dd4r2r8pw13wK8DjC8ClXuscH3u3q+XfS5hmUi9Gf
         WfuondmtDh4pGvPVzdBtwgrG52QqHwGYhxRIhCNTh2LGTtyiemGMhq8cPZiBorQFaonE
         Jq01XyejaCcYkpZUiC/ZTozECNGb9mGFusA8g9lmZkTaMyxJkRJpV+CSVoWEnY3Q5htn
         lfaTorT/YKxOBUX8qD8XmHDCY9DJopRBglY5o6lpVRiJasDzxPaU7SK/RokeGkMZ45Nh
         qcgg==
X-Gm-Message-State: AOJu0Yz6Ag/uPfjyuppwqw5Jz7pCFumDoMS9DTFgPOB2PrywHbFn5jIf
	nOdHtTRxcCmVoyBF3YCxwFjApg==
X-Google-Smtp-Source: AGHT+IER3Y/ulUbkkvWfobAZ7dP9+KSyR1UZ3V1zIalrwlFW1aaC8Y5VcpoJDtAEzLSG1Ccp5wRDfg==
X-Received: by 2002:a05:6a20:7345:b0:17b:2df4:87ed with SMTP id v5-20020a056a20734500b0017b2df487edmr28840082pzc.17.1699326915968;
        Mon, 06 Nov 2023 19:15:15 -0800 (PST)
Received: from localhost.localdomain ([101.78.151.194])
        by smtp.gmail.com with ESMTPSA id jk4-20020a170903330400b001c9bc811d4dsm6552282plb.295.2023.11.06.19.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 19:15:15 -0800 (PST)
From: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	angelogioacchino.delregno@collabora.com,
	perex@perex.cz,
	allen-kh.cheng@mediatek.com,
	kuninori.morimoto.gx@renesas.com
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Rui Zhou <zhourui@huaqin.corp-partner.google.com>
Subject: [v1 1/3] ASoC: dt-bindings: mt8188-mt6359: add es8326 support
Date: Tue,  7 Nov 2023 11:14:40 +0800
Message-Id: <20231107031442.2768765-2-zhourui@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231107031442.2768765-1-zhourui@huaqin.corp-partner.google.com>
References: <20231107031442.2768765-1-zhourui@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_191516_911432_70690D6E 
X-CRM114-Status: UNSURE (   7.96  )
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

Signed-off-by: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
---
 .../devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
index 4c8c95057ef7..9df5e44176d0 100644
--- a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
@@ -18,6 +18,7 @@ properties:
       - mediatek,mt8188-mt6359-evb
       - mediatek,mt8188-nau8825
       - mediatek,mt8188-rt5682s
+      - mediatek,mt8188-es8326
 
   audio-routing:
     description:
-- 
2.25.1


