Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E2D4C64ED8
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Feb 2023 09:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hy9qFm6Se/EXdsfdDRuKKStMA9t1Y7+V3hdvzyTdE1k=; b=40pDS1SLpeDNJXN299scCjUYGc
	wRiFnh+ajz3OPuC6ZCw/vGr2owtSOneg0DyqbY4z73KbnRDMY1kLZf0J6+yRLiZeZhuKP29Dn3m9T
	O3ReT77wuoL5RmPCSlmE5FdlsP/g27uiDMbT9izvWHX+oU7GsAGZk2jQSU2ocQKKyPZ7PMajxX3Ya
	+U+UGYz3/kuvHLnanqvI6TVKnIDNFm0eIQwOV4D90aTsyRlxdOdde1zMglr6qMubi7yi+Z5JcdaYt
	y5n6AJKO07lA2ht84PlB29KyFyDQx/oO2j4hG3E65BOOCogZMgykNNf+DNKgRr9FOlUwhAHDF7dez
	taUUt/ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVUgp-001kHi-6m; Fri, 24 Feb 2023 09:48:31 +0000
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVUgf-001kEH-Px
	for linux-mediatek@lists.infradead.org; Fri, 24 Feb 2023 09:48:23 +0000
Received: by mail-vs1-xe35.google.com with SMTP id d20so13109801vsf.11
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Feb 2023 01:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Hy9qFm6Se/EXdsfdDRuKKStMA9t1Y7+V3hdvzyTdE1k=;
        b=DXKueC8GpWCpoaUHhYn/VQVDrlcC5bBvGx9yUjyrIaUxjgH/nZgFkXAlDhhIM4Rk1K
         fevzB1ccqZoM/IEbncOZ8uRBzbikbbjGgp4UmpOZmrPCgcJLJ2UXc5ibkBAy4ieK7itq
         7R5kC5Dod5amnYLIoK+eRQgN2GAqgId8oG5es=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hy9qFm6Se/EXdsfdDRuKKStMA9t1Y7+V3hdvzyTdE1k=;
        b=5wxhEphEutHJf9KlRzqATIg906xnSaUIwFqiGu3XNkZtRmQ0QIt7sQZcjzUPC3aTnN
         UGZi11TIM1IYqKjnPawVHrJQCe5SkqN4unKp/9hE2mmojRVEmGqxEJSbHlyBYBqmG4rQ
         i3KUfXu+ePgX0N/C93vH7sb8jreafOpDPDYEw2p4AFkrM7KY4mIkV+4APchORHYjEMTg
         eHzxJ44DDhiez7kpAeX27rhkevNLKvEQg5wv5i+XGy4qRu0EHtAetVt8h9AX4w3Ro3If
         Jld4knDd1c3rWyEHFwSK+6MWQYzkcjt5kVmMMDUJosHMTKqchdfkndsZfuJZFxNo2E8/
         KB2g==
X-Gm-Message-State: AO0yUKVpOp7L8hiCs81S1nTNp93Ny7zA5a8M9/JVTV3whUVd3zOtyBLJ
	kCJy9YtSSF5iALdKv3oUcA6dL7qLfQFVMxxsLb1dvA==
X-Google-Smtp-Source: AK7set//leuBbGapBBCZqdtVWTRR+//pDwfT2YEJmSKyJPphUPRuePVjrJm1c2+unUfCTnRY/OH4DOBdzIniPgi5pX8=
X-Received: by 2002:a67:ec11:0:b0:411:c62b:6bf0 with SMTP id
 d17-20020a67ec11000000b00411c62b6bf0mr2046072vso.3.1677232099910; Fri, 24 Feb
 2023 01:48:19 -0800 (PST)
MIME-Version: 1.0
References: <20230223134345.82625-1-angelogioacchino.delregno@collabora.com> <20230223134345.82625-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230223134345.82625-2-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 24 Feb 2023 17:48:08 +0800
Message-ID: <CAGXv+5G8dkV-Po+960QeqMVUj6Sp7a08LYLitorWOWN=MhNKhQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/16] arm64: dts: mediatek: mt8183-kukui: Couple VGPU
 and VSRAM_GPU regulators
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_014821_845709_999D9E1B 
X-CRM114-Status: UNSURE (   6.43  )
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

On Thu, Feb 23, 2023 at 9:43 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add coupling for these regulators, as they have a strict voltage output
> relation to satisfy in order to ensure GPU stable operation.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

