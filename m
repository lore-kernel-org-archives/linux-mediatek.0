Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCFB8E98DF9
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Feb 2026 07:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EKvU/PNxjAddR2yAhFrCBL4lcj3bDh4g/P+pXxlhagQ=; b=avR9hu6TuUoa4Qissaqb87Xq2a
	SM5BBgz+S/8E9ZIocq+I9B1lA6pUNAgoMJ/asHlwAfdyRw1V3qOll1DQrxUhlGRNpmwPpCDT+0SIy
	536Zb9WyWyB3WX8a745MKan4W1xjKGlmPpnx7c61cQ4ZMGohPPUrRIENLCqTuL9ddKwu7c+4/dVEy
	8jjmLuOVf4UGjGsqaYk79jHGhbHL3Pt3oiGX08Vs4ifKY1dTKvI8qxp5YgRZMeqi99kqgSw4o3pvf
	pjjBkPWJNHO9ZxzkrN+Y25+4CuXsiICUw7anN7ozznJWy+42Tpfj7LjKxzJeHUeWEKxTZJkmx6ZBe
	sooeI+TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuQMP-0000000HMtu-3pJ6;
	Mon, 23 Feb 2026 07:28:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuQMK-0000000HMlp-2pof
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Feb 2026 07:28:01 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MHAqD31060334
	for <linux-mediatek@lists.infradead.org>; Mon, 23 Feb 2026 07:27:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EKvU/PNxjAddR2yAhFrCBL4lcj3bDh4g/P+pXxlhagQ=; b=imRR7dQaLra0EmG/
	CLVgZzMTSjtFjvJGWsatrgZAxI4+8sXNgtBdn1m6ntzrKLeq9IoCDcJaD4E3psOG
	6JiFR1sLUNsl4jhyyPcb2jMWdYLw+O8Gba1KrBolfaV1Mxvk3w136p/s1b+JzTPk
	AU5y09iTzyUYHqPbbUQ2ARe3wymQutpxvg8ec6ZSR6cIjR5XtsDFRnYwDPw4WWF6
	5PwoXLBgw9oEHZYTw3BPH/V0UYAFGm340rZH25TN2XM+1m4fs5jNEDnrv4D7ISBZ
	D17OfkIqZG7l1taNVj1/E6iThifPdwIKFpB3KgEO4A53amQh1OXpdj2h1s2fNJMU
	fhRdHA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5u9uses-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Mon, 23 Feb 2026 07:27:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb3ff05c73so4064454385a.0
        for <linux-mediatek@lists.infradead.org>; Sun, 22 Feb 2026 23:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771831679; x=1772436479; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EKvU/PNxjAddR2yAhFrCBL4lcj3bDh4g/P+pXxlhagQ=;
        b=fxf8Bn5Q+u2VWKNxQgGJ3LdMYGEBS93DetFbDHYswPdYLbeMM6wIkfFQGH4Zww3nJ3
         fhaFRu2AHCoSXxVTtEHkklLmCzJWSggMZACaiKDYVxJuAyqvJi2rBTiMM1HO2OKdzdw1
         D//ewrP8csT7yM5WYnu4hXNH59/98LgSRS2XLFMar1dS7v1+Jk0B3DoO4zGRR2+NdVN4
         jFrNtGUG/M/hVz6KqoKf0fIqrDdY7BexPR6tvBqXBGNcesS1l8ZZCIBSCuFMMGwAw5XW
         vdX2LId0FXqGmPRnYt9W3ruu4B0FVq6SW8zE9VjydOnLJL6kZ3gVkfaiGy+rdFXXsU4d
         eJCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771831679; x=1772436479;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EKvU/PNxjAddR2yAhFrCBL4lcj3bDh4g/P+pXxlhagQ=;
        b=jITBhA5JiYymCwwo6LfGOxbVzq2K9QhL05DDYYjhxSYq0d+EUZ2zcfq7wONVGDEkUE
         33HNij1HfBO0DQkkWCZkW66KNNUyYX61IUVu4bVasJr293FC61K1RjOsJn2SaXOntsWU
         Vk82laaiDWHBa540HJywF3A49jiqWPcwNGbdgWkiEQaY7rrYK4yo/MlAjtFsnAhO1VwQ
         +PlxtWaf0PWlqfEQLquGjj4588HDBxH8CMlgpFwD1kL08y7uzI6TELhtwYeOH0cmhoqj
         Oz9ggG3US6ZIsKwZ6fvn5ct7FMjNaLL7d93LGFf1w7nIQh8yUxH3DjOBWRdCmFUN26tE
         6INw==
