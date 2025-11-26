Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD925D1118A
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Nov 2025 16:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yuBdo4Df7AcVAGzqPD11S2PZNb+g82HKKFiS0s50Rho=; b=a6M1uhhYtiS/kfncA3lSJ7krVr
	ZhKQB89FpwSeQOrReeJy0f+qeTanRgyN/rgYc2IDnBx+gK/Rh/YSMkgdt7oRFBQmnvcFSXoxNX/4L
	rb4HRrE1kVg3Xh71TjrngIBylwnxyvUHwxdH9NzDCpliOqZXTNrB1nsM2vTByZK+Ag4O8Xc2LRrD8
	J6G8TePrMT74WSBEqiBDhN6xWmARVDYJ387DA+8GtcnnvkzfuQN5RtQSENv53DGJB901XGBKZNLN1
	C9dMC7gssavgoDkqO8EcaRj3UBVhR9mjkfF2XJscbJpKWrbQMTsTsscXm1WzF4orcvJu805Vj2Htb
	L878GVXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIrY-0000000FLQT-2Rdt;
	Wed, 26 Nov 2025 16:59:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIrR-0000000FLIe-20BZ
	for linux-mediatek@bombadil.infradead.org;
	Wed, 26 Nov 2025 16:59:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=yuBdo4Df7AcVAGzqPD11S2PZNb+g82HKKFiS0s50Rho=; b=Ef3z7u8XUF9IPHlK6ydMUppNFa
	4XN2RIPf7jgwPx0Y73Qxs8pmPnCpYmEksDf2LteDkv2jFywjIKH//be+bNoeymrL5QhiW8Oo8IazN
	K3U0rms1JSEcIAn/XOjYNxDz+M2bYpfkZ6zrdIUsKfmEMmVrka8WB81az/1mtQCcw0xLlHTuwDXfR
	r6R2Vrn3us9ApokdXbXBajptDVuBa1ddR0SP+FeXCi+6ExAQARpMRvWwP0bbLWYziGCA0QYOVWos5
	VSgG7YDhruh9mthE/+mILWmd5ll3Hj6MsPK7rCTpr4FUSkM9ZFDVnUVSTPnZesG6gyyUXniW7f4fv
	gSqQQeYQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOHzn-00000008S6W-3skr
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Nov 2025 16:03:57 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQBNXbx1849220
	for <linux-mediatek@lists.infradead.org>; Wed, 26 Nov 2025 16:59:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yuBdo4Df7AcVAGzqPD11S2PZNb+g82HKKFiS0s50Rho=; b=bE7ZJFbieUXASyQ/
	uZbq3dFeXJysBXbv1yZvE+5yJi1LHWQPYNn0rGmzlUxg6xY34f/osbFiYQRcdNhb
	XvXl9n8X8Cs4yTR8YmOmJFwXb99oAmAf8QJ0rKxtgnrMxLziU7YKILVov4/xEXyw
	SAzzHVzn74aK4rOAXiTFqjkTMMhwpBgNOJ497bth49kkJc77Y3iU1V7Ao9ocP0oQ
	jGfimarR6qq4sd/2PpBSjJDQFRPZnJGG82J+AY+tmDQ0n6XJ6/9naHi70MqIuW/h
	YJ8RU1aKMCDU3wrDtoJ9ge6Q8bX6iJ9f+RFUvmeLuNCW/d+TR94Bb70pfdOlbCv1
	8E7qWQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap0msrxey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 26 Nov 2025 16:59:16 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8804b9afe30so217343196d6.0
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Nov 2025 08:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764176356; x=1764781156; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yuBdo4Df7AcVAGzqPD11S2PZNb+g82HKKFiS0s50Rho=;
        b=GhLBsWdEcOSWsE0f/yAyxesnM5nbNBHnr2YXds7t3yiWF5UVdTZ5BAXtOkbmnQplbQ
         81AGwti4Qdz4TmT8sYxzTArSegZHeIQ6htk8gg++o1WpcNz76580i5uyvtbglAjyFbRT
         anXXEHUILc6Ud2YkgzZGlg79KgcLwzUrHl90uS2rZXQStgZsm2Ir8xoj+cLEoe4PCNSG
         7wMOQLNYfMGshNqNinYSFYUELZSSqKzR7k92+VuM7QxZ6OI7t5B9lquBNrtASdNCkFFR
         54xTM+tUD+IQ3nhcDmX3mOcrWt3AcgjFaNxfnvXvOAkDNSdQbSN7V9Bdr/K2Ajl6wdoi
         7a2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764176356; x=1764781156;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yuBdo4Df7AcVAGzqPD11S2PZNb+g82HKKFiS0s50Rho=;
        b=M/1pdBJ13sHoybBjSkc11VADWKu3dym42sIWzxwjfeAZo66f5uYIh5Bw73PnbNij0H
         XO/GSMYbJcjFvjhqzSpein0jTCbm53d82AsWLvFflg5A1STD/mozHsArg+9DhKzJAFw/
         1fRDnxbKdJ1MTNAlRT+JTgddy39uOIjehlbPPS+dJUpd2YpUYYfkdm7m4Ex1Wf1lvEzn
         DMavM2I/kMn/uknHLs8wttLAgKtB+gTA1kSD97RtJVMpyhNHPkZYxpqIlRKq2qsET7Ts
         qhzvhEeaXTM98pm7EoHqZyMWSoWUILQk3Hd6jY+XDM2rpcF2Lfh/M6FwYLO5Kq0FOHin
         NP0g==
