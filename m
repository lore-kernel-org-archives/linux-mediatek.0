Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B1BC54EE9
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Sep 2022 10:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rnm7Y6wDpOx8hw+l4qw3fUM46dFJUYcImTKwvrXtmpc=; b=VguHr+J+ssbDi9NQ1JBuOaIqGP
	OoaGVGXZlgh6Q5/RlVkZ1lHSQOJ+Ks44KYj0mku5j9GvYTPzP1TkV7o9aEdO94QawObMxPoOBDDTd
	y6nF5pdsz710CQpuUCexFqosBjArLDiuZtA5+hcaq1ECOAlnshWz9OPZlAL6LwQPxaVIF1+aU+dnc
	edOBjHKc1yccQadJonCLHuALRBdLZTlY7Rt+h4QK2i7evmCGTrQP6IKQOAkTXlvGg0+U+VV9SibZU
	BhkRhyMwsUMERIOYIT+19GYz33RmEFT42B56jaZbSmQ4X34+Mj/ZT81UGyZtWeXiUavVicifYy5Mv
	nUrRkj/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od80W-009tzd-OI; Tue, 27 Sep 2022 10:40:08 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od80A-009tml-68; Tue, 27 Sep 2022 10:39:47 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3A8096602265;
	Tue, 27 Sep 2022 11:39:44 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664275184;
	bh=1Dj0DOUe9P54HMVaAc5tPkN254QBec4iUGXzuL+bCxg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Biuo7sl+wBZmjb1oyqzxOCK0C0Pk2ynpF3tFZPWRFJ3WmQ1n2HNwjr5yKu+m4QGD1
	 VgAwD0tZtvJTjRxmzYdAairbmcEhV/NpXoJqHsHKOz5+Az2Guk7a/G0K/b18PFH0HA
	 w+z3EETj9qhXmsW5B9TO6NrgJGMDLJndPkFS7sq0/ftIl/8eYcb/2fazWunMqy4Sj7
	 r4WINcjClC9N8/LkiSLjKm416vGNIXWvwy8dhNY9xJPWuU1ReL7lI5hkKi+RJTBRJ5
	 t5nAnsq/TS86xYvFoBnddk0+L+TSgo8d69R1tyIZOagXQ2Xyu+ikiVYP1VKJ2LcskG
	 NRaDJWVnjVcNw==
Message-ID: <0a1618c4-b808-56bd-e89f-560b0423191d@collabora.com>
Date: Tue, 27 Sep 2022 12:39:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 3/6] clk: mediatek: mt8192: Do not re-register
 top_early_divs in probe function
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220926102523.2367530-1-wenst@chromium.org>
 <20220926102523.2367530-4-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220926102523.2367530-4-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_033946_388095_07CDADAB 
X-CRM114-Status: GOOD (  11.69  )
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

Il 26/09/22 12:25, Chen-Yu Tsai ha scritto:
> top_early_divs are registered in the CLK_OF_DECLARE_DRIVER() half of the
> topckgen clk driver. Don't try to register it again in the actual probe
> function. This gets rid of the "Trying to register duplicate clock ..."
> warning.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Can't we simply remove the CLK_OF_DECLARE_DRIVER() and top_init_early entirely,
and transfer TOP_CSW_F26M_D2 to top_divs[] instead?
I get that systimer concern and we have something similar in MT8195, where the
TOP_CLK26M_D2 is registered "late".

Getting back to MT8192, TOP_CSW_F26M_D2 seems to be used only for:
1. systimer
2. SPMI MST (registered "late").

Being it a fixed factor clock, parented to another fixed clock, it doesn't
even have any ON/OFF switch, so I think it would be actually possible to go
for the proposed removal... which would further improve this cleanup.

Regards,
Angelo



