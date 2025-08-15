Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1E52CA0EE4
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Aug 2025 12:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EnhxaXfLWBAe5wxXyN7EB4a4qBStRGqZ5wQqNK1Gqy0=; b=A3nAlMo9+70WmZrnei52iuCeAP
	CCAH3mcqbrTQv22JRNMAh15GnDjjTcleRGAqA6OPBdJ5vU9IqG7WEhPUg9TGeT1KAMpzkYn2uG89E
	sWmq3EEZvtLoOn3TRNdgMrPz70NypaGUS/WQadyGUj9A1gd77t2cnSCUoFZAlu+AbUOP1W7EK0s0V
	JrJmgGp0z0JZ4+srb0bTXeQEEH+Prx+ByDJAI1b7R3m+euJxWBR8U/XlByn2VUGrZ5XrQAQtHa5Bf
	c+2evl+47WrlpkHg7kW+yVAoeRES39V0rSWQytzRzsTA42hd8m//uPba+1mpBkij8ADNRxbi9lVvQ
	ghUOCF4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umtUn-00000002Sdu-3Wa9;
	Fri, 15 Aug 2025 12:25:21 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umqRD-00000001zvU-46C7
	for linux-mediatek@lists.infradead.org;
	Fri, 15 Aug 2025 09:09:29 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-45a1b00797dso11215785e9.0
        for <linux-mediatek@lists.infradead.org>; Fri, 15 Aug 2025 02:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755248966; x=1755853766; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EnhxaXfLWBAe5wxXyN7EB4a4qBStRGqZ5wQqNK1Gqy0=;
        b=16GPat0XtEPwf1qPj9rxPBswj53jdy9HwasFXY/iaXHU24BxTjNSGO9VLDUaxRHno1
         Xy9zx05lmvGFC6XPdKsQHi943/9/ZZGfAr6henJ4bGRw9XaRjuQfM8iCvl+BdCgOjO9o
         ows0w0V8nYxVYFxc2WDzdEBpKIp1Qo+3yqtBiNHAin0WABLEMJsCsTf8jpw8TYWQDTzA
         cdVXk2WRXf6m4Y5Cu8kpjzGNx1wBbipPzS8NIC3YERyqbL7fmgsdBq7vs2PaBYMop0Dc
         +J26fdbiGC/rhTMoH1kotPIjyELQyyhXgpIaF+7iJjvuv37XuwAYyEE9XOvnAdKrhYeu
         ScxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755248966; x=1755853766;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EnhxaXfLWBAe5wxXyN7EB4a4qBStRGqZ5wQqNK1Gqy0=;
        b=gurPDi+JvPmvAmusNSER4Lip2/zJd7k/+mm6fcalQL+99dVd47HzZ9U34tD/AiK+ww
         xOrlPaOl6+tr7VvgARpbeavinNuvdVmAMrWQc5N2nkQU/XTQYyjaNsd41Ahvwo9tx1NV
         rW+4ftvSoo+ZTl2w7NuznBk4JDYDXk7vEP0VcUul9UIai3jLoq5J7lL/C6ostHSmHfmh
         vtkqNNSjvxIRgGXQlZP+RZfXEv8uPCjZMasyMpQ4c19Oq2TT2alMk6aPSwV2pseEQyPi
         92rOL3EuMc2NeLr2OpluGfMvXDXeJq9kYvIEgx434ztBMoDQ+SIsr5cNx7KDuoRGePMF
         KS5A==
X-Forwarded-Encrypted: i=1; AJvYcCVGyt8gDvM4+jBpG1BP+4o1AgVEN07LFEq8kVE9FhST/Dk9vURlycAEa2AHH4ENdCIVJX1tz8fyNRgyCAPLxQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzz6vuYhRlK8OcTslmCWiHFXUSoMsvfniEI4Xw6dtPMqQIgXR6Z
	eQ/55OiI2W/1NA2xzsJbhnxWdPkSjo9pn/zWQi7xcPT2ia1cxEtmhdmdUNn8ja8ONmo=
