Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9700CD4F5B
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 May 2026 21:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qePMA6zGQFViCPKpo7iLsKN1rs2GVcNovIIZ6LT/puc=; b=dCJoWCyT5j8tVcxjaw25l1UPx+
	AJScuxKxwRrVgBMJOXc75AeY6lq2bItwiwDqioDbKtQSOc/MgqdXcxCgwaiefeiFyhgyTdzCiaZa7
	pyPvk6gwg8JwvXOBlcmA6GyZnUaNtY/8C9zOkPVrwDHab4wR3BWUuy6CjeSmKTUB+d4oxXnf2SiaG
	mv9SX79qiKLH5ttxqNaPnVyEmjCggG/WThSOUXUadLJhYgsPMsqI9kpo8KrUM7KKMymLpvsXKw87x
	vHaGnruJxNxxufWNVkxx02HmolvqxpHBIu5QUiwIq7ltRhDHBzh4jFJKlY7ahvhamPf4f4ASqhyEr
	m7VnvDVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPSRf-00000002t2p-210P;
	Tue, 19 May 2026 21:57:47 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPSRd-00000002t1Q-0lH0
	for linux-mediatek@lists.infradead.org;
	Tue, 19 May 2026 21:57:46 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-bd22b2abaa4so731804966b.0
        for <linux-mediatek@lists.infradead.org>; Tue, 19 May 2026 14:57:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779227862; cv=none;
        d=google.com; s=arc-20240605;
        b=F49Z26yUw+TvoeTHJ1W58urNeq7fzujA6FfhTGu3csaK5BAnPU+8pk+PegJLKOOkZS
         1MWHi28aBqcYBNATYRhdqmqfkoMZmoYqzbR1kxW1rWmL4ddfYpa5q57tX/crfPW200JG
         3/bR3KXrnb1X4sm+b2R+qBWXydN2dDwrD1xchmiB43krBd812n4EHbmRi1Igw2wSulFM
         x59pRyqNtGKn4ZKHx8iA6oc5b0tMzOwubfJ4BEl1aAhe3g+JEj0KlTBipjKyaoT6tw8A
         2/qrxlydnnBgQWgON3o63DEJFF17J0ET4o4quMcrjmzOp1+wdzAlenQhtiL16rN129Al
         EA1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qePMA6zGQFViCPKpo7iLsKN1rs2GVcNovIIZ6LT/puc=;
        fh=eClgsV/UhV/YWaruzipsxA8OsWVHQZn00ySPHIGZjGs=;
        b=Hruzzr1JaZhR+gJ8onwan1mitxGKEMLviHxzw7tOR3vPLiC2U3qVIpdL8d7hNnq/pb
         n+DES/13KJzWXpbkeUyQm0GBo7YH2NE00QdNqsRUgv7RPELzIgjVmHFAwYj0bOZVxHXG
         7QcXxh9NStUy95dq8OJis+BKvRhqkpvkDLft52k+xg9Kgwr5WULN2JlGLzKzYG3UY+ab
         LWdG8kguwExlGMHgV+Kj6CyPFIp3p+duxz9iPOtgENCvHq0q07vsNLFlyLaLaFnj8T+7
         DcEN3TwGelBxm9EqUhiCi0vPufOwikQb0IVwHOsAPO347nlKfLUS51YAahGTXdGcrOpZ
         mpkg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779227862; x=1779832662; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qePMA6zGQFViCPKpo7iLsKN1rs2GVcNovIIZ6LT/puc=;
        b=FCRoFurAehsxwvuBrR5q2/+6TI9hZLqwijUh8LqnmD4c9Tc1+psfFV8lKDED/MpgTs
         qnBOCwnOEm4MqoCL6kaqMPjgggIM5ABRvcIDgtFXDs36ONpySXVnxab5T6iUCMOoffrQ
         2BT0K3wUownYo1x7B+jk/yst0t1YEExd0taaIoOpO0GlbRgEfPSUNaceylW8ojKORNYS
         qFDJnlGINDBIDTTNNzQY8qBDG84wfNDY/oFUvX+P4OrlTduXSjtvyaQUJDt6SJeyXsp8
         ocCR4KNhW79Nmgvy2rOJFv3uvAgU3NxWBJn0ejrIoupNl24Ce56dhhWmwavP4QppAk4s
         Odlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779227862; x=1779832662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qePMA6zGQFViCPKpo7iLsKN1rs2GVcNovIIZ6LT/puc=;
        b=Hh4AJ3C7CyNn2Ix/zdZafuesZOsNQXBXNQd8HP1ewKijBAipNGoaVwVzQeurTSMi91
         qp0vxyM8vdG3+dQykEDmFUi5zwZObNpSeHfO9GgHwZkLOddRXJrBquqQIPV3Le95IDww
         3Cp3+AHjbN0ln6fTRHiZTAH5gdgbTJLhKjhLSmZc7d9fBP3lb26PXLf6ZEVqgPM72iZ+
         OYZXVDKcYW6FdpkEM1hbZi1TXO6TOIc3RRxoZEArkzx18xreDzEAKXZU1hVEul0IeERi
         2SqNEz/zc+WFpKMMA1lESi3u71VW5/0LOg1GrbA+a8RHLYLt48U9shIELQq2eWi2sjkE
         4dhA==
