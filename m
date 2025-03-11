Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 025D4C28B2F
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Mar 2025 23:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zy4H9Jv5YfvsQEUnC9uG0DhMz5JfwXq9yCcEHqiTgoA=; b=l8M78K4eB9fzuXlSA/PB64Vh6y
	aD4wlm8WAWCzyQWQgVOX9jYWwCMmRMr1YkN6p8ODmJ4HyvVWCBdvN4cH5+VREs699P3lZnB3zmsM4
	o+6Jrt0YFu1XSkYnl/9biCduL04LxXv3mV3YDDExaJfT0qrkjQqg67QIT/PHHINCfXb3lscGz0+rU
	kuYvj3vFKLLhlD9uVWDvrICTDuwDfAaE1aa8CZVrBRCp8BpJw0zK1BeA1iDmw/qARwlrQJ041pSf/
	BNh7ntkhtQqwgvA+gUE8R4OyCm4PwHWWjxIo+8Dw+J+OeYXM1BlRUJOfnUC8bK9O6AeDxLyR6PPwP
	d0J2qVPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts9IR-00000007D1F-1b8d;
	Tue, 11 Mar 2025 23:46:03 +0000
Received: from mail.netfilter.org ([217.70.190.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts9Gl-00000007Cmc-0Wyg;
	Tue, 11 Mar 2025 23:44:20 +0000
Received: by mail.netfilter.org (Postfix, from userid 109)
	id 9867D60290; Wed, 12 Mar 2025 00:44:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1741736651;
	bh=Zy4H9Jv5YfvsQEUnC9uG0DhMz5JfwXq9yCcEHqiTgoA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a8t80WlrGYFY9oyQX3S86Ogn9ifXUjpMtYaXir/VnMuMWejrcyWrdT2MZ2UFI6Eo2
	 7qsNBbeB+KiWFpXrYGzzrRPMPsPm3M/LE12BTGeObmLfV4xGfxMKOeVnfXLuHs+f6I
	 oco67Tvuc79DAy4t/JCmw6SPfqMP3FXgCoQq7/pPe7BYJioQ8AdiXx+unSbnybDzHx
	 TlZi4UML/13y3h+GZLEerM6BAPXU/DTqIQuGm8Mqm5U0dLr+7C4n8OXD6BORAgjHeq
	 NKgQoBT0DPvWcs+M0oaprv6llWWPVxh4HtE3mjNtRrcPSzk1R77u3S9f2rILyP8arN
	 I70Z8bqQRkyaw==
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with ESMTPSA id F13DD60281;
	Wed, 12 Mar 2025 00:44:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1741736648;
	bh=Zy4H9Jv5YfvsQEUnC9uG0DhMz5JfwXq9yCcEHqiTgoA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kLBL1Hzar1cmkrQuKybLF66CTNES1VcZwNNIMmceAZVUWG5+PeM/BvDuffpu85yec
	 wSCdNGmitWR2/y3qO93O7m5UoYNKtgV+UMNE3RSCZLEtC3QrrCx5Ui7dzYI58OpWlx
	 NwubfakCqFL6Je9par6JdWhDjcNJFmritUaP6eC06ocENmPzpiec0y8GuyB+7RNRpX
	 yhqSCf2339YL33+0nTwjf5i1QZ20gGgH7fTS6Lw5NjdHN+qVQ+1exZ2T3tciJq/8kh
	 KqPz2aZ2hTBXT2boxpytoDg2qPdtF3KzUcG9KrRXHFunP2n1vk46/9Q2OKi2SN/ESu
	 yNF8SeDIdPDXQ==
Date: Wed, 12 Mar 2025 00:44:04 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Eric Woudstra <ericwouds@gmail.com>
Subject: Re: [PATCH v9 nf 00/15] bridge-fastpath and related improvements
Message-ID: <Z9DKxOnxr1fSv0On@calendula>
References: <20250305102949.16370-1-ericwouds@gmail.com>
 <897ade0e-a4d0-47d0-8bf7-e5888ef45a61@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <897ade0e-a4d0-47d0-8bf7-e5888ef45a61@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_164419_604519_568B1A14 
X-CRM114-Status: GOOD (  23.45  )
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
Cc: Kees Cook <kees@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Ahmed Zaki <ahmed.zaki@intel.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Eric Dumazet <edumazet@google.com>, linux-hardening@vger.kernel.org, Ivan Vecera <ivecera@redhat.com>, Alexander Lobakin <aleksander.lobakin@intel.com>, Jozsef Kadlecsik <kadlec@netfilter.org>, coreteam@netfilter.org, Roopa Prabhu <roopa@nvidia.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Nikolay Aleksandrov <razor@blackwall.org>, Jiri Pirko <jiri@resnulli.us>, bridge@lists.linux.dev, Kuniyuki Iwashima <kuniyu@amazon.com>, linux-mediatek@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, netfilter-devel@vger.kernel.org, Simon Horman <horms@kernel.org>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On Tue, Mar 11, 2025 at 09:22:35AM +0100, Eric Woudstra wrote:
> 
> 
> On 3/5/25 11:29 AM, Eric Woudstra wrote:
> > This patchset makes it possible to set up a software fastpath between
> > bridged interfaces. One patch adds the flow rule for the hardware
> > fastpath. This creates the possibility to have a hardware offloaded
> > fastpath between bridged interfaces. More patches are added to solve
> > issues found with the existing code.
> 
> 
> > Changes in v9:
> > - No changes, resend to netfilter
> 
> Hi Pablo,
> 
> I've changed tag [net-next] to [nf], hopefully you can have a look at
> this patch-set. But, after some days, I was in doubt if this way I have
> brought it to your attention. Perhaps I need to do something different
> to ask the netfilter maintainer have a look at it?

Apologies, this maintainance service is best effort.

I am also going to be very busy until April to complete a few more
deliverables, I cannot afford more cancelled projects. I will try to
collect what is left for net-next and wait for the next merge window.

Therefore, I suggest you start with a much smaller series with a
carefully selected subset including preparatory patches. I suggest you
start with the software enhancements only. Please, add datapath tests.

As for the hardware offload part, I have a board that I received 4.5
ago years as a engineering sample that maybe I can use to test this,
but no idea, really.

You are a passer-by (ahem, "contributor"), this will get merged
upstream at some point and we will have to maintain all this new code
without your help maybe ... (people change bussiness units...), I have
to understand what is going on here. The throughput available is
limited, I am afraid we can only go _slow and careful_.

Thanks.

P.S: You work is important, very important, but maybe there is no need
to Cc so many mailing lists and people, maybe netdev@,
netfilter-devel@ and bridge@ is sufficient.

