Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 436BACA0FF7
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Aug 2025 19:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kyDGhfJgrh4J6gn9SuBfsKVPoVuurUg4MDMRSiTssr0=; b=W3gz14ysc7QKlEi8aR/UADikYm
	cRWtS/nMebZmjaTGNQm2GEKPYU0Gp3OdLIcHe3UhtSrxtmx2rK6rqpvirLl8wZu+KDedo629z6Wy8
	GtjINkrjzJMWLdb04v8PT4ejjRPfCN6xUx6PWtnHoW7X8RscZqm8pqiEmvB3+xffqBsdKMrXfamYn
	7Tjd1saE7GjSBT+xyTAhllgeG7Ub8B7Ps8uiK2uwElT03f4od8MKNbYteJ8DDbWG9wfwIvBDn/PQd
	/La8PmnMmpyg+myzy3RYB/3lpVmLa8P5aEOakZykXVipg5+6hj5phlvgeY9EE13jZLLthunPsp7T8
	KCT9Yfrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urhuq-00000002v6c-1mZE;
	Thu, 28 Aug 2025 19:04:08 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urf3H-00000002BPy-0iJn
	for linux-mediatek@lists.infradead.org;
	Thu, 28 Aug 2025 16:00:40 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3cef6debedcso90492f8f.3
        for <linux-mediatek@lists.infradead.org>; Thu, 28 Aug 2025 09:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756396837; x=1757001637; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kyDGhfJgrh4J6gn9SuBfsKVPoVuurUg4MDMRSiTssr0=;
        b=PL9T3j2oDB6zfNfOQ/Yg/de1QkiDqbotcbJLbxbQINztaDa/g22E6EMmjJN1mbC1f5
         sZe5YpmIhOM1yaZTy3zOTz2XTMwM+c0Dv6nNw7z4PwUOHmBUzzf1ZmNFXbbkoox9vSNA
         DIwNZ8Nir7WPzgXfodou6fXcekXBi2MhpErmuQgLi/Gnq3F5ZsaO5dv9T8sM/AXD+Ptz
         m5kGVoGcVR+m9DJdot1rv5Bs5oMgbXbBhn6jicX/jgDYuY3qiIoD7c2co/MkpF65pQi8
         zSNz0McB2PTH2td3Tq4hzquu5VY1eDBpspE3CBCz9nBHLBvIMis9dWeg1AHzfGh8spBk
         LXyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756396837; x=1757001637;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kyDGhfJgrh4J6gn9SuBfsKVPoVuurUg4MDMRSiTssr0=;
        b=Ww0xGNchy+btNqiTsKvNFDxlrUWD/xapfMIZbzb6Q6Hg7VHN+wA+i6og7+UN7VAurb
         4F0E5CYrcY1ra8H0Y9sKMzMbCPZWUcqdFx+CgsO4aTW8TY/mGdM1zM5yQZ3pShwFYuXd
         XvKZoo/pyFSP4WzEhcYkXHiHJEWLD6SOeqZPkyCo0oryv/Dfx10JK6csfHPWOAF1aarh
         ZlPq7o+9nrWVBPP3KyLKiIpOHJ5cUkJXoQlxUeEupkYjsDc3ev6EkXSg2WL2tsw+XAxA
         FAbeiiB+b2yJs5Z4h3xlJ/9j2G8SPsebLBHjtulWRJsQvMRmj/oLBBeSHYAkj4M0g67E
         VbCA==
X-Forwarded-Encrypted: i=1; AJvYcCVDnsvGkEPM2jX+nUB+ZF535tcjbqzNHCt8D9WvfOhO0xjrms+Stnjr0Wh/noBcExC8G5DfqQE7adnpYOSgPg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxhu4KIx4vm5q0ecFFMFQQe5c4iXcOgjMStdHPu08ntCWcWDwjk
	KQ0SBBJAo8OpGTWDSUfjICvW+cK+Cf6sZud4hZMMZuQ08DDIhuKVSc9pP4pVrAsyG0U=
