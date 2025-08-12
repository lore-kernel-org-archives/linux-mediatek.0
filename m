Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB9D2C87FCB
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Aug 2025 12:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jZ4gc/Zl5lzZDEjUwdPD/JiqefAjh6ZunVQqiM20mjs=; b=MrJH7P55r0sogyecaNKlYcmC6E
	KmJaNvdQ79dz0VbeiSuuvX5BX+k1JGse+1WgaZY7equOmBl5gHLT6bZAL2CunYSvdukLB8z1uDQ5h
	dytKN1yHinJGvE82i2Zilf6FaxFCJrl+DIEmj6NafceOwugqn82L8/h2V8b16IPM2iNp/Tb7Rxzml
	gisNUi5ycyMhi9/BC7V3HY0gIPltoexdOnXnGVqeIXTcyNJFI9HCEmVGoyQvElsA96nCI6bN1JhFN
	QhO8nD4wmp0vV6Th59HQbzH03KOotrBY8aTIjP3uirSb52HBLMuM5/W2Wx6KrXzyk8ypIDNwAQ47T
	JTvO62zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloHu-0000000Alyc-2e7y;
	Tue, 12 Aug 2025 12:39:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulkqk-0000000AJiC-0ddi
	for linux-mediatek@bombadil.infradead.org;
	Tue, 12 Aug 2025 08:59:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=jZ4gc/Zl5lzZDEjUwdPD/JiqefAjh6ZunVQqiM20mjs=; b=Gdlf4nRQGDGHo6hGTSBQpdSDqE
	Y2MnXTFrGmByQVttr3hcxGFnRjhQ1G8tbkUU7y9cAW6PAakttVsXJxbvLq3qr80gWf5xwsxL49iHu
	gAnFPtSBgPpaMQFQrScAqP70z6OR/bpvfVJ3vFg6dfZXt0dt3yVA0E2hxQMjAVBDctUT37fwh1iXN
	03yqkVooKwGleQ9OOV+RIK6AGiGahIH7tYcgr5dEt2acCBBt4F0iH/+JJrhZsdruty/ngUQFPpC+m
	ntvzeyttwZrPA6FxWT+AsuSAfSeLJKfJDHpSsbo9ygzRfp1RfB7SvoJEIZy0RWvJbMqvYv4K7I8CP
	O5h5S1Lg==;
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulkqh-0000000FlQJ-1dAH
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Aug 2025 08:59:17 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-76bfabdbef5so4320986b3a.1
        for <linux-mediatek@lists.infradead.org>; Tue, 12 Aug 2025 01:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1754989153; x=1755593953; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jZ4gc/Zl5lzZDEjUwdPD/JiqefAjh6ZunVQqiM20mjs=;
        b=eedOBn/2xfydnMUe2KAp1cZC6kXIlpuDWzQ0izGe8tfMoStzNbb/xmK00+43OvnDGD
         9Tz5RRi6OBpZgoitxCgV/nB2yFH0ojz2M4Ul+Wa8DnWTQNGEe2oz0vIibDPfjTsJSHtD
         TwckhKk/Lw6SF9pdI6TfcRTqP0GurFoI6d9Dw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754989153; x=1755593953;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jZ4gc/Zl5lzZDEjUwdPD/JiqefAjh6ZunVQqiM20mjs=;
        b=mniKuX3Geoi2FGi/U7TSRjLSWZvefRHIAiUussDsCu9D3qvBi2h0ditNJdjCxw5PQv
         nuuM6IDQY0KW/Rh4Wj8K4d8JRlCzrW5aa8QO7OEG7lYK1em3f9uG2NKTvkeSoT0viMld
         zBX7F9zzLIbOofS7RyYDVNBrVqgbX4Aiz2nJSGCKcOMpuDUCkqQCdgHrfK5aElpsZrlk
         F+PVqEE1K+26bVseE2OhQduLFhnm7EvdZu++DLNzQLvAVuYGzXuLXm5Gr61k/D059Qbf
         8C6l+bEb8Q82Le9ve8Ijhh94Vryhz1IAmFI3pCPvfprAREzUkBfC6b154gWprZaNW+CD
         ElkA==
