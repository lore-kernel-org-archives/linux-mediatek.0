Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 780D3C982E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2026 10:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yfKxUvTIIVbpaGwF4ucUbyra343Yt8o6RNfl09sjy5c=; b=B5pA9+wYrr3bLnMllu5zl6DPhN
	41u2Xm9juL5k1WeTaXCXbQMXUUv1EQyFbiX9vDmgB9zwGDbN8Og4+xZx6O9xdFbYoRv4F+CFZFlpo
	ji3FQaxG39GmXyOKAAHAbe0MU5LrImfXh+mQDzyjjJ+OJZMJfXGjOvUdNd44BjTbx2gFyU2iAUDDf
	ymksDeVmpDkFxDWB6iUvS5GYAxDaulOyNhBmYQkHQ7NPmPNXcdp5T0nj2ozW0a4A4rYcndwwuV/Uu
	r7NgnhTwwEuTD18BwBSibZhvSYwW5PF8fOp1nkPAOw2K/ZkjJzwoV56x5WRJmfJaA1lFsVg68laGL
	aOpvspig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bh6-00000001lM4-1NzO;
	Mon, 21 Sep 2026 10:56:20 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bh2-00000001lKn-0NOm;
	Mon, 21 Sep 2026 10:56:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789988173;
	bh=w+cy8zPIKF/xDlzbjSv3pIdL4iqEbDHcpzSasSalz/c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=N+x5swDtZttXcUWxFOnG5jeZ8dMdvuckhnH+McXYPPp73jOIDIxjzMU2hU6li9Veq
	 AiP0eFT5krIR8LWeF71Eam91WUK5t/ZsCqAThISHZmLXp6b5SKbJUff6uqwzyUYd/f
	 0xLWdpYUKV4mQNKUgJd5MyoRijKq3IlPiJPZeSxoKDEXXhRT0W8efqUt7I5UBtuXGw
	 qxWmQZU/X4T4g6q2EhH+oYLvroKGkoK3k7xQayRbfkAhZINz3ht+ovXfXG61C6exwB
	 oNt+Gz7K84JsZG3EADfzQ+0wRu02Bww17eU0umuaeVzMBWGUifRLofUVUDS5YSqtGq
	 UUEax7BLWU3yQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3B8F317E03B6;
	Mon, 21 Sep 2026 12:56:13 +0200 (CEST)
Message-ID: <9a060038-3f9a-4df9-9051-3b57787da765@collabora.com>
Date: Mon, 21 Sep 2026 12:56:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: mediatek: mt7988-apmixed: publish the OF module
 alias
To: Pengpeng Hou <hppiscas@163.com>, sboyd@kernel.org
Cc: bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, matthias.bgg@gmail.com,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 sam.shih@mediatek.com, daniel@makrotopia.org
References: <20260920033856.14518-1-hppiscas@163.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260920033856.14518-1-hppiscas@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_035616_277180_C8D4983C 
X-CRM114-Status: UNSURE (   9.81  )
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

On 9/20/26 05:38, Pengpeng Hou wrote:
> COMMON_CLK_MT7988 permits a module build, and the apmixed driver matches
> mediatek,mt7988-apmixedsys through its OF table. The table is not
> exported, so the module does not publish the corresponding autoload
> alias.
> 
> Add MODULE_DEVICE_TABLE() for that existing table.
> 
> The issue was found by our static-analysis tool.
> 
> Fixes: 4b4719437d85 ("clk: mediatek: add drivers for MT7988 SoC")
> Reviewed-by: Daniel Golle <daniel@makrotopia.org>
> Assisted-by: gpt 5
> Signed-off-by: Pengpeng Hou <hppiscas@163.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


