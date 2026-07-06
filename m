Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9765C43458
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jul 2026 09:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Sq1VYR8QdKW5RsRumCdfXDEFCCXjk7aw1b4GqYiBAHs=; b=eKu1H/45jJguFhcmct0/oU42MZ
	JRcvfvqu4SLjgCfH0qsCJQpP3uJVnD0RatZSbZ9S/sZDbIA9SL+C+wjYpF6VPudpzDZbhAyD9PZZx
	ey7dsWjvhu9ObV1JjhKS8MFkRAVwu3/h4vI4iFIv3JwqJmNDeeZaGsvjweywVBu3GNya5uXIgOoii
	NaBLrQ3bzVe8hBhz4g5jz9t0WkvgtbS5dIh+7MKctbanpACGK1L0aZCEX1bhFBC3nVeraK/q1sUiD
	QFFLk35Qz/nA6+iLyExQNndJQsMknJEYqCoOwrRlSpSYnSpMN7lD0UyKJJfZCouIqpqq6BQWzDCMv
	v8+OFo/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfjy-0000000C4Bc-0wFF;
	Mon, 06 Jul 2026 09:35:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfjW-0000000C3dU-3GXL
	for linux-mediatek@lists.infradead.org;
	Mon, 06 Jul 2026 09:35:23 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66694Ip34180053
	for <linux-mediatek@lists.infradead.org>; Mon, 6 Jul 2026 09:35:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Sq1VYR8QdKW5RsRumCdfXDEFCCXjk7aw1b4
	GqYiBAHs=; b=I/fOS7IlgjnHg9OS4LvfruJbJyxMS48/9BfouuJaWp023okk2rr
	vFKA/8JPRnoG/SU55vl6u2fpzTZotJvyNoANmTG5Nwk05mnxgIuM1G5WEB0Ef78Y
	7r9v3z1yLg7o8uGKMDOdz4t6XI3bGVQFjHJ83ey0298FdLirVtljqpxxiS08l23h
	w4B41+m3ZcNc+zkFSL/dNMj9EzODPWhYMVneP3T5/Tnqn57tYx45oayo/U2hRMUr
	sOxcb/W0QwpoPYYfFiJg9YW5p4daF5kb3KvJMgYFD/0EVYWQUFAVuOAmphR1Fbzm
	XocodlUCiveYEvf/3Hn8d4zPhbGopJ/c1ww==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6txenduh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Mon, 06 Jul 2026 09:35:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e4f946461so273621085a.2
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Jul 2026 02:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783330521; x=1783935321; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sq1VYR8QdKW5RsRumCdfXDEFCCXjk7aw1b4GqYiBAHs=;
        b=YzcrtXp/qI6dYP0+UywdArO8zNizzJXuieeVZucgujqWEQNwrpsesL/25pivIaFb/1
         YgysoNOY32g7WCe5xuDH8U3QPmiQB+K/YBkKgJ6Ukbsn5BSQh+dPqRnc2eOvQMpTI8Ny
         +3bzBHgLTilc10oZyiL8e6ItsQMCvWXMcPUm/tCaKms62DPSpcRFs9VZisdbpBSlDvNb
         YC2+Qv+UfnjqYxUFR/IvirkEejYPL6YEwHfN1gzZqfR9LUALwFUeIYJBvQavM1RORwQi
         QPU2+pfv7Jle/UT23aAKxFprHpCCME7Alp3eyalbJk14Ha6BJtP7skXmNkv7KwTCWVJu
         H3iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330521; x=1783935321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sq1VYR8QdKW5RsRumCdfXDEFCCXjk7aw1b4GqYiBAHs=;
        b=eusAnP6BU+rcajtUWVqOK2bon+DigqRTAqvf8+dSBQOqbchYirFRxeFnnegsQcsjIF
         dqONeiI8MXlTpdHQ6AGk6W3DYw8zv6WthgQupn+0+EriSTUk7ybh4fw6kPiMhkzgOGo+
         A21xJYB9Zfzb7wwloerNPB9SNytVFRtx5+Bs5ChCZB+NUU9YHlF0xlk6jjSUYi++h179
         3JQAscwRQN1Z20krka7keHPY2a5y5/ObitMKMXFJZUKgfZKfZdO5mC/PDoDjpLSsQ6pT
         NFU7GnyZfMxM3j5FUWGHVaTzTjsD1A9CrYqZoK9kMGVb2I4dgQLjnzpQwJoMMwUOCznw
         H/FQ==
