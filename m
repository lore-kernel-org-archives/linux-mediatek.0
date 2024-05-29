Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82729C25B7E
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 May 2024 07:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SzLa4QOccmrdl0LXb4EModwOR8sJTRCRvfPVbbiLAvo=; b=sBC5FINRbevspHF9qc9CmlpUf/
	9bJscFsFa1Jk7Ozq86u45nweZ4TgYGBT5bkBXcJkx4IXYbEZCW8AcbjsZTvMb1TtpYrvzD/s1IQTl
	/YDaVRjansEiFbVYlCm25fAPZmtIT9bJVIxuhL9bGhIMffoNtg5Ot9Ur8PFI6e2lU8H0oFd5WSHSL
	ULRmzxHNVh1JGmqmBJYcB4qWDZYk8qekQjEw7Souq2OaU7rcJvMIiKRIwEQelZoljci8KOew2YWYs
	BYV7O6krTkjgkcPHBQnnTVGNs/1AohPpnfjdcyYxJEV974lzEdXsj4evbXyxlqmSO2QyIwzDJ30ue
	mnPia6aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCE4s-00000003Dpr-3kqa;
	Wed, 29 May 2024 07:50:30 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCE4a-00000003Des-1F7f;
	Wed, 29 May 2024 07:50:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716969008;
	bh=QvmjPuQtPKrMG7G1fVqtkkPz0Z4S4QAs9oH3e9Q5kHM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=288nz7lVfH5TDnNLWstJR68tIHVdDN0ENkAYZhzlrI1uuLu2+xCTXMhYKV5cPvySr
	 FbZW1wLaAAT4bDTLNa+l3TjYDBs2MGgfkoO++GrJ4H3xTy9eDybVVaq8+kPgv3Zu+T
	 ic02Rn4smYfD9y++Y41qnWfnzO9fplq0FdgJ2WrWVyDLm87Z1zsaTQxwERr+s4jl0R
	 ZtiTNBeTgCZpUDxTM4LPmDjO1/Veu6sTnhZdCL5EphLiE15WMldWJxKvKgxlnGdHB7
	 gJNA7VbBZCPYUVSez+qrb4pT4iyfg/3pxDt5bjMNRISXyl5IGlFEOlOCjwmaMTL7E+
	 9iRVt9DstvUpQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id DF3013780627;
	Wed, 29 May 2024 07:50:06 +0000 (UTC)
Message-ID: <6576cdd0-d526-4b0a-9a74-7737fd75f06f@collabora.com>
Date: Wed, 29 May 2024 09:50:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: mediatek: Add OpenWrt One
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
 <20240527115933.7396-4-zajec5@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240527115933.7396-4-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_005013_077322_41BF421B 
X-CRM114-Status: UNSURE (   8.00  )
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
> OpenWrt One is the first ever OpenWrt product. It's based on MT7981B
> (AKA Filogic 820) and has 1 GiB or DDR4 RAM. The rest of peripherals
> remains to be added later.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



