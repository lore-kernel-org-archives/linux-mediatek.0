Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B705C10F1A
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 May 2024 02:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SqBRWRCPVkrZ6RFp+z/PSi8p+84BZOhYGclJc2Udcrk=; b=22Pszjn8QUCZ6OFdrfUacE69QN
	bbO/G8U3BZWdGrRyhHq4FjbN6eIZhXMPI1LMc2nVCcg2QsjObPo75/03HIO5TjkaT0HGeJm0rbzUP
	zfGnlYp1IWQD4DBovk2rGVD1/2qYQasKuNsh6SsHV4HFo3XeZ7FxH4oD8w+M2RhEQAzFCZm7ZVbbA
	uta/8d/JGxSwkHsGu00RCYDSx5nbVieXPpMhq6SwuBhnoCN3gZRpD19I+KRcrZCY6+0rIDGIcUKia
	4quOsIOmwtUgD0kzUVwHjnv1RJK9u56eWNzEUhWttEYFD+wM3YVBrc1Kg/wB9fL0Xkos7/3RO7JhE
	qoMWlk6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4XCC-0000000DmfZ-0v14;
	Wed, 08 May 2024 02:38:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4XC7-0000000DmeI-3Xoq;
	Wed, 08 May 2024 02:38:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B83E361A56;
	Wed,  8 May 2024 02:38:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE0ABC2BBFC;
	Wed,  8 May 2024 02:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715135890;
	bh=dsBL6HgegF48D35JstK0cIlIlZdFApTieo0cYPVr5Ac=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HIDOKnkJrbXtr5wXd5qa/3nTHY8MTVQaCBT47zw2bi1QGaHwkpkW+xVOzUHgkFhnb
	 5aOtKLnMFQy02o2kFA/0daAvjMhFNghFtH3dVhfgsPHAfZjBk+HEakb4xPAkiPvfaF
	 kfYcwGMdQRgr0ptNia/iVPZj+Qvd2RBlsT3X3EYE1ClGMXj6MIqiY5Biv3ht8WyyLb
	 ru8joIQlImeO1TwjC6gmVd8YjxDWF5OJe1PWHJ4FoTu986bXv2Ijw6BJet5dasYJ1q
	 4/YNwI1d/88AXFBwH8g0u2s6BciUoJ4Lv3D4+FKY+dulaYObF0GkhXqtsLENZ2mfiH
	 rK2wnuyAcqz1g==
Date: Tue, 7 May 2024 19:38:08 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, Mark
 Lee <Mark-MC.Lee@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net v2 1/2] net: ethernet: mediatek: split tx and rx
 fields in mtk_soc_data struct
Message-ID: <20240507193808.36a2ba37@kernel.org>
In-Reply-To: <6747c038f4fc3b490e1b7a355cdaaf361e359def.1715084578.git.daniel@makrotopia.org>
References: <6747c038f4fc3b490e1b7a355cdaaf361e359def.1715084578.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_193811_956911_467F2616 
X-CRM114-Status: UNSURE (   8.41  )
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

On Tue, 7 May 2024 13:24:28 +0100 Daniel Golle wrote:
> Subject: [PATCH net v2 2/2] net: ethernet: mediatek: use ADMAv1 instead of ADMAv2.0 on
>  MT7981 and MT7986

Please repost without the second patch inline after the first :)

