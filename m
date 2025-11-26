Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B11D1118A
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Nov 2025 17:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yuBdo4Df7AcVAGzqPD11S2PZNb+g82HKKFiS0s50Rho=; b=BFBaKJYhyB6usM2j9eV7Ean9OQ
	C/xg3BEMl8pGqYGg2/odcP8IxFC4+cEy3bHUZ0vNmp194h16Gk83eMKlXKURkgqSh8BfQt5ynXtUP
	3feBlGtXUzoVBpAp9mwaBWX6W2TUmj1cPmilPgrH8G8wWOxvQwi6/ScOZ2NWtcFnr6PGMVg1gkfHm
	eskMre82rfK+4naKbfrp5FOmuSPyJ0VDWKk0DNhte3SwgpaVOeaJLVBs5YM9pQvmTTY4OUR997Z7c
	N/JlHe5+3OSHN5MY28fXMa1Oe1SEST65AY76kyx4dGau9t+7LrGrVQRAjA8i/7k5BWAypsoieIRWP
	32NDevlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJVO-0000000FQuE-3iHI;
	Wed, 26 Nov 2025 17:40:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJVK-0000000FQrZ-3RG2
	for linux-mediatek@bombadil.infradead.org;
	Wed, 26 Nov 2025 17:40:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=yuBdo4Df7AcVAGzqPD11S2PZNb+g82HKKFiS0s50Rho=; b=Vo1eDcW6CXPNLwdL9Q3msfRugR
	BumKkoBoNhAkTp7NDCkaLpJy1Sp0lUfQ24bzKqNOZEYCOxP7dB+3VbmpViX2pAKg311/fLADuerVW
	k7L9nuYf1APhwb5yKRbjF7HVKctsJ/A9AgRS6UmgCp7udHrVmb1yJChF9ZAiop3WNtfIXHqcHLTXi
	EEYknQxzV8Xfno/EsaujVKKsKKX40lv5Unm3/3Rt/fHYCC6A/U5AM8G9mUKVVmOUKUulkmHGM8cGn
	zXxFoj6P+mO/qth850Q1uFJJoOnd1l6psWgWbAtVNyfaywl2DljTnqFF7G8ibsVi7/oNXTQDU8klq
	3Pwt8CBQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIdh-00000008Wnr-19W9
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Nov 2025 16:45:11 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQG8YOi1234720
	for <linux-mediatek@lists.infradead.org>; Wed, 26 Nov 2025 17:40:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yuBdo4Df7AcVAGzqPD11S2PZNb+g82HKKFiS0s50Rho=; b=Cj8kss0czCvnTOtK
	Oijfre79MZ9wzUFjAdOBAzakqYgkLLwcaGA3Ep2OJL+tKIMH34zsRzpjosJgvcvY
	TwTN5BTLT6jwCyBVwS3esUlBJ150Xa5cHMnHlQ86QobLdE+UdwdPd+dXuh/RcIMK
	owSWi+pm6vT99vArbQoe/fFzd6+Qi5tY5w9CoPm6TpR6MBjt2JlFnH0iQ8PiDRg8
	RxEvos7ozO//9HvBlGk09Bb/4bVB2czq9GEsep/zmkaUZItAXhn2sjnOEhX99dlC
	CVArODyt50cMve0X4h4EYOS0R1mMOtnjl5om6uUcMtWzHFp9wQ+d3DWx9YFlkgKI
	KEvu8w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anwd41rxw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 26 Nov 2025 17:40:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b225760181so845877985a.2
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Nov 2025 09:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764178829; x=1764783629; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yuBdo4Df7AcVAGzqPD11S2PZNb+g82HKKFiS0s50Rho=;
        b=aXkdg5AivMzjhDuH1xG3HmEAS+soSj1G7em5pkzuSONYPtHDczBx1OU1gu6v5DqEgb
         tVRVY9YKVr/PrghTeJJsTBN5ca73auVuX/TGZWrqAzvu8U+kizeW0iwb8a/6iIlBU1TQ
         8v5+7i19dP+4fDHzDfSDrjpX0PWlOtFmDPtCMWY8VF9Sc/v6QpZKb62iZDDtKzsxWFXl
         Z5ZXokYaYyN8wGZz4oaCVWM5OHtMiEEjUb1wENNdmcSTO9Hve7G91N5381CDr15PpHDN
         yKdQeSmSw9UWhLm79hABc8+wpUOM5I/UVtBRaqPFKZQ9KborkOtQhJpQU7WqPrpYwV+Y
         AD/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764178829; x=1764783629;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yuBdo4Df7AcVAGzqPD11S2PZNb+g82HKKFiS0s50Rho=;
        b=PSuKpw2gT0h75wz1ypHjXPP86egYOmbs64DD13sX5Rx7MxlPrE3xSrBWMa99NkgcTC
         +jlDRKnKb3+3GelVdCdVOgizltPj43fowWGkWKt/XwKTbwKngXMC8yHSfamqQdhM+++k
         lkt93GNNKIsgzJaKfhRH5BI7SKePLxy7A9rl9EeWxbJbo9Jgw+mrlxOJKcLc1zA4Iqfa
         IICDqo8sebaU9yk5qlJczKWBZvdfz8m+qCQH7DY0otH1Zm7qyf1c8wZA5fmrT5gYAZ3U
         fQ0fgObpt8pcww1rbJip9ArGQuotvk8jmvPjlHIDnptYn1HwEyZC3JfZPYxBD6Njylzb
         espA==
