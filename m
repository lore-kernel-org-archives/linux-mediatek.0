Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE0FE81816
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Sep 2023 04:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dYClnlSGRE/VVPHFCk//gM0X3MtjPFgRACsIZo27ba8=; b=rlEalZRyw1f6lNA0tRGL+4dAeQ
	kcf4mQ+5syvKVfk11HRFYccxEdnQqobxjm7sVjdW+gb7rxczf9+YKmQJQ1JgHDrqaQ5nEFk1tnyER
	cCVeP+hJDaNQ2IbPVdGzuS+YxbBjoaxwEKdSJeZjKbk2NOqTlU6uvQ5URTxnrJ7G/cakijv84tEPP
	V1wm+RTrZ9A58I6cKeEkM/bfowe2KqPu1XW0JWX7xhaY4YrE08V79IeswJdS20+ygqBiLCKw7adXF
	n2r8aNOB6g4IL4m0rGTXt+mNFyjnhuz/HOm1ayAt/vI21psKQlXi5vWZxVaR/eTRA5+KIS8HKpUCU
	2blpx+bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkzFq-00FW12-1B;
	Tue, 26 Sep 2023 04:00:58 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkzFo-00FVzy-11
	for linux-mediatek@lists.infradead.org;
	Tue, 26 Sep 2023 04:00:57 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5041d6d8b10so13057279e87.2
        for <linux-mediatek@lists.infradead.org>; Mon, 25 Sep 2023 21:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695700852; x=1696305652; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dYClnlSGRE/VVPHFCk//gM0X3MtjPFgRACsIZo27ba8=;
        b=dd+lyDH7stJULefJsRSFx1Ik0od85CseJoBEru/9FrzNBSZXwGHEyXiXOn7h1g2drc
         Xr6KN/BS1qS51dVufYztuv9UO+i9m1LnZ6jfQPorSh1KDnFmucBXgaRrzSux/5y2+ePj
         RR5wVvVKyOVCh6NTNAjt3qZFfTkBtHLdzhTqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695700852; x=1696305652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dYClnlSGRE/VVPHFCk//gM0X3MtjPFgRACsIZo27ba8=;
        b=hY6cLG5CE+8BxmXDq+OOV2nZSb0hWiOnf6p996e+GGUKfT7Fv4amj83OXzD4rleB0p
         gAMWZ8zHRhnxyxoMjDOnYiassPuxeLzgX4RsoHnZBRGrq5KO1dK/GvCskN/67QnKc8zT
         MpQ39AXmjOokYxGykQvhUh69SZNMI+HEzxI7EXygrYQLaXx6low25FspzL6GiHWkq8Ri
         C3GNHnijVstutd2UoWZPCYmCOV4tcmYqbgropJchPA205n8+8ADvUt25ErrGKB2rVFBR
         ubwIEUSnlwE1Mcq+usoawk0PNyk1XdsBwbMaF3TG+QDzDtfRULdhHGIDh/VCXoSrKxiR
         oAag==
X-Gm-Message-State: AOJu0YzoV1IaYQ2KIYNrXrLFfM60JPknd8d0bNwvgD8AdY5Qb3TlB+lk
	GbWShD/4drmEuQ1Q5v+82y523Zw7kmuf6cnlShhUwQ==
X-Google-Smtp-Source: AGHT+IEtkTctsf5HbOONUd8gTf3/GdExf1zf0JDg4leCj0a9OJM+OM1FoXuuppkPECKOTlmyKr+PorFc6IG0rss5xr4=
X-Received: by 2002:a05:6512:3995:b0:502:ff3b:7670 with SMTP id
 j21-20020a056512399500b00502ff3b7670mr8220870lfu.4.1695700851585; Mon, 25 Sep
 2023 21:00:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230921091057.3812-1-duminjie@vivo.com>
In-Reply-To: <20230921091057.3812-1-duminjie@vivo.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 26 Sep 2023 12:00:40 +0800
Message-ID: <CAGXv+5HFsLxVqoUsa4BAC8waq=hXoh=4sdXxSmFP1vB1FhnsZQ@mail.gmail.com>
Subject: Re: [PATCH v1] thermal/drivers/mediatek/lvts_thermal: fix error check
 in lvts_debugfs_init()
To: Minjie Du <duminjie@vivo.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alexandre Mergnat <amergnat@baylibre.com>, =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Balsam CHIHI <bchihi@baylibre.com>, "open list:THERMAL" <linux-pm@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, opensource.kernel@vivo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_210056_354529_2EEB3CDA 
X-CRM114-Status: UNSURE (   8.84  )
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

On Thu, Sep 21, 2023 at 5:11=E2=80=AFPM Minjie Du <duminjie@vivo.com> wrote=
:
>
> debugfs_create_dir() function returns an error value embedded in
> the pointer (PTR_ERR). Evaluate the return value using IS_ERR
> rather than checking for NULL.
>
> Signed-off-by: Minjie Du <duminjie@vivo.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