X-Gm-Gg: ASbGncvNZJV6zDiY5cFuX2qOvLED4vr+XK9GH0bH24urlhBFMLYaaX+tl8u80WIuQk2
	xdl1GcBUSrADrCXpOQkg704MUuAVBpTZF52zpvDio6yHK7c08e5FjR2Os7KgxqCYgOeZJShduKI
	Wl4sL7BKdB1YdamrNI0S5uP57tcR1GKKv2GG7Khi/FROXCmOMop53VPr6uKnfj0fh7JouHPJSzR
	UH/Uxd2RZHe0DCycZugWscjBb2XcNlf8sDPqVAGBXHgnziAf1k3I07ASq9aK+ukJ7JTSEDb3+js
	eNvj0zMjB+I3Hh+P71O05GMKnpDYElFvjfl/TMRajMf7huVaFr1B3kVSfiQmMlwrDvCVt1QCLhj
	GD6VWBrTt5gHI3eJXJw==
X-Google-Smtp-Source: AGHT+IGRb2IFrJR7/1J+rjeNU8GkVEAEf5qNguD6R0jJVoV6aqw9N3uve9t0ub2p/g9PXQeEWnV+2Q==
X-Received: by 2002:a05:6000:2403:b0:3c9:1433:f8c0 with SMTP id ffacd0b85a97d-3c91433ff3fmr12100077f8f.7.1756396837431;
        Thu, 28 Aug 2025 09:00:37 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4933:4d7c:cf69:9502])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f0c6fe5sm80211675e9.5.2025.08.28.09.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 09:00:37 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 28 Aug 2025 18:00:19 +0200
Subject: [PATCH v6 11/15] pinctrl: qcom: use generic pin function helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-pinctrl-gpio-pinfuncs-v6-11-c9abb6bdb689@linaro.org>
References: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
In-Reply-To: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
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
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Mark Brown <broonie@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3751;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=qmbs27ufzmC16v+sdcPEY4dDQY3iNSX16sXKxiePlDE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBosH0PnC9WMdqFML1hS6pX4Ax7d8FKU/1NETcnI
 wejv8+DrUOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLB9DwAKCRARpy6gFHHX
 cgUlD/9h+MbAVo/wpsAgGFq0gzUJAW9nwwGnh2UUoj3Kqv10EutSXw2RS8/j2v+ITd4A7ABEv04
 3e7T9KxIfgTGIQNStI/av47LGaFQoanqW1bbicRWetgfw4ov9Kg8DBWxmiM38ucKX0TH0B1V0DZ
 1ickY8HG8BK6FO+qam8qf//7NJ03enn6xAFDsdu8gsOOiGGf/TaB+M09CpUjTROpxx4kOdwoyRd
 7KEgzKdp5nr/aTr/5ymPx+D4YvdV3g8g7zKgpOv7sNzlh6q4eHpIyRXfSLTNFfMEK27gs3RfQiu
 nFjbrmBC/Cm0Dx3PtrZoiuGFLIynOHFozfI8W1nxeIcTH2drbiUpQM+PMyzn6QwdQLyuYsWIIp4
 P97TifYj25rmdWejAC7ce0M/MUr6ym5k13HkeDFMueER//pdQh2BB6H45PG9So0YrhSESCqN3TL
 0rgOdRqufzPjxELShQhA8C5ca/bWsVuYWVY2lPBJxS7oqgJQ7yO0V9lityx55QhQweeXFlkDOCa
 odj5YLA2Ua9lK5nhrpJl4Pm++PVW/VroLuBJuEtg8pEYp5QOywE1m2GdXhZxMn4fOMb71Iy8Ye/
 YCmOhCxdeaxT35vIe0apm4cT9JEQFY8JhotGnkxa3p+cTEYqk4BreR/mYrEtQrZJAOXNvDQXIeL
 AWgGjt+UZOIungg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_090039_220032_AB72597B 
X-CRM114-Status: GOOD (  16.71  )
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

