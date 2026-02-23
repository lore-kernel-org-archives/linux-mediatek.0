Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE257E98DEF
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Feb 2026 07:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5YOJJ2aXA0BEB/msmbEifF3HLLVOcCnZaBxJ0rWPj8w=; b=GbNBtOzTn4Z9qpWoKh0Xds4P0M
	vWlXkPYhYi4Im8Uc04tnodigzVFBhWrVvRcVCBxPM4fBjgNtz4Hr+ML714LzbSmXwrcwp3wkwTfJk
	DgHM1+YUbkSlqWmAXRzqjM2b5NiL7eG9ydacv/RSwbPz1V+h2BsM77iCd1iCjDQNw2rFIQ5xiifH/
	3DOMc3FCJhecmBwCi7cxw8S/lZWxae1fyLfikrcgNgMX6b119EidIO9mNIpNt/HYJPofayET3M/0p
	1Ic3qldJgUnkVWOENpSgwOnGW0txwPGXSarpthQIsoq3mhX1D3r6fUz0pnyW7zRZFIiGt1J5fpSGQ
	N2GaRSeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuQMH-0000000HMik-3yT7;
	Mon, 23 Feb 2026 07:27:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuQMD-0000000HMdA-1ZH9
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Feb 2026 07:27:54 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MMt6hU2001244
	for <linux-mediatek@lists.infradead.org>; Mon, 23 Feb 2026 07:27:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5YOJJ2aXA0BEB/msmbEifF3HLLVOcCnZaBxJ0rWPj8w=; b=AhVNzKi/n41rbMtm
	bJgATnTFIfFxKfHJ5a4WVIV5+HHTe8orLjZ7KAno3WPsIvsPXCcEn6lo2+S69uzB
	M2i0Kicl8APo20JMse+4x4D9AOlSYN8ESi5rtS6g8AwrElhexSIzNnd7rsCcSu38
	ex4c2JICHfVu9jBgCqirckqKD6jq5Ip90iOgBaaVKYaqnj1c5UIh33bRuG6Ajz9O
	6qYpdE+1S8agq9pQd5h8IXySalWBph49742vem2av3piY5nbjVVHWDeQVRB9Nrgf
	af50ETrukk+Q6rR84ZOOLDmYYiCubub2e+koxbd0ph8cxUFh8xiBrg2UH8cueYWc
	Ssgmag==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wausa9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Mon, 23 Feb 2026 07:27:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70cff1da5so3389322085a.2
        for <linux-mediatek@lists.infradead.org>; Sun, 22 Feb 2026 23:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771831671; x=1772436471; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5YOJJ2aXA0BEB/msmbEifF3HLLVOcCnZaBxJ0rWPj8w=;
        b=bda/qJyE/tnDpMOn3hQUnFr4FzyiZElrsrstEzTIi48tdKW1EEOOZ0Sl7tpE3s9tae
         op3Jes5X09pH/j2b9i3HvF+ilWGoIEYkUFS7jOQ6F1O9g15Ujz8n5BUczrM8ddX1TZha
         lnHfqIkRS9i5nLlKqBNPXIPCeFwA7sLaQLGRTqO9FY8dYXvU/fdhNpz+G2W/0/HMM8Jt
         Qaf/v/NL8f2QmumS89eq4PQatitNbkrvLJAhQHmwUcPYHlUI28/zDZXXPjbs2FJ5quBY
         Xsoeqmu1UHr4AXNioScM1UH9MIvtMh9ZsvGM+Zi+BfNHD6c1JUIRo1V30BGsJnblz6Yt
         d16g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771831671; x=1772436471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5YOJJ2aXA0BEB/msmbEifF3HLLVOcCnZaBxJ0rWPj8w=;
        b=S9rMqDzwOQNxKbrIjfZVujJXaPhTLSlwSaO8riUE0OgdEtELdwnMBgYq0AN3QrW47c
         BtESa/ChIB94gCydnTqMbsjBAj3PorTSU0a2J7s19H8JJ3vmyecI2OMXyZb2PogbVC9w
         SOe35GYSTBfGiYsOYQpxpdEgU0QRoS7dTPRtmhHN9BfA0ATe+BE30qilBSZE9TllOypd
         VD5gz1wuv8LWnOxZ6Wd7wG0dBWPZSijvFAEinr8r2mpvEVgGshez/bxT/+TqL0dQLHQ4
         WSvPmmhFnPGVTI90YJFNowt1X3d7mJGcwEgYrUCIBzyKFjkWLo9yxodYLRhs62NLyu9L
         vrOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRjAEizgmfooxTW/nrtciXMpo0iGY63jWz5Njm4HclCWabwTiKsTrRnlFwDC+7zMhqb8ZQP4gGbU6EZcmxvQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyI2TAnPP2puAQIpjAqyw/vnZXrO5p+Y2QzUIpcvlnkXvVO1ZEs
	kbrEUfq1G8FLnsz0OE2F85q/Vhf8YhKrsBcrZdD6QYzRFcqyoF6juyOsXe0mk3GxM3wgjCeR8mk
	6UMzjl+Cl4dhRsr/om/7R9S/gS+e2TUXgBYpVlSbOqVBNvV1lcW1KGwbPQpgZs3/Y5VlG2kh6KE
	E=
