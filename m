Return-Path: <SRS0=GsAT=ZG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58008C43141
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Nov 2019 02:33:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FEEA206F3
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Nov 2019 02:33:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="facgcm68";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="DE1IpPyB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FEEA206F3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/wpdThyS46BKlYm/HCDQDSz4z5JMYBoi0Hs4zjN6kTI=; b=facgcm6857v9hd
	JT7LF6laXQcLcPurxi364HticAfMhhPNpS4ouIG9ULVGaxUOOvsIh26seqyeFNwCN12jKHXwoZW61
	8i5tIpVLVLX22Pgg3taCfSC2MRj9zeQznpnpbffBedZsH+J9ArCj4OgLx443vPtnWPp3nsC96jHVy
	0nVa4tIQaV5BfHHOdt7RlKjfWfVaL2QJj0Js5I3kbhIWHY8cP41I9Wo6ehNBR0WDrXvr8O4gTXTeN
	rV+N7fbiUY3Yy0TMG9TPuCnyTpJ1xhXf03eMD2G2blRGbFZZQS+3iqKlg32Zrhp/vkmtLmcJpCoy9
	J0GPRQjaMPpzcRiV60wA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iV4x8-0002AT-0p; Thu, 14 Nov 2019 02:33:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iV4x5-00029u-IA; Thu, 14 Nov 2019 02:33:45 +0000
X-UUID: 4dd235c4d2234f9299126564d22a0cb4-20191113
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=jdpcBWc7HBlDBSHQj9W7l/lAc9ZUoty9ehXTUgWCTGw=; 
 b=DE1IpPyBL+mC1m1knTLKZFTpztGf8k13sLrkBIVTY6cyZX7Le3W/Huc0mCBlTe82eBmGGdmRI5p6xCcEzGIWGgk0rWP47CbEBZXXM86lDwTe2Kf1M/dQ7CGelnvi8/9ZPZkvSYG2hjOKWWyv05Lh/pAkHSveOOjHJTh2Q9HLqt0=;
X-UUID: 4dd235c4d2234f9299126564d22a0cb4-20191113
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 759150441; Wed, 13 Nov 2019 18:33:30 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 13 Nov 2019 18:33:30 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 14 Nov 2019 10:33:21 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 14 Nov 2019 10:33:20 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Tianping Fang <tianping.fang@mediatek.com>
Subject: [RFC PATCH] usb: mtu3: fix random remote wakeup
Date: Thu, 14 Nov 2019 10:33:11 +0800
Message-ID: <1573698791-24310-1-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2075714ACED72CBB15C4DCA956E5D8B2E8C542FC8427F2F77C2C39642685507E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191113_183343_613512_862DD19C 
X-CRM114-Status: UNSURE (   8.73  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Wakeup_signal will toggle status according to ssusb_ip_sleep signal
after debounce time, so need add a delay time and wait for wakeup_signal
toggle to complete, then enable the remote wakeup. Meanwhile reduce the
debounce time of wakeup_signal. These will avoid spurious wakeup event.

Signed-off-by: Tianping Fang <tianping.fang@mediatek.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
Note, depends on following patch not merged:

    [v3,3/7] usb: mtu3: support ip-sleep wakeup for MT8183
    https://patchwork.kernel.org/patch/11123151/
---
 drivers/usb/mtu3/mtu3_host.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3_host.c b/drivers/usb/mtu3/mtu3_host.c
index 182c9439c15a..ca48ff751c8b 100644
--- a/drivers/usb/mtu3/mtu3_host.c
+++ b/drivers/usb/mtu3/mtu3_host.c
@@ -53,12 +53,12 @@ static void ssusb_wakeup_ip_sleep_set(struct ssusb_mtk *ssusb, bool enable)
 	case SSUSB_UWK_V0:
 		reg = ssusb->uwk_reg_base + PERI_WK_CTRL0;
 		msk = (u32)(WC0_IS_EN | WC0_IS_C(0xf) | WC0_IS_P);
-		val = enable ? (WC0_IS_EN | WC0_IS_C(0x8)) : 0;
+		val = enable ? (WC0_IS_EN | WC0_IS_C(0x3)) : 0;
 		break;
 	case SSUSB_UWK_V1:
 		reg = ssusb->uwk_reg_base + PERI_WK_CTRL1;
 		msk = WC1_IS_EN | WC1_IS_C(0xf) | WC1_IS_P;
-		val = enable ? (WC1_IS_EN | WC1_IS_C(0x8)) : 0;
+		val = enable ? (WC1_IS_EN | WC1_IS_C(0x3)) : 0;
 		break;
 	case SSUSB_UWK_V2:
 		reg = ssusb->uwk_reg_base + PERI_SSUSB_SPM_CTRL;
@@ -197,6 +197,8 @@ int ssusb_host_disable(struct ssusb_mtk *ssusb, bool suspend)
 			  (value & SSUSB_IP_SLEEP_STS), 100, 100000);
 	if (ret)
 		dev_err(ssusb->dev, "ip sleep failed!!!\n");
+	else  /* wait for wakeup_signal toggle done after enter ip-sleep */
+		usleep_range(245, 255);
 
 	return ret;
 }
-- 
2.23.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
