Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B6C7EB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 10:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K9ZDAcRcEb4EcOQItHJdczS495JLkwEqfSdpm/d3I5s=; b=uw4qyGDCt5mZCrLLfro9BFZqMR
	Epj6UV3aSr5QY4jqmPGnOO0bZhzACjLsDu4EKOxui7hNuDR/w4+wT2uTZKQ+c/W5HEomsKvyKSFxC
	BTrCoVWB9y1o5/+dNVsVfWSXHxV33nOa610LnWiPoyLH3xAYA3ileEOPna7uCKP2NukmhtfjgPEGJ
	9bHojod9PTyIh9ISaQBZS1NqA+GgRVQdbsOJdU2Kvb9zHHBOwxnTCJrJbs+J1Wsj3p4+hPk54Vuk2
	6w7Bi0N3bWOldGccWS4QW/Ftqe6r7wTAj4SibdYh5jHhhMLkCaxUXweiW+OJE4MUPMLXsVxq9a6zR
	GgdjWSYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM4Ma-006hGH-0R;
	Wed, 19 Jul 2023 10:24:56 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM4MX-006hDW-2p
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Jul 2023 10:24:55 +0000
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-78372b896d0so317625639f.2
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Jul 2023 03:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689762290; x=1692354290;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K9ZDAcRcEb4EcOQItHJdczS495JLkwEqfSdpm/d3I5s=;
        b=hgXPwaiB6IjcttwNxrZKNFJYnkibuGSWbyRNWJAqP8CNb4OFUy8aIITvQi73N+qtKm
         KRk/NG6yhdEDpJ92AclL2PRt5hod/X96gQzLY1p1Brr9Sqfrv+otLEuCFXX9JfNZ90zu
         uRnD40pkNTIii5zetmHCw4wjtMZ44h0xrtbmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689762290; x=1692354290;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K9ZDAcRcEb4EcOQItHJdczS495JLkwEqfSdpm/d3I5s=;
        b=CQOg0h6p5TbhS+rtiS27wYdimUMmCof5XwNg6JHqOQ+T7ESz06Dk+RIaJZTAUnxMHg
         DU9RimyHM+wyMWnPLDOcvH7LSBIKT2/Doptfzpju3/+A20yTwjleu05Gh1ggVvlRem36
         CtfnCYsqvn8TMVZQcHRN4thSTJmFiNtV+uGIN/w7015qQ2nqbGzpuxeYiaHUOVi9jwML
         Wg2QikxSvppOQeqWU5/ZxEUM0TgxpbfjephQw14RUr4og/h6YwydW/FIu2bQpTI74f2t
         9iTWYm6NjarWd7Nof1Zgt4g/pcaGxsVUPAPvpRt/6TfSJsRyc0F+TvsnoO+SHDnxR278
         6Ivw==
X-Gm-Message-State: ABy/qLZKQvKuL9zLxkChjneY3wU10Aw+7M8mplz4oeZiPGH3NmRW6oLq
	NcDl4+jc3wUqVAXaAPVIacFzRWxoJ6keALKBDGc=
X-Google-Smtp-Source: APBJJlFDImBcRAn6NPb5/A3IExuKKG9c7yTBo7keC0xDhxE+W8Y6UK7g+gx6L11PgGNmzcMYf5XUPA==
X-Received: by 2002:a6b:d013:0:b0:787:34d:f1a4 with SMTP id x19-20020a6bd013000000b00787034df1a4mr4996724ioa.4.1689762289769;
        Wed, 19 Jul 2023 03:24:49 -0700 (PDT)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com. [209.85.166.50])
        by smtp.gmail.com with ESMTPSA id t11-20020a6b090b000000b0077e35ffac2fsm1270839ioi.32.2023.07.19.03.24.48
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 03:24:48 -0700 (PDT)
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-78372b896d0so317624939f.2
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Jul 2023 03:24:48 -0700 (PDT)
X-Received: by 2002:a5e:950a:0:b0:787:1568:5df7 with SMTP id
 r10-20020a5e950a000000b0078715685df7mr5145284ioj.9.1689762287751; Wed, 19 Jul
 2023 03:24:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230719075056.72178-1-angelogioacchino.delregno@collabora.com> <20230719075056.72178-5-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230719075056.72178-5-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Wed, 19 Jul 2023 18:24:11 +0800
X-Gmail-Original-Message-ID: <CAC=S1nguPCc8HUkWqNQgBWzNNaq83q7UdTdbv1i5_jH2ZZy4eA@mail.gmail.com>
Message-ID: <CAC=S1nguPCc8HUkWqNQgBWzNNaq83q7UdTdbv1i5_jH2ZZy4eA@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] drm/mediatek: mtk_dpi: Switch to .remove_new()
 void callback
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	daniel@ffwll.ch, matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_032453_915546_EA7A963B 
X-CRM114-Status: UNSURE (   7.79  )
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

On Wed, Jul 19, 2023 at 3:51=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The .remove() callback cannot fail: switch to .remove_new() and
> change mtk_dpi_remove() to void.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

