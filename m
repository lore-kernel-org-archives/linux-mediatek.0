Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2747DC7EE2E
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 May 2023 09:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hhkj+jhN4dCHfkXrmOcFF9dhH+DUQWKn87IVVkP75hw=; b=EOv44RPVZfYzpsA5RRMJuc/YPv
	dpbXpZqaohpxQ5ycvfhuNH9jNTre8a2IX/4mYUXhPB/lOED8Sh6GR2EJWSEn/XXaLAIaUHU+qkUAx
	L0fEwjoltZOSYqCvdy+yoXha/UbrnuByibfqQmCzuVuKTcyYkWpzEeDFOB6B+KRHQKd+w75o3eCM4
	cOiVwDr3hvpxZcfYCBxbfFID5rwn9IySzYjGmzVtu3Pv5ioDYU+JFUPsGDvGtyWuM7CGS0qWlS+xd
	zBmBJgHNIbD1BWx3Z3WZgii3shq5ydNqO5Y97eUvCz0wpyjBxceWwINP4uIxtulI6x3Pu1D5LjrgA
	iE0KP0Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q27NZ-00G9mN-13;
	Thu, 25 May 2023 09:35:29 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q26Q8-00G0NO-2I
	for linux-mediatek@lists.infradead.org;
	Thu, 25 May 2023 08:34:05 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3093a7b71fbso1754671f8f.2
        for <linux-mediatek@lists.infradead.org>; Thu, 25 May 2023 01:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685003644; x=1687595644;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hhkj+jhN4dCHfkXrmOcFF9dhH+DUQWKn87IVVkP75hw=;
        b=ZehNlg4sDGva6upU8qgciq5kERZ1kPXqk6abmBRkH4/YOOB1F9xYfEupuOCwsiLquI
         J1QWYqqF+gp6Iuua9bvv/zKxGeks3OoHBz4JhCgD/lFan2QBKTrtQhmJdmaorUuATKcq
         ji262dckDTzlk3z6FLXtc/Nhrf7LrYiKIm1lf1/5YzLVkq66UG5FXoxvO+zh7pqAJhup
         3VwwgPmxGXvWffemlmT+3tOYtS0Ckl6ajMX2ncUizULjR/wfaAKJnDH3gFgeqdoIjnST
         zIDnvhF0d5CtCaEwcyhZ3ajYd7qXeIc7FikOkniL6snj7GRhkKRmb7fTtmyM1jIZMsJp
         Okng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685003644; x=1687595644;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hhkj+jhN4dCHfkXrmOcFF9dhH+DUQWKn87IVVkP75hw=;
        b=KwEtInpADrFTDMpJiEENPQb6fcQW7DS03Q0cKBMA9qdeO40pcIdOljyGBnjRN+670O
         UNuXvWCHEPY53NNdQzfrSF8QWP/n/Ot7NL6u22iTWhtx3ZejnSbFBac42XTWovUQYd0N
         hTStiTExSiqN0VoBVNcIwf8v5U+uSiTQALEH4tSIO3U+/NLft2HaSr8ACzxA2QCgpysq
         LkAtlgsSks1YR5MypkmX0t5UCSS+0bGei1gqnLZpWFUMKAYnzEtd7EGPhe6EAqvye+m/
         PIWbZWP0vH0JDknStxl5Ota2TLyFOW8UdsWse/m1mPvFmwjwBCUVUV/ga4O49HQHc5Uv
         0+2Q==
X-Gm-Message-State: AC+VfDy3BHJq/5cZYQk8ajQP9twHuAO/Kyy0H1twXDHOjnhQ9jpUpi4T
	GCDQFcNZi5egIkOxhXDDGYCL5Q==
