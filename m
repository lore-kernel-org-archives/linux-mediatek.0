Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B80CCF9E9
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Sep 2024 08:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YMxMoUrYgorvFZtrBX/lZ3AJ5hR1xyD9YrUA28VvSo0=; b=iI7+ixyqrnbvSvPTA4lgc0whVY
	ZLcw8pm2ahjS6fPqlgAs9ziiKU0iWG4ZdSn7ezjWA/k0U7pwbd8bQ1xHR2gj+0V0Ix7OZ1NelwWcl
	XeINqYpObvHSrERDZB8mO++dXuWVnRvtiA4/sIyZAdii1gnkAJUWsQm+azr9FMPT7IbIhgNbYnS74
	ipsiqwFnVLp2fWtIWYAKBxNxOAFEXuiqFgVWM6G9iRuaJVmi01Y15FzJIYqOSbIbhvb1ZczDTX363
	KQnMJnHFZFQj8znQ4+AC4pW05MsGPtti3NAdSjmEAIw/Q1pt+6MKN0tJi6laeWlZQO7scTh3vI7ii
	kna6T+8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stjxc-00000007hJ8-3Iak;
	Thu, 26 Sep 2024 08:34:52 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stjwN-00000007h1K-2ohi;
	Thu, 26 Sep 2024 08:33:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727339613;
	bh=WGV+agiKTtPA0Ge5SGRdpcV8ZcMmyIWbdZE/9GX+HNc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=C5bTtQEggxgaIb/jTTwwZJy38BVXND3Rfq6giqM2mBpzjUwAPJ5FWynNbevkEiZ0f
	 5Hwgt9phM66U4MDXlwxGB9FS+uGQ/GsE6Y1up0pW4PiX+XwiCW7d4x2jQOjvs+rdNY
	 a98odkFXSypo3Weoz5PWbYHbcip3YgQgU3B74HQlTFHK4mWstmfC7in89IjcmB83iJ
	 pEbLPFRH8Lt3NGMn35GGXV3lPoh/OzHFLdfaR/BDExYGiL2HOVKVVBAgq7qO+8x0WR
	 NWxMAoUJpATmV1fAddKc6Jr4GQsP3ymuKOMinARnZqGeSqy5BNTwigjfjlDrWzQ9oJ
	 6aLzPe55b1/VA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4544417E1048;
	Thu, 26 Sep 2024 10:33:33 +0200 (CEST)
Message-ID: <3191519f-0228-4d40-be38-8ab8a4970ad3@collabora.com>
Date: Thu, 26 Sep 2024 10:33:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: mediatek: mt8188: Update vppsys node
 names to syscon
To: Fei Shao <fshao@chromium.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20240925110044.3678055-1-fshao@chromium.org>
 <20240925110044.3678055-7-fshao@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240925110044.3678055-7-fshao@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_013335_906611_BD5CD322 
X-CRM114-Status: UNSURE (   8.50  )
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

Il 25/09/24 12:57, Fei Shao ha scritto:
> The MediaTek mmsys is more than just a clock controller; it's a
> system controller. In addition to clock controls, it provides display
> pipeline routing controls and other miscellaneous control registers.
> 
> On the MT8188 and MT8195 SoCs, the mmsys blocks utilize the same mmsys
> driver but have been aliased to "vdosys" and "vppsys", likely to better
> represent their actual functionality.
> 
> Update the vppsys node names and compatibles in MT8188 DT to reflect
> that and fix dtbs_check errors against mediatek/mt8188-evb.dtb.
> 
> Signed-off-by: Fei Shao <fshao@chromium.org>

Fair point.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