X-Forwarded-Encrypted: i=1; AHgh+RpCSdPUSQXm/SRuUZ8gZlq2WMUGqbajWC24KhtQ4wPcFKn/HjIfWUnVYKDvnIH0Bfrv+8+jAcbvBQBPTHUTTw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyVTzFbJ6yNdHMnlY3X+fDd5PokuGocq3gJ5wQnCZdNx+EgkzOe
	8jEV+R67GiJd1G+MJsYK4Yhk0bx1FiJuwFEMu2WjDqAHPMwaq6hzM0vPEeNr+iiVfaG4ir/FANY
	9A5ddlwD0Uv74715PUoek1FpCyC1zprEcOHpNBtaUWZMlgSCia+zT3gsyj8bxkd8SOJ6K0xmTXE
	rh1kGgjtw=
X-Gm-Gg: AfdE7cm5fn6JbFSyqWaVmXk8AnsIXOhUn6mVMnY3I2GBeQkgpQFS4saNloImPBWIuDS
	1qXNSfbvBwkYay0pklq4AzkSduCqZF9i86llo9sPKOWGLS9bJ5IZTfzDDvKHidXKAfu3MXinrFC
	t+TGCrn5owG6s6o+nnoyizB/gLQS20UkBN/1h6OBViXluizhvvHycwsPXgDIGmj1iIPmyDJ+oXZ
	/3b3IbkKa1UMc7upA3+OkDpskbHdsA51mw6R/4P7OBObMpoJ9z5+9XyYsjSCe13FCAZFXNkgqJM
	51PijybQvfoYmbjAhdYDbsUi/S+FWay6JgC+z+25ybXm0D3xHvhgNmQOANhvOzkv4VCvOuskgJP
	PH6DFl3Ao6klm76Dwp3Egn8qZeG0=
X-Received: by 2002:a05:620a:4147:b0:92e:61f7:5689 with SMTP id af79cd13be357-92e9a4cb130mr1279218685a.58.1783330521065;
        Mon, 06 Jul 2026 02:35:21 -0700 (PDT)
X-Received: by 2002:a05:620a:4147:b0:92e:61f7:5689 with SMTP id af79cd13be357-92e9a4cb130mr1279216085a.58.1783330520590;
        Mon, 06 Jul 2026 02:35:20 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d910sm22617247f8f.6.2026.07.06.02.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:35:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: mediatek: Correct indentation and whitespace
Date: Mon,  6 Jul 2026 11:35:16 +0200
Message-ID: <20260706093515.274013-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2456; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=Gu2Qec0Cn8DBi5/qAoJJnBoS4AYcVox7BuSwo0xqLZM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS3bTE0sRZsosY8Pg+hWL2hzWUh4qO4z1kjx3N
 D63xTaeqJyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakt20wAKCRDBN2bmhouD
 12ldD/9XA8/SNVf77cSeM7jZjnFX+aZRuKcZO6CGCd12ecOe1wezd/sW96N0RLOJJqkukXApRr7
 GQ73TULuem21DP2O+ATMlWUOdAY+Hfc2qnRAPSdwa+TwzsTAlEHj4IWV3jcRbVIEsvc97uMykF8
 Y8jP2/YN+JSAGXeuNHyyvEVqjZJfviYah0ucfUGDN3DOtpmyCpSqee5yQad6mR9rM+snc1wweui
 iaaO9QFI7JaaGSyTKijb1G9OshV5wlaJE8Z7awW0M3xkJqV/WSOOq6M9z93LOfO+9coOBdGhbbx
 fgkWyEysWsFiqJVNNsLe0g5fCLyQiP1+bBxQkujVoT529SmtCqlYESRjzMgfcBqaT2WcpU4FD2K
 cvAjG3b+gVJD8bAxj6mMV+ywMfTFH310oQchxMz1KWiF/AdenKk1+b//bvAmA8hh8TiKInmqH2D
 BXB481uPSOVKDN/k+dwZnTwXk+lbgddmpmM1YXOVoyS9dMtGwSpt7Z6QqpE4azAe4wLOSHd1b2A
 /9/p8VmIhL5e0X1BR56quhzrUU3Qj2yuBqb1Qq+iW7NTrwFlDRr66AnQ0IT+098ifZwa2m4ZKPT
 afLkoPvMnwjaZmnNWWiYoxqFBuVSt04MSWbyPvBtkPDGVr3UbwKH9joBGigcUtwkXwc0UyGf9yS SCE+ACOybxX99Dg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5NiBTYWx0ZWRfXxaNKUFFWjAm1
 jrESAr7Ff8chnxkWqh4E2s8fLUKE2SeCq4+UQBwOVHHWHccJS+gmVxctC1hXPFW22TpFt8wfw5P
 bmLoT6BTbNM9aej08MPFV8S8QQajiZg=
