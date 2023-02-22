Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F284C61DA4
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 08:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tlzo2IJo5C30mjLFPDclNhtFd2xIEgosfbXcJe2YvVE=; b=y2Z3/3Q4J2U0zM8sSNvK7Ifh4R
	jfhWaKYrMeb3JaTDL7MRqG27F1duD0iMPQsiHlviudDUy5Lzc2lYo4TA3IqJYX9kxa86dDwYMbyFJ
	96CAY+GMlIjkljU+1fznRL0ZBQMtasPgX6CD0Q+42nB6smhMuhe0uHObuet+bNGkyWqS53rP4H5vI
	ylSt7Bt7HE9ydDp1E6DWKws2kHJtT7kH3mhCjdYgYDeD08MkRs4/xK7uDpwzocwb7/Uz6+njTkzXH
	R9qEjZA74c1xjbFIuOJ5UC1xRmARFk0VFuC4I02QYAS0W8PgIfN1fdCafgqHl8qygGJ3OSJ3YMMf5
	9cJnYAAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUk4h-00B9uv-GB; Wed, 22 Feb 2023 08:02:03 +0000
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUk4f-00B9sD-4F
	for linux-mediatek@lists.infradead.org; Wed, 22 Feb 2023 08:02:02 +0000
Received: by mail-vs1-xe36.google.com with SMTP id g12so9420176vsf.12
        for <linux-mediatek@lists.infradead.org>; Wed, 22 Feb 2023 00:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Tlzo2IJo5C30mjLFPDclNhtFd2xIEgosfbXcJe2YvVE=;
        b=MeWMKnUvCa5h3wnNxrVJwgGjMGC7euso+9Epxo9WZnMC3zklZnUMAdZ6JmNt6tv94J
         wnGbHnAcop4UQ5kLLD/AngU8vKm9bLOO7c19mmm5R8uwYNy7xW8gjJozc4V+7pdANJmi
         Me6WFN7P7gptD+fkV3vqzODRL+tt7nUGbDd3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tlzo2IJo5C30mjLFPDclNhtFd2xIEgosfbXcJe2YvVE=;
        b=4BtpYmB3Ex2znM+g7gEmDOGYzsaoSxfT1aU9RGuNiOj5xMCq14kqq0NvE0pw7cP/jh
         321XkZUJ9DBZmiu/wuYIXgyMTe+6BZXcFFJ3TdyOTUcwwefiLa2g+FO3RjVEQAaCmGJ1
         MdTWvWYO1+WKIbGAzsgw9PRHzZZH9X2KPoNEXjWTdrK4+sJ4e2CzhXjpeJCHMgmjAvS4
         MdsMbd8KoONvYuOy2ktSJStBJBPoYt0WlIljTdwN+ime6ozqshGaWcnxWoRK/z4w3rrw
         Q2oXhRNMC1eCZSBaQVYc7F9XguPdLXwYmWV29hpiI7QD3PK+7WevT/RhTI26ChJmLUIL
         ub/Q==
X-Gm-Message-State: AO0yUKWzWk6tvvsC06dz3xXN0e0e2mCIfW+vnW14TwPsocbPnQVt1+NB
	mc5uozzeTDt13xRAnwrBvO1d16XpHj0BfJB08hgVow==
X-Google-Smtp-Source: AK7set/K733MxVsNaWaZ582QR4RHXcNoi9G2ZoQ2+vNsIwgFsMxrfQGCDYAD5F2km2PqCut/v0ZaIlykDJA2RFfbm3I=
X-Received: by 2002:a05:6102:570b:b0:3fc:58d:f90f with SMTP id
 dg11-20020a056102570b00b003fc058df90fmr1556381vsb.60.1677052917662; Wed, 22
 Feb 2023 00:01:57 -0800 (PST)
MIME-Version: 1.0
References: <20230221153740.1620529-1-angelogioacchino.delregno@collabora.com> <20230221153740.1620529-6-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230221153740.1620529-6-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 22 Feb 2023 16:01:46 +0800
Message-ID: <CAGXv+5FJ6ze5tECGMoJT3yALDoSkshQPj0dUy_KwLJoWo9AYCg@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] dt-bindings: gpu: mali-bifrost: Add new MT8183 compatible
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: airlied@gmail.com, daniel@ffwll.ch, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, steven.price@arm.com, 
	alyssa.rosenzweig@collabora.com, matthias.bgg@gmail.com, robh@kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_000201_189751_EF66BAB9 
X-CRM114-Status: UNSURE (   7.59  )
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

On Tue, Feb 21, 2023 at 11:37 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Since new platform data was required in Panfrost for getting GPU DVFS
> finally working on MediaTek SoCs, add a new "mediatek,mt8183b-mali"
> compatible.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

