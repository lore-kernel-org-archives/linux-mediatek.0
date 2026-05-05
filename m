Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90CC6CD342F
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2026 10:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w3KiKQ7J1YhGEy4V5AW2fr2heaf9v6dJ/SRBQ8mnN0A=; b=tTVIEZNeORXyQNfxbmgTXdom8U
	DFDb0TnO4cpF+4iaFIy1A/5VDPI4pG4/bqHS9TW5ICJTCL2qZlrvololMXvpMXwhUPxHyQembBLWq
	xw2m+izZCGxqobBvTSAms727LEb7KKhED40UJ3uyNaOKqXHVUtXam4rveWhGqgF+Sg1PqJgdWrSj2
	qactu3mRM54Iv3Ghju64c8/AOxnP+yQpWkkzQbnVKyDkfTDxCQ3xiM1bhH/xsZRY1iuOTRUXTn9p7
	dEp59HDEnIv00vaw2b6k703PYrmsXKqSur2XaLMrQfg7Wmap0hPI1votLwOsmkLmEIgovZSxNp0fc
	KpK6WcFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnX-0000000Fqx5-30Io;
	Tue, 05 May 2026 10:14:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnW-0000000FquW-310n
	for linux-mediatek@bombadil.infradead.org;
	Tue, 05 May 2026 10:14:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=w3KiKQ7J1YhGEy4V5AW2fr2heaf9v6dJ/SRBQ8mnN0A=; b=MBZWIRdDNycAeV2amCXuv9SBOh
	9D6wsRE/m5wP2v2P4LA/+ZiyU69/8lrL5AfmkGPVGfJUYkqFtaBnKC9QACwgJD4YPzdK9b2uq+3nh
	gzeD7Ub5UD0wQOFbEb2m8TSJH7T5guacMgLAfRYyOGReD8V3AX5No2T1knbscmjHfBRprD+BVO/fr
	qAIdr6FvRwGMW+0FxkpiefUQa8YsOnyRk66pWQjUZ3UfuqryCymXIoGS+Ho9zhAfJuYKeHTKoUYGY
	QRPS7HKJgZKbr/EkCZFRuRH7CqrOVy9hn+ss59cEOj8x4Fs4CY2FDn530D7bx2Ursa9U1SsQ28nwj
	lpHle0tg==;
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnU-0000000D9Xv-0J67
	for linux-mediatek@lists.infradead.org;
	Tue, 05 May 2026 10:14:37 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-83975e992e1so208069b3a.2
        for <linux-mediatek@lists.infradead.org>; Tue, 05 May 2026 03:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777976075; x=1778580875; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w3KiKQ7J1YhGEy4V5AW2fr2heaf9v6dJ/SRBQ8mnN0A=;
        b=nUMe+pJcwkm1qQF7//kl2KOwDDwubha0IwdLdKsBMcoywhAF4b52z5uWhd8jAZGpTN
         iKwOq9v6GA4JsWoyLXPrIPUF4UywHU+SaQBU+dncT4P7d8uT2qjzM24NVZFAZ9GKPjUk
         dmspDVWXR0m4xNgNezPcWBz5oAR6nJfou0l2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976075; x=1778580875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w3KiKQ7J1YhGEy4V5AW2fr2heaf9v6dJ/SRBQ8mnN0A=;
        b=sr+9M3khZlIHitpP+tdUQU7//myeLAV6H785+s693E0pYAk7WUXw9aoJWNbG7vipwJ
         ESEmwZq+OEYwxypoikC8jNHh6/pR0uBlo7HEd7cn40WybmQM4uZyX8O+wrYKaN/DXyOS
         QFBEjDxnhKrSzMMq9ifJv7ZMEGM89iZwqaVgao/3n10C13tSs5RnU8BxrM7CdbOiCLmG
         fNvX5/7LGYXQOfYdxDliCrHSewZxxg36mSK8yQoktQ02RGdJCxQE/mrjLvu/uslOhdjM
         qlZulpwlDS9GcWEl0eQowjz3zZJYlilpQm93upIJvJv3igkoj7W7Q9G1kVFtXcn+B690
         7GkA==
