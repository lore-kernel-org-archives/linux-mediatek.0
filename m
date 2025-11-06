Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9531ACCFA05
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Nov 2025 19:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=muHNa/g+OI3fM/6qd0mUiU8Bz7ahY8JnmPu7Z+aL7Rc=; b=ZrXnHQakZA8XflqzAMy6SyDuH3
	QskvT2tKfv/LLD4dgQ4ywjpP9ImhBkxDewPEoGtKftYNglzIyueaQIowjt2ZAi11POpV1qyJNUo+K
	J9JDoEsqopxyznor6LhMc2jNZ4x4OUT4aYgOLqAkS5AHm4LOBgpWmeWBTs+i6CqBWVWKMxY2kDCiw
	4y3jeIWY5O4P/CLAQXAA+zqKP40vq5CXAqeXwJay3JMntrDyhQ+QtU7LdIasNa6EEBTDz5/n54+5p
	9H3suhhDzxIDozha0ANU77yI2uc/OckzmWdjQV01lXTeyMu4vlQaFI/8AQM8u3Jdk57ZagPzmxZOy
	0nEZNHGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH5Li-0000000G8d6-42dV;
	Thu, 06 Nov 2025 19:08:46 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH5LY-0000000G8M0-0d28
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Nov 2025 19:08:39 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-b6d3aaa150eso18325666b.2
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Nov 2025 11:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762456114; x=1763060914; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=muHNa/g+OI3fM/6qd0mUiU8Bz7ahY8JnmPu7Z+aL7Rc=;
        b=HAZWldPzJhe6DOE4rRO6lzWIg0pHDPMRz8Q5c2tZhwa/NvT3xNf1WZ8S29XommBAIY
         S9Rj1JWs6UKiEG5cdJK0lHZHc+kHyY3l2gcHyxZa7Tho2fnhqQ9ryMeZa0nOAxugq8fV
         1rWNiDUteYm9DUmYMjQC4D6TfhXS6sAfNAXeiCmF3N2wSbu5XBPSBVgDStPkNkEF1ZS1
         onNyDQLpKhTfxodtSRP4Xb2tnh6iDhimFIxad0XXeDMzlmguNvg0R5dcnrpuiEC2SipG
         /lVLbs3puUqszrhldiBbecqtmbCTdsJuplayGVR5o/Y4zXgb0TN3ZoVFPGN+Kx5bJzc/
         u3CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762456114; x=1763060914;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=muHNa/g+OI3fM/6qd0mUiU8Bz7ahY8JnmPu7Z+aL7Rc=;
        b=Di4LdpOsNvWn8daXleS20kYai3DH1jts1YHEQYeluhMHsy4WIB1xQagZBJ170/PPWz
         ylZmn6xmjk+gLPejH4ZmZGhIxGqlreA5hCkdrNj2JuCC1bdC6YrEwWkD3ScZ020yoWex
         SvIbR97RBPJcgj6SZi+ZtT4yUeZpwXKpQTVIA9/B1NZUVE1F27FONg8PMKRwxXbnRipH
         IPP5ls6P7KpgiecsDEaxLBRLVci/mZN8IZZzolSuhhDxS9ICfmFVfpYgWt74cTUv0TFN
         bWe8mR/z2+KpfOGsdTTqxhSS83azsJBxfrVQ43wqVShQfTI7QlMFOMVUyP0ghnj4NIHW
         U/jw==
X-Forwarded-Encrypted: i=1; AJvYcCVi7QQuwLnCWtcR7171+yiHaKtrSZY9dy3VCfcyenLnKLO855W7ZGyOLOcT8juhIZ/BAho4zFFLNn+8ocjlvQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy++GNl3wkfEST8toB4pfuDMd7JZ3ZnzOoapzlkBwuS8C0+t5iC
	C2xZfsJ2gWI+CINDf9B/Qy3IU+jMaq35z7NrmMHjeI6RjJZQWE8eM1QSBSTvx84hNtk=
X-Gm-Gg: ASbGncvmdCP5E8kVWyfdduCpwb7Z/v8MKsocDWwKV2Q0K5TNJwiCyWjY854UTYuEsNP
	sd6R8ikg3+Eor/l0nXX+y6hDAmFR1m7CT3MFtEoOTegCIT+G+TW/Knj+chacc/24nJ+1equ/fOB
	+AA86fFOKxmScPEgdddq/lCIed7N7Ubxmqo/93ASpCI1XylKLra8lZCUx4K1FPNuQAzt1a1FrF8
	2y6QOfuhqRL/K8qUuT4UDp2sSteWZ3r1QsTpnX9kfP32TTlcDnHOQd2RPDBmCmX/W6VWppeR4dR
	+jd4+PTPedEfh1qto7EkgP9/3eknXhGAYjCHSz5VYpbxoKb8CG8unmD9R9EXanYWCKZPpcj13Cd
	Hr9ySdramA8XKQSpqw2Xb7tcmBxcysls02IPgnjLs4HqDtH2D8BQ1Z3IPfIwVg8O2e3KPIDG8XO
	bfBzYt9t8j6+zpAJys
