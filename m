Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7771FE7716F
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Dec 2024 00:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IkjKR7CpPDn98sYTBYYKWLyDknZN2jQuVV1iJBo+zv4=; b=eZsOD/MlL6Mc04WiilOJA8K4MX
	RSWLlyLal1rFTIUPx02rNn60YpI2ocZNWwONnZzggR5z/3bxGZFMCH40dsWhpXRZv5BPYoWrLB/5u
	DQQGn888b0E4cEAfUouj/pitwbPbs7BJkHf9lfwbeEjxvSf1F+U5Baj0/HG+H2Dovzt+XrkadmKCD
	wpjfY6dn7F0GCf3LNJhA76mBR8Ujx3tApaMjBtbKQQrxtXUDAAY9dwot79YJjT8IYAn0yfGMAcG44
	NuwwJm7q5FrXjMsiISMtq+QDiZsvyqclmbVY3RLugA3GeBA9DOKIC0bJtCcSq+67fRRhnRtw2NN0N
	yz2WeHow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIzTV-0000000EIde-2bwF;
	Thu, 05 Dec 2024 00:12:09 +0000
Received: from pv50p00im-tydg10011801.me.com ([17.58.6.52])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIzTT-0000000EIca-1O3H
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Dec 2024 00:12:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; t=1733357522;
	bh=IkjKR7CpPDn98sYTBYYKWLyDknZN2jQuVV1iJBo+zv4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:
	 x-icloud-hme;
	b=IVuWGgnz7EZJQeECGBnttHxtoDGtsZ2uuQ/QCPHYTO74bhz2JeY/0NPUfzoPC39gF
	 GLFBnXK4FWKcvVDw5l7YeSoS9Pz+KnQDkKmQihxDWYapsOpxgcX5qc4Vu7FUnt99r0
	 RyLOD9xXpfx0p/+2pqYPd/oqaaCySRZTkeWVfw+DfNW3D+ZJoEMsJ/KM87YuCoeO7T
	 CQJlLhaJ+oIz1herHq0DUsQpE7prIiem6U1IazFdPyy0EuS9fO/VNKFY9zLfvbX1vC
	 odWSZWoxV5wBEpzOQGE5dxelbt7yjAymHYCLHgVzNHveTkxA0puCW2IxmhGOPwrncX
	 N8FMNSNM/Ecxg==
Received: from [192.168.1.26] (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-tydg10011801.me.com (Postfix) with ESMTPSA id 0FBE68002AE;
	Thu,  5 Dec 2024 00:11:50 +0000 (UTC)
From: Zijun Hu <zijun_hu@icloud.com>
Date: Thu, 05 Dec 2024 08:10:14 +0800
Subject: [PATCH v3 05/11] driver core: Simplify API
 device_find_child_by_name() implementation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-const_dfc_done-v3-5-1611f1486b5a@quicinc.com>
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
X-Proofpoint-ORIG-GUID: nR0Td9EIK3Obz30PFAIkB0fn5HoVn60t
X-Proofpoint-GUID: nR0Td9EIK3Obz30PFAIkB0fn5HoVn60t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-04_19,2024-12-04_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 spamscore=0 mlxlogscore=826 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2308100000 definitions=main-2412040186
X-Apple-Remote-Links: v=1;h=KCk=;charset=UTF-8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_161207_388359_AE8CF472 
X-CRM114-Status: UNSURE (   9.04  )
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


