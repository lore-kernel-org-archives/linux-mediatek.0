Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 528E4C54E71
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 May 2025 19:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GGN2DKtoUxJ0wp+1EIu6zodshBKTS+vpa4PsMQJFvI4=; b=mM+jcN5yln6piXslmc5IUA8xzu
	6Lk8iGx8pJ1C8vyBkbw7bFzEzw/nPMPBlDiQiCo4GhktTj+nY9fjtiW08jlYLyf/KSicc+WrvGIKY
	JiqWpm0ZPZJFeAgLBxT+SKXWokevXtMQslnH+NXptVLwoDAduJpIqUlRGQUntKK9RtJLqrNrz7jxU
	6u7q0+MKh+odKOMAR0ICVB9POn6ur40OwufdoWigH+nczGspechlb3pUPoEcFXWb7zLZVjzJvH0NC
	IDnS3so+J3sgI32l4i6bswM4yMk5gnSS6rjvvIrlPwZlvTz3x45TCpiFmZFu9NGXEbHETKRfaxqC+
	V98xhfNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHSoS-0000000DxUq-1c7P;
	Tue, 20 May 2025 19:39:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHSX4-0000000Durn-1CX0;
	Tue, 20 May 2025 19:21:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CC89A5C5A7A;
	Tue, 20 May 2025 19:19:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A873FC4CEE9;
	Tue, 20 May 2025 19:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747768903;
	bh=vs3CFjXmqEXOSPVSSq2eRt847mz0iU3nVHHR5d/56uk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tTelEoS/+Ch4CXVNu8XnwfONMGSWq32RyBUgHsQLJycqZhkyFy3NXwHEqtfi+hb7h
	 TyOmRv4IMy4Gd2WTDz27ccWRdaPPu+r3YIKz8DvEFJidFUb9IxOpj6oHQWyRbFp8eX
	 MMT0xXZsFI9kL+JS1iv/TQPw7dbxO5rOJo8xFhixQY2N5YYe5tuvGzTj9W6NymERve
	 FV7KENOfVGyPWgENAPjQCx0e+4yOdxsA8GpricQpQ1d+oO/ZlZ1uArSJ/Ow2IOHqEq
	 HFwmH9TW0CaBA7evhoWPwCeEuCwBp/3xgXqXWqgLPiJLR+kDExmTJDGvCBClEPQxDL
	 u3iA1N+Lpl9LQ==
Date: Tue, 20 May 2025 12:21:41 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jinjian Song <jinjian.song@fibocom.com>
Cc: andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com,
 chandrashekar.devegowda@intel.com, chiranjeevi.rapolu@linux.intel.com,
 corbet@lwn.net, danielwinkler@google.com, davem@davemloft.net,
 edumazet@google.com, haijun.liu@mediatek.com, helgaas@kernel.org,
 horms@kernel.org, johannes@sipsolutions.net, korneld@google.com,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 loic.poulain@linaro.org, m.chetan.kumar@linux.intel.com,
 matthias.bgg@gmail.com, netdev@vger.kernel.org, pabeni@redhat.com,
 rafael.wang@fibocom.com, ricardo.martinez@linux.intel.com,
 ryazanov.s.a@gmail.com
Subject: Re: [net-next v1] net: wwan: t7xx: Parameterize data plane RX BAT
 and FAG count
Message-ID: <20250520122141.025616c9@kernel.org>
In-Reply-To: <20250516084320.66998caf@kernel.org>
References: <20250514104728.10869-1-jinjian.song@fibocom.com>
	<20250515180858.2568d930@kernel.org>
	<20250516084320.66998caf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_122146_376096_E2926DBE 
X-CRM114-Status: UNSURE (   6.63  )
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

On Tue, 20 May 2025 10:59:34 +0800 Jinjian Song wrote:
>   If it's not feasible to directly add parameters for configuring this RX buffer(BAT/FAG) to 
> the mtk_t7xx driver, would it be allowed to add aparameter for a default configuration 
> ratio (1/2, 1/4)? Or is it not recommended to use driver parameters for mtk_t7xx driver.

Looks into devlink params then

