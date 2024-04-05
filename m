Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B72E5C67861
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Apr 2024 07:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4c6YXkhrTJTvYlgle+D4XdP4PFR9jjqALa3JDrTnwGE=; b=uBEgS7M/Fa9mqQN2uNHXmcIIv4
	aPBuXVJ9ddpw390pytctZIaeOxRfiZnZ6hN8Drl9JJ9KbxlENYPRvPfMa9TRn+Le5hpZG+VoIQyid
	jHLrI82unCidMVxXfDMGD1NrHMIhzRZ9YKgSDqSlMeYMSK7LVYWADEZeDQKfbgpwTZZtQyMZ6uqOG
	QzWRLk4PE4xHOr6DeWOaKqfaIFRCzLHWLIc8ybBukTDv1rgWop2jEDOpZKA6m5QhybcNGDDsioQIb
	hzh4RM/CIIs8hWPTFGB4SoxRU3oCpn5I6AWwK+O8lfXMiXcfh2MLwZcNWHG0WECju65tnJpCvF7Ti
	cceVNMDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rseQp-00000005n18-0elq;
	Fri, 05 Apr 2024 07:56:15 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rseQl-00000005mxv-2Tnh;
	Fri, 05 Apr 2024 07:56:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712303770;
	bh=UOvIIKmubenoyIw9JeU3732AeboKAgBMh0mZzQYZxGQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=0BoBP0SN3xyOSmoRd6ZAVyJHv09U/lfB/m4fS0Fepa1f8LTE8l4OO/c2NALN7h/M+
	 0u6d0MZv/6lufVG2VtrncNdoh7aktpnLR+YRgYLjQmAunwtceZ2mTBq8xvI/WgA8P7
	 oDXtLYpblaS6udJzMYMSmXdct14ZFitjCsVax1JCFZxKqp2BQ3jTQT9f0yjrUcKmvj
	 4fW3O6lmj8oHl09se36A0c5dsVfz74XOebsBQe6cPkmgbUOZwqH5pdGCq2vXyTc7zt
	 nug9HaRomM28NbtlNb3WpcDOD46uUJolnTN8v/cVCyE+4DRWER3hAclVkS6U+/y1cV
	 vehpQVY8Z+G6Q==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 60865378212D;
	Fri,  5 Apr 2024 07:56:09 +0000 (UTC)
Message-ID: <dab837f9-a36e-43a4-94c3-00876140dfe9@collabora.com>
Date: Fri, 5 Apr 2024 09:56:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: mt7988: add XHCI controllers
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Golle <daniel@makrotopia.org>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20240213130044.1976-1-zajec5@gmail.com>
 <20240213130044.1976-2-zajec5@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240213130044.1976-2-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_005611_799729_BA21604E 
X-CRM114-Status: UNSURE (   5.66  )
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

Il 13/02/24 14:00, Rafał Miłecki ha scritto:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Add bindings of two on-SoC XHCI controllers.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



