Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08646E7716F
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Dec 2024 00:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d6TJ/PJcP3RwEb3ZrN4cu8HG012/gheU4Nbl+oBQIzw=; b=pKLN5EMaNIAclD0eNvQtoaHmGE
	kffuX+gt4o5DoWNUwKy50kQ3Nj47CfQWaFKiE724fJe6aXeJAaMTFssY9bo3vqpN+5aYr2N6P9DVG
	RvPeIuFu0wBinpOXn/FduXjSm14wyvVA426QmqMuF5QWN7Y8mMCo0YBGIIC3I5+KBeHWDWeIR9oQ7
	wiuHYy0gwwtSlU8RBx9RmZ1VrtttV6x4QoaAjQyavYb7P2OQi0H/UGi+xKAReIO+RCGSxU+LSFzUm
	liGLoITDVNtVSiWGwaoBuky9GAMensxuR0zrP85K1dfC9WiJPqzlv6BK9vxIBZxRkDVTRHT+c1pOB
	FPcZC0Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIzTb-0000000EIgy-3vlg;
	Thu, 05 Dec 2024 00:12:15 +0000
Received: from pv50p00im-tydg10011801.me.com ([17.58.6.52])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIzTZ-0000000EIfs-30Wl
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Dec 2024 00:12:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; t=1733357533;
	bh=d6TJ/PJcP3RwEb3ZrN4cu8HG012/gheU4Nbl+oBQIzw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:
	 x-icloud-hme;
	b=JqJ4vz+IxMNE1DfrT0xupzf1391cfTs7qr/Uh8httbDCnNAi+VWkbRL5kDHe2uFAA
	 AVlJEksqoUtXULvfxmcdnCDBv/9qOKv1nuFa7UN4S1ffOzd8yAcdQqkpfSr1Oh+Ynk
	 nc15RKkBbi2oPgWZhBCJc4iJOiXqWFUblf/7TW6oN9CMFEGfkRSUSMctYOVj9VyLJP
	 d9h+Rd7/9k5DohOzgceEzov0dsC6ygo+f0So24YKJ30pJancpJW0/wkmbb+bSYBRAw
	 FfWWhRJ7i8HYxuwjB1NwuLYfa28M8dFv3xBZnqIA7ayZzLmydxSuJl6zfDd/K9ygrx
	 E7HRdoJXwHyPA==
Received: from [192.168.1.26] (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-tydg10011801.me.com (Postfix) with ESMTPSA id BDDFB800391;
	Thu,  5 Dec 2024 00:12:02 +0000 (UTC)
From: Zijun Hu <zijun_hu@icloud.com>
Date: Thu, 05 Dec 2024 08:10:15 +0800
Subject: [PATCH v3 06/11] driver core: Remove match_any()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-const_dfc_done-v3-6-1611f1486b5a@quicinc.com>
References: <20241205-const_dfc_done-v3-0-1611f1486b5a@quicinc.com>
In-Reply-To: <20241205-const_dfc_done-v3-0-1611f1486b5a@quicinc.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
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
 open-iscsi@googlegroups.com, linux-usb@vger.kernel.org, 
 linux-serial@vger.kernel.org, netdev@vger.kernel.org, 
 Zijun Hu <quic_zijuhu@quicinc.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: cGYR-uFjHfGwpOV3mvYWNFThmlA3tsk1
X-Proofpoint-GUID: cGYR-uFjHfGwpOV3mvYWNFThmlA3tsk1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-04_19,2024-12-04_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 spamscore=0 mlxlogscore=807 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2308100000 definitions=main-2412040186
X-Apple-Remote-Links: v=1;h=KCk=;charset=UTF-8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_161213_774228_A1B30511 
X-CRM114-Status: UNSURE (   8.97  )
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

Static match_any() is same as API device_match_any()
Remove the former and use the later instead.

Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
---
 drivers/base/core.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 8116bc8dd6e9eba0653ca686a90c7008de9e2840..289f2dafa8f3831931d0f316d66ee12c2cb8a2e1 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -4114,11 +4114,6 @@ struct device *device_find_child_by_name(struct device *parent,
 }
 EXPORT_SYMBOL_GPL(device_find_child_by_name);
 
-static int match_any(struct device *dev, const void *unused)
-{
-	return 1;
-}
-
 /**
  * device_find_any_child - device iterator for locating a child device, if any.
  * @parent: parent struct device
@@ -4130,7 +4125,7 @@ static int match_any(struct device *dev, const void *unused)
  */
 struct device *device_find_any_child(struct device *parent)
 {
-	return device_find_child(parent, NULL, match_any);
+	return device_find_child(parent, NULL, device_match_any);
 }
 EXPORT_SYMBOL_GPL(device_find_any_child);
 

-- 
2.34.1


