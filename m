Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E47C54E58
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Mar 2024 14:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qSUN/6WVtfVy/Kq8UYs/JqShZLNoJqIVArhuQ0fSUyE=; b=ARkYqyDOyGhfKRjCAqNxgnZFvR
	TwQSn56qswSBtmVxcEgM5OtSkQH5Odw55nnhAmpmODDXJVzqvqKOZsRDH6iLcpALhikGUkKZjMhPL
	Rf28MBOFDi28M6Mgt7AnE5EKPaf8XU0HLpAd+9xJlDoKikNoCLVVMsC1eP3phPFk2tt0aqfQKS+rL
	gjNcwNL9U09RTDV24T6sUA92tEyzk+HGqc80nMIZq9E5oyEtQsTFCWj188OQ0AJ3fiv1gDvj4Cx+U
	sv7LG9RVX1S2vtLGcjebyGyqDdYR4Z6vA6lx2QJp5C4RUgopCyt2q1YZ3CVthktXySI+musQRewv5
	wPJMb8gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk3KH-00000006AzV-3aN1;
	Tue, 12 Mar 2024 14:41:58 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk3KA-00000006Aug-0mbU;
	Tue, 12 Mar 2024 14:41:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710254507;
	bh=pssySadyO3WsLSXVvrg+qLF0LevwN7Bf/tVt4wuz7w4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=foMmiKTU8hq/wbrY693jOUcmZy2mKImlR2N3aYjOVMhGPspKUfLIDCIP6zdTI6VAw
	 oLisdD2XTMJzC9dEJBaqkdhXf30Odio1FfAEoFs9fU7SHsuq9GZ6ZI8JVvqUUUqXE0
	 nrwju0vt0fF0JyVggj55KoiwNKy/Ox3Rg0e6LyzRGU+9GGYqqbUOck8jwVOkIoY4Gz
	 LXbQCy40+2P7SO6scg4aDFnjnHrQAdIar5cUfVTnZwqYVdmQZGlt91nWHJ2qbhYHbX
	 cC6ZwaabYKDsh7B0P7Sv7C9vRwH3ODIl0tjARMnfc3jsoUQTUYSeZQcLKQY6yeq6zB
	 teTsUmm3lYdtA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0E61637811D4;
	Tue, 12 Mar 2024 14:41:47 +0000 (UTC)
Message-ID: <3ec20339-b176-4d39-8cbe-4577a782aeec@collabora.com>
Date: Tue, 12 Mar 2024 15:41:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] clk: mediatek: Do a runtime PM get on controllers
 during probe
Content-Language: en-US
To: Pin-yen Lin <treapking@chromium.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Weiyi Lu <weiyi.lu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Bosi Zhang <u201911157@hust.edu.cn>, Nicolas Boichat
 <drinkcat@chromium.org>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>
References: <20240312115249.3341654-1-treapking@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240312115249.3341654-1-treapking@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_074150_558516_899B7496 
X-CRM114-Status: UNSURE (   9.40  )
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

Il 12/03/24 12:51, Pin-yen Lin ha scritto:
> mt8183-mfgcfg has a mutual dependency with genpd during the probing
> stage, which leads to a deadlock in the following call stack:
> 
> CPU0:  genpd_lock --> clk_prepare_lock
> genpd_power_off_work_fn()
>   genpd_lock()
>   generic_pm_domain::power_off()
>      clk_unprepare()
>        clk_prepare_lock()
> 
> CPU1: clk_prepare_lock --> genpd_lock
> clk_register()
>    __clk_core_init()
>      clk_prepare_lock()
>      clk_pm_runtime_get()
>        genpd_lock()
> 
> Do a runtime PM get at the probe function to make sure clk_register()
> won't acquire the genpd lock. Instead of only modifying mt8183-mfgcfg,
> do this on all mediatek clock controller probings because we don't
> believe this would cause any regression.
> 
> Verified on MT8183 and MT8192 Chromebooks.
> 
> Fixes: acddfc2c261b ("clk: mediatek: Add MT8183 clock support")
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> 

MT8195 Cherry Tomato - no issues as well.

Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


