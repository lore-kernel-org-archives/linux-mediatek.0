Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F6FC25B7E
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 May 2024 08:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mAnj4ZejeQvh5h0aM/c7C0EBwYYpWcfz0QKWEei6Nd8=; b=jsuA+QHinXfyBK8Ic/h5tb5CWd
	3C7S6yJ0HLxNyVFCULaskOyL3L/NDRs8UgYSGDmtiT9tbjKhppxi1X6CKo2bopqbohJZVhCUMHOr3
	m29t/dT4D1DjJ15+RpyfvJA+NxREIkSWez7/R0ojz9OT4u8ROVK8b6pee9VATKmno2dpni1WVqBC0
	uSz7T0ng8d2Bi9qUCODO6bZH9uDRl4UfoVFvCwOWw1KP2J0lCwLep3TdGzjJEaP0mClHEoywUhm8R
	O0Sxs6IOMncB8j3EVJ8dtjcFvgVicfZqOdDVgJFftSw6YBBxYOTGgv6B9u6O2MDzhR1dWTaZXGjag
	j6qzu7Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCENy-00000003Iem-1iFb;
	Wed, 29 May 2024 08:10:14 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCENo-00000003IWH-0Qhn;
	Wed, 29 May 2024 08:10:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716970199;
	bh=OExHiN99wGb6R2db+IRFul6kbEXNTc2ifi7mmG8VrZQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=faeqJuDDvqrB2pUioHsdCJKTOCKQx/HqffJzaxeTSMA2s0oPUEaR6mlLWlIM1KyKm
	 rzzACPTx4aB8qNrq+LcC0RLwOgevuMw817p56rYE7LwaFDh6VMRKwA28wue7gqFOcF
	 34o6/vE12pc4aBNh+qLfHfa697HlQ+VGCETFRGtaFFeI515mbepAjOzGuecslYFRbw
	 ant5ZwazY+Z1n4G9GntLO2iVit5O3F/M6re3PHvBLc0zd3fHSHNS9QyC+udQbP2j7d
	 dbZ1MhbVTAVqeUEXzVmf8vjbRhRQo2I2GR7hdb+KPI5WHotG/wrR4/pKvg6PPJQdt7
	 Orl7CbZNBsGYg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6C9DB3780627;
	Wed, 29 May 2024 08:09:58 +0000 (UTC)
Message-ID: <0cbfcab9-f3d0-4b88-bfcf-154e96ab67df@collabora.com>
Date: Wed, 29 May 2024 10:09:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dt-bindings: arm64: dts: mediatek: Add OpenWrt One
To: Linus Walleij <linus.walleij@linaro.org>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>,
 Heiko Stuebner <heiko.stuebner@cherry.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>, Sebastian Reichel <sre@kernel.org>,
 Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 openwrt-devel@lists.openwrt.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
References: <20240527115933.7396-1-zajec5@gmail.com>
 <20240527115933.7396-3-zajec5@gmail.com>
 <f3930034-0cc1-4bb5-894a-72c809211233@collabora.com>
 <CACRpkdbh+5CMAD6_gxrMspJ+uFCs7R0HPe_SAWNvfvyxyA=U2A@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CACRpkdbh+5CMAD6_gxrMspJ+uFCs7R0HPe_SAWNvfvyxyA=U2A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_011004_323891_C404B256 
X-CRM114-Status: GOOD (  13.87  )
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

Il 29/05/24 09:51, Linus Walleij ha scritto:
> On Tue, May 28, 2024 at 12:32 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
> 
>> Isn't the OpenWRT One made by BananaPi?
>> In that case this would be bananapi,openwrt-one I guess?
>>
>> Is there any OpenWRT contact that can please help clarifying this?
> 
> Both Rafal and me are members of the OpenWrt project.
> 
> The legal responsibility and trademark of this product is handled
> by OpenWrt, so they are legally the entity producing this board,
> I think that is what matters for vendor strings.
> 
> Yours,
> Linus Walleij

I was suspecting that, but wanted to be extremely sure of what's happening here
especially because we're at the beginning of the new cycle.

Btw, I think I didn't know that Rafal was involved in that ... or maybe I knew
but I forgot - whatever - there's just too much stuff in my head right now :-P

Thanks for clarifying!

Cheers,
Angelo



