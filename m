Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B06FC27C53
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jun 2024 12:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v3IOS6/j5rdFN7/On/W71/5AoNIm8epZjjtjGssvkjY=; b=emRG+RRtFCVDyz0FdoM4xnY8y2
	JjCstVPvDfTJ1Sj8O8Sv6ESwx5HI5KBSSTArPfLd47SB/G74+fEbaKyGmTiFOh8TlSudTe/+q9w3f
	8QimDGJbAfRwrCQXYNHiZImWqaurzeuFChudB47Q6Pv9B5wlTWi6tEI0XgyLhwc8VhErhugY+2G8N
	680kEmBKJz4c0Iea/TvtiQoLM+j7mzt7afvOkRw9n6FqhKLqS2vArLlkuWPgAEpLo0iZksfQ0HAOy
	s+wgZsUNoFEtyDcmkZRGCJWn2PTw8WPRtMVebLW9tndjNrQSkeTPjlngPazz2iNOxxdiqmBEjCu2H
	LqWRQpkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJuYo-00000001CNj-2IKd;
	Wed, 19 Jun 2024 12:37:10 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJuYl-00000001CN4-0Bkz;
	Wed, 19 Jun 2024 12:37:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 91DE1CE1E53;
	Wed, 19 Jun 2024 12:37:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1316EC32786;
	Wed, 19 Jun 2024 12:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718800623;
	bh=G/1QD6sxX4K16RM7mh/Kh/CPatatOc0PRN9T+Q9l3ho=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=p9Ny1vBfTquUva0eyQD4qFh1bVMBzMXb7Txe93yOkDr19G9vFfBwKs1TNXuwXpg4q
	 JGByEOYw+S4FBLwq5auCFg/tMpjH6+HyvAiwAV7jes41arn7P4T/iQmg4Q4qa9WHhJ
	 NNuY9ctilj+0MC415cdJcimeVh2KHjkCPtRgZfhyGIVb0M+wlsz6lIkbZaTOO3E89Q
	 XjXWHyDwwg7ihGkZ+dVc0Habiw607B3Q1pd3uWnUrXSELSdm9ZrTup5UolBvt6ECoA
	 FQBNB6JNJeZyp0j4tbOnZiwLpwc+dJpui2Aqmgu+sDGeneREUEVUrO74tiTHcJx2+h
	 a8+bKJb7A8jcA==
From: Kalle Valo <kvalo@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: linux-wireless@vger.kernel.org,  davem@davemloft.net,
  edumazet@google.com,  pabeni@redhat.com,  Felix Fietkau <nbd@nbd.name>,
  Lorenzo Bianconi <lorenzo@kernel.org>,  Ryder Lee
 <ryder.lee@mediatek.com>,  Shayne Chen <shayne.chen@mediatek.com>,  Sean
 Wang <sean.wang@mediatek.com>,  Matthias Brugger <matthias.bgg@gmail.com>,
  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
  netdev@vger.kernel.org,  horms@kernel.org,  kees@kernel.org,  Bo Jiao
 <Bo.Jiao@mediatek.com>,  Alexander Couzens <lynxis@fe80.eu>,  Deren Wu
 <deren.wu@mediatek.com>,  Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
  Leon Yen <leon.yen@mediatek.com>,  Quan Zhou <quan.zhou@mediatek.com>,
  Ingo Rohloff <lundril@gmx.de>,  Sujuan Chen <sujuan.chen@mediatek.com>,
  Peter Chiu <chui-hao.chiu@mediatek.com>,  StanleyYP Wang
 <StanleyYP.Wang@mediatek.com>,  Benjamin Lin
 <benjamin-jw.lin@mediatek.com>,  linux-kernel@vger.kernel.org (open
 list:ARM/Mediatek SoC support),  linux-arm-kernel@lists.infradead.org
 (moderated list:ARM/Mediatek SoC support),
  linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC
 support)
Subject: Re: [PATCH net-next v2] wifi: mt76: un-embedd netdev from mt76_dev
References: <20240619105311.3144908-1-leitao@debian.org>
Date: Wed, 19 Jun 2024 15:36:56 +0300
In-Reply-To: <20240619105311.3144908-1-leitao@debian.org> (Breno Leitao's
	message of "Wed, 19 Jun 2024 03:52:36 -0700")
Message-ID: <87o77xkt1z.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_053707_285908_2DA16AAF 
X-CRM114-Status: UNSURE (   9.74  )
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

Breno Leitao <leitao@debian.org> writes:

> Embedding net_device into structures prohibits the usage of flexible
> arrays in the net_device structure. For more details, see the discussion
> at [1].
>
> Un-embed the net_devices from struct mt76_dev by converting them
> into pointers, and allocating them dynamically. Use the leverage
> alloc_netdev_dummy() to allocate the net_device object at
> mt76_dma_init().
>
> The free of the device occurs at mt76_dma_cleanup().
>
> Link: https://lore.kernel.org/all/20240229225910.79e224cf@kernel.org/ [1]
> Reviewed-by: Simon Horman <horms@kernel.org>
> Signed-off-by: Breno Leitao <leitao@debian.org>

As discussed in v1, feel free to take this to net-next to speed things
up:

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

