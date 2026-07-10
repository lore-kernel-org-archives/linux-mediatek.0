Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3BC1C43458
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2026 02:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yV/bSXYSLP9qBujU+T7ka+EuaphsnZ2kIz/iz5VjP4s=; b=BG7wXEcmKrrWhMglJCCDNYpWax
	3LxwAXfQH33szr5niIzm4SUwLLBX6qRCJG68DPKNtpceU/CQ+p9G3TmwGVqp9IjlF8B4AXY4A2Xma
	V9Pnwq2kvtC8oT9tuHD9yYMZGXx16kjE+dOkTaIhYEEATHPe4VibBFRo4EB0OlK7AcJU4M7wmWzyS
	A/UiITk+Y8im5eXYGpqBl7wvJDdMgHFWQELWfbcJLwo8T99nha7/iPtSh34SuarBWneepdy9Pjq2b
	tDXEUCc5Rz9wmyRuaf8EheUu3qQHiWpCBSWRaADvqxZ8WJAl/T9dHd0w7l8xgQD5NZauo6bwPBTI1
	Q0o9tc+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi0cH-00000003wNx-1Gjw;
	Fri, 10 Jul 2026 02:05:25 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi0cE-00000003wNF-0gwe
	for linux-mediatek@lists.infradead.org;
	Fri, 10 Jul 2026 02:05:23 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-84783bce476so458434b3a.0
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Jul 2026 19:05:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783649121; cv=none;
        d=google.com; s=arc-20260327;
        b=JiG7LuOIZ+J5v7tGebPg7doEuA0/EcT2uhusaQSS208ME3poOrp1fYIVjc3x0LaR/8
         ODoyuytmGDaOTvEr4F/zuUMyRb+ezulOx8PS9MaFkKG0V7yMugshonNA9z5J/vbiEimz
         uq9fEUXoS2ho2NMUAjzvaQQUk5JhWrdF7jPeziH+BRybsWcszLB82NpKkDMm1KKcEp0Y
         qMuYaHgSxkG5dinSa+za9u4g/fVsDwz+lpvi5pBdp98LTcyjttcAvyiKD6uWZB9Ypd/q
         zM4Owv5BbYy29BVrj4PVVvFe6Kh963UU27KMvCKuwkgYANFO6Zkh00EZ3+03iJ/tolbV
         F2Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yV/bSXYSLP9qBujU+T7ka+EuaphsnZ2kIz/iz5VjP4s=;
        fh=psIMp5W4n63wGYtMqovnsGhbvHEDAtujRmT1VFiInw8=;
        b=kZMp2tG3X5vBx1uewJcOpqspF7jhkeqa3Dp6ogPw1C3D9Y5PxCHPrSOuo77K0wuwVx
         iioBdK2/TdIn/3XR4C4kvLT3fuSrfjz5o34BjjRgKscsurBp4r8BjnojczjuX+gj3a5O
         S5DMzzF9PuurOebbZQNDX9Na+n8Be+A0Mt2gtryKna9PTHwjM1X6iSxiWl6MoBdF0DoA
         THTUO1FSXU7Wgu+2+8nck2C8iNcXIBUaUSOcolOgdBoiYxXKj3r3mbpM+6LXonsgyRw1
         KPoipUlNhkGHhJf1O8iwCjkLCEZCJZxmCbSvSn+btydc4SeeXPpoz2n65f+ISqAMCatx
         rIlg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783649121; x=1784253921; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yV/bSXYSLP9qBujU+T7ka+EuaphsnZ2kIz/iz5VjP4s=;
        b=tDbF3nPiZ/BT9Segh7x8rzrOq+Hdf6KFqOY3Kd00b1P4eZY/Zh7RNuELNmGxhJ0Cmz
         LvK9bmMi8h0ekyEcFViGTh5rbDeqW9OroONWeJG7YLxy4DTyTSVPuL2c2ClhFozD6l+q
         RmGJoftRCflW1fIFC2tJanJwAvQ7Grfrt+8ME1xG6I/IWy1Tjr17P3XvIJBOFbhkGihY
         a+Pyv+0mENrFre7bt1oiHMjkKAinTb6ewKwO1CtrO8jYW89iP8w6VsL0FiZb9OYI/1T0
         OQNQduBIXNWHNlwVAGTHILpLGJukJddqEqIBzKs5xe48Y+o0hUlFHDWX3qtUdZNeKGhc
         yOiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783649121; x=1784253921;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yV/bSXYSLP9qBujU+T7ka+EuaphsnZ2kIz/iz5VjP4s=;
        b=MDXM+M/ELHcCgmyXNaYXxJudG7Y5uMILHNSt287ez651ZaW9yvzRTKqcEJUZnpnKgT
         TgL2Xn4U0/+NyI+03aaMmJrnX+4vO6Cjvv6UkXDOh1fjV0wUjrm264YavMcWrPzNHeco
         B2KCbpIq4sJ5rDEpqJPb3KXdroz2ahXrIB+66/9RGX+DmfxELGpszEpEdu+KUPijI8jI
         R0K+iXq+62CcTB5KlcdU9Aq1x6LHfnQhUWOlmO3JFKSc+2s8ce4LhKk7UmpktgfboskP
         moH0X8TSAqvL/PJCoRnnV2v9uOuqMhyt+0qacvdXD1zL/gTpwaywSAhikFY1tT5nXz72
         C1Ng==
