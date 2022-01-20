Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC22FC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jan 2022 18:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Qx3fwpVfSFUefu/Q28rpg6am++QBfN9eedbF0ufVzuE=; b=ifbJVwCe7H5IbS
	OqUYIJzF68sNKivqJ2EFn4X2b2HEaCp1KY5Z9+gfOVC2DT65tKeF1Vnwy8dN3QfZ5lQ7lAGBVsVpn
	T6hmDmPvOE4RRvLSZ5bn/yv96zUhmP2HjjNBQGxahh+6UrmegEqlTuuFUnAKgKMIAOD/gndT2Oi63
	2LgjeOEv3Io6lVWGXKN8hySyR/8GA73qC0IY5IfPjpTCpG8PO0NTKtOYnWOvOVAGTq/bM+sVggRGE
	9aU2l2hCOXn0YUuoSJyBPk+CowBIVdWBRS/fJNo9yPR0WN/IbyXTL6A/HhL7oa1o212EqPF1w8EJ9
	0D1/83Rpu1C0iJZL/0ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAcee-00CtJH-U0; Thu, 20 Jan 2022 18:59:28 +0000
Received: from eu-shark1.inbox.eu ([195.216.236.81])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAceG-00CtCR-RF; Thu, 20 Jan 2022 18:59:07 +0000
Received: from eu-shark1.inbox.eu (localhost [127.0.0.1])
 by eu-shark1-out.inbox.eu (Postfix) with ESMTP id D607B6C00731;
 Thu, 20 Jan 2022 20:58:58 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.ee; s=20150108;
 t=1642705138; bh=504oCiTJWeqX2jIHwWg0su7+30XUh6cTSgg/DGfLsnE=;
 h=From:To:Cc:Subject:Date:Message-Id:X-ESPOL:from:date:to:cc;
 b=0dRKQo4EXfmf93758hL/sxQhMycvRQ87y0cIVDnwd3q6TCE33BEm4CKHqQWDJ7soE
 ATMB9dRsgF8BgINqCH2saY/8/ArGMcJAV5ncyza3z9nsAARERwIxNSKmihguE/E2Oa
 qT4ReOhBNmP3zDyymvLl/CthVLmzXKIc4MJKutSI=
Received: from localhost (localhost [127.0.0.1])
 by eu-shark1-in.inbox.eu (Postfix) with ESMTP id C8CE76C006AE;
 Thu, 20 Jan 2022 20:58:58 +0200 (EET)
Received: from eu-shark1.inbox.eu ([127.0.0.1])
 by localhost (eu-shark1.inbox.eu [127.0.0.1]) (spamfilter, port 35)
 with ESMTP id r9CYafVpjFgf; Thu, 20 Jan 2022 20:58:58 +0200 (EET)
Received: from mail.inbox.eu (eu-pop1 [127.0.0.1])
 by eu-shark1-in.inbox.eu (Postfix) with ESMTP id 7C0916C0049B;
 Thu, 20 Jan 2022 20:58:58 +0200 (EET)
From: Boris Lysov <arzamas-16@mail.ee>
To: linux-i2c@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Cc: qii.wang@mediatek.com
Subject: [PATCH 0/2] i2c: mediatek: remove mt6577 support
Date: Thu, 20 Jan 2022 21:58:51 +0300
Message-Id: <20220120185853.24266-1-arzamas-16@mail.ee>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Virus-Scanned: OK
X-ESPOL: 885ml41QGzuilFygRWXfAQ4r3FlEJo35mZS31AE76Hb7NCeCfEAJVBS0gR8IQDzn/iM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_105905_217740_522E75B8 
X-CRM114-Status: UNSURE (   6.17  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This small patch series removes mt6577 support from the i2c-mt65xx driver and
devicectree binding documentation.

The existing i2c-mt65xx driver relies on DMA since it was first introduced.
mt6577 does not support DMA [1] for I2C and SoC's Generic DMA engine cannot
be used for this purpose, too, which makes this particular driver incompatible
with mt6577 and other similar SoCs with same I2C IP.

[1] see references in
https://lists.infradead.org/pipermail/linux-mediatek/2021-October/030333.html

Boris Lysov (2):
  dt-bindings: i2c: i2c-mt65xx: remove compatibility with mt6577
  i2c: mediatek: remove compatibility with mt6577

 .../devicetree/bindings/i2c/i2c-mt65xx.txt    |  9 +++---
 drivers/i2c/busses/i2c-mt65xx.c               | 28 +++++++++----------
 2 files changed, 18 insertions(+), 19 deletions(-)

-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
