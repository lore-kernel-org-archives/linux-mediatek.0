Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D7ECEBF8D
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Sep 2024 09:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6WR+XwLSj/wPVTnzVILEv7/jdhyH+miv2hzT5ht7byg=; b=V0NQp7vbQQ7QazTjjew4YskSa8
	EmDkasY66UToKzZprJCx2vP/3uGf1fKVU5mFuj+UfgbzM/XDHhZm7xe6Bh1yNrg64d3JDpqapStOy
	pySGy1wKtgglf8dLQO/tvUImo9s4heZTzxdTCVz67pZgt5r5yRCxuHO11BKFFQu3O1Z6OocQUzB7F
	D8R/417yVVwzMGxpyGBwISPS56B0KOXjVYuBerZVrU6xC9Rfy4LiYXKAX11NgdHNaTWs/CNWvW/24
	K66PJHyEikpjUhAgU29RbDF90kBOtR1sPej1O9hgC/yKOUryp3nybEG7BHsQBztokDJVPB4l3Hp/2
	afNlWgzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1su7Vz-0000000Ahrd-0BCY;
	Fri, 27 Sep 2024 09:43:55 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1su7Uh-0000000AhGB-1rfO;
	Fri, 27 Sep 2024 09:42:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0C3E4A45475;
	Fri, 27 Sep 2024 09:42:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C71EC4CEC9;
	Fri, 27 Sep 2024 09:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727430153;
	bh=TST2aU00V+a/b6WJK9LCwWG80Mq75dZu+SmOHyfGhDw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o2Av3ebHVSl6qmxEGQZKjs86KC6ZaA6DIYPXM79Z6t6ndEl6tL6O7q8ePXtYVBCz8
	 NFDA7kMcX2J/JBk0DLWyxK+CHpSt0xM8kXlHqSyvjyeJNwSfhbXGGyJCqHh7mc/AqU
	 YBhz9hNlH/2nzaDLCSrtg3SHW3Ns9MeFQjlxw6SMRcj1L+rUfKVK/EpLVz64LgBcTH
	 mW6dimPJMBckLxty4HXgLoeT24s1mWNhjwjJhI9fusH43oJz7W3EZPmsbAfm7kTqQN
	 iTP7t4Eyp85G+qpzHpjA5TxQ/23G4wQQ6tB0BZV/7QS8tPH6kuXFm68xcnB2DzHHAG
	 xg8NPMi43ymDQ==
Date: Fri, 27 Sep 2024 11:42:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Conor Dooley <conor@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Eason Yen <eason.yen@mediatek.com>, 
	Jiaxin Yu <jiaxin.yu@mediatek.com>, Shane Chien <shane.chien@mediatek.com>, 
	Hui Liu <hui.liu@mediatek.com>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org, 
	Alexandre Mergnat <amergnat@baylibre.com>, Bear Wang <bear.wang@mediatek.com>, 
	Pablo Sun <pablo.sun@mediatek.com>, Macpaul Lin <macpaul@gmail.com>, 
	Chris-qj chen <chris-qj.chen@mediatek.com>, 
	MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH 2/3] dt-bindings: mfd: mediatek: mt6397: add compatible
 for mt6359-codec
Message-ID: <z5zehicgqqsbgsjz5nrjlqrkpqll57gb26jdc3ctpeajtlfusm@b2s5vrbuv3es>
References: <20240926092519.6556-1-macpaul.lin@mediatek.com>
 <20240926092519.6556-2-macpaul.lin@mediatek.com>
 <20240926-smokeless-clobber-0fb8a1cdc7ab@spud>
 <78381b10-eae6-1414-6913-994e1ed03410@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <78381b10-eae6-1414-6913-994e1ed03410@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240927_024235_626875_F453FD0F 
X-CRM114-Status: GOOD (  17.68  )
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

On Fri, Sep 27, 2024 at 03:57:58PM +0800, Macpaul Lin wrote:
> On 9/27/24 00:04, Conor Dooley wrote:
> > On Thu, Sep 26, 2024 at 05:25:18PM +0800, Macpaul Lin wrote:
> > > This patch updates the audio-codec properties includes:
> > >   - compatible:
> > >    - Re-order the supported device items.
> > >    - Add 'mt6359-codec' to compatible since MT6359 PMIC has been included
> > >      in this DT Schema.
> > 
> > >    - Set 'additionalProperties: true' for 'mt6359-codec'.
> > 
> > Why?
> 
> The mt6359-codec support these 3 properties:
> mediatek,mic-type0, mediatek,mic-type-1, mediatek-mic-type2.
> While mt6358-sound and mt6397-codec don't (at least, I didn't find
> these 3 properties in driver codes.
> 
> Set 'additionalProperties: true' is also required to fix the following
> dtbs_check errors:
> pmic: audio-codec: 'mediatek,mic-type-0', 'mediatek,mic-type-1',
>       'mediatek,mic-type-2' do not match any of the regexes:
>       'pinctrl-[0-9]+'

Why is this a correct fix? Aren't you allowing "pink-pony" property as
well?

> 
> > > 
> > > Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> > > ---
> > >   Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 5 +++--

There is no such file.

Best regards,
Krzysztof


