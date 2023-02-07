Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F1DDC636CC
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Feb 2023 07:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uE0lGWdZyaZYupVoOlPc1Zzyv3h7cBesFWJPqSmSYqY=; b=T2mGt1T6sHQYCjRihuhf9JzNd2
	jjcZPGjXxMi6pN38THAQv0r1s2KQtBHDo4aOmwHAeSbJOmfRekzSHTiYN8Ya58BLlZTQ/YmPJYH3r
	VCKcesR8q9CVg6/aM/psT4hbIKoj9ZYrJObDdv4glEw52bxfiJd2lx4pY3Byg3afq7deUt2wWaEpG
	T+feUG7WIYchmqI9VZbCfDfjEwQ5VymzPkYWhrrX7s61s5YgmvuCJ19Wk6Cl4HGvVgL37l9/OeR6z
	yIw2wKITzdKuhRx1jnFEph3k1/0TqOrf4QdZ/KwV06hwc7Wn8hZJEqG0fTQcDTfnzi0vley7Kn4l2
	f7Ci8XGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPIc5-00BAs6-Gd; Tue, 07 Feb 2023 07:42:01 +0000
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPIc3-00BAr3-3g
	for linux-mediatek@lists.infradead.org; Tue, 07 Feb 2023 07:42:00 +0000
Received: by mail-vs1-xe31.google.com with SMTP id a24so15377584vsl.2
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Feb 2023 23:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uE0lGWdZyaZYupVoOlPc1Zzyv3h7cBesFWJPqSmSYqY=;
        b=XkJJ3Db/SnE0rTwTjvm7kiwHg1jTNa6/sChwMPAfAoHFHUBcSkNQVW2wPOvDVvnUFq
         X4WtiwT4iCyATTTR2FnqpM0kMuRmYS4I9C5PDmsu+hDfgYN+hB6p8u8n8K6wRLLU6BXH
         Mb4iySy/MNNKv+ovIpmhm2orDnz8GsGELbSKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uE0lGWdZyaZYupVoOlPc1Zzyv3h7cBesFWJPqSmSYqY=;
        b=3Z3pYs55M8NRHW8YIzwt7JS97LSwT8aiqJpqKhKHuzzxhihc5t3QULXHPzozqri+3b
         01O0X4ic5LRL4zfdoi/VFwIjiEtIR2A8RpKBDCXNO9J8TTzt944ytujopF31eyjpKIPz
         OWd68NbkIJKpCPhvw3OXzWfyvbPF4NiUP0+W6Lz6eeWhq52KQTLkfYUrENDJGn9lSh42
         BPxw2ZTk42mTz0p+eOm/Q7C5QmGIuLRYNJf9Lx/yG0o52egCYrn7keAY2H6uiK1ocjOH
         SAd974CGukAqxZ/JexWXmBltTMZS7rW6X37HcX8NdLq/2VzQ/f9XelGGs0wQJECIOexA
         aN9Q==
X-Gm-Message-State: AO0yUKW9No6B769t9gaqSC4KTKiHn032GuRyGwYCyDjWTpUfhW7RONgB
	0pO2DaLpcxNUk3My790ZTAYG+LbDbQ9yyD+Q/UzFIw==
X-Google-Smtp-Source: AK7set+kp6yHndnEUWIKB4JnL60A6AS13GOVY3G3Vgsc9VlQgdDNPhv+dM/MOrBQx1MpjfxXUixa6oykjRd2tTyPAkE=
X-Received: by 2002:a05:6102:3d18:b0:3f7:93c4:9e56 with SMTP id
 i24-20020a0561023d1800b003f793c49e56mr598975vsv.85.1675755717868; Mon, 06 Feb
 2023 23:41:57 -0800 (PST)
MIME-Version: 1.0
References: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com> <20230206152928.918562-16-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230206152928.918562-16-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 7 Feb 2023 15:41:46 +0800
Message-ID: <CAGXv+5Fs+UtPgcjZXkhwBU=+HTv89o=xgk4cmsrFLB3FpQdNYw@mail.gmail.com>
Subject: Re: [PATCH v1 15/45] clk: mediatek: mt8167: Remove __initconst
 annotation from arrays
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, 
	johnson.wang@mediatek.com, miles.chen@mediatek.com, 
	chun-jie.chen@mediatek.com, daniel@makrotopia.org, fparent@baylibre.com, 
	msp@baylibre.com, nfraprado@collabora.com, rex-bc.chen@mediatek.com, 
	zhaojh329@gmail.com, sam.shih@mediatek.com, edward-jw.yang@mediatek.com, 
	yangyingliang@huawei.com, granquet@baylibre.com, pablo.sun@mediatek.com, 
	sean.wang@mediatek.com, chen.zhong@mediatek.com, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_234159_172039_36915DA6 
X-CRM114-Status: UNSURE (   7.71  )
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

On Mon, Feb 6, 2023 at 11:30 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The clock arrays are not used only during init but also during
> runtime: drop the __initconst annotation.

This should be squashed into the next patch, as by itself this one doesn't
make sense. That or the commit message should worded as if this is preparing
the drivers for the subsequent conversion to proper platform drivers.

Code changes look OK.


ChenYu

