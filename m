Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80988C6FA90
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Sep 2022 10:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tylWLkn8cEpz5yyhmenLBIBVRXqgejM6us2T7u4U+JA=; b=fbz5MLzjo9Upsh1BLWy73xAuoM
	0z0eohuja5yo2aOiPw28VqlP7ZN1DBR+qaqVcqfbpPAvcXCuWXeaEISqfsH9e/EcMk6r9xA83IzJQ
	2/zrGPVRqt1WhtfRrQ13/2TsG2viCcaYS/489/6C2ar4/P23lBX6n+O9Zr7GPYwUYYTzF00McVCSx
	fkC2i3vab5y8D7277AltXaJmMwX0CCdedhh+9MoHq7bjm5oPLNMt2bsA4rcUbkC51OvzGKPHc2V98
	bkFSzqwwi4MJrCXrIglzvVo6k7N9WXkZQn7WuelaC6K0eWVg+92t8xZhd0euorU++SNKWU8qWNgip
	ZlHgpqSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od80K-009trg-In; Tue, 27 Sep 2022 10:39:56 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od808-009tmC-7K; Tue, 27 Sep 2022 10:39:46 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 36E09660225F;
	Tue, 27 Sep 2022 11:39:42 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664275182;
	bh=AMgtIGTha2E70GrYjihLiNaIG3QRYRtKKBHoiKsZNjc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=L/0uEDggcWvhuV/c3BtHlYYGr0kpKy2WLah/QOfc1/HqQZlmdWM2W7x+Z9IPUOIEM
	 AnZVGclmmYDXp7MNGGtEedys50vhtPUAkePCt3BDSLlKLigRE56vChVqHYaLxvz4/x
	 6fEZB3yn9M3hWQ+JK2cAhXXuiA5B8+fbar8YYZiQODpkIPh+l2AWL8kEfXrelmqCxJ
	 2gS8TS6h1w5uBYjNy+XzeuimPgHxzUr5w7GSfl0sUTJRkwNRvUgOH3BOpuQJVQFKOs
	 ZkKgetUFPuZUR+bI8XMvxCC77jJHjU+EE0EyL7gxre/i+916dxmv/J0i9uubnLIGam
	 GfSlTlrZfWN5Q==
Message-ID: <70c9375e-52f8-40a6-3fea-ba95fae16c99@collabora.com>
Date: Tue, 27 Sep 2022 12:39:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 6/6] clk: mediatek: mt8192: Implement error handling in
 probe functions
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220926102523.2367530-1-wenst@chromium.org>
 <20220926102523.2367530-7-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220926102523.2367530-7-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_033944_432604_7EBFBAC8 
X-CRM114-Status: GOOD (  11.72  )
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
> This is similar to commit f3e690b00b86 ("clk: mediatek: mt8195:
> Implement error handling in probe functions").
> 
> Until now the mediatek clk driver library did not have any way to
> unregister clks, and so all drivers did not do proper cleanup in
> their error paths.
> 
> Now that the library does have APIs to unregister clks, use them
> in the error path of the probe functions for the mt8192 clk drivers
> to do proper cleanup.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

I can't give you my Reviewed-by on this patch only because of the comment
in patch [3/6] - anyway, LGTM.

Regards,
Angelo


