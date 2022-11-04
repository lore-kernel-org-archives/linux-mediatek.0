Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40CA9C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Nov 2022 11:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ETaWNyAkngU+esXJsSfmSq1Ki+gnO8R0Onn2lbQ1Anc=; b=H2mBkQ3jKn3nb2O0+CE1p8wmr8
	nKUiDfx4Advs75zt3XjBwDEFjh3iG+wXfVe0OMtyHMj64FQgTukcAmDE3do0nhPq4vFXKYDvwlEOp
	DB3XKa+Eh08xHIx2JsfTueGBpnRdOT21sLYX28Ci1s//eN6LpvOFWsx/vSaqw4MHJSX4LSCkJk27C
	wU2Oo24GXlKPVEVAu6E3BGjYlMxnZGemiClAA5LiUNDq1gEdAxUI3IYma9/tg5zQdZ9d6OMdWhnga
	GUxLEzKshAr9UNs7XP3TZKBfdbzdrovrNtwVQV12IwicLqjoGXNvCFBQKxgdhiArRrolcqfVHgLZy
	bCZo5Kpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqvHB-003PJE-2H; Fri, 04 Nov 2022 11:54:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqvH7-003PIc-1m
	for linux-mediatek@lists.infradead.org; Fri, 04 Nov 2022 11:54:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5EFBC62154;
	Fri,  4 Nov 2022 11:54:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A79BC433D6;
	Fri,  4 Nov 2022 11:54:13 +0000 (UTC)
Message-ID: <0c815bd9-2d51-8153-3cee-0f195b76debd@xs4all.nl>
Date: Fri, 4 Nov 2022 12:54:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v1 1/2] media: platform: mtk-mdp3: extend mdp_color format
 for compressed mode
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20221007092230.11893-1-moudy.ho@mediatek.com>
 <20221007092230.11893-2-moudy.ho@mediatek.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20221007092230.11893-2-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_045417_226663_34D92D33 
X-CRM114-Status: GOOD (  16.09  )
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

