Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E604CD8C9D
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jun 2026 13:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iYAENU3bKN6fHyKKtSYTgWQl9v5OPWMHQrRWdi1Q+xg=; b=N/sQUyXhO4QD60mAtWhksfLKDZ
	huRt+7qwIlm8Ull8RSlQSsDF5ejspoBytQ+PUXLhtmf4O0AHcgWHcqP4cvAH7/x0vIsSxj2ejdj4y
	pqL6A8HCyxL5LqlCzHIfF2yebwZQaXYTER0Xabow+OS0L4AwN27czpLJymyEj0oCwEPUuYbn/kVRN
	rusT6fQbc9RmQz3Qj2ajhQppqf4YGhRsuD/sFuRT+xgvNp9opiSPs0W4rtY26sDcxWTh2TgOMcD4m
	VzUY9TiLHaeMI8kSYbEBBknQgKEI0p1Pn2amJNkr4RfUwJy73Jm7bXeSyeUkADCNNmWNlA5dipm1H
	xL7r3/BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWaRf-00000003fWm-0kUd;
	Mon, 08 Jun 2026 13:55:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWaRc-00000003fRH-0WTP
	for linux-mediatek@lists.infradead.org;
	Mon, 08 Jun 2026 13:55:14 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658DRBYI3763872
	for <linux-mediatek@lists.infradead.org>; Mon, 8 Jun 2026 13:55:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iYAENU3bKN6fHyKKtSYTgWQl9v5OPWMHQrRWdi1Q+xg=; b=ftPFlvSwQeIcmroA
	XDd5yCj6CRUGTJPJc43DA7o1mB4Zt8RDsQD+8Y0JoueSjgyQCVwp/bTWe9cfhS0U
	UFGfSW2Qsac9po1OC8IxVaJ/Ptan1zu8thyCM2ZI6wwg9XlCB9jXg1TDsF+RCwWO
	HpnYLXsyv4w2wI3VOM84pAeojBnYwGDYnadIf8i+GFgTMzEBDhzhwKstIIuNfAUc
	i95hLNmdb4f87rZKTYgluUOT0y48Wy7Oeh0/9XhXx8qrnkZLF32sjLE4BTUbfSsF
	KX8+eSDG4EyPUXYScpeSNFxPPzRc2gX0ddG+y4ofLlgg6Q3gGkK5Ulak96FyMUPO
	NEmznw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enun8h0jb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Mon, 08 Jun 2026 13:55:11 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ccf9080db4so68286726d6.2
        for <linux-mediatek@lists.infradead.org>; Mon, 08 Jun 2026 06:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780926910; x=1781531710; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iYAENU3bKN6fHyKKtSYTgWQl9v5OPWMHQrRWdi1Q+xg=;
        b=KJWMWeRB8eXB6/UrJVXHn7ne1OlLxuOL1Aio21wmUmhZJR1LG/vqJdvQbFSOPMmzlq
         Dcn44mYi5WCfwG+/mq5r1egKwMakmM4LAz0YzE6B0lBiYVs+QigrF+btLuWUMIfEMvV3
         bOVCk1s10TJjSBOTEcGHzhSQ06z/oNOwSen0ISsdKOblAcqDZu/LI7+RaKG/mt2biW+4
         eEulTyTf+yWRUdumhtScJn5Y49CgR49J5QbBpf7QJuGpz5hF2YEaVnXmtJ3Mo9q20ZIH
         sXD9UB3FxO9rg87SzGCR0pGwHszUD/+RDHrq2uGsZpGUs5gI/MSEEK0tWPwK5FSCLgJk
         wBTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780926910; x=1781531710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iYAENU3bKN6fHyKKtSYTgWQl9v5OPWMHQrRWdi1Q+xg=;
        b=CEW7WEywNAYuEELKwUIbXi0BZnhSJBXpbszsR7MRI6MC0vDei/o+/ltEw3DE7MKOG8
         5588O/gIoXQQNzgJ/580UxcnTJ3qdFQqk3UnkR0QL7t+X24j6canpKvXhkm/qb8Tn5fV
         EHPgjhQqs6zKQCDxGmJrRriIboiQ79ikPrYMSOL/SUMmRIEhaGAmOifNLCbPtHTYlO0v
         h0qVRenrjiSEhItW9+ZCIHxTdDzlTBgqrOY4Qt2+ptpbmzBXIhzANOTjcwfWmPw+mURL
         pi3X8VmKuqliqhMpAGa/9UcNqcAu6pvqJZzXFLl04EnNKk1MkGtf7ylhunpWQnbJ4d5A
         XBiw==
