Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB16C5475B
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Mar 2024 09:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IROgtCRQZjEVVrhl9ilsgSTq/wOx+QKigkNDboOu9bo=; b=KUloGHy+KH4IdnfSBJlDbo+oI7
	NjO1H86rmRhOJTw7duM5h4WAieoiVfFO+GX843dT+6H8x06nIih0/rQ72SlJqQu8YiWxkqWp8BbPn
	NCVsmCmogAeOG/bzW5UVVz5D9huGUoYWcw7DHV0wVHhqulFHkqXYAztr5+0kR8TweGNMPlZxYez16
	PmyIqQ2qVVnPkb87J2mmhtXEQ1lhC/ou3GyLOwB+xfISEyotwtHuOeWXRRiFZgMWJ901jOR9wFVfD
	wbQok+4+itCC22ViT2mFYjIltkVqR9fImu4c7+97rKX8lkr9IKAcgpS5mm4lGcyYwyBiX21RmolYV
	X1ZqO8ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkhe8-0000000DmAE-1hfW;
	Thu, 14 Mar 2024 09:45:08 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkhe4-0000000Dm93-15TS;
	Thu, 14 Mar 2024 09:45:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710409501;
	bh=pVZnehC/cbZZicGajuwvH1Tlz6noVProoLGDfyrCVrw=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=fkUhM6GK0jvq0Q9XSZTW3dzp3W8UbHMTC7pIxcGG6MKPFbucGLAY3sMt7+1Wihfi5
	 RRQHko0vML9PtDPKRes+rMf0wXvmzqrQNYyHP40avy27aMP3alI4+hAEyLe/shtfx7
	 GJTqjmY75I08n/OrQgk7irkJ0tCGjTLsBi1OfR9EZtZM7PefrpdA8/mE5xWUJROLnQ
	 5TQDtOk9LCQCyIu3g2t6/qVhOmG0TBQmD1LGcd2ZnEpbnvdGX9w7LpLN6koSfCgtwO
	 EoWMy0xxgvuvO4VLfezr562BFlVcPLizsVeUSM/7/V0aoMbYabSPjCWZ1qhK9KTsmc
	 4yLHgrQDeKYAQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8516137820A3;
	Thu, 14 Mar 2024 09:45:00 +0000 (UTC)
Message-ID: <f0383126-99c4-4233-b222-597caacf43b9@collabora.com>
Date: Thu, 14 Mar 2024 10:44:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: mediatek: mt7988-infracfg: fix clocks for 2nd PCIe
 port
To: Daniel Golle <daniel@makrotopia.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sam Shih <sam.shih@mediatek.com>, Frank Wunderlich
 <frank-w@public-files.de>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <1da2506a51f970706bf4ec9509dd04e0471065e5.1710367453.git.daniel@makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <1da2506a51f970706bf4ec9509dd04e0471065e5.1710367453.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_024504_477524_D70181CF 
X-CRM114-Status: GOOD (  16.20  )
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

Il 13/03/24 23:05, Daniel Golle ha scritto:
> Due to what seems to be an undocumented oddity in MediaTek's MT7988
> SoC design the CLK_INFRA_PCIE_PERI_26M_CK_P2 clock requires
> CLK_INFRA_PCIE_PERI_26M_CK_P3 to be enabled.
> 
> This currently leads to PCIe port 2 not working in Linux.
> 
> Reflect the apparent relationship in the clk driver to make sure PCIe
> port 2 of the MT7988 SoC works.
> 
> Fixes: 4b4719437d85f ("clk: mediatek: add drivers for MT7988 SoC")
> Suggested-by: Sam Shih <sam.shih@mediatek.com>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

That's funny. Anyway:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/clk/mediatek/clk-mt7988-infracfg.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mt7988-infracfg.c b/drivers/clk/mediatek/clk-mt7988-infracfg.c
> index 449041f8abbc9..c8c023afe3e5a 100644
> --- a/drivers/clk/mediatek/clk-mt7988-infracfg.c
> +++ b/drivers/clk/mediatek/clk-mt7988-infracfg.c
> @@ -156,7 +156,7 @@ static const struct mtk_gate infra_clks[] = {
>   	GATE_INFRA0(CLK_INFRA_PCIE_PERI_26M_CK_P1, "infra_pcie_peri_ck_26m_ck_p1",
>   		    "csw_infra_f26m_sel", 8),
>   	GATE_INFRA0(CLK_INFRA_PCIE_PERI_26M_CK_P2, "infra_pcie_peri_ck_26m_ck_p2",
> -		    "csw_infra_f26m_sel", 9),
> +		    "infra_pcie_peri_ck_26m_ck_p3", 9),
>   	GATE_INFRA0(CLK_INFRA_PCIE_PERI_26M_CK_P3, "infra_pcie_peri_ck_26m_ck_p3",
>   		    "csw_infra_f26m_sel", 10),
>   	/* INFRA1 */