X-Forwarded-Encrypted: i=1; AJvYcCUt1rLPINB3WOfLhCj0TTBchf80nNU4VCerQZvCZmBXYaWgUPdgjgRFQNFNsVvgW++8FXAR/1tYK0JVtf10Xw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxKVSUwp70Kqv7BoLeO+xHxU2xWfS43V6FNw6dFKJctuUnNX7+B
	EHOtwPjGjgBfuQyMOM9pUFT5OjAyOOz0kVfrMAQK/1EcsXEAacLH81Oc8vh/XS+g2twOGD/0rEU
	4V2GC0AckloVXELOpEV0XfAREMSujAFjgwU0I0LghPsS2smtY4dBOv/sEjzZFZ3JO5AZgWsD3uo
	JolVXKGyM=
X-Gm-Gg: AZuq6aLUlhYxx8VQpE6R73kpj0lgoT3sqVMJhg8697dZst1MBHhrZn4PMVvOY+U/huq
	sf3t4ZzLCi4lr6V1Bykk1DeGGFOVvIBmnLB7EUJ21gl5HPWidO4Y/zQEcMH82FDVmI1nPXwCMIk
	Xy7xcEx1JVP9JZm5ZujfqMhQpu+T3BNCGvY42pqhkZNDai6MdtqRSBPboPwJrc/Pr3eZKZKKyZ7
	OVGE7hSZgnw1Zzh8KYyBIhKDeSydwhLiCFMKqCLqlplu6eYY6Ns/Vh1cWT8GW+2BOi9ABiPGvfY
	dh/RPsRPAOBM9wf7aJcmyDgAq3KVTFB2emTloBIJc1khIgZa4pANo9fUzTsAfPj7/3xFg+VUjpM
	WHSP9TRyn81hXQeMXaYLK5C96fJ032jHq6B3HQ8bArO/jHA==
X-Received: by 2002:a05:620a:bc6:b0:8c2:3f3b:dae8 with SMTP id af79cd13be357-8cb8ca02729mr953886785a.24.1771831678582;
        Sun, 22 Feb 2026 23:27:58 -0800 (PST)
X-Received: by 2002:a05:620a:bc6:b0:8c2:3f3b:dae8 with SMTP id af79cd13be357-8cb8ca02729mr953885685a.24.1771831678191;
        Sun, 22 Feb 2026 23:27:58 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9ff5sm18550286f8f.4.2026.02.22.23.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 23:27:57 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 08:27:35 +0100