X-Forwarded-Encrypted: i=1; AJvYcCU+czvBAPqeLhkOqisJ3tU3Fdb24CnBNKbjNqqjCT7Leu7n4hZRypx/Ad45663CDkAkHKDo0n4kuYeX5f7DYg==@lists.infradead.org
X-Gm-Message-State: AOJu0YytbagjKk0isaxQL3yfwmFqY/GZdDlxygl0rQc/zMX2V1pLfEBZ
	CoW6qJcMLbgHBlESM1ko6HKD8PE6InK3jsQW2jY+IDqYtrlcU5yBCJsBp1YBFnqKGrOy+xe2R3P
	kAqa0V2Mn1q/cgwOwlDF27rm6Pg5vVd/FJpA61bRbgTV5wjP6ldKshdSWqq2xbePkdVlakSGMox
	0=
X-Gm-Gg: ASbGncuJsSohMuCJJisjP+W8H+XlE+uC7C9oH7JN9uHJe75EIScJr3yGi95jQk9E3Jr
	mGvQq6HmrRX1LBH5WIHjYALc7HJ4ozoQVRadZTqErnd0KztKhTvcmEU4kaDjTg/a/7CmR9W78Cr
	n6FFTfbjJjzHJ1zSG7z4u4A7GdMWvUmMT2AXI+QDUvNO6Q85MBVMVPE+QQgHGnA+b4k+YSRgPgz
	bttoJtj5PwB5eXpgxdpJCKF/O5pJsiGX8YNU/n5gC626t4ioXaUHMzKu07pZISLvPstRojANU7L
	exg9lX+VWzikUTnxn1PVbob8datAK2my8b0ljaloQp2Fay7DqjUhTQuBjAfsFlzIvanHn+25QYM
	qrgo55u3SjNk7f5b3W2VdCDxato2IFDd+Xw==
X-Received: by 2002:a05:620a:4085:b0:85d:aabb:47d4 with SMTP id af79cd13be357-8b4ebc438d4mr964586685a.6.1764178829115;
        Wed, 26 Nov 2025 09:40:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG417jnmNWXAWdIRUdmzeTUa3tigqlN4NwGpHVGLuGH+RAKsdxFm+oamJUZ2Qjvp//ID20XHA==
X-Received: by 2002:a05:620a:4085:b0:85d:aabb:47d4 with SMTP id af79cd13be357-8b4ebc438d4mr964582085a.6.1764178828589;
        Wed, 26 Nov 2025 09:40:28 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fd8e54sm43226430f8f.40.2025.11.26.09.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 09:40:27 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 18:40:10 +0100
Subject: [PATCH v2 6/8] regulator: mt6358: Constify pointers to
 'regulator_desc' wrap struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-container-of-const-regulator-v2-6-7ad3408d6f29@oss.qualcomm.com>
