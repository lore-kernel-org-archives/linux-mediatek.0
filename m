Return-Path: <SRS0=c7Bv=H4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A54EC433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Feb 2021 20:19:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8711B64EFA
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Feb 2021 20:18:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8711B64EFA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=holtmann.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:References:Message-Id:Date:In-Reply-To:From:
	Subject:Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hQqaYyBPpL5rDNzDJIexTq8OabKFFIdmB+L7FDDUdoE=; b=MN3lUsDIKBerAujIwq1YOZOqV
	AY4nSy+SCtsVqIAAOtE8cMyWuDJcpEnT/ApgttkoQWIw3bYjEiezbGDo6CodRYRRTbw6NxlmoQI8a
	DeitVSNpaEOlmPL5ewohZGOC9PKU4qNaQN29WV2MQsXEaryDCfSoMcpphWVE/0PzA2ww17iD/J4VA
	T1ujfmI1r2FN6bbLzDJbj0uHIkH8Kp12xQO7uk61oIwA1ehVbfJzg4q3X1og4LajaGgTTcGKgBZ0q
	HvWM165sDF5Dv9ewhrIQbmeNw43FIHZPSgh8hACKwj0u7Ys1/bxJ2H8JMhwXvPvpGmGzCmffurJ24
	RldggfQDw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFjZY-0004lv-7T; Fri, 26 Feb 2021 20:18:48 +0000
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFjZW-0004lZ-Fh
 for linux-mediatek@lists.infradead.org; Fri, 26 Feb 2021 20:18:47 +0000
Received: from marcel-macbook.holtmann.net (p4ff9fb90.dip0.t-ipconnect.de
 [79.249.251.144])
 by mail.holtmann.org (Postfix) with ESMTPSA id 33845CECF0;
 Fri, 26 Feb 2021 21:26:08 +0100 (CET)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH 1/1] Bluetooth: btusb: Fix incorrect type in assignment
 and uninitialized symbol
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210223062740.12067-1-mark-yw.chen@mediatek.com>
Date: Fri, 26 Feb 2021 21:18:35 +0100
Message-Id: <92470858-9C75-4F77-AC70-B56DEE423255@holtmann.org>
References: <20210223062740.12067-1-mark-yw.chen@mediatek.com>
To: Mark Chen <Mark-YW.Chen@mediatek.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210226_151846_643976_87317042 
X-CRM114-Status: UNSURE (   8.91  )
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
Cc: lkp@intel.com, Sean.Wang@mediatek.com, linux-kernel@vger.kernel.org,
 Bluetooth Kernel Mailing List <linux-bluetooth@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, Johan Hedberg <johan.hedberg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Mark,

> Warnings: drivers/bluetooth/btusb.c:3775 btusb_mtk_setup() error:
> uninitialized symbol 'fw_version'.
> -> add initial value for fw_version.
> 
> Warnings: sparse: sparse: incorrect type in assignment (different base
> types)
> -> add le32_to_cpu to fix incorrect type in assignment.
> 
> Signed-off-by: mark-yw.chen <mark-yw.chen@mediatek.com>
> ---
> drivers/bluetooth/btusb.c | 8 ++++----
> 1 file changed, 4 insertions(+), 4 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
