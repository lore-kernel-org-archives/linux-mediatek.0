Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31407C32771
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Sep 2022 13:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lJ3jomivZA07x4+crqVYAYiJ4JPuWwg7XxM8GfHh5Ek=; b=17x2PuFlnQOPZe5lvtYG3X6ubb
	etqvg/ebd6dMZbJF32KMwgtLynwWtGMQdPl51ULRl2kdiGGxzELJp/YcB2YiuXxYfph7FlfskAW7d
	ReCL1AkP5/GPQOviSruQakMSyjsKJHrbU/ewM187Ndj6m9pnOLoIcMkXtl3mgZ96pIDdT9XuyWTSI
	0YfaprkyZj9tFNlsFswoJ1uZNgIzcjuM/ADAFCyBwZIHJne5GRAAUw0y70NLJ72BBSdjUn04/xQuc
	z5oNHHRhFJBj9uq9cC0gzYk1EcxVUgr0fAI9Nfuq5s9IOp2imLFhRL/RqksHhAl3AY4fW1ww9j3bj
	50WidgVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oazVp-00BO7R-Rd; Wed, 21 Sep 2022 13:11:37 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oazVb-00BO5a-HN; Wed, 21 Sep 2022 13:11:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 4A405CE1D0C;
	Wed, 21 Sep 2022 13:11:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBEBCC433D6;
	Wed, 21 Sep 2022 13:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663765873;
	bh=lJ3jomivZA07x4+crqVYAYiJ4JPuWwg7XxM8GfHh5Ek=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ekElD55gmm4KH5Z6CdE8SxizwhDiq/Pj7FmOB8coZPFO49qclsVSDzDtmPAuiDkwB
	 DHvUJBrwmolYQ9acEs9VA+UTJY/TRJE4ChJ6Eiqs/2uyjXOLviVCcs4doDcV7DBeDx
	 hXtLClP0xdCYXl4cf/90ezwrLrW/thv26D8nJgnq0b76QygfswQUNSpAvysuEVmUcm
	 89mfwFGPXNRn5X+XzixNkgCPAgRceGRwbpl7QKvY8XFqPssYmi7grutTk18JbfDuBG
	 5MbckeUfAXzCLOLxnyfshj4vYm2s9XXiTdPmZm2ZLCAgMXkmsjiutOhTYJuzG7zJej
	 4s61gWqp72llw==
Date: Wed, 21 Sep 2022 06:11:11 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Gaosheng Cui <cuigaosheng1@huawei.com>
Cc: <idosch@nvidia.com>, <petrm@nvidia.com>, <davem@davemloft.net>,
 <edumazet@google.com>, <pabeni@redhat.com>, <nbd@nbd.name>,
 <lorenzo@kernel.org>, <ryder.lee@mediatek.com>, <shayne.chen@mediatek.com>,
 <sean.wang@mediatek.com>, <kvalo@kernel.org>, <matthias.bgg@gmail.com>,
 <amcohen@nvidia.com>, <stephen@networkplumber.org>,
 <netdev@vger.kernel.org>, <linux-wireless@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 2/5] mt76: Remove unused inline function
 mt76_wcid_mask_test()
Message-ID: <20220921061111.6d960cc3@kernel.org>
In-Reply-To: <20220921090455.752011-3-cuigaosheng1@huawei.com>
References: <20220921090455.752011-1-cuigaosheng1@huawei.com>
	<20220921090455.752011-3-cuigaosheng1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_061124_073632_3BA5E01C 
X-CRM114-Status: UNSURE (   9.40  )
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

On Wed, 21 Sep 2022 17:04:52 +0800 Gaosheng Cui wrote:
> All uses of mt76_wcid_mask_test() have
> been removed since commit 8950a62f19c9 ("mt76: get rid of
> mt76_wcid_hw routine"), so remove it.

This should go via the wireless tree, please take it out of this series
and send it to linux-wireless separately.

