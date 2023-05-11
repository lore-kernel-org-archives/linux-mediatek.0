Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3781CC77B7F
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 May 2023 17:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rp1+YNqwHNM+RyCFbekDJNKtYIO0hDnKPiZFvATcjlg=; b=PIGzgeep3+v3AVdrbYUdghFcVK
	B7GerfoOWaOGqO3IgQpdIMtslc/48g3FiKrnx+S4Go3x1NClmb4aH5bSd4SaDf2oP60xTnS3nvGCU
	F/Mn1IMVugobydb8kyUPUzQZG8Lf49byAv3kqfB4EZDcwc77yBrNfnSLxfDLwvC7bajtnqlFo72V5
	JCayAS6ILKFzjsDL6rRB5+FNmedKVdvZXA2MBzEAByt2Pivk3ZTYOrtJgEvi8Hh0v49KGi1hjErew
	RWgfdSS82wzmWeBrrqJZh7LlAiYqz1n07NNA19WSAnhuyGIDuZSVwGRIWvwX6cYNrKDvxjbusV40N
	1vJytOOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxAGz-009aIJ-35;
	Thu, 11 May 2023 17:40:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxAGy-009aHX-03
	for linux-mediatek@bombadil.infradead.org;
	Thu, 11 May 2023 17:40:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=rp1+YNqwHNM+RyCFbekDJNKtYIO0hDnKPiZFvATcjlg=; b=HzR2BobnX0VwUauwc+BdUeJl+k
	xCny5wQtvmX4okKPWdLefuAu1HrVKmUwFN7lfVozj2YVOOS/7+M1XBnappzq31nGTvprPx5N7Pirf
	EB6i43Xk07EJgnpIqWt7aof8pP4FuEayTv66SZjtDASfywZ3HwrYucJy2TTK/upfvma0i664Ciaau
	DtCc3ZMTvbOIodPCLaT581pb7VmiWZd7aOYF/TPdPknJo7xWbfAO20d+eSNfhn9gY3p02s5UR8uAM
	Cj5DWY+klGPkOU1izE1QxOxhBWPTkzkmdLizpqKQqhezzDRuj5c+uV+grhBjelL/+WjVqEeyaBFye
	FMViZhLg==;
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px9B9-008InL-0F
	for linux-mediatek@lists.infradead.org;
	Thu, 11 May 2023 16:30:09 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-50db7f0a1b4so5742130a12.3
        for <linux-mediatek@lists.infradead.org>; Thu, 11 May 2023 09:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1683822605; x=1686414605;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rp1+YNqwHNM+RyCFbekDJNKtYIO0hDnKPiZFvATcjlg=;
        b=15PRW0yUiatX08i12bpIGK6YN/oc9Gpd78Dd+Pgy1W0XoyRAE61kH+qsTIxjO4hm4r
         jKkXjSVJFqm2oTPpOJVgLdACqrvfwJFYJnnFcVzSnq0TxlqRs2sSCxXcCMgJHUb8t1Uy
         fUpNvZJT4AsXd5OT1zVxFwANFxh0Oq/rA8CoGDZxYBAusYu5p4ReYYnJIkNAgXAdNi7p
         GTBl0926/h/RbyaQ9FJzoZhME9exF0y4dVhFnu+Xf5Tp/AuMBBEBvfzfZA99jI0hMq3N
         quSRdSYKyIyY7EVJ9z/Yac/0NigO2SYANsT/1LYzsXbstqPrL35k7WE0nfEXa4tg/jnQ
         cjGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683822605; x=1686414605;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rp1+YNqwHNM+RyCFbekDJNKtYIO0hDnKPiZFvATcjlg=;
        b=Vrr1T6FZWYfFQ2bHaujosRYA1y1aHs9xysl981wuKY3UIx7Y3WtrS9bHFrPuUhIdEl
         u7rXzpa9BFwccK/6QF2yPhkFyNBPiKLgTSwLoXvAdFslyuUL2v5PxzDW6ttSkck0JTZN
         ostcIMWempkvTYKoQO7M8daSir47K1oHQO/gWGzpfvgKcyCb/1/Wsx+RIhKb0JuUhnC3
         LMMlroKoEj2riGjA27sV6+U9ws+4L6LiwMDk/Jzmr/KJV2C+KLBbHCWBkPNChtrbPb8b
         iz8pfZi/bGOGI3LT6gC8L+PLUY+TTsvL6xsqaLe62ePMLclDLlpBXVuX3jug8wC02acJ
         4xsA==