Subject: [PATCH 7/9] mfd: ezx-pcap: Return directly instead of empty gotos
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-workqueue-devm-v1-7-10b3a6087586@oss.qualcomm.com>
References: <20260223-workqueue-devm-v1-0-10b3a6087586@oss.qualcomm.com>
In-Reply-To: <20260223-workqueue-devm-v1-0-10b3a6087586@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Tejun Heo <tj@kernel.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Tobias Schrammm <t.schramm@manjaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>,
        Dzmitry Sankouski <dsankouski@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: driver-core@lists.linux.dev, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1584;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ESdCsaeIum29ouwuVQycaCeiYY4yOvrSCQxsV5yQYpU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpnAFsdVOSZjLWU15fu6tXhkyH5o/JBZijmD+7F
 xJuktpOs16JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZwBbAAKCRDBN2bmhouD
 11hqEACQeJWBcnOA0HqzOwEkeI7B9TgL3mN+MiZFvfd+qLHOhNAN5GPqKlAoYXkpu+ggDO0qWz9
 oYB5wpEIyViQz6F7P1BbSk7JDPJNPXtSO8eCIPGH1pBauIFXYzYhV8mSvy5NBR7mEMYSKKu6Ki5
 c2HHxYRYV34xSMpIrhaZh8QRVvQF+02ORACguJKiqALZysCqUV7Lssv6LmOneLzlHwOmppCNJ2o
 TB7ZxS4wPCl6edlbVzZrMMFQ1y+DfwdvIux3JU9oT1PriOQ+M1ocC9uh319Y9tCqJGVUBStU4+p
 SMFlYLPr0BTBAPNFFombh5ZS68gj4DqMJ6Unb/ZrUU/4jkXJNA681W6H59pOUOXo8QIziJ7gdHL
 yLif6Cex6xL/Ap+5oN2poWDdGsdcuj15yxkdz5lyJyRdBSslo4p7EGLMPzdeqY79LEwoqKafjAa
 vU3CpssLcVilmqPFQ3SZBwFW06aflTmZkGUbBUB/mUUo7I8VTS3SdhS635sblTp41z5mhW/xy0r
 vvKapnIZlD9rOw5Xxg19beyLy37OW1z/5cm0mAYucel1XB/13lDUq0v86dixoHMc1KA1qdQC67y
 qsmaAQwI4e7mlF47O+yr/jaCE6/Z8x6wiysP1jZxhoPdIGKyBILkDL/5cNMwz7/FT78JNlj7SK0
 pLo5wqw2dA4WDpg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA2NCBTYWx0ZWRfX4lD0ZWDbn/Uo
 aWFo/nCw4gBlNb8MtkJ6ICP/D86QNRWEzHvd+TBz/9/uxn5cLSkPKQOAeqfK0vMERtl88W/qSk6
 fhK5uDGUNvyLrhzveEi6BF2jMAg7NaNXJPqINutL5Zh1Xx/lyKfMlajSEmYQimMDTiMljV6QgGC
 fk0i4oBp/n0/9ZrBZdQBHjRypMNoTfBf8VEveswLJREJraGIrGht1K7KjCcYdeA+MB6lX17mclN
 s6Uj3+9XXj2Vha886u2SGL1ShHm/bEXlQVMEmYRuKKoqLIjwkHbb2ONdXUxDdkHuYFTl3a0epxE
 gwNIBA9Yo9bMcjGk7yBXjjG2W7fa9nzJ2ZSPyG6WI1/SBkZVxpe3Nf6owHE59Ue3p6xoSKo4u8J
 A1NQkqoEVLlMdTYxHjGD8OVLQtqeEznawSk8GBg8yI5hXB9k7dofME2Q76sAlEKreYpWICkItAF
 o+07FXD7/8OcYAUi8ow==
X-Proofpoint-GUID: ZGH7gylhzaZvnSvpdQG11kkKmF0S94JF
X-Proofpoint-ORIG-GUID: ZGH7gylhzaZvnSvpdQG11kkKmF0S94JF
X-Authority-Analysis: v=2.4 cv=RpDI7SmK c=1 sm=1 tr=0 ts=699c017f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VGyNsPSQNFFz0_f43M8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_232800_845373_E432AD09 
X-CRM114-Status: GOOD (  16.35  )
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

Code is easier to read if empty error paths simply return, instead of
jumping to empty label doing only "return ret".

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/mfd/ezx-pcap.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/mfd/ezx-pcap.c b/drivers/mfd/ezx-pcap.c
index 13cb185638a9..b929559d84ae 100644
--- a/drivers/mfd/ezx-pcap.c
+++ b/drivers/mfd/ezx-pcap.c
@@ -384,17 +384,15 @@ static int ezx_pcap_probe(struct spi_device *spi)
 	struct pcap_platform_data *pdata = dev_get_platdata(&spi->dev);
 	struct pcap_chip *pcap;
 	int i, adc_irq;
-	int ret = -ENODEV;
+	int ret;
 
 	/* platform data is required */
 	if (!pdata)
-		goto ret;
+		return -ENODEV;
 
 	pcap = devm_kzalloc(&spi->dev, sizeof(*pcap), GFP_KERNEL);
-	if (!pcap) {
-		ret = -ENOMEM;
-		goto ret;
-	}
+	if (!pcap)
+		return -ENOMEM;
 
 	spin_lock_init(&pcap->io_lock);
 	spin_lock_init(&pcap->adc_lock);
@@ -407,17 +405,15 @@ static int ezx_pcap_probe(struct spi_device *spi)
 	spi->mode = SPI_MODE_0 | (pdata->config & PCAP_CS_AH ? SPI_CS_HIGH : 0);
 	ret = spi_setup(spi);
 	if (ret)
-		goto ret;
+		return ret;
 
 	pcap->spi = spi;
 
 	/* setup irq */
 	pcap->irq_base = pdata->irq_base;
 	pcap->workqueue = create_singlethread_workqueue("pcapd");
-	if (!pcap->workqueue) {
-		ret = -ENOMEM;
-		goto ret;
-	}
+	if (!pcap->workqueue)
+		return -ENOMEM;
 
 	/* redirect interrupts to AP, except adcdone2 */
 	if (!(pdata->config & PCAP_SECOND_PORT))

-- 
2.51.0


