Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 503D5E7718D
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Dec 2024 13:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W6hKFz3jI/fKIGjdW+aEgqinuBcUdnSmulnNtvSMSNQ=; b=ARLhx2Hr+Wb0BAbb1Q3qtKy2KH
	0B596P0Lhd3uQgc67B3H2Rm+ZbButQj7ADAj+lUs9tI1UmDHvtK/DrIdX6e/rJNuYEkXmtmuncbuE
	P/fWpDZ404q3SkYTzyVglY5RJbg/FHPLTTMcyf+FDKrbESXxhErqYN7kvhKolrAULQq7uBjrqPBzl
	AqhXGq7aByfjeyNXl2Zrw8xuHifgdQYyGzFiVL6S0cZ1sXBFeUHkBdPkBGcKVkgnix2E1DlPK4Uu2
	/kT240ooxWHVKi7eZdUJ5JaPSjX0vaeDtnYUX0Ah0H5yCMt0M4tKwbbc7FRzHuZf533gef0w9gHaw
	0O1QznyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ4fI-0000000C1cc-2AZp;
	Tue, 24 Dec 2024 13:09:36 +0000
Received: from pv50p00im-tydg10011801.me.com ([17.58.6.52])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ4fG-0000000C1bu-0zNt
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Dec 2024 13:09:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; t=1735045773;
	bh=W6hKFz3jI/fKIGjdW+aEgqinuBcUdnSmulnNtvSMSNQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:
	 x-icloud-hme;
	b=D42QO5JpRgId3k2OgSjgsoUEPLuQW5L7BJi3jf5ALKfW43PZdub91g1FieMZ5JEkn
	 tuJmy3JWIGP3G2g1GKlU740j2HM0JrGEeZ4bkv7vQXT/tKpPAZzaVoXiV6Wj0L68mV
	 28/36LBfPOPezhw4wF97AzW/ZepVC9frjSbKf+7InVtBmR2M+ybe4GIBTHqq3Vl0Sh
	 WKdIfYt1VVy6eIjlpJvjEhLRkwJYonZpolco1tbmcKdKTnShjvMuavKB9xg3zGmGKa
	 SZq1Khd1FKJj5yt+Nuebau9Ph6IIqNyrQYDoN4xTt30kHR/5bmI3GjM1r8EKZksXyG
	 sWsrVpNuxVVJg==
Received: from [192.168.1.25] (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-tydg10011801.me.com (Postfix) with ESMTPSA id 2E299800265;
	Tue, 24 Dec 2024 13:09:17 +0000 (UTC)
From: Zijun Hu <zijun_hu@icloud.com>
Date: Tue, 24 Dec 2024 21:05:10 +0800
Subject: [PATCH v5 11/12] cxl/pmem: Remove is_cxl_nvdimm_bridge()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-const_dfc_done-v5-11-6623037414d4@quicinc.com>
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
 netdev@vger.kernel.org, Zijun Hu <quic_zijuhu@quicinc.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: -L6nySq_kXObOyTkXfn6veJLGJ_xFgS3
X-Proofpoint-ORIG-GUID: -L6nySq_kXObOyTkXfn6veJLGJ_xFgS3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-24_05,2024-12-24_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 clxscore=1015 mlxscore=0
 spamscore=0 mlxlogscore=779 malwarescore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2412240113
X-Apple-Remote-Links: v=1;h=KCk=;charset=UTF-8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_050934_297346_DF2F49D1 
X-CRM114-Status: UNSURE (   7.07  )
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

Remove is_cxl_nvdimm_bridge() which has no caller now.

Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
---
 drivers/cxl/core/pmem.c | 6 ------
 drivers/cxl/cxl.h       | 1 -
 2 files changed, 7 deletions(-)

diff --git a/drivers/cxl/core/pmem.c b/drivers/cxl/core/pmem.c
index 0f8166e793e14fc0b1c04ffda79e756a743d9e6b..8853415c106a98d0822f0a9f6d313937e8fe3614 100644
--- a/drivers/cxl/core/pmem.c
+++ b/drivers/cxl/core/pmem.c
@@ -51,12 +51,6 @@ struct cxl_nvdimm_bridge *to_cxl_nvdimm_bridge(struct device *dev)
 }
 EXPORT_SYMBOL_NS_GPL(to_cxl_nvdimm_bridge, "CXL");
 
-bool is_cxl_nvdimm_bridge(struct device *dev)
-{
-	return dev->type == &cxl_nvdimm_bridge_type;
-}
-EXPORT_SYMBOL_NS_GPL(is_cxl_nvdimm_bridge, "CXL");
-
 /**
  * cxl_find_nvdimm_bridge() - find a bridge device relative to a port
  * @port: any descendant port of an nvdimm-bridge associated
diff --git a/drivers/cxl/cxl.h b/drivers/cxl/cxl.h
index f6015f24ad3818966571e0aaea2b974f09af5f7c..064a15cf559f284f380b04011131c99a8f538cab 100644
--- a/drivers/cxl/cxl.h
+++ b/drivers/cxl/cxl.h
@@ -864,7 +864,6 @@ struct cxl_nvdimm_bridge *devm_cxl_add_nvdimm_bridge(struct device *host,
 						     struct cxl_port *port);
 struct cxl_nvdimm *to_cxl_nvdimm(struct device *dev);
 bool is_cxl_nvdimm(struct device *dev);
-bool is_cxl_nvdimm_bridge(struct device *dev);
 int devm_cxl_add_nvdimm(struct cxl_port *parent_port, struct cxl_memdev *cxlmd);
 struct cxl_nvdimm_bridge *cxl_find_nvdimm_bridge(struct cxl_port *port);
 

-- 
2.34.1


