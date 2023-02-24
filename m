Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 444A3C64ED8
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Feb 2023 10:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cvk5wpFc0DKAQZ00qghhmUCCY/U6r1q0rqg+NhQNPzA=; b=2QOg9PwTHlDTfMFPsZzINdMXZL
	pMlRjmnc6O68/zyTLlEx1cnvVfuE8sxtJMD020j348fI56UJvApOtg7yCkljkwGGsC7xmM6olbu10
	kCcrJzvMxxH2toFISPM20qdJfi1zDn1nj0F1xWmUMLnnXJd6TiaDDT7ymrcbF+G6GAX6UWk4NHRf4
	Hp/nO3fER6pOKaYnnRItbJBrYvB9W061w+tfrJstbWS+dcXUceha+a7n2jz+1SIM432ko4LaxQyaB
	8lPXKjBZhQJaReEQLWF/FK4/s/eWyk88lp2J65dJ7Fbpq4YbhKVCDQHN7zPyY27L79rmVlMERCk4v
	RbPPNDTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVUyN-001sQX-Fj; Fri, 24 Feb 2023 10:06:39 +0000
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVUwA-001r9z-Hw
	for linux-mediatek@lists.infradead.org; Fri, 24 Feb 2023 10:04:24 +0000
Received: by mail-vs1-xe34.google.com with SMTP id a3so7688990vsi.0
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Feb 2023 02:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cvk5wpFc0DKAQZ00qghhmUCCY/U6r1q0rqg+NhQNPzA=;
        b=cFMugqChQXL7ym79hnpjF2hy0qq6heDITVRFQzF1T1+HR4BxaalKvPgMUPnCRgc2zX
         K1aVXJYjdC2pMFkdGMfIO8PLYW8/FdHp58Gd909cvpu1zA9uWb65c/7iUrbp/K39tbWh
         kIyW+EGGp+t7Iq7ObQSH+ZZNR054KabiSeNLQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cvk5wpFc0DKAQZ00qghhmUCCY/U6r1q0rqg+NhQNPzA=;
        b=vJCPMZeURAlZs8KfD7pVOGTw/jzGhh5/dMFfMHbAqXIFtHapJjmp3s5nhwqagYHfDZ
         GP/4bnvYk0b39Vx62B+4BGV4XmP+z35ecZqZdPSJ6B8xjZCyK0J8vKamc5XH34aqET49
         QAxjLPoJXXSR68QulOkIMqStPZQ7a/R8NU1kqGfhAwmoweh/mh0qsWecCDutZjCVTDpi
         ZezjNazZBKPwkKP5l5XRh9LbA4bZmwtCpi4g8eXEXFWDJfdEtWijc/EeBVAZ5ud+OELi
         JS5XYUDNwP853i3ULHmOCLXIcd6B4IF+Q0/qGCL/YvTlI7rhGRpl4QQqT7j6PFfPAVqc
         sInw==
X-Gm-Message-State: AO0yUKXKcHaCG0Fovx2iQtBuegim+vrEecxYTOZebNUy6jokFN654X2X
	l8jPHLA7IYLt5sxaqrbJ7sO/vsSGqvP7c81k+PhCLA==
X-Google-Smtp-Source: AK7set8sv/uOez4Rc/C6TZ50n1VhpLKNUw7QlrbXGvX7eDuYw8eujWp0Kc33QvhtJcEfRx7ZMOIkuYwOnR4Jt0xVR7Q=
X-Received: by 2002:a1f:41c8:0:b0:404:d819:960b with SMTP id
 o191-20020a1f41c8000000b00404d819960bmr2200097vka.0.1677233059185; Fri, 24
 Feb 2023 02:04:19 -0800 (PST)
MIME-Version: 1.0
References: <20230223133440.80941-1-angelogioacchino.delregno@collabora.com> <20230223133440.80941-10-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230223133440.80941-10-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 24 Feb 2023 18:04:08 +0800
Message-ID: <CAGXv+5FV-Y_gaVNZ9s_9y+F5HLE799vVJ8bJyx-JZiPXhAFVwg@mail.gmail.com>
Subject: Re: [PATCH v3 09/11] drm/panfrost: Add mediatek,mt8192-mali compatible
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: airlied@gmail.com, daniel@ffwll.ch, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, steven.price@arm.com, 
	alyssa.rosenzweig@collabora.com, matthias.bgg@gmail.com, robh@kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_020422_661865_6E45FFB0 
X-CRM114-Status: UNSURE (   8.06  )
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

On Thu, Feb 23, 2023 at 9:35 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
>
> Required for Mali-G57 on the Mediatek MT8192 and MT8195, which
> uses even more power domains than the MT8183 before it.
>
> Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> [Angelo: Removed unneeded "sram" supply, added mt8195 to commit description]
> Co-developed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

