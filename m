Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE84C77B7F
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 May 2023 17:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xmbKzKvCEVL3/Z+maa2frRisiuuXCYpfX7aC8pkvAmU=; b=LwhIMBWPe/HSTmolemZrD3Q4fY
	gks1s3zNFOuDBplsQUIJY2g+Fz2HDSf23NYZUAzSN310T1kZEGTF18SIdEwfbYHXnHcTg3ABwLu7k
	aVSxBB3IKCHLBYL6Sn6u1WVMgxrczc8EQvO53F6XoLiZEIzd3jzYEJJMPS0kg0A1V7zR9JAmZKEng
	ihGNewHdc6kLOSb4WSQwvq9O9NAt5VMwe1GXYhQDYYmvl06W8OYiiFxvG981okHoS+s+JMt4l25zQ
	wyKzljJ9UccuIL3kEl2/5RNUbQg8Unnkwh5X5c/LwMlYoSYY6hjPSWyeIvgvTRY7mKlPro7r20axJ
	VNYxbzew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxAHR-009adD-0p;
	Thu, 11 May 2023 17:40:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxAHN-009aZL-12
	for linux-mediatek@bombadil.infradead.org;
	Thu, 11 May 2023 17:40:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=xmbKzKvCEVL3/Z+maa2frRisiuuXCYpfX7aC8pkvAmU=; b=Z5k0ECKUKkKq+HrL+wm8EfhIWq
	wJOkeUuhqMOBBhwzGndvas+Vnu8lNkmFJxe1n3Kf6EpXWkLfIxR44jjztq8mGCv6j5oMmEeeCI5EF
	Jnp06IM2TpRIBSADRckPVK/B13fH3UBfgsaghBMnu/M2rLNnvqSjh3XAOKwGIS/ApXE4W/sSz0LQt
	oWKoltZ++pIxtsLD+LwmRp8PWqwujqsq65ezxGzGsQoApFb2Kjp2K/CuzRxXy+AlEtfgbb3nreQ/V
	GAdZjmdmBAvFTpafKHWPiSh8uWMfSOYUIWvLTv5LTP+A3oZEHrCxSy9y2PVNq6/A35Bm3aSawqado
	Z5qJ23eg==;
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px9BB-008InL-36
	for linux-mediatek@lists.infradead.org;
	Thu, 11 May 2023 16:30:12 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-50db7f0a1b4so5742307a12.3
        for <linux-mediatek@lists.infradead.org>; Thu, 11 May 2023 09:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1683822609; x=1686414609;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xmbKzKvCEVL3/Z+maa2frRisiuuXCYpfX7aC8pkvAmU=;
        b=q/dV1Kyz1sXGgpQBSBLe1o1ZHQPsO4KY0ZINVL7sF0dY5PWi8vtO4cTDNAXLPfoYqT
         9TWMsb30K2KbCfPm9vbXw8PxwLzrni+5W8MkG6TPmYQyj3dQxHiz3rq+u7Htp34zZjTO
         81APfL/5wjNQfqdsPXAFuh/lgTpuYKvt4vmFNYPPZNe2Eh9Qqd43X69hrrJaaI4rlczC
         V6Wmcmt+izh+xnOwPYeLQFjbX+D+RV64MzrntDtyBhQ5wF5EjCNdjy5DVmXZIw7Pn8pg
         EClDjEEEJxVAJptJLWkbq8w2gs7sIXQocpD/V1MXCO1OxSylOdkycHK1CuNanCgUxDAO
         HjRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683822609; x=1686414609;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xmbKzKvCEVL3/Z+maa2frRisiuuXCYpfX7aC8pkvAmU=;
        b=je+ZQpdq+ThKQn+Cj0gDpU4UnXani+5sfN47NvvZsxeZDbwtnDLYVjoWMvQJ/xXK+a
         aKPwDidstiVnm62RcZc+qPye6XWsHJOma9VqiENpGHOJXkZ9V3XnKUOvOZ25UyYC1xSk
         mFAWX4iwpeU6S/GPjVzpYKEwGxBVjC5gUzfZUFbBzVD2udwGdEuTroLxj4GP5XGl+8Ut
         +uoQTirdbi1ZdhCXR9hDH/qhA5/2A1kcoVL4hOBX+Ya9fZcruipQfbsVLGk+ufxsII8s
         vAFSEhWPjz55XT6+G499jBewn1m7PM2jkLzbHRssNl+/eAYqj4xC8lP2kGmFWA1HcnYQ
         rFLw==