X-Proofpoint-GUID: h0hz_REEMLtpERKcVyUbLTRc2ENDrG1E
X-Proofpoint-ORIG-GUID: h0hz_REEMLtpERKcVyUbLTRc2ENDrG1E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5NiBTYWx0ZWRfXydW/QEV26NzW
 6oI0MMgDOHRMGhkxSQZHNxAh8UKEOSHo5DNYTY5RJ41ve5BdTmXORnpKDaaLxm0Um1XHYtLFWz8
 wopOgr52K8aS1nFyeHFQ9ch4qqqPNQTzB+nnfEWsOrrARUJNGn1MtUtMbKR5rIzsW50/2SyOL7n
 Z6cLKh6oRmMeSeU6aJUz2KuPNXmruBaw06Zci5UA+Qt7EIZp40fe401XCiY03OZdIAKnbXLFefK
 QNyrU+pqVbIiHCJNCCjj9hPjCIE5mlYnbtm3Y8Rt6rzaw9WOpi4RyEDj/Qu6mAm/78W5eNvBJBF
 NiImWfokNjS+xZQvtBljKe6s0ryhaAqhuDTN4Sxi47uxzz7Aq6j93JAKPEDnd1JW+pMEDao757E
 XJeuKFG4dy93zhP35tFe8bXs3XNfT4vey66a00j7mbJSX1/G6LUrYLBbJkoBjB3wyDoQaYCM7os
 VPsv5y5+44FUqsrhEmQ==
X-Authority-Analysis: v=2.4 cv=HLLz0Itv c=1 sm=1 tr=0 ts=6a4b76da cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=QX4gbG5DAAAA:8 a=xiN1gQym_Li_Z0aoeM4A:9 a=NFOGd7dJGGMPyQGDc5-O:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_023522_829034_93B64368 
X-CRM114-Status: GOOD (  14.42  )
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

Correct spaces or mix of tabs+spaces into proper tab-indented lines and
remove other whitespace violations.  No functional impact (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi      | 6 +++---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dts | 4 ++--
 arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi      | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
index b702ff066636..b210845277e1 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
@@ -86,7 +86,7 @@ touchscreen: touchscreen@10 {
 };
 
 &i2c2 {
-        pinctrl-names = "default";
+	pinctrl-names = "default";
 	pinctrl-0 = <&i2c2_pins>;
 	status = "okay";
 	clock-frequency = <400000>;
@@ -101,7 +101,7 @@ eeprom@58 {
 };
 
 &i2c4 {
-        pinctrl-names = "default";
+	pinctrl-names = "default";
 	pinctrl-0 = <&i2c4_pins>;
 	status = "okay";
 	clock-frequency = <400000>;
@@ -381,5 +381,5 @@ &qca_wifi {
 };
 
 &i2c_tunnel {
-        google,remote-bus = <2>;
+	google,remote-bus = <2>;
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dts
index 095279e55d50..cc8c913d2763 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dts
@@ -19,6 +19,6 @@ / {
 };
 
 &panel {
-        status = "okay";
-        compatible = "boe,tv101wum-nl6";
+	status = "okay";
+	compatible = "boe,tv101wum-nl6";
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index b0c97930a0e6..ce27f314d19d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -7,7 +7,7 @@
  *
  * Copyright (C) 2025 Collabora Ltd.
  *                    Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
- *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>   
+ *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
  */
 
 #include "mt6365.dtsi"
-- 
2.53.0


