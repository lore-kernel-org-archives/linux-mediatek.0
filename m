Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8186DE7716D
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Dec 2024 00:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zd4Z+LUSUmVX1tZxUu8GLb6CT3mj3LxDJVxQvX7Zpgc=; b=YDwtV+X7CxVaxzt1E2hw6gtvz2
	JVTfo89g2zF1QZLAtAbEzYyyPe4J9r4X/z1hTJoiRypaS0BvrbnXKDfCTOBVVpwqooNfG0IW2XfFJ
	zQiOFIm8kzJzyZ83XqpSdVIu6YTnYmY5pGqyjazzlpSmpEVDM3d667Hy8Vy+F7VbxJSnFLCU6tME1
	oDwFFdDxyyMW5adIF7KrTGpNJKXMcYwrmgA9FGntWpf7/HDT7y/juHuLsHkOTh3v6AoGmnge3Trwb
	ML5Xc3icOaUaG3hpQ4h8wSrR8OpC5E+B2cIR/giflSqQhd3clgoULt2ePJu5Vvpma5nOgqfXQR2D9
	cLWVc1sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIzUK-0000000EIyz-24ko;
	Thu, 05 Dec 2024 00:13:00 +0000
Received: from pv50p00im-tydg10011801.me.com ([17.58.6.52])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIzUI-0000000EIyK-3Ud3
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Dec 2024 00:12:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; t=1733357578;
	bh=Zd4Z+LUSUmVX1tZxUu8GLb6CT3mj3LxDJVxQvX7Zpgc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:
	 x-icloud-hme;
	b=pdelZSHCkQy9UkIa1tDGGVvjGOFtlRum9Qu0R9rrxX3gWsob9LEBbiMHdG6dJDHLw
	 znd4Tq7WXvNEmOvQ/7xyOSXBUCccIN0ruruz1rM07YdKirdc0Wz19qLPWYVyWDgKST
	 B5LhiGOiNZ9090RtiqOqqg6J6Y+/2mvKI710y4W/864dJrsRLcrRvGclfHUv17932d
	 JxGzYbj5npctkp3IjuRsw+xXtPtaQoyMWAeWNV5TzSRkTuU5u8mcFXu9TAAUtoLWey
	 SVCL+7LsD/sLX7d1AqQCQ9rjdCHqaRS7Bu4mS9PyAWcjHSbX/Cxm9TMDblZj8df0oG
	 mHev6O2EcHEYg==
Received: from [192.168.1.26] (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-tydg10011801.me.com (Postfix) with ESMTPSA id B81CB800361;
	Thu,  5 Dec 2024 00:12:47 +0000 (UTC)
From: Zijun Hu <zijun_hu@icloud.com>
Date: Thu, 05 Dec 2024 08:10:19 +0800
Subject: [PATCH v3 10/11] cxl/pmem: Remove match_nvdimm_bridge()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-const_dfc_done-v3-10-1611f1486b5a@quicinc.com>
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
X-Proofpoint-ORIG-GUID: uSJRpr-uPiu2tTL8fSLiPLdSXYn6pdm7
X-Proofpoint-GUID: uSJRpr-uPiu2tTL8fSLiPLdSXYn6pdm7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-04_19,2024-12-04_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 spamscore=0 mlxlogscore=952 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2308100000 definitions=main-2412040186
X-Apple-Remote-Links: v=1;h=KCk=;charset=UTF-8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_161258_890222_0DD147A3 
X-CRM114-Status: GOOD (  10.83  )
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

match_nvdimm_bridge(), as matching function of device_find_child(), is to
match a device with device type @cxl_nvdimm_bridge_type, and is unnecessary

Remove it and use API device_match_type() plus the device type instead.

Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
---
 drivers/cxl/core/pmem.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/cxl/core/pmem.c b/drivers/cxl/core/pmem.c
index a8473de24ebfd92f12f47e0556e28b81a29cff7c..0f8166e793e14fc0b1c04ffda79e756a743d9e6b 100644
--- a/drivers/cxl/core/pmem.c
+++ b/drivers/cxl/core/pmem.c
@@ -57,11 +57,6 @@ bool is_cxl_nvdimm_bridge(struct device *dev)
 }
 EXPORT_SYMBOL_NS_GPL(is_cxl_nvdimm_bridge, "CXL");
 
-static int match_nvdimm_bridge(struct device *dev, const void *data)
-{
-	return is_cxl_nvdimm_bridge(dev);
-}
-
 /**
  * cxl_find_nvdimm_bridge() - find a bridge device relative to a port
  * @port: any descendant port of an nvdimm-bridge associated
@@ -75,7 +70,9 @@ struct cxl_nvdimm_bridge *cxl_find_nvdimm_bridge(struct cxl_port *port)
 	if (!cxl_root)
 		return NULL;
 
-	dev = device_find_child(&cxl_root->port.dev, NULL, match_nvdimm_bridge);
+	dev = device_find_child(&cxl_root->port.dev,
+				&cxl_nvdimm_bridge_type,
+				device_match_type);
 
 	if (!dev)
 		return NULL;

-- 
2.34.1


