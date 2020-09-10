Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56EF8C433E2
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 08:34:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E331D2076D
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 08:34:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IVZu4BMr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="GX3llmpH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E331D2076D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VGeOuHyNBFqCPkRpPdJCWmJCIn0Uf7p/WIf5Ol6h6MU=; b=IVZu4BMr2HjsYmmPch1AT/07Y
	Xtp5ji4mMbapOMJsewuknvIsMMSmxTNOeePCm+JBqDeyzpN1uw03oNcSGQIjwS6iiTik1U+lVG3bo
	Jd0JiBxFsDp4rGp89gw9gtyiXMb+lBzlTyNMsCCmdzIksGCQF8zDORpJSFgpydNJ4J7L3BTsBgmNo
	zlUyGkTF6a5rpuf8JLHxWSpuhaan7iiaMBks1uAfnbLXxMYSB+lm55QJhJV+MrPa8FcIdgxVueeWo
	SGZzBLbrD5z3JMsotXZqqtc46GyLLGGQ5OtVbZDIEcQdE/JY1TeBtPeN+Ah05DrGIMgtGWfDJFyF+
	z6a92U2TQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGI2G-0005kO-8d; Thu, 10 Sep 2020 08:34:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGI20-0005cZ-1D; Thu, 10 Sep 2020 08:34:14 +0000
X-UUID: 8b53929810214337b3ab09122f13b8e5-20200910
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=1f1GqktsmoCBBHY58Mnms9zF6E9zoWUyHkZ1qxBjj5A=; 
 b=GX3llmpHl39QfJnjAiQHm3ftknssSTe3H0FI/rtv/TNB/cBvRLFlEkLeyKMCTSmufl3kTl3n7vE9kUzLSZw7P9GyEDN+7kxPqLybYjuM9Z+4129hDmgWo1Py6H8G7E7uPRTaTiVY1jTGVTfLfgBnfxDvn3MOS2EMZwANKuUF++o=;
X-UUID: 8b53929810214337b3ab09122f13b8e5-20200910
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1324692794; Thu, 10 Sep 2020 00:34:05 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Sep 2020 01:24:17 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Sep 2020 16:24:15 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 10 Sep 2020 16:24:13 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH RESEND v3 11/11] iopoll: update kerneldoc of
 read_poll_timeout_atomic()
Date: Thu, 10 Sep 2020 16:21:52 +0800
Message-ID: <1599726112-4439-11-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1599726112-4439-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1599726112-4439-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 678F10287C6AD8F68C030FC275638F71D4820C79F8C8E8D12FB532F6D55A8D832000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_043412_233203_7E8EC381 
X-CRM114-Status: GOOD (  14.96  )
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
Cc: Felipe Balbi <balbi@kernel.org>, Daniel
 Thompson <daniel.thompson@linaro.org>, linux-usb@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Mathias Nyman <mathias.nyman@intel.com>,
 Sumit Garg <sumit.garg@linaro.org>, linux-kernel@vger.kernel.org,
 Jann Horn <jannh@google.com>, Chuhong Yuan <hslester96@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Saurav Girepunje <saurav.girepunje@gmail.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Jason Yan <yanaijie@huawei.com>,
 linux-mediatek@lists.infradead.org,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Alan Stern <stern@rowland.harvard.edu>, Lee Jones <lee.jones@linaro.org>, Ben
 Dooks <ben.dooks@codethink.co.uk>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Arguments description of read_poll_timeout_atomic() is out of date,
update it.

Cc: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v3: fix typo in commit message suggested by Sergei

v2: new patch, suggested by Alan
---
 include/linux/iopoll.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/iopoll.h b/include/linux/iopoll.h
index bc89ac6..2c8860e 100644
--- a/include/linux/iopoll.h
+++ b/include/linux/iopoll.h
@@ -60,8 +60,7 @@
 /**
  * read_poll_timeout_atomic - Periodically poll an address until a condition is
  * 				met or a timeout occurs
- * @op: accessor function (takes @addr as its only argument)
- * @addr: Address to poll
+ * @op: accessor function (takes @args as its arguments)
  * @val: Variable to read the value into
  * @cond: Break condition (usually involving @val)
  * @delay_us: Time to udelay between reads in us (0 tight-loops).  Should
@@ -69,6 +68,7 @@
  *            Documentation/timers/timers-howto.rst).
  * @timeout_us: Timeout in us, 0 means never timeout
  * @delay_before_read: if it is true, delay @delay_us before read.
+ * @args: arguments for @op poll
  *
  * Returns 0 on success and -ETIMEDOUT upon a timeout. In either
  * case, the last read value at @args is stored in @val.
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
