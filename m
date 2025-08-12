Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF4A2CA0EDA
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Aug 2025 12:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fkIrT982nu0l7atioMtbVH3OTcGWcWH7NZxVXh73dLg=; b=koTwVmj7vchY2m3Aml0mPy658U
	nSnPBuGth2iDiPbOy28wVJZYA0V77zmZS+9Kup1Or68LhT/IOjh1Lx8P03ZNqdYomqlt8rx71awWW
	oGYZCM/Gj0iEdqRDrppi4aBiJHDPcD/7/BNaMtqU8QG3TH2quegxQk+ABYgphxNgNIg51mEE1VoAV
	yszFUwl989KGIRPbd4sB8cLzfCD6t6YhJPdtTjJRwRmjJrVdP1nftpLbSiBUe5jg2C0jzQ0V1JLlv
	ftwyBO8A58koD1X6J0d4gI1NVxD5ZpUyo/0ai4zN6RQ4PapeEX59noAGPZZT+wXgl40dcaQas6plk
	yjO61n1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloFS-0000000AirR-2t04;
	Tue, 12 Aug 2025 12:37:02 +0000
Received: from mail-wm1-f46.google.com ([209.85.128.46])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulkLx-0000000AEmC-03c6
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Aug 2025 08:27:30 +0000
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-459d62184c9so30572175e9.1
        for <linux-mediatek@lists.infradead.org>; Tue, 12 Aug 2025 01:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754987247; x=1755592047; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fkIrT982nu0l7atioMtbVH3OTcGWcWH7NZxVXh73dLg=;
        b=qvp3q7A3u+bv8mkVyaPSr5zOYYXI1L+0bmzMESOsAb6gatoGoYoPxP+cbeiwHHB2bQ
         bk7SUDhJOoBNqXfTf7le0rqE7Yi3o33oL13xICw2lEH3ohlo7eFCXywNCpTFWRKN4sD3
         oNJjnyW9yyXw2JUX5w67n0yNN8v1OK2WhJWjgjTZSPZn+gx3VWF2bzncBQONbd079BwC
         4vRGJzWgqz8j9sYsWCV9wbN8OL7yZe4nFlggilAq2Uen4STaFGsIdf+IaA9y23Xxk+kR
         oRfFrIrJ8tAVX3C2Y/W3CsnhhArys+Nokiuod8oV83KNWmx1kyxYF6qFkSCIoEJZGJXV
         xNzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754987247; x=1755592047;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fkIrT982nu0l7atioMtbVH3OTcGWcWH7NZxVXh73dLg=;
        b=vDx3UaD12biDPDbhzNIYsqqT/1++XC/HZ5h/HewlgPNB295LYNz7/nWK42eTmzcT4S
         sqz+osWmXTL7uI84BhPVZCnHqBkqQEMQQHZb/3gREpSHpXFCargxnvpVpPufERC3tsix
         Kr+8SACb5m8QZmatU930HA+Osmn/A/5id/ugz3YQZerp78TcYkFbUYf1Ulo+/SYn0J2a
         Amm/kDlleO7A0Q94JpqOF0hHmmjShdJnC1Yi3cxQpIZLswbicNXfxHXI7iKqoeCRo8OE
         nm34Qfem9PUNAyByLblRPbIHmVqSkxgFiqS4xi+dRYzv9I9YwjPCkny8hYqmdHBSYT2P
         wGBA==
X-Forwarded-Encrypted: i=1; AJvYcCWIg48ZyZyPpZdKuHDS2tebwZQz5aQgl1y9iI31fbMuwML1N9bvW52xioh7CRuRzinjJ+vbi1hRjzj/0C90iQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzrdKTpxVsys+5hLScOlHv1OQsv3LBH5x5mU61yqvRA9fWv2uyW
	TII2Z1zQVv08W1gNF565X6Ctsuygq2ByucBvYx+uUWDGnKNTIvup1xk/7NGnSFkKXWM=
