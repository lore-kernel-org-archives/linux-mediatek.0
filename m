Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAA2DC61DA3
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Feb 2023 10:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fWSr1WF+X5T1bZtRLI9WjKETwvN5uS3RGWAESXIiZkc=; b=WOOPrQGAgV7BS3uZVsr8Mj8TYA
	eQIQEDjgsItk/IT4ZUAJtvaHz4M0OLbjHLBBc+Og7YItJ3zlodfxslpyzfW1tgeR5Na6Peo1LffwX
	g4veeR97bXtu3juyzPkDyFI6rQJKX41PjWHATHQw0rknDV8jD5WqwRtZ16Z0nrsNLGc0IVJ+64nDt
	nXpqo6gxR0uAdCm4O5CxQtncNs2B+5Tjocy9Vy+ndZIpMBi0Uy6Wy73t157RdIckdHtoAY8Uh2NVd
	Fylx/xHtpOORV0yFXEHWNy5wiQSHAbNPvC22v0ES8LnHNTlqfooxZXGbG37MYj11PdoKN3s82Cpz+
	4baG30eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVV13-001tiz-Dj; Fri, 24 Feb 2023 10:09:25 +0000
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVUyt-001sgF-Mu
	for linux-mediatek@lists.infradead.org; Fri, 24 Feb 2023 10:07:14 +0000
Received: by mail-vs1-xe36.google.com with SMTP id x14so20738335vso.9
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Feb 2023 02:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fWSr1WF+X5T1bZtRLI9WjKETwvN5uS3RGWAESXIiZkc=;
        b=UUU7+bf1J/3YQBp6q6nn/9f8+qO3i7FcyCZ5pfWBkKha/NZXBKkX73onQyAu04YtLv
         sNveM4/KjxWln/WNJVDs3rarZm6abxHAKAXtxRLpDdvd6rLuwaIvm8XDp16rkL0/juCO
         hSwu8oY8/mAEtzYe5GoLALOvh3yqoCNBgp0eY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fWSr1WF+X5T1bZtRLI9WjKETwvN5uS3RGWAESXIiZkc=;
        b=o4wdyj7DEqUE01Jv1ET/6IkPJp+KZ4H7PMMBean5RW81wyDx4FpirlvfJyyHeZPTMM
         fq8TLR3dE8cjsmm5W6qBGsarP6XuLlGgRtrEvBannvVbmuYBjM0MtF/gA9I26mnE/YFo
         DziSplPyvdvuWHpkCwZYzMfkKYAkYwQOo6SgoEsl5HH3UYf1IAQd0lUdQiX7CFXIlXhL
         coJQB+sClrG1OyiDssU+1+hwBeSVAiApd1iNV856M8rx4pPwr8JB6tP4zpf37LjC5Df1
         JXBcisOF352tL7qVf5587r+6ehCAuqhA1GEcDA359LrlH8aypNtz2AUbFVeY/AbG8sxa
         SOlw==
X-Gm-Message-State: AO0yUKXtaXO3Bm0qZ6qEHV8j7Ja+Rnsvzbt/NDzTr3Qpz2jg2+EFAZEz
	XunUEjUNIVyXk14tgqyGU12IVGAYVb0Ky+CJ6gNciQ==
X-Google-Smtp-Source: AK7set9aFwqpGWSWGfjbGo94cuHgKCgr2GvFvM/OzPybEBs7N6ZOfs/1hkngTYdnrZMb9EHV3N7v5C4YswmKg6wznE8=
X-Received: by 2002:a67:d21c:0:b0:402:999f:51dd with SMTP id
 y28-20020a67d21c000000b00402999f51ddmr2215538vsi.3.1677233228403; Fri, 24 Feb
 2023 02:07:08 -0800 (PST)
MIME-Version: 1.0
References: <20230223133440.80941-1-angelogioacchino.delregno@collabora.com> <20230223133440.80941-7-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230223133440.80941-7-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 24 Feb 2023 18:06:57 +0800
Message-ID: <CAGXv+5H6xUZEg-rtL4Q4BvJXtOD598MHyotG4CGz3_yEy9oX-A@mail.gmail.com>
Subject: Re: [PATCH v3 06/11] dt-bindings: gpu: mali-bifrost: Add support for
 MediaTek MT8186
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: airlied@gmail.com, daniel@ffwll.ch, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, steven.price@arm.com, 
	alyssa.rosenzweig@collabora.com, matthias.bgg@gmail.com, robh@kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_020711_765840_562AEE0A 
X-CRM114-Status: UNSURE (   8.11  )
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

On Thu, Feb 23, 2023 at 9:34 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> MT8186 has a Mali-G52 MC2 2EE GPU (two cores): add a binding with
> two power domains (one per core) for it.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

