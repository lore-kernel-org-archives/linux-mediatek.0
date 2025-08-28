Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DADCBC8303F
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Aug 2025 19:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jAO2WeXDFkbtwkjKyd1xrqU98u0EGyjojmTyXcAuE7w=; b=sI0QvOXRzmzjdlloejC2LcxBvi
	ATLHpEX0vbK9tFFQJR81aFFLFiWSPfUO8zt2KydqgbznXvMyTPAZ2NQDfz/Rbw9I3dekw9tglw4qM
	ugm9eLJyt1+tVkcuPM2zr9ZnPwY8zbwZwwWcUn4AQqZI5A0pY9+UgexY98kizKth//l8rC81dfTkk
	MCXIq0i2F1q+DUNJC+2m2gSJheEfXZKVqB+Pl8J9Sqzo6vpX5WHszyS/yhQyL5fx0/FKZJRLofViv
	pzUng4RylD7oIBE2u44KIIfjL5b93ZTsDoJRFO4BcIgKuLMD6n46zvrt9h+EBqV2iGKxcFHwwQoj4
	Z+04wybw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urhvX-00000002vTp-0L2z;
	Thu, 28 Aug 2025 19:04:51 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urf3O-00000002BV6-3vv1
	for linux-mediatek@lists.infradead.org;
	Thu, 28 Aug 2025 16:00:48 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-45b65469a5bso10329445e9.0
        for <linux-mediatek@lists.infradead.org>; Thu, 28 Aug 2025 09:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756396845; x=1757001645; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jAO2WeXDFkbtwkjKyd1xrqU98u0EGyjojmTyXcAuE7w=;
        b=lnYckaq9SdvvUdizwmKYzLJ2XDDRosMyDfLD3Mg0SBizxqlk2oj2BLm8dLcSIUQth3
         bLaIqtW1Y1jQBi6t3M82RP48qhPURsJ/TgTESKAiIsR5gxmzjQ0zf+XNw8wXBfvM6Txv
         SBRxhtsnXcymJ8lc/zjxumwvb0/0T35bbHG11x7vcN/daLizOCPz6tv/8fd0j7PNLA3G
         nswEqfebqYfYJ2ESLrraLd98fh7FioPpVr8MB+Zj2rLoJ2sbgvU0rER8d5NXWLXQ4jND
         WDCBHqpijpv6SLAuG8zHj0uJ+CX5iRpKTk6jpKxqd/hoLJfZPV3S3ivZ6bP6AwS5S0v7
         uDiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756396845; x=1757001645;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jAO2WeXDFkbtwkjKyd1xrqU98u0EGyjojmTyXcAuE7w=;
        b=VmB2dnuHEt+iFKqCd0vqlKHDf4W70snI3/d8tLxZcZBStw397D3DB/OHOiVp6ZC44/
         pBAaDnNrUU9mIraYhbkFxQUylCuKQQimWMHKEdhe5b/qGVr1QDu63nNfgCTyZfRKwEW/
         +WufiYl0k6yJaSIaNHgJ/4RoCN3nAaQpdaGJR4LLxNpbKy9p5njAO/GTw19Z8g1VtpKb
         4WUm/PXaT9QW63kEcMvT9zN5yUy8VILlA1K9U1gef7INSL7FqVaHpneRub1/0efHJtD9
         0InNhPuK3qPXDvP6ft3/B4Bkh9aP5VHGBugQ4BZG/l+AreozwB9SOpS3AJ9g/k83uhzL
         vnFA==
X-Forwarded-Encrypted: i=1; AJvYcCXxLJc3+ChEDZ2sNQa5lvdibWVikEX/96dj3yhkMr71Uu6OOITsWi2iLIs0KdG3tu3TsiChLk0zBFkrJEby6Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwuU0eyIXiogy6xKpsl/viiMWeMMWP0HdmkTFDVvLJ6bdoEWKMV
	55jO66w9r2U20jgaDDOl75qXUIdS9XPl68W3bVBpoVGQFWPeUe2y8emSlJQenVQexYM=
