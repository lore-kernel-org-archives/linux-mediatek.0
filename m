Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA8CCF856E
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Nov 2025 16:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fY5BvWFohYUsQWWAbdgvSo56iCSLE2VcTftjflKg6QE=; b=JqQyKdMxmiDKtnEsM8q77wEpFv
	TyVMC3MeNyfdYybPQp9KZLzaDWhYanacxkpl8nlRfRnTbooAW7gCpFf2f2/6oHoKgSRsrrEEOCHey
	GRHN1YP/GHaNpiqN/K2iiS8Y5+MNMCE8qXpqqg2jK13px1lSAc4gpanW7bMHrFRFmn49ShEFfjWlQ
	/9E749uzx/jFpsI30tfQGVrfXGouoy05zxDSC3W+Bf+aVlaGXrHM7FYQRGCQRasY7wj27CPgTuEJU
	3jeeGWGZCQB8kOTgfGrxLvEmBcy6x5Vz1w0bO6Bnd7MAe/N4YVDcJCuELDWYt0n/hB5NoRaSqhoBo
	UCX29fkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM7Ag-00000006yKm-1Htj;
	Thu, 20 Nov 2025 16:06:10 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM7AW-00000006yID-1Lp0
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Nov 2025 16:06:01 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-644fcafdce9so1623587a12.1
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Nov 2025 08:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763654756; x=1764259556; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fY5BvWFohYUsQWWAbdgvSo56iCSLE2VcTftjflKg6QE=;
        b=aZMZLNLKgpEB1NUz5m9H92RB6WoTR3RkoN7UO7sEc7h/efXSKuV6mwanmyTEfmcqae
         zxSLq4gIs2fU0y2M8/beafCVyVkTF5ZTl14NiPH8B7N8koATiC0qIjdqsLWL35YTkb0i
         zeTIT2gG/jpmGcdT8JW7fcZin2ciNPNFWwBv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763654756; x=1764259556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fY5BvWFohYUsQWWAbdgvSo56iCSLE2VcTftjflKg6QE=;
        b=pXsX6Wx8TJYNwsV3fCGnvtG0TaxVpBYVtQeVpj2GrAHqfWExlE1r7P8igRz1qZL6EG
         4483GyDSgpFN4uoNhqm3WkQpISOEJ1bEwvRb2N2gGFvaaGAy85zefspqagqc08sGK9cb
         P/GxjSYhtx2Wdixp3QwZjW1OG57VR6/e68EMBFLX+qQjvnEFCKRowPZ+1+UnYGfni6EK
         bXpUPsd6iAQzH6crt9o/SbJ024bhsZEpqZa1yGMNjiPOacFb+KpLcUKhWCkPDbqqnxHI
         HhRbqXchpnzQ+Q15rutx+LKLRz2/FH3ajiGEVt27ZIVwCn1q6e7f7iA+Dbc/r5/4/4Gs
         FiEw==
X-Forwarded-Encrypted: i=1; AJvYcCURAFN+5TZzsZrWrHnUyiGzX1Pb8LVFdznOIILkbgC0yPo59kCtbAuWje0VohnIlwYzrH6cUxjSNDbSyxP9Kw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzhZoDl7qSDmAReDMlJi/Hlba9SGPC9NqKGr+b8fNB4ncV5PV3Z
	TiYhzIQ0gR2Ch+gJ5FUUcCuflZPFj6FPezNhrrg6jabn8ZIiTlwg1dXZwUJ2LekMIOQ+VEFiMJw
	zwQ1/CPPQ
X-Gm-Gg: ASbGncvAZDzZg+r0wf1orBW0Ct2CMcVwewQJJ8Uuse5WdbHZo4OwjygmEOmk9RsB0DE
	lYKEUzyNSKZ502n0qnZgufcNYxGSEVKRvzET6KmfgNTI6no3zEFwy8zvkMs+EeeHFz0514EiIn5
	mzEp4BtEcEw74hrDT7QtcrmmM+05fRx30OlygIojuz690zD0JVutnIdZQN4fFSGaW1P0wIl/K9V
	vG33WAp7BorICCNLMERkz1c9RFem6BroOviGvVGSvZuAQwVCHM1zOYUETbhdS0M5Xt05M7BaIlk
	iRVDhGV+PeUCJhnXBYbbXC/UnTg0yJitofO/MN4EDw4/rE1MhrPxaiQFsCFhigDTZmz8v1EJ2I/
	tFneX76oBB6V0kT96WyP7Slqox3ynbrRUluW/YqPq2ySIUwcewHer+77Hu+GNm+Zeq/X/8Zh6fU
	f8l3Ns/E7p58V2ZusSSKavKGI1WyeDHXquewKn6ob2aCXY13jM5w==
X-Google-Smtp-Source: AGHT+IEQByXwBjUBxwzW59hYjLKthAVV6UKb1JIc5FuLxv2aO8aMYU1yaL8WtWp/4nxsxVIZT5PiUQ==
X-Received: by 2002:a05:6402:270a:b0:641:9aac:e4a9 with SMTP id 4fb4d7f45d1cf-6453641111dmr3518915a12.15.1763654755853;
        Thu, 20 Nov 2025 08:05:55 -0800 (PST)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6453645f2easm2324841a12.33.2025.11.20.08.05.51
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 08:05:55 -0800 (PST)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b72b495aa81so140118466b.2
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Nov 2025 08:05:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU4FRISAQTwK2pR8IXodgJ+GO4wPeMZVSjocZkzDxBNaJI1NFWUtYkGS2y58+cSgpr8V6mr2d2FgmDztaxTuQ==@lists.infradead.org
X-Received: by 2002:a17:906:dc8c:b0:b76:23b0:7d70 with SMTP id
 a640c23a62f3a-b7654ea998amr379971766b.39.1763654751460; Thu, 20 Nov 2025
 08:05:51 -0800 (PST)
MIME-Version: 1.0
References: <20251119085354.1.I1ae7aebc967e52c7c4be7aa65fbd81736649568a@changeid>
 <2025112007-quit-enable-3fa1@gregkh>
In-Reply-To: <2025112007-quit-enable-3fa1@gregkh>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 20 Nov 2025 08:05:38 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V7jja=CsA4QyrGNHPKbSb3wfbLbhET+j01cUeuZGSdsQ@mail.gmail.com>
X-Gm-Features: AWmQ_bmHJc4rIzwwFhnOnl9hbzodCqBW9sxgLfvryl54nq-vWqoNlY_oT15PM_w
Message-ID: <CAD=FV=V7jja=CsA4QyrGNHPKbSb3wfbLbhET+j01cUeuZGSdsQ@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: btusb: mediatek: Avoid btusb_mtk_claim_iso_intf()
 NULL deref
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Thorsten Leemhuis <regressions@leemhuis.info>, incogcyberpunk@proton.me, 
	johan.hedberg@gmail.com, regressions@lists.linux.dev, sean.wang@mediatek.com, 
	linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_080600_372262_0EC230E8 
X-CRM114-Status: GOOD (  10.46  )
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

On Wed, Nov 19, 2025 at 11:12=E2=80=AFPM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> - You have marked a patch with a "Fixes:" tag for a commit that is in an
>   older released kernel, yet you do not have a cc: stable line in the
>   signed-off-by area at all, which means that the patch will not be
>   applied to any older kernel releases.  To properly fix this, please
>   follow the documented rules in the
>   Documentation/process/stable-kernel-rules.rst file for how to resolve
>   this.

Sure. I'll send a v3 with the Cc to stable added and collect
IncogCyberpunk's Tested-by tag that was given in response to v1.

-Doug

