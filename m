Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA7D4E77187
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Dec 2024 15:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kP77otwR85pohU1u8v+U6/CSHDJCnIQRrPv+NibxSx0=; b=zLEZZFz34GNr+UZkW5O/nWLf7z
	roMYgUI9tnnlZNuUewqgoe9opqw19j4PzG1Ynuq9Xkt9O59sC2nDkmxyzfLek71oprucf8zb13mFK
	2OOQojAKWm2wePfDop7xh+rnt9/zmQO5PWbUcDdGZMT1uVS0ATWkhhE+Sz4tWe1un8ueFrMVDzLBk
	QXa16teCv6Ej9smpqsmh3j/TfOklC79GB/qnuZ35YvGnsa1U3lLBf8qjUbrcydWnQFFwoT4GKDdZk
	X4VLImSSRxQvzvgYgOEsRBXXJ7Kw3TuznYrLsUudm5qsNtbBOxKqo7UnCCoBwdQaciPFPiOHCaBQ1
	w/3OA7uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNwQ2-0000000H6v6-06p0;
	Wed, 18 Dec 2024 15:57:02 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNwOw-0000000H6jm-0jB2
	for linux-mediatek@lists.infradead.org;
	Wed, 18 Dec 2024 15:55:55 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-6ef81222be7so63374247b3.3
        for <linux-mediatek@lists.infradead.org>; Wed, 18 Dec 2024 07:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734537352; x=1735142152; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kP77otwR85pohU1u8v+U6/CSHDJCnIQRrPv+NibxSx0=;
        b=qjolgfQYhBZavTvrVdFLNMiJLial72x2r3C/SPE7twsnzXp6SaZpuY2gouSOjTUOf2
         48aCy1ovcUW24JAtkWMEuPteM6prWVjHwWJYn+ZIv/idy7sTzJNZps2QmIiDYWJOnz1j
         wvQLRWd5l4x3JoUsDthmwkThfdwJC8mImkHbgXv44Wg1FvTvVKIb1cBgegMiGfbbY+91
         lAvq7znVJi+pkfuerjaQ9Sqe5bBd/GLfvJfsbt6buz3DhDvr5zxh5vGh114BR+RMUePn
         F85btDYXDyOJqGM1C8ZEYd4lIyCqx8rfPXVs0KxxHnVgimMbK2YLUQFHl3i1t200cZeZ
         mSTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734537352; x=1735142152;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kP77otwR85pohU1u8v+U6/CSHDJCnIQRrPv+NibxSx0=;
        b=kaPhEly7XPUqWUTDp5QfdZJaqWXw08T4XcphIB8t3sC5tX2pYaTsNwlR9HerRk+eIT
         hMAY5kzqYLx+dflUj7DyEbDJylrh6JiU5UKlfkF5rHssfrM4Ay1YcDC40NGhAia6ojOZ
         Ul8hY60GQx/HhowWx2RBirSZzodDIQOk/tlAZKNVZKFwBzDvpWhS4vIC3DxVQW81itC5
         eoaFP8EtSBPBGPyEW/damyDHIRgCZ40cLYkdDgYR6I+ifs8qWLRwlzD++wbhKE3zCdfm
         TrwUwyY4IXnlQy4Qv2+cTH8jM8LCsELvC6PJn1482u+1H+O8yhKBNSbvY6zghN7P0RxO
         5QWw==
X-Forwarded-Encrypted: i=1; AJvYcCXqXbTGKACkKTmKHYyHAf7a5/laZza/ScDbefDs69YjvKbmI66Ar+gkBY/KhCWkGN9j4PoZ4o+vF2EdhPpFKw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwFJOMcVWc3ACNwDzlzwFS7lPD8EhhsLevgNc6w/7memGF/ERgD
	tLun0t/vUTqw/sRewK+7+O1RbTGO68uU555iM7HrmNHac258NDe1XcQI9zd0b/EGrykkZTmjNYq
	Vu7mgtBSTsHIz9bnHpPjAIjh6sJIPVMHk/tloRQ==
X-Gm-Gg: ASbGncuxYP161vOhsvKQnLkGSDI/AqkLXScIhPUwvPlEB2zHeVuGGuXgDo92Gy3jBBa
	V7zxik/4GqvHK70WE2dEaYUJhIKWOq/Wo3vJSbHI=
X-Google-Smtp-Source: AGHT+IFcDjIyutnN38PrfueeZkhwflHd2lPy0n6+1NpWzd1eHmYno36KM7bQpYPz6FkOWtp55zLwUusqOGk7tdB2RlI=
X-Received: by 2002:a05:690c:9a8c:b0:6e9:e097:7191 with SMTP id
 00721157ae682-6f3e1b30fe0mr1408447b3.9.1734537352351; Wed, 18 Dec 2024
 07:55:52 -0800 (PST)
MIME-Version: 1.0
References: <20241210073212.3917912-1-wenst@chromium.org>
In-Reply-To: <20241210073212.3917912-1-wenst@chromium.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 18 Dec 2024 16:55:16 +0100
Message-ID: <CAPDyKFrJYvMvBby5mhOAsyp2_Dx+KuOEnGaELMydKBHFcyO_VA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] mmc: mtk-sd: Limit second register range to SoCs
 requiring it
To: Chen-Yu Tsai <wenst@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_075554_209018_D3CC0AE8 
X-CRM114-Status: GOOD (  17.64  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Wenbin Mei <wenbin.mei@mediatek.com>, devicetree@vger.kernel.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Andy-ld Lu <andy-ld.lu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Chaotian Jing <chaotian.jing@mediatek.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 10 Dec 2024 at 08:32, Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> Changes since v1:
> - Added MT7988 compatible string to list that needs second register
>   range
> - Dropped comment about uncertainty of MT6779 from commit message
> - Picked up Angelo's Reviewed-by
>
> Currently the usage of a second register range for MediaTek's MMC
> controller is seen only on a few platforms. However the driver tries
> to grab the register base regardless, and then ignores any errors.
> This makes all the other platforms that don't need it produce confusing
> error messages.
>
> Instead, make the driver only grab the register range for platforms that
> actually require it, and correctly handle the error. Also fix up the
> binding so that validation of the "reg" property is as strict as
> possible.
>
> Please take a look.
>
>
> Thanks
> ChenYu
>
> Chen-Yu Tsai (2):
>   dt-bindings: mmc: mtk-sd: Document compatibles that need two register
>     ranges
>   mmc: mtk-sd: Limit getting top_base to SoCs that require it
>
>  Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 10 +++++++++-
>  drivers/mmc/host/mtk-sd.c                         | 15 +++++++++++----
>  2 files changed, 20 insertions(+), 5 deletions(-)
>

Both patches applied for next, thanks!

Kind regards
Uffe

