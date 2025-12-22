Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD510E677E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Dec 2025 15:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MbRnW+taGLz61/GYCYEks4oaouDwWT4YbUUlXc+6T8c=; b=12nVBpeKz0DVO/5q8lZcuRbd8D
	k6oiE9Zbq464jNsws17kSWydsG/I0q+P8oXh98whFJ+jC8b/EyEgV50fDgR1/CpofOs6NBkzt/Ya1
	fe97gQkQ8tTyydvojECW3Qu+9PNGkUw8dCt8I1CjbSg6EWUhaNgZiTMfH6XvJ8MGXm09vRrkKogi9
	WNtDWxuw743lrk+fuSlfuPvpbjHLdSW4Td9DZKIFlyLSfY5oddlEEfds1yUsvjbex7vdph6oz17n+
	t+PX4EVIrtNqVUnX94KjXVAs7T7+VtrL3E1mPv4DIbEaxU+fA2QKXbVtplKiOjyjOr6/xOIQpcivh
	o4VanSYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXhQz-0000000Dt9i-4Bte;
	Mon, 22 Dec 2025 15:02:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXhQw-0000000Dt8t-3Gjt
	for linux-mediatek@lists.infradead.org;
	Mon, 22 Dec 2025 15:02:52 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BMEDFKg2043431
	for <linux-mediatek@lists.infradead.org>; Mon, 22 Dec 2025 15:02:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=MbRnW+taGLz61/GYCYEks4oaouDwWT4YbUU
	lXc+6T8c=; b=T2X1amvSu+XjVkhSyzmjwUlV7TBBmPvyMgahrGAIofFfT+kHSIM
	7S+aW5isUSblaXl44mYTvjv002YjITInVdLEvpTfU4irvY7dKkkwWmp2MMAgXXkA
	L+1w42j/nVAilwBBiZgF1C4XWuohsV9YA0bU8UmNMTrZtCQjY560AyqGyTtclRAb
	CA/sfmcGVPnLG6iNsoGwQKkBMcXFztGSIKWRCLUvD+4bVXYCG35I7hFiaGoR7cSc
	QeHgw7sHAi3O6ikPbrwpKjt/dxC+KiQPJEYiUkl7OgB0GbvHDUe1J0Ukh9kB8rPx
	jYWZ3wKH5UQJin5sM7ybqpVUybl+ic4OPtg==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b763pgbwa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Mon, 22 Dec 2025 15:02:49 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-3ed1787beb6so5164339fac.0
        for <linux-mediatek@lists.infradead.org>; Mon, 22 Dec 2025 07:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766415768; x=1767020568; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MbRnW+taGLz61/GYCYEks4oaouDwWT4YbUUlXc+6T8c=;
        b=WDpzGblH2Vdsw2/okP02tHugBVZF8SMpXXPb4u9t/SAXeM2nPhrUcJ9zTDp+LmFzJb
         ZtaHqtCLc69ifFNnKdVVSS0SEu1/2ZlXzovAvifpO7NWPEEvBgV51jqcvw8L8R/xrWIc
         OzFlR3ODMKaErL77KOtoFWPMjpEAnXaQWwWV0j2Zq6c4ppu8PRMr7Tl9Rx8O3qO2lI4G
         jyhnVgbD1B9vAg1Q/qlvOJDRpz6uKhamgawmm5TW3CcQUlMbtA+U/T+Op4Efzuao0EKp
         Ej6O5mrDeH7SX59ZCfXTE0TNu+SjTbcUMjdREQffT3qwpPQXDBaerY0nVYSRtCrnPRNg
         EAGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766415768; x=1767020568;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MbRnW+taGLz61/GYCYEks4oaouDwWT4YbUUlXc+6T8c=;
        b=EkW3dOOlsRCUt/X3ckntyF5IrmSczISCuKqkeLFKrjQ1WP+aFcIiTyjh3OSBUPpleX
         HhF7X/N/vtFJRN1NImR+iOqjAeqr9Q96iiVofqZ+aCItNCJ6KkYl4WP4OX3n9yWxv4F/
         7OgBVPT93zXFB8A156bMQ6u5k3TYlV9X1/ZdXT6jcZvAJ5Oh7SX6Xtlol7fGp4RZ64b1
         fEQr0yIK9AzPBqyvOmPzJz0KlvB69iyKktX5a5WzZc+tCEHh7DfyTitIwIWRB24Ju4Kv
         y6s6o/g1UESkpbjOfDVqpE9WmIrg7qXFe6z+ad3dPaq7ExkNp7IEYrWNPkRoxlE+mYOT
         DK8g==
