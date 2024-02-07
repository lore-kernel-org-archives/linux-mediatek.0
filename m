Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F133FC4828D
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Feb 2024 14:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wohSP/o395AqmnspsciLRSV0QKAIVkChCcKAi+g9bZc=; b=SmqVc5oo1a7oJbCuPBZhAgcEYf
	r3gVjMFmPvCin08eZlJDwcUUjVAU2ioGmZ5WeWs9f4b3NpIwV/aqo0wZfHOSO9DvDAF0iRLXJPfGH
	gVCGicj7JzrYPc82fqJ/VMRikASekd1IyBK2Yj9T0xQ/Dg4YU5CZtRZV/f/q+ZeeAAX9tb1WNb+2D
	j267YCxRUNn8pxHDp/87dnGJ0REmufBp51S/LxIiBm53tF2D15xtjv51YPRbAv5O0Sa0f66pr9Idw
	pXggi8gqkfqPFOoUhDDc7Eg+r1lWmUWN+Pt5T6KNin4iNqp6N7wlJ3in5jHBZOLOytt/6b/9zGmY1
	ngg6/L7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXjLk-0000000B0I6-2giu;
	Wed, 07 Feb 2024 14:56:32 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXjLh-0000000B0GC-09dh;
	Wed, 07 Feb 2024 14:56:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CF798CE1917;
	Wed,  7 Feb 2024 14:56:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2521EC433C7;
	Wed,  7 Feb 2024 14:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707317784;
	bh=nCxQ8fGvuEcmb7qfNQBjMnRhra6lyUgdE8qqI+GeNOE=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=EfZIOFsbNQM3dkm04/Qj0EZ243NsK9ajRBm2H+sB5OzsyUN3vEQGbDwa9uZSqeTEE
	 5lcSSmrbC1fbtfZPkKSWg/wBOGX6FpSUT8bQuVjHFV504oi1/pOInXJgvi1r6CxC2+
	 pyMsS4DAJ6599icKOl/tyHmpN3d1F0hHFSinMRK1oSoXzhg6KZB3YyjfnQC3oxqCWk
	 oRD2sL03j4bxIvU1rtzlXwbY2Vpw523rOqsLdVCICdyyKlfSVk4tNp80EvfqlAOtNp
	 d7tZMtmpWdgAGmHo+jo+2G//1pnIfsHzLQdUjIynAJOYoB7aavvW3fi4GQsPcqPez1
	 WiL4bNo+KjxaQ==
From: Kalle Valo <kvalo@kernel.org>
To: "Colin King (gmail)" <colin.i.king@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>,  Lorenzo Bianconi <lorenzo@kernel.org>,
  Ryder Lee <ryder.lee@mediatek.com>,  Shayne Chen
 <shayne.chen@mediatek.com>,  Sean Wang <sean.wang@mediatek.com>,  Matthias
 Brugger <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,
  linux-wireless@vger.kernel.org,  linux-mediatek@lists.infradead.org,
  kernel-janitors@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH][next] mt76: Remove redundant assignment to variable tidno
References: <20240207131113.2450297-1-colin.i.king@gmail.com>
	<87il30h03n.fsf@kernel.org>
	<13e2f96c-2434-4266-8a5e-25b267d1fb0e@gmail.com>
Date: Wed, 07 Feb 2024 16:56:20 +0200
In-Reply-To: <13e2f96c-2434-4266-8a5e-25b267d1fb0e@gmail.com> (Colin King's
	message of "Wed, 7 Feb 2024 14:53:51 +0000")
Message-ID: <87wmrgpbl7.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_065629_271862_6A88764B 
X-CRM114-Status: UNSURE (   7.90  )
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

"Colin King (gmail)" <colin.i.king@gmail.com> writes:

> On 07/02/2024 13:31, Kalle Valo wrote:
>> Colin Ian King <colin.i.king@gmail.com> writes:
>> 
>>> The variable tidno is being assigned a value that is not being read
>>> and is being re-assigned a new value a few statements later.
>>> The assignment is redundant and can be removed.
>>>
>>> Cleans up clang scan warning:
>>> drivers/net/wireless/mediatek/mt76/agg-rx.c:125:5: warning: Value stored
>>> to 'tidno' during its initialization is never read [deadcode.DeadStores]
>>>
>>> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
>> "wifi:" missing from title.
>> 
> does this require a V2?

Up to Felix, my guess is that he can add it during commit.


-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

