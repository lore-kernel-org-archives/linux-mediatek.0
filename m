Return-Path: <SRS0=6IrV=4L=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55D92C35671
	for <linux-mediatek@archiver.kernel.org>; Sun, 23 Feb 2020 15:49:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29C5C206E0
	for <linux-mediatek@archiver.kernel.org>; Sun, 23 Feb 2020 15:49:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N+wHBKoR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="rbUsAmSa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29C5C206E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/REfa1JTM4vZHPxobUGfCRC0mgAnsk3gjQmFBod7QFw=; b=N+wHBKoRCh5Gh3
	qBOp8cf5mfmcJkHdttdh7G2QYC0Uv6mzRlFYqvJJlL8C5m0h7G7CZ7Su432sMm+wyf5CaXEydAevk
	xJxupxQGxdYmZ6VpWafxNvet91k56qgywCac+2OgcqpP8xZKY296lvA10T9iEjYdaWoxCHJvxy6v8
	/p/ODej6gA3iptDbpG39caKGMm1FQKRt79cVlf+QEpSDqKl6pCt5s23xvMAWs2IuN7IqII5D3xFnM
	zW7THRHPbWnJzzGvTi2FKRs2YqQ7ka+HePjmrHkQmE9u6sf9UlyyvlLEIE2KU6iuact4mUB80U5E+
	yZ9uE1V0pHOmr32RtFmA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j5tVm-0002Us-VT; Sun, 23 Feb 2020 15:49:42 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j5tVQ-0002If-3W; Sun, 23 Feb 2020 15:49:22 +0000
X-UUID: 3e88f9394abf45faa3fb208ec09ca814-20200223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=0nKH1cddPqIhprdICOy5mrIMOZ5r54kyLtHZf1Qc6t4=; 
 b=rbUsAmSaUKac7XbAmN9yZsihbYIy+rDemDxQRGEtTcx7e+tbsvnNjNUCcIfK+Ok1vmz92OfMZ86XnYpu9WOEBiX4cNMe5k0MVewwy3XgsSV9SCCUyInKjKltvdnodlOnF/N414PDBCZOZtgCvpkO0m39g5//U7x/iOqP8+cvPww=;
X-UUID: 3e88f9394abf45faa3fb208ec09ca814-20200223
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1794629040; Sun, 23 Feb 2020 07:49:14 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 23 Feb 2020 07:49:12 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 23 Feb 2020 23:48:24 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Sun, 23 Feb 2020 23:48:17 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Shen Jing
 <jingx.shen@intel.com>, Sasha Levin <sashal@kernel.org>, John Stultz
 <john.stultz@linaro.org>, Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Vincent Pelletier <plr.vincent@gmail.com>, Jerry Zhang
 <zhangjerry@google.com>, <linux-usb@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Mediatek WSD Upstream
 <wsd_upstream@mediatek.com>, CC Hwang <cc.hwang@mediatek.com>, Loda Chou
 <loda.chou@mediatek.com>, Al Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH v2] usb: gadget: f_fs: try to fix AIO issue under ARM 64 bit
 TAGGED mode
Date: Sun, 23 Feb 2020 23:49:07 +0800
Message-ID: <1582472947-22471-1-git-send-email-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200223_074920_155955_E05E7498 
X-CRM114-Status: GOOD (  10.21  )
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
Cc: Macpaul Lin <macpaul.lin@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This issue was found when adbd trying to open functionfs with AIO mode.
Usually, we need to set "setprop sys.usb.ffs.aio_compat 0" to enable
adbd with AIO mode on Android.

When adbd is opening functionfs, it will try to read 24 bytes at the
fisrt read I/O control. If this reading has been failed, adbd will
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
always passes user space address start with "0x3C" to gdaget's AIO
blocks. This tagged address will cause access_ok() check always fail.
Which causes later calculation in iterate_iovec() turn zero.
Copyout() won't copy data to userspace since the length to be copied
"v.iov_len" will be zero. Finally leads ffs_copy_to_iter() always return
-EFAULT, causes adbd cannot open functionfs and send
FUNCTIONFS_CLEAR_HALT.

Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
Changes for v2:
  - Fix build error for 32-bit load. An #if defined(CONFIG_ARM64) still need
    for avoiding undeclared defines.

 drivers/usb/gadget/function/f_fs.c |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index ce1d023..728c260 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -35,6 +35,7 @@
 #include <linux/mmu_context.h>
 #include <linux/poll.h>
 #include <linux/eventfd.h>
+#include <linux/thread_info.h>
 
 #include "u_fs.h"
 #include "u_f.h"
@@ -826,6 +827,10 @@ static void ffs_user_copy_worker(struct work_struct *work)
 	if (io_data->read && ret > 0) {
 		mm_segment_t oldfs = get_fs();
 
+#if defined(CONFIG_ARM64)
+		if (IS_ENABLED(CONFIG_ARM64_TAGGED_ADDR_ABI))
+			set_thread_flag(TIF_TAGGED_ADDR);
+#endif
 		set_fs(USER_DS);
 		use_mm(io_data->mm);
 		ret = ffs_copy_to_iter(io_data->buf, ret, &io_data->data);
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
