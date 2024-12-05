Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A40C7E7716D
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Dec 2024 00:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DunB/Cza6j0J9yIEJF1/KVIA9ohiToydy/mrGuBe+NA=; b=BoT315qXJpLaQuhRKPimU2no+N
	hWHtTl+91VmlJhyG3vjFjB926pn8PDWuVs3CQtkMyZSeXeu5OMEomlAob/bAKK11IfhxI6mO6PO6X
	mdSUdYyI9sBnRegBckB4HgndMl3aNTek3DkRa3QIbgX80kS/fZklfupwSn68DyccgyN/vGJH+toeS
	80c03scJgr5L9fu+1rgvxDpVv3VlfHzdAw0V85ZpXq6UFrGAFWWCK2aA0fgpU7gGTKby+ym1yXBwJ
	S9igoJ3inpeKiqq4QYCYQswjlxygCj8M1E5xmMG3P2BPpjn+uVq5X29DdG7j2zdEbQRhq1yAZjEgm
	ThaE7PLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIzSg-0000000EIIj-3F9F;
	Thu, 05 Dec 2024 00:11:18 +0000
Received: from pv50p00im-tydg10011801.me.com ([17.58.6.52])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIzSe-0000000EIHM-0np0
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Dec 2024 00:11:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; t=1733357475;
	bh=DunB/Cza6j0J9yIEJF1/KVIA9ohiToydy/mrGuBe+NA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:
	 x-icloud-hme;
	b=RgdLtt4aFUOiBVmeQIiZeK+R6ebchgvxS1CGK9QWDm4fi6XycK0YPKcDXkKNxrZr5
	 +xtKJ6H39Xui76oDfpCSXqE4tOoHj+7JRKbj4DGFJPikLBsnyakQ3Xyf+JLqlKC7CK
	 1iPow4BKS8sS9bw1x59FVLT9xfEl3k+Mc0/6jz5b7NLkO/DmqJqcNFgQu0wVbjwsXU
	 Vez16J5yD5UiaIoqpK2YdcUIWiYXCDQsuTIMOmqYqY4Eo8Zr6SReR+T8g09hoZ3KNz
	 oiPm9MB2Q+TBtqrBbITTNRuqKFrVD/luXwZshbq8FNuVBnC76FT2njYcWtNu+JfgdE
	 cxzKF4ATBNsmQ==
Received: from [192.168.1.26] (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-tydg10011801.me.com (Postfix) with ESMTPSA id BC22B80026F;
	Thu,  5 Dec 2024 00:11:03 +0000 (UTC)
From: Zijun Hu <zijun_hu@icloud.com>
Date: Thu, 05 Dec 2024 08:10:10 +0800
Subject: [PATCH v3 01/11] libnvdimm: Simplify nd_namespace_store()
 implementation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-const_dfc_done-v3-1-1611f1486b5a@quicinc.com>
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
X-Proofpoint-ORIG-GUID: jHlIOqjc_AeZK-9ZUrdqIW7FkzMuYDHV
X-Proofpoint-GUID: jHlIOqjc_AeZK-9ZUrdqIW7FkzMuYDHV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-04_19,2024-12-04_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 spamscore=0 mlxlogscore=902 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2308100000 definitions=main-2412040186
X-Apple-Remote-Links: v=1;h=KCk=;charset=UTF-8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_161116_235952_29AFD20D 
X-CRM114-Status: UNSURE (   7.90  )
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

Simplify nd_namespace_store() implementation by device_find_child_by_name()

Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
---
 drivers/nvdimm/claim.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/nvdimm/claim.c b/drivers/nvdimm/claim.c
index 030dbde6b0882050c90fb8db106ec15b1baef7ca..9e84ab411564f9d5e7ceb687c6491562564552e3 100644
--- a/drivers/nvdimm/claim.c
+++ b/drivers/nvdimm/claim.c
@@ -67,13 +67,6 @@ bool nd_attach_ndns(struct device *dev, struct nd_namespace_common *attach,
 	return claimed;
 }
 
-static int namespace_match(struct device *dev, void *data)
-{
-	char *name = data;
-
-	return strcmp(name, dev_name(dev)) == 0;
-}
-
 static bool is_idle(struct device *dev, struct nd_namespace_common *ndns)
 {
 	struct nd_region *nd_region = to_nd_region(dev->parent);
@@ -168,7 +161,7 @@ ssize_t nd_namespace_store(struct device *dev,
 		goto out;
 	}
 
-	found = device_find_child(dev->parent, name, namespace_match);
+	found = device_find_child_by_name(dev->parent, name);
 	if (!found) {
 		dev_dbg(dev, "'%s' not found under %s\n", name,
 				dev_name(dev->parent));

-- 
2.34.1