X-Gm-Gg: AZuq6aKqfi8GHPA0pCkH3FbQRx5SLZN/YK8Oqk0S34y5rrZjLWnI4aBhRZY67lZ7oMc
	rk1hhCL7lyXBdHBsflyb+W2XDNLigTqHZBqOVmm6+NsQ9azfPNwOgfsmqvYN7+CM+6BNZHvIP9Z
	4qQdCiQu9B2rFL5PloQw0WtxZxU+aepjYrGo52uqbd3fnKw0tun6GsAQuEffaZ739ScrYyIBKID
	oZ21TkCig7vWRDMRSjNPif9DsIOuLSOFsBwz2/5uwzdujPqr/vvBjW+ShQ7bThpJyTMRpp7LGxM
	6cFcbucK53YxwjlVnUmHgOgyyTYx3BhLljDNIHYi5p+dvzPTWFbUd4xM1tw53Q7ONhlrnL6kGmM
	CDPU5rf9b4Aa/6kRSo260y8JvNqC427fEPbg2InemgM2cpw==
X-Received: by 2002:a05:620a:2994:b0:8c9:e98a:d9f1 with SMTP id af79cd13be357-8cb8c9fe5a6mr1011979885a.30.1771831671288;
        Sun, 22 Feb 2026 23:27:51 -0800 (PST)
X-Received: by 2002:a05:620a:2994:b0:8c9:e98a:d9f1 with SMTP id af79cd13be357-8cb8c9fe5a6mr1011974885a.30.1771831670712;
        Sun, 22 Feb 2026 23:27:50 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9ff5sm18550286f8f.4.2026.02.22.23.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 23:27:50 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 08:27:31 +0100
Subject: [PATCH 3/9] power: supply: max77705: Free allocated workqueue and
 fix removal order
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-workqueue-devm-v1-3-10b3a6087586@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3319;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=PuW7vlRiKBG5VvIHCjRT7mt2DV/SLWGdgcWu/vmtLTg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpnAFo/UKzNCc8KS1w39QKA5O4bC7woFna1QIAf
 BiaUZZ1gFmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZwBaAAKCRDBN2bmhouD
 1+EED/9RkN0mxPd4BItqsLJ3y1xwAvEJApbWLIpmsMJXLty2XG8gkwjO8hplcVmzFYS+iOGPsZj
 aPSAVj2pgSAUt12aoLw+ajNWfgCUzP7nsreSR3QFvNiFQf5rQ/wuCbRl2e6IlMc+i5McriHEnrd
 bn3OdqIahOkjSN2RSB24KS/ejjWMDLFu69ADWjuiFRRia+TILRWHGMqWjgawoOLvZPPHgMLEuuR
 zcuVoogWJCE3DW5Wti2+nzH1ufXTdWzHu3m37OrR1ddxunY7RYs9gqBHCDZrGf0DkJnEhBtfUW9
 0IRlqNW+vrhKw4ggkuAe6KpzRUXK+Vu4wuquJBbJDwOSErn90S6sv5DwZPwccOz6O5/2HUAEn4p
 75WRc4EDngZ6BirtmvZ6V6FON6OABNiwAQilzGnyrXz2wTf31hPLCPT8wyTsYkINffmY2/OY5Bf
 NB/DRkDRPUxLp+3wERhCwqCqB7+B7QAKjK2CjdfXDiRFJIsKn0Z/fyVxOdFCZiJwXQTos27zmFV
 tl2P4mW9+CyaKoH7bnw2IulsbIYWkicoDpPc4BlqaIt0iWInuAJMuVG748eqTphll4FFndqFk+o
 6ga4pYKmERVHVmgSCqopHYyvccnuvgznBMZst0XYRfruAygHMVgeyT0VFowKtI6dRsCoIncJh6b
 pQwLQ3EyvLfqsXg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=KJVXzVFo c=1 sm=1 tr=0 ts=699c0178 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=NrNmjpoQ7DW6B6PU5UcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA2NCBTYWx0ZWRfX6NN/Q9YdspyO
 TofI/1yVdiLyk0kG+eTZB2JfMZcH6T9TjMv0ccxUAShputHMdyX37C+d2wH6IcSoQxsdIuQP8XP
 jG8/auWaav/H10Qiw5m7Z50TGVSV5wyX277dhalFTdhP49mIkzaFaV51yDMQhck/72ic8kkZoId
 bWe86qpX6ARvjMdJ7fiN8s5LGeMXjB8yBPyJFqbjy5A2MIxUO+3CYKsEKkQ33K0MWA0brbeIOTW
 5ayJ6jj/dL4OE8z4Tf2OkerHL9DA/roTvtS6cJAgQKpG1lPrhF+2s/or3a6vYC2l/B1DAnWCtpm
 9eBOcwTqDO/Dk34qgeTHJExy11vQDZrn3BuQkgJDk8NrKHbchEl7HwOABYsbjUzAkbNCRwQq+5R
 IZ0QL/OagAF96EjTc/yB9hzSTp+fs9jJGU6/9hhEJOxC+2oTEjlfvmfIC07IjpyujLE+XHnbSK2
 SjSA7aTuAfdjnksR4xA==
