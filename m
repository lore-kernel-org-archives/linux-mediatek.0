Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 769CAE98DF5
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Feb 2026 07:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V13TbOnjuV6VzvANE56HZysaUseqHKiXk3Stv9fSSv0=; b=ByIDpq968DWo2iUQqiCqnWOI80
	f/NU+jVfMAs2Ew6FORooCj515kQz9dw3U2sFHJy6scHTL0NrPtITweEwU/prtNAglpozXMMdA85/r
	ug1VQ/YEYkOOegMrKZgCspCe0obcaleXrqrqaQ0IfzXVDzv50nt3DDt0NqXND8k8HTyRF4VObgT7V
	ytSUX6nAfimILaaQe8HQ+3h495k3OHdqfxiuVhsKek16Ab9Chi5NMY73AWjs4hjCrFJQI4QR5iiue
	tURHGe42Lx32AJS6rN5KMZAbk4WMbvXHktuvjzwUyFvpXviyLGyc7MSYQhJPCw6tRrrtjFEG0gmmY
	NVi9mk2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuQMT-0000000HMz9-2Eh8;
	Mon, 23 Feb 2026 07:28:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuQMO-0000000HMpy-0Tlp
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Feb 2026 07:28:05 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MHsVYr3018272
	for <linux-mediatek@lists.infradead.org>; Mon, 23 Feb 2026 07:28:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V13TbOnjuV6VzvANE56HZysaUseqHKiXk3Stv9fSSv0=; b=bqdUhSGg4fNXC5Tt
	lBynV7L5CjuSOXJESYwWx3vFyqDGDls7Zwtx7n9sISNSuMJzh7UN16lJ1w6hz4s5
	2bThB4m0OzgpMqh7TiUxcmBjPWZOLk2wkaBSYBw5RNRm93k55D3BIgWqvIon0MIr
	ZbghUmGcXmjMY7v7Kc5oWG0gRwQRAJCmhK7yj8iTuw2EEiwBhm5GLL1E8ryEqvwp
	tJnt0AEfpr8xKWCvvxkvKVaIBiHl9KFAnKVTR+vOCizkWpraNxR7J5XHJNG3dOX9
	mEG5mvwhpWDUHVP9s6z26/akucfbtWNRM1FpY2dp8NShJqDdJljAs+CiJj/M7ACH
	VitS8g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5u8krxr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Mon, 23 Feb 2026 07:28:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70ef98116so4541480885a.1
        for <linux-mediatek@lists.infradead.org>; Sun, 22 Feb 2026 23:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771831682; x=1772436482; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V13TbOnjuV6VzvANE56HZysaUseqHKiXk3Stv9fSSv0=;
        b=fJt03GOYU1KBSHNQ4gQJzXHEVUFroXcMJSJiX8SDP8LytuYg/D3VT5lS6FPZjh3VBH
         czthZpp68TLUPPrKxK+g6gAsmP9M+avNDoSQIQZhZ43vbY7DBS8afV2UD4R+WuEBnOKC
         CfLUMLdmHQFRqS071S+/HM02irv1teC9dJ0ylQ2sAsjOW5rQMYlxUerfSE/XUbR20S8l
         1ubCsxLJQAjt3hWLgFqzUmJNFFN/bMTbg6DBHMRHHJq5dxrEL5tWSmRQPahXYeqtNBoy
         K/BLkdX6QT+Rt9FIQU/4MN3mor/rNLOgLl3ZU6WfMJsgukTuTQTIc/xQW5VlVX4WIhci
         LV2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771831682; x=1772436482;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V13TbOnjuV6VzvANE56HZysaUseqHKiXk3Stv9fSSv0=;
        b=iq6UFQqVIznjl3z3KGnekJ2ybCAkfEFsQ/Zh3UB/aA7vlDU9lcdkCvf/GQ4I7Wj05o
         spgGV8ESW38R3W3q+OnnQcCkUSmWHixxHAGUK0e8YDJqqnEgTMcM+aJBO9U2jdhMUnxG
         0iN/mTc2DNCRow8SXzovXltzYA31VQEYjA7lCT+1zVef5c6bHqxHPAGiePTn2oJxSLv8
         96Ab+KiV2gC7kU4ugsqqTxPsj8xBd3PTaiSPvtVgU8Jq1CENFJj328xUGTu+AxtiTPEH
         XWLvlTU9d17/VWOCJP6wsFgGKMUkWYUlvSG22kpJI7zK1Kvzdg9q/6t/CaPZK5rQhTG6
         p0Ew==
X-Forwarded-Encrypted: i=1; AJvYcCUzZEzJJLEB/TnQcdqpUW+7h1QIwO7QRXXzqA10d7EUhvECZ1FlXpXF1S8D2adXaXEZFFnkpN7O6qzpRTi7IA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxZje5BBlIC/2pmWNTQJx2JWSw10JM+um94pvvfuv7N3hn3Rotz
	lCBSMgiQlkwUaEMM++RU41nGbQbrtoSZ20vcbY+Chr7gaOS6+U9HE5wSSUc7FTJSSy8zpiDrett
	RCKhQIHj1oglQQsRgOYQ5ajRb+FRuNTri09/DkCCeXnodYVm04xNxQ6GWKVnxVyvXhLUAg/RGh1
	8=