X-Google-Smtp-Source: AGHT+IE8YuEiK+Zfb/KePNrKoWBUDj6LEo4NOy/SwvD7jjkTn21cZNP/+8sVmFG2eqOfE4KV5Ochsw==
X-Received: by 2002:a17:907:9614:b0:b72:5375:12a1 with SMTP id a640c23a62f3a-b72c096b055mr19793166b.2.1762456113840;
        Thu, 06 Nov 2025 11:08:33 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bfa2510esm26739566b.72.2025.11.06.11.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 11:08:33 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 06 Nov 2025 20:07:18 +0100
Subject: [PATCH 11/13] soc: qcom: Simplify with of_machine_get_match_data()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-b4-of-match-matchine-data-v1-11-d780ea1780c2@linaro.org>
References: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
In-Reply-To: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-tegra@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1467;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=/yzRWwVIXgMTXi61dZTgBV9kK1Wc2gDXywBs5UcM6J8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpDPISQ5D0Sf9n1OrwLQgvE3GYjGuU2ct+njIDv
 jBQi2g+WJyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQzyEgAKCRDBN2bmhouD
 10suD/0Sda8mQq3Am4mP8/8RROtOsjW4BdT3uUIH6bBRs5zGPcOfOfa01RIWooqINqRTgM3kRP+
 GEfgH5VZhTAbhgaiMzxUTrbCR/3HjSKTBMCVQZzAVOqh6UN/p5eokZpmHXvtyEBU/MJqGzRlP+a
 6l+T2RkycuvLcNCNLtLgin+NLEeps3cQaf1kM3AuCl/cu0PqGRNRiKAIIb4HwqAI6M0YkSLYCy3
 E94u97SOssK1qs0tTOA2J5zNSWBhIp5u4CuuXLsPW4M2L5f4+jvVCexNmPlyoKvLjeKAmHwkaQa
 HP1E5+Ql7DAyDSKNKTkkRYybpAECIIOII6ib1t9BLrwGY2CyPBt8XiHkunFH1fm0aJx+pZaeNXR
 fpp1P67ni3gW5pIgRQh6ofX/QSEL/XnFNj7QD+I/DT8RtEHPUjuZBEsbk7YZYPDdvFfzWQGzSgN
 OOss/zZpWF8EUDYqKpYA+Cu0INYZbZzBGgSLOIBxGy3XBAQEQIQLgAOiysuOeojC7kyGsc/8TU+
 lzEcJiiv5X59CjJhJViLN2t1jZX4wryPr5HXwc0L7ZALSkxyV2kATV/hpoySJzLe10JBt8qHjU0
 eZx6SaG+f/clYYpS6dI1TegdwRpBvqsFfFFv9cmj5EJUuCUHDSqgehR6GEPctAsJowIa0LQBOns
 gTL09ogpzJ56Omg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_110836_294894_9137D35E 
X-CRM114-Status: GOOD (  11.88  )
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

Replace open-coded getting root OF node, matching against it and getting
the match data with new of_machine_get_match_data() helper.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on the first OF patch.
---
 drivers/soc/qcom/qcom_pd_mapper.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
index 1bcbe69688d2..07198d44b559 100644
--- a/drivers/soc/qcom/qcom_pd_mapper.c
+++ b/drivers/soc/qcom/qcom_pd_mapper.c
@@ -613,25 +613,12 @@ static void qcom_pdm_stop(struct qcom_pdm_data *data)
 static struct qcom_pdm_data *qcom_pdm_start(void)
 {
 	const struct qcom_pdm_domain_data * const *domains;
-	const struct of_device_id *match;
 	struct qcom_pdm_data *data;
-	struct device_node *root;
 	int ret, i;
 
-	root = of_find_node_by_path("/");
-	if (!root)
-		return ERR_PTR(-ENODEV);
-
-	match = of_match_node(qcom_pdm_domains, root);
-	of_node_put(root);
-	if (!match) {
-		pr_notice("PDM: no support for the platform, userspace daemon might be required.\n");
-		return ERR_PTR(-ENODEV);
-	}
-
-	domains = match->data;
+	domains = of_machine_get_match_data(qcom_pdm_domains);
 	if (!domains) {
-		pr_debug("PDM: no domains\n");
+		pr_notice("PDM: no support for the platform or no domains, userspace daemon might be required.\n");
 		return ERR_PTR(-ENODEV);
 	}
 

-- 
2.48.1


