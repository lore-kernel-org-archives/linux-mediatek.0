Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D163C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jan 2022 16:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8pUr8hT6qH0PY4RGy8y0V+Y6pVipMQx/dsdkeFyyb3k=; b=P+u0nwqsKua0rh
	hXp4iDIuR0qq0T5/VB60nUATlFhjxrsJ9PfR6937nI1bD3gC9yOcQbU6qoIPdjKpGxvno1Kl1BBCY
	iJk4shox78icMOS9kGaRulhFl9ZoPkzZyh2OL0scKRyJR0GlG4qUZxKPWNkOEjVdUbLA4EnuXr8r2
	j/37KelfUxRQ5cy+Jz8+TYxGwY6RZi7bTP8LtO5mbgrj2MyqiRF41R1/5sqPYOoQLN6DAolFLmfKt
	cwQsh38UUxtXoJzWgJX3QK4fqN0amnVBcDDK+Ru2F1PuZwBWpmqeuhmZzY4ZJSBRK8xTD04sI6l1u
	D5X8EUIIyJ51bW1g07Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDUa2-0036qa-Av; Fri, 28 Jan 2022 16:58:34 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDUZl-0036jw-9A; Fri, 28 Jan 2022 16:58:18 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 9F7741F46207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643389094;
 bh=/WB2nwTXD7xQq1iUZtX6YhCW+XkrjZNwWw5g3vqyWvc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=caLWPvKLS2Dw/oiH884iKtSOgKPqKYTd2eUu57wuQ6SGLGtW91xP8Js8sKeDRvxZE
 2l9nRYA4hMCm3Lr2mRFHeD4hW9oQu/lP/IpNuvDORI0Y0l7Au5/xM1bQ7sPpaHJ9vj
 X8QkXELecpBlqVUKC+FF7G7utiY5gmbiuEnLXPeunYOZa3+e1wcRx/WSxYY9F+6THS
 o3cIfjK2mM8QuKkQzBmT5GWV48x7/VPZPXNzpdVlM1nWBl3At91DZYuSVsI5bzFl6q
 ogS9YBZUavcbHX+mC1/ynAFi8R5B2yaMVOSx21osSuqZO+QX2Ev8R1cBuPSeQr+aU8
 R6t5upH1g12Ag==
Date: Fri, 28 Jan 2022 11:58:09 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, yongqiang.niu@mediatek.com,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
Subject: Re: [PATCH] soc: mediatek: mt8192-mmsys: Fix dither to dsi0 path's
 input sel
Message-ID: <20220128165809.ir2x5ghynw22xki7@notapiano>
References: <20220128142056.359900-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220128142056.359900-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_085817_512124_ADD61A1A 
X-CRM114-Status: GOOD (  20.74  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jan 28, 2022 at 03:20:56PM +0100, AngeloGioacchino Del Regno wrote:
> In commit d687e056a18f ("soc: mediatek: mmsys: Add mt8192 mmsys routing t=
able"),
> the mmsys routing table for mt8192 was introduced but the input selector
> for DITHER->DSI0 has no value assigned to it.
> =

> This means that we are clearing bit 0 instead of setting it, blocking
> communication between these two blocks; due to that, any display that
> is connected to DSI0 will not work, as no data will go through.
> The effect of that issue is that, during bootup, the DRM will block for
> some time, while atomically waiting for a vblank that never happens;
> later, the situation doesn't get better, leaving the display in a
> non-functional state.
> =

> To fix this issue, fix the route entry in the table by assigning the
> dither input selector to MT8192_DISP_DSI0_SEL_IN.
> =

> Fixes: d687e056a18f ("soc: mediatek: mmsys: Add mt8192 mmsys routing tabl=
e")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>

> ---
>  drivers/soc/mediatek/mt8192-mmsys.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> =

> diff --git a/drivers/soc/mediatek/mt8192-mmsys.h b/drivers/soc/mediatek/m=
t8192-mmsys.h
> index 6f0a57044a7b..6aae0b12b6ff 100644
> --- a/drivers/soc/mediatek/mt8192-mmsys.h
> +++ b/drivers/soc/mediatek/mt8192-mmsys.h
> @@ -53,7 +53,8 @@ static const struct mtk_mmsys_routes mmsys_mt8192_routi=
ng_table[] =3D {
>  		MT8192_AAL0_SEL_IN_CCORR0
>  	}, {
>  		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
> -		MT8192_DISP_DSI0_SEL_IN, MT8192_DSI0_SEL_IN_DITHER0
> +		MT8192_DISP_DSI0_SEL_IN, MT8192_DSI0_SEL_IN_DITHER0,
> +		MT8192_DSI0_SEL_IN_DITHER0
>  	}, {
>  		DDP_COMPONENT_RDMA0, DDP_COMPONENT_COLOR0,
>  		MT8192_DISP_RDMA0_SOUT_SEL, MT8192_RDMA0_SOUT_COLOR0,
> -- =

> 2.33.1
> =

> =

> -- =

> To unsubscribe, send mail to kernel-unsubscribe@lists.collabora.co.uk.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
