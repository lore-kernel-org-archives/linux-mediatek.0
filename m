Return-Path: <SRS0=ht0X=4O=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 492ADC4BA0E
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 12:02:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CBB924656
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 12:02:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FSQGIv1G";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ENbT1nfH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CBB924656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TlERiejsIkkgBja+hCEvA9Jg8lL0xDHasr/HQm3xX3w=; b=FSQGIv1GGVXItl
	g+Ax78mRDT0uWFo9WIhe/7C04WflGoLiin3VIvr+6sRu61PQiZ8yWqXb5hrbKUihQLuwcw3scWePX
	AhNCpvZeUZEkHMAKprBL9BEF/0ixcQqtAiDspZRihir3Bt6G8wbZYStKVgDToLpgYqgOdzr/6j4/Y
	KLOXJiOOU5sjA5zb0y7RACq8undhfk4oIRwKt1ye6V7DCSPvxxF8iX1u7/7ClNn6+G5inc8Gi9CXA
	ZjG8MhqOS18DY7dzZ3bzYqn6mjXoNHFCMuEHLk7ILwBXPYwRTyfuftCw45PQwbCTQVCOa0QbsbC4e
	A850f/yveFBUoIs7orVw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6vOh-0004cA-HZ; Wed, 26 Feb 2020 12:02:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6vOS-0004Pd-MP; Wed, 26 Feb 2020 12:02:26 +0000
X-UUID: 18eb665f38ca4064bbf823ea432813ac-20200226
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=HeqaTDjIL0PTx6tfNZRsJGOB5wSUUqHsQNV/Ncz2fJc=; 
 b=ENbT1nfHLPmaa1KnVt+jRf/tknKxc2p2KiK+s6CU1rwJAp+Lk3CSRMzwDpCHeadWl1fqHuy8hhUWvULtNVcLJGPLWkNfldClAau63AQr7JW2Wod7LrFdac8b6i7YmPCYva695mdKqQLe76+fThWjqwBTnhRst8AF2MHGbGBUrjI=;
X-UUID: 18eb665f38ca4064bbf823ea432813ac-20200226
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2023036988; Wed, 26 Feb 2020 04:02:21 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 26 Feb 2020 04:02:58 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 26 Feb 2020 19:57:57 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Wed, 26 Feb 2020 20:01:57 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Shen Jing
 <jingx.shen@intel.com>, Sasha Levin <sashal@kernel.org>, John Stultz
 <john.stultz@linaro.org>, Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Vincent Pelletier <plr.vincent@gmail.com>, Jerry Zhang
 <zhangjerry@google.com>, <linux-usb@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Mediatek WSD Upstream
 <wsd_upstream@mediatek.com>, CC Hwang <cc.hwang@mediatek.com>, Loda Chou
 <loda.chou@mediatek.com>, Al Viro <viro@zeniv.linux.org.uk>,
 <stable@vger.kernel.org>, <andreyknvl@google.com>
Subject: [PATCH v4] usb: gadget: f_fs: try to fix AIO issue under ARM 64 bit
 TAGGED mode
Date: Wed, 26 Feb 2020 20:01:52 +0800
Message-ID: <1582718512-28923-1-git-send-email-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1582627315-21123-1-git-send-email-macpaul.lin@mediatek.com>
References: <1582627315-21123-1-git-send-email-macpaul.lin@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 272F8CE54AD6E67D73DACACA69671537612B9D56AD5648D8354972DCC44EFC2F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200226_040224_739274_FCFE9D27 
X-CRM114-Status: GOOD (  13.77  )
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
Cc: Peter Chen <peter.chen@nxp.com>, Miles Chen <miles.chen@mediatek.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>,
 Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This issue was found when adbd trying to open functionfs with AIO mode.
Usually, we need to set "setprop sys.usb.ffs.aio_compat 0" to enable
adbd with AIO mode on Android.

When adbd is opening functionfs, it will try to read 24 bytes at the
first read I/O control. If this reading has been failed, adbd will
try to send FUNCTIONFS_CLEAR_HALT to functionfs. When adbd is in AIO
mode, functionfs will be acted with asyncronized I/O path. After the
successful read transfer has been completed by gadget hardware, the
following series of functions will be called.
  ffs_epfile_async_io_complete() -> ffs_user_copy_worker() ->
    copy_to_iter() -> _copy_to_iter() -> copyout() ->
    iterate_and_advance() -> iterate_iovec()

Adding debug trace to these functions, it has been found that in
copyout(), access_ok() will check if the user space address is valid
to write. However if CONFIG_ARM64_TAGGED_ADDR_ABI is enabled, adbd
always passes user space address start with "0x3C" to gadget's AIO
blocks. This tagged address will cause access_ok() check always fail.
Which causes later calculation in iterate_iovec() turn zero.
Copyout() won't copy data to user space since the length to be copied
"v.iov_len" will be zero. Finally leads ffs_copy_to_iter() always return
-EFAULT, causes adbd cannot open functionfs and send
FUNCTIONFS_CLEAR_HALT.

Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Peter Chen <peter.chen@nxp.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Miles Chen <miles.chen@mediatek.com>
---
Changes for v4:
  - Abandon solution v3 by adding "TIF_TAGGED_ADDR" flag to gadget driver.
    According to Catalin's suggestion, change the solution by untagging 
    user space address passed by AIO in gadget driver.

Changes for v3:
  - Fix misspelling in commit message.
    Thanks for Peter's review.

Changes for v2:
  - Fix build error for 32-bit load. An #if defined(CONFIG_ARM64) still need
    for avoiding undeclared defines.

 drivers/usb/gadget/function/f_fs.c |   15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index ce1d023..192935f 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -715,7 +715,20 @@ static void ffs_epfile_io_complete(struct usb_ep *_ep, struct usb_request *req)
 
 static ssize_t ffs_copy_to_iter(void *data, int data_len, struct iov_iter *iter)
 {
-	ssize_t ret = copy_to_iter(data, data_len, iter);
+	ssize_t ret;
+
+#if defined(CONFIG_ARM64)
+	/*
+	 * Replace tagged address passed by user space application before
+	 * copying.
+	 */
+	if (IS_ENABLED(CONFIG_ARM64_TAGGED_ADDR_ABI) &&
+		(iter->type == ITER_IOVEC)) {
+		*(unsigned long *)&iter->iov->iov_base =
+			(unsigned long)untagged_addr(iter->iov->iov_base);
+	}
+#endif
+	ret = copy_to_iter(data, data_len, iter);
 	if (likely(ret == data_len))
 		return ret;
 
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