X-Gm-Gg: ASbGncvnbaWtx//JP7sfApeocZbq71mcAH9MK4nLtKJXde8sJ/32D5anmlbXfmbuXhw
	dt31dYZj6aXyiTWbuOZxlVFrwdrcz9hr/jJwxQS6xlda0LOYnQac4guPHdCDaRoYwWsl87r6cjS
	FRMu66/KFbNsGnqVmyxUgKIoscBFKezLkkoIeyNT8ZHFyOipyEmZqLxNrMlEr8i6LUayezHqTcS
	XW8+LHmkHA7vBnb+UacCCiLntfECVSnEhkXkSfvt0E5JrIfsCVollxFgYBxdBzBPoLkbJCCGE69
	EeOn3u3admj2qkQ1gXVjjczJD2n9EWpUyROeMOkUAxUZXlTXWiDbE/9a/hmQf4YgyQ5ZeYnJhdY
	XxaOlx+dd+1AsJIw=
X-Google-Smtp-Source: AGHT+IFwsqbb1rEd24wsckY1+KDaOixyeJmTQXPivaE2uZXRqBDhR+NeTCmIev7yq9yZGKWaYyUBJA==
X-Received: by 2002:a05:6000:310f:b0:3b7:7c3b:1073 with SMTP id ffacd0b85a97d-3b911014a84mr1715986f8f.52.1754987247118;
        Tue, 12 Aug 2025 01:27:27 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3b9386sm43549423f8f.18.2025.08.12.01.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 01:27:26 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 10:27:10 +0200
Subject: [PATCH v4 11/15] pinctrl: qcom: use generic pin function helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-pinctrl-gpio-pinfuncs-v4-11-bb3906c55e64@linaro.org>
References: <20250812-pinctrl-gpio-pinfuncs-v4-0-bb3906c55e64@linaro.org>
In-Reply-To: <20250812-pinctrl-gpio-pinfuncs-v4-0-bb3906c55e64@linaro.org>
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
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3269;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=chxUZAtCU37mhXCr4qzhIIkekcZb+5ZpnLwzXbUTM0A=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomvrZTBy24+EiQ0I9n9YAoAtc9GJc+mIbjLJ4c
 dVv83dQyiCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJr62QAKCRARpy6gFHHX
 cnS7D/42s+kq9cudWSpcHFuc0USVQTKWUm9m7Hr3iADyqxdii9U6wnmYgtkZeD/gBnn6eZBEVM8
 936OPO+6JoHACjR+Mrib1JBKvn+2EAhtvOxa2y8krmNl8HTrOwK24miaRuyQryIP2PDaUu9a/0v
 CCXeG9pcuY0VlCVndCfLAIvMBtoaf435NUcJbfRAUA1pqIBnAMgYNXixlJA8FtQj1cHIXYnoz12
 NRcDaJrJJQBNezG7RIxA0m4pc7nknsJMic4H6VJuhEEDURLIX11SZosiXspOqRzpyjWrifX9JKM
 Ir+XQCb4e9wFmhsQb0WJyDW4DxOxxVHaxO9vl7HLgXd9OcX+TbJm6dmibj6OQY3tPabfLIv5t5b
 91zGUu5y6bJ4d6/+OO0qmV6kzCOFxZBaFnx2uqKVn+ubzX7Vb20TGm0ArDrHQT8cG/W3iKRJf7D
 j/tojt9LnoVrmeBXBoFp75tWYfAtotKruu+kgi2o90mx5CL3RgXe+BHu8kcgoLmyby/jSygW3ei
 uD4SzRu96+iIJLTUjRzqRbv6WujNxkKHdcXIXO1VNvLuJ/rY5DhvLN9VFlnYGI0Pi1b4vN3ZwtG
 ZqR5bOzeHuNC/KkCJphUX/v8hHAqRSHlvHv1oCenO2VC8TSwJ/RtpstfLf8KL5mLGj+tYmim+md
 2lrEOwVF6POBJpQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_012729_089143_F4533E74 
X-CRM114-Status: GOOD (  16.31  )
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
 drivers/pinctrl/qcom/pinctrl-msm.c | 43 ++++++++++++--------------------------
 1 file changed, 13 insertions(+), 30 deletions(-)

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


