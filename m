Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51615E77180
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Dec 2024 00:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+P6kTmCwDbC0RwMmjYjZfzPZ5o9SCTkxH8bGJ/DVcdQ=; b=p+S6V414S71exoQzzeaesHbWe8
	iFRkC8gLesZK0KuP+JnVy0fZ9lAvtNrVPINtMb86Jzb2i5u7fRjen4ZOJbBERDKNLso9vrLxblY7J
	77U6oWPvwYO9C2juI3IKH5OO8K7o7zfDSgY1D9QxNejHsxPF5TzRHHtZmcIRvRZIF+L319Kjy+eVz
	LD9OcuBGR4ttVNeY33vZmVs4WwHeoQu9KV1Xxy0cB6doQF+l0DG5kbuGFj6P8fWJLiq1AGp0PESGS
	Bn0lnxB33nRmMEYWWJgpIwFRFvNBj0YVh/UbCkyE5WDp0BwSW/4LmjFv1w2y6RhGIpgThsHAQeoAe
	kiDXT+pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLAJx-0000000DFiv-1smy;
	Wed, 11 Dec 2024 00:11:17 +0000
Received: from pv50p00im-ztdg10011901.me.com ([17.58.6.50])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLAJu-0000000DFhI-2Deo
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Dec 2024 00:11:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; t=1733875874;
	bh=+P6kTmCwDbC0RwMmjYjZfzPZ5o9SCTkxH8bGJ/DVcdQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:
	 x-icloud-hme;
	b=A2G4Fr6Ga6cVgux12r3mj2O9uL5jIcyFXHdjjqLRUtrEdEAwO7iZHiUi5FF6UPVWo
	 hkulrf+wv/Im1f51OENPnQuBkzjqse1+qZAWDlM/Ma/ogIYBbBc5z987he4q/Jfl/j
	 jqoFvMwL1Dxn9aXwXtEZHj1xbx0kYWW9yoj14b+sc93PJCVGG73JrsnCffz2e+UQam
	 moqZ3JxqtqDb6QrUFF3T4ZHUf07FMnmWcCqxambSLziZyyUYRBLY1FDHbpm8nZRlL4
	 b1ndYET1hWQUqdrGPGb1qMfeSNR//QUsLeZ1GaVoFEHlo6HuTD5NfJJdJ3tCpxtcTt
	 akO3dQKO/do/A==
Received: from [192.168.1.26] (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-ztdg10011901.me.com (Postfix) with ESMTPSA id E9BCD3A0349;
	Wed, 11 Dec 2024 00:11:03 +0000 (UTC)
From: Zijun Hu <zijun_hu@icloud.com>
Date: Wed, 11 Dec 2024 08:08:13 +0800
Subject: [PATCH v4 11/11] usb: typec: class: Remove both cable_match() and
 partner_match()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241211-const_dfc_done-v4-11-583cc60329df@quicinc.com>
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
X-Proofpoint-ORIG-GUID: qwQLilRFtH8fzUdgAlR9P2gaSWkwiO3A
X-Proofpoint-GUID: qwQLilRFtH8fzUdgAlR9P2gaSWkwiO3A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-10_13,2024-12-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 spamscore=0 mlxlogscore=950 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2412100174
X-Apple-Remote-Links: v=1;h=KCk=;charset=UTF-8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_161114_599683_A04E6132 
X-CRM114-Status: GOOD (  12.30  )
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

cable_match(), as matching function of device_find_child(), matches
a device with device type @typec_cable_dev_type, and its task can be
simplified by the recently introduced API device_match_type().

partner_match() is similar with cable_match() but with a different
device type @typec_partner_dev_type.

Remove both functions and use the API plus respective device type instead.

Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
---
 drivers/usb/typec/class.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 601a81aa1e1024265f2359393dee531a7779c6ea..3a4e0bd0131774afd0d746d2f0a306190219feec 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -1282,11 +1282,6 @@ const struct device_type typec_cable_dev_type = {
 	.release = typec_cable_release,
 };
 
-static int cable_match(struct device *dev, const void *data)
-{
-	return is_typec_cable(dev);
-}
-
 /**
  * typec_cable_get - Get a reference to the USB Type-C cable
  * @port: The USB Type-C Port the cable is connected to
@@ -1298,7 +1293,8 @@ struct typec_cable *typec_cable_get(struct typec_port *port)
 {
 	struct device *dev;
 
-	dev = device_find_child(&port->dev, NULL, cable_match);
+	dev = device_find_child(&port->dev, &typec_cable_dev_type,
+				device_match_type);
 	if (!dev)
 		return NULL;
 
@@ -2028,16 +2024,12 @@ const struct device_type typec_port_dev_type = {
 /* --------------------------------------- */
 /* Driver callbacks to report role updates */
 
-static int partner_match(struct device *dev, const void *data)
-{
-	return is_typec_partner(dev);
-}
-
 static struct typec_partner *typec_get_partner(struct typec_port *port)
 {
 	struct device *dev;
 
-	dev = device_find_child(&port->dev, NULL, partner_match);
+	dev = device_find_child(&port->dev, &typec_partner_dev_type,
+				device_match_type);
 	if (!dev)
 		return NULL;
 
@@ -2170,7 +2162,9 @@ void typec_set_pwr_opmode(struct typec_port *port,
 	sysfs_notify(&port->dev.kobj, NULL, "power_operation_mode");
 	kobject_uevent(&port->dev.kobj, KOBJ_CHANGE);
 
-	partner_dev = device_find_child(&port->dev, NULL, partner_match);
+	partner_dev = device_find_child(&port->dev,
+					&typec_partner_dev_type,
+					device_match_type);
 	if (partner_dev) {
 		struct typec_partner *partner = to_typec_partner(partner_dev);
 
@@ -2334,7 +2328,9 @@ int typec_get_negotiated_svdm_version(struct typec_port *port)
 	enum usb_pd_svdm_ver svdm_version;
 	struct device *partner_dev;
 
-	partner_dev = device_find_child(&port->dev, NULL, partner_match);
+	partner_dev = device_find_child(&port->dev,
+					&typec_partner_dev_type,
+					device_match_type);
 	if (!partner_dev)
 		return -ENODEV;
 
@@ -2361,7 +2357,8 @@ int typec_get_cable_svdm_version(struct typec_port *port)
 	enum usb_pd_svdm_ver svdm_version;
 	struct device *cable_dev;
 
-	cable_dev = device_find_child(&port->dev, NULL, cable_match);
+	cable_dev = device_find_child(&port->dev, &typec_cable_dev_type,
+				      device_match_type);
 	if (!cable_dev)
 		return -ENODEV;
 

-- 
2.34.1


