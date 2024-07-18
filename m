Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73461C3DA49
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jul 2024 11:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fvLtlvVLIc2uX9Mv4C24Hw1TFHGs1i0AqLl5Tk1HA1I=; b=mVrBPqXB8DKnPs89Ck9aEZe2kF
	mPwD+YPWa3+qaqYQOQslIoGBXfICnMas9ed8+5df7+CT655+FXT7LHto9Cf0RWpI3sorCT57L/Tt2
	MZBu6YK50FppWObQsR+1zlndoyjXY7g9GxL8nf4G51WFXiVZRsXoH7BplfC3VW6oT1ocMbDCiJAq8
	sE6iUL6IxVTbUMeIhYZ3v8x7yw7/HSAqPgl6ZQJ/FmacjFfgyM3OPqNnRwjmTiJm+nrEaJhWtF/rH
	nmLnsRs0YtSZgL3Zwnqk8dpksVJwFnDQg4YgmLYwZwKEEhzf/mkwh8dmJa/zWoRDyhnbTiTnmdfMU
	vCXkPbfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUP6k-0000000Go4z-0Wj3;
	Thu, 18 Jul 2024 11:15:34 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUP6O-0000000Gnyd-2umM
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Jul 2024 11:15:14 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-654cf0a069eso6588227b3.1
        for <linux-mediatek@lists.infradead.org>; Thu, 18 Jul 2024 04:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar-org.20230601.gappssmtp.com; s=20230601; t=1721301311; x=1721906111; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fvLtlvVLIc2uX9Mv4C24Hw1TFHGs1i0AqLl5Tk1HA1I=;
        b=aRujxtvX72Q8Rwt0DZOFdsP9/c2WUuYJ22S65Gsa+MXz6V43D49nkOqO4idAPwgbYF
         1Vd2SsjQRiahY7nauBPhLR1N2LvPMKECPMcsYHweCTFENMjYilOO1D4lxr5/6iaq/GwD
         BviqRng1ENO2fgAA/UenDrZF3IDBwrR8V9xv7AmPgRAmRBgMYJZmxrSkbCh3u2+w0zlX
         kHAAcLaftqqmRTRfU9lPtp+zG2e9FIb1H4o6mHA/PXI/vvT3ARBrNVXA3KU+qjtFXqAD
         5BAJg7uMzySbm1S/dc9DiJZZflvPHU52emXcnEpjTH2DIPmlCiwGcE9raY1YOKp92JcE
         6rLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721301311; x=1721906111;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fvLtlvVLIc2uX9Mv4C24Hw1TFHGs1i0AqLl5Tk1HA1I=;
        b=PoD6ZeOSihnF92YBk9fRHjj6S+aQwt6BycDEqOHfrMRkCyDoCuuwcI4kY0LE35aX7l
         m61R7fWkjBGZK5f3fn2PhgBR6nSQ7UKdGmGRPDXNJwlHyUSFUW8PZ+qcS41cX9LS+B57
         JJlQLxFt/k6XEIioiQwOkIg65wnYoWiCc4trb+QyBdtAnbp/P74EsnR7m9AwJrCkfwHn
         jKe7Qex02+rhMO+2I+SJS5/l6B69MtN2eC8B8h8iE9AeaX3aaEwupD1hr9Pw1WiQ2caC
         sMDPSPVpEzDAsJuU9BtLk1qrnZ36Ux2CUB//TwzaBSnikcZGGI5OWhoy1Iiri5tyqIxM
         K2iQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOR8tWuxDY2CnjNAEfXGYOZ1iGK72Bg6GtW8p21hCuMiXh7/6IzEmaPSFDY27Cc8ghEDqJU5xjwkbUPxdsLavJMdXBM/cXqli7PuDbxYFzEOz9
X-Gm-Message-State: AOJu0YwKwuYPIGC6pcwgDPp+X/8EXsRoqGU1DKElcvPtsB64N9gzbmZL
	WDRp3J6rAROq2OwL6R9+rHM2B457Fv2Nsgn47/2XYHSNJSdIzAEs12HGykP3+aySbv+AjF70TQ3
	vwRm3PTT8s8pAQwp1QVkrxLe0vCfETgXpsBRzBA==
X-Google-Smtp-Source: AGHT+IHg27/h28x8cH6RNystKqwtN9ObuunzW9wLXPCT62zkr9oqTMXzH3ODAVfWE0/MOqv8X7Ek5YsHXkLmGxcCKWA=
X-Received: by 2002:a0d:da07:0:b0:64b:630f:9f85 with SMTP id
 00721157ae682-664fe45113fmr49718207b3.12.1721301311396; Thu, 18 Jul 2024
 04:15:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240718082507.216764-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240718082507.216764-1-angelogioacchino.delregno@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 18 Jul 2024 12:15:00 +0100
Message-ID: <CAPj87rM1dbawwtRnMzDRLLCt6FuOU+851hcJhKDsg1ioRM2Pqw@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Declare Z Position for all planes
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	daniel@ffwll.ch, matthias.bgg@gmail.com, shawn.sung@mediatek.com, 
	ck.hu@mediatek.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_041512_740725_A1CEF2A5 
X-CRM114-Status: GOOD (  13.88  )
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

Hi,

On Thu, 18 Jul 2024 at 09:25, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
> MediaTek SoCs support multiple planes, one of which is the primary
> and all the others are overlays (and CURSOR is the last overlay).
>
> In all currently supported SoCs, the Z order of the overlays can't
> be changed with any fast muxing action, and can only be changed by
> swapping the contents of the entire register set of one overlay
> with the other to internally reorder the layer properties, which
> is indeed feasible, but probably more expensive than desired.
>
> Declare the Z position for all planes with an immutable property
> at least for now, so that the userspace can take its decisions
> accordingly.

Thanks a lot for this fix!

If I understand your middle paragraph correctly, please don't ever do
that though. I think what you're suggesting by 'swapping the contents
of the entire register set' is:
* plane ID 40 (normally) controls OVL1
* plane ID 41 controls OVL2
* userspace configures planes 40 & 41 with a zpos suggesting that 41
should be below 40
* the DRM driver 'swaps the contents of the entire register set' by
making plane 40 control OVL2 instead and plane 41 control OVL1 instead

If so - please no. Just declare an immutable zpos, because that
actually matches the hardware, and then leave userspace to configure
the planes in a way which makes sense. Looking at the zpos property is
already required in order to handle overlapping overlay planes, and
any userspace which supports overlays (including Weston) already looks
at zpos, handles immutable properties, and will dtrt.

Anyway, this is:
Acked-by: Daniel Stone <daniels@collabora.com>

Cheers,
Daniel