X-Gm-Message-State: AC+VfDxdkBR8UA1FwB8dT9fPP4aN4Cox+jy4A2W+jy/40qzJYaCyaE4g
	oGm/Ke+To/B7hCScCW9aRb8XzA==
X-Google-Smtp-Source: ACHHUZ5uOZDaYJVg9Iy1QBY5C2GOopzZ8IjxRnoeyVNFQMDXFhaxHGCDIKTLpigjJCW/vtgDc5u0yw==
X-Received: by 2002:a17:906:dc89:b0:957:862a:9e6e with SMTP id cs9-20020a170906dc8900b00957862a9e6emr25298127ejc.73.1683822609676;
        Thu, 11 May 2023 09:30:09 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id v9-20020a170906338900b0094ee99eeb01sm4209935eja.150.2023.05.11.09.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 09:30:09 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 11 May 2023 18:29:30 +0200
Subject: [PATCH v7 10/11] arm64: dts: mediatek: add cpufreq support for
 mt8365-evk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v7-10-98cbdfac656e@baylibre.com>
References: <20230203-evk-board-support-v7-0-98cbdfac656e@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v7-0-98cbdfac656e@baylibre.com>
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
 h=from:subject:message-id; bh=Rq9Zwic5qmJaMrB9niIQqjmYy4HHPOH7tnCD4z3ywik=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkXRgFgHKPxikwHNlF53Z9K1ZVag508Iiu4ktC/Erl
 oNn1iLSJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZF0YBQAKCRArRkmdfjHURSf9D/
 9e8z/M0tLfGh8LKPOPWHUhEpwvDmDGhQ8Sv3EJVcvEbZlehDxc0bKZ5QPW486w7RiMvScyTOrwUwZ4
 /4zH+gUCHFtEo4RbchFHkmCyoVmqBCClMQdJrA+75i4oFwtCCVyCibd6fZ53AUKjXIUJduasVXLzyQ
 x+4Vu2+iEH7jdwPzRI/UOnCOHdBlRtt5G5BiFHX+VkDkbzvheEJltDe9kqIaGeaxWGoxuqKjaSwr26
 2ItedjGs3qapqQB4dv05/9CJZE3873C/K5QBOw9HOPjiKtGJJSD2PS9FLiDJcpMKAoRw7+FaEMseU9
 OMijDOrupSFfBLHv0VEtBGa4FsjuTYcVM3uBV73z1eyr6YoakLjtjYJye/mHE8N8ek9oxg0mH5DJxQ
 iLTZFAmtZBebXV6us4SmHFT2mzpC9JGhz6rcUM+5Cul8znxNVYut+FPVVHfyDCo02z++xMHGCkXx4d
 tI51+YoFVcXeo6tBEPc3Q1s/xXXudIHndZ1UwRlYs2MSM4fk+aeWOkGkzmUhUTXytJiuoU9YoKD5YP
 yhZ3yu8mKKnXOYV9nR3C9tlHNK2zsmXgNEHMbVcKXqQ6hrPhgosIAXYnWqaRndO3fRcGgD6GqDfiU4
 Mt2ma43fUmMRe8EQ+eqvpgq9TqQMSApPb7QUmqchapJpOMCevP9fvaYtC7tw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_173010_508461_740B4BCD 
X-CRM114-Status: UNSURE (   8.78  )
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
index cf81dace466a..b39b2bdfb82f 100644
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


