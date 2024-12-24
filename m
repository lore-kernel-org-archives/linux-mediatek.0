Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 951A8E7718D
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Dec 2024 13:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=erbjjZhB2douri09I0i2ldgxqWL6bTpOhHwl8mpHl7o=; b=V5XJdMsl0hc/P320bKGH99Ue5I
	oLu0vqUmEuUuj+Qb+bHgRL+ZBED2FkLVRFbc3/Ey+J/cYOy9DOlsOBlXGlEN3GhHtGyo+vjCQFMdm
	4uQ5Elh28fw9UEyx68HePjPYniG1AIv/FXtrGyR37wsEkXGw4Q/yMOnNlsPCQtIOMcf2zJ/ui28D7
	LnRHyTu7ZdIEf4O90Qy5J1UkTNacCtOUG+6TC6raYPwzoJv+CsR9gwACLqcZrDWeRo8610ovRvtIb
	J7EARDzA6SbSo2ZmbIFw82q751nmn+oPNjYJcafWHGM/2780DI49fQ1dy6EZdP6PJJUNnPbgkujls
	lzDGFRiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ4el-0000000C1TR-3IFy;
	Tue, 24 Dec 2024 13:09:03 +0000
Received: from pv50p00im-tydg10011801.me.com ([17.58.6.52])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ4ej-0000000C1SQ-0van
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Dec 2024 13:09:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; t=1735045740;
	bh=erbjjZhB2douri09I0i2ldgxqWL6bTpOhHwl8mpHl7o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:
	 x-icloud-hme;
	b=M7xRRJ5jX9vLbEsOitYVmmHTSGUaX+sshkWGFu0txALItrq/wWXH9fqCsppVhxMdg
	 Pkp9RIOf69SF5kC9IcSPP/KwWUueDzIeyG2kCQcS+yN10Fy1XV2/hclV2QlzQ7H5El
	 8pdLKfWTyRAPCCo4+c9JjScC4rsqGM9DzTl3nbS3Hm/f8owWjBOB/A9XnB58XyIPD8
	 M2yPsKSrvLbb974F3Fn+AHl9jFjEDaLn4g9CyjYDyhAHZ+rlRU+FWb2zkJ6DDdDUi/
	 g/Q6BNlsmYOyxb6FUUWaj3/cbETWDNdCSCb6IS03CB3ZUo2UDhbWkGC28JIvaSueeo
	 PYrEBMThNQ9iw==
Received: from [192.168.1.25] (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-tydg10011801.me.com (Postfix) with ESMTPSA id 350F380004D;
	Tue, 24 Dec 2024 13:08:43 +0000 (UTC)
From: Zijun Hu <zijun_hu@icloud.com>
Date: Tue, 24 Dec 2024 21:05:08 +0800
Subject: [PATCH v5 09/12] driver core: Introduce an device matching API
 device_match_type()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-const_dfc_done-v5-9-6623037414d4@quicinc.com>
References: <20241224-const_dfc_done-v5-0-6623037414d4@quicinc.com>
In-Reply-To: <20241224-const_dfc_done-v5-0-6623037414d4@quicinc.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 James Bottomley <James.Bottomley@HansenPartnership.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>, 
 Zijun Hu <zijun_hu@icloud.com>, linux-kernel@vger.kernel.org, 
 nvdimm@lists.linux.dev, linux-sound@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-block@vger.kernel.org, 
 linux-cxl@vger.kernel.org, linux1394-devel@lists.sourceforge.net, 
 arm-scmi@vger.kernel.org, linux-efi@vger.kernel.org, 
 linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-hwmon@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-pwm@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-serial@vger.kernel.org, 
 netdev@vger.kernel.org, Zijun Hu <quic_zijuhu@quicinc.com>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: DZeI5aU7SNbuR5SofPdSN15JXAFu3F91
X-Proofpoint-ORIG-GUID: DZeI5aU7SNbuR5SofPdSN15JXAFu3F91
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-24_05,2024-12-24_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 clxscore=1015 mlxscore=0
 spamscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2412240113
X-Apple-Remote-Links: v=1;h=KCk=;charset=UTF-8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_050901_284824_6A333D9C 
X-CRM114-Status: UNSURE (   8.49  )
X-CRM114-Notice: Please train this message.
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

From: Zijun Hu <quic_zijuhu@quicinc.com>

Introduce device_match_type() for purposes below:

- Test if a device matches with a specified device type.
- As argument of various device finding APIs to find a device with
  specified type.

device_find_child() will use it to simplify operations later.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
---
 drivers/base/core.c        | 6 ++++++
 include/linux/device/bus.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 289f2dafa8f3831931d0f316d66ee12c2cb8a2e1..8bdbc9e657e832a063542391426f570ccb5c18b9 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -5228,6 +5228,12 @@ int device_match_name(struct device *dev, const void *name)
 }
 EXPORT_SYMBOL_GPL(device_match_name);
 
+int device_match_type(struct device *dev, const void *type)
+{
+	return dev->type == type;
+}
+EXPORT_SYMBOL_GPL(device_match_type);
+
 int device_match_of_node(struct device *dev, const void *np)
 {
 	return dev->of_node == np;
diff --git a/include/linux/device/bus.h b/include/linux/device/bus.h
index cdc4757217f9bb4b36b5c3b8a48bab45737e44c5..bc3fd74bb763e6d2d862859bd2ec3f0d443f2d7a 100644
--- a/include/linux/device/bus.h
+++ b/include/linux/device/bus.h
@@ -131,6 +131,7 @@ typedef int (*device_match_t)(struct device *dev, const void *data);
 
 /* Generic device matching functions that all busses can use to match with */
 int device_match_name(struct device *dev, const void *name);
+int device_match_type(struct device *dev, const void *type);
 int device_match_of_node(struct device *dev, const void *np);
 int device_match_fwnode(struct device *dev, const void *fwnode);
 int device_match_devt(struct device *dev, const void *pdevt);

-- 
2.34.1


