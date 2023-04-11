Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50441C77B61
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Apr 2023 03:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e/ZlRoiu1wIxay9eSAG+82IQcuZBJKitlsbCIfhB1ls=; b=1hYsoezk0bfDtudy7Zn8otEi+M
	fuzVfnCxRtA934C148PhZCGx3Wjxjkhss2kyz7R5sSBkRH5YW6CTd8IwfolSeMnmi+kerI6gXiYCR
	U7/VMXlw9Wd2xYi8quqoufc5mC4bXmywAz4bgftbsrI9TnRdoJ+E3Oy3STKZBaGJ5LgLvqyizNFq0
	f6yEE/MklJi3Urla0ydTvLHYZX+3yzYwXyv8X0rHVtQqxBpHbmJMUnRys0iGHCMaS+tK6JBTcbgQn
	/85/ljsVrFolbWR8sZEVXrc7fTAQ/RPf1zC5ARDrz4TbP/I00ERJdIQ5UPI6QoKAqZFHie9zxXWC9
	ycYP2Gmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pm4Ht-00GIX3-32;
	Tue, 11 Apr 2023 03:03:17 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pm4Hr-00GIUd-0d
	for linux-mediatek@lists.infradead.org;
	Tue, 11 Apr 2023 03:03:16 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-54c0c86a436so254367047b3.6
        for <linux-mediatek@lists.infradead.org>; Mon, 10 Apr 2023 20:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1681182186; x=1683774186;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e/ZlRoiu1wIxay9eSAG+82IQcuZBJKitlsbCIfhB1ls=;
        b=p23peQSBESFfKBX5qzUaFFuQlNCoNnYCcRzo4X01hLqp5yyb/EXyJ5tARG/xr3o47a
         lsw0uM1NYxVK8XD6kyiKMF2RZlz7LESjvR01hLARpXLbsNuumYzza0kNrcjRoqaFadt7
         Dlu7zl5WXscb2tsuZ3fYxy9yyNkoV4HVWEO85924Cg2p9fCjRx8D0MMpx8uL6hZKsCts
         LHP+LWP5N5cFtRMFNzij1IKncHGBrOvocZnOiixo87iJwkQYGFqIgpndRoTPzZ/SrxvM
         J8a9GINg+YQf4YnNYojwcF2xXyphK+m5MBSHRscMbmYBUDPQSXMvM8tk0TIZWHwhRYHL
         vO1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681182186; x=1683774186;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e/ZlRoiu1wIxay9eSAG+82IQcuZBJKitlsbCIfhB1ls=;
        b=RBHH17MSiimVX0bmIL+xi4b57meaqTNG3wqXEjdDKifmIqcgJ4ElUAeF9Wctw713ky
         gED3U5UnD3f5POc/SljF+1Tj4GhFd6sFR2wosfpGK3O0Y62fXNfFY6gGK2w5wzp2cMnJ
         Ozyhho1m7f4EQQuVym1JrjT2Bf8OUiGE7GPNTbTSK9EgjGg4G9AB825QTdhizHfwSiwe
         8RtaJ2JxTkRBWy2GILKO9ADPgrMpeIP535+oszi5SZildvXoKF8q08c/TQkxVH0vVO/q
         XDrKri+Mv2OWeXGc/7N15lvq/ySJPwkcs+dZnjozjh1L+OOIrt3q3wcNk8KeXc+D3bmf
         9v9g==
X-Gm-Message-State: AAQBX9dZ+v+fqcfSndjH3nnUHD/5EX9w1SCRC+aajkxABl0JJHJbTbou
	hVbP2s6mvmzqdPfOWZFY7FCZv95cltho3ClAja59AA==
X-Google-Smtp-Source: AKy350bGTe9O8VOwunq6lfwiyzTvnTDU4MVjsdYYrKAlp1XxALqKFbfbn4DnPg7sET9+7AXo84pBp+w0Qgzjnf7nl58=
X-Received: by 2002:a81:c509:0:b0:54c:2409:c306 with SMTP id
 k9-20020a81c509000000b0054c2409c306mr6819141ywi.6.1681182185494; Mon, 10 Apr
 2023 20:03:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230411003431.4048700-1-shraash@google.com>
In-Reply-To: <20230411003431.4048700-1-shraash@google.com>
From: Guenter Roeck <groeck@google.com>
Date: Mon, 10 Apr 2023 20:02:54 -0700
Message-ID: <CABXOdTcDfy3oDVy6+FAg+jkqnCJABOq=VokWQ1q4QByKbo5UJQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: common: Fix refcount leak in parse_dai_link_info
To: Aashish Sharma <shraash@google.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Trevor Wu <trevor.wu@mediatek.com>, Guenter Roeck <groeck@chromium.org>, 
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	kernel test robot <lkp@intel.com>, Julia Lawall <julia.lawall@inria.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230410_200315_232356_0C9D38BB 
X-CRM114-Status: GOOD (  18.10  )
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

On Mon, Apr 10, 2023 at 5:34=E2=80=AFPM Aashish Sharma <shraash@google.com>=
 wrote:
>
> Add missing of_node_put()s before the returns to balance
> of_node_get()s and of_node_put()s, which may get unbalanced
> in case the for loop 'for_each_available_child_of_node' returns
> early.
>
> Fixes: 4302187d955f ("ASoC: mediatek: common: add soundcard driver common=
 code")
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Julia Lawall <julia.lawall@inria.fr>
> Link: https://lore.kernel.org/r/202304090504.2K8L6soj-lkp@intel.com/
> Signed-off-by: Aashish Sharma <shraash@google.com>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  sound/soc/mediatek/common/mtk-soundcard-driver.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/sound/soc/mediatek/common/mtk-soundcard-driver.c b/sound/soc=
/mediatek/common/mtk-soundcard-driver.c
> index 7c55c2cb1f21..738093451ccb 100644
> --- a/sound/soc/mediatek/common/mtk-soundcard-driver.c
> +++ b/sound/soc/mediatek/common/mtk-soundcard-driver.c
> @@ -47,20 +47,26 @@ int parse_dai_link_info(struct snd_soc_card *card)
>         /* Loop over all the dai link sub nodes */
>         for_each_available_child_of_node(dev->of_node, sub_node) {
>                 if (of_property_read_string(sub_node, "link-name",
> -                                           &dai_link_name))
> +                                           &dai_link_name)) {
> +                       of_node_put(sub_node);
>                         return -EINVAL;
> +               }
>
>                 for_each_card_prelinks(card, i, dai_link) {
>                         if (!strcmp(dai_link_name, dai_link->name))
>                                 break;
>                 }
>
> -               if (i >=3D card->num_links)
> +               if (i >=3D card->num_links) {
> +                       of_node_put(sub_node);
>                         return -EINVAL;
> +               }
>
>                 ret =3D set_card_codec_info(card, sub_node, dai_link);
> -               if (ret < 0)
> +               if (ret < 0) {
> +                       of_node_put(sub_node);
>                         return ret;
> +               }
>         }
>
>         return 0;
> --
> 2.40.0.577.gac1e443424-goog
>

