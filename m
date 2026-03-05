Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24672F513E3
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Mar 2026 21:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pgZIxx9eLQfleV3COI3H9DXbp3fax2/aDjoFoxNcevs=; b=yJwGM2n0Wh8HThuQry5eE7OPrB
	Fi6Xzd+dSuCY1Par2TuQQk9G+7UZqR8Wmq5BqBe2wNLkCRxutMKsGPXR5tX1vwRXFywrcmoTPtyPE
	vY8evRg+YwNFypi2zg5P2+YGyFvTdygQHiSNf6fIObP7trkuIX7k639HA1HwI/yKrZs73Ko0kUDtC
	ElJFwz0Nz+Xj6AIQl8iy8LmW4YTOi+km0/LoEVT1+17+KFbEktf1zE/QocWen/rmaEzuTdud1BhCB
	AFcKSr0cmmoQ766gDl9QnwDTZD/7lMpJadjHDpGjWCEql3WkpdHanvRmvriXAnLgXuFYr2qRqzM0W
	0+baRk0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyGWs-00000002baq-2YGZ;
	Thu, 05 Mar 2026 21:46:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyGWn-00000002bSS-3lrr
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Mar 2026 21:46:43 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625KnNRX1492526
	for <linux-mediatek@lists.infradead.org>; Thu, 5 Mar 2026 21:46:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pgZIxx9eLQfleV3COI3H9DXbp3fax2/aDjoFoxNcevs=; b=bvnfZbaaoSTnNtHJ
	QLu3/Je1kxQ2NwEeQVij7O2D+9K1jEBlNqTe7grsTCNYOGAuAFRocrNLDemddCp+
	Brczs2v4ky3Pzpq7muaILKAVG6pTtyalgnmT3S1DUowfPFQJ4RZhwmtKxUFKPvqa
	QAKPMwPTSE7joWXqNnYLCYZjwGydwEsJBakCtU8ayRP3foURvgKRM0pAAHf9DZBQ
	/E+3mKo+18ProDWtpfS3nFk3garSSlTFjVKU/3Zv6adS42u6pekPj33QYBrQMTMc
	yIYg6wMPkER/m+2G2NCIONv31IYeS4v4V96I6mxI7g2OmpuX4br73S0vmBBDK7WN
	5uQ9ZQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq84wa40g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Thu, 05 Mar 2026 21:46:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c71655aa11so7048640785a.3
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Mar 2026 13:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772747200; x=1773352000; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pgZIxx9eLQfleV3COI3H9DXbp3fax2/aDjoFoxNcevs=;
        b=VZcDVRfj7AHJJUAg+/qC6Wdl09ls01JIcfp7JdjFj+x6zCoif3dyJPe3iXcgQYKRNF
         jYyPDFCDts/5UaJ67f1ElpzijvzY07foATiaJ1wyqm/QSNsqNNw4wnUDndiZq+k9AoIq
         gbupRUh7UXNI2PyREUPpf2r7wRWu6qJrcdRgSyd9wT7VmOhXdsgV1ipyjJsBq4dojtR+
         6nvHTMG2L/iiDWspZJPg3K0vR9hYzWES5UJ5CkE+CtX5UpPnMORyfiZSQ0qsuEg4inOx
         G/LjEloez6IkwrgVKjdkubfJixL3RB8uOpUTE9O4mJAKplKcNY/xBeOk+alAbHm9/Aqb
         Jr3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772747200; x=1773352000;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pgZIxx9eLQfleV3COI3H9DXbp3fax2/aDjoFoxNcevs=;
        b=hQ+CBj7O/BYLWtHKt/voSF37owwrCCCOIq6i44zfjKwLVk2T0RgZcCapP7VIyxjp7O
         yapmWDrJirYUdSpQcKjOvTa54U6SNJzzR3yYOhjWZgFqY8UtcYyFaxkpnjtUl5SRePE4
         JZUCHSa/6Doqm+GXUOelhnmq+J/vQbY+eXBicaa0JKNXdIvEnabdUmJUeqci39rPTG9H
         95QoLaeJKI3+BeLiZlrA0pisjHl+LBpysmhiMG3667YAF/eA0+nESPhKqfWRWRnFq9MO
         PZRjbi5v5+yjE4jfwrC2X/cwqrrpP2TEFJEbjLrh5sx8pDlpcwr4bpf38UrE8SyFVSEz
         sFzw==