X-Google-Smtp-Source: ACHHUZ4viw3eM0hV0Wb8n62o1kjN63f3hMtiJxSqJiv88U61/AOY4KsdYyKhzZ8jbOrJvDrNG2WB6w==
X-Received: by 2002:a5d:4d51:0:b0:309:51c5:3bf6 with SMTP id a17-20020a5d4d51000000b0030951c53bf6mr1654642wru.23.1685003644198;
        Thu, 25 May 2023 01:34:04 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id o3-20020a5d6843000000b003095a329e90sm945809wrw.97.2023.05.25.01.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 01:34:03 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 25 May 2023 10:33:18 +0200
Subject: [PATCH v8 09/10] arm64: dts: mediatek: add cpufreq support for
 mt8365-evk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v8-9-7019f3fd0adf@baylibre.com>
References: <20230203-evk-board-support-v8-0-7019f3fd0adf@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v8-0-7019f3fd0adf@baylibre.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1201; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=OvTRcKiKU/s8W5BwjdAVnfLSdt2CT87vdN092ipTOos=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkbx1vbvuy1WNJ/1D1BVf3YSRSbsSUx2VB9NcibDld
 ohDbjtiJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZG8dbwAKCRArRkmdfjHUReu8D/
 oCNtNJ7CLUns6EscpWxF4xi+neHGt2aLVh+oMRVEHPE2Lim6v+HhD7WcsFWuw+DIpg1/6aCwmWinQ5
 CAY4/5DkhyAHPcMadY1IqrCOlPC7Y7UVr/8nOtidkboNctUyC1ajVLOj9NWCGpjQl0/aH0OpkSgmhH
 30WCSKvl1jcKuCNbfAYUy6oaqNxoZTmy0rYzxVQnBxRXMoZ+eF6yUnrTKSDJcj9i0lg0cnRPfP70Ax
 F6YAeTfIli3DUu5GGPh7196zn8ZmxwttTWsBbG9MZz1xj7AXxEpiZk7avGMBrfGXNIv32/gmz8kcWX
 8KhDD8UbEcYGu0xrrVEuVhlO4bqjdwK88ZSLkE3ZNbx/CCQUd89R9+GLRqUFhdIkASLPuRH5gqqNkB
 wYb1X11AhUC4ByMwpT4AzZQYEo2wQA7mObrYk8cVtpa9Dc5o112GTEmIlxKozhadu9KtGNLawAwaax
 Uvo5l3axpnosk0kdZCqksFPGOyMPHVWX9xBr1XHvclM5AgPlBs9MJS0ZGoJtydAcw+TSLdVfnHzzE1
 gdpGF0Hojoa8NEIqRAuw2JtlC9uooBZOCWLW+MnRTTwNMgPg1ElALo9f1I9JNKSpjy6mXklPPWVvxB
 XA6kc03Ss286/8KxS2raxjqAzZCasRjLfCEj7v5SJmfj2vyDcpeqzmx5QYjg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_013404_748731_9B9D4427 
X-CRM114-Status: UNSURE (   9.36  )
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

In order to have cpufreq support, this patch adds proc-supply and
sram-supply for each CPU.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index 86524cbf4354..50cbaefa1a99 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -88,6 +88,26 @@ optee_reserved: optee@43200000 {
 	};
 };
 
+&cpu0 {
+	proc-supply = <&mt6357_vproc_reg>;
+	sram-supply = <&mt6357_vsram_proc_reg>;
+};
+
+&cpu1 {
+	proc-supply = <&mt6357_vproc_reg>;
+	sram-supply = <&mt6357_vsram_proc_reg>;
+};
+
+&cpu2 {
+	proc-supply = <&mt6357_vproc_reg>;
+	sram-supply = <&mt6357_vsram_proc_reg>;
+};
+
+&cpu3 {
+	proc-supply = <&mt6357_vproc_reg>;
+	sram-supply = <&mt6357_vsram_proc_reg>;
+};
+
 &ethernet {
 	pinctrl-0 = <&ethernet_pins>;
 	pinctrl-names = "default";

-- 
2.25.1