X-Forwarded-Encrypted: i=1; AJvYcCUGuZvQee3IYrAx64A39KfXu4yTuLpITPQnNwYxrutrQat+LNQxMbY3MzmUaXEbWJwVCNM+vNMu2niPTGmY9g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7xrjHRp8H7BEXYGKMubKXTORUPJtfN7jkGDvMtZwiqiKYCc2H
	zCd6UJNCAirPaQigGhBQLP57ArcP/di2W+gOS/bNQliVbeqPjMa2Hs67V4qEFfKmdg==
X-Gm-Gg: ASbGncuDCIGQkXs/jTJ9lsBCUb0TcS2ywgOu2lb6czl0yXQ17BUpUuWarFeogrUNmIZ
	ks55A57lyAM0VHIytGD7mspPZ6sDMWUnLGz5zgQWYiShV3+7gMLFTjhzpsvBjqUg0yb1LdgRT/n
	bPeiyC8F0yk+7zWgy3MCoYMYGDzA9kIRjuhUXnedbkaWoWbBC7AgFFzlJH2NKRDoiPa1nbzkt4Z
	YLAb16EJMbRwTyaVSOBUahxI8XieW5JfCG2YK7idDDr9Q56UbthZJ3UjAhS+xEAztmz6VGpU/8w
	6lSxARLBcw2tRk71z3ntpgPVkiZOZfhcnSqf+884DkSHfZUPydAqyYSsZbPgej+1tVV/BTX/6hZ
	0onWe8I72h+pnVBB/faS6iUVmetYmKZvWKj9YGZVP
X-Google-Smtp-Source: AGHT+IGXDOk02fIlA5qGSfKYGJ9s90O7hcZRHRwO1X5CkCWLtg4wt+uUNkT/Lzp453pl+RrYTnvzDw==
X-Received: by 2002:a05:6a00:3c94:b0:76b:8b13:e06a with SMTP id d2e1a72fcca58-76e0df53209mr4119372b3a.14.1754989152945;
        Tue, 12 Aug 2025 01:59:12 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:f81e:7c91:8fbf:672a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bfcb26905sm21989442b3a.123.2025.08.12.01.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 01:59:12 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] arm64: dts: mediatek: mt8188-geralt: Enable first SCP core
Date: Tue, 12 Aug 2025 16:59:00 +0800
Message-ID: <20250812085902.3309160-1-wenst@chromium.org>
X-Mailer: git-send-email 2.51.0.rc0.215.g125493bb4a-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_095915_494604_98BED17A 
X-CRM114-Status: UNSURE (   9.53  )
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

The first SCP core is used to drive the video decoder and encoders.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
index c5254ae0bb99..10764786bc21 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
@@ -164,6 +164,12 @@ reserved_memory: reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
+		scp_mem_reserved: memory@50000000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x50000000 0 0x800000>;
+			no-map;
+		};
+
 		apu_mem: memory@55000000 {
 			compatible = "shared-dma-pool";
 			reg = <0 0x55000000 0 0x1400000>;
@@ -1146,6 +1152,16 @@ &postmask0_out {
 	remote-endpoint = <&dither0_in>;
 };
 
+&scp_cluster {
+	status = "okay";
+};
+
+&scp_c0 {
+	firmware-name = "mediatek/mt8188/scp.img";
+	memory-region = <&scp_mem_reserved>;
+	status = "okay";
+};
+
 &sound {
 	pinctrl-names = "aud_etdm_hp_on", "aud_etdm_hp_off",
 			"aud_etdm_spk_on", "aud_etdm_spk_off",
-- 
2.51.0.rc0.215.g125493bb4a-goog


