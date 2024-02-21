Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D15C48BC3
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Feb 2024 10:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qD+blump8NSoSg/pm48j+V3J2A/mRw6UxTZhkU+pH24=; b=yzFD9UxNplklQ2ARVErVT1LYOA
	S2wYzhUSKzqfi3fkH37u3OoqxtqcXJxSAGKvSd86OjyBazsYdPgD0Wzt770mptgERlNpdB6Oq5A+b
	AfE7AlUQwU774IAc8Qz05jc6Fcp0SBo1V/Sz7MNPat+PXgLONN2kKjeSESPtO5P/QgnGsA0NVZZ36
	X+GiCxzG3CX9dkfWDwN8QXIOgl/r8MTV68UPOB82ji94WwZo20eRloRfbW3geWBuN38zugVfFwXLW
	8RW1gPk5MSIqisvDnerIQv/qbFg3RCWL1oHsTDjkFVgghZFun1pRrByDYKcc/vfqW3qB1rl54/0ud
	D9BKT4dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcjdD-00000000S7i-2ieS;
	Wed, 21 Feb 2024 10:15:15 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcjdA-00000000S77-1KCw;
	Wed, 21 Feb 2024 10:15:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1708510511;
	bh=/OBK/vPgAEGePwGQU9P8QRYiaWDf258P929gH0+KqMA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=4sDG00bUo4bLREuLVu8MVnI8BgzUcOe14r2DO+FerX22OHmUS71JMJilatztYGiss
	 5J8/ZIlVXu/7ZzjnsvR3ovj05O8pNxHb3CdkwSL+DgrId3FtbQaSm/9qr0FW621Z0s
	 kKRTLPF/9HudJR1ydgNAgB8t1R4ZdbBJdR+ECsDACnV1LGooEfA+Z8/wEHeqqyzgrc
	 Aj8FY/LtbG3DzCO7cRAOmCM78zvf2YANdkBf177BRL0um2kn8A5Cp0v+j8yWE73g7x
	 gWFp09E+wpESw+eBksRFCshNiEAb1y0E3IMYWHHZIKI5pAszABWlNvaxQ1PcQ+8RqQ
	 pksGJHs+w79aQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4C25C37820C9;
	Wed, 21 Feb 2024 10:15:10 +0000 (UTC)
Message-ID: <d5535a86-17d6-40c1-ae8e-df9fc0425866@collabora.com>
Date: Wed, 21 Feb 2024 11:15:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt7981: add watchdog & WiFi
 controllers
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20240221085547.27840-1-zajec5@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240221085547.27840-1-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_021512_505915_7BFC60B0 
X-CRM114-Status: UNSURE (   6.73  )
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

Il 21/02/24 09:55, Rafał Miłecki ha scritto:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> MT7981 (Filogic 820) is a low cost version of MT7986 (Filogic 830) with
> the same watchdog controller. It also comes with on-SoC 802.11ax
> wireless.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