X-Forwarded-Encrypted: i=1; AFNElJ992F2LalbovETxSO/0fmjAIHWBYjduoMO0dEw6RSja+Zw0PTvQHWjOn9Us7Jtwt3iKryQpR0qnlbMGa3C6Kw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzhkHgHmCxnRajbiO+KNsn9vShZJsmJ4aKRQhYmo9z7MWfLeHea
	nQeBb59AZGHrUJB8MuxX/FfnGhWXkkV35dwY3wcmUGyjQL1LtO+Gh6slK8Y7oqOQSC/5YYhudh3
	9QfcarP4FxFE753HVwvQxT8x3kZO303s=
X-Gm-Gg: Acq92OHQg4+SnDTPR01UrXBatYVScUraEAmDxI8IcrCj90gUdYuSpKoOYxwYfZ/ncK2
	XXLJA3haJKiqd8xKrJGe+MqCPtS2mcRLtWW0PTjpmfzEA+yKWovJ64NtnDuD28nEim9HGBQkKMc
	WJh6plSEUA+/rStbx/KJR+NAV7jOvD1WwLjjVn72aQDwCG63e0Pt2Muj67kj9+rzMbKwk52OsdY
	jcFOimoIWHzZkjyiP0p5FfUHOT4QcAgzpkfJPhOZwOvw0BckQxj/DiNq9b5BRGu3/UOcg9WHH+s
	CJvJTAT7Vc2Rcan+7NtgjlW0HYxEanDuyV1ULNB6mI1ZYnrhqGGNQ4RLqdraj7Q/ZZzXO90N0xZ
	dUObj9yo+yHtfJmnpI3oQkdM4PWF/R4vpjgxGaW5jyUAd96JafvMxZp0RAw==
X-Received: by 2002:a17:907:1903:b0:bd0:bc5a:746 with SMTP id
 a640c23a62f3a-bd51797803cmr1264657266b.36.1779227862366; Tue, 19 May 2026
 14:57:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260519010440.629290-1-rosenp@gmail.com> <61fa661f-0281-4b58-8042-f3f60cdc3407@sirena.org.uk>
In-Reply-To: <61fa661f-0281-4b58-8042-f3f60cdc3407@sirena.org.uk>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 19 May 2026 14:57:30 -0700
X-Gm-Features: AVHnY4J23bC0PIprMi7AoskRuLv549OzojT4O6f6SArUx72FsVkA9zMJisbtp4I
Message-ID: <CAKxU2N9E0HE+4U28A2n5m1BODTEzkgeDKeiXYhcwuLR=fnNZJQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt2701: fix snprintf bounds
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_145745_235139_93FE3775 
X-CRM114-Status: GOOD (  13.75  )
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

On Tue, May 19, 2026 at 1:33=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Mon, May 18, 2026 at 06:04:40PM -0700, Rosen Penev wrote:
> > For whatever reason, GCC is unable to figure out that i2s_num is a
> > single digit number, with MT2701_BASE_CLK_NUM being the maximum value i=
t
> > represents. Add a min() call to help it out and fix W=3D1 errors regard=
ing
> > snprintf bounds.
>
> > +     i2s_num =3D min(MT2701_BASE_CLK_NUM, afe_priv->soc->i2s_num);
> >       /* Get I2S related clocks */
> > -     for (i =3D 0; i < afe_priv->soc->i2s_num; i++) {
> > +     for (i =3D 0; i < i2s_num; i++) {
>
> This makes the code rather obscure and will start silently failing if we
> ever get more than 9 clocks, we should at least put a build time assert
> or a warn on in there.
how so? MT2701_BASE_CLK_NUM would increase.