X-Forwarded-Encrypted: i=1; AJvYcCUvEx0Wf7TivhZCO/iR8iu39e+F3c/CF3jBcE1VLfXeBq2EBWqmc7xB/2Pf6Xa60KkC1Znp6OI7xZ3zAu94gw==@lists.infradead.org
X-Gm-Message-State: AOJu0YysFozjllsFpogipt9ZueG3++YeGpcUgPgtrSuSyEfLTILL+fw2
	Av03p/LfD/5JGK79ozZ2OCzeOPHCdIygJiHQBzm/hoyI96hVPzm9d+490/k+V4lG1Kr71U9S65n
	ZeTwuQLg0naNDwxru9WmyjrE5FH/PTPRUGOpn3S4AZao4mMJocTc0y2UXrOAQ8pxgl8Srnp93Js
	w=
X-Gm-Gg: ATEYQzxaSP2PDhvh36IbXKFzB5SQSJx4mqM6Tb88ogvCmee1P8CyBz10rLjfHnxbRop
	+XsBhVIZ8R7d2r6DPKhFi9EQSum0FRhaZUdchZftdo27BOOHhRx6qe53hV4eG7uKmVjTDf2znK1
	vbAPIq6Y77ElFWTPd526Wr6vETlVDEsKEGExJxGAdFuJLexB/b823Xh3yBqbjuZ+PUSP9dGs2q2
	5dDqRJHa82ERbgzHh+QcYZATrl+NjvKXetRFKjIJA3RjawEH7JoRi+UfZNoKbm4vRUaCEcomn2v
	Z8sD00JYshFzRKiJL59vsJA/9VkS+SVHFV1RKOoxuXbzdv9EMv0UkmPvclZDv2TcG8ashLl0TLv
	7XQSd+QjHQG5WB/oMjPwy6/165GvELEviOTVmRzEpfIRb
X-Received: by 2002:a05:620a:7016:b0:8ca:4288:b168 with SMTP id af79cd13be357-8cd6d437779mr3215785a.42.1772747200184;
        Thu, 05 Mar 2026 13:46:40 -0800 (PST)
X-Received: by 2002:a05:620a:7016:b0:8ca:4288:b168 with SMTP id af79cd13be357-8cd6d437779mr3212985a.42.1772747199687;
        Thu, 05 Mar 2026 13:46:39 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439ba2a58dasm28571575f8f.27.2026.03.05.13.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 13:46:38 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 22:45:49 +0100
Subject: [PATCH v2 10/10] platform/chrome: cros_usbpd_logger: Simplify with
 devm
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-workqueue-devm-v2-10-66a38741c652@oss.qualcomm.com>
References: <20260305-workqueue-devm-v2-0-66a38741c652@oss.qualcomm.com>
In-Reply-To: <20260305-workqueue-devm-v2-0-66a38741c652@oss.qualcomm.com>
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
Cc: Matti Vaittinen <mazziesaccount@gmail.com>, driver-core@lists.linux.dev,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2676;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=KKE0bInc4S8yLhSPSFu/FMkb8dRGE2OpkgkDbv0pcmo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqfmhjGldKQP5o21zPRfDRDP+tGkXe48E0j3pE
 6xnUGNmWe2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaan5oQAKCRDBN2bmhouD
 18WOD/4v7VpFEZzjp0sl26+pDvHQyMyN1WAQj3Vsl3sQmb9jimlUvI1QOVLIuvMNOKKBU7VTVZB
 P+9vnO/+LOEYm89+Jr59jeey5RNqtDUlwk2VjinTcgW2sqYZiAMYQEOdehNCahgQCwBHX1eOkQo
 Qxytd1zdJAUblIz7+q5TfeXZ/WbOr0rLPKZUlMIOYqethUDTLCz9kyCCxeE3G2JpWuSxcEMBExd
 /ZWbCbxe85dFWg4JFCMUfH3N4ZaZPsBvasQLh0BRYusq6/7d0KrqAVxbe5vUA66X6MT/7I7pEDG
 /BDpfmkyMAG/349ekOnqQ9sZ9wMNf5b7acHa5NBm6N1/td0khdgFCwWzK9/UZ6YP/8MllnhU5vI
 7cBRVz2rR1eNDnpzD/SsRRKpuFC3BAM2gEuXzTPKSEfhfa4rTnvfHX4LbjDUpB5lPtm3KBJpTmL
 FQsF4DyfRnKSCZ5OfJd90X/TW8sjpSLe3JrRdwFjPjgfWkwfMFa9kU5Ut4FdxGSOz/ToEOulLx5
 atvPr3JE06SlX10hhzkWmxgRBYpg0OJV9ov3R6evSxpSrJ96YndLn/2uttJyh2avyAbNv+T2hQg
 i1Ar+ZOQSn+81ns4U7+yR/vRmmOZSXetZmXHbbY7yQV7i3GRywDQhoTIWPvUqoZMqyYJOxLns+l
 HZeQV+6JaRutfYw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: tPkJEDvcf3vqLNaSpFS-jggIgsDXh65j
