Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90EC2D58CBF
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Mar 2026 21:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DSEbny84Yly4nLR2jlYZB3XOX3mwE7afr23M2dVlvic=; b=prAPWAUXFI0CgtD7/guWacI7cY
	h9EZQuSHVSAkHO23Nl+VhdA96vGJZ6pp4zvJ2KJRJB5NFGFeIo0HHFuh+iwuiOm7MagUQ9vyLzCxn
	aa4QoZZx4uo13frjdAeE8kevdfVRI0TAhIdwcw8LgNgzrKNUAMoF4OEz0m1p/CZtDzEjqMjJ8MkgP
	7CNDVcj4vOUlWwqqssSHJuVQBz5G9bdAyLW0qK7O1d4s+7ysazzvEiZEJlmuO4J3sq+So7paQ7Mi6
	tSgbIPDlC5r4Y2qUjhS147YxpEVTM7CnWOnfOiDD3ZGXWgEHY3xgQP/Yk6hBiFBAuJ6Xg/qndKq/n
	jOC4bINw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4n2l-0000000023R-2nsd;
	Mon, 23 Mar 2026 21:42:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4n2k-0000000022k-0dfL;
	Mon, 23 Mar 2026 21:42:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3AB14600AC;
	Mon, 23 Mar 2026 21:42:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84200C4CEF7;
	Mon, 23 Mar 2026 21:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774302156;
	bh=DSEbny84Yly4nLR2jlYZB3XOX3mwE7afr23M2dVlvic=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ngRIvCvYT7WxinR9td2K1amORjsD9EtWMrRhE8LTy5siBngX+ka9Vo6MoMBRC6JYW
	 c6NpbzNGVZ2l4LaQ0U3jT/iaNlymJGh+IxR+Ns5DNZbo6xr7uutHs2Cjgk9tg2LVYJ
	 70hHXaV5fLpPQpWhHH+4zUCVD3hd93WSEWZDY0NbeZ6wxVCNCfolUogoYGN5sO5Iqn
	 MpBY8F0yYDEJqHq+x+3PDwvTa6WGFt1pwGejrCkFTDhfN4jrvyPLwpLh8J3mv0xgy2
	 fgEbKpd7zITcz8SHHh48jCufAT0ZAo3GdZY8NhXMrDoxBJbJK26lf+XsOY+wZEYSnW
	 W0x4BaZaI+H5w==
Date: Mon, 23 Mar 2026 14:42:35 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
Subject: Re: [PATCH net-next] net: airoha: Reset PPE cpu port configuration
 in airoha_ppe_hw_init()
Message-ID: <20260323144235.6b843115@kernel.org>
In-Reply-To: <ab6R4krBRy5dycb-@lore-desk>
References: <20260317-airoha-fix-ppe-def-cpu-v1-1-338533d8e234@kernel.org>
	<20260320183127.22b360be@kernel.org>
	<ab6R4krBRy5dycb-@lore-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Sat, 21 Mar 2026 13:41:06 +0100 Lorenzo Bianconi wrote:
> What do you think?
> I noticed commit f44218cd5e6a is already applied to net-next. I will post a
> follow-up patch, agree?

Sounds good, and yes please.

