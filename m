Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F90CF9C46
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Nov 2025 16:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/VT9yinq4Ll3Vmk4HVzKMXW8uGXOoXvBS+bzMMdfg0w=; b=O1JZ0IW0PMNUD2nq15EHS4yyW9
	FhTEjkLzueqVqnD0p/9cV3kp+Hg1GPi9MsvqwtTbscp9CO38ckQW6qw4Naku7ppYLrPL79KKnS8Iy
	lOePT4AhvbuXkWAj/YdZUJ4juV8wonVBvwxgdAbdjLRLZdNNjezVLyuSUt8ZT3n8Vfw7wkuov82qp
	fSbsniu7z+zpy7AGBuWPjsg2ZIUBB3VUokYyRjWrFF8x1f2dSu+9nJhTOTZ+RRQGFL7j3YXrxQJuF
	s+ckM9os/wraVg5r3TKHRHkxxgYzVUlDgmzJYHpFJfQ2mzmoUY6Z8W6XUzVcVeqzwO+KIDJ3f1Azm
	SYvH+d/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM7mn-000000072OT-1Pmk;
	Thu, 20 Nov 2025 16:45:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM7mm-000000072Nl-0dSg;
	Thu, 20 Nov 2025 16:45:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3E0B76018D;
	Thu, 20 Nov 2025 16:45:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37505C4CEF1;
	Thu, 20 Nov 2025 16:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763657130;
	bh=/b8wo8RQC/52zHrc7Ma+n9mzkmbtEkBpqda8kVXqdCQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Xpm6++JA3mHsnaa43KeQt5lZ7q/K+Hb/4Fzl/p/xnftEpXMRcv58sxc0AWqYgBCdV
	 Wl2NdSsWOT3ASQy+Jm+YiQEfooupCVFyQLKn6Wc0GCfIkrcRrrJ0WGS0qIuB7xufnx
	 9T+7iLP0lInzi4dQFRBGHJNdpINFQJ4o8uqMzBg+98J5oFQLqGmrzTqPU5M+JdNlJy
	 a56lRXMRp2qxh3CAi9OMIeagZyC4sBpNDVJxFDLqkkRRo5lN0vprdoFw7bHmUR60Fq
	 zWhlfHpNkG/qvbud5tCNBkXb3G3ZUrKHMoY8mV3jKRuuDnfDf9Wugn8fXwU+Te1trk
	 Qe2Qv4PkiL2PA==
Date: Thu, 20 Nov 2025 08:45:29 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Chen Minqiang <ptpt52@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, "Chester A. Unal"
 <chester.a.unal@arinc9.com>, Daniel Golle <daniel@makrotopia.org>, DENG
 Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>, Andrew
 Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
Subject: Re: [PATCH] ARM64: dts: mediatek: fix MT7531 reset polarity and
 reset sequence
Message-ID: <20251120084529.2e5dbd77@kernel.org>
In-Reply-To: <20251120162225.13993-1-ptpt52@gmail.com>
References: <20251120162225.13993-1-ptpt52@gmail.com>
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

On Fri, 21 Nov 2025 00:22:24 +0800 Chen Minqiang wrote:
>  arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts | 2 +-
>  arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts             | 2 +-
>  arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts | 2 +-
>  arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts             | 2 +-
>  arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts             | 2 +-
>  drivers/net/dsa/mt7530.c                                 | 4 ++--

The dts and drivers/net changes must be in separate patches, they go
via different trees. Please note that we ask contributors to wait
24h before reposting in case there's more feedback for this version:
https://www.kernel.org/doc/html/next/process/maintainer-netdev.html
-- 
pw-bot: cr