X-Gm-Gg: ASbGncvW4W5dqWZ4dJdM7lupDk9iO1JROfQ1t8gyXqrnCIXanJmh4MPFm+pA+ePm+R3
	Gvbv+/+mzh1GMMPHFqZhFN5iVnybOf00/i9Ezu5d3NuLXYJqre4s7N35G/ZHQbmCYyKKtWdvDGq
	8uoy4rsJzviP7yB1zE+3Np8VhUIcWUSHOmFgbynusqS3xIKXfgR2jAs0rNCprScQ2svG9LvoMbK
	8AGOP0/KudgwW2VNWZplCi9BzTa59yf9GSOc4Fxzr7p0WT9TeApx+ecyB9dNgQyhfZ8WaCEdNYZ
	PuWG68fRlOnkXGQKORHdyWPvRqa4r051ucFAtQ/Qr+DunS56oMyJW5TZfoThEF+30eMcc43akT6
	okRnPkFWVVek0LpRSEA==
X-Google-Smtp-Source: AGHT+IGrKalxRH2emMVFhJl/BSNAcO1PZ0/C3WQ9SuFSJDnEC4sffp01HAuXZ7aewRxm96m4CMiqDw==
X-Received: by 2002:a05:600c:45c8:b0:459:d667:1842 with SMTP id 5b1f17b1804b1-45a2180461fmr14807625e9.12.1755248966340;
        Fri, 15 Aug 2025 02:09:26 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a125:bd3e:6904:c9f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb676c9a67sm1205210f8f.35.2025.08.15.02.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 02:09:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 15 Aug 2025 11:09:08 +0200
Subject: [PATCH v5 06/15] pinctrl: imx: don't access the pin function radix
 tree directly
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-pinctrl-gpio-pinfuncs-v5-6-955de9fd91db@linaro.org>
References: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org>
In-Reply-To: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
 Andy Shevchenko <andy@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@redhat.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Tony Lindgren <tony@atomide.com>, 
 Haojian Zhuang <haojian.zhuang@linaro.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3088;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=FuPiesxsrAA0Rn9DkOactcvX9/BHBoNthgyhyXGEhH0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBonvk3rpCdQt6oBLFE3JhUek7wpG6X1F3lNHhRD
 1xBSnpghMSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJ75NwAKCRARpy6gFHHX
 crmbEADXui3pd5txQPs5OswgHt+SSwhRPgY5VgbCuLzFGwr/2pud+3IwLJwQv32sg5biLycFPIS
 tgqKV2jg1ezhF3AuxuIS6nCEBUC25Q4ocf7Z5bIG1PaVNj4kx8CSRz3xaBNqzSIggrfzcGSDKRV
 vkfdoThbQz1qBjCZIGDtAxHee64mmlelkG9kaF77q9JSRcOTZX6A/dACXHIDwKOuyzV2Uvm1CQZ
 ElBeUIRyu4lx9a7VMF/jP6aewEJE2p1wugJvkvSI91B+YhvnkPrqA/QqGzYrxlHqflJy98WygLu
 VlPXlUsXqP5POoIbK6S3GDkQCnr22v9vHBTmkOmJ1H1flKtn+0JuYy8JwUFHe3h22Dl0ChZU1LS
 95/YKWnICS0nBiAFltHYmCDB1oIqxpBTQ16DUA5SSIcy+8aUUVJbvJafN7qVlBjOxUFIujaietr
 CGqK52H8fm5AmTAOmZ3WaCns5oKr+XuL+/h5SpO+GfhHrfeOF3DNb/EI2Y1jpV8t7GGsBzWu6W/
 Uo2gOtnoUPeWQEEW8J0qn9wdPXQc6uep1CXJVXcOOOZYG5XCIWOs+2CQm9FXoxOvfTaYa85+cwq
 t19ujQgkGk9zToTdGziHLee8zGBTKfXUwoa2g5obhZ0lJVJ7RLtUYDhq9oSn1tU9lVBWfPBWx/H
 CIIk4Htmm9oBG1A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_020928_053119_C3136893 
