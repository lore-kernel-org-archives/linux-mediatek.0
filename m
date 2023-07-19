Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD63EEB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 10:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hVbJ90S8n4+Y/GX8BKsAT4na7uO4IaCBjmWUCYyFtgQ=; b=zWs93Aq1IkXWf3VMGegjWTOhJA
	IZ+Zdvj+aReuO81fs3SEPBgiVXlWGJEjCtZRaLg/P1yrK0OqG2+WWIKxGxkuHNWkdunQcNIPMS0RF
	pInc0G52ZHrnz6NLGHx+gvxGePWIcXW7WUmQCuTD1dLS5W2vzgxZXxJGP99nE20akIHMt/xQGn9gI
	x5i7uMHcMw0Trk803iVcsTOYp9aIp1s6IRs/e5uhWavmBcqbrn1SdVqfQ5uP2L+ob2g2hEjwIHnUr
	zVifSO5EjQw5grAa29dsnouMmy7GmpmBGqXZVsrD2IcKT8F2oHr/tLFy0jmIWlTAtE4FowKo6miEq
	hOBlQ4+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM4Oo-006hjn-2m;
	Wed, 19 Jul 2023 10:27:14 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM4Om-006hj4-37
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Jul 2023 10:27:14 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-346541baf2aso1450535ab.1
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Jul 2023 03:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689762432; x=1692354432;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hVbJ90S8n4+Y/GX8BKsAT4na7uO4IaCBjmWUCYyFtgQ=;
        b=I59QS1LNk+IVX82McS9S60HmotZ2bNU4ZrTuByuym64U/8wQ0dQpeUBF+Zk5shnqXt
         L0hCSOrHILHgci2dyU9EC6S7PL4C9ItmdYK0V2cKtu1rrK5lVTHLh96ttZAT6DnNgRpI
         KchcBQpabct50pZ12Few53ttpR4TRccaTk/58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689762432; x=1692354432;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hVbJ90S8n4+Y/GX8BKsAT4na7uO4IaCBjmWUCYyFtgQ=;
        b=FqlnKNl/TmDsG5TN36m6mEhJppwrgI9ES8hqLoYmRCSi1nnrgIMT7kVmiU9WVCcKsV
         wSrOO8IzocsmDlLm2DU13tuSLKbdC9UxhDz3AxBrCnzxQFPgzbwFY5/PDCv76hU1vS1m
         ApFZYuraFYTOF1OQUkCBBKTVEYHm/XbXkEILOl5Vkl++rUOJTgPIUGvzkTYsCRSfwP5U
         GGdyUt7Rnryv5PA++TA8LY/sXko6KWLhA54XtY546NOlI6Ec46lMKjSQMCdH6Umtp0aV
         a6VXqHjFP429XgnM/onDneildI2wnzWgSrXBcPWKpikgBpQ9QqZKuRI0TSkeRB3Ajudl
         JBnQ==
X-Gm-Message-State: ABy/qLYYCFEQfT3AIqvlRCtrBf6AeB8FnKzCSMAr+XZknUEGMfHGjWKe
	AtjRxFihDLtd3EooDReVI9ACu1syq8C4ThrZKXA=
X-Google-Smtp-Source: APBJJlG/oUA3driPFXst3nzEVK+Z6mfQApaPNK7LZhiiNA9bbIahxP4rn4dyVU1dFcLj4Z/UlAYFgA==
X-Received: by 2002:a92:8707:0:b0:345:9d3a:709c with SMTP id m7-20020a928707000000b003459d3a709cmr1213829ild.12.1689762432163;
        Wed, 19 Jul 2023 03:27:12 -0700 (PDT)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com. [209.85.166.44])
        by smtp.gmail.com with ESMTPSA id h27-20020a02cd3b000000b0042bb3e62108sm1203850jaq.4.2023.07.19.03.27.10
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 03:27:10 -0700 (PDT)
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-7835c92c373so14273739f.0
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Jul 2023 03:27:10 -0700 (PDT)
X-Received: by 2002:a05:6602:87:b0:787:147b:b54f with SMTP id
 h7-20020a056602008700b00787147bb54fmr1327429iob.3.1689762430227; Wed, 19 Jul
 2023 03:27:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230719075056.72178-1-angelogioacchino.delregno@collabora.com> <20230719075056.72178-7-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230719075056.72178-7-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Wed, 19 Jul 2023 18:26:34 +0800
X-Gmail-Original-Message-ID: <CAC=S1ngWWeGuXrvsvgLrU7iVjnAm1+o2PwfPOBrQMLzsijnuHQ@mail.gmail.com>
Message-ID: <CAC=S1ngWWeGuXrvsvgLrU7iVjnAm1+o2PwfPOBrQMLzsijnuHQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] drm/mediatek: mtk_dpi: Compress struct
 of_device_id entries
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	daniel@ffwll.ch, matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_032713_009988_1E3659DD 
X-CRM114-Status: UNSURE (   9.38  )
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
> Reduce line count by compressing the entries of struct of_device_id;
> while at it, also add the usual /* sentinel */ comment to the last
> entry.
>
> This commit brings no functional changes.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

