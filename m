Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD61E99046
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Apr 2026 07:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5P8NXaOriPkPC2q0IRIWz9wKZcBWfE5/xl+XEf1jVQ4=; b=xl/GBjsTUp7x8AnGf6Mw1VJzYe
	HDT7xtzCsxzatC9Ta8+M/ReDw02ZRBILX3VYZR//vlm9vQAzzgpUFJX2pagfHY5mpKtn9Z4RLDYFp
	qjUMUCXrbhaV4r1AcVyuIW4rRASnzdlQfQamDnq9to3XNYYrvz9Dvz7DeJMhM621HsyUBrY8dDREi
	MHaAmvtEsGCOc4tNZivMCBxqw5JfnNNQPj/Ad4G/vdCfXLwZYsgf0H2bEbQywB4w+sOW8sJd2rNnq
	KBbs7gbADfCrf3EraOwMIU6CHXGX0u/vIGkQUH7l3CDunq2sgbnuF/Xld4YFP+xymyEJgq2vX4h/c
	4evzK/8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB5zy-0000000BiDR-2CGA;
	Fri, 10 Apr 2026 07:09:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB5zv-0000000BiCO-1unW
	for linux-mediatek@lists.infradead.org;
	Fri, 10 Apr 2026 07:09:49 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A6qmN42629321
	for <linux-mediatek@lists.infradead.org>; Fri, 10 Apr 2026 07:09:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5P8NXaOriPkPC2q0IRIWz9wKZcBWfE5/xl+
	XEf1jVQ4=; b=TDZJbw28P7WvcFvFthM1dYWl7MpKJOVzb/nmk83ywwpePZQIurg
	pQLwORmoW6gH15oGMA/yBgtVtZfW62pBWog+rqSyHM0d9S3k1Ty6dTKBndlAA8wN
	R9NQULd1MQ/+WUaYDgr7LL4Ron4es66rYcDkNXbXeTB9hcE8FMd91Sd3Y8FGLlxG
	Y26FYG+IcdWTJlMpY70fWiopkb4gka6ARm7t74lZi7zmbW8B3BpkwV0CNZkHM0E+
	1EdwVtLLVU9p3FNnIv1rEIBWucMvFFvqBZuVsE8HFYBvbvaowQWv26dChumtmMwM
	u+l+9lBe2BI70nrzr3l+d4uxN6RDLQuqI7g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4decmu341b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Fri, 10 Apr 2026 07:09:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d8e8c47a3so44354731cf.0
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Apr 2026 00:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775804984; x=1776409784; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5P8NXaOriPkPC2q0IRIWz9wKZcBWfE5/xl+XEf1jVQ4=;
        b=duPfaz4QhRr79fBdLn/3bo68hXoxkMDuu1HzTPCpDSWT+EeIYpn0UV4Lmlzmy3YSoC
         aKMyf2d89NDljiJIwL7swihUK4t9FhtI0LjLqOz7C4RQ6Eiz3Jypffg+rLxXVhv4PDIr
         G8U8WDNrXbVyA4M8ek6rEdUXYNTUp/lgRs6yqSNe29QCwU3yzlYtfji8cyzn2g6uIfqs
         kowTh1RWrE1kYJpF5Wq9gtrIk0lWpqnRwsH+TXJSIbQ0FWgCUEgAU8MTlUr/n3m/ux35
         FEjurcSWEAYhsOtTQEQMEm4n6tlCk+3S2JxB/WI9IahuwjkrbbiREdjwtZb6nYWFSSTc
         N9qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775804984; x=1776409784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5P8NXaOriPkPC2q0IRIWz9wKZcBWfE5/xl+XEf1jVQ4=;
        b=Z+W7af+aZ3KTSjVukKeRkTjahzYx4qr/ljmtUu859jmspf2iyEBimzI6kzAm/aXuB/
         E7vN93yj2L6aYCZ5hJ8gAkAQ+wnXI05+iKrweb8CqcrChTrwOcTAnSWR47c1LOnw+e5r
         qBiyRkIeVG6ZsCgGDjP8C1jrCJBSZcqROJOaPobCo6ruIpGASLi17DzwNm5morB89mF3
         fZMbTpZt5Z+ObWMJx4IbEX7hjVAz/0Sqaxq4jlgUlipfD9FaJfM1T4UPhbzPkmT366Fz
         irVx9ZfQdJ3+NyocggapdT+tbs+S4rVtzEBpZbt3P1lguVcXK0iUg7S8jS53MkRH3BQ1
         nVXQ==
X-Gm-Message-State: AOJu0YxdCdm7Gnr6m1owKGkEbICFkHqYcjd+K+tH+XQujJwWOIx016jp
	dTWeOsbOjwngLY1Kn07h54EggUwb+52OvZ5vvaZJdd6nwG9He9mqNCOPApoXKqLDIQQy6ouRplA
	rDbfXDanDM6lCZRJa+JmgsQ/7SbK1lMl4PtTirazMMDrDJr0vuZDLR9pDg3zQJBvE+TaDTSBo5v
	Y=
