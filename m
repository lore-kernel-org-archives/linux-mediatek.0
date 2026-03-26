Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE54109E54B
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Mar 2026 06:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=69ZaWNAxRHkgtq1KDpn1Fryz++TV1sPjQ/Hor//Od0o=; b=gTN8GpKSHx0hqc5mEwycJK12p0
	IJE6NtATvSNpQQtEfSCkVJ+T1iBVKLqVAQ18fLJ+DLgRyDM6VFV+uuj4uonqCJ+dJfRzQzEFbbGH/
	jbkab15X/FO+bu65W23/0HhQ2jdcotROcZLWZcxfxJIelSC3Nm8+ILHfye7pnqsGWs61ow9hu3FLg
	W+urQAsUMKjhSHISo/b11D5DAe45tb3IaIdql1RIbT1MxHc6Y80nb3Pab6V5Y4OC4Y2JdOayStoT8
	5PlmiyRzOA9lZ242iEg9zYjTCggWEhySRgR+fsi5BGxvSpnm0o0j+RYESuKSNFbu9KCL49xyHtnWK
	kdiFGpxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5eO0-00000004rTY-10LG;
	Thu, 26 Mar 2026 06:40:09 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5eNy-00000004rSu-1M0t
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Mar 2026 06:40:07 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-59dcdf60427so763720e87.3
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Mar 2026 23:40:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774507204; cv=none;
        d=google.com; s=arc-20240605;
        b=jIgfD34Ers7/cy9+YEBp6D1y0pJpqMoXGSd61pb3PIdpH5T6k2WGzkbAOunZzdTS+c
         DHV1KmB2zOghQDeX+B3UitV4sc8RLe3ZMU8CvhfpRndHP1MbyHwSrVsJicW+dTEuPoa2
         UTwp/PdrJp+S5PoE4zAt+MdBfFF8pEjl3RpTVEmNUT7Yf4GXTEBpvIgUzO30wpWvs8HP
         /XNOg0cqUivVmhr1aJc3gnF1QQjdF+J6iFh2voCO7v5MLGYEmjwVJ4qXrDxpYpSKv9mf
         1IhcMBtC6MdhPCyBJdyfX/pHiFNompv2M71sh+4EVzVuRRV14RXcvrq2Nd7tOr0ALnWc
         ypTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=69ZaWNAxRHkgtq1KDpn1Fryz++TV1sPjQ/Hor//Od0o=;
        fh=HwQYA4Fm6fNubTKha6SsE3zvSp7Al1PEU3R+Ig2xXvA=;
        b=f2weBNAC8wvR2o96K9gOOe9jbUezV9pl3ZR1yNPmsYK/1m/WQ8WSTehOCVhOqq2si0
         qEJVD1bsDtBfbuMT+/wGyiXUIiSAFl6TQPfW3Y/r0swJgy4b4F+7mxcCFk3wGXx2g6Gx
         JFSKSA4bEYa8o6i/KBswUxH2R5ik+Q0zpVz231vVGO0vMJH0HEZzFUy76YQpjy0DaNfY
         CQvm1QwUY627qWLJb+jnue7zuar8XLWhvkKzvqtEpmlE3awlTVoMvEZzAQx7yahW2ph3
         YBxvfNNHjWVXib4KwkhqBWqNbt6HM3GLx6LFUH2VrRraVj8avyQUYBSoGuzpgn54Ljsv
         hKQw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774507204; x=1775112004; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=69ZaWNAxRHkgtq1KDpn1Fryz++TV1sPjQ/Hor//Od0o=;
        b=kmPXjbehZb/pL9zo0obNPpeVzeHihawE5mhjonYhLXkrZ3wsmzS/DJUhn0ybalfooR
         rXYmBxwPdRsqNLfCYw5wfyOf/iJlZYPq57+pgByywr0cRcucj7hLHNMIHVhNcdScIvyd
         UVDqUWIEV263jb0Afu4Tj4pzAaSoggyU4I6o8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774507204; x=1775112004;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=69ZaWNAxRHkgtq1KDpn1Fryz++TV1sPjQ/Hor//Od0o=;
        b=P5SLPJ1b9eTKIMO9EIhkLVBxS41mJurULiKRNqQFCtd9yYLrjz1Yt4G87y8MZ3rAHm
         2ppOwoc3i0CMGJuSbpfWfQQ83fKVYbZjbtHUIBn+W9MrqLB7OQZWYGA7qXBn+P6FpuOC
         tIvkx+1v2soDYUvfKVPEgxjgVTtA3x3cFmlTyHN0BiW+VxSebOXaz97Vn0RGjLs1H7w1
         1OYZeluQWYhuXiI0JOgRNv/BYT3tmwDfJXOiqqPyXC+lfIwd0dXuow5D16cfgTO9SnbV
         WUyfCGHV1GJVAjoXYCJ7OLoDKCfLKT7i49aaGDM3v9dqfSDa0RpMfd/GlAmilrvfKthC
         9igQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2eM8CzRKZjsP+F+iXn72aVYKFEY1RC4L1Ei5hGbuKVAeusNCZlQZyG+qXmQ9G+WwWxgoEvJ5UDCWphdypfw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxL7rVpkdCOqQ6O7eIQq6afGyk08h3XtFOg3hyaqyASuBe8aO6L
	fgHl0jpn5DZ7wuTjAhssYdx69y31VDCZxhHMU0+sqhvqRrJMWRcPp7xi/3Wv1zNKX2/pJvV3Ljs
	TG+GeV+TbBRYYSUjKoY+pFTrAsIormEgD/sI3yRqV
