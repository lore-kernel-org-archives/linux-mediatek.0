Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C77AC001DC
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 06:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UWTPh21wQ0o2nnFjvu96hvu6BzutgKcmu1Ba9eo4YQk=; b=exiSH4Tl/AwyQnXSw80F62amr0
	DCrBPT2GssiZVAn0EWzA8f9Rlli/2DhWPibFebypfMm4J2mHEt2gSxG2aebz9731PcvYyY14irBTS
	okTvI/OvjHCk3eNRcZFh949wiekoUikEejyYH8ExPlh2ZRlQqkCTVe9f2aXqjQN10rqS6Gw5hJhgB
	8CIJvnLArS4K22aZ9P5Z0JjCreyXe03Tr5sMXovEMELHE52HgyFk5Lu/6kw9/hGATWTWf/AytUiwb
	fLmpSPAbnNOfn85Fg8SqpSNZZ3DYNWXK7WhjF6aUL8Ys2fVzxeDwEvdlhwfFVqS7t1VQGD0HKU8D6
	1t8QB5gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM17i-005zvR-0A;
	Wed, 19 Jul 2023 06:57:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM17N-005zdj-2l;
	Wed, 19 Jul 2023 06:57:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=UWTPh21wQ0o2nnFjvu96hvu6BzutgKcmu1Ba9eo4YQk=; b=XITK3xdT49Vi8RXL50slap5pzY
	tuXPzxfj/XM7OYXqeDEBm5BLtk9SMy7ht53uf8M+qugrjyY1lozzrQlDC0XJ+DexbVdRthgwdW7FW
	KlY3IRADyPw1Te+lLmJADS1xD07EIZ4qGDPdlEUeU5uiz9HM8WEEEPUCW03dAUrX/U6UsaickdWkM
	I5RGdUR+LVQDGWQZWyALIOd+xV4+zWd3fG/Z+SF2CxNn14sECljOzcAEY7BE3aiVEjW7DjS6n7wX+
	sEsU4Cfg+8tfoUqRXD/GQFM2TwJGgO2cof/0U2MMoN6CLckLL5N0USXdO/oRm6ZIMbWFo3A9U1zxj
	ReyAw0dg==;
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLcW3-00AtKO-23;
	Tue, 18 Jul 2023 04:40:53 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-bff89873d34so3978388276.2;
        Mon, 17 Jul 2023 21:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689655128; x=1692247128;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UWTPh21wQ0o2nnFjvu96hvu6BzutgKcmu1Ba9eo4YQk=;
        b=LXn0OrrCc8nSXZdXi43REx4QkR6y4xsPZFtSDG7gHOy94spKlPCdQwoGAcZ4RCR1Mf
         qfWOREEYgEZca/DN3y7fHxeehmfwjrq4cv9yzA1ReNRhqtXmD/3qLV/qW/qOVAZWjd4z
         TsEaVX5pP9DTshtD388ghYE2qFE1x9jNdMzhCTepFqATxb5vCu511APXOXckjSYDmLC+
         OuCLpXbE7ZkuvRxXhIYI2oNxouU57iNEBFIjiA4SVBjom5eBsiAgsc16bXmB/6s0f8sj
         WInpSy37EDWSw1QnKRSK3a+zU78dj6AMybRng8MAJiImSJm4hGdDLmtF/rpLp8fd0MXc
         wl0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689655128; x=1692247128;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UWTPh21wQ0o2nnFjvu96hvu6BzutgKcmu1Ba9eo4YQk=;
        b=R5PsS08yEo9lo6iYLKER9lJh9FejpsH4bmNtPBeg2Wk5C616wR7jd4MTy41kRAWSM5
         C3YSK9lzT0vPwnhdhDuz7tAK92aXgtTMG7h/rGSbRgwQ1Lp0HUYonjPv1yv3X/AwlmYb
         C7DP1sipqYtrLa9REYaJYz/RCydiHGx0afssCgK/BLNzGhV7We6DbTrHJwfdBPM4hTVe
         9XQuP7Q2KOxB74WsoT69FSvVmf52OXJSRxfn1Z1bg+ypF9wsocVCQaT3Oow5x8xuqo0g
         z2Rt6CxKn2xsGvlrjAcmN+4h7IpTt3wKU9VUO1n+rIAfZUZWqShSPrsVZd9tO/jusRvp
         9Z1A==
X-Gm-Message-State: ABy/qLasrJfrFIAkVWCWNR6oy1nBOytP/yjU5vLrpcE7+iQUQzrh+n2F
	1hUaqyRRP/xmcnDJWfb7jMeDhFWIl5xWKns/B5I=
X-Google-Smtp-Source: APBJJlHODCyMhaRZAuj+B70ISRhuEA2eb/B1FFauIWR4wnse95GNXOFli7atYze+0le6B+cGF+V8c+5eR7wh14v97yM=
X-Received: by 2002:a0d:c0c7:0:b0:561:a123:1041 with SMTP id
 b190-20020a0dc0c7000000b00561a1231041mr12706032ywd.29.1689655128450; Mon, 17
 Jul 2023 21:38:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230703181256.3712079-1-azeemshaikh38@gmail.com> <202307121653.4A9C69C655@keescook>
In-Reply-To: <202307121653.4A9C69C655@keescook>
From: Azeem Shaikh <azeemshaikh38@gmail.com>
Date: Tue, 18 Jul 2023 00:38:37 -0400
Message-ID: <CADmuW3UY=w0p-h1h4qOord7z1nFnvpyCOU3fcCaATm_PvFFUeA@mail.gmail.com>
Subject: Re: [PATCH] wifi: mt76: Replace strlcpy with strscpy
To: Kees Cook <keescook@chromium.org>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	linux-hardening@vger.kernel.org, Shayne Chen <shayne.chen@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Kalle Valo <kvalo@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_054051_900455_ABB88D8F 
X-CRM114-Status: GOOD (  14.56  )
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

On Wed, Jul 12, 2023 at 7:54=E2=80=AFPM Kees Cook <keescook@chromium.org> w=
rote:
>
> On Mon, Jul 03, 2023 at 06:12:56PM +0000, Azeem Shaikh wrote:
> > strlcpy() reads the entire source buffer first.
> > This read may exceed the destination size limit.
> > This is both inefficient and can lead to linear read
> > overflows if a source string is not NUL-terminated [1].
> > In an effort to remove strlcpy() completely [2], replace
> > strlcpy() here with strscpy().
> >
> > Direct replacement is safe here since DEV_ASSIGN is only used by
> > TRACE macros and the return values are ignored.
> >
> > [1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strl=
cpy
> > [2] https://github.com/KSPP/linux/issues/89
> >
> > Signed-off-by: Azeem Shaikh <azeemshaikh38@gmail.com>
>
> Looks good -- thing is using return values from the macros.

Just to confirm, you mean *not* using return values from the macros?