X-Gm-Gg: ASbGncvNb25TZFwg4DbDDqPwqIOSUtEVCAkMAuUqQVEslIJdMgCE9jsLU7xutE+x1XV
	rzJGrqAM8loZIdSNHRH0g6u1DCsu8xh8Las8zQYVcX38kn503otPwSn6jWBhbXiit0ruMIo6VvO
	Bd2hwxlHQM7uZrHE84CTGTh9BwqeGGh4h0v4NeDYLrZ4co2JFvchgc0vxwsfc3H15z4AuXqet0I
	FeT3fg0RUbkUhCdKgp8KNq1nEZF56Lp6kFiyzY5FRqrxOtiT+oppJt/2Xf252w+m/RkqpmKucBE
	Htu6pQg80cA7bwTeox8Piy3wi7F0/3FXxcHboYHTB4v5ClyAE5hFgpRnjYlIpTfI0p9XamVVQiv
	kOQ+b79cKS2LuHyWT2w==
X-Google-Smtp-Source: AGHT+IH9eqAsu0mBkmZO1sLp4iQB82doTTOSGeYtxhUeFPIbPn5xY/WnY8KAWmQi9Jdt7MPymPYo1A==
X-Received: by 2002:a05:600c:4f05:b0:45b:5f5e:f1e4 with SMTP id 5b1f17b1804b1-45b648111dfmr100878215e9.27.1756396845191;
        Thu, 28 Aug 2025 09:00:45 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4933:4d7c:cf69:9502])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f0c6fe5sm80211675e9.5.2025.08.28.09.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 09:00:44 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 28 Aug 2025 18:00:23 +0200
Subject: [PATCH v6 15/15] pinctrl: qcom: make the pinmuxing strict
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-pinctrl-gpio-pinfuncs-v6-15-c9abb6bdb689@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1142;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=M6AAfE1ZYIqFZsBoDZ4O1bJllvK/6bMXFJ6Zryc+i/E=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBosH0PX+ObgCFGCgqoUrUjW902keUOxgLE8EUsB
 XcES2lA2qmJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLB9DwAKCRARpy6gFHHX
 ctL5D/9vpjY2JraOKI6xQLDzt9TXljIFuNDozQLvzOHyC9MgvKOWbsLqyOrunHPfrNqqKOFBK3T
 KwmfdS1uCAhkPVJFu9+QIjoLLd5p693JFSuHkObJvgCet04MNbRQLB5JHqL6iuH+bu9MyubXgwJ
 krZwBmRMnrDWPenruj6k4hAA2ihAQlUx9GOdKpiLfvYH8b6RAkHtDQPWjO21WqCLg4XFku4EESO
 5IruyaJkV3MTpbYIobh2C/a6mUW8SqezSSh1LG4Bd1XobET0b8+hWmght65TmOvonC+GLe5r2Wh
 pLFBhM0QRVLHeqtJgYx4uIqUU9M0k9AXIOR9238ttf3Ct3ldZ9ZfTONb3jNBXOp9939T7h4ZLpx
 SUaPlc2TzAFEbRUJNonPEbxaaa0+qbqTjF9ltT5tZC1Mlqr8pyzA1YH8BN9wyrbK4N6qH1ty3MJ
 6emE/yXMZFLsGd8hOSA+egnDYIO5BK1s91hpGWU/ZY/fadrMn6UtPYHf85JlfFzmhIlsS9nHjfY
 oLMcdYawGwDD/MdG1Dt9y2yWY+0T4iNxJoUqYKmpisWrARyHw/iR5VjqJFS50k88+CJMB1H36z0
 letY3JTa4NNIETPLbq0dvyWaZmnqCNmCzEgKPyWyC7sxmk66PTtyQoJj32nMAH62uZVZ+A6DZeE
 zit65McHjdrqSGA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_090047_011011_CD968800 
X-CRM114-Status: GOOD (  11.14  )
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

The strict flag in struct pinmux_ops disallows the usage of the same pin
as a GPIO and for another function. Without it, a rouge user-space
process with enough privileges (or even a buggy driver) can request a
used pin as GPIO and drive it, potentially confusing devices or even
crashing the system. Set it globally for all pinctrl-msm users.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index a5f69464827119dfe2a7781b558094b283fca215..1751d838ce95d6138c824b90098f74891dec7656 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -268,6 +268,7 @@ static const struct pinmux_ops msm_pinmux_ops = {
 	.function_is_gpio	= pinmux_generic_function_is_gpio,
 	.gpio_request_enable	= msm_pinmux_request_gpio,
 	.set_mux		= msm_pinmux_set_mux,
+	.strict			= true,
 };
 
 static int msm_config_reg(struct msm_pinctrl *pctrl,

-- 
2.48.1