X-Forwarded-Encrypted: i=1; AJvYcCWspVrLjEpVmNsXvtzpH62J1KV9WLXpb6I8XwSWNcko/bdN9yGsezNwJ6AQ00XkmaNoOINstC3FMp+7duSXzg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3wTohlUnsC4uWbPxGAfPCAyyUTzREZuZi4JI6RZVXpfKciJOE
	FLAG7q3647ABmM/bdEmjCJOiLa6/gowSi/Q/2kV1RnMos9EHi8JDNMk+gjVlmgd43KDsREmduOJ
	r5QOyCdsJ2QTqqXEFApYwCPqn0F9o/iOle2ObAS9VEfh2RCDTU/6Ee+wMlgfsC2lKzpFPM8QqZ8
	k=
X-Gm-Gg: ASbGncsfG28xjYc6lfEQvXbYmF6saYCa3pYqfyV//h4TJLZYNxb6YwvHec0z3PcifPt
	HMejOd+dBB5k3UG/yoXQoXtcL5bqo3N83yipI1FUvBaWgGwgWVXFlsevVs+NPmu4TQRIpcE4w5M
	XHD2DgHBQVAC/mRDQWOH2OcI9DAZVPK2F1Qc1cLjDxvuLKflduHEPlCDoEULb0bRssyll8fBke7
	hkugGLG6rxV4nbuRgTHoT8WDLSQ2f4BRutcFLrUb5hJOOq3d9Pkul5Fh4Ed7bN7vqfotwc0af5t
	oWHa6QQPFwJ6z17/xWbTCZJKbnH68Wv7abyACV1Fw5464qjl7SNGdztOz79vmujKt2+IgNIUbjY
	sQoCEgU5ZXtYKT2Ab/WmiZ5JhujJ2x3R6rA==
X-Received: by 2002:a05:622a:d5:b0:4ee:19ba:d778 with SMTP id d75a77b69052e-4ee58ad46f4mr280143611cf.48.1764176355730;
        Wed, 26 Nov 2025 08:59:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFbl8mU5pugMLdfQ2QpKnpUut5p5RybtVnYi8n3iBTFPdWBvXLbhyoNwExNjjmB+G67NM+G6A==
X-Received: by 2002:a05:622a:d5:b0:4ee:19ba:d778 with SMTP id d75a77b69052e-4ee58ad46f4mr280143281cf.48.1764176355354;
        Wed, 26 Nov 2025 08:59:15 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fa3a81sm42398811f8f.26.2025.11.26.08.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 08:59:14 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 17:58:49 +0100