X-Proofpoint-GUID: tPkJEDvcf3vqLNaSpFS-jggIgsDXh65j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDE4NSBTYWx0ZWRfX1vaw7FyNLarn
 ipOuI+jjnnqCuDJqM55V2i22Wl6wbJCg2Z8cuIod3ZLr9llwbhpVcYVcckuMJnta1pTu7Tma0Ee
 tGkprTahiRrKXEFPhdjU81iNB+bqteaWuE/k2mYKyYYgcIaLaHgtO2a5NnUynbl0F2qyTLTz9/X
 v2EZSrh0DWEP4Ppv8AQnrY1j8P1QzFTVnA53qsx4o9kGIR1JOZjl7H0a9sJseK/WiBWMLPcokYs
 DAiY9cSa8wAL3pGeUGnEYexOIdqZ7IpouNMrOkOo4iuHXG9lNghdo21S7nwOs3ZsSC2VuB4r+ql
 OlJgCTh99+ApZWP5DZrNBjHsNAaxr7EFwPhP9C7g669RZPZqN1kylqaM/F8A0SBBHBYsy1JaNr8
 N3XJxEmSSiOHlrYvecZmv201YTUoK5fv/LRWlKBxCBP8lk2ivyCvWxj1uLPhBqakUqj9rQyc/BX
 osdhH6pl+heIHik0wcg==
X-Authority-Analysis: v=2.4 cv=N64k1m9B c=1 sm=1 tr=0 ts=69a9f9c0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=_A9l7huuyFcfbLupPaEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_06,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_134642_155338_D2CDAC1B 
X-CRM114-Status: GOOD (  19.10  )
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

Simplify the driver by using devm interfaces, which allow to drop
probe() error paths and the remove() callback.

Change is not equivalent in the workqueue itself: use non-legacy API
which does not set (__WQ_LEGACY | WQ_MEM_RECLAIM).  The workqueue is
used to update logs, thus there is no point to run it for memory
reclaim.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Use devm_alloc_ordered_workqueue(), mention this in commit msg
---
 drivers/platform/chrome/cros_usbpd_logger.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/chrome/cros_usbpd_logger.c b/drivers/platform/chrome/cros_usbpd_logger.c
index 7ce75e2e039e..d343e1ab6f08 100644
--- a/drivers/platform/chrome/cros_usbpd_logger.c
+++ b/drivers/platform/chrome/cros_usbpd_logger.c
@@ -5,6 +5,7 @@
  * Copyright 2018 Google LLC.
  */
 
+#include <linux/devm-helpers.h>
 #include <linux/ktime.h>
 #include <linux/math64.h>
 #include <linux/mod_devicetable.h>
@@ -199,6 +200,7 @@ static int cros_usbpd_logger_probe(struct platform_device *pd)
 	struct cros_ec_dev *ec_dev = dev_get_drvdata(pd->dev.parent);
 	struct device *dev = &pd->dev;
 	struct logger_data *logger;
+	int ret;
 
 	logger = devm_kzalloc(dev, sizeof(*logger), GFP_KERNEL);
 	if (!logger)
@@ -210,25 +212,20 @@ static int cros_usbpd_logger_probe(struct platform_device *pd)
 	platform_set_drvdata(pd, logger);
 
 	/* Retrieve PD event logs periodically */
-	INIT_DELAYED_WORK(&logger->log_work, cros_usbpd_log_check);
-	logger->log_workqueue =	create_singlethread_workqueue("cros_usbpd_log");
+	logger->log_workqueue =	devm_alloc_ordered_workqueue(dev, "cros_usbpd_log", 0);
 	if (!logger->log_workqueue)
 		return -ENOMEM;
 
+	ret = devm_delayed_work_autocancel(dev, &logger->log_work, cros_usbpd_log_check);
+	if (ret)
+		return ret;
+
 	queue_delayed_work(logger->log_workqueue, &logger->log_work,
 			   CROS_USBPD_LOG_UPDATE_DELAY);
 
 	return 0;
 }
 
-static void cros_usbpd_logger_remove(struct platform_device *pd)
-{
-	struct logger_data *logger = platform_get_drvdata(pd);
-
-	cancel_delayed_work_sync(&logger->log_work);
-	destroy_workqueue(logger->log_workqueue);
-}
-
 static int __maybe_unused cros_usbpd_logger_resume(struct device *dev)
 {
 	struct logger_data *logger = dev_get_drvdata(dev);
@@ -263,7 +260,6 @@ static struct platform_driver cros_usbpd_logger_driver = {
 		.pm = &cros_usbpd_logger_pm_ops,
 	},
 	.probe = cros_usbpd_logger_probe,
-	.remove = cros_usbpd_logger_remove,
 	.id_table = cros_usbpd_logger_id,
 };
 

-- 
2.51.0


