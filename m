Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 410CFC61DA3
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Feb 2023 10:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fZDoDp9QuC05HnCUGFroZeageBxmT4lsXtF5GYcG4lI=; b=3/j3d486ok5J37MdQUzU3IrQ5n
	j8GzHuYZD//p51b35h3qv2XaudJW47vo0NuuAKJq8A9u9ldh6zGmZOV4foFbhmtSTJNxuXYcHviSh
	OwTn+NckemSwcGemMKvae9/NfHSm4QYCphN86LQxsYLZK1dOB7NSFlQhWI0SVMwNax0mzmNNRZQ3a
	zfIXDSesnFykObxiHt3BmpCAR6//Q7FSUcfQz5bLBNjhmCEq2J3eBCxnhh5CDoc9bD8WzE3KUa3VP
	Z6c4E7F0JT4pxVIGNKKdRt8LRE7W+w4cDQ2gxlSH0pWBFcF4WDRs5+zA62AOBBhPlRK318Vrd0SPo
	jTD0++Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVV1a-001tz3-KT; Fri, 24 Feb 2023 10:09:58 +0000
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVUz6-001smX-Uh
	for linux-mediatek@lists.infradead.org; Fri, 24 Feb 2023 10:07:26 +0000
Received: by mail-vs1-xe2b.google.com with SMTP id d7so15037063vsj.2
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Feb 2023 02:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fZDoDp9QuC05HnCUGFroZeageBxmT4lsXtF5GYcG4lI=;
        b=g7Tk0DyxLJiSdwQj9+fZ+JDu7VS9asBGyeJ8BDtDB6ezGb4c39EJwsNf12hbtzBpcW
         kQCKesuzq7DS6DYWn/T2ENJR5+RCWGak07fn29bUyWLKH3wxR3hsMK4tD1qMkNpoKvw4
         DaNPCEtiA7Weekw+ykdFFO3u6wj7BGzB52Xuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fZDoDp9QuC05HnCUGFroZeageBxmT4lsXtF5GYcG4lI=;
        b=I9ZZneQeVBkIE5TJY7iAgApmMldLugQFPO02XLlcV4w2WeeZojvM818zCGw16MpPD3
         kg1wal1EYepYSm/O7piGARqZJJLKuuRrUYL+i3TQjDSBDyaGepd5t9NWjldxz03ZDr5s
         MxU4e29KAzjt0/ncsko4w+wQq9deAnqmFQrcSHuvSFhxAlbK2ThvLzqY7EedZoL43jZM
         hQSZFEVFmY30rD3pSsjY/R4YevrEgVtC/lkuvzqfD5uTMaIVZ0BGED4B2D/DBwl3PCKQ
         YkY8kpaDdKECByI2qK6RB40u7WfK4j49F7aXlLG7UbRVpp1fSJ1RQBtJT2ecRx93rabb
         o5Lw==
X-Gm-Message-State: AO0yUKUSFLNAysy23kp7kvEKes/sxeI0VJroP+JqlKxfjsn+9kWvZlTh
	mNqOxZfeDQcjCDEOEol8vE6EtoxU5xqNNJ5jVVF+qw==
X-Google-Smtp-Source: AK7set9Z3KDRrAXUtzA44i2qVbV1BjyBQ9KHn9SH29kzn0sht9SZ+2jQRb5fBw8cvC/jRXKdcl1bHuaPLYsSWxZmYqM=
X-Received: by 2002:a05:6102:3a61:b0:412:2ed6:d79b with SMTP id
 bf1-20020a0561023a6100b004122ed6d79bmr2036420vsb.3.1677233243900; Fri, 24 Feb
 2023 02:07:23 -0800 (PST)
MIME-Version: 1.0
References: <20230223133440.80941-1-angelogioacchino.delregno@collabora.com> <20230223133440.80941-6-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230223133440.80941-6-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 24 Feb 2023 18:07:12 +0800
Message-ID: <CAGXv+5EftwRaS7EKEPRFimVminA3Je5Ot_QHBk-yqxzHcJkUSQ@mail.gmail.com>
Subject: Re: [PATCH v3 05/11] dt-bindings: gpu: mali-bifrost: Add new MT8183 compatible
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: airlied@gmail.com, daniel@ffwll.ch, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, steven.price@arm.com, 
	alyssa.rosenzweig@collabora.com, matthias.bgg@gmail.com, robh@kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_020725_004301_80758631 
X-CRM114-Status: UNSURE (   6.87  )
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
> Since new platform data was required in Panfrost for getting GPU DVFS
> finally working on MediaTek SoCs, add a new "mediatek,mt8183b-mali"
> compatible.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