Subject: [PATCH 6/8] regulator: mt6358: Constify pointers to
 'regulator_desc' wrap struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-container-of-const-regulator-v1-6-eeec378144d4@oss.qualcomm.com>
References: <20251126-container-of-const-regulator-v1-0-eeec378144d4@oss.qualcomm.com>
In-Reply-To: <20251126-container-of-const-regulator-v1-0-eeec378144d4@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpJzHWHMmqetzJbHOIwek+/YS2OOoLxtr/oKpGB
 iWlpMG8/oqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaScx1gAKCRDBN2bmhouD
 19srD/0edvT0P4QY5aFENvleQKhfKFBzcXVW7mxUBamOidpj2W8rqPGlganIzFaJIxpw2amT2jQ
 oYZbmj1prpf5k0tFTG56IPoA/NM14p8E56OU6+7ySCBjXrhTOFJF8pkr4do4yP/IagOym3WD86a
 z44teVg/DW8X7ZsY9OPkl8bGjm/TtzwIGVZrJ2K+xcsnjVkgR475lTmuhCM9x/2X+YAZFpCnfqE
 xz8dSLFLyM46GMVKACPpOmS0u1diRcpMiLMi2ntKgPGD2trF8IsPb3z2g6W+kQf2c73i0ovRGF0
 IuIRYDDvVX+INcGMAi0d4bqJFjDwpSi8Vqnx9oIg2P/+xHZNnfRMliYMbkUbAbbMmu9tRLkx8OM
 w9EjZ9S5Pnxkp0kSXfrvFyl7ARPntdCnO6pPeiQQUbj+zMC9CjEUchoTYSmdNDE1G0bH8dqwWlb
 nFN0a/zNX8jGppMwl40TkZbd9Wr3sjCbg+yticeWXJnF/Y2tXyd48AoY86dDju/jV4Ce2/j4udj
 1xQRzSRPFUW3v4RCZdUjQXAV+Bm0CNBLtUV/MoVGRunG+K0PP3iaKjM/Ac7gT9+psYRAlGpJhDI
 tKF1tyxj7nD+ONz9HthhboQbSelL6h8ck9qO7zhpeBnt/nWv9ruTiIZPwSlrdXPdgy9K3vm2BAu
 am4OI+eGYdNuThQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: 9puC5QN-lh0bK--9HILXapoimWjV0K4k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDEzOCBTYWx0ZWRfX15aynDcpCtnr
 Hbv7uylwflL0lHEuasUjbvHdKaPjIAj4Esw6hDkW+GM01PZV81uZtYlt1ghTWyAItbYmMb0kJks
 elBRoNDVbPQ83pZmO3GCjr72GTGWZzyAIsPD5NirqSVD4PmMmdtkdyxBUBQ7ipHAoWASKJS7F+A
 7QRh0Jfz07h4FMStkVwAYapl9Ggq2MiLRUYfLAfnNqaNoLlMJylueu3r/EFp1/VLLozu/Mij9ZG
 UCLV4fvPpTYepeAWQyAAxW7s0hyhThBzczp6eZtjOLZu/TVI4sEehEr09Z6irYZulF2krUtFgTF
 o4Uc3mQoFxUVT1BR0wk+0IliGYiwWoH26aNKT77t2wHPpIzwc0IksYn1Wip8oM33c6rfL8PHF71
 b/llbPuWMWmKvFBlPlYmLL47AwFvtA==
X-Authority-Analysis: v=2.4 cv=N5Qk1m9B c=1 sm=1 tr=0 ts=692731e4 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=FqRRrX31zAmjg7hXLkcA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: 9puC5QN-lh0bK--9HILXapoimWjV0K4k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 clxscore=1011 bulkscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_160356_333336_C0E658F2 
X-CRM114-Status: GOOD (  14.47  )
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


