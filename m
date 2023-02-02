Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76109C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Feb 2023 16:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tM2tAG1KHS9gAyhcPLjkjYt8F4gMNaekAqdi+Z0D3jE=; b=GhSl1cZHOshlncSE29Xlzx7HLY
	gmY1LFMLf4+S1sTxEGD79zaThDIZWYCdgKQ4t9fXZuTvocONYyeMZuGeIU/HuHNJO/AkqhQw8/2m1
	2qxaIppz0M1F72y97nQn+yM11qw2BT/5iADPLAprJzmtufhN3GQhRVhMF+cXcX8qVp33r/0Yyafno
	AoAiIgwl9YMpdh9ChMUs48Fefy43URmOgcn4NRId583GEq1+dkpMmc6MEaGangbn2urfrumDQIFJv
	Ubu1sz1OzgdKEpTTt8+Gx6MDTVmeVxZ/l0eYHogaKulQDy9aIMBNfh/F07AY7qKtvGmCR6mf9s8XI
	TLyeP+jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNcHD-00GckF-Dg; Thu, 02 Feb 2023 16:17:31 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNcH9-00GcjD-5u; Thu, 02 Feb 2023 16:17:28 +0000
Received: by mail-wm1-x32f.google.com with SMTP id n13so1815016wmr.4;
        Thu, 02 Feb 2023 08:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tM2tAG1KHS9gAyhcPLjkjYt8F4gMNaekAqdi+Z0D3jE=;
        b=QskZxot5mc2Exa8IWCLZzUy0ZgCN5SeK2vwVanKyB2t7of02G81jkeeZ/2Bzj7lfmm
         2siEjAcnKKBmmU+NNSxvq35ExnO+IKq1JiytOwRetZunBwuOXuBdHP+v2T/0QnfArYxL
         b4uRxVGr3Ta5mfPQ3az1H8E3HzVuK9SnsMsq9ArYDnmFyrX3bfmJENN9M0tnBt1pSnqd
         KaatnXYDhoUurnrXaq6szgyFW7CZenyM/A3vZ/1qqoas2SUy0uAdyewjiBH/VCzBAzOt
         h4OrQA/KW8RrhdN0a1as7vg4+4gFdK4ql0TK7adPFUlZY/cGovr5c4V1yUZ76c48blqk
         zhaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tM2tAG1KHS9gAyhcPLjkjYt8F4gMNaekAqdi+Z0D3jE=;
        b=LrsRWor/BOEg/+WeYHmwFrH/QWg0wXWnSNzumeVGzsXxNiyGe+6tnLP8nM+SE01XjY
         hws2YrHpZ8jiwPSdrMeKGppNpoOYfyaDXbLWRTg/wjSO2ZE1uFJYiXvq35KpAf8ggnIZ
         FzH96h7NRIjY3RFvwlxCrToLMAFPImgQTiuvJ3shPKhoIjecBB9ok80WFesnkaaHj9+V
         3XkofSvBh8wjomYESlTxb7b8ly2eeSnTXXcvQ0KELtavnJeDRMbgOjExEaYCGPm0UkwP
         xIoT7Xl2Aujv65ccs0pmOl8knKz7rO3WleZp0rXv2Hf+bFRm6fVPCPthApeB4WxTtj0W
         W3GA==
X-Gm-Message-State: AO0yUKUFZU2JdPb6m8NwUkb/psJNmz/tyhhXpDEAHX8SvPTy0GWJMCtw
	0ZzzBA1A+hXwiMj/mNeLpBM=
X-Google-Smtp-Source: AK7set+px4qLsaBOaUEfLm/zCt9ycrIHjHt1QgT6ErzvraazA3Tx2vnHVt3VDBi6Er2VVCrDXjc4dw==
X-Received: by 2002:a05:600c:3d06:b0:3df:dc0d:f0b3 with SMTP id bh6-20020a05600c3d0600b003dfdc0df0b3mr2521516wmb.9.1675354641972;
        Thu, 02 Feb 2023 08:17:21 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id r17-20020a05600c459100b003dee8c5d814sm5332469wmo.24.2023.02.02.08.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 08:17:21 -0800 (PST)
Date: Thu, 2 Feb 2023 15:17:04 +0300
From: Dan Carpenter <error27@gmail.com>
To: Trevor Wu <trevor.wu@mediatek.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz,
	matthias.bgg@gmail.com, alsa-devel@alsa-project.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: mediatek: mt8188: remove etdm dead code
Message-ID: <Y9upwNAzXzSxmiFo@kadam>
References: <20230202103704.15626-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230202103704.15626-1-trevor.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_081727_273135_0CC517CD 
X-CRM114-Status: GOOD (  13.37  )
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

On Thu, Feb 02, 2023 at 06:37:04PM +0800, Trevor Wu wrote:
> Some Smatch static checker warning like below was found.
> 
> sound/soc/mediatek/mt8188/mt8188-dai-etdm.c:2487
> mt8188_dai_etdm_parse_of()
> warn: 'ret' returned from snprintf() might be larger than 48
> 
>     2479         for (i = 0; i < MT8188_AFE_IO_ETDM_NUM; i++) {
>     2480                 dai_id = ETDM_TO_DAI_ID(i);
>     2481                 etdm_data = afe_priv->dai_priv[dai_id];
>     2482
>     2483                 ret = snprintf(prop, sizeof(prop),
>     2484                                "mediatek,%s-multi-pin-mode",
>     2485                                of_afe_etdms[i].name);
>     2486                 if (ret < 0) {
> --> 2487                         dev_err(afe->dev, "%s snprintf
> err=%d\n",
>     2488
> 
> In linux kernel, snprintf() never returns negatives. On the other hand,
> the format string like "mediatek,%s-multi-pin-mode" must be smaller
> than sizeof(prop)=48.
> 
> After discussing in the mail thread[1], I remove the dead code to fix
> the Smatch warnings.
> 
> [1]: https://lore.kernel.org/all/Y9EdBg641tJDDrt%2F@kili/
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---

Thanks!

Regards,
dan carpenter