X-Forwarded-Encrypted: i=1; AHgh+RrxQBHVXBFK+9w7/4lX0io+lkYYxXFTGwyxCVs+53wQTMGKPurcDmeW/yPN9nEJm+uRdnrUQxmgn8NjZoJ9Sw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwENewI0QWAlM0kxJgOqC5kX8rdD29LFwj2SmrNc9EBq+tTs9/8
	IfAKYO4Zt99rvWKCY5mZj5pmi8igFuOcNcqvKmr/97kyo/kGjZhAAvAQd+Q6fzllIkF1wB+XL6j
	9KUMIalhQv/i+8m8hmC0wuMbJCeHkvxY=
X-Gm-Gg: AfdE7clp2550IcPhRtoBIspHGkGxcO2LIH9+hfsJ8qbcnFQqj6O0i1Tb+Pmi9qXXood
	KJFFxmkkiWPyWc/sRoe/yoGxQPahZ8Ihd7OYE/uZw1Uvrtrhh4is66oJxYj5rIPdiUHFOzZDB3o
	jMrUv55PLcF82LJ9Hwu//5Qj+aA7Eq+gwYk26pA72NYAR1lVl9NBy62IhzQ0y9LAwoKbI1LZH8O
	m17qUKkHd21wxGkX3c4uQlg/GyyL7EmhnaCWeQr0H3hj5UwwxeK9uDtNVuZlbdHrIIuVRwN0M5t
	TALiUPGCKJS0LrtDhfHehJDgKAjxwklZQk3qoQ==
X-Received: by 2002:a05:6a00:858d:b0:848:47d3:47ec with SMTP id
 d2e1a72fcca58-84847d34a8emr7759091b3a.31.1783649120744; Thu, 09 Jul 2026
 19:05:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260709045902.498848-1-phucduc.bui@gmail.com> <c74c52c5-91b3-4764-a7a1-26fc940bf735@sirena.org.uk>
In-Reply-To: <c74c52c5-91b3-4764-a7a1-26fc940bf735@sirena.org.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 10 Jul 2026 09:05:09 +0700
X-Gm-Features: AVVi8CdIYYnh9UcwsbAJsmq3JOOUQJGgVvrgAYTobV4qxqGEgOj9QMvwPYMMhSU
Message-ID: <CAABR9nFMAujx-Besf2s=+ok=sctBYfz3s94s8aE8Q_yCSd_sbQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/27] ASoC: codecs: Use guard() for mutex & spin locks
 - part 2
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.com>, Nick Li <nick.li@foursemi.com>, 
	Herve Codina <herve.codina@bootlin.com>, 
	Support Opensource <support.opensource@diasemi.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Srinivas Kandagatla <srini@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>, Oder Chiou <oder_chiou@realtek.com>, Linus Walleij <linusw@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, u.kleine-koenig@baylibre.com, 
	Zhang Yi <zhangyi@everest-semi.com>, Marco Crivellari <marco.crivellari@suse.com>, 
	Kees Cook <kees@kernel.org>, HyeongJun An <sammiee5311@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Qianfeng Rong <rongqianfeng@vivo.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_190522_207717_4DAA9639 
X-CRM114-Status: UNSURE (   9.33  )
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

Hi Mark,

Sorry for the confusion.

> On Thu, Jul 09, 2026 at 11:58:35AM +0700, phucduc.bui@gmail.com wrote:
>
> > bui duc phuc (27):
> >   ASoC: codecs: da7213: Use guard() for mutex locks
> >   ASoC: codecs: da7219: Use guard() for mutex locks
>
> Only the first two of these seem to have come through which has rather
> confused things?

I've hit my email sending limit. I will send the remaining 25 parts
after 24 hours
to ensure they all go through.

Best regards,
Phuc

