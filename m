Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B8FFD2503F
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jan 2026 07:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gYDs2WdHiWHfUSPlGjz43iM5GtvJMWzLlC06mLGN8Q8=; b=HUywlpPRYdmgM/vyzjHD22qugy
	8nhZO0ZShZkLtj4/Qnw2cr/iK71WohXuANBP9VUclU+G1X8oRVu8d4HDGGlyyaQ8qL2+AbtQlXwxR
	0JRZ15Xx2jnc0isSu3tev4lhF6QsQ+lfTHw0qZcZA2WYQNR/i96hCYJBGnSyBOj6Cld9F+wGBQxK2
	rvMIuidNiCRn6HDZuMnpQaV8QV6p+375Jhh/62kEK74uXH5b+ZFfjxvJD9Me32JmVtuQMxGPjtiha
	NBH7HNy2M9Xv8kqpfHLY5L2ogzqgumLLzXJYyFXq3HwxJXrXnhjwAu3ZPLZ5tEJrmdkPCNGAba3SY
	DL+U1ylg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCfz-00000004vSO-06fd;
	Mon, 12 Jan 2026 07:49:23 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCfw-00000004vRe-2W46
	for linux-mediatek@lists.infradead.org;
	Mon, 12 Jan 2026 07:49:21 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-59b6d5bd575so5442202e87.1
        for <linux-mediatek@lists.infradead.org>; Sun, 11 Jan 2026 23:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768204158; x=1768808958; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gYDs2WdHiWHfUSPlGjz43iM5GtvJMWzLlC06mLGN8Q8=;
        b=YFkySDSZqoNpOszAy1BiDvLd+u7t566Zn12keZL/xcem1O/H5J+AEW6Pe2TGUSZfK9
         UvR26gCNLh4H1TLofWDPUzN2HrrT9JbO+PonZeIXjK/GFONLN7RZF0JsiibHYtcftYAB
         VeSEPn+uKGHs8OkWJ1KxPfLHj8dqa7Vg8ezMo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768204158; x=1768808958;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gYDs2WdHiWHfUSPlGjz43iM5GtvJMWzLlC06mLGN8Q8=;
        b=sCjWdv14biBM2pPkBL3WMaXYupFEt8cUUE/L/Bq8LcqYGhM43ghyrkrA9Yv+pCCENy
         A1TL0CoJ0a9vuSCT8PSktZ1dbGQ+52OSINz0hcI1gBgLYhraswA+P0mtshxRaicjp7dI
         dNUlfSs1Rvv0hWFBM2WpAKdVJryUWj1sUTI38oUq+VGqY34HkzJ2zCx3KUNxpprM4Hc2
         xgBkuzaytTx7TQA/Bl0ppyu6c1dpVMA4ZP3/3GcxTluEEaBidNd+daV78Cbylamp4VGE
         y4eN9G1cg6fTawVI1363Y/Vws4gBYu5Ib/QncfCmsoe5dkWv0+FCN7lurm+l4bc1Mx2S
         7tlw==
X-Forwarded-Encrypted: i=1; AJvYcCXf92P8iTwXFLNyhEu9OCe+7flKQiakHUC4v18vggVwV6mcF47c4RkxlukMU0Z1gENRoMkA+CJfxH6jOZEi9g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyS4hVjbzQ9SFd/P7aBUY8BvCf2xTR1ARhvXc9JItEEVR1CrAtO
	pJJDZsQOUKPAiAfQrvWRMtlbfEDiaQqTv0AqiA/5XmGYlPxW07H6ymruAn/D8O9ZPz/MY4gT17U
	ANJ7hhfvOX/jkiyikpedUG96zY0h0xWPAsloNp+Oa
X-Gm-Gg: AY/fxX5I9aa5Wzk3PPATUeHW9FjLxh88RCIDvDuREJ0SA6hjqMuhvxkbTiCZoYRL7aK
	T+yb5zo/0dQ3xm9pOETKGxrd88Nh6sykFHFT4GMfd9RwskmUbmfSzOlU6Bf3spmtxV65CqHGXe8
	bW9FUdqRvLQX55CyRJWflCQOFX+sPeXjJKaLL3SCUXL07xRfRPxGf0rbj6w20RhEe3lnIYfGt/j
	JqakDj2cjMLRZxbO3DaOJcBJDQKGawPl8l26lXIdsoNb7P9QNOsg0Wbus92rezViZCmbWnytSXG
	EOSX9Vs1mL/e3Sj4UvOsceiP
X-Google-Smtp-Source: AGHT+IEPf+ctffeJf140aoBJ00YAyEVGjUL3Nj2MAQoRL4lkX+em1WFVdY04W2EZPfOEZSq9xL+BIPkSo86C36EFZlU=
X-Received: by 2002:a05:6512:3da9:b0:59a:1a4e:c098 with SMTP id
 2adb3069b0e04-59b6ed134b7mr5017113e87.8.1768204158184; Sun, 11 Jan 2026
 23:49:18 -0800 (PST)
MIME-Version: 1.0
References: <20260108143934.69634-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260108143934.69634-1-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 12 Jan 2026 15:49:06 +0800
X-Gm-Features: AZwV_QgjsDK-32UNI1Kj8KhdJKQno21ayqzxpgGCeVRe3qKhTwXnm4PxxIOLkUA
Message-ID: <CAGXv+5EvWVhRXoxLbsV5G7DEWLnVGRMCC1Qtd02fD8jh35VRqA@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: arm: mediatek: mmsys: Allow single
 vdo/mmsys endpoint
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_234920_698380_B687494A 
X-CRM114-Status: UNSURE (   9.69  )
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

On Thu, Jan 8, 2026 at 10:39=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The hardware supports using just a single output while leaving all
> of the others unconfigured (disabled), but the binding did not
> really allow specifying a single endpoint@0, because in this case
> one must either:
>  - Call the subnode `endpoint` and not declare any address and/or
>    size cells; or
>  - Call the subnode `endpoint@0` and have at least one more other
>    endpoint(@1 or @2), and declare address/size cells.
>
> Allow specifying a single `endpoint` subnode, without the `@0`
> implicit suffix to suppress warnings happening on this kind of
> valid usecase.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Looks correct to me.

