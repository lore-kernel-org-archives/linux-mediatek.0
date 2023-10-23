Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 458A1C25B41
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 14:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GnW1vwbTtC2HOu/cZzh2Qo1PkLHHngu1dkPjgS4ENio=; b=ZMW4Bz7ZqxjN1HbTkb19xu4vae
	4WSm5f6kK+eOtlb1QrUVuyB65sSose6UxkO7XyMGhwhJKlCCkrlKiG7/eycxH7s8fjibCPWOr1wcd
	UNEIamiYbL2NWrNQpVY14Zqi9nsqyybPVy/0gG8drO4R24bXKnKkIaFo6iAtBZBpoBpHtaDBw9iyg
	NVdV2vptUSmOS1bkd2PNz2A9qN+wZHjkCyhAoPv3jYm2MDw3KJievaTUtrlAsID5/ADR7skI6ZqEV
	ry7zV02xPU/ZzBj2XSnLXvyWDf+5KZS4gKeGJdGLvPNf+6rHwin+HiC09Z7Zn11f/jkvIrl4xKngg
	Sx+BrvoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quw83-007adG-04;
	Mon, 23 Oct 2023 14:42:03 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quw7H-007Zym-2x
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Oct 2023 14:41:17 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-778a20df8c3so239948985a.3
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Oct 2023 07:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698072074; x=1698676874; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GnW1vwbTtC2HOu/cZzh2Qo1PkLHHngu1dkPjgS4ENio=;
        b=zhR2NDVJA7++nj4XxNlehB/X3RWwl/Rg6G+8wA+fLRX29RWWlkSQYNTyF0TPc1DXQ+
         bpptQJCLwtvjma/Wiu1+hk3pXarhX6hsMOTJMCyz+UKNRDvVysYUZ0k5YvCk8Ar1sAuD
         TDmSw9EsRXIkz43y7vvhQC9KxZwDD2Rt4dx+RNDdK2uwM67bqwQRR1Q0GRafKUVo878w
         7FMf9WMk3Dc3PO7mmzheLypXgSemWggscdaQJbZGDXqQIr2gqocj3U7LoL+LCFRTfh4c
         CRu43wqe8HRdNY9jQBWEf+5vOZvX5H7YU9LcLAXIKuSdAjV3aYkeOdF1rI58LfvwhncO
         83ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698072074; x=1698676874;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GnW1vwbTtC2HOu/cZzh2Qo1PkLHHngu1dkPjgS4ENio=;
        b=fQVplp1UtzSISJo0JaRgT/Zg80mlONts82Am5aZVifAkNpBr01rVMDYArHxVc8YUyq
         S61UBYoCRNSuP73bsn4EX5U8Hgnmw05JGoqWBeyegRNrEfn20HS5ZSZzRiqL0RDthzep
         kWR351y52f7zcoWRO/TaLRSlJAXXl4tpT1bdJxkeJsAmTEPYJjCvbiFPli9LP+UDlde8
         /y//1Zl8Zf/Rzrgp0k+IUrNK883/Jt7JrI/v2noZ0eRRjTs94aRuEQCNRFzIOowMnPU8
         ebQVrxAqkaBhZxX07X1haM7qxwXx8pTXLYZXW+tJrj9/lGa9a5Drzet8/MINpT6gMBUc
         2Jxw==
X-Gm-Message-State: AOJu0YzkY/JjQbGrPMTKyao1uUchV0YiNRCJ5Qy5uVfrFDZfE1QAJGbx
	+2f1bjAUs+oE8iuMcd9RAznGug==
X-Google-Smtp-Source: AGHT+IG05HZAMl6qM23cmvchPry/9vyia7XBR6CQbmQYA7BGiJRGKziIDoX543mAemU07ICYeQfxig==
X-Received: by 2002:a05:620a:2b8c:b0:773:d86f:ec88 with SMTP id dz12-20020a05620a2b8c00b00773d86fec88mr9784107qkb.35.1698072074736;
        Mon, 23 Oct 2023 07:41:14 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id f1-20020a05620a408100b007789a3499casm2725020qko.115.2023.10.23.07.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 07:41:14 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 23 Oct 2023 16:40:16 +0200
Subject: [PATCH 16/18] arm64: defconfig: enable display connector support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v1-16-5c860ed5c33b@baylibre.com>
References: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
In-Reply-To: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, Xinlei Lee <xinlei.lee@mediatek.com>, 
 CK Hu <ck.hu@mediatek.com>, Thierry Reding <thierry.reding@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=701; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=UiHNb4i6ojEuqkwvKy30tzrI8LnM4UXa6wUtnNRc7vw=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBlNoXPSDmUpXOWQ9V2uW9CzePYmobdbyaSkVPMW+Ev
 5NfjLaiJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZTaFzwAKCRArRkmdfjHURffnD/
 wM151OCbx3hPLNKgDMuV9MTWFsZul3HyMZSqmD8UVRycvM0Z//6XVSw1gyZYj0W/s9GK6kMKZqs2sO
 7c4yH5v+aCP1yvhujwT8YOQlbOii0IrL/umKyYWlhqYzV7wGlmuwk8gYk0JjHZmE5r35l1TpYdDdfp
 +7tmPg8In/SSN/fxjenTyNXInxy4wVs7upezcGhDIU7jfNubTm8MogNu6F0kiPMyPRlQuzGK8O8GPd
 3eT7cLUatFHFfSp2zFnX4G2a8990z4H7mhWu41aYHKQ/zFc25YeIgLPb8l3niEyTl3x3dGQLwpcYc2
 VOfvJD+nCnmQn14NAhvC4Ln/Gg/V69TduURz6Aixd0GxREtlKpzQF6Ebk4+BfMmujIOu6dh+5D3i7m
 injvvrxDSaVuqpEhy7ofrRB26+TDj0z+pPASQyxkoc5CfRT3tfZRm60TQ0G8aPOJFd4XlNe9EHEy5C
 +Wq3GQD0s1mghVWSiXZWiHo38d8vvevolFLn6+OkeVYNyjCBlqQbEnEmqeIyamH0rT1zC5gnFNdiJT
 FjfkD3Hv/9iWexMBG2WgPeQm/cRJt1VQOncH+Se8YcD1H5QoDTeVv3dl1bVtUdCCnjdBuREG3NpcRQ
 bUDH4oZTFn1aUt9JzckJmJ0r/DqF/rEceT+liWPK1MWQP3Omymc94kMzEotA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_074115_957319_32C32401 
X-CRM114-Status: UNSURE (   8.84  )
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
index 5315789f4868..0a60e7616abe 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -839,6 +839,7 @@ CONFIG_DRM_PANEL_RAYDIUM_RM67191=m
 CONFIG_DRM_PANEL_SITRONIX_ST7703=m
 CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
 CONFIG_DRM_PANEL_VISIONOX_VTDR6130=m
+CONFIG_DRM_DISPLAY_CONNECTOR=m
 CONFIG_DRM_LONTIUM_LT8912B=m
 CONFIG_DRM_LONTIUM_LT9611=m
 CONFIG_DRM_LONTIUM_LT9611UXC=m

-- 
2.25.1


