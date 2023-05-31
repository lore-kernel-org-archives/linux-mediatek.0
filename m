Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 001C2C77B7A
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 May 2023 23:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ssi9hji3ougqZcnJfZaYXLr+1zSSxDjh3rVcPrdEtNo=; b=rx1XTybAe86IQxdU+Z8da3Bswd
	pOVjyB9GQ2E839rN6tJkt24DgpwhI8wiKDxhpUSr8Cty9K/E+PZ3yqSKBIcMq0v9EH1/k9wo2zArY
	ZBQTkYiZ6F/BgYKewIL2enYpSnMCUHsrlCjJ7R9MNYQPjnfMnS9J6XAcAt2+Jm0g3dNzLxMi9KF5z
	j4+s8ZxS9sNLHmBQe5IxHZiobwe0kkwczEyvIT4mRsT6WK1OqqvfnAv5ABV9cIhxKhLp0il/buBDI
	QUfWspV5jSg5PDAad4mDoAdxzMKD9OnV8dVSVZGMuodkLfRgyAbXx7ACnGDoQtw2c+V4j1GJkKyqI
	6safb6pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4VYA-001Ugd-2X;
	Wed, 31 May 2023 23:48:18 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4VY7-001UfC-1r
	for linux-mediatek@lists.infradead.org;
	Wed, 31 May 2023 23:48:16 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-33b3cfb9495so802235ab.2
        for <linux-mediatek@lists.infradead.org>; Wed, 31 May 2023 16:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685576890; x=1688168890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ssi9hji3ougqZcnJfZaYXLr+1zSSxDjh3rVcPrdEtNo=;
        b=K9vtiLjauLAheH/706FVQchuFhyZnP5Lrpl3x/r/LZcYoWfDbldHhY6Pg0wiMMk34L
         FiVrxU1jrZsvA7ha/w7YHVnx6HTokPSvdzsfrMud0L8sX1SK/5Hp03BJU/trjdNGhSop
         PVg4MEQrq4sWRneZnpmf1yFpKHEHWQg7aCf8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685576890; x=1688168890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ssi9hji3ougqZcnJfZaYXLr+1zSSxDjh3rVcPrdEtNo=;
        b=j18pg5XdaKW08VkRnvWrgm+1SnmByHrZ7afOzCcljviKj3oj3GuLvLbEXQ0pwMHno1
         Y5/89BoNtjPL+mcd9sOLZLJyAgW5GwBWi+RJxGyrxjRtzTdR7KB4/UQHlyfQVsZ/Ye6l
         iQnu2qUBAYQsG2gqDNHnuUyC9c+F+OKeFCwU8nmcDpFGqt5DLz/yjo7DQCwBJtBBgi3B
         mDxFvt8Lm+JHiQoWXDUCIxKaodpxYukEmHk3dfUa5/TNvmrAUiiqOoxVsi9QzFBoWqKq
         aSNlNhu/mLxzX40hqXXqWYBZLIStKcxpIjaNm+bL6LP9/QHdLrKzwb2oXeebLjfciTdw
         6DWw==
X-Gm-Message-State: AC+VfDwUFKD1Hdb4gZtk0Pj7nTFoLYpJmN14kFhXeqA2ATieOMqhgHYp
	5R2OT0PmJ18JhWerk+ujCMVjCXJQ5X5MEpQrqyU=
X-Google-Smtp-Source: ACHHUZ7OWzp9QPIzzjprYw0VmDcmQxzdexsnJ9MCdTJY0GCl+WW5c1vUe4xwJlAQ8f6TeCoYaOgCaw==
X-Received: by 2002:a92:d4c7:0:b0:33c:68aa:7c3b with SMTP id o7-20020a92d4c7000000b0033c68aa7c3bmr2388119ilm.25.1685576890024;
        Wed, 31 May 2023 16:48:10 -0700 (PDT)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com. [209.85.166.178])
        by smtp.gmail.com with ESMTPSA id p15-20020a056e0206cf00b0033bea7559ffsm753126ils.53.2023.05.31.16.48.08
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 16:48:09 -0700 (PDT)
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-33baee0235cso31685ab.1
        for <linux-mediatek@lists.infradead.org>; Wed, 31 May 2023 16:48:08 -0700 (PDT)
X-Received: by 2002:a05:6e02:1786:b0:33b:3bf4:9f42 with SMTP id
 y6-20020a056e02178600b0033b3bf49f42mr32601ilu.19.1685576888336; Wed, 31 May
 2023 16:48:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230530072514.22001-1-trevor.wu@mediatek.com> <20230530072514.22001-2-trevor.wu@mediatek.com>
In-Reply-To: <20230530072514.22001-2-trevor.wu@mediatek.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 31 May 2023 16:47:56 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X1JURLwZHraNwSMT7vwLNRNw7h0MmpbeWnr1yht6-3VA@mail.gmail.com>
Message-ID: <CAD=FV=X1JURLwZHraNwSMT7vwLNRNw7h0MmpbeWnr1yht6-3VA@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: mediatek: mt8188: fix use-after-free in driver
 remove path
To: Trevor Wu <trevor.wu@mediatek.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_164815_614561_7B244B94 
X-CRM114-Status: GOOD (  13.92  )
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
> diff --git a/sound/soc/mediatek/mt8188/mt8188-audsys-clk.c b/sound/soc/me=
diatek/mt8188/mt8188-audsys-clk.c
> index be1c53bf4729..05d6f9d78e10 100644
> --- a/sound/soc/mediatek/mt8188/mt8188-audsys-clk.c
> +++ b/sound/soc/mediatek/mt8188/mt8188-audsys-clk.c
> @@ -138,6 +138,29 @@ static const struct afe_gate aud_clks[CLK_AUD_NR_CLK=
] =3D {
>         GATE_AUD6(CLK_AUD_GASRC11, "aud_gasrc11", "top_asm_h", 11),
>  };
>
> +static void mt8188_audsys_clk_unregister(void *data)
> +{
> +       struct mtk_base_afe *afe =3D (struct mtk_base_afe *)data;

The above cast is unnecessary since the compiler lets you assign from
a "void *" to another pointer without a cast. Unnecessary casts are
considered harmful because they suspend the compiler's ability to do
type checking. Other than that, this looks good. Sorry for not
noticing that the same problem affected more than just the driver I
fixed previously.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

