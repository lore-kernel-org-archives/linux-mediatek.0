Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5175C3DA41
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jul 2024 21:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MSYgIkjQ+5vmTEkRltS2EmNsO1LNIWt51onyGHEclyE=; b=beRQ6YrqvxuqGgE3/LLn+wBTER
	DhykCyxylZxowGV949HL//WYOX1WIgccOZsHdoI4KO03uQx9AnRzL7EBJQbDHtbwoOLZ/OPBXIbBy
	xfzcSHOg5Z85RBwgbgszO/etfnvoNPjFH4XCLLzkCamPrt8stGEn/woTn0DWpp8E2x8ovCZ99ftGK
	9dHDeXtAxrM5PfzyWyqkkYFQJeoeIfRsxovvxglT7QLzRuUImIkhTwr7i+MjGFPHBRxolGuplpqVs
	gEM8ZcxLDgSJR2uhm91IpMRDsd8utXnAEXfgFV6hPQImOmimX2/txGKu4AkXK1EFDjPce840oA021
	k1c8GaMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRfLc-0000000Br74-1Hn8;
	Wed, 10 Jul 2024 21:59:36 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRfLZ-0000000Br63-0chh
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Jul 2024 21:59:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 51586CE1792;
	Wed, 10 Jul 2024 21:59:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 192E0C32781;
	Wed, 10 Jul 2024 21:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720648769;
	bh=+g9T2N860tm0aAUe6j387SMvNO+vFY5N9n+UXcOLh/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B3x7yPK9QLgsnDgR/aB5McWHuzmWuncu+HGCf2/ERJgBxNFgSRIQ1iUvBjT+xYMMs
	 +WP4oXmUW2yPL7KrNlRzKWr3jpFxjzf3Vvb68Tc+GEmIQvaO79xwz9NyQe8cF9RBzA
	 HJmY+QyJ93YD3zyydR6T2mRo8/Z79stS29OwC/LatlOty/3hi2zVIB8Xjtd2N6FrIh
	 FVyMMXCcU74sDL7A/2dsnpVw6c0EnGas2k1E5t3nhcX2gwByJv475ikvkVPiNp1U6f
	 ES4jpmWAJ04RsI5W5fFe9jfFryO4luMqWG4eYQBs87aU0BE8pt+jLrLdSA03KCaWlW
	 8mb8Yjk6ZXhaQ==
Date: Wed, 10 Jul 2024 23:59:25 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Stefan Roese <sr@denx.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 31/60] i2c: mt7621: reword according to newest
 specification
Message-ID: <w3posivzapfwlfywhryxt7qac7knoscbjbvhqewucpqpxho4pq@sc3ulekjvifu>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-32-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240706112116.24543-32-wsa+renesas@sang-engineering.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_145933_383493_898DE003 
X-CRM114-Status: UNSURE (   8.10  )
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

Hi Wolfram,

On Sat, Jul 06, 2024 at 01:20:31PM GMT, Wolfram Sang wrote:
> Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
> specifications and replace "master/slave" with more appropriate terms.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Stefan Roese <sr@denx.de>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