X-Gm-Gg: AeBDieuFm2sFDKNYldMmPa8ZsmU3GJy07ilunAsOg92cx9MSu5vBfx6VlhFGqLfxuAa
	GTb8WrIEOB2EcWuWprkBUjG1ivEee34f6QJA0jawud5c1cc27+6lHGiByIyPJ+j0aV6YovPQVIl
	NrNYKYABerSUpqbMSAQiTL+tAssVuolwKap8tutBM3MmyhRfz78+MCiib07Q9E/eQzLD5TeLGhG
	nEDOYorFeXnKI/PA/i8pvlaK8TXYy+OOC2cuE/r30MKD5Q1nd+tOnd31g2TG3GHyX6s5bOn1miO
	Iu1FlSmS/1NMZ1OvW4dgv5dFACJydrKQ0Lfu0tXq8yzSR0bbQfc9HaQTnhVBMA4ic5MyeWFj28h
	sHIINb6tYypJ1NkG1nFMPLePfuRe2VgUi8m7RTMP8xthVsApXTQ==
X-Received: by 2002:a05:622a:834f:b0:50d:aa99:7bbf with SMTP id d75a77b69052e-50dd5c0be6bmr27268961cf.43.1775804984529;
        Fri, 10 Apr 2026 00:09:44 -0700 (PDT)
X-Received: by 2002:a05:622a:834f:b0:50d:aa99:7bbf with SMTP id d75a77b69052e-50dd5c0be6bmr27268711cf.43.1775804984031;
        Fri, 10 Apr 2026 00:09:44 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:7d6c:c663:fa06:9ee8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e50289sm5338689f8f.28.2026.04.10.00.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 00:09:43 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Frank Wunderlich <linux@fw-web.de>, Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH] pinctrl: mediatek: moore: implement gpio_chip::get_direction()
Date: Fri, 10 Apr 2026 09:09:35 +0200
Message-ID: <20260410070935.9540-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: mecwkk26BVJI5qXPsGITRTSVo3biB-mk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA2NCBTYWx0ZWRfX0CDY5FQML+e0
 r9e+DbjjoPQSPiJ2YsVMMkLmnPwOBt0rCSs8pf6K+vX4+4dNVzPc6gq12nEoMAqJVifgw3jAlLX
 LAMYZQ80oBoUQgSMX75n6eDBFJSHu1f4mJ7wZwZq0EOJnKXI9R0wPFFZxdyP7AhYaAB9iscdobE
 hmbDAWz2AriOBbToVuVep5vtEQiI0vU9GJXkpkOD9ktA5PfX+rOW59+Q3hZ8mt2fZ0KbYqvT9UA
 XMyWXGUxgID0ZDw+mTLZ0r4PAUbVqNT9HHq+YDzWtXgZBo1NG21j6I07j3TphquPgz7KMUi2IXz
 5OlMrlwld26kPNAbKIjXq9ZBpmpyyZevl+0XVFIentQl3os68/M9a/W875shjkXuqOp8UdvqxlY
 3+gUCEwljzGjxPRO7URXoHSxRgv8ckk6NO2741rxft9i6IHbwmTQOMKt+6GfCcNlDKSx75d7wDt
 dNnNcbPVdb/gqFno+lQ==
X-Proofpoint-ORIG-GUID: mecwkk26BVJI5qXPsGITRTSVo3biB-mk
X-Authority-Analysis: v=2.4 cv=DslmPm/+ c=1 sm=1 tr=0 ts=69d8a239 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=gdeKHt93fcZDdug0Yb8A:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_000947_632461_FB7C91C2 
X-CRM114-Status: GOOD (  12.17  )
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

If the gpio_chip::get_direction() callback is not implemented by the GPIO
controller driver, GPIOLIB emits a warning.

Implement get_direction() for the GPIO part of pinctrl-moore.

Fixes: 471e998c0e31 ("gpiolib: remove redundant callback check")
Fixes: e623c4303ed1 ("gpiolib: sanitize the return value of gpio_chip::get_direction()")
Reported-by: Frank Wunderlich <linux@fw-web.de>
Closes: https://lore.kernel.org/all/20260409132724.126258-1-linux@fw-web.de/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pinctrl/mediatek/pinctrl-moore.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/mediatek/pinctrl-moore.c
index 70f608347a5f6..071ba849e5322 100644
--- a/drivers/pinctrl/mediatek/pinctrl-moore.c
+++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
@@ -520,6 +520,23 @@ static int mtk_gpio_direction_output(struct gpio_chip *chip, unsigned int gpio,
 	return pinctrl_gpio_direction_output(chip, gpio);
 }
 
+static int mtk_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
+{
+	struct mtk_pinctrl *hw = gpiochip_get_data(chip);
+	const struct mtk_pin_desc *desc;
+	int ret, dir;
+
+	desc = (const struct mtk_pin_desc *)&hw->soc->pins[offset];
+	if (!desc->name)
+		return -ENOTSUPP;
+
+	ret = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DIR, &dir);
+	if (ret)
+		return ret;
+
+	return dir ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
+}
+
 static int mtk_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
 {
 	struct mtk_pinctrl *hw = gpiochip_get_data(chip);
@@ -566,6 +583,7 @@ static int mtk_build_gpiochip(struct mtk_pinctrl *hw)
 	chip->parent		= hw->dev;
 	chip->request		= gpiochip_generic_request;
 	chip->free		= gpiochip_generic_free;
+	chip->get_direction	= mtk_gpio_get_direction;
 	chip->direction_input	= pinctrl_gpio_direction_input;
 	chip->direction_output	= mtk_gpio_direction_output;
 	chip->get		= mtk_gpio_get;
-- 
2.47.3


