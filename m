Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA401C27C50
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jun 2024 12:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HnHpyoLgbAz0d8falTPJ+waM/EVo1kf04U7L1ybPhls=; b=uEudmgOC0zcv0J87aViXWw8Elg
	RaSlDq8h2dwJG7Z8foF/TH1bYr9tjb4BKMnYT7F6JMnzIqOLbpoE+ycSueCxop2ALwA6eqGoDXLkH
	4vtSziIk/rk9k9fFZs9aZwz77xc27+rq5nYYlFsYi6jVPHaSHfy+wKzDqX0SiTirlDTLDk1iMphll
	UJK6IzmnKnGF8qhFNFAR1BTpT8FYWOxWBICHlQlLGGLp69sMsvC/npk2hhCi3JrX7nwHxbtE9W1CV
	4iXQTx7G7h8YswiqklpKqmtdACWS8TyJtpNuYj4L+UQ20tZDsvosfn2RIVQ1yhvu54rtgwM+pgYmZ
	0fYYBFGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sETVf-00000002KSJ-1SEI;
	Tue, 04 Jun 2024 12:43:27 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sETVb-00000002KR7-33U3;
	Tue, 04 Jun 2024 12:43:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717505002;
	bh=BE1DDuhg+2o6/4PanLrNPOI0jufqYBZIohTubClefAQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=p9E31tmxEVis/t2K+lrzbXPyelH68TS1JWNYN1hnidwt0CFCLUEe08kJC09xt0pzg
	 O0g4VtVdpo1OqsEsJ49tJvDFbYjlUUjmiLbD2PVRp/1F6FJcwGB9kCcdz7XeUbKsIU
	 fN3jRsIhQXD0dM/W4QjH3S0/h5znfP/jwphYnv6D15tvysMCDLcznYXX1XC3CevbWH
	 6+XIYPcLCcnrLIGL5Fg8T2h5cZ3tbJgSRPAf35pEET7DjE79IDk0mNcr9cD3G2oOHR
	 JQ0CFfkuRS5IwyDFjeLYkvNo20PB73Hs2WAdNPFP9ZmDeSRm5900ztBhFnYmQfsuyR
	 95Imb8CoJAEYQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id A494937821A8;
	Tue,  4 Jun 2024 12:43:21 +0000 (UTC)
Message-ID: <29cc03d8-fad4-4bfb-8947-f25b1366b801@collabora.com>
Date: Tue, 4 Jun 2024 14:43:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] arm64: dts: mediatek: mt7622: fix "emmc" pinctrl
 mux
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>,
 Ryder Lee <ryder.lee@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20240604074916.7929-1-zajec5@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240604074916.7929-1-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_054323_923756_6138869E 
X-CRM114-Status: UNSURE (   6.46  )
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

Il 04/06/24 09:49, Rafał Miłecki ha scritto:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Value "emmc_rst" is a group name and should be part of the "groups"
> property.
> 
> This fixes:
> arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: pinctrl@10211000: emmc-pins-default:mux:function: ['emmc', 'emmc_rst'] is too long
>          from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7622-pinctrl.yaml#
> arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: pinctrl@10211000: emmc-pins-default:mux:function: ['emmc', 'emmc_rst'] is too long
>          from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7622-pinctrl.yaml#
> 
> Fixes: 3725ba3f5574 ("arm64: dts: mt7622: add pinctrl related device nodes")
> Fixes: 0b6286dd96c0 ("arm64: dts: mt7622: add bananapi BPI-R64 board")
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



