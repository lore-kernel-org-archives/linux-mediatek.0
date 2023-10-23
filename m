Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 397BDC001E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 09:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VH/fPEZ9qkWTKaawDCHK7vBhKEbCdSgmYhzD32um79w=; b=NcyiokF1Ks1pTjcDSoK7Dn+wZ5
	V/cZ24LfGDs7l2nAcFGjRjGM//AE4ZY7s7TMvvkwYLNMHBvntDQtl4aWoqsJIFYGtTBus4ra0UKNA
	/VoxV71f0dt1M2CZhC19CVJNshqz4Oy2H5ig8MPtFLuX9agAw2jTjMlOwlu1j5Ooa7Rdlb7/dHfS4
	qTXD0w4pd8i3mp1pJyySngopjztUPReSblB4BG3OVLrdbYznyc/LoDdCYyvApuixpvXYNtZ8B4iUE
	cZQwDK0k6BCBv9zE7m1LFRDEeho+UKMz7q7tZNWe9IIAi02p4oR1FngAVJ7ILiTs1JojdGE8MYyOV
	fH7V7PYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qurZG-006vOP-0e;
	Mon, 23 Oct 2023 09:49:50 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qurZD-006vNa-24
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Oct 2023 09:49:48 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-7789923612dso223698785a.0
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Oct 2023 02:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698054583; x=1698659383; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VH/fPEZ9qkWTKaawDCHK7vBhKEbCdSgmYhzD32um79w=;
        b=EYoRTmC8+NPrb/VOV4unmrNRFk0dsHYES8GjJypMMYSKuwflhRgtyn8zYfYZYynS/Z
         FvbJX+8VNAmFID8v7cLMbeo/uvppT0ixDZxk9Dq8dIhCrZFW2BdgkpOcaIy1HOO4EHiA
         Ss3TxYfmckz/vGptvbNR1p4TekxXC4w9Nko8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698054583; x=1698659383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VH/fPEZ9qkWTKaawDCHK7vBhKEbCdSgmYhzD32um79w=;
        b=ZS0IUJ+zQs02zE63D/XZeqzunr0xhx1rNGQjl6KtUmJCj15ioPdsU7YZcDGI0R6gKv
         gIKq1ogKkT0VKBjDP6X854wm6NZlSJlbKrbSom8Z9B+svG6kcX1iQBhLxueeTTLM/YHV
         GBFQ3L7rkXAal1Z7RNSdTB8j1Fshe63TaF6htSTKk3tBdWpdEVmmDTB8OWhHHLcD/ReY
         0L1jcVNBEl/3xU9VX982QMqaHKM2KZ0nv5/wgYwTs9O3gDDjT3FTSnUX9k7zSNtNed1k
         X1YR1PcthOiQVXEVFYd7uQzCjtaqcjfUDY//HStkmjAns+BW2JkgE8Q96xyihJxIk2CK
         4hDw==
X-Gm-Message-State: AOJu0Yy4+GWdjzcfDM3CTC/P2q4+GJGVty08JYjk9dx2/xDDqvYzFBAC
	JcxI0WBAJTx9EuTPVVYBGIApgJMdp2J2oZCycec=
X-Google-Smtp-Source: AGHT+IHMvaNhOb4jbHCBsrSh4C9JL8THHOU0BBiG735zH6NoDvbhW+WKqzf3SjnotBnxYR3JIMGvhg==
X-Received: by 2002:a05:620a:440a:b0:76c:ea3f:9010 with SMTP id v10-20020a05620a440a00b0076cea3f9010mr10139725qkp.16.1698054583596;
        Mon, 23 Oct 2023 02:49:43 -0700 (PDT)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com. [209.85.222.175])
        by smtp.gmail.com with ESMTPSA id dg3-20020a056214084300b00656373f9c30sm2765265qvb.75.2023.10.23.02.49.43
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Oct 2023 02:49:43 -0700 (PDT)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-778999c5ecfso222504585a.2
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Oct 2023 02:49:43 -0700 (PDT)
X-Received: by 2002:a05:6122:2020:b0:4a1:a334:57f6 with SMTP id
 l32-20020a056122202000b004a1a33457f6mr7545591vkd.1.1698054129715; Mon, 23 Oct
 2023 02:42:09 -0700 (PDT)
MIME-Version: 1.0
References: <20231023043751.17114-1-jason-jh.lin@mediatek.com> <20231023043751.17114-7-jason-jh.lin@mediatek.com>
In-Reply-To: <20231023043751.17114-7-jason-jh.lin@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 23 Oct 2023 17:41:33 +0800
X-Gmail-Original-Message-ID: <CAC=S1njt-esHwUEr4O5BVUmmgpB=Gm084h+tY-KsKp9LkPXNBQ@mail.gmail.com>
Message-ID: <CAC=S1njt-esHwUEr4O5BVUmmgpB=Gm084h+tY-KsKp9LkPXNBQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/9] mailbox: mediatek: Add CMDQ driver support for mt8188
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, 
	Jeffrey Kardatzke <jkardatzke@google.com>, Jason-ch Chen <jason-ch.chen@mediatek.com>, 
	Johnson Wang <johnson.wang@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, 
	Nancy Lin <nancy.lin@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_024947_700008_6FEFEBD5 
X-CRM114-Status: GOOD (  17.67  )
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

Hi Jason,

On Mon, Oct 23, 2023 at 12:58=E2=80=AFPM Jason-JH.Lin <jason-jh.lin@mediate=
k.com> wrote:
>
> Add CMDQ driver support for mt8188 by adding its compatible and
> driver data in CMDQ driver.
>
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/mailbox/mtk-cmdq-mailbox.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmd=
q-mailbox.c
> index 56fe01cd9731..3bdfb9a60614 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -704,12 +704,20 @@ static const struct gce_plat gce_plat_v7 =3D {
>         .gce_num =3D 1
>  };
>
> +static const struct gce_plat gce_plat_v8 =3D {
> +       .thread_nr =3D 32,
> +       .shift =3D 3,
> +       .control_by_sw =3D true,
> +       .gce_num =3D 2
> +};
> +
>  static const struct of_device_id cmdq_of_ids[] =3D {
>         {.compatible =3D "mediatek,mt8173-gce", .data =3D (void *)&gce_pl=
at_v2},
>         {.compatible =3D "mediatek,mt8183-gce", .data =3D (void *)&gce_pl=
at_v3},
>         {.compatible =3D "mediatek,mt8186-gce", .data =3D (void *)&gce_pl=
at_v7},
>         {.compatible =3D "mediatek,mt6779-gce", .data =3D (void *)&gce_pl=
at_v4},
>         {.compatible =3D "mediatek,mt8192-gce", .data =3D (void *)&gce_pl=
at_v5},
> +       {.compatible =3D "mediatek,mt8188-gce", .data =3D (void *)&gce_pl=
at_v8},
I guess I understand your intention here... but the ordering doesn't
make sense to most people. Put this line after mt8186.

It's up to you to ignore the outlier mt6779 for now or send a separate
patch to fully sort the list by the compatible strings.

Regards,
Fei


>         {.compatible =3D "mediatek,mt8195-gce", .data =3D (void *)&gce_pl=
at_v6},
>         {}
>  };
> --
> 2.18.0
>
>

