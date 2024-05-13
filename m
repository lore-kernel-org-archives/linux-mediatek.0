Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54802C25B10
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 May 2024 13:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kKNzPBNZdWfxQofIIVU92MNW+8Zh86jGjA3lwllcw4o=; b=3UwWmEDGjoZlO5
	nXHElMhWIBQie6G/Y1vdeDjLCnNZXxbmhv6ZIvDNT8VrvsffAKsk92z3uFYL1iTp6oMvVa4zmb/pP
	caZSGQKQH1Kcr73f2/Iz/Y54OjycpPJQ5o97OYg4Oc2iNJCWdBC2Tfwkp8iy+nEl2U55duAcQZk2g
	dIE9abMJ1W6QNKhyhVacxiz/Nh8Tt0o2sJe+AUu058PmbMGIVBu6p2kcBxjPK/wSmVU67PjB8NFuL
	fP34oyqu7furs1NVi7GSbv4gomTctZeAcK4BxlLuneOMG9A3apRfgB6m0quHqh3oRl0iSAIsaJuHk
	YOucDkkBWQ8psyynF6zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6VOD-0000000Cvmp-4Ago;
	Mon, 13 May 2024 13:06:50 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6VO6-0000000Cvio-3Ism;
	Mon, 13 May 2024 13:06:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1715605598;
	bh=PwpEC1pK3iSkqw+CUTBIysDmEzi1NrNuBuYMQbLR1QA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rCKM86jdnNzFNN0ZUZ8E7eyk85EtZ5u7XrKBA7CCGs6T6jwEfTPstTgmjidxcDNmy
	 DWB91bI686mgao6PL9WvTDeR8YnmEwpuLEoVBhDPBce2ue6hGUBpcog1VHVseGOQLG
	 5+4DJzStCqRLCBriuWPRcv8MQv+z7W5KOcUmV4zxH8dnHEOO5tGbYNZcKyBx1kM70x
	 QodtRT3zS3RbF9Q5vR0sNbuMpF9bS99lwDH9yij19wEM/dqLt8hcciqRveiW1CJxNs
	 cpNSfF6jRUyVdWVvcMpoje/bAEGj4DMSku+Dz0bMqzha65lsQVF2c26BofluEZqhn2
	 1Ka8V2pMGCDAA==
Received: from [IPV6:fd00::2a:39ce] (cola.collaboradmins.com [IPv6:2a01:4f8:1c1c:5717::1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 39BB23782167;
	Mon, 13 May 2024 13:06:36 +0000 (UTC)
Message-ID: <a91e7353-7d09-43bd-ad4e-b5bdf15a6a9b@collabora.com>
Date: Mon, 13 May 2024 15:06:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: mediatek: Add mt7986 based Bananapi R3
 Mini
To: Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20240510095707.6895-1-linux@fw-web.de>
 <20240510095707.6895-3-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240510095707.6895-3-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_060643_007814_1275DCBF 
X-CRM114-Status: UNSURE (   6.94  )
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
Cc: devicetree@vger.kernel.org, Tianling Shen <cnsztl@immortalwrt.org>, netdev@vger.kernel.org, Tianling Shen <cnsztl@gmail.com>, linux-kernel@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Eric Woudstra <ericwouds@gmail.com>, linux-clk@vger.kernel.org, linux-leds@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 10/05/24 11:57, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add devicetree for Bananapi R3 Mini SBC.
> 
> Key features:
> - MediaTek MT7986A(Filogic 830) Quad core ARM Cortex A53
> - Wifi 6 2.4G/5G (MT7976C)
> - 2G DDR RAM
> - 8G eMMC flash
> - 128MB Nand flash
> - 2x 2.5GbE network port
> - 1x M.2 Key B USB interface
> - 1x M.2 KEY M PCIe interface
> - 1x USB2.0 interface
> 
> source: https://wiki.banana-pi.org/Banana_Pi_BPI-R3_Mini
> 
> Co-developed-by: Eric Woudstra <ericwouds@gmail.com>
> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
> Co-developed-by: Tianling Shen <cnsztl@gmail.com>
> Signed-off-by: Tianling Shen <cnsztl@gmail.com>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> Reviewed-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



