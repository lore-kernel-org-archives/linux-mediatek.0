Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E6EC61DC2
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2026 07:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nrk8uUDBNanFfnr96a4o3nFXywW6wHqNdCn0K9fnuO8=; b=Z4V4axUBEVmgl9kwiDyfjBZFf9
	7PzdiZ96ja5tHcdb7Ct9X5VuY69deKLpj492GPkzmGfoHIEVh4b/Xv0IGm+W8mrCQYiFQUOTw1NVy
	Ub8pcrdQ+goTpgPOUQ2Roo1RvRDtQ/LkkkdCUOcTT3J7IrKrTcBmnqODxAiEH4rwxjD0spHJnEn5H
	zD81Kl85BqxksATyPmqg21pdb4lfqKvsbJw5xBQ+sdxLl5+R3oEP7xMiwSJX6CRJ2jCuu8gK5UloG
	Zra3++h70KQPdoYyhYtQV9pEP1H5mMMAsHngwQgNHvxIpe4KbcYCBvOCCP8rv1an3ifws4Nkv85l1
	cFSZbbxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzV08-00000003aXL-378m;
	Thu, 27 Aug 2026 07:58:20 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzV05-00000003aW5-3jNl
	for linux-mediatek@lists.infradead.org;
	Thu, 27 Aug 2026 07:58:19 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-396b3d0df94so299549a91.1
        for <linux-mediatek@lists.infradead.org>; Thu, 27 Aug 2026 00:58:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787817496; cv=none;
        d=google.com; s=arc-20260327;
        b=VJI7kIyDzHl543dOdEiFntjU+Q+7YzvDhd/quV16Q3B1BmpUy3KXae5ziAtJA8tq4r
         +aoyus9eYPP0mWo8wuKE2lZPssXDssBiPDiP09DoYvFZmb8GzB0c423tn1gsDt9LO5Gy
         AJEC1xE9uWXEhkOtrbqpIH/e+ZQKGIcrPu3Dib3c4ki7lpFFiTddlsac8Ck2ZN+ENIg1
         wljuVAOiWFfsg5+hd02f3tehVb6v+gicJdXalULT0frYuT1HuDIv8UTyw8hEYAWgSVyC
         nSCCrOZSE7dSYQ/2/1/xSQDTgn5UmIJ7OdE55ESQEV/eDuuoKE2c7YMrognCMbpe6Jqg
         vSyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Nrk8uUDBNanFfnr96a4o3nFXywW6wHqNdCn0K9fnuO8=;
        fh=TUctwPNCRD+sUHTxhBG/g0Si4NuC5trnYXhwrQBg9Jk=;
        b=NpEZi7odf6V8RlbBzATk/SfilPPoTPzna9XUOhlOmEw74XnhXZWQU4POLSDztdsK52
         Me6rn54vDGRhBwgJsArdyjqalwdORh5qPs2qN6JcrSiJKY7AhivXUROkzXAN05UfqXch
         PElD5mMy7mg4jhMed9M6khwM7Cs71JyXhS3HnxCc8Wr7h/BcbrnPdzeu6osxx51xmDII
         zkk3H1YJKjMyLk+aPUrCV6/LOgeJxcCbJtYUbtzXyz1WSJJ0NGPrkeX/B9Mf2iRdgupb
         3wquMfUXFLkjOyDWRuJ6wtzoOAqJtkVwCE17pkPCJqwTb2kn44yii14G53h/JtkxXmCp
         XDCA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787817496; x=1788422296; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nrk8uUDBNanFfnr96a4o3nFXywW6wHqNdCn0K9fnuO8=;
        b=dHmH/VtDmwUXfShUAbSrUjtGCFzEdpimGPxUHZcNfMrbeL7isqDSnRnE+KqiNDd1J2
         FDXWmrTxM8rNwwLYUpjG9qUdsC/DlH5elS2JD2GpZLD9pRmjXRH0tFOySWDDgv5sW2xQ
         iuzXA+5vz9App6ODUGw0FcQBXgdD8fpJNGLDvbJpWkDOBDQ3CG7bP3URSTvT+tjVc6Uo
         kH1BWCY3j8lP7FTYWZcqt3rDm8fKVV4zKWRXDAfU8oSZcKL0yaKljZZqzzRT6I6RE1YX
         RLN6hFXGRTlWQpOPmintWbfPqQiiOT07I2xAqlYkBrr8/z95q/KvHghoF0ZlKHlDRCxO
         QR3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787817496; x=1788422296;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Nrk8uUDBNanFfnr96a4o3nFXywW6wHqNdCn0K9fnuO8=;
        b=J/nkT8zf/+VM5Zrb6zJLTfWakCzV/GCEkOyeWLb7vfSK/1usVGpwV02cV6b6zBLfpZ
         wn6kzN4fH0Y4K6eSwTWCUoA1fApIWpJYYyIAKv0yE1xOd5RIi+04ifcr/Q77KnjkJK5o
         sXmD8EMjXBL7kpE0MUcc9sQ55/CBRsJYO/fmj/06KtlP5cISNxfYO7H6S0Q0vy67gv1I
         O6IuaogLfSEgkYw0nMpuxC1tTWAdruPG7Kgxr4nrrjHBe1UPs1yJoD0bo1MswRyTR72X
         LWgqdMnYx4zcKNGwFgkJ1FfrsFoX5oObpYYiSrEkc5Jp8ekp5AYP6GQIJQ6UgEdrxf6u
         MdXA==