X-Forwarded-Encrypted: i=1; AJvYcCUIVUuR1kYFURxp6xtu15Ktsn7ENnuJCMoIsO0mmyCO7mnjWJzzl2TTzrc+4xO9TNYVKIbz+jOTi0hGFF009g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzHiw+MHxa6tewImYbUJN318cPFy2/PfOXJSDBrNKNHwmCMb0be
	D+KMUa+XpzPLYq/zaWCXlxUggax28j3aSDk/Lw1hjg2DFIC8+BumNinyWnTJoLaC+xicQvh7MCo
	igiVLhhfxl06Zshyg5xFuE99ovlLog4w5/l2v5MH+Q+zZuSc7tvJiYzHjC34ZyWprf3fpV1ca6v
	E=
X-Gm-Gg: AY/fxX4H2VHGdAAejZaOoWOZsnS6Mvxll0aTEnTpzY0XAcg/jODsxzD2E8vqCp0/tZ1
	8iQHVh2IqEyA84NPCrJ0Ahc+caAGNNohW1J/zfoR8s+Jbe9fatIFYM0G0zZLNXWJIu6M5gmEuqv
	baaTnNI6F/RaUxO4jYFtqiNtXICAF1heAfP9iuUyPQgSOCL1MxO3dawOCNqp4nqOvU8l0AxIuEr
	qZKrBSYt+qgtCgOtUqrzUXRVZRLjAfenx6C+ICQrim/DPRq0q25ry0fwFmQOr+pFl33Q4kEL/wd
	As6FCnp0Xbf0xMMkKnHUrj6U5Op2JMH7ZWk6GCmrhbV78Q20B0qqt9E7P7oLCeJ7w4/VbF74e/n
	Zh271baP3oUxl8N3wwrbDnOMzb/mtDd0hAPHjzw==
X-Received: by 2002:a05:6820:6081:b0:659:9a49:8e92 with SMTP id 006d021491bc7-65d0ea65d9fmr3174891eaf.22.1766415768436;
        Mon, 22 Dec 2025 07:02:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG7muTZlKDO/hZmrLDRprGb4Ds+B4A/MOrQVAeKXIBtOKKPHjm3aDXKYtsOVpcZygPExsVlzw==
X-Received: by 2002:a05:6820:6081:b0:659:9a49:8e92 with SMTP id 006d021491bc7-65d0ea65d9fmr3174849eaf.22.1766415767791;
        Mon, 22 Dec 2025 07:02:47 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:cf80:9c52:813b:afa9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324e9ba877sm22160900f8f.0.2025.12.22.07.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 07:02:47 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH] clk: mediatek: don't select clk-mt8192 for all ARM64 builds
Date: Mon, 22 Dec 2025 16:02:35 +0100
Message-ID: <20251222150235.34919-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDEzNyBTYWx0ZWRfX0IQDBNVZMclj
 8bCLOYaK4Tmyh6Xp+PEK7WzK3DwQwF/txO+Hq88QFB4CLEOYIeTkKXRGIBP/vuhqZFD0DBzPNKS
 swXNgmsMes5peC73ajZdI3GJTVRFCzaZpwrwkvi91giB/askjxa/H5QKhss/5QbkgNM+mlFjCVV
 KT80BJ4kAZBeZDVKJ3qI16d3qEDa+KbxHWgiin28+r0x/m9x9wizfyW4CTzAV9FiWSrj0cV+MYr
 OGzlASyLqaH/1yUXUyf2lN4aemceQ3kcus74tkg/JzWGrELP4qU22Evy1/0N5pAdFaCCPJwEdpB
 SzzIcBqvc3D6rsgM5WoN34A0ZASA13Ygk8mcSEIZVEI7APNtIjSjy1yusG8HB3hLCGI7qOW9eYx
 JqVDl2GGP6h1Laqm5FQd6ekoPqQ9FQoyEKEZ+Zx1b0XZUZmg4bmRJqrCHl8lYcgYpXASieLwzmg
 9Tp+M8d6tHvB+0FsnmQ==
X-Proofpoint-ORIG-GUID: K--KWp8x--fMbLpWUe_p3XaC0eAS7EsV
X-Proofpoint-GUID: K--KWp8x--fMbLpWUe_p3XaC0eAS7EsV
X-Authority-Analysis: v=2.4 cv=H6TWAuYi c=1 sm=1 tr=0 ts=69495d99 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=aCVAxBrhNG69dy2j9FMA:9 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-22_01,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_070251_074380_16065849 
X-CRM114-Status: GOOD (  13.00  )
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

This option defaults to y for ARCH64 meaning it's built even if we don't
want anything related to mediatek. Make the default condition stricter
and only build it if ARCH_MEDIATEK is selected.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/clk/mediatek/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 0e8dd82aa84e..2c09fd729bab 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -820,7 +820,7 @@ config COMMON_CLK_MT8192
 	depends on ARM64 || COMPILE_TEST
 	select COMMON_CLK_MEDIATEK
 	select COMMON_CLK_MEDIATEK_FHCTL
-	default ARM64
+	default ARM64 && ARCH_MEDIATEK
 	help
 	  This driver supports MediaTek MT8192 basic clocks.
 
-- 
2.47.3


