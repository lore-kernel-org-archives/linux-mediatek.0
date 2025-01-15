Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BFB8C02180
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jan 2025 14:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wgpCbUXuk0fjx7PlpFBa3YSbnvvXmj+DNx/eEdB8F5M=; b=v+PnmmDbNa1nos2L+P3ejpHBAw
	dBQ/k4CdkvfVV9rEw8Co68Ng2HayfTapuwk3jN4Ng5vS7uxIzdk7Hif1txqXk8yQKCZwOJhh3HckX
	VutPVQyg509SdMVhFPPNagImYXFGZf2i5Cy2BsXkTgoZRAOP4NdpZjXpa/6KUIWDdmlzBO+7AyvAF
	7mDuMZ8TC++ZE9/kYX757h6Bl94Hg6GV8J1rtGdpz9sKtunSTiOPKrj1HppqWKzyh7nDO69bNMcCe
	SUwkRMy2DaDryIxxOJ96eR3aUriuJrS0s1zdg/mSpfDjkn3lkn3LW0NsJTESSGtALCa+18t1HqDpj
	JD6eQAmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY4UX-0000000C8fR-407H;
	Wed, 15 Jan 2025 14:35:33 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY4Tf-0000000C8ZW-2HBF
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Jan 2025 14:34:40 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-6d89a727a19so9128606d6.0
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Jan 2025 06:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1736951678; x=1737556478; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wgpCbUXuk0fjx7PlpFBa3YSbnvvXmj+DNx/eEdB8F5M=;
        b=mtZsEk35qOcp+dJB6bF2UgYMnBvKuUewYL9lO+qYKhpDcnWJhVhAvfRkm/EUIHOQFI
         f9PPFJ6d5RVS7M/2x3QFXHzf9xTmrg9phavH7f3j1VdiuvKoT+i/ELZ8kT/lFxZuMFkc
         DNmynN9+eykzU9C7Mzvy9cGa4ZcWuv7Q4KSTn5MOoFaHUgI3JlM9PFmLuDBbYRhWhq09
         uxAaWX1FLfjzuu9WHUBiD2tLiOYzw2LPvpRzLmQKmKuABPIKAjybNnRtXSo8iWfTyZkP
         I+Bn/bqS/lA6stuVbOnrSRTXg4tNE/idYqGHB42yFFZbL+8XPZq0DEYEC0pXlNqzC0pp
         gusQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736951678; x=1737556478;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wgpCbUXuk0fjx7PlpFBa3YSbnvvXmj+DNx/eEdB8F5M=;
        b=gcSPgO0xpeeeu9RTyvU8I1Zfg0VhTmGhwqro9AGQNAAALovvaafIu1iSthrKWeaBes
         Ytq733cW4k5WI/FFKQPztxa3ETx//+pK0knR23pQGHJ/870pgPRG3YYdRGN40ONvS2Ez
         Qaoa/X7SuD8YMPfpbSu4u6bLa7WNEeZwUi3cE0LcuyNNuIpcRW32TJqpNJHR3reDTdLZ
         SA0vZTg7K2A1woiXGpeXXNiD1vBfL+vs+FKWpOF+7Q1Ql0hlyobGdSHOoiTfpuyEA//A
         SeM5AUrndYBjjuoS54jaDhaTx96oeprrVPtSQkTWhJ3ewGp+HxucInYlNPPmRzCjpvit
         I+Qg==
X-Forwarded-Encrypted: i=1; AJvYcCWp0sGtQrxw/HZWJkUOCWaBJGK78M9TIWagnQXbMICf2It9IXRTZEujdqun2p/aOrebNd31p/9aXxazRoUL2Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxzeAOdCEwTzJRbnPrt684E/GpRo2mpSZVhPLDz91i9OFeiOpys
	oePUOT9R9WGzZgP6LotWpxznBphSxlsNgVnSA30I6Ts0xqm2NL60qne7t4WDYNAZHacPxazGtdD
	REn+JvTmAcBDGLyi1yiLRNEEZaXY2k8blRS7ixQ==
X-Gm-Gg: ASbGncss+HIG8o+e3EECtkTfS8JRweqf+vZMelH6OGFUIUSMiUZ9KYXOtgSZjw4XRvc
	oY915pBCrr+03k5wsaPYRmiB72Pn+kWuvLZM=
X-Google-Smtp-Source: AGHT+IFPz9fbMcvhhyZZGYYuWLUwXCRTy8s+kBCbi69J2hIRU1+TB7begqOpM0+xy1s6GqB+nx1X6ZJAR0totDSXOwo=
X-Received: by 2002:a05:6214:486:b0:6d8:e7c9:ffa0 with SMTP id
 6a1803df08f44-6e192c73ef5mr43851476d6.19.1736951677902; Wed, 15 Jan 2025
 06:34:37 -0800 (PST)
MIME-Version: 1.0
References: <20250109150310.219442-1-tzimmermann@suse.de> <20250109150310.219442-26-tzimmermann@suse.de>
 <cdbe483d-0895-47aa-8c83-1c28220f4a02@ideasonboard.com> <bc97b92e-7f8a-4b92-af8a-20fa165ead55@suse.de>
 <f3ba05c7-6e49-4641-a3f9-ba418ebdb7c3@ideasonboard.com> <c6735280-7c32-4319-8ca9-a7305d8117c3@suse.de>
 <d67adb03-5cd0-4ac9-af58-cf4446dacee3@ideasonboard.com> <0ea6be58-0e04-4172-87cd-064a3e4a43bc@suse.de>
 <f35cb350-6be9-48ca-ad7e-e9dd418281d5@ideasonboard.com> <4af0b6a7-c16a-4187-bbf5-365a9c86de21@suse.de>
 <e327ad84-b5c9-4480-b873-dc3aca605538@ideasonboard.com>
In-Reply-To: <e327ad84-b5c9-4480-b873-dc3aca605538@ideasonboard.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 15 Jan 2025 14:34:26 +0000
X-Gm-Features: AbW1kvZOqZIfsgr5MQqIuf1jKNJtcUmkb-2ddanRpBEhDxEw_Wl931RGN2rzkA8
Message-ID: <CAPj87rOn=RQ615zyaEdFT2ADfPztU7+heVi0G34Rdg-=QO1cCw@mail.gmail.com>
Subject: Re: [PATCH v2 25/25] drm/xlnx: Compute dumb-buffer sizes with drm_mode_size_dumb()
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org, 
	nouveau@lists.freedesktop.org, virtualization@lists.linux.dev, 
	spice-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, 
	intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Andy Yan <andyshrk@163.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_063439_576733_21639AC3 
X-CRM114-Status: GOOD (  11.78  )
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

On Wed, 15 Jan 2025 at 14:20, Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
> No disagreement there, we need CREATE_DUMB2.
>
> My point is that we have the current UAPI, and we have userspace using
> it, but we don't have clear rules what the ioctl does with specific
> parameters, and we don't document how it has to be used.
>
> Perhaps the situation is bad, and all we can really say is that
> CREATE_DUMB only works for use with simple RGB formats, and the behavior
> for all other formats is platform specific. But I think even that would
> be valuable in the UAPI docs.

Yeah, CREATE_DUMB only works for use with simple RGB formats in a
linear layout. Not monochrome or YUV or tiled or displayed rotated or
whatever.

If it happens to accidentally work for other uses, that's fine, but
it's not generically reliable for anything other than simple linear
RGB. It's intended to let you do splash screens, consoles, recovery
password entries, and software-rendered compositors if you really
want. Anything more than that isn't 'dumb'.

Cheers,
Daniel