X-Proofpoint-ORIG-GUID: q6ZSTPf2xcvx6PcmbB2k4-8In-yMGJoe
X-Proofpoint-GUID: q6ZSTPf2xcvx6PcmbB2k4-8In-yMGJoe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_232753_511321_DBDE15F9 
X-CRM114-Status: GOOD (  16.62  )
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

Use devm interface for allocating workqueue to fix two bugs at the same
time:

1. Driver leaks the memory on remove(), because the workqueue is not
   destroyed.

2. Driver allocates workqueue and then registers interrupt handlers
   with devm interface.  This means that probe error paths will not use a
   reversed order, but first the destroy workqueue and then, via devm
   release handlers, free the interrupt.

   The interrupt handler schedules work on this exact workqueue, thus if
   interrupt is hit in this short time window - after destroying
   workqueue, but before devm() frees the interrupt, the work scheduling
   will lead to use of freed memory.

Fixes: 11741b8e382d ("power: supply: max77705: Fix workqueue error handling in probe")
Fixes: a6a494c8e3ce ("power: supply: max77705: Add charger driver for Maxim 77705")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/power/supply/max77705_charger.c | 36 ++++++++++-----------------------
 1 file changed, 11 insertions(+), 25 deletions(-)

diff --git a/drivers/power/supply/max77705_charger.c b/drivers/power/supply/max77705_charger.c
index 5dd02f658f5b..de12c215366c 100644
--- a/drivers/power/supply/max77705_charger.c
+++ b/drivers/power/supply/max77705_charger.c
@@ -646,51 +646,37 @@ static int max77705_charger_probe(struct i2c_client *i2c)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to add irq chip\n");
 
-	chg->wqueue = create_singlethread_workqueue(dev_name(dev));
+	chg->wqueue = devm_create_singlethread_workqueue(dev, dev_name(dev));
 	if (!chg->wqueue)
 		return -ENOMEM;
 
 	ret = devm_work_autocancel(dev, &chg->chgin_work, max77705_chgin_isr_work);
-	if (ret) {
-		dev_err_probe(dev, ret, "failed to initialize interrupt work\n");
-		goto destroy_wq;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to initialize interrupt work\n");
 
 	ret = max77705_charger_initialize(chg);
-	if (ret) {
-		dev_err_probe(dev, ret, "failed to initialize charger IC\n");
-		goto destroy_wq;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to initialize charger IC\n");
 
 	ret = devm_request_threaded_irq(dev, regmap_irq_get_virq(irq_data, MAX77705_CHGIN_I),
 					NULL, max77705_chgin_irq,
 					IRQF_TRIGGER_NONE,
 					"chgin-irq", chg);
-	if (ret) {
-		dev_err_probe(dev, ret, "Failed to Request chgin IRQ\n");
-		goto destroy_wq;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to Request chgin IRQ\n");
 
 	ret = devm_request_threaded_irq(dev, regmap_irq_get_virq(irq_data, MAX77705_AICL_I),
 					NULL, max77705_aicl_irq,
 					IRQF_TRIGGER_NONE,
 					"aicl-irq", chg);
-	if (ret) {
-		dev_err_probe(dev, ret, "Failed to Request aicl IRQ\n");
-		goto destroy_wq;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to Request aicl IRQ\n");
 
 	ret = max77705_charger_enable(chg);
-	if (ret) {
-		dev_err_probe(dev, ret, "failed to enable charge\n");
-		goto destroy_wq;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable charge\n");
 
 	return devm_add_action_or_reset(dev, max77705_charger_disable, chg);
-
-destroy_wq:
-	destroy_workqueue(chg->wqueue);
-	return ret;
 }
 
 static const struct of_device_id max77705_charger_of_match[] = {

-- 
2.51.0


