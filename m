Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54494D15D95
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2024 13:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R0A0Ll1blUnb4FtzQ3FNWF+zJtY95kv7Sbdx58kRsmE=; b=CVyIuG/N2UiAm7pAFUMvhB+BUp
	0b1VchCgND5yeXfCXjKZZfnoUdL7y3Vzk0rIs00J3k5nNX/ssapyXJqHS9fr8TqoPzLGXYvA44x8j
	JDVq5Mc235z2/Yhk0FiwwXZZxDzLZCYl/8BdSnXmx1+A9sPAtCGILivuIEVE9sgBsxBD1r6PuSLRN
	azo/vSd33Gs7h4jZGKJTNIxgzQbV/qlvS8FkIx204HXPBW5EeJisDAvELbtcMjm40gMNYnA01le3i
	TPqRViW9SQwgkWRJhvM8vSQiYBRaPHzpFcIicRz/o6edh4bpfZxz53V+HBn32NkjahPvL8TMLdG5e
	jkJN6ghA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2sl6-00000007UCX-18dG;
	Mon, 21 Oct 2024 13:47:44 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2sR3-00000007Px2-1DPH;
	Mon, 21 Oct 2024 13:27:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729517219;
	bh=vHZReT131qYAQIRC36w6bRZrUk6yYQYEHOdtxNEqOno=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TnZuXthQvTvqIhI8Sk0kmleB2OdsE5pZJAKJEu6M9GTGF5o3H/F5pLZdggbNWEQn3
	 SlmKIjoMYCie61uHVofuM+knmQgknm8OnkVORHsChJeutmZjIkjgsE9FSz5f4K/1Za
	 djl8BqkvzfKo7GTgjoQXmgFxWxYeFtkIZ0t6OOEMyX4i3V+17XWmt0nCzSJ9wL4Lji
	 fkgODNJOHDGPfRVgShXup1iXHj9yyEqa2AFZMNZaBHrlA5ug/mqjSNaCbGBK3YEuYO
	 BjFsyiDALgYpdl81UrSz1mfyB73toOQaYW406f3Jgbd7meprGe02KAWJjqda3ZY3kU
	 HjTRbLZVyCqYg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9D98617E3612;
	Mon, 21 Oct 2024 15:26:59 +0200 (CEST)
Message-ID: <3e218c65-608c-437d-a464-6502a8dcea6f@collabora.com>
Date: Mon, 21 Oct 2024 15:26:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt8186-corsola-voltorb: Merge
 speaker codec nodes
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20241018082113.1297268-1-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241018082113.1297268-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_062701_514780_6240CBB3 
X-CRM114-Status: UNSURE (   8.99  )
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

Il 18/10/24 10:21, Chen-Yu Tsai ha scritto:
> The Voltorb device uses a speaker codec different from the original
> Corsola device. When the Voltorb device tree was first added, the new
> codec was added as a separate node when it should have just replaced the
> existing one.
> 
> Merge the two nodes. The only differences are the compatible string and
> the GPIO line property name. This keeps the device node path for the
> speaker codec the same across the MT8186 Chromebook line. Also rename
> the related labels and node names from having rt1019p to speaker codec.
> 
> Cc: <stable@vger.kernel.org> # v6.11+
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



