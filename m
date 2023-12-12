Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64EA2C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Dec 2023 09:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2xdT3MiD3WrF8QxDB4776dAAeYEdD1OfGs686JctFho=; b=EPJM/Agiwo8oYPpmrlf2zpvYYo
	mUTK3EkK+MMyH3dgZOjcoDDwBGSNj32gJecwOb6fhXValUZwyjr/cZ3eJFPb8wuWOmaCYVlkY3yUg
	rfyWEwb0yuM1YRsFFL4eS5PdlfPGOSXM/jS6i4RKtxgx1Wf1rd9DQBLb1yJ7Y6wJyYpQEfU2NOfIZ
	w4ycEwFh1am1oBfP3xIzCAlXX/TaiH7zsHGTNhcy9uIaTLP1i1AjLK+Yx1LUq+ubHH45FKMtr+Tf9
	cCl4mXzXFkzYIW7z4TfbIdtxJn/e4+uSj4G6y4o8mpjaS6vA4i8c2EteQerjqOGo3wa4UHWZbfe5D
	E6vIwofQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCz85-00BD8A-1T;
	Tue, 12 Dec 2023 09:32:41 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCz82-00BD5w-0S;
	Tue, 12 Dec 2023 09:32:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702373551;
	bh=NAvNFGCToTcYv4i803QHyOj4P8Ba1LxYOhgrWA/utvU=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=kbgwqknwB0gVDzzS3fQsm9aNp3oYr8wyYJrK41E//BOVqK7eS+zj4wHzsFrMrC6mr
	 we6AWt5FlMZNvONxG2tXp2E1bwouzQOYR4kciQDbgarjx6OLF9LsYG+lHf84c99WUb
	 P50c6Ob9BUly4ub3j0FU7EGkmi/0oHLWKY9WKU9B+BRu29GF4dmuwS+OBBVZ3MIxCk
	 ySkxPYkMj1Af8KDXNuwrZRIH1H/n+8AwK7q8ywOVuEDjrRJHhXx8r4cOFRVrXyw+/c
	 wJF+lI5SDW0eN60v6QQTRg+Xf2Y1jejxUoDuQEjRhrH7dYGN0nL++d1kTRuAaUl9Va
	 dTDsvs1lSunEg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 70CA23781423;
	Tue, 12 Dec 2023 09:32:30 +0000 (UTC)
Message-ID: <55b785f4-a8dc-44e0-9320-9e71f0dc8853@collabora.com>
Date: Tue, 12 Dec 2023 10:32:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] dt-bindings: clock: mediatek: add clock
 controllers of MT7988
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Sabrina Dubroca
 <sd@queasysnail.net>, Chen-Yu Tsai <wenst@chromium.org>,
 "Garmin.Chang" <Garmin.Chang@mediatek.com>, Sam Shih
 <sam.shih@mediatek.com>, Frank Wunderlich <frank-w@public-files.de>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 James Liao <jamesjj.liao@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
References: <152b256d253508cdc7514c0f1c5a9324bde83d46.1702350213.git.daniel@makrotopia.org>
 <ce9b1e777090724794cf9f0c52bcd8618385fd06.1702350213.git.daniel@makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <ce9b1e777090724794cf9f0c52bcd8618385fd06.1702350213.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_013238_307883_035B231C 
X-CRM114-Status: UNSURE (   7.42  )
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

Il 12/12/23 04:18, Daniel Golle ha scritto:
> Add various clock controllers found in the MT7988 SoC to existing
> bindings (if applicable) and add files for the new ethwarp, mcusys
> and xfi-pll clock controllers not previously present in any SoC.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


