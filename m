Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0668C636D6
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 18:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fxit4cASxxHL2nm1xYvDVxIdY14POx45+l2xWlfbrB8=; b=SV8Ix0fNdHUrV9
	tO7GFq/L0UVKfz8Hicx+vKRCm75WJZvgwIKtcxrTWfNQRemO6Be/skmEbfRFOPjjWlnJX5j8o3vM8
	swfJx3Jp7IOc0oTDMmwdYuDAoFcZzJnS5qdGwGsR02W2utBFvPh+9zSB9eYiN8KRJDaTRoxZcs68Q
	bH51m9c6XfYR5NPO5md7N+m513VN42eQK0KszeODS+VR3IQrbD27nEK1Sq3J3JaFLkQTPmFsA8dxR
	q1AcVuvAYz8Ssh/QDuUKqIhAf9GHWEJwTyuvy+Q3HV8oXRNctvb+3imrhcsQ31+7aIHgogGvUKeT0
	viEIzBXd2VYiX2ZHOGyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUu2j-00DU3I-Rd; Wed, 22 Feb 2023 18:40:41 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUu2D-00DTj2-Vq; Wed, 22 Feb 2023 18:40:13 +0000
Received: by mail-wr1-x432.google.com with SMTP id i11so2585633wrp.5;
        Wed, 22 Feb 2023 10:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fxit4cASxxHL2nm1xYvDVxIdY14POx45+l2xWlfbrB8=;
        b=llZRZ6E9KMqHcgEWIp1r+RA3hxjZpkIGflmlHx7+dk6rqpu9dvNStfDRr6gBs6YsnF
         ToFasIk+nTjzAmCpFOoD0r9fXxdCGnVxALwwc7iSLqjvdQG6aQP2/p2B+26ZMtOrcQUk
         P2G7j1XBx6TfFi6EvCdd0OyHQpMWk+mN/x3Mvx5/hgj6GuhXHZTwqZiiE8qnrAghcSEy
         ieVI7lcTzJxo8xc+sXiLQ2roVdoprar+8UuTjCxfnbkkNhp5mKH7KYfl0JXF2m4FlsGF
         y+9J/RrfsI7wtn4TDkq/OhtqP/pSNjxnueSZthEUOwnPVEWgqhn1du3skR2hjRtzHoRX
         GgLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fxit4cASxxHL2nm1xYvDVxIdY14POx45+l2xWlfbrB8=;
        b=4iLU/irVFqWpF0janpddLyAQ1KCPPlzFLSwfkreipDnnEsuu/pYiye9KhPQAGStini
         cBSOLOdDmGNPAyBXjgCXUBLomrwdO6mymiGbXOcSbf29Ce3dqiOPUQJXa6UZY7iz4F7/
         M+Zw3CBTlZfYJprk3YjO67bmQf1mILcm/RM1hDgsmOKs8DNCBT58YBF7Nzua2EgJmKRo
         hmd3fhvRS2USImU+vvdZikMvaqUXhkf0pqDjPiCXIUE4RIPERFkm+laIXaZTOvHEufZJ
         7rsa0anVXBUUrERd972J+TDwgywK05beX1jRFE9ymJfCdj/WJZKwAfPlv8vJ8Q5cupMm
         gd4g==
X-Gm-Message-State: AO0yUKWEBK26suOjg3GcKm1zQbulyc85bTdW+TqAqS4L2OabVeXY1Aid
	bCAB4wdMooRG5fpNiX3LyiY=
X-Google-Smtp-Source: AK7set9Up+ufj2qC9Aht1MB/gSjPPDEHD7mb82o3uQ/byVmKxtfMDrBUFf6MoAEKSkWeh/wg56t8hQ==
X-Received: by 2002:a05:6000:1cd:b0:2c5:8575:c37 with SMTP id t13-20020a05600001cd00b002c585750c37mr8183636wrx.66.1677091208546;
        Wed, 22 Feb 2023 10:40:08 -0800 (PST)
Received: from arinc9-PC.lan ([37.120.152.236])
        by smtp.gmail.com with ESMTPSA id l18-20020a5d4112000000b002c56179d39esm9372845wrp.44.2023.02.22.10.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 10:40:08 -0800 (PST)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [RFC PATCH 02/16] pinctrl: ralink: add mediatek compatible strings
