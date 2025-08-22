Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CBC0CA0EED
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Aug 2025 06:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j+Yb2j8C3mFnmz7WMNjNKgDTVrfq88wM83FlGUgun6o=; b=GFuLGluTzSoi+MgWz79A4hm/ar
	B6Dg3cOisxeTVa/uRWyTlnQ+D3VMWO6LZdYSxhH9NfXcN5jzewSNzaaPF8sKs7u0vG4GjrKOUXnRj
	LEGchgqt/OATu9pBAGNL6Jpm88pfKb6KftbbucbmzaLJaLtVdj4/DeroAWgUN7OhCe/NTYAEtCsHD
	kDD5iB8p8fTMPKulADpqP0FUMOl4DQnQ8TB7DbPgpXCSow32tmGWTPH5iuO1IGu6HRFQn35T1ByJu
	bWfKgvxibZayNk4YjJkEZQXWxn+TlnVBwFSSslgyLIM9+Ja8G0SRvFQM8uFhRHEsggUCMWnMWfYdv
	SWpiQ5xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upL5G-00000001fr4-1GJy;
	Fri, 22 Aug 2025 06:17:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upGfe-000000019Xv-4A6C;
	Fri, 22 Aug 2025 01:34:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 68312433A0;
	Fri, 22 Aug 2025 01:34:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF326C4CEEB;
	Fri, 22 Aug 2025 01:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755826461;
	bh=j+Yb2j8C3mFnmz7WMNjNKgDTVrfq88wM83FlGUgun6o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fxExEr8L2faQ29gha1mxa9BuNpvCbY2e8XPxKXllL7ZRKXtLGm1G42dsY5nhjmOm1
	 H3p15NCGQeXBeARCXbotMCHFMXlvHjC43cbsjN4TAyEuJlKzXAVpXQBu6hRN21dtfB
	 JPbml5U+0qn5H1NJFTqqVhhpYvnJg/rt57+XsYpmSf2Wv8JojqvUdFBr3LfWNhq6eQ
	 BCI0iGNV8h68TOPfoxVZ2835SSpv4LO1OnhGWCUc1Pk9Q4DshJ/6wlPES7WhTy8k+/
	 Zvm49ms5ObyemOOxvl0ZQf6BqWt1jPAShHAPjy60xJpCPN06TlvzQaLc066FKZZ5R+
	 +cQMiNq5fds+A==
Date: Thu, 21 Aug 2025 18:34:20 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next 0/3] net: airoha: Add PPE support for RX wlan
 offload
Message-ID: <20250821183420.45af8077@kernel.org>
In-Reply-To: <20250819-airoha-en7581-wlan-rx-offload-v1-0-71a097e0e2a1@kernel.org>
References: <20250819-airoha-en7581-wlan-rx-offload-v1-0-71a097e0e2a1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_183423_057085_1F8C30EC 
X-CRM114-Status: UNSURE (   7.16  )
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

On Tue, 19 Aug 2025 14:21:05 +0200 Lorenzo Bianconi wrote:
> Introduce the missing bits to airoha ppe driver to offload traffic received
> by the MT76 driver (wireless NIC) and forwarded by the Packet Processor
> Engine (PPE) to the ethernet interface.

Doesn't apply :( please rebase

