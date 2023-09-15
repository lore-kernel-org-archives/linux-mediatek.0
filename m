Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 853CEEE3F01
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Sep 2023 05:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xn9oFhHLAknaWRf3uArqHTLA9prBJhnE4LW7Dd164uA=; b=lljTpxOdxqIe8zaPllNmpq1Uk3
	KBdEbgDzUcrJ0mfdAvHcb7H1UHfIKoj2SNky2s7Y8C7yArcOVxHYSGa42O5tq+NMqwbuWSY2kDx8f
	LsowOjYHRHNwa0h9rdt5ZleemeOwdY1LAQUdSN0gLZjMcjYowYKnotAPLYmDikRN6HWuDGibEf+w2
	UP6W9T4iv95TCq0fbYZasmdzvQODp/csCUlzC5mWj1yoqbfov44tlQnoK/MhdCaoElKpSSiXkQQvY
	Y70+x5D/VsI2UlRuJH+9G6ozkNgtdhEs+S5QLob/NJcJmZFXf7q3WJSLhfJOXr7Q9HIbDIeh5iEGt
	WkZhcxhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh1NN-009nUK-2D;
	Fri, 15 Sep 2023 05:28:21 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh1NK-009nT5-2D
	for linux-mediatek@lists.infradead.org;
	Fri, 15 Sep 2023 05:28:19 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-501be2d45e0so2960938e87.3
        for <linux-mediatek@lists.infradead.org>; Thu, 14 Sep 2023 22:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694755696; x=1695360496; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xn9oFhHLAknaWRf3uArqHTLA9prBJhnE4LW7Dd164uA=;
        b=l9smrCGhxf8JT+3QZ9w4nsHYdviRbcG4fTbMFcmZoYz6JeNkL3BbhWB92w+TL5UvZL
         wYRoVYVNQsC3iDHsl2IEsxMjFvAslTc//DNtIyFEl0u5qWJRS1EIX4/bLghDm3eDASjY
         PZ5tHiAp3MplyUL8JXWGSgrp480emkRqw7Sy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694755696; x=1695360496;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xn9oFhHLAknaWRf3uArqHTLA9prBJhnE4LW7Dd164uA=;
        b=sfWeEwqKVkty3v+/0r417lxBiKk7jgiYC/P/73T7AogMoOHp7/qr2+3OTaasngdFy5
         6Q0UA8tBkUVwAH0gMhuyZv8Xe/T4JKi6ciEMp4J8e5Y5OfR5NlsKUgWJVlgec3M0Dn+m
         4Tg/PNO17jEHEo0E+hSR6o7lBeRNAniyud0G94DoUCbd8LXfNARoBFcXH0JeDo43W+IM
         APd65df60nNwGJ3E4vQFUKNwN7qQSdTfx/np4KjYxfG4F6xO0wL1Hhoxh/gDIxq+ZthY
         Ojod1C0bzZ3qsk0nJEQNnNiNliUmrQ/T85U/qqnfgGj+GSVynarlgBCFWhh+4znzbrHZ
         apzQ==
X-Gm-Message-State: AOJu0YwTsuzNeP8SV/lTLzmvpj357Ak/dFBGyS8K0ZYqCynthskcBUSL
	syyZRxVY2w4lUQLeaIDPJ6+IU64SKMMty+OgmXg9tA==
X-Google-Smtp-Source: AGHT+IHBF/LZiSOCHbF9PK/ZZsZw9DLkRfLiviBg8ZInp/Df/pEH0sQClGR3SSNslHwvIhnE/oLD3Fo+uCtKqC7O+9w=
X-Received: by 2002:a05:6512:48c9:b0:502:d639:22ed with SMTP id
 er9-20020a05651248c900b00502d63922edmr518597lfb.48.1694755696091; Thu, 14 Sep
 2023 22:28:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230914131058.2472260-1-jani.nikula@intel.com> <20230914155317.2511876-1-jani.nikula@intel.com>
In-Reply-To: <20230914155317.2511876-1-jani.nikula@intel.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 15 Sep 2023 13:28:04 +0800
Message-ID: <CAGXv+5GJxEobJKKWuc_UN+Gf_z8g6eb6KWTz-L+RqtyLYKK3Jg@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek/dp: fix memory leak on ->get_edid callback
 audio detection
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Guillaume Ranquet <granquet@baylibre.com>, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Markus Schneider-Pargmann <msp@baylibre.com>, 
	Bo-Chen Chen <rex-bc.chen@mediatek.com>, linux-mediatek@lists.infradead.org, 
	Dmitry Osipenko <dmitry.osipenko@collabora.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_222818_720899_8488C500 
X-CRM114-Status: UNSURE (   9.20  )
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

On Thu, Sep 14, 2023 at 11:53=E2=80=AFPM Jani Nikula <jani.nikula@intel.com=
> wrote:
>
> The sads returned by drm_edid_to_sad() needs to be freed.
>
> Fixes: e71a8ebbe086 ("drm/mediatek: dp: Audio support for MT8195")
> Cc: Guillaume Ranquet <granquet@baylibre.com>
> Cc: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-mediatek@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: <stable@vger.kernel.org> # v6.1+
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Looks correct to me.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

