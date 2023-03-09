Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD1CEC64EC4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 21:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AX0kFryzQ9wNEJRIiuBwJvaQs4qfJWG0KPZfdOauJKg=; b=QfO1raKD31f1yNDZc9ij9fTFU/
	e3X5WwT/pnZsSFQ8P97gGv6XQV//I58wT9KRGTgmrZ3tAnJLQd6L9u+k9l7QGrABxHYgr8+vt+nB0
	SoScLdLhhVCd8r2t4rY1p3hguTq3aPn3gi+g/ic7CxkT2ANdyMZ81Jt+LZ7PWcLvoo1iKJV54lYFd
	MiRmu/9AMSECf2vXh4CaxjYTh49iIm5UzAt73ycTJ98+xyYVAQ67VK0YHqvE5U7HBo9VLogO5LqKz
	r4s8QUIZxs0JdeI0kUWQ+0ehz1R8RRshI5gmGfYHlmmZQ9XT0tR68moLiySYHvNeDVD6O5Rm+i6yT
	2E5lrW6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paNwD-00C1ET-C9; Thu, 09 Mar 2023 21:36:37 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paNw4-00C19T-Om
	for linux-mediatek@lists.infradead.org; Thu, 09 Mar 2023 21:36:32 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-176eae36feaso3792486fac.6
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Mar 2023 13:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678397785;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AX0kFryzQ9wNEJRIiuBwJvaQs4qfJWG0KPZfdOauJKg=;
        b=G5iZj9JNMPqz7ESLkgQ0Ik51gdix1jphc7986eKPWwcCafaqhRStPDGbdYMXE3G51T
         XR1J7WXeIA8vBbt413vuaSrLYUvu4eaU1w38bcEBzEikLiKrJToFBxDKgy7x824Iu48g
         qhyFxANYmpm830eQD7eQ72MyhrAeWcZIoq0aM+SDfhRTBvfGtW1FDU4ZCEcXFaTztdlq
         wv4u2dPfjoq8m8R7X/7AvXXtHXDZ3c99lc7MpQRG1F+OdXZfzeoywlUvBQWQuzvpahRx
         YczkrTMcd5+hFojAH3b74fzuI113P/p2LdKb3yu2nOy98nGyaYL9TyBrbEQKyZ/wUjH5
         Sp1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678397785;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AX0kFryzQ9wNEJRIiuBwJvaQs4qfJWG0KPZfdOauJKg=;
        b=I+UfTt5tsDRv/6/AkJAIkwGAQZGTBLuU+VEEiHF2ebwbS87RCDhZBD1f5SIXYb+jmu
         LjpGugfdAT88ngp8/r6L67DGkhuDIgQlDut5GVJM1YbkmX28NOXt2siYZeiJaOvYYPxD
         lA4qFWmpJ5ygn9YYgFelsrqhJGlbvMSaWiHe3sFg7aU70vSEl4VnwsjIsYtlhOwQLdPo
         97OpL3f+EyOcLyselqyAxNaLXBdL4l49K19T4DRdrHAXZtJvQkOKhl5WelGVBu9cnn4R
         A9UciJ7z3HdYQGP5RmG7ZcjsD9VkJW+fJ/T3XdeQZU+NO6rq2C4IuAIz99QfpYe63TbK
         O/rQ==
X-Gm-Message-State: AO0yUKW7t2EsLl0LImtev4MTjF4Mk4XSEHCWzFS4RiyP/KWsdKpRVwNv
	nAG13XPVYi6B9pPrbIZNmD/ypdTvBYNowj+FmGdTSA==
X-Google-Smtp-Source: AK7set9yYS54QE4EUO4suqJYspm6F8sMoOdVS6y+H0bCghSilwGBZNJt4ZGxplqpZNHflpN8lQuhq7eaZZGw8eMY9+s=
X-Received: by 2002:a05:6870:5a94:b0:16e:85c7:4f9 with SMTP id
 dt20-20020a0568705a9400b0016e85c704f9mr8212404oab.7.1678397785453; Thu, 09
 Mar 2023 13:36:25 -0800 (PST)
MIME-Version: 1.0
References: <20230309143459.401783-1-bero@baylibre.com> <20230309143459.401783-4-bero@baylibre.com>
 <42e0c0fe-3ee5-91df-302a-20193ec64bd3@collabora.com>
In-Reply-To: <42e0c0fe-3ee5-91df-302a-20193ec64bd3@collabora.com>
From: =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>
Date: Thu, 9 Mar 2023 22:36:14 +0100
Message-ID: <CAP2ifjN23Q6wmRQGW7rPG26Yy+FjwaRsgWEMrc_ytQYLKH5ESA@mail.gmail.com>
Subject: Re: [PATCH v10 3/3] arm64: dts: mediatek: Initial mt8365-evk support
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, matthias.bgg@gmail.com, 
	gregkh@linuxfoundation.org, krzysztof.kozlowski+dt@linaro.org, 
	robh+dt@kernel.org, maz@kernel.org, tglx@linutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_133628_892582_895B79F1 
X-CRM114-Status: UNSURE (   4.71  )
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

On Thu, Mar 9, 2023 at 4:21=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:

> > +             compatible =3D "mediatek,mt8365-systimer", "mediatek,mt67=
95-timer";
>
> You mean "mediatek,67 -> 6 <- 5-timer", right? :-P


Yes, of course. Thanks, good catch. I've posted v11, this should fix everyt=
hing.

ttyl
bero