With the pinmux core no longer duplicating memory used to store the
struct pinfunction objects in .rodata, we can now use the existing
infrastructure for storing and looking up pin functions in qualcomm
drivers. Remove hand-crafted callbacks.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/qcom/Kconfig       |  1 +
 drivers/pinctrl/qcom/pinctrl-msm.c | 43 ++++++++++++--------------------------
 2 files changed, 14 insertions(+), 30 deletions(-)

diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
index dd9bbe8f3e11c37418d2143b33c21eeea10d456b..f7594de4b1e9b95458c2c817e1158026a8006f64 100644
--- a/drivers/pinctrl/qcom/Kconfig
+++ b/drivers/pinctrl/qcom/Kconfig
@@ -8,6 +8,7 @@ config PINCTRL_MSM
 	depends on OF
 	select QCOM_SCM
 	select PINMUX
+	select GENERIC_PINMUX_FUNCTIONS
 	select PINCONF
 	select GENERIC_PINCONF
 	select GPIOLIB_IRQCHIP
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 83eb075b6bfa1728137e47741740fda78046514b..96e40c2342bdedb8857629e503897f171a80e579 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -31,6 +31,7 @@
 #include "../core.h"
 #include "../pinconf.h"
 #include "../pinctrl-utils.h"
+#include "../pinmux.h"
 
 #include "pinctrl-msm.h"
 
@@ -150,33 +151,6 @@ static int msm_pinmux_request(struct pinctrl_dev *pctldev, unsigned offset)
 	return gpiochip_line_is_valid(chip, offset) ? 0 : -EINVAL;
 }
 
-static int msm_get_functions_count(struct pinctrl_dev *pctldev)
-{
-	struct msm_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
-
-	return pctrl->soc->nfunctions;
-}
-
-static const char *msm_get_function_name(struct pinctrl_dev *pctldev,
-					 unsigned function)
-{
-	struct msm_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
-
-	return pctrl->soc->functions[function].name;
-}
-
-static int msm_get_function_groups(struct pinctrl_dev *pctldev,
-				   unsigned function,
-				   const char * const **groups,
-				   unsigned * const num_groups)
-{
-	struct msm_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
-
-	*groups = pctrl->soc->functions[function].groups;
-	*num_groups = pctrl->soc->functions[function].ngroups;
-	return 0;
-}
-
 static int msm_pinmux_set_mux(struct pinctrl_dev *pctldev,
 			      unsigned function,
 			      unsigned group)
@@ -288,9 +262,9 @@ static int msm_pinmux_request_gpio(struct pinctrl_dev *pctldev,
 
 static const struct pinmux_ops msm_pinmux_ops = {
 	.request		= msm_pinmux_request,
-	.get_functions_count	= msm_get_functions_count,
-	.get_function_name	= msm_get_function_name,
-	.get_function_groups	= msm_get_function_groups,
+	.get_functions_count	= pinmux_generic_get_function_count,
+	.get_function_name	= pinmux_generic_get_function_name,
+	.get_function_groups	= pinmux_generic_get_function_groups,
 	.gpio_request_enable	= msm_pinmux_request_gpio,
 	.set_mux		= msm_pinmux_set_mux,
 };
@@ -1552,6 +1526,7 @@ EXPORT_SYMBOL(msm_pinctrl_dev_pm_ops);
 int msm_pinctrl_probe(struct platform_device *pdev,
 		      const struct msm_pinctrl_soc_data *soc_data)
 {
+	const struct pinfunction *func;
 	struct msm_pinctrl *pctrl;
 	struct resource *res;
 	int ret;
@@ -1606,6 +1581,14 @@ int msm_pinctrl_probe(struct platform_device *pdev,
 		return PTR_ERR(pctrl->pctrl);
 	}
 
+	for (i = 0; i < soc_data->nfunctions; i++) {
+		func = &soc_data->functions[i];
+
+		ret = pinmux_generic_add_pinfunction(pctrl->pctrl, func, NULL);
+		if (ret < 0)
+			return ret;
+	}
+
 	ret = msm_gpio_init(pctrl);
 	if (ret)
 		return ret;

-- 
2.48.1