On 07/10/2022 11:22, Moudy Ho wrote:
> Due to future support for hardware compression formats, the MDP3
> internal color format expression needs to be extended.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>  .../platform/mediatek/mdp3/mtk-mdp3-regs.h    | 193 +++++++++---------
>  1 file changed, 97 insertions(+), 96 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-regs.h b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-regs.h
> index 1a26c1bcfd8d..439f72dc1ff5 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-regs.h
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-regs.h
> @@ -18,11 +18,12 @@
>   * V-subsample: 0, 1
>   * Color group: 0-RGB, 1-YUV, 2-raw
>   */
> -#define MDP_COLOR(PACKED, LOOSE, VIDEO, PLANE, HF, VF, BITS, GROUP, SWAP, ID)\
> -	(((PACKED) << 27) | ((LOOSE) << 26) | ((VIDEO) << 23) |\
> +#define MDP_COLOR(COMPRESS, PACKED, LOOSE, VIDEO, PLANE, HF, VF, BITS, GROUP, SWAP, ID)\
> +	(((COMPRESS) << 29) | ((PACKED) << 28) | ((LOOSE) << 27) | ((VIDEO) << 23) |\
>  	 ((PLANE) << 21) | ((HF) << 19) | ((VF) << 18) | ((BITS) << 8) |\
>  	 ((GROUP) << 6) | ((SWAP) << 5) | ((ID) << 0))
>  
> +#define MDP_COLOR_IS_COMPRESS(c)        ((0x20000000 & (c)) >> 29)
>  #define MDP_COLOR_IS_10BIT_PACKED(c)	((0x08000000 & (c)) >> 27)
>  #define MDP_COLOR_IS_10BIT_LOOSE(c)	(((0x0c000000 & (c)) >> 26) == 1)
>  #define MDP_COLOR_IS_10BIT_TILE(c)	(((0x0c000000 & (c)) >> 26) == 3)
> @@ -45,143 +46,143 @@ enum mdp_color {
>  	MDP_COLOR_UNKNOWN	= 0,
>  
>  	//MDP_COLOR_FULLG8,
> -	MDP_COLOR_FULLG8_RGGB	= MDP_COLOR(0, 0, 0, 1, 0, 0,  8, 2,  0, 21),
> -	MDP_COLOR_FULLG8_GRBG	= MDP_COLOR(0, 0, 0, 1, 0, 1,  8, 2,  0, 21),
> -	MDP_COLOR_FULLG8_GBRG	= MDP_COLOR(0, 0, 0, 1, 1, 0,  8, 2,  0, 21),
> -	MDP_COLOR_FULLG8_BGGR	= MDP_COLOR(0, 0, 0, 1, 1, 1,  8, 2,  0, 21),
> +	MDP_COLOR_FULLG8_RGGB	= MDP_COLOR(0, 0, 0, 0, 1, 0, 0,  8, 2,  0, 21),
> +	MDP_COLOR_FULLG8_GRBG	= MDP_COLOR(0, 0, 0, 0, 1, 0, 1,  8, 2,  0, 21),
> +	MDP_COLOR_FULLG8_GBRG	= MDP_COLOR(0, 0, 0, 0, 1, 1, 0,  8, 2,  0, 21),
> +	MDP_COLOR_FULLG8_BGGR	= MDP_COLOR(0, 0, 0, 0, 1, 1, 1,  8, 2,  0, 21),
>  	MDP_COLOR_FULLG8	= MDP_COLOR_FULLG8_BGGR,
>  
>  	//MDP_COLOR_FULLG10,
> -	MDP_COLOR_FULLG10_RGGB	= MDP_COLOR(0, 0, 0, 1, 0, 0, 10, 2,  0, 21),
> -	MDP_COLOR_FULLG10_GRBG	= MDP_COLOR(0, 0, 0, 1, 0, 1, 10, 2,  0, 21),
> -	MDP_COLOR_FULLG10_GBRG	= MDP_COLOR(0, 0, 0, 1, 1, 0, 10, 2,  0, 21),
> -	MDP_COLOR_FULLG10_BGGR	= MDP_COLOR(0, 0, 0, 1, 1, 1, 10, 2,  0, 21),
> +	MDP_COLOR_FULLG10_RGGB	= MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 10, 2,  0, 21),
> +	MDP_COLOR_FULLG10_GRBG	= MDP_COLOR(0, 0, 0, 0, 1, 0, 1, 10, 2,  0, 21),
> +	MDP_COLOR_FULLG10_GBRG	= MDP_COLOR(0, 0, 0, 0, 1, 1, 0, 10, 2,  0, 21),
> +	MDP_COLOR_FULLG10_BGGR	= MDP_COLOR(0, 0, 0, 0, 1, 1, 1, 10, 2,  0, 21),
>  	MDP_COLOR_FULLG10	= MDP_COLOR_FULLG10_BGGR,
>  
>  	//MDP_COLOR_FULLG12,
> -	MDP_COLOR_FULLG12_RGGB	= MDP_COLOR(0, 0, 0, 1, 0, 0, 12, 2,  0, 21),
> -	MDP_COLOR_FULLG12_GRBG	= MDP_COLOR(0, 0, 0, 1, 0, 1, 12, 2,  0, 21),
> -	MDP_COLOR_FULLG12_GBRG	= MDP_COLOR(0, 0, 0, 1, 1, 0, 12, 2,  0, 21),
> -	MDP_COLOR_FULLG12_BGGR	= MDP_COLOR(0, 0, 0, 1, 1, 1, 12, 2,  0, 21),
> +	MDP_COLOR_FULLG12_RGGB	= MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 12, 2,  0, 21),
> +	MDP_COLOR_FULLG12_GRBG	= MDP_COLOR(0, 0, 0, 0, 1, 0, 1, 12, 2,  0, 21),
> +	MDP_COLOR_FULLG12_GBRG	= MDP_COLOR(0, 0, 0, 0, 1, 1, 0, 12, 2,  0, 21),
> +	MDP_COLOR_FULLG12_BGGR	= MDP_COLOR(0, 0, 0, 0, 1, 1, 1, 12, 2,  0, 21),
>  	MDP_COLOR_FULLG12	= MDP_COLOR_FULLG12_BGGR,
>  
>  	//MDP_COLOR_FULLG14,
> -	MDP_COLOR_FULLG14_RGGB	= MDP_COLOR(0, 0, 0, 1, 0, 0, 14, 2,  0, 21),
> -	MDP_COLOR_FULLG14_GRBG	= MDP_COLOR(0, 0, 0, 1, 0, 1, 14, 2,  0, 21),
> -	MDP_COLOR_FULLG14_GBRG	= MDP_COLOR(0, 0, 0, 1, 1, 0, 14, 2,  0, 21),
> -	MDP_COLOR_FULLG14_BGGR	= MDP_COLOR(0, 0, 0, 1, 1, 1, 14, 2,  0, 21),
> +	MDP_COLOR_FULLG14_RGGB	= MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 14, 2,  0, 21),
> +	MDP_COLOR_FULLG14_GRBG	= MDP_COLOR(0, 0, 0, 0, 1, 0, 1, 14, 2,  0, 21),
> +	MDP_COLOR_FULLG14_GBRG	= MDP_COLOR(0, 0, 0, 0, 1, 1, 0, 14, 2,  0, 21),
> +	MDP_COLOR_FULLG14_BGGR	= MDP_COLOR(0, 0, 0, 0, 1, 1, 1, 14, 2,  0, 21),
>  	MDP_COLOR_FULLG14	= MDP_COLOR_FULLG14_BGGR,
>  
> -	MDP_COLOR_UFO10		= MDP_COLOR(0, 0, 0, 1, 0, 0, 10, 2,  0, 24),
> +	MDP_COLOR_UFO10		= MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 10, 2,  0, 24),
>  
>  	//MDP_COLOR_BAYER8,
> -	MDP_COLOR_BAYER8_RGGB	= MDP_COLOR(0, 0, 0, 1, 0, 0,  8, 2,  0, 20),
> -	MDP_COLOR_BAYER8_GRBG	= MDP_COLOR(0, 0, 0, 1, 0, 1,  8, 2,  0, 20),
> -	MDP_COLOR_BAYER8_GBRG	= MDP_COLOR(0, 0, 0, 1, 1, 0,  8, 2,  0, 20),
> -	MDP_COLOR_BAYER8_BGGR	= MDP_COLOR(0, 0, 0, 1, 1, 1,  8, 2,  0, 20),
> +	MDP_COLOR_BAYER8_RGGB	= MDP_COLOR(0, 0, 0, 0, 1, 0, 0,  8, 2,  0, 20),
> +	MDP_COLOR_BAYER8_GRBG	= MDP_COLOR(0, 0, 0, 0, 1, 0, 1,  8, 2,  0, 20),
> +	MDP_COLOR_BAYER8_GBRG	= MDP_COLOR(0, 0, 0, 0, 1, 1, 0,  8, 2,  0, 20),
> +	MDP_COLOR_BAYER8_BGGR	= MDP_COLOR(0, 0, 0, 0, 1, 1, 1,  8, 2,  0, 20),
>  	MDP_COLOR_BAYER8	= MDP_COLOR_BAYER8_BGGR,
>  
>  	//MDP_COLOR_BAYER10,
> -	MDP_COLOR_BAYER10_RGGB	= MDP_COLOR(0, 0, 0, 1, 0, 0, 10, 2,  0, 20),
> -	MDP_COLOR_BAYER10_GRBG	= MDP_COLOR(0, 0, 0, 1, 0, 1, 10, 2,  0, 20),
> -	MDP_COLOR_BAYER10_GBRG	= MDP_COLOR(0, 0, 0, 1, 1, 0, 10, 2,  0, 20),
> -	MDP_COLOR_BAYER10_BGGR	= MDP_COLOR(0, 0, 0, 1, 1, 1, 10, 2,  0, 20),
> +	MDP_COLOR_BAYER10_RGGB	= MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 10, 2,  0, 20),
> +	MDP_COLOR_BAYER10_GRBG	= MDP_COLOR(0, 0, 0, 0, 1, 0, 1, 10, 2,  0, 20),
> +	MDP_COLOR_BAYER10_GBRG	= MDP_COLOR(0, 0, 0, 0, 1, 1, 0, 10, 2,  0, 20),
> +	MDP_COLOR_BAYER10_BGGR	= MDP_COLOR(0, 0, 0, 0, 1, 1, 1, 10, 2,  0, 20),
>  	MDP_COLOR_BAYER10	= MDP_COLOR_BAYER10_BGGR,
>  
>  	//MDP_COLOR_BAYER12,
> -	MDP_COLOR_BAYER12_RGGB	= MDP_COLOR(0, 0, 0, 1, 0, 0, 12, 2,  0, 20),
> -	MDP_COLOR_BAYER12_GRBG	= MDP_COLOR(0, 0, 0, 1, 0, 1, 12, 2,  0, 20),
> -	MDP_COLOR_BAYER12_GBRG	= MDP_COLOR(0, 0, 0, 1, 1, 0, 12, 2,  0, 20),
> -	MDP_COLOR_BAYER12_BGGR	= MDP_COLOR(0, 0, 0, 1, 1, 1, 12, 2,  0, 20),
> +	MDP_COLOR_BAYER12_RGGB	= MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 12, 2,  0, 20),
> +	MDP_COLOR_BAYER12_GRBG	= MDP_COLOR(0, 0, 0, 0, 1, 0, 1, 12, 2,  0, 20),
> +	MDP_COLOR_BAYER12_GBRG	= MDP_COLOR(0, 0, 0, 0, 1, 1, 0, 12, 2,  0, 20),
> +	MDP_COLOR_BAYER12_BGGR	= MDP_COLOR(0, 0, 0, 0, 1, 1, 1, 12, 2,  0, 20),
>  	MDP_COLOR_BAYER12	= MDP_COLOR_BAYER12_BGGR,
>  
>  	//MDP_COLOR_BAYER14,
> -	MDP_COLOR_BAYER14_RGGB	= MDP_COLOR(0, 0, 0, 1, 0, 0, 14, 2,  0, 20),
> -	MDP_COLOR_BAYER14_GRBG	= MDP_COLOR(0, 0, 0, 1, 0, 1, 14, 2,  0, 20),
> -	MDP_COLOR_BAYER14_GBRG	= MDP_COLOR(0, 0, 0, 1, 1, 0, 14, 2,  0, 20),
> -	MDP_COLOR_BAYER14_BGGR	= MDP_COLOR(0, 0, 0, 1, 1, 1, 14, 2,  0, 20),
> +	MDP_COLOR_BAYER14_RGGB	= MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 14, 2,  0, 20),
> +	MDP_COLOR_BAYER14_GRBG	= MDP_COLOR(0, 0, 0, 0, 1, 0, 1, 14, 2,  0, 20),
> +	MDP_COLOR_BAYER14_GBRG	= MDP_COLOR(0, 0, 0, 0, 1, 1, 0, 14, 2,  0, 20),
> +	MDP_COLOR_BAYER14_BGGR	= MDP_COLOR(0, 0, 0, 0, 1, 1, 1, 14, 2,  0, 20),
>  	MDP_COLOR_BAYER14	= MDP_COLOR_BAYER14_BGGR,
>  
> -	MDP_COLOR_RGB48		= MDP_COLOR(0, 0, 0, 1, 0, 0, 48, 0,  0, 23),
> +	MDP_COLOR_RGB48		= MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 48, 0,  0, 23),
>  	/* For bayer+mono raw-16 */
> -	MDP_COLOR_RGB565_RAW	= MDP_COLOR(0, 0, 0, 1, 0, 0, 16, 2,  0, 0),
> -
> -	MDP_COLOR_BAYER8_UNPAK	= MDP_COLOR(0, 0, 0, 1, 0, 0,  8, 2,  0, 22),
> -	MDP_COLOR_BAYER10_UNPAK	= MDP_COLOR(0, 0, 0, 1, 0, 0, 10, 2,  0, 22),
> -	MDP_COLOR_BAYER12_UNPAK	= MDP_COLOR(0, 0, 0, 1, 0, 0, 12, 2,  0, 22),
> -	MDP_COLOR_BAYER14_UNPAK	= MDP_COLOR(0, 0, 0, 1, 0, 0, 14, 2,  0, 22),
> -
> -	/* Unified formats */
> -	MDP_COLOR_GREY		= MDP_COLOR(0, 0, 0, 1, 0, 0,  8, 1,  0, 7),
> -
> -	MDP_COLOR_RGB565	= MDP_COLOR(0, 0, 0, 1, 0, 0, 16, 0,  0, 0),
> -	MDP_COLOR_BGR565	= MDP_COLOR(0, 0, 0, 1, 0, 0, 16, 0,  1, 0),
> -	MDP_COLOR_RGB888	= MDP_COLOR(0, 0, 0, 1, 0, 0, 24, 0,  1, 1),
> -	MDP_COLOR_BGR888	= MDP_COLOR(0, 0, 0, 1, 0, 0, 24, 0,  0, 1),
> -	MDP_COLOR_RGBA8888	= MDP_COLOR(0, 0, 0, 1, 0, 0, 32, 0,  1, 2),
> -	MDP_COLOR_BGRA8888	= MDP_COLOR(0, 0, 0, 1, 0, 0, 32, 0,  0, 2),
> -	MDP_COLOR_ARGB8888	= MDP_COLOR(0, 0, 0, 1, 0, 0, 32, 0,  1, 3),
> -	MDP_COLOR_ABGR8888	= MDP_COLOR(0, 0, 0, 1, 0, 0, 32, 0,  0, 3),
> -
> -	MDP_COLOR_UYVY		= MDP_COLOR(0, 0, 0, 1, 1, 0, 16, 1,  0, 4),
> -	MDP_COLOR_VYUY		= MDP_COLOR(0, 0, 0, 1, 1, 0, 16, 1,  1, 4),
> -	MDP_COLOR_YUYV		= MDP_COLOR(0, 0, 0, 1, 1, 0, 16, 1,  0, 5),
> -	MDP_COLOR_YVYU		= MDP_COLOR(0, 0, 0, 1, 1, 0, 16, 1,  1, 5),
> -
> -	MDP_COLOR_I420		= MDP_COLOR(0, 0, 0, 3, 1, 1,  8, 1,  0, 8),
> -	MDP_COLOR_YV12		= MDP_COLOR(0, 0, 0, 3, 1, 1,  8, 1,  1, 8),
> -	MDP_COLOR_I422		= MDP_COLOR(0, 0, 0, 3, 1, 0,  8, 1,  0, 9),
> -	MDP_COLOR_YV16		= MDP_COLOR(0, 0, 0, 3, 1, 0,  8, 1,  1, 9),
> -	MDP_COLOR_I444		= MDP_COLOR(0, 0, 0, 3, 0, 0,  8, 1,  0, 10),
> -	MDP_COLOR_YV24		= MDP_COLOR(0, 0, 0, 3, 0, 0,  8, 1,  1, 10),
> -
> -	MDP_COLOR_NV12		= MDP_COLOR(0, 0, 0, 2, 1, 1,  8, 1,  0, 12),
> -	MDP_COLOR_NV21		= MDP_COLOR(0, 0, 0, 2, 1, 1,  8, 1,  1, 12),
> -	MDP_COLOR_NV16		= MDP_COLOR(0, 0, 0, 2, 1, 0,  8, 1,  0, 13),
> -	MDP_COLOR_NV61		= MDP_COLOR(0, 0, 0, 2, 1, 0,  8, 1,  1, 13),
> -	MDP_COLOR_NV24		= MDP_COLOR(0, 0, 0, 2, 0, 0,  8, 1,  0, 14),
> -	MDP_COLOR_NV42		= MDP_COLOR(0, 0, 0, 2, 0, 0,  8, 1,  1, 14),
> +	MDP_COLOR_RGB565_RAW	= MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 16, 2,  0, 0),
> +
> +	MDP_COLOR_BAYER8_UNPAK	= MDP_COLOR(0, 0, 0, 0, 1, 0, 0,  8, 2,  0, 22),
> +	MDP_COLOR_BAYER10_UNPAK	= MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 10, 2,  0, 22),
> +	MDP_COLOR_BAYER12_UNPAK	= MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 12, 2,  0, 22),
> +	MDP_COLOR_BAYER14_UNPAK	= MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 14, 2,  0, 22),
> +
> +	// Unified format
> +	MDP_COLOR_GREY		= MDP_COLOR(0, 0, 0, 0, 1, 0, 0,  8, 1,  0, 7),
> +
> +	MDP_COLOR_RGB565	= MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 16, 0,  0, 0),
> +	MDP_COLOR_BGR565	= MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 16, 0,  1, 0),
> +	MDP_COLOR_RGB888	= MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 24, 0,  1, 1),
> +	MDP_COLOR_BGR888	= MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 24, 0,  0, 1),
> +	MDP_COLOR_RGBA8888	= MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 32, 0,  1, 2),
> +	MDP_COLOR_BGRA8888	= MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 32, 0,  0, 2),
> +	MDP_COLOR_ARGB8888	= MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 32, 0,  1, 3),
> +	MDP_COLOR_ABGR8888	= MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 32, 0,  0, 3),
> +
> +	MDP_COLOR_UYVY		= MDP_COLOR(0, 0, 0, 0, 1, 1, 0, 16, 1,  0, 4),
> +	MDP_COLOR_VYUY		= MDP_COLOR(0, 0, 0, 0, 1, 1, 0, 16, 1,  1, 4),
> +	MDP_COLOR_YUYV		= MDP_COLOR(0, 0, 0, 0, 1, 1, 0, 16, 1,  0, 5),
> +	MDP_COLOR_YVYU		= MDP_COLOR(0, 0, 0, 0, 1, 1, 0, 16, 1,  1, 5),
> +
> +	MDP_COLOR_I420		= MDP_COLOR(0, 0, 0, 0, 3, 1, 1,  8, 1,  0, 8),
> +	MDP_COLOR_YV12		= MDP_COLOR(0, 0, 0, 0, 3, 1, 1,  8, 1,  1, 8),
> +	MDP_COLOR_I422		= MDP_COLOR(0, 0, 0, 0, 3, 1, 0,  8, 1,  0, 9),
> +	MDP_COLOR_YV16		= MDP_COLOR(0, 0, 0, 0, 3, 1, 0,  8, 1,  1, 9),
> +	MDP_COLOR_I444		= MDP_COLOR(0, 0, 0, 0, 3, 0, 0,  8, 1,  0, 10),
> +	MDP_COLOR_YV24		= MDP_COLOR(0, 0, 0, 0, 3, 0, 0,  8, 1,  1, 10),
> +
> +	MDP_COLOR_NV12		= MDP_COLOR(0, 0, 0, 0, 2, 1, 1,  8, 1,  0, 12),
> +	MDP_COLOR_NV21		= MDP_COLOR(0, 0, 0, 0, 2, 1, 1,  8, 1,  1, 12),
> +	MDP_COLOR_NV16		= MDP_COLOR(0, 0, 0, 0, 2, 1, 0,  8, 1,  0, 13),
> +	MDP_COLOR_NV61		= MDP_COLOR(0, 0, 0, 0, 2, 1, 0,  8, 1,  1, 13),
> +	MDP_COLOR_NV24		= MDP_COLOR(0, 0, 0, 0, 2, 0, 0,  8, 1,  0, 14),
> +	MDP_COLOR_NV42		= MDP_COLOR(0, 0, 0, 0, 2, 0, 0,  8, 1,  1, 14),
>  
>  	/* MediaTek proprietary formats */
>  	/* UFO encoded block mode */
> -	MDP_COLOR_420_BLK_UFO	= MDP_COLOR(0, 0, 5, 2, 1, 1, 256, 1, 0, 12),
> +	MDP_COLOR_420_BLK_UFO	= MDP_COLOR(0, 0, 0, 5, 2, 1, 1, 256, 1, 0, 12),
>  	/* Block mode */
> -	MDP_COLOR_420_BLK	= MDP_COLOR(0, 0, 1, 2, 1, 1, 256, 1, 0, 12),
> +	MDP_COLOR_420_BLK	= MDP_COLOR(0, 0, 0, 13, 2, 1, 1, 256, 1, 0, 12),
>  	/* Block mode + field mode */
> -	MDP_COLOR_420_BLKI	= MDP_COLOR(0, 0, 3, 2, 1, 1, 256, 1, 0, 12),
> +	MDP_COLOR_420_BLKI	= MDP_COLOR(0, 0, 0, 3, 2, 1, 1, 256, 1, 0, 12),
>  	/* Block mode */
> -	MDP_COLOR_422_BLK	= MDP_COLOR(0, 0, 1, 1, 1, 0, 512, 1, 0, 4),
> +	MDP_COLOR_422_BLK	= MDP_COLOR(0, 0, 0, 1, 1, 1, 0, 512, 1, 0, 4),
>  
> -	MDP_COLOR_IYU2		= MDP_COLOR(0, 0, 0, 1, 0, 0, 24,  1, 0, 25),
> -	MDP_COLOR_YUV444	= MDP_COLOR(0, 0, 0, 1, 0, 0, 24,  1, 0, 30),
> +	MDP_COLOR_IYU2		= MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 24,  1, 0, 25),
> +	MDP_COLOR_YUV444	= MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 24,  1, 0, 30),
>  
>  	/* Packed 10-bit formats */
> -	MDP_COLOR_RGBA1010102	= MDP_COLOR(1, 0, 0, 1, 0, 0, 32,  0, 1, 2),
> -	MDP_COLOR_BGRA1010102	= MDP_COLOR(1, 0, 0, 1, 0, 0, 32,  0, 0, 2),
> +	MDP_COLOR_RGBA1010102	= MDP_COLOR(0, 1, 0, 0, 1, 0, 0, 32,  0, 1, 2),
> +	MDP_COLOR_BGRA1010102	= MDP_COLOR(0, 1, 0, 0, 1, 0, 0, 32,  0, 0, 2),
>  	/* Packed 10-bit UYVY */
>  	MDP_COLOR_UYVY_10P	= MDP_COLOR(1, 0, 0, 1, 1, 0, 20,  1, 0, 4),

