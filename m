Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A0DCCFA13
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Nov 2025 19:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PBDauKoKfPD4CnZZWtWcSb53n04sjO6bQK2uW89yUaA=; b=OysHHTFhymAeCvQ5wbFrt2L7Zj
	7igbmjIKGc7+IImGNOvXovuy1oY/OGSpSqQnxHCFxZmMFC3XA0+/MZG+R3UJGjOUUUJ9N4nEGgueW
	bYFpZfIUItIAPT4h+N42w2eTdIw4O9SXrLBDiGqp5aqotMnTkanD/Z4av4d6nSNE4+PyaRL/bQ9mx
	LT8GJ1DWKrz1OJsxiXsBaNYRzFymkAYLnmwi3BozVU3qAFrA+0Xn1xw1bLxWVesfPYZW7XvNNXEfP
	D2FCnOeFHw3BkDxrs7d2OhjcTXaptJQqKaf8rkvEzYEdj3+oRi/prQd0ccoalIlJMNWnSUoaFL54O
	6Fr/cI6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH5LQ-0000000G8EF-3lZL;
	Thu, 06 Nov 2025 19:08:28 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH5LO-0000000G88O-0Aqd
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Nov 2025 19:08:27 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-64124874e6dso159229a12.3
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Nov 2025 11:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762456104; x=1763060904; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PBDauKoKfPD4CnZZWtWcSb53n04sjO6bQK2uW89yUaA=;
        b=aE6FwsnOrpT0RXen95pIkwWOWCspT7l5YzJaRWkSQULn0IhAZlmGwbqDEvv5e+hVyN
         lzlfNS4Fcm34hAqI9u6c0vPvkr3zDs06iSummhG8gLnS9LRzXIGtPKVKtN5+hDOaDMeh
         pSywDzJ51L3+65Gx88vfZ/xl5cqVHUAw3/arD63xmoZUIxcrD/JBJsC3tO/JBS6kDhVt
         PMf3wERP7Gzc6V0wl6LZh8kTFe3D+pdbHuCO2Sj5UWe74VoQj1OdlTMNNO4azIR5goIG
         NiCkooIxa76fegogopWWo4q5Jea106E4FTvElJL/JQSf+vdibmKw+kJL94gMah83ieat
         Oh9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762456104; x=1763060904;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PBDauKoKfPD4CnZZWtWcSb53n04sjO6bQK2uW89yUaA=;
        b=rFx+xUJgiGRS5zaM+S5e8pkObRxn/1ftt4xYSkus/Do24PKSkPqKm0e9IlpUYkP+o1
         ZY0wFAXDEqw0YpWBRtcFRfjefZgl9jw50CfVuzXIP5xUKjNacwt7vTtiSqlAXNE8Feih
         TsbPxS2hA/vBAZvYFbk04i4DYN2ODjYJ6nRrGqbhlHoF8geSwCLpg8eXaFMx4HvnO7UU
         3rHjZTh5tKGE+3/I2M9dUPvZaPHRbx9VG59Nmoeno0pwSBurvIsvfy6/UUp2zlw8pfJB
         i7LpQe8T8GvEc5l6ZaobvE4tKxWvnwzbr0GxzlAosoVUgqkWqlcW33ZmmDUkLBJdP36Y
         BENg==
X-Forwarded-Encrypted: i=1; AJvYcCXa7hC3bpLzh7/Fqd6fbS1oZ3ZViMVEJGHXZxsRRd+QF7donwxOJFpw9DYaQxIBIhZIGuTUONW7tNPKvIkFHg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxDQI48dH1qTY1gCMPFalhysx1386fD8pwdC38Ok5gmYIRUPlpM
	gxYj117CrEw5H5bSd0SlRSxY5n3O9CqgjnHyZ80bQKw6EVRdfCIYAM6PnTe9OjJr0BEjPymC2qW
	EkAfe
X-Gm-Gg: ASbGncu2jRXlL1JOk36Xz8HSc2Zbpsx0iiMrFCeMfGFptPtPGVxQA/uvI0omHJPN4VJ
	oMhK5hmED8x0us2MD/GuKKwzLIsJYw5tCpjW6Lhy6PkP6OjqjriZehfuI0SvcVFi3AwT6o/rxeB
	NxCpshsb8idR4fPOVLsrwqmawGeKvmzhJnQru6l6CxMm80FhiwUx1RK00qchZvdvXJMT7Ct2Ws0
	KxQOyVbEVtGfrtbWNVwwJIZyyxrpoNl0cdkkU446V4P+cSwgwEnG1pktbkX38OlLFdlvF/+GEPZ
	GkBdAMgDf12F6Ml6Py5OZyLVYreoxuIsGgxUh38oF1wiPdAgXRy4TFGJ8a252vQ7ROaZnbKl2+a
	2QSdRUp+SuN106b/ug2ynEeHi8NzOHRQqjwCKVmT1z2fr0VT5ptgnY8nJS4j9tpRKwEGguw/VLb
	x/HnIcbBasx49164lY7FFqsMUpcxs=
