Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C958C04FFE
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 May 2024 18:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c8s1G8wtno/SgM1LrscZlYOLrAh/RRTIWV2eb6XNMIw=; b=TadAtUsFbH7WJK+JkiSByiBMCY
	9/AnrsLF449SJcL18W8bUPeTKyktGucz/daI3C+V0mN3vGBKSvQ+NmuOTD3sqVnQgVeu4en0+svpx
	eK+9mjqtizKMoPH5LEJDFg0jrSYRIdpIbK5zxF5CEAmTzQzu85Hq4PkTVgWqNnY18NLlKYVSvTk0a
	CK3xNxCya80McVrqVT9l9e+VntsIw2a7Srr/FNJZExHiamUyF1CESI3bpPRnU1Be4h598ohBA7XDG
	WBrULPhnfCXwo/iNVtgQP3tXoFK1rJaREOPsUvSO0NqldWNdzp7hcWwoXhhI98P9i1YPOQg297APs
	P8AOBHxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s82ew-00000008kMt-1ELq;
	Fri, 17 May 2024 18:50:26 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s82es-00000008kLc-1Ce9;
	Fri, 17 May 2024 18:50:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3F659CE1B20;
	Fri, 17 May 2024 18:50:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E989BC2BD10;
	Fri, 17 May 2024 18:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715971817;
	bh=uHcuO5weT8V4nkmlWXUWUlT6ndIJJq1NC84Hk5c27CI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=AtBULKubkUOyENj+izGH+xAIwhVoTYual9ZbxlTSlR3bP9HjVV/v0y52+U7Ctg4W/
	 7mxo3vot1J8l/Gkt8SwE4693t4HggaIeDUe03mMd20bwCSPS96PlkgfIOipbojgLln
	 0/5L8hpFsOQVgWhka2fY0Lr+votWILFDx76m5Y56JsJ8dEp/YvoSGJnkk1bs2WcziB
	 h0RCzSoagbAI0WeNPabbtekDwu6T7crDTKbdgYIHgvnZHGbOusM96zNgnfZdV3KO90
	 6b1jwRo3jszC50A4bpf6LcdkI5kTLRMB2khbz2AhLrKplzISEWqnh6oHoHpx2i79MU
	 9oNhz/EBp7c1g==
Date: Fri, 17 May 2024 11:50:15 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Elad Yifee <eladwf@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, Mark
 Lee <Mark-MC.Lee@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Russell King
 <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v4] net: ethernet: mtk_eth_soc: ppe: add
 support for multiple PPEs
Message-ID: <20240517115015.49325c2f@kernel.org>
In-Reply-To: <20240511122659.13838-1-eladwf@gmail.com>
References: <20240511122659.13838-1-eladwf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240517_115022_560805_5C5F4080 
X-CRM114-Status: UNSURE (   8.85  )
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

On Sat, 11 May 2024 15:26:53 +0300 Elad Yifee wrote:
> Add the missing pieces to allow multiple PPEs units, one for each GMAC.
> mtk_gdm_config has been modified to work on targted mac ID,
> the inner loop moved outside of the function to allow unrelated
> operations like setting the MAC's PPE index.

## Form letter - net-next-closed

The merge window for v6.10 has begun and we have already posted our pull
request. Therefore net-next is closed for new drivers, features, code
refactoring and optimizations. We are currently accepting bug fixes only.

Please repost when net-next reopens after May 26th.

RFC patches sent for review only are obviously welcome at any time.

See: https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#development-cycle
-- 
pw-bot: defer


