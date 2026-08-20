Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC197C5B572
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2026 01:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=it5S9JSefBP08qQNXkvnIfWUHs/AeH/D7OPJ+RS6iTE=; b=Gi9y8XxWurs7g844wWqDEPEHM2
	ySkeaCgH4tums3s9R66AXxON1aG89Mk9goOs1hsbvl0zWo1fv2jK1t/SV/4NYUEiFXloAZg8ACm7f
	BHOTf80tRhkqV52RgGosl9eIdjG+oqDkrhMgAo11xJx3nkOxkmZOVNpXOrrpO4pC/ZA4DJIiHmwG9
	fAhpYDSmf1RbbFCCy7GhkueglzrjQftMDS3jcWyI4QSamR93JL+oX4lCmwwmM3MPPmjQoEREHibcB
	Aora44SckofUjAnDTzNHZJsQRfr2AnG1qRirez9Vd/DJOjSD52wXQj8aIOVEV4NMkti6zMphhJ4o7
	cDaN6nOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wws1x-0000000Ajuj-0r83;
	Thu, 20 Aug 2026 01:57:21 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wws1t-0000000Ajth-3s61
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Aug 2026 01:57:19 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-8486ac3f347so357990b3a.1
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Aug 2026 18:57:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787191036; cv=none;
        d=google.com; s=arc-20260327;
        b=LxYVLKGUzwsHoCpjeY/0enSLtz43WFnS6kX8CaS4I5OHRX+aEJyYO9YojnT7YWyXHA
         ip5XLEeuobcq04lgjrXw0xYB7MppFGCGo8KeKDyX0XH3VQa62lEzbTz/zL8r3sdvt1iT
         qpiKPttT+hiDeIPXbuznkvRz4ZRclr3/N3Tb+H6udHmNRaJW2+lRatTrdeBptFj70ffG
         CK73R9p7RHw/J+VSevgkTYACOPCaca4IgX58CXIVnqg8jSlVChxsB6q5R+7rJkTf7AAr
         av6jpQoL1BzpVck40yN03kx/sBccMteZBjwxvHBM/tw0gOplPnsbdEn7wMXzfk038gwO
         d/sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=it5S9JSefBP08qQNXkvnIfWUHs/AeH/D7OPJ+RS6iTE=;
        fh=88lcEnToJtpbPOGQ+ej/r8sPOT08FtTwZDrGKw3qtQg=;
        b=GXGSyx1l8Q6S859IYbZjTPh94T4F6fDeCyx33kDamigcSEx174EPcQVVhS6k67lhDC
         DH2Udh7a0g6hawF13ivM+JDoLhRsSXN1a/Wou5wQfWtmoLmua0DHWhSP7YIsZ+SecaUj
         m4cUMoUA41eMqmasBO9QQpWDuZwXV7QdXp6g5LZlngBOOpw8dcxC2rbtDe4HY9qbiF2f
         mP+d3ewlLhDyUnlhZ9OfmBGxmkzJ+Z30zaffDdQDWzHjh2hBZe7uWT1bwpH7vO0l5gQ4
         rCcyBcjp+HCMft24kUSw53nXxPNcvU/+ImT4jKMQ4Ft3LbwiwkMPyuSqOH33T99vRViM
         5I+g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787191036; x=1787795836; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=it5S9JSefBP08qQNXkvnIfWUHs/AeH/D7OPJ+RS6iTE=;
        b=Y/jJWmD1EaYSt35zUJOTyIQJknvLUIzwT2Y2wB8TV3Hwvi+nnJY6nlQEKFWBxaLxAP
         zPY2UzOO2h2hCmk2FoJh9w/aPUwkLhH8z4Xbv57QX6m4dXYqOrDcCzuJQwDXFER75b5h
         4V46ldoHBwDsoxmWFthWRGM+LFe/Cf4mELN1u+oqSecCfgEa56U7/iJQkv55CBK8qTVr
         lOOHwQygf6Yb3Uo26Ta6sZ1ywPyq4Zf/DW3n9Ms0t2zr2I8oW+RbUW+h5VD5VUajXe6n
         Hp+Dnk6evQgkKTfUdx95EsqH23GWAuWMoRc/zJUFH4sCUg3m/4tR3WcYebelgSf+7e8j
         HGuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787191036; x=1787795836;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=it5S9JSefBP08qQNXkvnIfWUHs/AeH/D7OPJ+RS6iTE=;
        b=Y8L0kSvmkaqrgpxbgC4IR/UA3uvFTecFxftE93/gyujwsBLQN31wG9x6trgGdXJ/Y4
         79zES4OwC8ImyW92Pg+KDcxvhzClYAk+N+3jte+t9JtIb5KjgdKDoMprtrWK01QL6oVT
         6hzzEXlOy5hRuGOYXZzssBKpHxB73I2TBMUjFY29s6NfU4KU4Y38fik/dgzWUFfkZuyb
         JGz4bQ734K7ASAV49+MD3MNEwjUNru8E9NieQX6h+1ArOw7WBROleCGXU7+630gg6lA2
         IOhvucR5yAZaUuS8SdXf+YroLmfiwOzLe7QSCzdubp4J4l3RHw1GPoqkb9Q5wp+HDkFf
         UAcg==