X-Gm-Gg: AZuq6aLDErMnzJrhcIVpZk58hhl45u5TPJDT1Wq+aRo7aG/n1+wAqTSujnDBQ9Uabmn
	Vj2VjnABC+KAFZGJvUoUqyAOCNTtRi138Pes28KKvsKCRkeEZ/u+InJmmbDyMgV9dQQeoglSvbE
	ym6VLIIFr8gKKMK+58f4gb/BAifO9bOi/9z7feacH1oFiDeF8RdAm2PPFDWKynmt910dohmE9XW
	IdBSfCCRj8Y74XC00pHPxnugWSYh+VecT/WYNLyAUhGIi/iwu4BSt1ZVcCGm30GkriFh2g96CbI
	1vrGKhwr5jmcpkfZr0yWMBd+14HBp+mrk2cfokaDH5d9/Yy/hFQro6WEY8r2W1ALVD+jx7+8IEU
	N6b8dEsZCr1k+U4u2Tf8zN0VxmagfPzJvNGGwufLtYe2+QQ==
X-Received: by 2002:a05:620a:414d:b0:8ca:3c67:8914 with SMTP id af79cd13be357-8cb8ca92dbdmr1030170085a.72.1771831682483;
        Sun, 22 Feb 2026 23:28:02 -0800 (PST)
X-Received: by 2002:a05:620a:414d:b0:8ca:3c67:8914 with SMTP id af79cd13be357-8cb8ca92dbdmr1030168285a.72.1771831682019;
        Sun, 22 Feb 2026 23:28:02 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9ff5sm18550286f8f.4.2026.02.22.23.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 23:28:01 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 08:27:37 +0100
Subject: [PATCH 9/9] platform/chrome: cros_usbpd_logger: Simplify with devm
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-workqueue-devm-v1-9-10b3a6087586@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2369;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Tz7aCKZpxvE/URE9NHfPfJCIW6o+Wox+HN1jMO8zCgg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpnAFu3KNp+CTKSy+V7k67mEChB+6tEknfgjT/Q
 0+9orefkKyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZwBbgAKCRDBN2bmhouD
 1wuWD/9J+JqARU6TsvU4zvVDheM7Vy4GbVVCDxKaqTn1LB64+jTh7G+qQDyEO+/8tfwnovEz32a
 dZfCA3g8kmt9XMucw0VfKlsZIX+GwOFNPaCzVAIUDxeJAZLU7RU0qIm5Sr9Tfvg2BRzyeDraYlT
 J7liSpFkaTD39Xe9e+ncf8BMH+iTwVSEDGmzCDAoM8binwflLgSFhX8+1BAAD+6dGF7I8S5Jd9F
 f+Yfs6XweClFjvk/QYcBtkxFZgTpt1p4s/Ksnk40iJqDUWV9nT7P4LCPGIedS+T3FPn0QWCatUy
 WQrnAzUWqundJe80uxqAF47q1sVAqylM2iuodrq7bUXWaR8M1DHKMOsQK60jEyt+n0BrWTqTC4X
 0OvX08AJfnLsjhGl7MXfKjH+t/A+dPPQeqxzDF//csXt0QJqWoJNq9HCMfDdAkCxvlSeo4H9Z+z
 cYCbIcdRo8JQNn5a6H/48X2v7YhZV8tkKw2OTs2JmW54h38R8qRm/EVPRfMRk0VxUtTcZIuj/Vm
 qUIhXscFFPVRJCkWfps7q1UEqNoWwk6x+NdWrH7EYppRe0NRgJ7xIAgldkle635fxHyB2C0sUgo
 yylFHJPeufQjL0tRBOlpP0gjwNExCI+B70e1ZlGbs4mOM7RJCdTfEZLGq4326lxqaEVTZZ5aRHq
 kW1pfV1AjFgY8vg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: jZHQlKMB1_6lYsxAGCc7CgsjTxqKOHOM
X-Authority-Analysis: v=2.4 cv=cJftc1eN c=1 sm=1 tr=0 ts=699c0183 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=fg_Lw6XCFRazdZfdaoQA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: jZHQlKMB1_6lYsxAGCc7CgsjTxqKOHOM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA2NCBTYWx0ZWRfX2yMmpwGFTVDl
 XEWk0fFXwWVnHPs9+h9aM1M11XMYpitwUZcZI+6QzvPoEGyF6kF6DfFsdwQRuMuxT9aRw20YfSm
 lQUYu+dak2ZMz/udvjrO1AfyiX48jI+fsCW/UWqpxIVUf3oQbGpY1MTWG0y94+pzAxIqYfmMRxb
 3Etga0NylZ6Gyuqn1VUJhszXN/+bvavJIU/5ncdsahU6vR4fAZlXN4BHOz9WkY0etkeAgx500tE
 VZ3B7EJAaqTMPr4CWowP0EbiHdZxSwb0CZ8bAK8fFisZicuL1K3CNJu7/wO0amp9LRybx6ZiZBK
 E3HWWTwjk97fZxqIJDMajcXZx0QmEFTPGt8NVzdnHXY+700SUObubd9BtnE2fGthIc7xgiBmNw+
 xisNtrPVXlWZGbSdsVjVTLbr+pV354YzHomLKGeeoMNEG6WWLtXg54sLAKTuqPCDoX9+eygGnHn
 GWT1dBEnQNVTuGVmo5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_232804_324243_3BD81F4C 
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

Simplify the driver by using devm interfaces, which allow to drop
probe() error paths and the remove() callback.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/platform/chrome/cros_usbpd_logger.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/chrome/cros_usbpd_logger.c b/drivers/platform/chrome/cros_usbpd_logger.c
index 7ce75e2e039e..b0d176c0f4cc 100644
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
+	logger->log_workqueue =	devm_create_singlethread_workqueue(dev, "cros_usbpd_log");
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


