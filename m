Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F565CE7CE5
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Oct 2024 08:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BzP+PwQK8PWxofQfqXpYGIk1swSUc9mebHANlemkN2I=; b=WBuRJE17KAeYnqbloPg2DkPLuQ
	i4wb97kE9QkW+e/CPWjdV2P0XwqhA6NNEFJ2r1TYuwODgsn9LDRrL+uYz178kkefFIF8bp14ld+kc
	Ruf0H8Z5+BAq2QvuluopB6tRx+iZ8O1HisUXs2TnbYkkU+/gW0lBqgtWOaVHj1BWZ/hOLgGQtxC2/
	OhORXbwTNwVPm68U6A8mE1dENcZOamBlz6PaohLjfDH/kwhlB+CXOEaT1l2ZOleDgnlEpsEvOCW/6
	yX1cjHpcKnWlUGwkjzB0zGOEeNKsDrMtaqhZDn1sPMJxCE+H/w8+YYYM9D4JjQnBDZBPFUH3y2tTk
	IwLXcq9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svXo0-00000001yRr-1sXt;
	Tue, 01 Oct 2024 08:00:24 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svXiG-00000001xEC-3lW0;
	Tue, 01 Oct 2024 07:54:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727769267;
	bh=5ZET3p3zVrRIMFCDf6Lv+QwoHRWZt3Lu5WSpJmGz8ig=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=otXwunuT1IegLikwxC0vMY3+wyvoMJuEKtQyMTT11BZPbOCOdiQjUJagKlUN6cQFq
	 j2prA5Fcpx6SJ1zrfCcVr/IoAAs/ckdHFzt1UftpbS7B2St8ceKyrSM79gph/qR3Go
	 nJgD/24Uz8gZOw2ZWmq/GdPT5BSrYTnuurDp5TB7S+I0L8UcOVeqyKF/EAYnLf8Lse
	 FPWRExN20Q7kPscV+SdC9eY7l8rEhNCiz6wwF/DxbTmXG6oLQOoRRyd26HLIQifejC
	 SrwE2Xbh6Fi/FInNlX5ismRjNkAY3zAvLX6lPNrYCNwKN9u2E2G7LVzQO7MQfU3LFx
	 20lBp+O15L+qQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C58F017E0E01;
	Tue,  1 Oct 2024 09:54:26 +0200 (CEST)
Message-ID: <b414e84d-0b1c-4ae9-8172-dfb33448a513@collabora.com>
Date: Tue, 1 Oct 2024 09:54:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: mediatek: drop two dead config options
To: Lukas Bulwahn <lbulwahn@redhat.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lukas Bulwahn <lukas.bulwahn@redhat.com>
References: <20240927092232.386511-1-lukas.bulwahn@redhat.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240927092232.386511-1-lukas.bulwahn@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_005429_125468_7374AA32 
X-CRM114-Status: UNSURE (   8.96  )
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

Il 27/09/24 11:22, Lukas Bulwahn ha scritto:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> 
> Commit 0f471d31e5e8 ("clk: mediatek: Split MT8195 clock drivers and allow
> module build") adds a number of new COMMON_CLK_MT8195_* config options.
> Among those, the config options COMMON_CLK_MT8195_AUDSYS and
> COMMON_CLK_MT8195_MSDC have no reference in the source tree and are not
> used in the Makefile to include a specific file.
> 
> Drop the dead config options COMMON_CLK_MT8195_AUDSYS and
> COMMON_CLK_MT8195_MSDC.
> 
> Fixes: 0f471d31e5e8 ("clk: mediatek: Split MT8195 clock drivers and allow module build")
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



