Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B0F9C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jul 2022 10:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cYGi9iYw5xqenfsy1Wa7WBvwgsNozUXDBdKmrRILrm8=; b=ikkihy5XsZrDqvJ/eJF1SerxTU
	4SOx76pNwONfHS3uKs/JIlW9cVNN9NWIwiM/LIUoQN4FlWGFTZgkK5dKjVLsFENca49I/3gKZCePs
	Rj9ivWR2+luUWaf1r3MxawpTLEV3+gU7Oq2OBTHBScvkJxH0pwSAzV/+4Z0/aZX3NYApDlbBwALXN
	JtDXxYho7SsmlYZxNxHCdMvyW/K4v0pU0YRC91rNa7NtcCfYC74sH7bwOa+Ewhe4nhtSfSyu1l+eD
	0vCMG7Yf4LodeLW/obY3ol7B0DuYSaO75l0+LLHY9TXS57z1hm0fIOU/uQ4jIwPxWmV60RCNBmRID
	sIyT6xiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBDKp-009ygj-Ey; Tue, 12 Jul 2022 10:41:43 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBDKd-009yXX-RK; Tue, 12 Jul 2022 10:41:33 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C277266018EA;
	Tue, 12 Jul 2022 11:41:28 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1657622489;
	bh=aOj+sQx7dj4knkAMQNH+ntgBvPv44y7F0cbpMrBGyOY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Twxvmviw03FzYyIwPUIjYmNGsgHcFzfCylKPNIhAw8llGo2yt81ZhUL4y4uXfXK/v
	 7F5hSOQrEkVvtNO8pV3d0GPii9cMDONdLIzhlAlQz6/IeFgzNgAbIjlPYYsKNI++NK
	 hvdpMTatwHDSnQ7xmlPd25Rw9yBnVzpyTI/j+3xe485hJzwzepGW45nxha25j20jv8
	 mBhOcdC881hmSsFdiUeQh+xq9clXltl6aMhMP0+11MX+2terDAL5K2t6SqMQ36G8wH
	 MHbS4TRHvDWu5sgFS80STUVEtN28Ndz6c/zU9M5ebE+wKoWL7e5iXzkF79WzWc5xNL
	 L3qovPPeDUSbA==
Message-ID: <79a79313-00e0-632f-f238-95686362675e@collabora.com>
Date: Tue, 12 Jul 2022 12:41:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] clk: mediatek: Don't check HW status for mt8192/5's
 imp_iic_wrap clocks
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: kernel@collabora.com, Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, Ikjoon Jang <ikjn@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Miles Chen <miles.chen@mediatek.com>, Ran Jianping
 <ran.jianping@zte.com.cn>, Weiyi Lu <weiyi.lu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220711205733.203963-1-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220711205733.203963-1-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_034132_039161_52BF66E2 
X-CRM114-Status: GOOD (  12.91  )
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

Il 11/07/22 22:57, Nícolas F. R. A. Prado ha scritto:
> The imp_iic_wrap clocks on mt8192/mt8195 require that the i2c_sel parent
> clock be enabled before their hardware status can be checked. Since this
> wasn't taken into account, reading from the clk_summary debugfs file
> would cause the system to completely freeze.
> 
> Assuming that this clock is managed only by the kernel, and not by any
> firmware, simply drop the is_enabled() optional callback and instead
> rely on the enable count for the imp_iic_wrap clocks.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

For both MT8192 and MT8195:

Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
> 
>   drivers/clk/mediatek/clk-gate.c                | 6 ++++++
>   drivers/clk/mediatek/clk-gate.h                | 1 +
>   drivers/clk/mediatek/clk-mt8192-imp_iic_wrap.c | 2 +-
>   drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c | 2 +-
>   4 files changed, 9 insertions(+), 2 deletions(-)
> 

