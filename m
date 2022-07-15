Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DAF0C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jul 2022 10:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YLvHDPdKDF11BCWcQQQQUBxBS1LmtM19ULhdSXZYDuw=; b=2ZBnIlCOe478y/vVbBt1zgY7wG
	tenIUb2hGuKZpTyLQUVbeduAw0MoY1At2eBxjng6EmrLABJaH7EAD/NMeRaDMBxVgPsjvuxVw/nu/
	AnyGeZLqbbckByxMSXqtMdzfOSGM9uFNnJemjTC57ZrHK26mXBecWw0kJ9vYivsK3VHs9SE98Y/Mi
	X2diQScg5PYA1T7QagDeX5bwWFJleh6i7XEAHqu0KK2QkYt+Bs11BwnyQY2va8OTuLFlpibul6cZ4
	+0Vl1dheyIw+33E+SXctOYB43c5Xp/I1pErjaEQXVr43ovxIOc7cY7ArXEdmH7p+beU9+e3x82qqy
	IVLEYQ6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCJ0h-006RyT-13; Fri, 15 Jul 2022 10:57:27 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCJ0W-006Rvs-8P; Fri, 15 Jul 2022 10:57:17 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7448B6601A59;
	Fri, 15 Jul 2022 11:57:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1657882634;
	bh=Cm36lUlMtdM68Ok/fjKgE+JF5RB7+n5un2L24yN4VrY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HkoOcJP8PaQorVWoQjSGsfd338Dn037tTgUCpgPzHMbhICd6o3MvSZsRtuJ/FOMHS
	 /xf6DFBBKgacdeCFUiLYFi6UkQz3V8NC8ctB0Hp6rK5qd1F8EAKhBDgk8V3gmks0tU
	 L5O4LLJ2Bl+n/biCY5dioE1/Lz0cumVNfRDw7CDH8anONVq7iiI6IYUL2cA+BHwjik
	 ZeQKXfoW1Hfoz5J65iU0dhHnHKHVLcoSttnnmTacf0OWso0QoWRMqfFiskfbB6JjFz
	 DT7GjBc2G8mv9Y2D3LiYaV0A1TG2He4sE3ko7G8Z24P0n9SwXyWh8NK6enMEg//Xxb
	 g91VYSlxxKafw==
Message-ID: <2f87c42a-d097-4acd-eed2-dc9f6aa564cc@collabora.com>
Date: Fri, 15 Jul 2022 12:57:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 0/2] MediaTek Kompanio 1200 MT8195 - DisplayPort clocks
 fixes
Content-Language: en-US
To: mturquette@baylibre.com
Cc: sboyd@kernel.org, matthias.bgg@gmail.com, wenst@chromium.org,
 miles.chen@mediatek.com, chun-jie.chen@mediatek.com,
 rex-bc.chen@mediatek.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220617111248.90505-1-angelogioacchino.delregno@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220617111248.90505-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_035716_535752_29A41DAC 
X-CRM114-Status: GOOD (  12.18  )
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

Il 17/06/22 13:12, AngeloGioacchino Del Regno ha scritto:
> This series fixes the two DPINTF clocks to propagate rate change
> requests to their own parent (and also fixes vdo1_dpintf's parent name).
> 
> This is needed in order to stay clean in the DisplayPort driver and
> avoid adding (now useless) custom handling of clocks reparenting based
> on the wanted final clock rate.
> 
> Changes in v3:
>   - Fixed tags ordering.
> 
> AngeloGioacchino Del Regno (2):
>    clk: mediatek: clk-mt8195-vdo0: Set rate on vdo0_dp_intf0_dp_intf's
>      parent
>    clk: mediatek: clk-mt8195-vdo1: Reparent and set rate on vdo1_dpintf's
>      parent
> 
>   drivers/clk/mediatek/clk-mt8195-vdo0.c | 7 ++++++-
>   drivers/clk/mediatek/clk-mt8195-vdo1.c | 6 +++++-
>   2 files changed, 11 insertions(+), 2 deletions(-)
> 

Gentle ping for this patch.

Without this one, DisplayPort (both DP and eDP) won't work on MT8195.

Thanks,
Angelo