X-Gm-Gg: ATEYQzwOf1ttbF6jN2ScU7sb9ZJk8lYKG8BBvulZX7b2WADGF1kFYW4KtYR6/W77WaS
	22jVOKxQCRSFpp0W8/QYrqy+plfStIQ92PWffBxBNxJmqx/+fApRI+LVH3daOmoL9pnOUrOzEVJ
	ruypCigiQCnJ/zoozb3qxcbXcrkyiSgeSk++b0UkWBCCMfFOxjJR3QV7HYG2Heu/NPoTjCuvDmv
	NXeKAvYPphARn3slJpBfxcb3mdZ6N0cynNfwORV2kiqJaSGQWneP7dv8oGgupJyXAAWkWlPiywi
	BTvOyspIzjzGfX93UeEmwZnIhuZpcoNR/BQDaA==
X-Received: by 2002:a05:6512:34c8:b0:5a2:a0b0:3c with SMTP id
 2adb3069b0e04-5a2a0b00282mr505750e87.25.1774507204124; Wed, 25 Mar 2026
 23:40:04 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1774499536.git.daniel@makrotopia.org> <d1a9b393d9929dc670dc6d5bfcc5cd43561d0be4.1774499536.git.daniel@makrotopia.org>
In-Reply-To: <d1a9b393d9929dc670dc6d5bfcc5cd43561d0be4.1774499536.git.daniel@makrotopia.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 26 Mar 2026 14:39:53 +0800
X-Gm-Features: AQROBzBXCYK8fdBiG_gwq6eMeNBtFL35RVNDIyD5eRFrYc-fSnDonaWmeSR1w1c
Message-ID: <CAGXv+5Fv1g75+8kFtMEvMeSW2+2tYnqcS=P4ssZfT8p9ORwXPA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] clk: mediatek: mt7988: use MUX_CLR_SET for
 gate-less muxes
To: Daniel Golle <daniel@makrotopia.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Laura Nao <laura.nao@collabora.com>, Weiyi Lu <weiyi.lu@mediatek.com>, 
	Chun-Jie Chen <chun-jie.chen@mediatek.com>, Ikjoon Jang <ikjn@chromium.org>, 
	Sam Shih <sam.shih@mediatek.com>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_234006_413265_C484A091 
X-CRM114-Status: GOOD (  11.96  )
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

On Thu, Mar 26, 2026 at 1:11=E2=80=AFPM Daniel Golle <daniel@makrotopia.org=
> wrote:
>
> All 19 muxes in the infra_muxes[] array are pure mux selectors without
> a clock gate or update register, yet they were defined using
> MUX_GATE_CLR_SET_UPD with gate_shift =3D -1.
>
> This macro assigns mtk_mux_gate_clr_set_upd_ops, whose
> enable/disable/is_enabled callbacks perform BIT(gate_shift). Since
> gate_shift is stored as u8, the -1 truncates to 255, causing a
> shift-out-of-bounds at runtime:
>
> UBSAN: shift-out-of-bounds in drivers/clk/mediatek/clk-mux.c:76:8
> shift exponent 255 is too large for 64-bit type 'long unsigned int'
>
> UBSAN: shift-out-of-bounds in drivers/clk/mediatek/clk-mux.c:102:4
> shift exponent 255 is too large for 64-bit type 'long unsigned int'
>
> UBSAN: shift-out-of-bounds in drivers/clk/mediatek/clk-mux.c:122:16
> shift exponent 255 is too large for 64-bit type 'long unsigned int'
>
> Switch these definitions to MUX_CLR_SET, which uses
> mtk_mux_clr_set_upd_ops (no gate callbacks) and does not require
> callers to pass sentinel values for unused update register fields.
> The actual clock gating for these peripherals is handled by the
> separate GATE_INFRA* definitions further down.
>
> Fixes: 4b4719437d85f ("clk: mediatek: add drivers for MT7988 SoC")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

