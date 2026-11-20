Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871AC606A330
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2026 12:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Abvd5IOr;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=U5OcW6xd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8q9/TMmLVp1fSuWDi6PaMbIvtn4/2YX12Iruh/57dQs=; b=Abvd5IOrdIJqyzfD66pXQ54ivd
	Gn5OAq8eLMr9sMvp3kQtZDKnwN+FzDd5wmK8W5tUVYs6AnDRMYmZ9ZOlutTHCdcUgct4RBH1DRX5k
	aA6ea0uwLRKT9ooVTFckezJVSraIf39jT/8d0tDfLGkPSya70MZwDIw4/JSn7SJyB6o5j6O9dTrzV
	GFLCZCU5cKZbve/EHXtaU1ateekW3coJGfdmnZvgZ7hgtSXERCqwWLCs7tkOxvP78WJ8EvJTFKWeQ
	QqKbwBSm63Vo8xA3ymrukuV7pG/7cyeQ9MpinjbcG3ScoNFmEW3ETnPlL+pI6Qq1sU1qlabFCykiU
	AOQlYreQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUNgA-0000000Ewk3-10ci;
	Fri, 20 Nov 2026 12:25:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUNg8-0000000EwjU-3gdA;
	Fri, 20 Nov 2026 12:25:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CE1B060E16;
	Fri, 20 Nov 2026 12:25:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F5EA1F000C6;
	Fri, 20 Nov 2026 12:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795177519;
	bh=8q9/TMmLVp1fSuWDi6PaMbIvtn4/2YX12Iruh/57dQs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=U5OcW6xdu/HCWTM9/0b/zElK1hYihCStgMLaSefb3VM57bezMv+Lz7k35MI4bWECw
	 LHA+D/JN0QZgV6Wp8tYwJObrGLdS4ayiZhLXvmsa/Z3jPGYH8NuLRQg57QC7Cll4aP
	 7lY4XcVq0HpmhBsE1w0c+YDZMpjMBY56JXm+0Tgg=
Date: Fri, 20 Nov 2026 13:25:16 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ryan Brue <ryanbrue.dev@gmail.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH RESEND] usb: mtu3: don't run gadget completion callbacks
 with interrupts disabled
Message-ID: <2026112008-gown-cloud-258c@gregkh>
References: <20260929-usb-mtu3-gadget-completion-callback-fix-v1-1-8b75b48fab96@gmail.com>
 <b0c42b21-6b28-49fd-ac07-7af1456de4b9@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b0c42b21-6b28-49fd-ac07-7af1456de4b9@gmail.com>
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 01, 2026 at 09:45:16PM -0600, Ryan Brue wrote:
> Hi Greg,
> 
> Gentle ping on this one too. Similarly has had no comments since the resend
> on the 29th of September.
> 
> It fixes the softirq WARN in the commit message, which any gadget function
> that reaches netif_rx() (u_ether in this case) hits on mtu3.

I see no context here :(

