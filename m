Return-Path: <SRS0=DMob=CA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 889E3C433E1
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Aug 2020 08:19:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56F6A20825
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Aug 2020 08:19:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eiNBssJT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="bTS+Qnr4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56F6A20825
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VGeOuHyNBFqCPkRpPdJCWmJCIn0Uf7p/WIf5Ol6h6MU=; b=eiNBssJThRUy6OrFTj10g0h7G
	WbKWcu9Lv25yI8RH5Lhk+6MZim4pq6zG9AhRdjwCcj9Olq3SZev83SL13F6Kk8orAk2cmPe5f5x2C
	VTsKuA14D02uxUZFvWBdNKAtprXPG8UcKljsqenewMmUHzsoEXGQ3YnrhzhicwYFL9jqX95Mr8ibz
	UmxCkR28gm0YzmTXO+BoDGTu5CM37yV/qkSZksYC0ZQGgS053CQVCLwyIW7FOyn9oWHHy8UFsSxuW
	dOPUpw5ykqzZdKnalD2tuFbIxQXCQNqigj5T9e9hB7iJN9Bwm967ErV5gfkPBVerjNuYTTeG6YCWy
	HpilbR1yQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k9OkG-0007Iv-Dv; Sat, 22 Aug 2020 08:19:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k9Ok9-0007Ec-Rk; Sat, 22 Aug 2020 08:19:18 +0000
X-UUID: cb17223d093746778555204cb92137cc-20200822
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=1f1GqktsmoCBBHY58Mnms9zF6E9zoWUyHkZ1qxBjj5A=; 
 b=bTS+Qnr4b3tPMI41AdLVavYNePWv0WlNLuMWx31i5DZtW3XiQ9GPonkNfsG/s95mgvtnjGaP8lJc4OGI0amImT/WmbAQRilppyQRtpeJVHKdETZUMr4ETxqCUyjNrULgfsCYmk+SKnLA6Ek/r/1mVys5cpcqVK3+sh+H3ZO/PV0=;
X-UUID: cb17223d093746778555204cb92137cc-20200822
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 81445461; Sat, 22 Aug 2020 00:19:13 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 22 Aug 2020 01:09:21 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 22 Aug 2020 16:09:19 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 22 Aug 2020 16:09:17 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v3 11/11] iopoll: update kerneldoc of
 read_poll_timeout_atomic()
Date: Sat, 22 Aug 2020 16:05:53 +0800
Message-ID: <1598083553-31896-11-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1598083553-31896-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1598083553-31896-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 08DE332221603EEB4127FB0BA2C940C91FF642440EAC2E2737773133EF96AEEA2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200822_041918_082262_A707488B 
X-CRM114-Status: GOOD (  14.06  )
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
Cc: Felipe Balbi <balbi@kernel.org>,
 Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Alan Stern <stern@rowland.harvard.edu>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org
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
