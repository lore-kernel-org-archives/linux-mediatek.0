Return-Path: <SRS0=mhP0=ZU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C16ACC432C0
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Nov 2019 18:28:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 936AC21775
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Nov 2019 18:28:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c+LQ/lZo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 936AC21775
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=holtmann.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TlLxetmXEcfqMdFYXT3vk1MVSo2mkBQcMQujOE7eO54=; b=c+LQ/lZobW2JXn
	mc1plJVGG8RCk6pX1PjPgYraPKFHbwojLYFp4me9jPtfWCQ0M96r7/EL3SuywiawEzUdFxHYuBUDQ
	uHIP8ShduvHCCFoyda4c+09r6oFmHu6/Lqv4MWDxZL3SnwkbEORYfyk7iEa18i14lPPzG4CdhRvWJ
	DlsOBrpsuzjJQM0q8RfCPuYZtXXzujW91T+WRRMeeZCktL3tW2e6OW/z5Ny5BlzrqZd+FxPrNCHiI
	AGxla6MgBKUe7y53Vf30dwOKOyK9vJeIe6bwjB7vtqgeCDospH7WWIrx1jcj0IwG1XZ1GTU9UGPcM
	X2eM1f7cBmt++GhG9QOA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iaOWz-0004Cm-59; Thu, 28 Nov 2019 18:28:45 +0000
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iaOWv-0004Bd-06
 for linux-mediatek@lists.infradead.org; Thu, 28 Nov 2019 18:28:43 +0000
Received: from marcel-macbook.fritz.box (p4FF9F0D1.dip0.t-ipconnect.de
 [79.249.240.209])
 by mail.holtmann.org (Postfix) with ESMTPSA id DE51ECECCE;
 Thu, 28 Nov 2019 19:37:26 +0100 (CET)
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601.0.10\))
Subject: Re: [PATCH] Bluetooth: btusb: fix non-atomic allocation in completion
 handler
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20191128182427.21873-1-johan@kernel.org>
Date: Thu, 28 Nov 2019 19:28:18 +0100
Message-Id: <1083B04A-190D-4573-84A3-0F86AD6B5E6C@holtmann.org>
References: <20191128182427.21873-1-johan@kernel.org>
To: Johan Hovold <johan@kernel.org>
X-Mailer: Apple Mail (2.3601.0.10)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191128_102841_189938_C1390465 
X-CRM114-Status: UNSURE (   5.95  )
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
Cc: Johan Hedberg <johan.hedberg@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 lkml <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>,
 Bluez mailing list <linux-bluetooth@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Johan,

> USB completion handlers are called in atomic context and must
> specifically not allocate memory using GFP_KERNEL.
> 
> Fixes: a1c49c434e15 ("Bluetooth: btusb: Add protocol support for MediaTek MT7668U USB devices")
> Cc: stable <stable@vger.kernel.org>     # 5.3
> Cc: Sean Wang <sean.wang@mediatek.com>
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
> drivers/bluetooth/btusb.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