X-Forwarded-Encrypted: i=1; AHgh+RppSCVZ9bkV/+2kuVRLxuB027xEB+AkG2ZEXlp7QDeSxhnLkd4qsy7ulm8WGgB/QZP68BalOqCEzs3jzDSuYA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwYlkoQLBgWMsSFT6IiHBkrKUwT7D1xqdwCtNDjsCMrCSHlO8Ll
	sQsRzHFJh6g/V2AMCJk4p14ZDv03dOlRbrxzqmUk+moZaMvcx+2NFVHrCXB2e4xbr9lDIw5EWG0
	AdamR72dviCGRjpO/7ZrsDp4nskWTi3k=
X-Gm-Gg: AR+sD127iF5m2gWYxMUnLsuf4PaVXJg3O2y+JFCWTE4VICXsk89x38/s+nnmIz032ih
	371COlHBTv8uls0VHaOJeBLejE2/xX97Ic3tFA1+l5lVNIVdf0tV/1kxmUorKs45y1/JpTCPQ05
	Xn2nMudzMDLbeIK83D0eWnZe5mcQWNpHC6qG/Y0IDTuB/8uqkhOTCffYSu2IHoM58v64zGMrXN0
	FTUrZo7NQwl9EFYbBODW3UooekYSjREeg/s2GbPY46+yHYtLD7MQBHDmTUolxsUp23porD/4pkk
	RceoZwSo1ByCJHBGTCQMuejdRzIE9HhOCl1o+vaR530NE+89sJ5ZzDp3etDGW0mhORYucK+TWx5
	rkHyLyqlLEuj5SSMvmzaHxmdjWtJm64zFEB3U+sR0zFc04VcMuhuYQyVP
X-Received: by 2002:a05:6300:6182:b0:3b3:3506:cf3f with SMTP id
 adf61e73a8af0-3cd14c6b150mr3711941637.1.1787191036226; Wed, 19 Aug 2026
 18:57:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260819101849.68010-1-phucduc.bui@gmail.com> <20260819101849.68010-2-phucduc.bui@gmail.com>
 <8881e314-0825-4686-a296-97c03b1dd33d@sirena.org.uk>
In-Reply-To: <8881e314-0825-4686-a296-97c03b1dd33d@sirena.org.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 20 Aug 2026 08:57:05 +0700
X-Gm-Features: AcwNN1WvPV8f1W6lpVMiV3TmhZ52Aju5OoAforzPDg8091qw5BC36o8DvhecH-s
Message-ID: <CAABR9nF1VaUKeUDhJydJYYc_Jc0kdYCdD3+rtLNR2SPCx9RPbg@mail.gmail.com>
Subject: Re: [PATCH 2/4] ASoC: mediatek: mt8183: Fix APLL enable error handling
To: Mark Brown <broonie@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Cezary Rojewski <cezary.rojewski@intel.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_185717_960368_FEA58963 
X-CRM114-Status: GOOD (  10.05  )
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

Hi Mark,

Thank you for your review.

> > -     apll1_mux_setting(afe, true);
> > +     ret =3D apll1_mux_setting(afe, true);
> > +     if (ret) {
> > +             dev_err(afe->dev, "%s apll1_mux_setting fail %d\n",
> > +                     __func__, ret);
> > +             goto ERR_APLL1_MUX_SETTING;
> > +     }
>
> apll1_mux_setting() logs errors, do we need to add another log?

Oh, sorry, this was an oversight on my part. The apll1_mux_setting()
function already logs the error,
so there is no need to add another error message here.
I=E2=80=99ll send v2 shortly.

Best regards,
Phuc

