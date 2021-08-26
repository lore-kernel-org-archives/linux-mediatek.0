Return-Path: <SRS0=zgIi=NR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF651C432BE
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Aug 2021 08:37:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6DF060EE0
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Aug 2021 08:37:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A6DF060EE0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XC9NYCUc9uX99hGVLAD5qtl3ZZt9uUJ692o4AFnbcQA=; b=DixBKaiKVzN3d0
	Hx36DVugDoMwpEyGalUZj5oH9ck7f8w23Eh/RSnLokxIcPHyzTOa+Q9lCnLz2G6zUdSZbn5V34hwY
	DySaqitdcww35OKdu5g8i4a1Qv0lOoih5tm8xRRzwk5D9AyCOboiU+8BDqoRm+Ok8vx6tOJJsiXrc
	qxe7QJyShbpBG178iR4tNbyhu3AKdN45p5q2IxPx4gw2XQjdd1g5oIKqiEUKDLYxMAc78/jXhMHw4
	pOH1cIYoXcGLgCJ/CFjPUhWWBpFitFknBsgeqP+cmldM8cbTSOUcB6loJENaafN66IsqhRN3WwfJz
	PF6H82KrFxyMaeK3Z4bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJAsh-009YiS-Hi; Thu, 26 Aug 2021 08:37:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJAsa-009YhQ-SE; Thu, 26 Aug 2021 08:37:01 +0000
X-UUID: dd691a6f0f5644189eb5424becf5e580-20210826
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=N/u4iRMCuKFghIoysBLXcv5DYOg1m4HaMJT0M54I9ec=; 
 b=MvhW+yBITfeEyCO2LTGREUeyHDE7a/pD0b7i25ALwwKelQ5za5IqdYnWc91GIxXsJLTXyEpDs0u1NMPsgL+/UMInCBCn/1AdkHqd8l62pb2HzkRgcNU22T46esvY6CHP/VhtZ0Qc7KruVIvRZrDN4yY/lnrdIlYX35ERJ6u9Rck=;
X-UUID: dd691a6f0f5644189eb5424becf5e580-20210826
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 74640494; Thu, 26 Aug 2021 01:36:54 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 26 Aug 2021 01:36:52 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 26 Aug 2021 16:36:38 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 26 Aug 2021 16:36:38 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Eddie Hung <eddie.hung@mediatek.com>,
 <stable@vger.kernel.org>
Subject: [PATCH next 2/2] usb: mtu3: fix random remote wakeup
Date: Thu, 26 Aug 2021 16:36:37 +0800
Message-ID: <20210826083637.33237-2-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210826083637.33237-1-chunfeng.yun@mediatek.com>
References: <20210826083637.33237-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_013657_492874_15866D50 
X-CRM114-Status: GOOD (  14.28  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Some platforms, e.g. 8183/8192, use low level latch way to keep
wakeup signal, it may latch a wrong signal if debounce more time,
and enable wakeup earlier.
                   ____________________
ip_sleep      ____/                    \__________
                           ___________________
wakeup_signal ____________/                   \______
                      _______________________________
wakeup_en     _______/
                      ^     ^
                      |(1)  |(2)
latch wakeup_signal mistakenly at (1), should latch it at (2);

Workaround: delay about 100us to enable wakeup, meanwhile decrease
debounce time.

Fixes: b1a344589eea ("usb: mtu3: support ip-sleep wakeup for MT8183")
Cc: stable@vger.kernel.org
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/mtu3/mtu3_host.c | 2 +-
 drivers/usb/mtu3/mtu3_plat.c | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/mtu3/mtu3_host.c b/drivers/usb/mtu3/mtu3_host.c
index 7d528f3c2482..f3903367a6a0 100644
--- a/drivers/usb/mtu3/mtu3_host.c
+++ b/drivers/usb/mtu3/mtu3_host.c
@@ -62,7 +62,7 @@ static void ssusb_wakeup_ip_sleep_set(struct ssusb_mtk *ssusb, bool enable)
 	case SSUSB_UWK_V1_1:
 		reg = ssusb->uwk_reg_base + PERI_WK_CTRL0;
 		msk = WC0_IS_EN | WC0_IS_C(0xf) | WC0_IS_P;
-		val = enable ? (WC0_IS_EN | WC0_IS_C(0x8)) : 0;
+		val = enable ? (WC0_IS_EN | WC0_IS_C(0x1)) : 0;
 		break;
 	case SSUSB_UWK_V1_2:
 		reg = ssusb->uwk_reg_base + PERI_WK_CTRL0;
diff --git a/drivers/usb/mtu3/mtu3_plat.c b/drivers/usb/mtu3/mtu3_plat.c
index 5b3f7f73cb40..f13531022f4a 100644
--- a/drivers/usb/mtu3/mtu3_plat.c
+++ b/drivers/usb/mtu3/mtu3_plat.c
@@ -63,6 +63,9 @@ static int wait_for_ip_sleep(struct ssusb_mtk *ssusb)
 	if (ret) {
 		dev_err(ssusb->dev, "ip sleep failed!!!\n");
 		ret = -EBUSY;
+	} else {
+		/* workaround: avoid wrong wakeup signal latch for some soc */
+		usleep_range(100, 200);
 	}
 
 	return ret;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
