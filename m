Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E7DC61DB9
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2026 04:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hAwpBFNZhlk+iUoQ0SaXUDwsH3Pa5MlZJTjzptBryTM=; b=RAvdOBBkPiuxsW7BjQWZx3TypK
	Uwl+9IdFyi+TJRRuFAv49Nz3PA5J66qoGYlJwXCdDsLDlGHJmDMLLQZUL4Pm8slZ1bc/YIEo4Jwn1
	9qQVXZrIpZdYwAzrYU7YiFKcBJDyjF4H8uu2AkvsxWriqh/0Mbj63NmtGRKd6FOqhyok/FPrT9n+I
	LmqrgRIsUOYnlVU0FljBCA+EGvXoGYlmDLQGov4Ui8GHUOHp2QnVp7fmYTyV+Z2zvOrZMzrhnPQBP
	r5TC2HmKDbC9QbnNYB+XCDh9+1eeCKF+afYeLjU6UzPZssKYeTTUSS+YHFiHeEooS6S442uGSSpu7
	ewImki0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wznyd-000000055q0-1mAt;
	Fri, 28 Aug 2026 04:14:03 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wznyb-000000055pV-0pts
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Aug 2026 04:14:02 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2cc891373e0so4113295ad.2
        for <linux-mediatek@lists.infradead.org>; Thu, 27 Aug 2026 21:14:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787890440; cv=none;
        d=google.com; s=arc-20260327;
        b=V+j6ebNTWpi4LoanDuW34h2qKcCPy0D2s9Flnx+5dmKGtO9+h89bU+B0j710nv+iJW
         0e5aZuIta14aMPdypZTeWo7KHUqtbjUxlfa1+Vd/+NIjFOufngD7EB1hLo1mwglUn7nY
         kw9kwmICpOqfgy9KHnS4qLg1kkqOgIv7AjJMoDjTwn5zfYJxZeppbMWOoBiK/M4HCtVl
         Uh9xsaUhRI4wVaFegsbkaRCnKVlC+2JZMG8VfWI3K6hoTX1Rf+NVnpTT44B5E4suGHp3
         X6G4DNYct+b+bxCTCfyjf8wh3iXQu09I937mMPIXToW6yeSFrz4GpfdPb37wGvdPXHiB
         j50Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hAwpBFNZhlk+iUoQ0SaXUDwsH3Pa5MlZJTjzptBryTM=;
        fh=Jn+daCK5EN+YZyk7UbVSVNtXrJjh7nt6POUGjihw7pc=;
        b=OMjc33S9QW0KlI9v1iAM7GfY4DPvbcDdB6c0EeToafgvIxVSKHyUG+NvIH52rS+/Ni
         8rGFvWBoW3rHziQyr6Q1iKlZj+/euFWRZo2Ddac0BlhVKVVvnolsSLqX1qfoMdXvqI01
         TrGrnYDAZzBwarRaIxup31JH0uEtWSucZSk1+8muvOHPz/L8QzaJGyKyOHJOa8C2L7WH
         Pv84ezGctT7S8NqdbYwBVOvPHcwMvHrM69aWlw1FhfunV5pn+xlWTD1XellHqhajRlOy
         ncw20gLBaBpnRTAZhbJU9LbO/5f39f3C5agR4004qw4L7eIcuSH1cSJ4FQdZ4jAKixpk
         g2iA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787890440; x=1788495240; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hAwpBFNZhlk+iUoQ0SaXUDwsH3Pa5MlZJTjzptBryTM=;
        b=YVusIgMZZmapIrghjPBXwH9/jP4ezTXBkF6VazOGuuf5JS/ll4hb9WtBdUWPWqXMEG
         ltI3g/ybYRWrs03ADD5vuLjDwsq+k56gqKQZ2PqgHsBKel+b+3WAjgii/986MhjxlO+R
         9/zFHJtSwUCioR2LMWorXZVIDj1nyrZSSQjSQ1kOrd0IDM0nIBcr3ih0FBkQgmZqTQ7Q
         o4j7XzZ/e1Xo6TMoRyR5uio1t5SDPj3AWW+GbuZwfiKS48LgZfLkzx6CBLJRdy/rueqT
         IHqwGFmgb2HTINqbU1xNueWGnoFIGIh0nhlxfRXyRA+2f2BTyqq9z45+7qXK8Lq8Pi2d
         61FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787890440; x=1788495240;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hAwpBFNZhlk+iUoQ0SaXUDwsH3Pa5MlZJTjzptBryTM=;
        b=IjvMaq3mVh2ewsAMAnl1iYv0Xtf4SZB1a7KBqVvPK7WLrrEhXVmbdwhIc15UHxIFb8
         G0hTjWW0cSzXW9aPc5yJ/QZZHo03G5m32s6LXMiQ+MGFUYbUGUxGZZ0GwxZjwuLl6SKR
         eBeofsE4+vsJynWtGogfMW5bcobxpMX5A3RL0ITsCRE1VTMXCt752pjpbbRX/RJdKtWf
         uR9Kwv+WLh3pqWsEVMnWCD4fyJfi7W7U35uAbUchG0lwi0DfFPdjBRT45XsYU5oDnzlW
         pgNCOqI0MQ9T4bsnzML7Xa/ogcsMY7EsrDLRGquJKG89LxchPfmw5RDkm3svxftejYWG
         0IBA==
