Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD5DDC47072
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Nov 2023 09:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lnUk2lN233lJF/YyaHvDp2l8ZWBM31IpiG9Lcizf72Y=; b=QSlIgMJKBJO5SZldl53dOXbaDy
	7rxNggDUVkSIxClihF1UUy2hw5GUNuW87ih/h4cOJcF9eEWrHbXNCDPHyC4W6tWmVYxeYhu5I+LPu
	Nw9NB9HHrZKh0BUjHyNDTD56FEy7hKmiNCgS8sWyqXTxa8fR9FS24bjKQHWyK83KCQpOjBc/QKIW7
	vDZCLOAyS0o3SNMTKhUioANdxRT4zULGLCX41M0hSQT1J9pnaX+h/z5bYe+nw9L+IYZSTpaoFiJok
	CQMqUMDu3WkIM9u1/E8GGThbnt8YBeE/iRNSYpo37M5kWflaspgokBt92IGdgzXb4Yrk5tWz6vir1
	bxwuSFxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3Btf-000Iry-2H;
	Wed, 15 Nov 2023 09:09:19 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3Btd-000Iqr-0v
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Nov 2023 09:09:18 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1cc1ee2d8dfso58607475ad.3
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Nov 2023 01:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1700039355; x=1700644155; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lnUk2lN233lJF/YyaHvDp2l8ZWBM31IpiG9Lcizf72Y=;
        b=SG4zI+I3a93pOxs9lysIA9BI880/zLLAG7vsw1z22ThhjghD+qkJF5F53gcRASPbXi
         KLJls12P0FChhKOGPO2VcEBydh4kYZfZ50AVo3W7ZHl4NnLWSSjVn0KMyAPSehsDOHam
         iDSomrn8KvPIPMcTs3U6x7faZhFgal1+6oex+KGMRH80ETIfr06Lx4jydT/tgOe4CmLD
         L0XqrzAD2TD0cNWDPEHJmxuh3TqlsjquGY626n69k5e48F/BfMh30lgMOT1o9GGZ4nAj
         oq6VQg0K7bBa4IvhUr1x1LRwtlSEwC+sriAPy9I3gdrSfnihVKPaGuvPwQ2aFsJ7i2pA
         Ls+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700039355; x=1700644155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lnUk2lN233lJF/YyaHvDp2l8ZWBM31IpiG9Lcizf72Y=;
        b=il7hcLKGaICwz6wEi5wAUE3a+UT/8IThsTWjP4Fl5lkt0u4G6TS2rxk6z5bMGyqXGq
         PNgGPQUegWOVjgPQoRQOoTcu5fRezTaRonWo0io15b46Iw/h2SgLJUFysidjF07RkxZw
         OWui+eokHAskTBYNX0lkgMNTi188BB1Zlnq4zLLdND0PYf8/d9hhw0hZp0PqN4BAXZYD
         MhCLm2slYNNT4OiKW4/vUOiu5tJHzwNsIePGmOPSwvQIn6K/kXgpsH+7byj2K7Z1KsZK
         j6NnbFmH21bejXdmrpZgvCEGRCbIYtrtokdGkAqJQldiqbVfEuiUoPMtMr3zH51M3KNr
         CanQ==
X-Gm-Message-State: AOJu0YxfWgaEZf1LN+Df/VexQq0hEXZiTWAQdREHeJtaszoNmVJtoe/C
	FmAB0ll+8arqF+j2hc1cXPaI1A==
X-Google-Smtp-Source: AGHT+IFZGtkuQq2qNZd57OHbCc82PovBWMCZhR6ivresQJ7DFFd26gEjRZV2yi/phMtadOQMcm0ssw==
X-Received: by 2002:a17:902:c943:b0:1cc:5cbf:50d2 with SMTP id i3-20020a170902c94300b001cc5cbf50d2mr5005941pla.59.1700039355082;
        Wed, 15 Nov 2023 01:09:15 -0800 (PST)
Received: from localhost.localdomain ([101.78.151.194])
        by smtp.gmail.com with ESMTPSA id l18-20020a170903245200b001b9be3b94d3sm6977377pls.140.2023.11.15.01.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 01:09:14 -0800 (PST)
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
Subject: [PATCH v5 1/3] ASoC: dt-bindings: mt8188-mt6359: add es8326 support
Date: Wed, 15 Nov 2023 17:09:01 +0800
Message-Id: <20231115090903.578438-2-zhourui@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231115090903.578438-1-zhourui@huaqin.corp-partner.google.com>
References: <20231115090903.578438-1-zhourui@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231115_010917_325084_DBB5CE09 
X-CRM114-Status: UNSURE (   7.58  )
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