X-Gm-Message-State: AC+VfDyqPi/OBslLLhRY71v2ZMPxk70wzDjTVGB7fU86XY9+5ZkXyNXE
	trmiBTDTKl9mI+XrfGOmWyzL7Q==
X-Google-Smtp-Source: ACHHUZ74Mg83gHGhdecC6kdyn/4GZxQb79hJ6u4Q8eJUkKz/Lr8NOxZ6nrWVqBv4U3b7ejy+QUAtAA==
X-Received: by 2002:a17:907:6e9e:b0:931:ad32:79ed with SMTP id sh30-20020a1709076e9e00b00931ad3279edmr24167339ejc.12.1683822605186;
        Thu, 11 May 2023 09:30:05 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id v9-20020a170906338900b0094ee99eeb01sm4209935eja.150.2023.05.11.09.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 09:30:04 -0700 (PDT)
From: amergnat@baylibre.com
Date: Thu, 11 May 2023 18:29:26 +0200
Subject: [PATCH v7 06/11] arm64: dts: mediatek: set vmc regulator as always
 on
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v7-6-98cbdfac656e@baylibre.com>
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
 Fabien Parent <fparent@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=905; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=cUc4DzZIiD+nDf33lWao3J8L/XHyfRxCzPKkh1j5Cr0=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkXRgEKlLyJAJVOnWxuOHYSHXwHxiJ3AQcPZcHsQ5r
 oMa68dSJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZF0YBAAKCRArRkmdfjHURR/WEA
 CmCC3nenF0nsD7hbh9tpUTtmwZ7/GFhcqCUV9wFwj1yxZKLLQliINuuKh5n5gKSXPxH7xzGCQLggOV
 bpmlzXTBSSDCi27xYwp5FuMrs4MsEA1GhUkWRgPDI8vpiRkyQYw//QHLHY3mWb12AbXwhbdxBdNRHA
 bOxn6E1DmhVPdmAt1wYX/QU3HInZ0pk2LF+eGY4FjzawTJ62IoY+9FjRm6pjJT4VhYy9OhDWFSnLA5
 KnwYLchxEL48rZHnzTNXhNWlSF9eto/W/U/9nWXvl3du/b91kphS1hJ3TUc2oR1Jauwy/8U1+oJEW2
 udhn7Fave84NhMw3qHRQJXcuD/6/EORK8xm618yF+q554tBnKyTbA/UWpPjmdwO6FmGaRHy+owwheh
 RI6qmdQ4ZaIZcXkAYfP5FH12qcQRePbRck74zI09tGzmiu4kxDj6mDLqG96cMrm7KsHAArSd3EAzJ7
 cXYNJbhT9rxpaHSveRK9lM4ry66rYe8WLHby9XeZhwRbRfwg3Br6Pm69PWjlsAVMoSwJKxJNXotOm8
 HYY5UwPlRJq5gyCjFT7pLdAG9bkRBmniYfpCUg6lsZJZ0eR3NOZv8T7w619nMTY9Xx9GCK1ijlSD/X
 BOYZZHRL7Ag3F3IEb8yVxltEboADLZhMEfnEK9UYuZRxOovyc1IsLw+i13dg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_173007_259995_2B0310B3 
X-CRM114-Status: UNSURE (   9.07  )
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

From: Fabien Parent <fparent@baylibre.com>

On downstream, we observe that the MSDC IP (used by the emmc, the micro
SD card and the WiFi) isn't working properly if the VMC regulator is
shutdown.

Make sure it is always on.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index 752007d0598e..5d69b39c8746 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -137,6 +137,11 @@ &mt6357_pmic {
 	#interrupt-cells = <2>;
 };
 
+/* Needed by MSDC IP */
+&mt6357_vmc_reg {
+	regulator-always-on;
+};
+
 &pio {
 	gpio_keys: gpio-keys-pins {
 		pins {

-- 
2.25.1


