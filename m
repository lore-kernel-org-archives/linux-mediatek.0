Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 053B7CCFA18
	for <linux-mediatek@archiver.kernel.org>; Sat,  8 Nov 2025 10:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=egnipsgAXduQhGzUMe8dVTjgx5O3qlE4/hDKTGYwMoE=; b=3uXYfd555i9MLbkmdDQo8Kt/Dc
	VzBsF1dz5yRn2vrbdhyMibHY+m2QOVInaUwzKQz18VMbD8NT3nm79QUufw1nZz+/IjztfxG7Uovw2
	MoPLNShvFs6a1fVskadZLR2rc8szrc1rxs7OzdX3JDE26rmWHirZzCLL5mGjSeu9+3yJxi4sYqkYh
	H+EzJXdG0eu/uJipKJ5NuXMU8lO1/wSqdTUP5pBKmZ48WmarITpddFmUtm28QOFnCZlES4WrI1ODx
	zVzdYsT1AyhTV9Q3nwTIZf5/N9DEWKcb4mNHUxSwWVqrve7dqEc74G8xX0CxbHaNRwIa9WwOhdvwB
	ALRHOuiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHgZE-000000032UE-31Qe;
	Sat, 08 Nov 2025 10:53:12 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHgZA-000000032T5-471N;
	Sat, 08 Nov 2025 10:53:10 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1vHgYw-000000008Kw-0aJw;
	Sat, 08 Nov 2025 10:52:54 +0000
Date: Sat, 8 Nov 2025 10:52:16 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [PATCH] clk: mediatek: mt7988-infracfg: fix USB port0 function
 for U2 only
Message-ID: <aQ8g4HM5XwlYim--@makrotopia.org>
References: <20251108090726.7787-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251108090726.7787-1-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_025309_039513_23010BAE 
X-CRM114-Status: GOOD (  18.87  )
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
Cc: Stephen Boyd <sboyd@kernel.org>, Sam Shih <sam.shih@mediatek.com>, Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Nov 08, 2025 at 10:07:25AM +0100, Frank Wunderlich wrote:
> From: Sam Shih <sam.shih@mediatek.com>
> 
> Fix the functionality of USB port0 U2 when U2 is enabled without U3.
> This change addresses the issue where port0 U3 is shared with PCIE2,
> ensuring that the port0 U2 function operates correctly without U3 support.
> 
> Additionally, add support to enable the U2 function instead of disabling
> the entire USB port0 in the configuration for the 4 PCIe case. This
> change ensures that U2 functionality is properly activated.
> 
> Fixes: 4b4719437d85 ("clk: mediatek: add drivers for MT7988 SoC")
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  drivers/clk/mediatek/clk-mt7988-infracfg.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mt7988-infracfg.c b/drivers/clk/mediatek/clk-mt7988-infracfg.c
> index ef8267319d91..da4ad365e30f 100644
> --- a/drivers/clk/mediatek/clk-mt7988-infracfg.c
> +++ b/drivers/clk/mediatek/clk-mt7988-infracfg.c
> @@ -229,8 +229,9 @@ static const struct mtk_gate infra_clks[] = {
>  			  CLK_IS_CRITICAL),
>  	GATE_INFRA3_FLAGS(CLK_INFRA_USB_FRMCNT_CK_P1, "infra_usb_frmcnt_ck_p1", "usb_frmcnt_p1_sel",
>  			  9, CLK_IS_CRITICAL),
> -	GATE_INFRA3(CLK_INFRA_USB_PIPE, "infra_usb_pipe", "sspxtp_sel", 10),
> -	GATE_INFRA3(CLK_INFRA_USB_PIPE_CK_P1, "infra_usb_pipe_ck_p1", "usb_phy_sel", 11),
> +	GATE_INFRA3_FLAGS(CLK_INFRA_USB_PIPE, "infra_usb_pipe", "sspxtp_sel", 10, CLK_IS_CRITICAL),
> +	GATE_INFRA3_FLAGS(CLK_INFRA_USB_PIPE_CK_P1, "infra_usb_pipe_ck_p1", "usb_phy_sel", 11,
> +			  CLK_IS_CRITICAL),

I don't agree that those two clocks are critical. There are boards using
MT7988 which don't even come with USB at all.
Instead of marking the clock as criticl, the dependency of the USB host on
them should be expressed properly.

