Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B53AEE64014
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Apr 2026 07:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ktaNlzovVtSwejukUhaR06M7XsTZ8oWSRoUEK4xQ0X0=; b=KsOyv3sO7zf3udwYjR95kTqirt
	ImKS/DhFfNQRk2eeoDeimA/TkXLI73NfKrrhzzHHBWmMuMfPcIfh64QtUbdGVmJSgC+dXzbvr0aSl
	CK5RvkRa5x3ovZADGluo++GM2cG+C47Kz7tVxZ1uw9Ny6PbahjMSwQ2OKx8E79DDohOm/Gh2bKpp3
	k25VoPjEGrUaNp8u/1gXiJKKJSpRmL0oqd08uVSKcSuVf1FDo9FocPJL+tpBg/F7JiWzME7CjS/Wj
	ele4LhJmvACmmndEfSmPQjE0dp4i/oHy9nziyg9urqbAuDjXnlZJH2RHHUtu/MdBprvUeJ5NRxvOy
	Y8nfI7Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9HWM-000000040zc-1Mn0;
	Sun, 05 Apr 2026 07:03:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9HWK-000000040zW-22Xd
	for linux-mediatek@lists.infradead.org;
	Sun, 05 Apr 2026 07:03:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E25BC60018;
	Sun,  5 Apr 2026 07:03:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17DF8C116C6;
	Sun,  5 Apr 2026 07:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775372621;
	bh=cGZQASeUOD7DEYI24yGkpzM2VpgQdKxFA6eMQ7fZ9Mg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U4JLTX8/zDK6FRLC2p7WxuOu6hFXklMMukj9ElNkbETU0DRkXJLsJQ8h+1l6XGg7o
	 BxaCe6udKIsJLA5gFXj9mFJyPrYMsLFy5M8BwiE0ocE8M/yWRBM7h1pP6yTRhvqzBb
	 xoDvZ9MWgwDEEymjkd8ILzjWo2jVI0NX/QlshiEnFNMeh5oppoP30SWH5AjOv1IAol
	 /Pv8ZKG1mXGB/btCYEdFWN+14AOkY8luPUbqGNngYgJwZu+73NZL6i1/TaCCSw2rbB
	 VP2sPwgb8JFZI+UWYsg/qDFKJ8HVtEOJqdFod70D3pqJpYFZG/PM8m1HEJO8LktkEz
	 4oasjxw6uhtSw==
Date: Sun, 5 Apr 2026 09:03:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-pci@vger.kernel.org, linux-mips@vger.kernel.org, 
	naseefkm@gmail.com, ryder.lee@mediatek.com, helgaas@kernel.org, 
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, ansuelsmth@gmail.com, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: PCI: mediatek: Add support for
 EcoNet EN7528
Message-ID: <20260405-phenomenal-messy-shark-bdefbd@quoll>
References: <20260404182854.2183651-1-cjd@cjdns.fr>
 <20260404182854.2183651-2-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260404182854.2183651-2-cjd@cjdns.fr>
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

On Sat, Apr 04, 2026 at 06:28:53PM +0000, Caleb James DeLisle wrote:
> Introduce EcoNet EN7528 SoC compatible in MediaTek PCIe controller
> binding.
> 
> EcoNet PCIe controller has the same configuration model as
> Mediatek v2 but is initialized more similarly to an MT7621
> PCIe.
> 

<form letter>
This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

Please read:
https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state in the patch changelog
or cover letter why and what changed.
</form letter>

Best regards,
Krzysztof