References: <20251126-container-of-const-regulator-v2-0-7ad3408d6f29@oss.qualcomm.com>
In-Reply-To: <20251126-container-of-const-regulator-v2-0-7ad3408d6f29@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Samuel Kayode <samkay014@gmail.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, imx@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=984;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=F6pa/hBnZb7Gkzh+tLhiX1+7lOKGS/rRVschNyVww/Y=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpJzt/In1RckvHlGVJEYfhwVdbZbbsAIGgtydc7
 BD2Swj1fa+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaSc7fwAKCRDBN2bmhouD
 13fND/9pvcnMehA/jPpNTRYcpmfk9vKCGiew9Tj1EjZh1iFgSuHQz61oCY/3cku2nvA2KygTSJv
 dks9xOd4kSRomwUJ5Lw4b38aWjDVl3L4a1JC2STgffMgUcShdezfwua8SbYDDUqUTCcUdrnrTMS
 VqvDN/aX77y2U/nWvtMSMou11DGAAk9uOf9x/hOLPwCZHhNopxHNyFkABCqs1IiYGO/XKZOIHTt
 zko4CGv2e4ltSHtYwT3c4kA+ECtC7DBdAmxb2bJXlc1cONLCeNOs6855LpVXbholJBzmyexR5JI
 Pt+PoyIA94CptVwY5Et65kkiY+VS9E+45Fs/Wwlq40H+QvIXtg0zJ1bNL1UUyqDdQu7TyAwGMB0
 cW4JA3si3sz/Mv7uqb9ui+sm2q7SoEAo76rTGvEmBYrsb5UY8MqPD6er0AtiPKcrd6xZd3rWnLg
 23ecm6uDkbSrKyFZKr2Hgcq4LRRSism/TqnCKSGgFrfL2OwW5GsUVVijevacMry9emhgIyqrzZB
 WlCqZXeNI/IGl5j/d8veBNhmttzzrmBlijszFSN5Epw+mdViihypemE+JhC8sYqEMimZ2magKSo
 AJOfEY9Rro4TjyIineaslcIxixvSna5hlvu/mfWZJtQ/jEgGV6MzV5N+MVN6duxg+neqtONjzER
 eGV0zqMMcxVGXaQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: UTeqHN3BrC2el13yiQy3dERfhwBbOHYG
X-Authority-Analysis: v=2.4 cv=feqgCkQF c=1 sm=1 tr=0 ts=69273b8e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=FqRRrX31zAmjg7hXLkcA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: UTeqHN3BrC2el13yiQy3dERfhwBbOHYG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE0NCBTYWx0ZWRfX4YSqZFY5eKnK
 e1UJm/GsJnHEDDFN25ZODoZJQeYGPVubGt00wM0yrWn75Hz4pbsDo4r+xfXIb0/4Uf72UNlbEuR
 zFscopDKqaHvKs1bsbiyrzeLcjdKPFVOGItOio6rWdS3z6khM1pbVjOgI1DCN8ubP5YDVs/gTyF
 0P/2/EWMMLoefxXD/8AXmggBFPdbAszzEbqtlhzIGZWXBC1EvE5jfWgqHLHM7TsiXhcjo0lK1xs
 n/V4piXnO0xKf9NTUP+1qfXhOnfMBZv8jHwZ3xsDFvnfp/kkrukZ0MPtAIY/NstVT+gdfN2pnLI
 9MEDoKgA7L1ersbTMG+4VwMyDrxhB+rk0Dsg7JIT+Dtw28SySYYjkeTGCx/ZdIn+b7NNaVQTgop
 01eJE7RHFWNznLlNPWcCZ6yEhLCfoQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_164509_695243_2BC4FAAA 
X-CRM114-Status: GOOD (  14.87  )
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

Pointer to 'struct regulator_desc' is a pointer to const and the
wrapping structure (container) is not being modified, thus entire syntax
can be replaced to preferred and safer container_of_const().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/regulator/mt6358-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/mt6358-regulator.c b/drivers/regulator/mt6358-regulator.c
index e4745f616cea..2604f674be49 100644
--- a/drivers/regulator/mt6358-regulator.c
+++ b/drivers/regulator/mt6358-regulator.c
@@ -31,7 +31,7 @@ struct mt6358_regulator_info {
 	u32 modeset_mask;
 };
 
-#define to_regulator_info(x) container_of((x), struct mt6358_regulator_info, desc)
+#define to_regulator_info(x) container_of_const((x), struct mt6358_regulator_info, desc)
 
 #define MT6358_BUCK(match, vreg, supply, min, max, step,	\
 		    vosel_mask, _da_vsel_reg, _da_vsel_mask,	\

-- 
2.48.1


