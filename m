Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDBB5C3DA6E
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jan 2024 10:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c/2oaBr4iO/1sWgu4cfhj7Rov+gOamCBkgl3arIn18s=; b=kKcBd+PfkUJelnWxdgkpTPeZb6
	d0NGguAAGDo8n6iNQDnU6aty2aYn9WAbTGRX9YHfq+LMX/1hvX0c4GEh62KH74yBBg9LDAUqNcM2S
	aKXe09dWsGN1faO3P77YBU++iEVPBGKGA27DVvAXGyTNeBaxFpJRLC087o8yL73LilkschZt8/IM+
	1cnHLnZO7EGsiwnR4flNttIfd3dzeayTwzZGZf1cfsSDgD55WQo22uXufoEvN8gGHjdNll+Yy6oLg
	ilhJYfEYtc+fCDhC4kmPOx73Gk2flqbzJaqbWnMVzTrDacM/i/uAOjxWcec5dgbijFuJAybjVfIc3
	l6C1i/4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMmeQ-004ZpP-2o;
	Mon, 08 Jan 2024 10:14:34 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMmeN-004ZoA-27;
	Mon, 08 Jan 2024 10:14:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704708870;
	bh=+6Hlxr0hsvZweqdmUQQAuzfh3fA7eGxoJr8e5qLrLCI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JI2igXEsshtxlSPnZLcph1flUi93XgLxZl6t8n9XCWGOHtcarxXXrSzMnrIXsmvIl
	 HSkOIMdhcgvFwd2TmLoWkGQE4jzw7Yod7QKq01FUoxa+EqwOvo8Jy+oOmE4gcbXWTd
	 ukZ4oGNxG80HW+ehP/kTxI/9jEVdKpWVz3/IVK/6fwuhY8y781a9OFzv1JqhJHGhUb
	 9Rc3/EMT0/P4iUKV838AhMBFy9MjWyydR5AMUZ94b1TuQAbhde5iFDVbok6GImtvt7
	 n72YXbcgM8oJJEnkG6+5tYpI8JM0kFPSb3//0s1Gns2BMRKR3JMlK9UNMH21eADWq5
	 LnNgHU6Rs26oA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id AB07C3780625;
	Mon,  8 Jan 2024 10:14:29 +0000 (UTC)
Message-ID: <97a1d977-38ad-48f7-bc10-f3973b635585@collabora.com>
Date: Mon, 8 Jan 2024 11:14:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: mediatek: mt8135: Fix an error handling path in
 clk_mt8135_apmixed_probe()
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <6cd6af61e5a91598068227f1f68cfcfde1507453.1704615011.git.christophe.jaillet@wanadoo.fr>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <6cd6af61e5a91598068227f1f68cfcfde1507453.1704615011.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_021431_821357_1560D99B 
X-CRM114-Status: UNSURE (   6.35  )
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

Il 07/01/24 09:12, Christophe JAILLET ha scritto:
> If an error occurs after mtk_alloc_clk_data(), mtk_free_clk_data() should
> be called, as already done in the remove function.
> 
> Fixes: 54b7026f011e ("clk: mediatek: mt8135-apmixedsys: Convert to platform_driver and module")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