X-CRM114-Status: GOOD (  18.10  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The radix tree containing pin function descriptors should not be
accessed directly by drivers. There are dedicated functions for it. I
suppose this driver does it so that the memory containing the function
description is not duplicated but we're going to address that shortly so
convert it to using generic pinctrl APIs.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/freescale/pinctrl-imx.c | 38 +++++++++++----------------------
 1 file changed, 13 insertions(+), 25 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 18de31328540458b7f7e8e2e539a39d61829deb9..d5d42c9ad5fe9dcf7c25ad393688e714b02db678 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -580,33 +580,34 @@ static int imx_pinctrl_parse_functions(struct device_node *np,
 				       u32 index)
 {
 	struct pinctrl_dev *pctl = ipctl->pctl;
-	struct function_desc *func;
+	struct pinfunction *func;
 	struct group_desc *grp;
 	const char **group_names;
+	int ret;
 	u32 i;
 
 	dev_dbg(pctl->dev, "parse function(%d): %pOFn\n", index, np);
 
-	func = pinmux_generic_get_function(pctl, index);
+	func = devm_kzalloc(ipctl->dev, sizeof(*func), GFP_KERNEL);
 	if (!func)
-		return -EINVAL;
+		return -ENOMEM;
 
 	/* Initialise function */
-	func->func.name = np->name;
-	func->func.ngroups = of_get_child_count(np);
-	if (func->func.ngroups == 0) {
+	func->name = np->name;
+	func->ngroups = of_get_child_count(np);
+	if (func->ngroups == 0) {
 		dev_info(ipctl->dev, "no groups defined in %pOF\n", np);
 		return -EINVAL;
 	}
 
-	group_names = devm_kcalloc(ipctl->dev, func->func.ngroups,
-				   sizeof(*func->func.groups), GFP_KERNEL);
+	group_names = devm_kcalloc(ipctl->dev, func->ngroups,
+				   sizeof(*func->groups), GFP_KERNEL);
 	if (!group_names)
 		return -ENOMEM;
 	i = 0;
 	for_each_child_of_node_scoped(np, child)
 		group_names[i++] = child->name;
-	func->func.groups = group_names;
+	func->groups = group_names;
 
 	i = 0;
 	for_each_child_of_node_scoped(np, child) {
@@ -614,10 +615,9 @@ static int imx_pinctrl_parse_functions(struct device_node *np,
 		if (!grp)
 			return -ENOMEM;
 
-		mutex_lock(&ipctl->mutex);
-		radix_tree_insert(&pctl->pin_group_tree,
-				  ipctl->group_index++, grp);
-		mutex_unlock(&ipctl->mutex);
+		ret = pinmux_generic_add_pinfunction(pctl, func, NULL);
+		if (ret < 0)
+			return ret;
 
 		imx_pinctrl_parse_groups(child, grp, ipctl, i++);
 	}
@@ -669,18 +669,6 @@ static int imx_pinctrl_probe_dt(struct platform_device *pdev,
 		}
 	}
 
-	for (i = 0; i < nfuncs; i++) {
-		struct function_desc *function;
-
-		function = devm_kzalloc(&pdev->dev, sizeof(*function),
-					GFP_KERNEL);
-		if (!function)
-			return -ENOMEM;
-
-		mutex_lock(&ipctl->mutex);
-		radix_tree_insert(&pctl->pin_function_tree, i, function);
-		mutex_unlock(&ipctl->mutex);
-	}
 	pctl->num_functions = nfuncs;
 
 	ipctl->group_index = 0;

-- 
2.48.1


