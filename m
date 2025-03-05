Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F6BC282D0
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Mar 2025 02:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5z84S7ivlAglfpSb9aQUB0kkxZR6u53+OItBvQZoAMI=; b=JGXh2WuPZJ8SHE
	X6ombjLWEHRpguRTrSY6ZJ+2eo6twT0qxMel/F8IaZRg1nUX8cit3YXN1n8qUXktHFafJzALrbcj7
	M2le6+EVeBLfDb8RfPFzEy7U5RA8HrlQt05Pif6t5U90uV8mIUzdsa4P/ip8lr2t5n0oJOzt0bpKm
	xG6N+G4Dy3kmpN832OHNopiXy2ywpKfTUEgd4IWHOnJ8vUtucSC/iQRhqWGsUTxbTmsf+IbKXI9uS
	8XTjx3dGqDJDFTqR5g0x/z75APzjMCv1aMXkZdj4AwAhsM2UpVMELwz+XZcm1P8rU9dQj4P3VCfdI
	MS1T0Ax0FPjWN8Xj0Ntw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpe3V-00000006lXS-0s6Y;
	Wed, 05 Mar 2025 02:00:17 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpe1u-00000006lCW-1gNf;
	Wed, 05 Mar 2025 01:58:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8609CA458F1;
	Wed,  5 Mar 2025 01:53:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 964B6C4CEE5;
	Wed,  5 Mar 2025 01:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741139917;
	bh=faPPTc6fEqFkFFgMOn0XiUUr2KwsjokpKxnGBmLUfb4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BaX8Oa727DhaBLVOvWypoECVFTTcmn6+Wx3yBzMVT6rm7vhjZLt3VJHewLq0r1Y4c
	 QtFWcquZ/i9LIVonDQaO3cuQsC5t8rWZ1W03jRgIwZFiJ+ZgRtIboC7S2URCj+UaEo
	 dvOVJCsvqim32rLbUhnX4DbVsM0mu9cAMoqTBdzKDS2a/yHoUY5EQtdmsMVHlEpgQK
	 Dy/83nzSNqk8XVhbipHuO+T5mHBrMDcHuS6UfPgDmRcx6gpNHqdfle3WBOdIoeMZOA
	 RyTkq0EAcgIT1eAq7dLfE1itPJlInCwUB/hRAzzwJWV7xN1kpSHVYrr7JFKSeCj/uU
	 AVTFBSIxa/cvQ==
Date: Tue, 4 Mar 2025 17:58:34 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Eric Woudstra <ericwouds@gmail.com>
Subject: Re: [PATCH v8 net-next 00/15] bridge-fastpath and related
 improvements
Message-ID: <20250304175834.4306c670@kernel.org>
In-Reply-To: <20250228201533.23836-1-ericwouds@gmail.com>
References: <20250228201533.23836-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_175838_513606_A1F40945 
X-CRM114-Status: UNSURE (   9.60  )
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
Cc: "Gustavo A.
 R. Silva" <gustavoars@kernel.org>, Kees Cook <kees@kernel.org>, Nikolay Aleksandrov <razor@blackwall.org>, Ahmed Zaki <ahmed.zaki@intel.com>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, linux-hardening@vger.kernel.org, Ivan Vecera <ivecera@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, Jozsef Kadlecsik <kadlec@netfilter.org>, coreteam@netfilter.org, Roopa Prabhu <roopa@nvidia.com>, Paolo Abeni <pabeni@redhat.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Pablo Neira Ayuso <pablo@netfilter.org>, Jiri Pirko <jiri@resnulli.us>, bridge@lists.linux.dev, Kuniyuki Iwashima <kuniyu@amazon.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, Alexander Lobakin <aleksander.lobakin@intel.com>, Michal Ostrowski <mostrows@earthlink.net>, netfilter-devel@vger.kernel.org, Simon Horman <horms@kernel.org>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 28 Feb 2025 21:15:18 +0100 Eric Woudstra wrote:
> This patchset makes it possible to set up a software fastpath between
> bridged interfaces. One patch adds the flow rule for the hardware
> fastpath. This creates the possibility to have a hardware offloaded
> fastpath between bridged interfaces. More patches are added to solve
> issues found with the existing code.

For some reason this series didn't get ingested by patchwork correctly.
Instead of reposting for net-next maybe lets use this opportunity to
resend to netfilter instead? Looks like we have some acks from Nik but
none from Pablo.
-- 
pw-bot: cr

