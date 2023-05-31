Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A487BC77B7A
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 May 2023 23:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/xl/rPfybuWWRREKP0y1CQScxSYr/byrO3VlKqP/h1s=; b=pLqwZohM8dwg66yZCn8xp477e+
	Ldk/SO45DpNFRYTSHWwtPVXn+zhMIKShioKKf9XsnWiqUAvahsWyJIhMdGfmlr3+BbhDtQUu3RiT4
	WR0uZQ0BfytK4olQ5jBHZukCUT7dLoyHDWbuGQqNCzsZE98YBUoW5v0b0A85NbPVgQIF+VwEh/60u
	PShqmi+5rfPlbQ/uHsg61VOqky7UUFh/veuGEsmb3lQGLAy0xNFNNnAS+YQ6n7JEMWf6Np7UJHaOh
	Ly1h7klkk3UVK6I0qAKkQMSYwCsd5xVewX331PfP35gIBnSlBvHhYV8kPTXrk+zSG0Z9emkTcFtud
	AeFo3W4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4VYL-001Ujh-2N;
	Wed, 31 May 2023 23:48:29 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4VYB-001Ufv-1L
	for linux-mediatek@lists.infradead.org;
	Wed, 31 May 2023 23:48:20 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-33cb82122c7so698995ab.1
        for <linux-mediatek@lists.infradead.org>; Wed, 31 May 2023 16:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685576894; x=1688168894;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/xl/rPfybuWWRREKP0y1CQScxSYr/byrO3VlKqP/h1s=;
        b=WdWPXGLfqJN3uJzhpy5lBQ1NXyB7nJIH8g3pN2eddplananhwguaQuSE10Z3hC+2HR
         6N9+5FU5552q9H0U6tSDgzyst+KdDy10Jsp3UkHVcFxCU3pa2UbhrX1PdGFgUUYupjaS
         NPyOY3JJIX/hp4TKuQhlP9pBzBLJSy2Ep38uY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685576894; x=1688168894;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/xl/rPfybuWWRREKP0y1CQScxSYr/byrO3VlKqP/h1s=;
        b=Sn2cDuiMzQWu61/b+aVXMx+6GaOuql0OxlZGrfd/BxX4vwD4+HECltq6HTEYiBn5/s
         N1x7ynHvoPf7KdIB/YFiJrpWAD01iBa6X7tFRFHNUc+zOrAToHOhP2+9fTDbJWi9x7En
         E5IiNneXOBNT8cEJ8FgPaExeVaCzCHi8Oo9IWoTOXgg23NLzQLFeFbswOXxq4iz1ncAP
         HXbJD+LgTyysnRD9wu++U+5VRoylpN++oJcuOJ39/6cJCIy4h036mSKWQAcuvZnJWWos
         XFc3RD2JZEovgEbmIhTWWzIA4IiaSqlYGFsHKpTgVLk/wXEoqWLoIEbwgitwQ19l0XJX
         KMLA==
X-Gm-Message-State: AC+VfDxM3BnMD0hV5PkjEmBfIIPWYvRNOTkUqzOUSjFq1lJrBNh9ggPg
	xpVvllNPBsaSty5CIGPb3KkMin529VhnNqZcn3I=
X-Google-Smtp-Source: ACHHUZ7ZpHF8euen2ExbW0ORodU98p7DXIbkt516yDXpOOV2yMiM/kk5wPKN8CAJt2CKGVnCzpZPDw==
X-Received: by 2002:a05:6e02:810:b0:338:6ace:dd62 with SMTP id u16-20020a056e02081000b003386acedd62mr3261411ilm.14.1685576894227;
        Wed, 31 May 2023 16:48:14 -0700 (PDT)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com. [209.85.166.172])
        by smtp.gmail.com with ESMTPSA id r5-20020a92c505000000b003381b902199sm3384918ilg.39.2023.05.31.16.48.11
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 16:48:13 -0700 (PDT)
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-33b398f2ab8so61805ab.0
        for <linux-mediatek@lists.infradead.org>; Wed, 31 May 2023 16:48:11 -0700 (PDT)
X-Received: by 2002:a05:6e02:1ca4:b0:33b:7a45:a950 with SMTP id
 x4-20020a056e021ca400b0033b7a45a950mr93109ill.18.1685576890947; Wed, 31 May
 2023 16:48:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230530072514.22001-1-trevor.wu@mediatek.com> <20230530072514.22001-3-trevor.wu@mediatek.com>
In-Reply-To: <20230530072514.22001-3-trevor.wu@mediatek.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 31 May 2023 16:47:59 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XUKuDVb+B9i31TfyNwGY11MM-q6eJJVkrasj=GGboRcg@mail.gmail.com>
Message-ID: <CAD=FV=XUKuDVb+B9i31TfyNwGY11MM-q6eJJVkrasj=GGboRcg@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: mediatek: mt8195: fix use-after-free in driver
 remove path
To: Trevor Wu <trevor.wu@mediatek.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_164819_463074_D29E80E1 
X-CRM114-Status: GOOD (  12.55  )
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

Hi,

On Tue, May 30, 2023 at 12:25=E2=80=AFAM Trevor Wu <trevor.wu@mediatek.com>=
 wrote:
>
> diff --git a/sound/soc/mediatek/mt8195/mt8195-audsys-clk.c b/sound/soc/me=
diatek/mt8195/mt8195-audsys-clk.c
> index e0670e0dbd5b..09bd1a020421 100644
> --- a/sound/soc/mediatek/mt8195/mt8195-audsys-clk.c
> +++ b/sound/soc/mediatek/mt8195/mt8195-audsys-clk.c
> @@ -148,6 +148,29 @@ static const struct afe_gate aud_clks[CLK_AUD_NR_CLK=
] =3D {
>         GATE_AUD6(CLK_AUD_GASRC19, "aud_gasrc19", "top_asm_h", 19),
>  };
>
> +static void mt8195_audsys_clk_unregister(void *data)
> +{
> +       struct mtk_base_afe *afe =3D (struct mtk_base_afe *)data;

Same as in patch #1, the above cast isn't necessary. Other than that:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

