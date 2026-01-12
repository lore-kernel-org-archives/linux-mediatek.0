Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 896C3D25056
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jan 2026 08:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QBSIQiFn1pJ8WxGR+6gHaHWmEyf1wSX1ElHds5zTP8w=; b=P7n7NJn1/tSx15ydQwNZV+EkYS
	S9cZGlBRzaTb8Bj57a7Ax7/NfJpqZbtMwb9IrpzShhfGjEvZBT1OrYzzSHie1joQPRCCLrLr4L9WG
	VrIMp19ZGTAZr0da2o8+53Oq8exCsLDbSrBCwVD453UuMpSSdOSZ+NLCiYT28ten38Na1SFXB/tTf
	9whXA7oLh/KolbOdgWmyvZP0WYx91w7J4TLBMFh2l1BSWIKU3YE6VgIRQ4JuHn87/Ipc8EdOWUqqd
	AXuNEhs3jWj9RZWIVNP/z9spirIyW7P89ydIiRsZQH0voXHePxeplWUH3dCcGjI7zYmAweu8B0Mv0
	XbjQvHcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfDiU-0000000523i-1sVw;
	Mon, 12 Jan 2026 08:56:02 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfDiR-0000000520l-2g22
	for linux-mediatek@lists.infradead.org;
	Mon, 12 Jan 2026 08:56:01 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2a081c163b0so40822795ad.0
        for <linux-mediatek@lists.infradead.org>; Mon, 12 Jan 2026 00:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768208159; x=1768812959; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QBSIQiFn1pJ8WxGR+6gHaHWmEyf1wSX1ElHds5zTP8w=;
        b=PNjgwOft4HZ3wyD+rdaxo54mOieNzWuiiuq3uDGU8tpRuTqkr5O6mCSQ/hNuQI2FOc
         ojlM+uvHLD3ixy63pBCUMODEy73zGnGeRrNW+nis+tMvVrFXrb110UXFI54RHl7FcqrA
         va6tKHNdNShJzJncVZvjRDuWahZpeiL+ByQmo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768208159; x=1768812959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QBSIQiFn1pJ8WxGR+6gHaHWmEyf1wSX1ElHds5zTP8w=;
        b=YX2ImZPTIzHz8w2tKK3+bGDaSLDVSOFK5i5luR1qbEQMZdWQLXnkxv4bBMCVtlWwRq
         pIqAUPUtnd1lqUBoGQesTisHAhXwRlofxVmxFKEfTyiuDgT1fCjnXpKJPaUv3bXOmnRl
         Lafmq0XrusFLlr5MjCBoVwctM+7OhP/2ux9rOKsLyVtd4bnEaR5UwtpxnYr7p09zlhmc
         h9LczwnSP78Xm4HQazNYnccruesSxpFiHI1PrbvDpRKapoddZiXzAuPIF1EcuXcj84Rs
         6fhOztm6yHFW2N1YrE92BiJ4y+o6HV2JzwpXEaEt5fCmnRTJkNw1BwiNOUauFDZvhRxV
         YkIA==
X-Forwarded-Encrypted: i=1; AJvYcCWDr1+M9u91FcwLrKfhX7wfFw4xuzZpYEz/MXVXRZnaX0+YKY4HeKfjqojaYA1aVbQzITRV/iLGE90R4lB5gA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyp059okV6H/CLevo9GEp52wxAADbtnxEFMkTqKZoMMAZQ/815n
	ZZFLzO5fXpabPGnafBgHvy1xBzTKaViGO5eccxORDB0kq0L3JyM4VExgRMp4myVqhbu1EXxgkzE
	ufa4=
X-Gm-Gg: AY/fxX6RtICZCwFmac9EVoTG2jyv1B+5HRo6kAMNYB2L9y8NC9hb/MO0ny8fJ5N8ZdE
	e7R37P7l+vbX7VgfGtfRcP6cJHkL7CcFnXAeG4F1zs/ych53y+FMnLIIq1FnZFm/WzqmMl8pMWC
	e0v13gzoWuEIL9RzpBvDQZfHziKyeyKHQa7RptbJ7KyFBCzM1aa2j+niFgMop59sXR145BBnhfF
	vG0isdIOn8yI1UeGDZgu5UjEdWwP83QOBf/DjO5YNJDon5S1aqMIyC/l16DYIHF04DYEJOSVcf6
	foAMpRWS6jbOraBebyREuthQqpFOOeicVBgC0R719HqM5KUeAqkuRp3e1zgukG8Nb7uYDEtweU0
	O52WkSGdbaCysiMsD2g4nLqUWNYpvVtN83zU5C9RzxbQjhhe+wy4xyiKHmlSXL0iqWtZfIoBC4G
	xFVQTYZ7amCyPU2RC8KRBSjbGVLXkBD7/HShTCm7H3j9f4Oubgm65pI+hyiJ+gJgDajfs=
X-Google-Smtp-Source: AGHT+IGtB+k7knNOCZZSJhn6Was/koQjz+fojMEFU4VcO+xFjd8RphFsKRaQZGCbTaB+WqAm20+R/w==
X-Received: by 2002:a17:903:2f8a:b0:29f:251b:c9d7 with SMTP id d9443c01a7336-2a3ee40d593mr149472035ad.12.1768208158695;
        Mon, 12 Jan 2026 00:55:58 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:aba6:4082:c9d:6c7a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c491e7sm170227935ad.38.2026.01.12.00.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 00:55:58 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	=?UTF-8?q?Macpaul=20Lin=20=28=E6=9E=97=E6=99=BA=E6=96=8C=29?= <Macpaul.Lin@mediatek.com>
Subject: [PATCH v2] arm64: dts: mediatek: mt8188-geralt: drop firmware-name from first SCP core
Date: Mon, 12 Jan 2026 16:55:42 +0800
Message-ID: <20260112085544.2959250-1-wenst@chromium.org>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_005559_734685_CAB38D04 
X-CRM114-Status: UNSURE (   9.75  )
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

Arnd pointed out that having firmware-name in the device tree is wrong.
Drop it.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Drop fixes tag

 arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
index 7fedbacdac44..8e423504ec05 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
@@ -1166,7 +1166,6 @@ &scp_cluster {
 &scp_c0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&scp_pins>;
-	firmware-name = "mediatek/mt8188/scp.img";
 	memory-region = <&scp_mem_reserved>;
 	status = "okay";
 };
-- 
2.52.0.457.g6b5491de43-goog