X-Forwarded-Encrypted: i=1; AFNElJ/CFPgwJQUNDS6vBzaeQu5nekD5WD3jBT58wgZ5qPplLTcGSSg5zhP0lq4wTp3emFrEFWgs3pVUtbpKsjRcTg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwEcFvkcHh8nj6g8dKZs7b/FLqjxUfR8UdLDGzPGspv5XjFaYKY
	LcOWPJg551kAJnuagxPZNu5mxVwcS2ZsC56nFFoUGzVOF/dgQIZC6gufVSLc+YMm7/oglEHU7xF
	mrcsf5lrKm2P68bz9fU+vWJE4X1L63wZWNBdBYHQic4femnj4aTBEVAEa5v36ddyhKwHB3wR2J/
	I=
X-Gm-Gg: Acq92OGIp/dUyzMEHVMXGyxz84TB22X5vwp7922DbFlOIeqqly2lKfXjykl7RkPm+PW
	p6t1Ivt8Gtuj78sTCM+7jUakQV74hovH+HGS58rg1eDIgcNDsU0WGQPVj71yBAqaMuJb0WPf2Kb
	5DP0ryeEUr612yLbI8X7NzSsaiQZPORgLvfquXdf9PrTqSOxf4TzcTQyTNhA5xS6H/yg3mMSMp2
	OWNVpiAkgDQXoDugcii08S0mS/8RvF4XNOmph8Q76PwMS7cGv5VHGZ5Ui5IOktUDP0ZUt7+tF9G
	4FLNpLO2rIKdXdPH06uLznQxKxsD2Sq6qj8AM9Ko94XV51bEZQTbMSF/GTRQkue6BGyHUVoI2a+
	BKzA1TiBjkX3HaBT/USIRqv8zRkDKAcZ9qXeQ/PPF90JhZDJAjOOdpDU=
X-Received: by 2002:a05:622a:4c0a:b0:517:6fb4:5796 with SMTP id d75a77b69052e-51795bcbd6dmr233491951cf.30.1780926910303;
        Mon, 08 Jun 2026 06:55:10 -0700 (PDT)
X-Received: by 2002:a05:622a:4c0a:b0:517:6fb4:5796 with SMTP id d75a77b69052e-51795bcbd6dmr233491291cf.30.1780926909757;
        Mon, 08 Jun 2026 06:55:09 -0700 (PDT)
