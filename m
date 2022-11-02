Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3160DC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Nov 2022 03:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/33USl2Igmj67OuHESgbW2wSuvUtVvhD4BkJsHphVrs=; b=bh9Xv5EKnvtUimQF9MexBLAI2b
	8znvh83sB/SlY2Ox/hl7ahQUQLrlLVDqd2ZIzs9p0VY82ZQqetxikjbTETjyaI6Ta3ip6hbsPnsS6
	PAVl5NydN7j7WKal/w8OTQsso64lf7KiR5X7294EWNV0297SnBHLt/gbDvhOjDCv0376hjpodW8Cr
	9S+bWFiKPvBJHTdhBtLf3/qdP9KvY0yd/VHB88LUwXgD8nbTVti0tSj4ThQOHIRRTN0QkSkFmuFE0
	x5HoBUJpcNmXIa/jGG8NEvSiYaTM2TsmwczZl+awkO8cYZQVQXiIBbOveLnyepDD2Q+bjDM7RcC3x
	DXSiCP+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oq4lM-0089ZH-7x; Wed, 02 Nov 2022 03:50:00 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oq4lB-0089X7-W0; Wed, 02 Nov 2022 03:49:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CE183B81AF4;
	Wed,  2 Nov 2022 03:49:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0095EC433C1;
	Wed,  2 Nov 2022 03:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667360986;
	bh=rNNhFDFwW2G0G/ZlDlWXuItSrEFoY65rTPZ//6woXrw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=TPdWrIu7iH0zfXYRcUjT+c9FS6arh7I1skciZ+JgGrGWzZh8R+gd8l2fNzVBCLqOd
	 7cqjkrBPHQpzOWrrJPb9cIJkS7UWLj6++2VQl92pLVmXliD5fHyjOB68cZ1ZXo/JoM
	 kLl8iiI0bn4cGnN9IwfT7rMRQRVsZsYa4i7uVjrMPEa73NrrJXRWzfqxD3s9gm6+BX
	 8WLdeoNnaegu80MswENmq4M8fXEw7OpGerz6OY0rfuz2sDUeRO/RZpJb+sYD5VjGlt
	 lUXyHdX9bg8ub3odTSaSajdx77wbhybmPl9LmVUmm1ChBIJioyuVob279TK/azVqsk
	 tEhyz+XehMe+g==
Date: Tue, 1 Nov 2022 20:49:45 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>, Sean Wang
 <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] net: ethernet: mediatek: ppe: add support for flow
 accounting
Message-ID: <20221101204945.35edb8e6@kernel.org>
In-Reply-To: <Y2HAmYYPd77dz+K5@makrotopia.org>
References: <Y2HAmYYPd77dz+K5@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221101_204950_232028_9F1D1E8F 
X-CRM114-Status: GOOD (  12.82  )
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

On Wed, 2 Nov 2022 00:58:01 +0000 Daniel Golle wrote:
> The PPE units found in MT7622 and newer support packet and byte
> accounting of hw-offloaded flows. Add support for reading those
> counters as found in MediaTek's SDK[1].
> 
> [1]: https://git01.mediatek.com/plugins/gitiles/openwrt/feeds/mtk-openwrt-feeds/+/bc6a6a375c800dc2b80e1a325a2c732d1737df92
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
> v4: declare function mtk_mib_entry_read as static
> v3: don't bother to set 'false' values in any zero-initialized struct
>     use mtk_foe_entry_ib2
>     both changes were requested by Felix Fietkau
> 
> v2: fix wrong variable name in return value check spotted by Denis Kirjanov

Please read the FAQ:

https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#tl-dr

https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#running-all-the-builds-and-checks-locally-is-a-pain-can-i-post-my-patches-and-have-the-patchwork-bot-validate-them