X-Forwarded-Encrypted: i=1; AHgh+RqBQGalkv2mMxCOJTs0jgjkLMsz8ORbvowe8vId6ePAFDpNqf28TajT418cPVSm0wP+9MAZ0CfE0jWBCB2pVg==@lists.infradead.org
X-Gm-Message-State: AFuF++mIh8vPZLicAx0eYAe7XCbXSbrcS28nppbi8DaHgiSWBo1exq1S
	ji1oOgjknR84G+KTVvG2k7f8WQlbl/DmTH8qIWSuc03o+3DVjpNhuw797x4iwQ1bcZWyXcijkpM
	2m8BNPl7yKWmZ9PhtyFMexnywTxbxkfI=
X-Gm-Gg: AR+sD107TLFrt4e7io3QExk9jHvGzcOiuOOAkXYEyQ7rHbY5oUU9vcRaFWvkZPQzi+M
	hFOGcP/IXDoYltEsGS9hBWPNDuSBwjf8LZ0UHcdjGMVPc6ycfnFmf3rvjQQWL0GCFUeUzN7pDHT
	FQqkE5W9VmNI/+AjChJb/g5138jJX7peb6j32iMPcakO7WkVAXlCHOzaE+pqEjgfQpmKGZKkWnB
	9V9hTj7kz6J3l1kDK6cbZDYma+H6FTH64efLm7Q5BbPcuY8NzMMrtT1DTrXAW1NLk6st2wG+jyO
	DPAzDkTzTcCySXjdy44hJpfDqVDknmzObwUipos6fJxkXMII4bgH65NBuOKcUBL4G5FhvuyQqoA
	K9n9jhglw5ZHe8Z48VgbDj6ClwJf9BjYsFVrnqIItzHFxGwrWXVcUobmT
X-Received: by 2002:a17:90b:1649:b0:37f:fdc8:71b4 with SMTP id
 98e67ed59e1d1-3966d3fe36bmr25869449a91.2.1787817496356; Thu, 27 Aug 2026
 00:58:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260821122928.41343-1-phucduc.bui@gmail.com> <20260821122928.41343-3-phucduc.bui@gmail.com>
 <47c14ad6-0311-467b-907c-517ff5044438@intel.com>
In-Reply-To: <47c14ad6-0311-467b-907c-517ff5044438@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 27 Aug 2026 14:58:04 +0700
X-Gm-Features: AcwNN1XimKrPZge6zf8CptLL1uRO5gf5i0cHec8ah767upjHTgiSMh8y0Tz3b7w
Message-ID: <CAABR9nHyDL8=EiSi+_GBpHM0xLZraH8az+HRXQWudG=1hLZ7qQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] ASoC: mediatek: mt8183: Fix APLL enable error handling
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_005817_958129_9C10B54F 
X-CRM114-Status: GOOD (  19.80  )
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

Hi Cezary,

Thank you for your review.


> I have mixed feelings about appl*_mux_setting().  Take a look at its
> disable-path: if clk_set_parent() fails the follow up
> clk_disable_unprepare() is skipped possibly leaving one of the clks
> hanging.  I'd expect error paths of callers (of said mux_setting()
> function) to ensure all the clks are disabled and unprepared
> unconditionally.
>

Perhaps the primary purpose of the appl*_mux_setting() functions is to
configure the mux, as their names suggest, which may explain why the disable
path is currently structured this way. However, I think your point is valid.

As far as I understand, calling clk_disable_unprepare() before
clk_set_parent() should not cause any issues. Therefore, we could move both
clk_disable_unprepare() calls before changing the parent in the disable path:

------------------------------------
clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_ENG2]);
clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_2]);
ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_ENG2],
                                 afe_priv->clk[CLK_CLK26M]);
if (ret) {
...
goto EXIT;
}
ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_2],
                                afe_priv->clk[CLK_CLK26M]);
if (ret) {
...
goto EXIT;
}
-------------------------------------

To be honest, after looking at the code for other MediaTek SoCs, I found quite
a few logic issues and inconsistent clock handling. This, along with
the git log history,
makes me wonder whether these code paths were ever properly tested on
real hardware.
Therefore, I have stopped at mt8186 for now.


> >       /* setting for APLL */
> > -     apll1_mux_setting(afe, true);
> > +     ret = apll1_mux_setting(afe, true);
> > +     if (ret)
> > +             goto ERR_APLL1_MUX_SETTING;
>
> Why goto? The check is valid but the label in my opinion is unnecessary.
>

The function could return directly here, but I used goto to keep it
consistent with
the existing error handling in this function.

> > +     apll1_mux_setting(afe, false);
> > +ERR_APLL1_MUX_SETTING:
>
> While UPPER case for goto-labels is not part of the coding style I see
> why you did it - to be cohesive with the rest of the file.

Yes, that's right. However, I noticed that the mt8186 code uses
lowercase names for goto labels,
so the style is not consistent across the file.

https://elixir.bootlin.com/linux/v7.2/source/sound/soc/mediatek/mt8186/mt8186-afe-clk.c#L303

Best regards,
Phuc

