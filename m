Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D9BEC4167B
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Dec 2023 13:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xEbm6FxGsvIH5wEZa+Lb4Da+G1BP8lwTrA67TmfgLJU=; b=M61NQsdSeiXzDneT0VKPLTpM6x
	vFny4iItRgvYmDYmuLU73s53VLL9FWCpVUHGVda7rSUf2q+XKmSukgrNCDD4kYoqp8vRvRlOkIEmk
	tVnAR7now6Nxp+xaXwOFjpnIFAqLJBGBQL8FgknryNgqEaasiEnJ5x1lH91d+2WRpTAgAksf6HDHq
	K8djHWbSOyzoNUUqONwVm6rPKVNR3KwM7xTh8ybpkrObCiOxZrwi19hTb1SkwMc8/c6VNI35hR0Uv
	Z07hxtTCW85JvnojQzSFp3H67+c59mWejU91k4LISwQGCtACWwgM9E/nG6k9ep6Xaoly6eHHUDPIt
	ug1uvtZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAVIm-007UG2-0v;
	Tue, 05 Dec 2023 13:17:28 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAVIj-007UEX-1A;
	Tue, 05 Dec 2023 13:17:26 +0000
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C133F66072B4;
	Tue,  5 Dec 2023 13:17:17 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701782238;
	bh=LvoshTz5j4twB2nV0awiqsR0ckNUSJGr88T74wiUcu0=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=Avy5RDzv0HF6Xg83nS8DHcmyGHrrl50Od7RllZy385do+ItkFtic9DT5X5Kzieaaj
	 a3N5myRuCXa1Jz1sgo95uLsskwgT5x8iah0z4nZpBPyJihFX7PiifxzsIY1aQgukPr
	 G8RE+XxHWGKUtXTnrCrdXVGrbnRx+M/HVXaRmVVTgN4FN+Rgxh0JAWtKJDlHOR77KQ
	 65rJ7/zi36S9BN4/cg25RZjjI4oAxPrpWbFsDUq7hyZARxfCKYnNhB/rCFw8TAZdcu
	 P7Rl7+PAP2Az8jYHQvabxOmpGsFS83Wz4P0b4JIyUzwEGAedxf7lB+lkiVL2YOl+gn
	 GwGQhDY8fvtmw==
Message-ID: <4e3c38b0-c366-46e6-a0ce-6b1ff25c5452@collabora.com>
Date: Tue, 5 Dec 2023 14:17:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH V2 3/3] arm64: dts: mediatek: Add Acelink EW-7886CAX
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?=
 <nfraprado@collabora.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
 Heiko Stuebner <heiko@sntech.de>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chris Morgan <macromorgan@hotmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Sean Wang
 <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20231204200907.5687-1-zajec5@gmail.com>
 <20231204200907.5687-3-zajec5@gmail.com>
Content-Language: en-US
In-Reply-To: <20231204200907.5687-3-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_051725_526508_E3AFF058 
X-CRM114-Status: UNSURE (   6.09  )
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

Il 04/12/23 21:09, Rafał Miłecki ha scritto:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Acelink EW-7886CAX is an MT7986A (AKA Filogic 830) based access point.
> It has 512 MiB of RAM, one 2.5 Gbps PoE (802.3at) Ethernet port and
> on-SoC Wi-Fi.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



