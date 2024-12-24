Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94FD5E77188
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Dec 2024 13:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xdmd4GC6rhW/Uh7S3n+f8KzvWTUMO/RUgVVrfahbelc=; b=SQcxWamAuO+y8HyV/Yz1NKweo3
	xy7rlb96tVMm/Q3Qodj7etcNADv8t/e7LhFR+KOfjJmNJIuYBtFENp5slNGadXYBbNOFmlTrZumLO
	TxLvJ5LPbeeFh7o1EIYfDgFvZWMC/QoJKYT+Kd1KZUJgwdSTsHMLaA41/mRVX024coxbRerh+EYEm
	+2XZ3Y7vDBmYRv1+javFk1PgY0RLVPL26ztS0Wrc95SzqJVk9zRbotJeCpwh/OYMdDYKiL6Pfro5K
	LdYFQmBERIgccbdRdex1q7ub9R+VffCSMSzCg2xRCB6KzsOKa0JDrbhKH5NTXk8/3LmZTuyFkK3xH
	MqEdY03g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ4eV-0000000C1JA-2Jn3;
	Tue, 24 Dec 2024 13:08:47 +0000
Received: from pv50p00im-tydg10011801.me.com ([17.58.6.52])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ4di-0000000C18d-42qN
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Dec 2024 13:08:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; t=1735045678;
	bh=Xdmd4GC6rhW/Uh7S3n+f8KzvWTUMO/RUgVVrfahbelc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:
	 x-icloud-hme;
	b=02HJWJQW/isBieKHc4lHuOWm0sE6RVt3AnvajvFm1yFol+F4wqT/akMphrNu6cO3O
	 tRStEjxXnbWSoE4MlKkFF7vYy3xf35+66BCGJyh2Du1ZUMNZ2EacwYkZJ4u5ypP965
	 v/AH2LZy1yRwa6xJOA1V1Bv+jP1ShdU0I6IHd2xxKji7Wu2pUn7pj2WnGI8dygTnL9
	 2QBDyVZyjAndJfmvYtBeu2fpOfpZbM1DThemmGYeK+N4Bu588vmwl+0aPMmrAHUPUZ
	 RvxYwutbA+1plmvUG7dL5X+KLXh13AO6kFEqayP+A4O1R/VsH1T5Cm5RYkg+Av6Nna
	 gt+0DUgzWfvLQ==
Received: from [192.168.1.25] (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-tydg10011801.me.com (Postfix) with ESMTPSA id EFF298002E7;
	Tue, 24 Dec 2024 13:07:43 +0000 (UTC)
From: Zijun Hu <zijun_hu@icloud.com>
Date: Tue, 24 Dec 2024 21:05:04 +0800
Subject: [PATCH v5 05/12] driver core: Simplify API
 device_find_child_by_name() implementation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-const_dfc_done-v5-5-6623037414d4@quicinc.com>
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
X-Proofpoint-GUID: P4Ll-ia_XA5Ds8VjlM-P50WHH2PaNMoE
X-Proofpoint-ORIG-GUID: P4Ll-ia_XA5Ds8VjlM-P50WHH2PaNMoE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-24_05,2024-12-24_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 clxscore=1015 mlxscore=0
 spamscore=0 mlxlogscore=866 malwarescore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2412240113
X-Apple-Remote-Links: v=1;h=KCk=;charset=UTF-8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_050759_025521_1FC4F8DB 
X-CRM114-Status: UNSURE (   8.43  )
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

Simplify device_find_child_by_name() implementation by both existing
API device_find_child() and device_match_name().

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
---
 drivers/base/core.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index bc3b523a4a6366080c3c9fd190e54c7fd13c8ded..8116bc8dd6e9eba0653ca686a90c7008de9e2840 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -4110,18 +4110,7 @@ EXPORT_SYMBOL_GPL(device_find_child);
 struct device *device_find_child_by_name(struct device *parent,
 					 const char *name)
 {
-	struct klist_iter i;
-	struct device *child;
-
-	if (!parent)
-		return NULL;
-
-	klist_iter_init(&parent->p->klist_children, &i);
-	while ((child = next_device(&i)))
-		if (sysfs_streq(dev_name(child), name) && get_device(child))
-			break;
-	klist_iter_exit(&i);
-	return child;
+	return device_find_child(parent, name, device_match_name);
 }
 EXPORT_SYMBOL_GPL(device_find_child_by_name);
 

-- 
2.34.1


