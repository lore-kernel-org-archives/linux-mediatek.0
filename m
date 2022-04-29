Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76508C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Apr 2022 12:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A8WkNMLQC2zo9pptrQsVeZrt8h4ys7ErO+kOONGqX0Y=; b=LzroI43HFNkyUb
	qVoe5rQExEf8Aki79j64PeErNzHenuSfyUvoEQRvOqaD7ZWAqE93sd7iifS5OSKEFG1uYSxyG+f6I
	U78vdOcaUpfXAaQw91bhtZmMB8bkCll7OUbxwUIr8YihL4lPkZ0B+rKtMNk7L6EynyGSK4Z8anILO
	cNuDKFGHe9DbuHb7RfUD3tAEhezrR/WTm9/QXHGVEpjOzX3RWHw/fb9cxtL6lKrFOYTVCPTOdW7UF
	XCMqC2KGRLfxs5/MpVHiAdZrZSX5TdzbIbnghjNyafX0JTnyfzRVThCUjWlwTCaB+Xg+57/gAL4pO
	h99iIixWYixyVCczmIEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkQ4V-00BF8c-5B; Fri, 29 Apr 2022 12:50:07 +0000
Received: from mail-qt1-f181.google.com ([209.85.160.181])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkQ4H-00BF4l-HQ; Fri, 29 Apr 2022 12:49:56 +0000
Received: by mail-qt1-f181.google.com with SMTP id fu47so5567819qtb.5;
 Fri, 29 Apr 2022 05:49:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4tqelAYwf2EnKhlkfmEW1Nniwpv4OsNQ/+Rpd0YuVJE=;
 b=masQCoUtCVbH/q7/nBZCUqu4eUa9NBvz60coJc4oN5KSBN1tosfpVoFAsO2MLeQbZw
 YYNnUIsgkI2UsWUq0TSDT2cJDxBE4MSaSG2yuwoDegkMtUc43GYdI9yW8xM3sJf8Gygg
 urJDqMROmW+n+h/oLcTIiG4Pm9iMdDwENhmEGfuYDyZ8akoEBlkI0RfJp+mlaEbZLsGo
 12RgkZbw/Z1aZhN6p8czPWFOXzfTsBrOXTCAkiuBCaENMlqgogebOsqaASRJVZH9Ag1d
 FMtrhLFxJj3e0KBVs9BP6jsUxBScnQsxEFWkSNWmOJ4zZXik6x0vchzne9AWLKL5xH1w
 0+nQ==
X-Gm-Message-State: AOAM532iUbacR5J2dt1fmcrI1jfi8wPoPsUXXvkiVjVLJbLEmtFD3J3Z
 AEqXDILBrf0XuV3IBk2cXZipkZjY6Rg33LKu
X-Google-Smtp-Source: ABdhPJwAhG+C2PWQ7nfhMCpPa6Btlv5L5vTQnbDZt3+KMXBLITYZ4VitOsNPlyd6USzzJIxNRH4IYg==
X-Received: by 2002:a05:622a:1807:b0:2f3:65a6:c100 with SMTP id
 t7-20020a05622a180700b002f365a6c100mr18567179qtc.412.1651236588621; 
 Fri, 29 Apr 2022 05:49:48 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com.
 [209.85.128.169]) by smtp.gmail.com with ESMTPSA id
 e16-20020ac85990000000b002f3772de70asm1700796qte.69.2022.04.29.05.49.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 05:49:48 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-2f7bb893309so83699807b3.12; 
 Fri, 29 Apr 2022 05:49:47 -0700 (PDT)
X-Received: by 2002:a81:e10d:0:b0:2f7:bb2a:6529 with SMTP id
 w13-20020a81e10d000000b002f7bb2a6529mr34597687ywh.62.1651236586925; Fri, 29
 Apr 2022 05:49:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220428093355.16172-1-jiaxin.yu@mediatek.com>
 <CAMuHMdWYJofetMwkAH4d8UzKZH77hxwRhXrMhaECOs1suQV2PA@mail.gmail.com>
 <b90426905a486ab720b9d67f00ed869285acd768.camel@mediatek.com>
In-Reply-To: <b90426905a486ab720b9d67f00ed869285acd768.camel@mediatek.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 29 Apr 2022 14:49:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVA-JJqPB9fiUZSeXZR+fa58V5t2OQjaN1-JvGR+K_H4Q@mail.gmail.com>
Message-ID: <CAMuHMdVA-JJqPB9fiUZSeXZR+fa58V5t2OQjaN1-JvGR+K_H4Q@mail.gmail.com>
Subject: Re: [v4 00/18] ASoC: mediatek: Add support for MT8186 SoC
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 aaronyu@google.com, 
 Matthias Brugger <matthias.bgg@gmail.com>, Trevor Wu <trevor.wu@mediatek.com>, 
 Tzung-Bi Shih <tzungbi@google.com>, Julian Braha <julianbraha@gmail.com>, 
 ALSA Development Mailing List <alsa-devel@alsa-project.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-mediatek@lists.infradead.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_054953_604970_DFDAAE5E 
X-CRM114-Status: GOOD (  22.17  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Jiaxin,

On Fri, Apr 29, 2022 at 11:32 AM Jiaxin Yu <jiaxin.yu@mediatek.com> wrote:
> On Fri, 2022-04-29 at 10:47 +0200, Geert Uytterhoeven wrote:
> > Gmail tends to mark your patches as spam.
> > Can you please make sure to use "PATCH" in the subject line, e.g.
> > "[PATCH v4 00/18] ASoC: mediatek: Add support for MT8186 SoC"?

> Sorry for this mistake, I usually use "git format-patch --subject-
> prefix "v4" --cover-letter -x" to generate a series of patches.
> So it automatically removes "PATCH". I will correct the cmd to "git
> format-patch --subject-prefix "PATCH v4" --cover-letter -x".

You can just use e.g. "-v4" instead of the --subject-prefix option.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
