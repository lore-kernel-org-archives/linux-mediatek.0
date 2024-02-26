Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC34C54E49
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Feb 2024 11:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=59M376lOs4RpQY+QsNbUdwZI7JBMTstkeh/+AItoW50=; b=MWM2u7bqaCnTW0f2eL26xP7u3w
	eGhbEB9jrgKCyOaxiA4TEBVYtSXpdQ67rjzK5Juyq/E8r03goDUDN3kDsRWfmxKgeMFm5eCwF+swj
	SIhmkKIatvbzPMcdx9y9tS+9Lor781hXGNK56X0jxNPpyh8xjp8OxKq8FYYNafkr5HeHtBwbYj59B
	ACKEKCj2nODlTd5mM2UphGp0ArDPQ4CnoVpPaOCQdsJxDo0ekSJfSG+xodBZT9nVcb2odChd+I7Gv
	71Rr49SBdQvtccefrzvYrCxw9G/1SkYLjP0kfVl/jlIe2BsUyUpY1fvfRgGseSVNgxzRf06FeBuvj
	YIQCyFFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reZDe-00000000LJr-35F5;
	Mon, 26 Feb 2024 11:32:26 +0000
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reZDZ-00000000LHk-44wz
	for linux-mediatek@lists.infradead.org;
	Mon, 26 Feb 2024 11:32:24 +0000
Received: by mail-ua1-x92f.google.com with SMTP id a1e0cc1a2514c-7ce55932330so1502449241.0
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Feb 2024 03:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708947140; x=1709551940; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=59M376lOs4RpQY+QsNbUdwZI7JBMTstkeh/+AItoW50=;
        b=bWJVQHQx5grWk1ojDo0R/PnguT6XX0IPIlrAk6XhHA1/70/XGyg16Qr/REO2oNAo/L
         zz1486iOrB85hlOZ3tj+wxA2i9Z8bMAYfHWO/rOphaZ6VYNkU7cD/GdI3y1uqzevnMTV
         yhhx5gTOUq1YJau7vpyrqhRa0IEGIsSeCpiOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708947140; x=1709551940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=59M376lOs4RpQY+QsNbUdwZI7JBMTstkeh/+AItoW50=;
        b=kTi3pCgt4OCyeG6CR0lOgh/begQFbrxj//nZKd8T3T/Jp81rUCxNGEQJK/SeISuvS2
         3nl6OUddbkN9gCxhT2MISMu+3ZY9qo8azY1qTwn6MDsaJxClJFIulPagFUMjKnS4oos7
         RNWxhJ5ux7aQAFK3m9NTFlp1X8nNh+MR3EGrDqXBCVtpArW0yW4OW8r5RyWzlOKLBLdT
         jBnyObbbYoKJMtXos/iFiW4qWrjJJSHtESKYBVlN35C1LChSqpc9EbLoZAqQFWEhefxc
         wgWfuW4dkiN8QhTzhvs14Z5X9mG41gknO3bz6PDvGLXCyAbcHa9S+B/6aB7aO4j+JkEz
         PZYg==
X-Forwarded-Encrypted: i=1; AJvYcCWlS5LIRJTogHeFJqS1nHTpKg9Pe2KtwwDF/fOlqngKa2MITIb3RpVeHv6CigpD+meq4Y90DNf2g9FSSag099iEm/Ztky6PHyxh+iSPu4fuW2pv
X-Gm-Message-State: AOJu0Yw4wtLhqXBQSCA89V7kDQF7e76qsWdL0j38Q6k4TfDuw14htW8v
	dcQ+drVUtv3+EndavD3BQrwtzX58zL95HXFMOtha0BDTWuC1IBYBrcZhSL4kcca2p40LonIf2Iy
	N7w==
X-Google-Smtp-Source: AGHT+IE6aWVrqzA8T8gKm2Xx32jUFj8RqG7EoSN5K8erpfZdUjZsLbLJHUWVGkCZB5kmiSJHnXFN9Q==
X-Received: by 2002:a05:6102:9ba:b0:471:bee4:4ff0 with SMTP id f26-20020a05610209ba00b00471bee44ff0mr3183368vsb.32.1708947140386;
        Mon, 26 Feb 2024 03:32:20 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id ij9-20020a0561025e8900b0046d2b34617bsm891399vsb.28.2024.02.26.03.32.19
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 03:32:19 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-7d5cbc4a585so923179241.3
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Feb 2024 03:32:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUJ753Q4n/Z8A8fGT72cJ9LLzNO7S2Svf625GtUHropVAEzrvgBMip2xl1iT9yhxjMQ9qv+pI17fRsIhKxjnzC6P9TJbxqSDC9Gvn80+9Z5pPcv
X-Received: by 2002:a05:6102:3a0f:b0:471:e2ca:4023 with SMTP id
 b15-20020a0561023a0f00b00471e2ca4023mr2137374vsu.25.1708947138994; Mon, 26
 Feb 2024 03:32:18 -0800 (PST)
MIME-Version: 1.0
References: <20240226080721.3331649-1-fshao@chromium.org>
In-Reply-To: <20240226080721.3331649-1-fshao@chromium.org>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 26 Feb 2024 19:31:42 +0800
X-Gmail-Original-Message-ID: <CAC=S1niCFgbNjbnHmUD46N-9gSagYuExeQ+nUHvKOvNbS-jz1A@mail.gmail.com>
Message-ID: <CAC=S1niCFgbNjbnHmUD46N-9gSagYuExeQ+nUHvKOvNbS-jz1A@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Support MT8195 OVL compatible in mtk_drm_drv
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_033222_046299_D494E97B 
X-CRM114-Status: GOOD (  11.71  )
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

On Mon, Feb 26, 2024 at 4:07=E2=80=AFPM Fei Shao <fshao@chromium.org> wrote=
:
>
> Specify the component type for mediatek,mt8195-disp-ovl in the MediaTek
> DRM driver on top of commit 76cdcb87d391 ("drm/mediatek: Add MT8195 ovl
> driver support").
>
> With this, the compatible can function as an independent fallback for
> other display overlays without relying on MT8192.
>
> Signed-off-by: Fei Shao <fshao@chromium.org>

Please disregard this patch.

With the feedback in [1], I can also fix the issue from within the
SoC's device tree.
Even taking a step back, I just learned that this is a duplicate of
[2], so it makes no sense to merge mine in any case.
Sorry for the noise.

[1]: https://lore.kernel.org/all/c4814e25-42c9-4604-b86a-8ef0bd634f78@colla=
bora.com/
[2]: https://lore.kernel.org/all/20240215101119.12629-3-shawn.sung@mediatek=
.com/

Regards,
Fei