X-Google-Smtp-Source: AGHT+IG+hyJMTcEGj5iy777lLiyM71Dn2jw/AE3Pf8p7sH3RSp5ANpEt8SWqIzbEh+pnzhio1EyGSQ==
X-Received: by 2002:a17:907:6ea0:b0:b70:bb39:6f34 with SMTP id a640c23a62f3a-b72c085cb83mr16365766b.1.1762456104130;
        Thu, 06 Nov 2025 11:08:24 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bfa2510esm26739566b.72.2025.11.06.11.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 11:08:23 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 06 Nov 2025 20:07:14 +0100
Subject: [PATCH 07/13] firmware: qcom: scm: Simplify with
 of_machine_device_match()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-b4-of-match-matchine-data-v1-7-d780ea1780c2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1409;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=mMs+/htGtXYGsIA71gg7FmYxj0Ux55LRPjq4c7c7iAM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpDPIPnieH16c8d60rwZIiX6haowTgQtMDdTNgc
 Nt9m3EGIpqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQzyDwAKCRDBN2bmhouD
 15MND/9iEN4qP+PowaIfKdmRXiKRnNXohM8G8jgJAet6APPR2LlkfxfOSySgRZDLKCKTj6THV0b
 7S1uNUEDLipfAfqOyb2ES/O3p5hOdH+NaiNLbJNFfvKNEVsn1979VTOkhpl0yR8E/eLVMk6Rb4v
 3BjFCTTZSlOxYovGcx2SaB8PFO7Mb0UJEj9+6dJqeF+WyC1jWN89UziF9Aa9kShSX7nhipdwh3e
 ZvzDbpiCfcqIJ1oAWBlOLSkYTWAVyHAxnH07HvL+u3MaiynTgwewgye1+rFCFDZXCord4VxYgJi
 r/pAXsBB7P8GdbQ/0tzWWixP0N5XIW+p1fW23ZI7sp7IeSI/y8IOHHtzb3RfzN5z0cL89NB31Ld
 ZMzeoYy4VMqJsWvzxzO5H04KoDvuG8++JeHBB7TFbaBpwfMXXF/fhWawgvSGfvGlQVMHPkvwQzT
 pm/KFaHtPyRmeKO7mf/wyxYMOHlJWUFo5HgpPwzSKC/wTylBSMjmlVio4ZGFJeLMvA1hFqKE1md
 ncgtRPz3+HXM4i3pKZ1yCq3ECTajGjpZ/G0S8kFfY7AEKZlPseRRXMisGjDhnEibdRTOVnsmjBs
 vG5FsRPbRPg/s0BYkgUIUEREnc9tP+jJ3rCqmA4Bd4DOr284xpS3Rd+NkltT1CfIkfO1IRPgHtH
 WEqN666U3/TfL2Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_110826_123967_AC26E012 
X-CRM114-Status: GOOD (  11.34  )
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

Replace open-coded getting root OF node and matching against it with
new of_machine_device_match() helper.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on the first OF patch.
---
 drivers/firmware/qcom/qcom_scm.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index e777b7cb9b12..1a6f85e463e0 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2018,21 +2018,6 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ }
 };
 
-static bool qcom_scm_qseecom_machine_is_allowed(void)
-{
-	struct device_node *np;
-	bool match;
-
-	np = of_find_node_by_path("/");
-	if (!np)
-		return false;
-
-	match = of_match_node(qcom_scm_qseecom_allowlist, np);
-	of_node_put(np);
-
-	return match;
-}
-
 static void qcom_scm_qseecom_free(void *data)
 {
 	struct platform_device *qseecom_dev = data;
@@ -2064,7 +2049,7 @@ static int qcom_scm_qseecom_init(struct qcom_scm *scm)
 
 	dev_info(scm->dev, "qseecom: found qseecom with version 0x%x\n", version);
 
-	if (!qcom_scm_qseecom_machine_is_allowed()) {
+	if (!of_machine_device_match(qcom_scm_qseecom_allowlist)) {
 		dev_info(scm->dev, "qseecom: untested machine, skipping\n");
 		return 0;
 	}

-- 
2.48.1


