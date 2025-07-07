Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E8BC8303C
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Jul 2025 06:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CWbMK9QfrRA7cmLniY35I1CU+hmcyS8uuTu60MCcl10=; b=XrU41UhKduEJ51UpGrI6+4vgzp
	O8ODgUm0YVXE4cQ3vv3fHYWNLaZe9YF5vuxKGQjRzVjCzDmH05Spbtn4ooVudGy8pF1V/ySW1iQ6n
	psix7OkaKeOXZy3paRIcXI/STHb0Plyljb4lLWzuGxq1cZWybRaMWgjeAdVwn/Xg7r0lTPBnOIOov
	SrSBB2EmJgG3V51/wXd1ClJ7sP+ZCXXqHu+j08/uHX6HDnVdHDkoD+O9vv21P2fgIY62yxf78fseX
	KNdSI+q3GmW5X7oGMOD2gYIdrG0IhbHS+LSqt9YwLvfh4uiqlDk3lNBjFmHDukfeHw2pPslnoH1T/
	OdoVN5mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYfOq-00000001Ygd-2RLB;
	Mon, 07 Jul 2025 06:32:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYfJj-00000001YCk-0qfX;
	Mon, 07 Jul 2025 06:27:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EF6696112D;
	Mon,  7 Jul 2025 06:27:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18C59C4CEE3;
	Mon,  7 Jul 2025 06:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751869625;
	bh=qgpJwWOs4lGsGZIewidOYHNqx+AL239trjUa1lpTRUk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aNAkyeJ7zXavwPMmFD8w9pyoJksQvP184yx/9M8iF3lhATTlCVeVNGRgOXsU8Sdbv
	 N6Zkgs2M9CTXrfNUeyxkINK/wUCY3KhVt3KobDInRDK8HYhGv44rXWe/P0Wp9h0bir
	 By0mGMzoVHtgFb90wU687PTZ6Ymg63cmc/jE73eSX/yufY8VFliVb0IKolI9pyVugc
	 vc3wu66xQZyrjF7mnoAPg6ejYFc0XnVzvni6Alfp3PHe+CuAIuNoAn9AD4RMtCH1ku
	 tJ9OHv+0r9IKtp3kRtpEGIkl0gdaM2/vTfBJTbFSQrrvp04+MS0K2cPp/ug0Eyfy7N
	 50QStbyls68bw==
Date: Mon, 7 Jul 2025 08:27:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [PATCH v8 01/16] dt-bindings: net: mediatek,net: update mac
 subnode pattern for mt7988
Message-ID: <20250707-pastel-psychedelic-piculet-b5af11@krzk-bin>
References: <20250706132213.20412-1-linux@fw-web.de>
 <20250706132213.20412-2-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250706132213.20412-2-linux@fw-web.de>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Rob Herring <robh@kernel.org>, linux-pm@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Johnson Wang <johnson.wang@mediatek.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, Kyungmin Park <kyungmin.park@samsung.com>, Georgi Djakov <djakov@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Jul 06, 2025 at 03:21:56PM +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> MT7888 have 3 Macs and so its nodes have names from mac0 - mac2. Update
> pattern to fix this.
> 
> Fixes: c94a9aabec36 ("dt-bindings: net: mediatek,net: add mt7988-eth binding")
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  Documentation/devicetree/bindings/net/mediatek,net.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


