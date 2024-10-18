Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02A62D3000A
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Oct 2024 13:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mk/o+9fd3c/v85aQz2LdWcHA+ECYN+MGpIuhvsDaSz8=; b=SUY3j6wFtGWOsdb06aYnuWgaR7
	SdaDuoJ6f3gsAsjouFm+2MDElzDgP1l7WwgeLqLZcvao2WuJi4xEQCf4NxNeGABOahaV5V+AhH1c2
	1q8gSHdZk8gBF/dWiQ+6xe8OzFT9YcsT/lMaYHYcvMufjW4TR99uTxcHQx7XJwSFCcaNcPTHsqvVB
	k2M4xyX9j4+o4LH1IXcyqZ6UR5lwKQ+UU2jZzprQSYVj3ANxYyPadiEIYTloeOHrF/Oh5o43Tl1Ak
	u6WKS4fIP+rum4cMWTOZEdkQ1/nH9tOmAWwfnElQSIrxZT9luu9d34bbNEH2IsSuR98tiMdcP5WoN
	VTOD6Xcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1nKa-00000000wyy-3ztj;
	Fri, 18 Oct 2024 13:47:52 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1nBD-00000000uR7-1S0G;
	Fri, 18 Oct 2024 13:38:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 69F21A440A3;
	Fri, 18 Oct 2024 13:38:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5FCDC4CEC3;
	Fri, 18 Oct 2024 13:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729258690;
	bh=QKtT8SqW4G954SAR1r9k1USNXcWid4P64fSmJMBOEk0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kqSA1IK2FYPqZDHLAjyARSjdlvij41a6fiIZnJwr8LzuBKGTIXsXPq/U+ssSNLoG+
	 GsX5n+OkCB3CFqtQGKfa0Okpv7+Q+6EImqF/dPBNVLglAxNYBmWghxYEyVtXXgYeex
	 xkXUFdKd1dJjIZ+cs9+KwrXcAAe/4YvYeR5Yahf30OaHhCsGGdmmZDELYs3+yhMMHg
	 oZLp6XZRGZxX18eruSdUqyTA3xuEa63Co355OA5xc+cyR9725zPQW/BVLEoZs7QvXi
	 ClBB1d5xVunhYZCDbiMj7gBz3YYepa0vm7A8LjI/qKWmMtI+aUl179O+mGbX8AIfRr
	 6WHyk7rjAspdA==
Date: Fri, 18 Oct 2024 08:38:08 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: jason-ch chen <Jason-ch.Chen@mediatek.com>,
	Flora Fu <flora.fu@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, linux-pm@vger.kernel.org,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, Lee Jones <lee@kernel.org>,
	Sean Wang <sean.wang@mediatek.com>, linux-input@vger.kernel.org,
	Alexandre Mergnat <amergnat@baylibre.com>,
	linux-kernel@vger.kernel.org, Sen Chu <sen.chu@mediatek.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Chen Zhong <chen.zhong@mediatek.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/6] dt-bindings: mediatek: pwrap: Add MT6735 compatible
Message-ID: <172925868847.81189.1460535251820890357.robh@kernel.org>
References: <20241018081050.23592-1-y.oudjana@protonmail.com>
 <20241018081050.23592-2-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018081050.23592-2-y.oudjana@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_063811_475307_B5AFFC0B 
X-CRM114-Status: UNSURE (   9.52  )
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


On Fri, 18 Oct 2024 11:10:43 +0300, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Add a compatible string for MT6735 PMIC wrapper.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>  .../devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml         | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