Received: from [127.0.1.1] ([213.55.209.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc39def5sm385972925e9.5.2026.06.08.06.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:55:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 15:54:17 +0200
Subject: [PATCH v2 4/4] ARM: dts: ti: Add specific compatibles for SCM conf
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-n-dt-bindings-simple-bus-syscon-v2-4-0203e6c249dc@oss.qualcomm.com>
References: <20260608-n-dt-bindings-simple-bus-syscon-v2-0-0203e6c249dc@oss.qualcomm.com>
In-Reply-To: <20260608-n-dt-bindings-simple-bus-syscon-v2-0-0203e6c249dc@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Jacky Huang <ychuang3@nuvoton.com>,
        Shan-Chun Hung <schung@nuvoton.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Andreas Kemnade <andreas@kemnade.info>,
        Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
        Tony Lindgren <tony@atomide.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-omap@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6102;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=1TEC0glULkibN4KdgZrT/r3Q3YTk2QahVA/FaQ9NL6E=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqJsmr1TFF2JsnFS66lCU+8F+0p5qJHQWm/zbvh
 UkJEZ5dWPuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaibJqwAKCRDBN2bmhouD
 1w57D/9Om0+Ap30Qz61CKEnvch9Did/wqToFGxnJQ2JdOkEcVRs+TGjLUVktj/NMHJduyiKdC3H
 lvRaXHDPMR8luF/OqbQTvidsT53QwUYNkShjaM+gS55P4+JqH0KxtUBolOmJkWqwSNRgHdAY+Kx
 skRFzWFXkRZyyxp38XHyZA1dgD4TmF3I133R5s53OEpnCLOumMbl9i6/w6MC5YUj0LjMXDAFja8
 Z4wE6RVLg1vXq0aLT9VtDKIHjVc7DqzNSTxGKCJnYTyL3wxT5RrS8072zPpikKv597dy6XSf5r7
 vhWE8W31x92IsGmgSi/o8RyoLO1xxoigfrASyHElWB2FagqUhvjZvBGqfPuk6+W+3ReFqXIGh4D
 FzO4zxE7w9RXGsGUgLwZr5/0sPPogfOny6q/8tOFN2F5cex7JgkZIUFUyS+81GzbWoAez745GlC
 GBE+vXK/J4EH/gkdp4MvIepziyvEU1lWuxX9tqVl1e2vFzoV6BdJc/P1ZTFzlD0BgO481VMEs8I
 5YTZEc9Z3Lk3ifSt7azZoc7d9HMxorm+6PrdYBLX5YWEh2vAG1KgvI3e5HkcreiBj4pZgI7K2HI
 ilHvb9PY9Vgic3JVKyzxkr7EHYTu5J1B5Ey2SVC6mbf4FLetntazJNiFS8U1KUWGKCKo1/l+Mqq
 As+xdcBo5ObiP2g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEzMiBTYWx0ZWRfX8Y96snwwTtXT
 4OiSnD/ozEB2xkyyOsuk/0n2cLRMxkpZ7XGju9a0qoKusN10hkjEDVLr8g8BfuAk8wyMu16Utdw
 XGk25e4WJbnFsiwWSe4jyS3wGLU1tjofK7gu17uo87mZFwc89vPlvbGRDs4tUVywjqBbHc23tT8
 P5i+xsg2OldRTdp2vWdo8euVXvxd75yHYGCoEKDOB0jGuo2QIiGkK8hhVJ0xD5Cum8uH3M+QCap
 N3YQ1bO/EY2Nyezli2VvfaWM6lBiuNhDC8PtbpmUw0f7eVwAQh7SFZIHmzeqZy7zDQAA+WsaFiU
 56K7WpHXEw0QXUfVEfSofzmHQFYyNoIWn7LrGA2Mx0gIzve9jxDkkhLknQkw9wBLj1tmL5V7j1+
 x50mcKsZ4EYr2GYUMCGG1V+VV5vwDhRAEWk3NpBjUnckU/twjrl12kAaegbJ1OLYX4lbBah4yy1
 NDlAZGV5USy4YUNdDHA==
X-Proofpoint-ORIG-GUID: JOzVf2T3176ZJj0PHn4FuqLkcxT6j0xs
X-Proofpoint-GUID: JOzVf2T3176ZJj0PHn4FuqLkcxT6j0xs
X-Authority-Analysis: v=2.4 cv=Z7rc2nRA c=1 sm=1 tr=0 ts=6a26c9bf cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=bD1TNsHgvEXzglPpcYW9rQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=50gAi1W1AAAA:8 a=EUspDBNiAAAA:8 a=h0HYIqCiEIHQYu1o55gA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=bIAsa0K8HJLRn3BBPJ--:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_065512_310394_EB20C128 
X-CRM114-Status: GOOD (  17.77  )
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

writing-bindings.rst rules dictate that "syscon" must come with a
specific compatible identifying the register layout.  Add specific
compatibles for these devices.

This also allows to solve a different problem: "syscon" is contradictory
to "simple-bus".  A system controller with registers having their own
functions is not really a trivial MMIO simple bus.  These two cannot be
used together, unless listed as an exception.

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi | 2 +-
 arch/arm/boot/dts/ti/omap/am437x-l4.dtsi | 2 +-
 arch/arm/boot/dts/ti/omap/dm814x.dtsi    | 2 +-
 arch/arm/boot/dts/ti/omap/dm816x.dtsi    | 2 +-
 arch/arm/boot/dts/ti/omap/dra7-l4.dtsi   | 2 +-
 arch/arm/boot/dts/ti/omap/omap2430.dtsi  | 2 +-
 arch/arm/boot/dts/ti/omap/omap3.dtsi     | 2 +-
 arch/arm/boot/dts/ti/omap/omap4-l4.dtsi  | 2 +-
 arch/arm/boot/dts/ti/omap/omap5-l4.dtsi  | 6 +++---
 9 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi b/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
index 89d16fcc773e..1e09d2b48925 100644
--- a/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
@@ -308,7 +308,7 @@ am33xx_pinmux: pinmux@800 {
 				};
 
 				scm_conf: scm_conf@0 {
-					compatible = "syscon", "simple-bus";
+					compatible = "ti,am3352-scm-conf", "syscon", "simple-bus";
 					reg = <0x0 0x800>;
 					#address-cells = <1>;
 					#size-cells = <1>;
diff --git a/arch/arm/boot/dts/ti/omap/am437x-l4.dtsi b/arch/arm/boot/dts/ti/omap/am437x-l4.dtsi
index e08f356e71cb..30fcce33f4b7 100644
--- a/arch/arm/boot/dts/ti/omap/am437x-l4.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am437x-l4.dtsi
@@ -301,7 +301,7 @@ am43xx_pinmux: pinmux@800 {
 				};
 
 				scm_conf: scm_conf@0 {
-					compatible = "syscon", "simple-bus";
+					compatible = "ti,am4372-scm-conf", "syscon", "simple-bus";
 					reg = <0x0 0x800>;
 					#address-cells = <1>;
 					#size-cells = <1>;
diff --git a/arch/arm/boot/dts/ti/omap/dm814x.dtsi b/arch/arm/boot/dts/ti/omap/dm814x.dtsi
index 27d1f35a31fd..9e02bfa5c3a2 100644
--- a/arch/arm/boot/dts/ti/omap/dm814x.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dm814x.dtsi
@@ -432,7 +432,7 @@ control: control@140000 {
 				ranges = <0 0x140000 0x20000>;
 
 				scm_conf: scm_conf@0 {
-					compatible = "syscon", "simple-bus";
+					compatible = "ti,dm814-scm-conf", "syscon", "simple-bus";
 					reg = <0x0 0x800>;
 					#address-cells = <1>;
 					#size-cells = <1>;
diff --git a/arch/arm/boot/dts/ti/omap/dm816x.dtsi b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
index a1e0e904e0f0..ee0090f7aa64 100644
--- a/arch/arm/boot/dts/ti/omap/dm816x.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
@@ -100,7 +100,7 @@ dm816x_pinmux: pinmux@800 {
 
 			/* Device Configuration Registers */
 			scm_conf: syscon@600 {
-				compatible = "syscon", "simple-bus";
+				compatible = "ti,dm8168-scm-conf", "syscon", "simple-bus";
 				reg = <0x600 0x110>;
 				#address-cells = <1>;
 				#size-cells = <1>;
diff --git a/arch/arm/boot/dts/ti/omap/dra7-l4.dtsi b/arch/arm/boot/dts/ti/omap/dra7-l4.dtsi
index c8d325b0f57b..9df7648c4b79 100644
--- a/arch/arm/boot/dts/ti/omap/dra7-l4.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dra7-l4.dtsi
@@ -64,7 +64,7 @@ scm: scm@0 {
 				ranges = <0 0 0x2000>;
 
 				scm_conf: scm_conf@0 {
-					compatible = "syscon", "simple-bus";
+					compatible = "ti,dra7-scm-conf", "syscon", "simple-bus";
 					reg = <0x0 0x1400>;
 					#address-cells = <1>;
 					#size-cells = <1>;
diff --git a/arch/arm/boot/dts/ti/omap/omap2430.dtsi b/arch/arm/boot/dts/ti/omap/omap2430.dtsi
index 222613d2a4d1..01bd471f9223 100644
--- a/arch/arm/boot/dts/ti/omap/omap2430.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap2430.dtsi
@@ -50,7 +50,7 @@ omap2430_pmx: pinmux@30 {
 				};
 
 				scm_conf: scm_conf@270 {
-					compatible = "syscon",
+					compatible = "ti,omap2-scm-conf", "syscon",
 						     "simple-bus";
 					reg = <0x270 0x240>;
 					#address-cells = <1>;
diff --git a/arch/arm/boot/dts/ti/omap/omap3.dtsi b/arch/arm/boot/dts/ti/omap/omap3.dtsi
index 959069e24730..447736d2e53c 100644
--- a/arch/arm/boot/dts/ti/omap/omap3.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap3.dtsi
@@ -116,7 +116,7 @@ omap3_pmx_core: pinmux@30 {
 				};
 
 				scm_conf: scm_conf@270 {
-					compatible = "syscon", "simple-bus";
+					compatible = "ti,omap3-scm-conf", "syscon", "simple-bus";
 					reg = <0x270 0x330>;
 					#address-cells = <1>;
 					#size-cells = <1>;
diff --git a/arch/arm/boot/dts/ti/omap/omap4-l4.dtsi b/arch/arm/boot/dts/ti/omap/omap4-l4.dtsi
index 4c78a0b28fab..c1afc49f456c 100644
--- a/arch/arm/boot/dts/ti/omap/omap4-l4.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap4-l4.dtsi
@@ -681,7 +681,7 @@ omap4_pmx_core: pinmux@40 {
 			};
 
 			omap4_padconf_global: omap4_padconf_global@5a0 {
-				compatible = "syscon",
+				compatible = "ti,omap4-sysc-padconf-global", "syscon",
 					     "simple-bus";
 				reg = <0x5a0 0x170>;
 				#address-cells = <1>;
diff --git a/arch/arm/boot/dts/ti/omap/omap5-l4.dtsi b/arch/arm/boot/dts/ti/omap/omap5-l4.dtsi
index 915870eb5c99..3350128db22d 100644
--- a/arch/arm/boot/dts/ti/omap/omap5-l4.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap5-l4.dtsi
@@ -96,8 +96,7 @@ omap5_pmx_core: pinmux@40 {
 				};
 
 				omap5_padconf_global: omap5_padconf_global@5a0 {
-					compatible = "syscon",
-						     "simple-bus";
+					compatible = "ti,omap5-scm-conf", "syscon", "simple-bus";
 					reg = <0x5a0 0xec>;
 					#address-cells = <1>;
 					#size-cells = <1>;
@@ -2311,7 +2310,8 @@ omap5_scm_wkup_pad_conf: omap5_scm_wkup_pad_conf@da0 {
 				ranges = <0 0 0x60>;
 
 				scm_wkup_pad_conf: scm_conf@0 {
-					compatible = "syscon", "simple-bus";
+					compatible = "ti,omap5-scm-wkup-conf",
+						     "syscon", "simple-bus";
 					reg = <0x0 0x60>;
 					#address-cells = <1>;
 					#size-cells = <1>;

-- 
2.53.0