X-Forwarded-Encrypted: i=1; AHgh+RrN3V0M3eQcNQvwKcdev7pivLcNwcHw2EPb9z6M4eG9xrlJjWsDxMemWeP7FBUptMIZe5mO3sUjMDID9NLB/g==@lists.infradead.org
X-Gm-Message-State: AFuF++mGao9Ttr9fsHYuL44Kx94Nbu0ORLatq+4G8yiXpMEOQM/vm1w1
	+aoMGNfi3BiKExKdp3+CQwioC/h0EWsmDLVD6vJXb9ejdWMXuwxiUN+DQZRiCyHqU8fCyEXfAni
	+2dfuv12Nd5X36S3EmHM0wJZJhQDcGa4=
X-Gm-Gg: AR+sD11WoB6NZ7pFsutQBCOKsnHZzKyx8Q76uybD78Riibr/CDi3idy23+3bktaiG0B
	9ZpDubTdQai4q6o7WTm3kIsZQCtBS2BUgxZtYkDZS7P9Qz7HcM0/xISHxF7/uNpsZE5smsBZPZL
	SnAgX7OfIYSr7NclLO5tkm9mo/zekonjnbN0yi/gf3z2uUg7zwmxQe+fW8SjGMck200KHjYqSFH
	5OaWvsou3MpTU9SQJMRqe3a4n2bJtmongsuKZpBqVUcG1PAppIv+eC8ZPVbfqF+TFv3iFjA3q8c
	qk+LKZTMWNT5dEB1V2chAewqeezkifaIkoSVzOVaXzPRslcn45C5H2No2NPupqGY32qRr2om8yE
	dGfc0C0/uy+QQBJwilTZk5/l28+1A+jh2iXzgByvz7NtqpYO6xeGWaXx6
X-Received: by 2002:a17:90b:2f0f:b0:380:540:d499 with SMTP id
 98e67ed59e1d1-396d0ed0023mr8931366a91.6.1787890440156; Thu, 27 Aug 2026
 21:14:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260821122928.41343-1-phucduc.bui@gmail.com> <20260821122928.41343-3-phucduc.bui@gmail.com>
 <47c14ad6-0311-467b-907c-517ff5044438@intel.com> <CAABR9nHyDL8=EiSi+_GBpHM0xLZraH8az+HRXQWudG=1hLZ7qQ@mail.gmail.com>
 <98b11d2d-8157-4c1b-8562-42ff11cdff60@sirena.org.uk>
In-Reply-To: <98b11d2d-8157-4c1b-8562-42ff11cdff60@sirena.org.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 28 Aug 2026 11:13:48 +0700
X-Gm-Features: AcwNN1VmqsU00XHb8qwR9ukL54h8LR35XqmovAAS6AwR9_5yGXPiNF5RdG4pFBY
Message-ID: <CAABR9nG=CNwVPcqqDE96JWsFYiJN7pBP0Daz9wi4DvYoGiz2Dw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] ASoC: mediatek: mt8183: Fix APLL enable error handling
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_211401_242691_E2B6B730 
X-CRM114-Status: GOOD (  13.07  )
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

Hi Mark, Cezary.

Thank you for your feedback.

>
> > To be honest, after looking at the code for other MediaTek SoCs, I foun=
d quite
> > a few logic issues and inconsistent clock handling. This, along with
> > the git log history,
> > makes me wonder whether these code paths were ever properly tested on
> > real hardware.
> > Therefore, I have stopped at mt8186 for now.
>
> There's a lot of code there with shaky error handling; probably the
> default case works but things blow up relatively easily on error.

If you think these code paths are generally functional on real hardware and
the main issue is the shaky error handling,
I=E2=80=99m happy to continue reviewing the remaining SoCs.

I=E2=80=99ll also apply Cezary=E2=80=99s review comments regarding the cloc=
k handling in
the mux disable path and returning directly from apllx_mux_setting()
instead of using a goto label, and incorporate these changes into the
next patches.

There are also quite a few uppercase goto labels.
I think this cleanup can be addressed separately later.

Best regards,
Phuc