You missed this one, it needs an additional argument. I guess you didn't compile this?

Regards,

	Hans

>  	/* Packed 10-bit NV21 */
> -	MDP_COLOR_NV21_10P	= MDP_COLOR(1, 0, 0, 2, 1, 1, 10,  1, 1, 12),
> +	MDP_COLOR_NV21_10P	= MDP_COLOR(0, 1, 0, 0, 2, 1, 1, 10,  1, 1, 12),
>  	/* 10-bit block mode */
> -	MDP_COLOR_420_BLK_10_H	= MDP_COLOR(1, 0, 1, 2, 1, 1, 320, 1, 0, 12),
> +	MDP_COLOR_420_BLK_10_H	= MDP_COLOR(0, 1, 0, 1, 2, 1, 1, 320, 1, 0, 12),
>  	/* 10-bit HEVC tile mode */
> -	MDP_COLOR_420_BLK_10_V	= MDP_COLOR(1, 1, 1, 2, 1, 1, 320, 1, 0, 12),
> +	MDP_COLOR_420_BLK_10_V	= MDP_COLOR(0, 1, 1, 1, 2, 1, 1, 320, 1, 0, 12),
>  	/* UFO encoded 10-bit block mode */
> -	MDP_COLOR_420_BLK_U10_H	= MDP_COLOR(1, 0, 5, 2, 1, 1, 320, 1, 0, 12),
> +	MDP_COLOR_420_BLK_U10_H	= MDP_COLOR(0, 1, 0, 5, 2, 1, 1, 320, 1, 0, 12),
>  	/* UFO encoded 10-bit HEVC tile mode */
> -	MDP_COLOR_420_BLK_U10_V	= MDP_COLOR(1, 1, 5, 2, 1, 1, 320, 1, 0, 12),
> +	MDP_COLOR_420_BLK_U10_V	=  MDP_COLOR(0, 1, 1, 5, 2, 1, 1, 320, 1, 0, 12),
>  
>  	/* Loose 10-bit formats */
> -	MDP_COLOR_UYVY_10L	= MDP_COLOR(0, 1, 0, 1, 1, 0, 20,  1, 0, 4),
> -	MDP_COLOR_VYUY_10L	= MDP_COLOR(0, 1, 0, 1, 1, 0, 20,  1, 1, 4),
> -	MDP_COLOR_YUYV_10L	= MDP_COLOR(0, 1, 0, 1, 1, 0, 20,  1, 0, 5),
> -	MDP_COLOR_YVYU_10L	= MDP_COLOR(0, 1, 0, 1, 1, 0, 20,  1, 1, 5),
> -	MDP_COLOR_NV12_10L	= MDP_COLOR(0, 1, 0, 2, 1, 1, 10,  1, 0, 12),
> -	MDP_COLOR_NV21_10L	= MDP_COLOR(0, 1, 0, 2, 1, 1, 10,  1, 1, 12),
> -	MDP_COLOR_NV16_10L	= MDP_COLOR(0, 1, 0, 2, 1, 0, 10,  1, 0, 13),
> -	MDP_COLOR_NV61_10L	= MDP_COLOR(0, 1, 0, 2, 1, 0, 10,  1, 1, 13),
> -	MDP_COLOR_YV12_10L	= MDP_COLOR(0, 1, 0, 3, 1, 1, 10,  1, 1, 8),
> -	MDP_COLOR_I420_10L	= MDP_COLOR(0, 1, 0, 3, 1, 1, 10,  1, 0, 8),
> +	MDP_COLOR_UYVY_10L	= MDP_COLOR(0, 0, 1, 0, 1, 1, 0, 20,  1, 0, 4),
> +	MDP_COLOR_VYUY_10L	= MDP_COLOR(0, 0, 1, 0, 1, 1, 0, 20,  1, 1, 4),
> +	MDP_COLOR_YUYV_10L	= MDP_COLOR(0, 0, 1, 0, 1, 1, 0, 20,  1, 0, 5),
> +	MDP_COLOR_YVYU_10L	= MDP_COLOR(0, 0, 1, 0, 1, 1, 0, 20,  1, 1, 5),
> +	MDP_COLOR_NV12_10L	= MDP_COLOR(0, 0, 1, 0, 2, 1, 1, 16,  1, 0, 12),
> +	MDP_COLOR_NV21_10L	= MDP_COLOR(0, 0, 1, 0, 2, 1, 1, 16,  1, 1, 12),
> +	MDP_COLOR_NV16_10L	= MDP_COLOR(0, 0, 1, 0, 2, 1, 0, 16,  1, 0, 13),
> +	MDP_COLOR_NV61_10L	= MDP_COLOR(0, 0, 1, 0, 2, 1, 0, 16,  1, 1, 13),
> +	MDP_COLOR_YV12_10L	= MDP_COLOR(0, 0, 1, 0, 3, 1, 1, 16,  1, 1, 8),
> +	MDP_COLOR_I420_10L	= MDP_COLOR(0, 0, 1, 0, 3, 1, 1, 16,  1, 0, 8),
>  };
>  
>  static inline bool MDP_COLOR_IS_UV_COPLANE(enum mdp_color c)


