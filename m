Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95021C6379F
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Feb 2023 07:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yEsysSVdP9APPHINfBx/6hl5qqV1XS6eh2AICs0D4uM=; b=N1jZPlV2kX+dzZIHQwr8piCsB5
	iUFfmkQKFmlFVnhpJjtaPuFZtOBwdaZ0oD1TaSZTzxIrQG8L+gAF7Y8+JgbdIOYNN2VqJd8RV9syA
	3gx/h+LMhE8Yisz890cyLzTF8K39S7Z9P3zUi2kz3CyJsyY4v/ZS9qWf7y44QQh3LlGLiCOdecf1S
	tcLkfXsQ/UOuTF5A30m2mgsRIopAcBDzSq49UG8tuurQjbU1kqTv+2ZVTOBwlZ6Gs/s7+ZSCXUWwD
	/xcvGFkxojZtSs4FuCxIKuukAEElqSAW2cGPdHMjkww7b7n++erPx6SMsFzsTZBsze8PXMTZ4DPkm
	iytcMhjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUMpe-006qrO-Ax; Tue, 21 Feb 2023 07:12:58 +0000
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUMpU-006qoI-3N
	for linux-mediatek@lists.infradead.org; Tue, 21 Feb 2023 07:12:49 +0000
Received: by mail-vs1-xe31.google.com with SMTP id y8so2553697vsn.2
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Feb 2023 23:12:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1676963565;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yEsysSVdP9APPHINfBx/6hl5qqV1XS6eh2AICs0D4uM=;
        b=A25P4uxQE8wBG3G636S1q2+aUl/olyQCRf4NJKo1bLX2wwYXD8iLC4QbRq/t9170V2
         /LKCz5/t+oR3mw0UFfObs2RXCJp/roLc240TL00dkaTUS0STVi7/Sy9u6wCSNP8FS1ER
         DL+nihKO4Hn9T5sBZzhBhukAg+Gh6zEntL128=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676963565;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yEsysSVdP9APPHINfBx/6hl5qqV1XS6eh2AICs0D4uM=;
        b=JK+56aO1rmgWDDWNQaJ2in+iCYDoVqJXes5ghRvBMNWBWGzAORp1wlmaKT3kk72jW8
         vcSQ6EJGiarYkU6IPRQKT+LQz01RrT9AxGbIB/GyG8pQPMTO0hCfbd2AQAe85NDCfVrc
         Xhb6/iW+YvtQcmC4qRyAmKN2Ov/Tnkv18jmwJTUs/rTTj7DwI1Fo09yGV9XZHYN1tour
         1cUNIOhGijM6Lz30i6/rkVzALdgb8xTEukmxphwjV1JPFRjru/hlNyhUfEgQR5KGQ/x5
         gyAfGu3savnXngcQyeNaK0/fSDsTlHUA/gpe1Em9KwUCyILf1MvuJVzZ+CIaptzxF+qk
         gdEA==
X-Gm-Message-State: AO0yUKWRkkJmyVa/Wg2xRzuXhUVlDqzT4YnaLeyJ08NnY6TnPEOyt+9I
	rLcDJTjIGKqn2UQQZ3CelryEN4RByA2mZWijIife6g==
X-Google-Smtp-Source: AK7set9U5LpZut3M2xqQTP9wK+Ik2Kq8zvDWC/9/TGGzH1/TbpTw+vR6hl9/c3FS7oWZdtisaP0IzOu712pE1N5C55M=
X-Received: by 2002:a67:f6c1:0:b0:411:a14d:6bac with SMTP id
 v1-20020a67f6c1000000b00411a14d6bacmr907848vso.44.1676963564997; Mon, 20 Feb
 2023 23:12:44 -0800 (PST)
MIME-Version: 1.0
References: <20230216130021.64875-1-angelogioacchino.delregno@collabora.com> <20230216130021.64875-7-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230216130021.64875-7-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 21 Feb 2023 15:12:34 +0800
Message-ID: <CAGXv+5EwqokPe_DOoNJ7QaCUt3phhnc_+2vDBi-atjYzs4kVtQ@mail.gmail.com>
Subject: Re: [PATCH v1 6/9] soc: mediatek: mtk-mutex: Replace max handles
 number with definition
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, jason-jh.lin@mediatek.com, chunkuang.hu@kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_231248_151362_CD7FA1C1 
X-CRM114-Status: GOOD (  10.07  )
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

On Thu, Feb 16, 2023 at 9:02 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Replace the magic number "10", defining the maximum number of supported
> handles with a MTK_MUTEX_MAX_HANDLES definition.
> While at it, also change the type for `id` from a signed integer to
> a unsigned 8 bits integer to save some (small) memory footprint, as
> this number is never higher than 10.

Depending on alignment of bool, we might not get that saving.

> This cleanup brings no functional changes.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

