Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 258C5C25B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 May 2024 07:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IH5S9TCTpKKjmINjI3dE/wC1BiA2tlADL5Wu25nv1Xc=; b=wd5arJHYpKmmlKRqeu0MfSpTdk
	fYbudSQYfI0PZThgDKNJRpEieKNgn3W1bs8aICKShzpwBY0yj6/64n1okGJb605Y22V68PvOIRbcp
	yzQ3JRCj4kaqrCvIjEZAN1zTn6ORz5lVU+OAoV3lpxEgYI1vkZ3HIx4sekxOR+lgd5ulLvCD0bRMj
	CvNNJg6LJr5VMwz+DahW5SxLnvLzjfzUCl/q6c0fo7y4Xl6NVN0S2+pwdE/ADomF57bM72YJ3QaSC
	IxCX1gW1I5dpPr4/2Zn315dIPIMAZJkIvQocxsnwZZiqbGsZmXZq+1t6Vwao7wO1DRPL/Sk3XwN0F
	xxMMoRMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCE4o-00000003DmX-1eOM;
	Wed, 29 May 2024 07:50:26 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCE4a-00000003Deq-1FAC;
	Wed, 29 May 2024 07:50:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716969009;
	bh=5Y1TzX8BdqtX9D1aqB/WNbF9QfUgTWYv6OKhdD2AjcI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=N+8cJ9w+z0a9R14vo09cAFx8BclLGFjF1SMWb9sOXRw5XgLrZ/tlQrQRwf8ONiywY
	 2bbBaMcvxUgw0loXnYmugaJmEg6f3KqWnc9uRFkCk01lk5qryow4cA2hKg0D6OCNRF
	 Pp9jKd2uftTe9J06eF3Q54T3SY/TGxWMqMpDA/IfUgou6DYvit9Sv1DJ4PX3K8BgaJ
	 7xcNUe7+PJ6OpSOe89JwQimgjqr8e9dh/hi1CX0jNubNv9tG7mefiJGm9XUro7pEoV
	 9ZK5gE6Zuk0q7sEzWezk/Gbvyv66ChzWB7a5G4vA82IvBgX12t90944bY8E3jPJoaN
	 EHsIknjNsruoA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 563133782162;
	Wed, 29 May 2024 07:50:08 +0000 (UTC)
Message-ID: <773385d8-d523-4d17-ad4b-46decca617ad@collabora.com>
Date: Wed, 29 May 2024 09:50:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dt-bindings: arm64: dts: mediatek: Add OpenWrt One
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>,
 Heiko Stuebner <heiko.stuebner@cherry.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>, Sebastian Reichel <sre@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Sean Wang
 <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 openwrt-devel@lists.openwrt.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
References: <20240527115933.7396-1-zajec5@gmail.com>
 <20240527115933.7396-3-zajec5@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240527115933.7396-3-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_005013_018084_24D3F5B1 
X-CRM114-Status: UNSURE (   7.20  )
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

Il 27/05/24 13:59, Rafał Miłecki ha scritto:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> OpenWrt One is the first ever OpenWrt product. It's based on MT7981B and
> has entered an early production stage.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



