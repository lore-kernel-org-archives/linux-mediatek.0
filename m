Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41399CA0ECF
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Sep 2023 11:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2i3I1X+4Fx86xDUOZC46T5gqNZBA/9GqlhFqUY2tgp0=; b=2Kl3oUSaHoD7i72PFtx+Q4ukW5
	UBDHmqDAdo1pcYgrTyAy8OKQcUp1j+zYHDjy0gIsLzDptGk1+zAJU0WdjKVaMsQbGKrGLppoAtRKm
	kQl0YbdiotvcFCuua4IGqxrVuMz3DTddN0CFKgVTa9DEwtQBU077U6ND532mt5/aDANvXqWDrGNEq
	haGGCD8lbm0//EyVx+1rR/DTFirBWZ6pI520x7oy7n+ZepTs3pWlml5FD8IjtcJowDxLiqkI3yrHK
	Qtg1kO1wai3J01AO6YfZgM9BYwyMZQldzUPLLT5acoO0C1YTXJRrfvHqMaicAKFpcbXPiipA15dDB
	shzw6dow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg1Mb-003BbP-0o;
	Tue, 12 Sep 2023 11:15:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg0EL-002qcp-1a;
	Tue, 12 Sep 2023 10:02:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=2i3I1X+4Fx86xDUOZC46T5gqNZBA/9GqlhFqUY2tgp0=; b=cK/jdG5XT7dNm3bX0xDwfeTlj0
	3YAHlWGnxCdSZrm6BXVbX97E/5OY6HLUhVGJ9aOKwZXFyZpBimna77gi9CJhKBurBKsRftqvAcxtu
	zbI1urVF47oJREnvDTxzapx85HoU5QeOm4ebsuq8w6U5hNwmhocK92e4EcKgI4u6qlE7Y0ZfmDUxd
	DtPKzxSrGk/TlezOhDExPh04jqaLAcwVbd2WFC80ZGDpad6itnOUPOjoDvn/bpQFZOw8tBCkLsMEo
	z/aRWcRbi1A+9jUKivapFR8ubY2quCFkBIONK51V+qC+mTlaUoQPvD3OhqMMM+p/6x8FVrUOw9E84
	5QTMpYqQ==;
Received: from madras.collabora.co.uk ([46.235.227.172])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg0EF-0060ze-2v;
	Tue, 12 Sep 2023 10:02:48 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CD253660731E;
	Tue, 12 Sep 2023 11:02:40 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694512961;
	bh=KFTpQC/A7VUsLib15J+EGZdvXTKuNhYXeMQivKrdSI4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MWjR5HVJefu2d4j7QZ0QOiJcsTAnJWDAsEhh96ZUoKmFmE85LCwH4TZiwnt328dGv
	 q3MAI7VoMfghswBvo4j8oz+XvpY1nRW1m5LQI3DKbo3iUSDyR2JR961AFoSWJE5sNs
	 +bQoFCHrGVvtNmcrwlfpPwZ40mT32rRu+yvNJWf+AoDK/0aOHrU2DklbjZIf19O42U
	 Tais/Ygi8W1NYC/qUPa/L/XGSzPSOUOfKIeOxSEy6mPA8uBq/6LptDEH9SY6tRhafY
	 It7g9YntFnTIAULfP29C9jywUuz0+LIvmayOhqjzxf96XWiKgixbI1xMJcOKFxCKWM
	 aDeo2JBarstdw==
Message-ID: <250a4a3a-cc70-7541-aa49-ec15b8d3e122@collabora.com>
Date: Tue, 12 Sep 2023 12:02:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 5/5] clk: mediatek: clk-mt7629: Add check for
 mtk_alloc_clk_data
Content-Language: en-US
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>, mturquette@baylibre.com,
 sboyd@kernel.org, matthias.bgg@gmail.com, wenst@chromium.org,
 msp@baylibre.com, amergnat@baylibre.com, frank.li@vivo.com, robh@kernel.org,
 owen.chen@mediatek.com, mars.cheng@mediatek.com, macpaul.lin@mediatek.com,
 cw00.choi@samsung.com, u.kleine-koenig@pengutronix.de,
 wendell.lin@mediatek.com, luca.ceresoli@bootlin.com,
 kevin-cw.chen@mediatek.com, ryder.lee@mediatek.com, wenzhen.yu@mediatek.com
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230912093407.21505-1-jiasheng@iscas.ac.cn>
 <20230912093407.21505-5-jiasheng@iscas.ac.cn>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230912093407.21505-5-jiasheng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_110245_606938_E2A7B7BD 
X-CRM114-Status: UNSURE (   8.71  )
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

Il 12/09/23 11:34, Jiasheng Jiang ha scritto:
> Add the check for the return value of mtk_alloc_clk_data() in order to
> avoid NULL pointer dereference.
> 
> Fixes: 3b5e748615e7 ("clk: mediatek: add clock support for MT7629 SoC")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