X-Forwarded-Encrypted: i=1; AFNElJ/EipXH6fD91Yd2KZwPF5Ak17gOQ1UIN5ooOcbpT42nGX/ywo8Ctn/imwNUR5V57aFjFytAJm3OPwvf9R8i1w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxH8WFkaWzCpyYSwaYUl+9b9IkCfK2HI1rr5FUl2CSs4vEhK5Wg
	3P7sfW3y6J1JSdREbN8v1AfmFRnHpVsRHNGbW2EZD52VtTrTbDkPk+nUHc5PG57T3A==
X-Gm-Gg: AeBDieuT1gHdhipdKGzrlbJcCaRB8cW0S7MEKbzeS+JucwOnJhAfoUNWdCNngVGJ+r1
	iQnUCzOdGJ7mysZlATWfzRMxwQ0472SilGMGf0UzGOy1QW9goeZwIvVNK4LLdvuOmIEkqLObqRw
	a2Jhgx5de416E/DROHOJCl0Tp4v2wpwfDgTtOCv1ncBBT5IjByGgkNYf81u4OBifATfTBDwuHeT
	GGyJC+aPGxsPG6gDDCuvBXIu/Z+kOAiIQLkI8cTa6IK4sKCAkgRQ0Tut930dOch9bl4lKQbtol8
	J2P+tcfB/ZCT7urIw+7xiXgPPpVTc9CPM++u1/x6L59MMYBxNPqAfLadHrbSmncb3cxhTprRNDy
	Er/7+Oeb6KfhvBn6QK5iib7L2OfXFyQMC16xqO6UnUzK+HfpGRRtVoVYpjj/ARBHQCkIxaARTTA
	bj1hYHgJamGnKXSCYF1rvd4sbRXlx70Da6C2WK4igWxMAVEtHy7TDEvpzfyf+B7cBe7YpWjfu2m
	fX8/VWyk96bwYb4qF4=
X-Received: by 2002:a05:6a00:1249:b0:82f:6b94:99d6 with SMTP id d2e1a72fcca58-83921dfaa0emr2465583b3a.5.1777976074570;
        Tue, 05 May 2026 03:14:34 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f1d4:2ef0:7d08:9dd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8462sm1666121b3a.38.2026.05.05.03.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:14:34 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/16] arm64: dts: mediatek: mt8192-asurada: Add CPU power supplies
Date: Tue,  5 May 2026 18:13:56 +0800
Message-ID: <20260505101408.1796563-7-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260505101408.1796563-1-wenst@chromium.org>
References: <20260505101408.1796563-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_111436_192421_ABFDA056 
X-CRM114-Status: GOOD (  10.20  )
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

The device tree for the MT8192 Asurada is missing power supplies for all
the CPU cores.

Add supplies to the CPU cores. The big and little clusters each have
their own regulator.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../boot/dts/mediatek/mt8192-asurada.dtsi     | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index d08ba6aec382..a6543bbcbfd0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -299,6 +299,38 @@ &afe {
 	memory-region = <&afe_dma_mem>;
 };
 
+&cpu0 {
+	cpu-supply = <&mt6315_6_vbuck3>;
+};
+
+&cpu1 {
+	cpu-supply = <&mt6315_6_vbuck3>;
+};
+
+&cpu2 {
+	cpu-supply = <&mt6315_6_vbuck3>;
+};
+
+&cpu3 {
+	cpu-supply = <&mt6315_6_vbuck3>;
+};
+
+&cpu4 {
+	cpu-supply = <&mt6315_6_vbuck1>;
+};
+
+&cpu5 {
+	cpu-supply = <&mt6315_6_vbuck1>;
+};
+
+&cpu6 {
+	cpu-supply = <&mt6315_6_vbuck1>;
+};
+
+&cpu7 {
+	cpu-supply = <&mt6315_6_vbuck1>;
+};
+
 &dpi0 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&dpi_pin_func>;
-- 
2.54.0.545.g6539524ca2-goog


