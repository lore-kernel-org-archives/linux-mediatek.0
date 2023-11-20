Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B8EC2BB3F
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Nov 2023 14:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NIqXUcUCwVeIRv2qHSUzaHbKhpAZDcDNmXXxRqFrMz0=; b=k8PeuaxFPsMAKJwdiPbWZZDXQp
	jqCi7327AdskkDaSAN7jYFLORCHEheej50OOtnXn2HFTDMLSIY2CmyGnz/AeHBE4bHoXH/CbLxJUf
	NbBCVDid+6aaJwOP8HUJZHTTgXkolCiYGhcEEYO4GJMeqwcFM4sgpyruXcfu58uoqSpM9DMJbAPKB
	8O3w4FsZy68lrMT2/tXEgW1gaepwYIgdGEaxrCn8mm+ZqXzLGLYUT1YBq0pN8g7NYEwBX7QImJDj6
	cQFwzcS+h8eSm78fl8qAVYH+xqpe0SmPljR8ru+q8b1kqVe1XbvfpyivodQuNi8O3i/nvwob0G0YN
	/FvByf/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r557I-00CGJC-0e;
	Mon, 20 Nov 2023 14:19:12 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r557C-00CGHj-2r;
	Mon, 20 Nov 2023 14:19:09 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 91E596601A72;
	Mon, 20 Nov 2023 14:19:04 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700489945;
	bh=T+qrTMuHrMRvawTrd49xgKdO8TQz2pga+1olo5Ug+d0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=l5SIbpnWFFpe7m4zp7bUc4ZGpQnE/gvSXdpkF2IWW3lipEq7+/BREXuAc0JwoCntI
	 CFeo8b8oZBbJ3dSOEpxvytJkhqw8fZkqYNcz83INp+n2mde5hmy+NgzFcfJ+0XHDQD
	 bVI+0wKt/sG06Hfjy1vYT/0WgNIpROWj0xZA+EUvD9GwIy0nBt9b36R3OnXaVVG0+y
	 Q/rOQ9NxGKaS4cWI7TiuIfmdQJAFMjiYcW8Iu+bRC6Tolh/L+knk6hdFZVVj96+fHB
	 fAsM55BRrtfAMZ9c+DC7tfptCmPoe3TQBGq4YnztMK2bTiUQb+8v4Wov/O/LhRBmNW
	 4GyxmbMAiv98g==
Message-ID: <0136f1d1-22a3-4929-81ca-a1ed35ba8546@collabora.com>
Date: Mon, 20 Nov 2023 15:19:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3] dt-bindings: thermal: convert Mediatek Thermal to the
 json-schema
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
References: <20231117052214.24554-1-zajec5@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231117052214.24554-1-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_061907_121844_BB6AF609 
X-CRM114-Status: UNSURE (   5.99  )
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

Il 17/11/23 06:22, Rafał Miłecki ha scritto:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This helps validating DTS files. Introduced changes:
> 1. Improved title
> 2. Simplified description (dropped "This describes the device tree...")
> 3. Dropped undocumented "reset-names" from example
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



