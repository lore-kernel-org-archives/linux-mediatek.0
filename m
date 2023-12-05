Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B23C4167B
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Dec 2023 13:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xEbm6FxGsvIH5wEZa+Lb4Da+G1BP8lwTrA67TmfgLJU=; b=s1mVCApy36GQ47UilnxeQNfBfy
	1etv9Et+I4aGCBddzgPsT1U12evHHdd2h7NUKyu/je4XI4rL4w+IM/PZI8N1EIUZIeD0uepQL+sux
	t//xsYXaXNoQp6HnLZi/aX3ZDy9SIDal3EIWcA0BniWlp1XsAwZ8Sm9HYScmzkhpANF7N+aK4BX29
	Jl3/X7bQqt9keBVbyTB0DjCkWlQR7wmXyFw31S6z0gFqr8Ui4hNli1svRb62pjcYuhvCVplQbI4mJ
	/uzRFwd5bzR8R47+O5olMY8vbma1yXf94BVPWwu3gfnnZLszJQuWDOKpct73x4GaUsreMJm/tQCBf
	xC/mTavQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAVHp-007U7L-2V;
	Tue, 05 Dec 2023 13:16:29 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAVHl-007U5x-27;
	Tue, 05 Dec 2023 13:16:26 +0000
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5511E66072C1;
	Tue,  5 Dec 2023 13:16:23 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701782184;
	bh=LvoshTz5j4twB2nV0awiqsR0ckNUSJGr88T74wiUcu0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NE8Xm/PSsBZc/9Aqs5m+atujg8ibHAGr+MhimUjMURtvhcjFSmd6k1YCIMN8FV5nR
	 tgoy/YGKU87suoeDUM0G5C4Sm+hEq7NHjRkGqbNJE3GZ5Hp0Dyr9Y4frLT5Rzw4OWo
	 3bjUztb5u38K/QRWwmDDmQhV2Qf0QcoFxaTKqi1Ak2Rk3aLVY/viGrg1Cc/G5jigW5
	 J4sL/ADNChXlfhE0zSO2NnBA4KPk9Stkz+haT0Q6lR7vWTYRtzsPTUtR4LxmUvoZkD
	 S9hdDJk6pX7h/k4uWj30rZjMCfH1vzMBBcRNdrcMm5L8WARkHcSptOxGPu/T9Sk7Qw
	 aPh2gG4c+bb7w==
Message-ID: <b1b4da61-6c35-4f8d-b3f3-efa50548e0d5@collabora.com>
Date: Tue, 5 Dec 2023 14:16:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 3/3] arm64: dts: mediatek: Add Acelink EW-7886CAX
Content-Language: en-US
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
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231204200907.5687-3-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_051625_860528_F99725C6 
X-CRM114-Status: UNSURE (   6.45  )
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



