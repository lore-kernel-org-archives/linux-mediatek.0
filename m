Return-Path: <SRS0=W1mV=QC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3957C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Nov 2021 18:58:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D10B60EB2
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Nov 2021 18:58:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7D10B60EB2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RARB8499AoHy5I81TLzpaXHt1myl4nDGD8I7lyU1+UI=; b=wPAFZkMpROCn09
	lre9HdOtxvLam/O6SkVN73JVUwe9rCYIl3As2UuEJeo6zyJiWuQq0iZxxauk2olEMHjqp13WkEcS8
	eWnbXbdaXfFSu6Zl40nSs9mZXjcCSSkMtKnQO/FsMs/j0aey9jbO9omhzvs+xsfYdgpCYq/WOuMOK
	el8u+/oRoPRiawRDwoJ9iOnRCoEBWNjBlhyshSxxuS7b2a2blZKlB17HX2TwF2+mCG+FLhilVUFn6
	3aNmFujTqKc8Fe8oyevjLtQ3BpKcP85DUvOx4FDCXYjNYt4DSZVSBMk/MdX8/JNi6idjVulgaBYIQ
	dXKKwWH5/FXF90u/q1ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmhAx-00GnZl-Im; Mon, 15 Nov 2021 18:57:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmhAX-00GnQl-FX
 for linux-mediatek@lists.infradead.org; Mon, 15 Nov 2021 18:57:30 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 975486348C;
 Mon, 15 Nov 2021 18:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1637002649;
 bh=a2gwHSopEmrMWCKLi/RmnFjPijvwE1uhhxTBII19q5k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dlIdYrnn8Fq8xxfqLGYitML4974EH5eolBKUe2nGLzUWoTd/cgjHNlXhKHf9xD053
 OkaD1sELzN1b7VnuUHq7MZoauuWuD43mtkoD1E1ixHBKrkxwyowL93ZAQUQoJgnSXn
 A8xOVeNcqvKU8misqdJdCIXAIchkUbDp2yR2QgDA=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org,
 Bin Liu <b-liu@ti.com>, Min Guo <min.guo@mediatek.com>,
 Yonglong Wu <yonglong.wu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Randy Dunlap <rdunlap@infradead.org>, Sasha Levin <sashal@kernel.org>
Subject: [PATCH 5.15 629/917] usb: musb: select GENERIC_PHY instead of
 depending on it
Date: Mon, 15 Nov 2021 18:02:04 +0100
Message-Id: <20211115165450.134262357@linuxfoundation.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211115165428.722074685@linuxfoundation.org>
References: <20211115165428.722074685@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_105729_564867_01E3B5B7 
X-CRM114-Status: GOOD (  11.49  )
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

From: Randy Dunlap <rdunlap@infradead.org>

[ Upstream commit fde1fbedbaed4e76cef4600d775b185f59b9b568 ]

The kconfig symbol GENERIC_PHY says:
  All the users of this framework should select this config.
and around 136 out of 138 drivers do so, so change USB_MUSB_MEDIATEK
to do so also.

This (also) fixes a long circular dependency problem for an upcoming
patch.

Fixes: 0990366bab3c ("usb: musb: Add support for MediaTek musb controller")
Cc: Bin Liu <b-liu@ti.com>
Cc: Min Guo <min.guo@mediatek.com>
Cc: Yonglong Wu <yonglong.wu@mediatek.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-mediatek@lists.infradead.org
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Link: https://lore.kernel.org/r/20211005235747.5588-1-rdunlap@infradead.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/musb/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/musb/Kconfig b/drivers/usb/musb/Kconfig
index 8de143807c1ae..4d61df6a9b5c8 100644
--- a/drivers/usb/musb/Kconfig
+++ b/drivers/usb/musb/Kconfig
@@ -120,7 +120,7 @@ config USB_MUSB_MEDIATEK
 	tristate "MediaTek platforms"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
 	depends on NOP_USB_XCEIV
-	depends on GENERIC_PHY
+	select GENERIC_PHY
 	select USB_ROLE_SWITCH
 
 comment "MUSB DMA mode"
-- 
2.33.0




_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
