Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A66C3271F
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jul 2024 08:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZZIVXbqZi3ZHgfaRzGyOphJYrcbrReZoLRIv/2BQTzQ=; b=2bUbL3w7UwxYJ2KbR5786ajEn9
	wdKhC5QEq9BD4BHAYnsxAX/xjj/W774wGoouQGXL6HjUX0AETeFtuHtZcBpxZoVjrBb8mDfTVjuHC
	Pa7hYJgLP+GPmC8wWv+vigYUNcjQdpf7TcDXozZkVh9T4dgKir+SxpKlOUfC5I5/mvrw5KJC/z47A
	sJ320+psvs2gm1l3kyMyPG4QgnHZcuTnzdv9kRW/cd3e/nQEQntewXxq4ijn32KZGUaNVAWBaJiVX
	5TqHyecBsGVc/oqffC5zUZcYbX/SwYRE3YUSlKN+8dsTVSFHjzOuJt3JYdEBkd+jW0a7Dy3jbWsbT
	Fo0Ginzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPeQO-0000000FIBh-3mxY;
	Fri, 05 Jul 2024 08:36:12 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPeQA-0000000FI6t-14pD;
	Fri, 05 Jul 2024 08:36:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 86EADCE3CE3;
	Fri,  5 Jul 2024 08:35:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5B3BC116B1;
	Fri,  5 Jul 2024 08:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720168555;
	bh=IKRkgE7HTYushKsvXZ0tIGrzlUvI+jppSG/Bsv6Ha14=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z9CEFwbvNY1VeOJO4phfFGSsKZeKz1UzMzRM6XtE8TzIqWqkMEe8sIy79ew1CNc52
	 g5eRRAAjoOr5FhHD5xpM9BDkYlx30Z2dUm67U3EgjO1j/dsYgBUTw8Yp3LsDL0eZTB
	 /oTaloP1ZtVdqZgEggE7izBV4C3X6khLu/DH+d9otJHoll3N98/r/5kkAxnDomxp7H
	 ib28Lcaas6FCajN3GcaFxhQQHHikdoxDnd+kZfSkiPMwT0XUaxYEXO00E8eL7om4M/
	 uuVRg75gbmbei8oT9HVGVL0jid7W0k1MtzGLSK/+fnezaJD4WkRdgxs6gW2Kqf2cYX
	 Z4syNyv0EDk5g==
Date: Fri, 5 Jul 2024 09:35:50 +0100
From: Simon Horman <horms@kernel.org>
To: Shengyu Qu <wiagn233@outlook.com>
Cc: nbd@nbd.name, sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
	lorenzo@kernel.org, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, Elad Yifee <eladwf@gmail.com>
Subject: Re: [PATCH v3] net: ethernet: mtk_ppe: Change PPE entries number to
 16K
Message-ID: <20240705083550.GA1095183@kernel.org>
References: <TY3P286MB261103F937DE4EEB0F88437D98DE2@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY3P286MB261103F937DE4EEB0F88437D98DE2@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_013558_491360_25E3FD88 
X-CRM114-Status: UNSURE (   9.42  )
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

On Fri, Jul 05, 2024 at 01:26:26AM +0800, Shengyu Qu wrote:
> MT7981,7986 and 7988 all supports 32768 PPE entries, and MT7621/MT7620
> supports 16384 PPE entries, but only set to 8192 entries in driver. So
> incrase max entries to 16384 instead.
> 
> Signed-off-by: Elad Yifee <eladwf@gmail.com>
> Signed-off-by: Shengyu Qu <wiagn233@outlook.com>
> ---
> Changes since V1:
>  - Reduced max entries from 32768 to 16384 to keep compatible with MT7620/21 devices.
>  - Add fixes tag
> 
> Changes since V2:
>  - Remove fixes tag (Thanks to Jakub)

Reviewed-by: Simon Horman <horms@kernel.org>


