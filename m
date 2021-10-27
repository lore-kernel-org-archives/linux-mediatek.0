Return-Path: <SRS0=3cxa=PP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68036C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 06:56:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 377A161073
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 06:56:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 377A161073
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Tmxz42kZ1d1Q9A7S1WNadj93YrHl9UuHKymC7E/QpY=; b=12QgfheHkRoQiJ
	jBgPcX35MxSTtaB7LxPwG22OxgR6R6a0ZR8p+94FqAznK08OdEhZ6yXiGVZIw1s3fDgBRnAA67QJ9
	WNiz78QEoIEWz8DnqkPjFKc8yZT3dlv2VQpvX8fgyS9ls3r3zvoXlNrwbgmqGYou4xDoRpc+ZKRL6
	V46wdAjkmAwtz8wA6PX0AjoiljQEXyZo2NHd8nJADnYyxO5NF5bbP+67qIEJz0Q2F0dVZKpvgqvKV
	HbJE3xqpF5L3/tySnmE4ZvhQr/x22qQmv0QI2y4yUyckiaiNVPquzC8tjfz4HHwskhTWW9sNjgHhu
	DPEDt3xLRPbquFKtDJqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfcqr-0044d8-OB; Wed, 27 Oct 2021 06:55:57 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1mfcqd-0044Zu-OG; Wed, 27 Oct 2021 06:55:43 +0000
Date: Tue, 26 Oct 2021 23:55:43 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Cc: agk@redhat.com, snitzer@redhat.com, dm-devel@redhat.com,
 matthias.bgg@gmail.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, tequila.yuang@mediatek.com,
 yj.chiang@mediatek.com
Subject: Re: [PATCH] dm: add module parameter bdev_wait
Message-ID: <YXj37wXtN0wQqwZx@infradead.org>
References: <20211022064748.30136-1-mark-pk.tsai@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211022064748.30136-1-mark-pk.tsai@mediatek.com>
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

On Fri, Oct 22, 2021 at 02:47:47PM +0800, Mark-PK Tsai wrote:
> dm_early_create() fail if the target block device not found in
> the late init stage.
> The block device is created in mmc_rescan() which kernel do
> it async by queue it into system_freezable_wq.
> Add module param bdev_wait to support waiting the block device
> ready before dm_early_create() like prepare_namespace() does.

This adds a busy loop.  There is a reason why we usually set up
stacking drivers from userspace, in that we have a working event
system there.  So the answer is not to add further hacks to the
in-kernel DM setup hack, but to stop using it.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
