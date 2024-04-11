Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0964FCD128A
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Apr 2024 08:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oX1Rk1GgphwG5vzMQN+AgshC3izxnJXC6gyo/OcXdas=; b=HpFjXDvGJ5aFkheFRKxpg4EFNI
	k7DWy3zUA6DqJLitcs21KWuocD0BSLVBgvPUY2ATjV5+d+pl1eh7a+GdBSKXhsyiOrXk9tw+MbL7l
	GCZyraxCmzJCRnDgiEgnDErwnjFVeBWdRPXoknWXJtBpnfq0m8I0y4FMz0LY5Os+txqZt6f8q/gds
	wIs/eO+QNxsDxH+gqeJFLI3fI7peK8Vq9cuv3yQ9a0MYuHH0U/lhlNV0rMeYWuyuXeAt6dve6NcDL
	d/kv+LVA3OCwKk4MOkAYWYtxVCgec7krNloV6C8VQDWTF4m+xGE6aDSj0uPHgRH1Ae24K0YXu0hKc
	3SAdFZGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rupjP-0000000B4TO-0qdS;
	Thu, 11 Apr 2024 08:24:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rupjL-0000000B4RP-32tE;
	Thu, 11 Apr 2024 08:24:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 24C4161D97;
	Thu, 11 Apr 2024 08:24:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DD2EC433F1;
	Thu, 11 Apr 2024 08:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712823862;
	bh=OTteXj13ozPvpXMPgkaG4Vll1Z9QS6hJCoj/YemDNOY=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=i9M8nzaUhMf5WeIHnKp+719OymyObxb/WOq0n/Uejh0zLigQNSujvF590a6jf5ocb
	 6rD4BqU2Vd9Zn2KopqCZGcj++AyIlq4vSstQHrUHQhcWX0B0WN4Jcscyl6T721Vk5E
	 FN0g8ALqsawJJEgntx60mavbPcXbYNLOmbxnmHHvvTEONUXf7u22NkmV2oz4GGmOOl
	 XQ3bkZr/VMI7zVk6HTgYeWkpyOd2YtYRQeK7AZjM+83fjfR+5gZc0I85v5any7KmbQ
	 XBgjOhupJjyO8yNNntKIe793EIThNwELEvY5BpTpAygokftYi19UpVllUZRuiRyu+7
	 +pzxuRjX1OiKg==
From: Kalle Valo <kvalo@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Felix Fietkau <nbd@nbd.name>,  Alexander Couzens <lynxis@fe80.eu>,
  linux-wireless@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,
  linux-mediatek@lists.infradead.org,  Lorenzo Bianconi
 <lorenzo@kernel.org>,  Ryder Lee <ryder.lee@mediatek.com>,  Shayne Chen
 <shayne.chen@mediatek.com>,  Sean Wang <sean.wang@mediatek.com>,  Matthias
 Brugger <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH wireless-next v1 1/1] wifi: mt76: mt7915: Remove unused
 of_gpio.h
References: <20240228200321.3607764-1-andriy.shevchenko@linux.intel.com>
	<ZhbOEqO4BIE4q7Vv@smile.fi.intel.com>
Date: Thu, 11 Apr 2024 11:24:18 +0300
In-Reply-To: <ZhbOEqO4BIE4q7Vv@smile.fi.intel.com> (Andy Shevchenko's message
	of "Wed, 10 Apr 2024 20:36:18 +0300")
Message-ID: <87o7agz4r1.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_012423_975706_D529B188 
X-CRM114-Status: UNSURE (   9.61  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:

> On Wed, Feb 28, 2024 at 10:03:21PM +0200, Andy Shevchenko wrote:
>> of_gpio.h is deprecated and subject to remove.
>> The driver doesn't use it, simply remove the unused header.
>
> What should be done to move this forward?

It's applied to the mt76 tree:

https://github.com/nbd168/wireless/commit/b648ed2b4645e9cd0285aba576cb6f800c218b30

It will come to wireless-next in the next pull request, usually there's
one per release.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