Date: Wed, 22 Feb 2023 21:39:18 +0300
Message-Id: <20230222183932.33267-3-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230222183932.33267-1-arinc.unal@arinc9.com>
References: <20230222183932.33267-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_104010_098953_A2269E04 
X-CRM114-Status: GOOD (  12.77  )
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
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, Daniel Santos <daniel.santos@pobox.com>, Sean Wang <sean.wang@kernel.org>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, William Dean <williamsukatube@gmail.com>, linux-mediatek@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>, Matthias Brugger <matthias.bgg@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

Ralink was acquired by MediaTek in 2011. These SoCs have been rebranded as
MediaTek. Add new compatible strings to reflect that.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/pinctrl/ralink/pinctrl-mt7620.c | 1 +
 drivers/pinctrl/ralink/pinctrl-mt7621.c | 1 +
 drivers/pinctrl/ralink/pinctrl-rt2880.c | 1 +
 drivers/pinctrl/ralink/pinctrl-rt305x.c | 1 +
 drivers/pinctrl/ralink/pinctrl-rt3883.c | 1 +
 5 files changed, 5 insertions(+)

diff --git a/drivers/pinctrl/ralink/pinctrl-mt7620.c b/drivers/pinctrl/ralink/pinctrl-mt7620.c
index 06b86c726839..88b0c6a4ee18 100644
--- a/drivers/pinctrl/ralink/pinctrl-mt7620.c
+++ b/drivers/pinctrl/ralink/pinctrl-mt7620.c
@@ -371,6 +371,7 @@ static int mt7620_pinctrl_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id mt7620_pinctrl_match[] = {
+	{ .compatible = "mediatek,mt7620-pinctrl" },
 	{ .compatible = "ralink,mt7620-pinctrl" },
 	{ .compatible = "ralink,rt2880-pinmux" },
 	{}
diff --git a/drivers/pinctrl/ralink/pinctrl-mt7621.c b/drivers/pinctrl/ralink/pinctrl-mt7621.c
index fb5824922e78..2128a94f6d1b 100644
--- a/drivers/pinctrl/ralink/pinctrl-mt7621.c
+++ b/drivers/pinctrl/ralink/pinctrl-mt7621.c
@@ -96,6 +96,7 @@ static int mt7621_pinctrl_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id mt7621_pinctrl_match[] = {
+	{ .compatible = "mediatek,mt7621-pinctrl" },
 	{ .compatible = "ralink,mt7621-pinctrl" },
 	{ .compatible = "ralink,rt2880-pinmux" },
 	{}
diff --git a/drivers/pinctrl/ralink/pinctrl-rt2880.c b/drivers/pinctrl/ralink/pinctrl-rt2880.c
index d7a65fcc7755..e57b1c5d03dd 100644
--- a/drivers/pinctrl/ralink/pinctrl-rt2880.c
+++ b/drivers/pinctrl/ralink/pinctrl-rt2880.c
@@ -40,6 +40,7 @@ static int rt2880_pinctrl_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id rt2880_pinctrl_match[] = {
+	{ .compatible = "mediatek,rt2880-pinctrl" },
 	{ .compatible = "ralink,rt2880-pinctrl" },
 	{ .compatible = "ralink,rt2880-pinmux" },
 	{}
diff --git a/drivers/pinctrl/ralink/pinctrl-rt305x.c b/drivers/pinctrl/ralink/pinctrl-rt305x.c
index f6092c64383e..ca62997e716c 100644
--- a/drivers/pinctrl/ralink/pinctrl-rt305x.c
+++ b/drivers/pinctrl/ralink/pinctrl-rt305x.c
@@ -117,6 +117,7 @@ static int rt305x_pinctrl_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id rt305x_pinctrl_match[] = {
+	{ .compatible = "mediatek,rt305x-pinctrl" },
 	{ .compatible = "ralink,rt305x-pinctrl" },
 	{ .compatible = "ralink,rt2880-pinmux" },
 	{}
diff --git a/drivers/pinctrl/ralink/pinctrl-rt3883.c b/drivers/pinctrl/ralink/pinctrl-rt3883.c
index 5f766d76bafa..b687c70d3555 100644
--- a/drivers/pinctrl/ralink/pinctrl-rt3883.c
+++ b/drivers/pinctrl/ralink/pinctrl-rt3883.c
@@ -87,6 +87,7 @@ static int rt3883_pinctrl_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id rt3883_pinctrl_match[] = {
+	{ .compatible = "mediatek,rt3883-pinctrl" },
 	{ .compatible = "ralink,rt3883-pinctrl" },
 	{ .compatible = "ralink,rt2880-pinmux" },
 	{}
-- 
2.37.2


