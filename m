Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36060E77180
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Dec 2024 00:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IkjKR7CpPDn98sYTBYYKWLyDknZN2jQuVV1iJBo+zv4=; b=bYLMCCK0w6UhtsK3vy65rLc4Zd
	MZNYXYh8t4Gp49QJFvxV8poJmjTjeH6SACWPOUv46diXkbZmk5yPOllCRvc58YllPdfYBaeAB25Eu
	ic36MN3xSzuJGbpKuiCoJhXF8p5qbLWXinxICSmZKtFM58aG88FVJ6ZOo1zuOGFuCclwvboVxwGIm
	lALiWmTfTP4p9Id45DHn6tkT5mPH57SC/YxQ/vJHpYKy6Pg5Vd/GTMhTII2Yi+pgrUe2aOlv4S/dU
	84NQCA9S7T7FtDYDOjPfEjuf04W3vtt4RE5sfTofsdBxWgAGLaA2GfUQh2altJD0rFu/PY4EttXNP
	h//ASGHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLAIq-0000000DFEg-1HTl;
	Wed, 11 Dec 2024 00:10:08 +0000
Received: from pv50p00im-ztdg10011901.me.com ([17.58.6.50])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLAIn-0000000DFD8-3F15
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Dec 2024 00:10:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; t=1733875805;
	bh=IkjKR7CpPDn98sYTBYYKWLyDknZN2jQuVV1iJBo+zv4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:
	 x-icloud-hme;
	b=i7ULaqNJ6npZoQmi/DlhBbIEWJu7GI69KaMyYUblUqal8FK4F46s2fI9kVjlkyVkn
	 /J31gITsAX2iW08eu5uCjVerPyGc9yUXvvOhqjsK2j/zgaIOOXvd7qUuKlH2TIN7mg
	 JoFPlyF9X6ILP0iHvJyXD7qPp7YLtee3LEkSC3mbIdiwmpkSM5FSzfEYP6YLUKQ/nr
	 Xvk/Vx/DrgkYy5CRcVK1Cc5+/3n1Hw1gBTr9TV9iGZhLV4oPW24m9X2A2ub/H203O0
	 gwp3uLBAAlA4CrnB9c6daNEvPbYlG7QbLWGrPtRMl3cK/MMp/5g/sRAPdcw+gheU97
	 y4pzWxdGGBSxg==
Received: from [192.168.1.26] (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-ztdg10011901.me.com (Postfix) with ESMTPSA id BA8863A0262;
	Wed, 11 Dec 2024 00:09:54 +0000 (UTC)
From: Zijun Hu <zijun_hu@icloud.com>
Date: Wed, 11 Dec 2024 08:08:07 +0800
Subject: [PATCH v4 05/11] driver core: Simplify API
 device_find_child_by_name() implementation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241211-const_dfc_done-v4-5-583cc60329df@quicinc.com>
References: <20241211-const_dfc_done-v4-0-583cc60329df@quicinc.com>
In-Reply-To: <20241211-const_dfc_done-v4-0-583cc60329df@quicinc.com>
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
 netdev@vger.kernel.org, Zijun Hu <quic_zijuhu@quicinc.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: hNG3xePdNfNOzHg74akd9WJMrpqTEJ-e
X-Proofpoint-GUID: hNG3xePdNfNOzHg74akd9WJMrpqTEJ-e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-10_13,2024-12-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 spamscore=0 mlxlogscore=885 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2412100174
X-Apple-Remote-Links: v=1;h=KCk=;charset=UTF-8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_161005_832006_B78D1849 
X-CRM114-Status: UNSURE (   8.88  )
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


