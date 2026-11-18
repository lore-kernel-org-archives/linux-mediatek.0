Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B9760A261F
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2026 21:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BiEpC/Q1;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kjSyc0l2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jXpHBT1/WDmLp0zpzRIxDl44SN5leSzeHP8wCtpU/Po=; b=BiEpC/Q1mCLn1w
	oWauwQMfyicOzcQOsi2LKDjsYEzjVrCAfa4tD2K0vbjCAz5du3LGEwLYTXQHR8AF/1S8pAU0Q83EU
	Jdv9tX7EqjBudxenrFH1IJJAI0XbLzS5mkrbU4s5VxcsC95SxBO7uiMCs7VSg9F4UMKfqNzch6CP7
	ndmAtMYTpFr+yfaU/UU7cu6iVjNBYBrl2hZo/592W7BGaiIkmREBEAqocRVdZxZn8Jo/IG/WltTES
	Ze81BvZNBmdCfzAoJiqx52x9ywi/HU4+sjZjKitiS3OoWJA6APwLLK8kpac/gUdTiFfTJLBkjL2Eu
	ejmZ8hbQJsVhqr1GB9Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTn0B-0000000AISi-0HaU;
	Wed, 18 Nov 2026 21:15:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTn0A-0000000AISP-1O5j
	for linux-mediatek@lists.infradead.org;
	Wed, 18 Nov 2026 21:15:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AF01363DF0
	for <linux-mediatek@lists.infradead.org>; Wed, 18 Nov 2026 21:15:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 696CA1F000CB
	for <linux-mediatek@lists.infradead.org>; Wed, 18 Nov 2026 21:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795036533;
	bh=jXpHBT1/WDmLp0zpzRIxDl44SN5leSzeHP8wCtpU/Po=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kjSyc0l2jgfTa1Gr7mPOfzuP6tLnKgnN3OKAYB/HxNNqyFZcDFB46+L21kpljI9ky
	 tJ9h+IalPk9axrIlGCBbpRHL6+29YZuB0IVHAKxz0bo4UY+/W/P9jT12kdqWlun20T
	 2HxNcbk4DkYpClX+2W+G1UfwlY6KHQC5fEW0hNuGW6HVROF5lZNd2YIi+YBww4Uot9
	 Moc3q1Tx7Y0K5G0dZt7BtpTCDpZnSHAZI9DehbqOkkDjGZ7F5pRKWwoKvj6xqWciWf
	 NaL5g8qzFQNgtN34F5iEG1VxHl+YOFKpbN90QuJjw7Ir/pF7E7bE9cpA46y6plbFkh
	 HI60rU5SAnfxw==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5be3d5927ceso1836988e87.3
        for <linux-mediatek@lists.infradead.org>; Wed, 18 Nov 2026 13:15:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF+4CHjujpc2I6hM83Xnz5l8PCcU1KSR5XHq7YYpNFk6NcIKCMJrWu5UsBFem/3vmEsoQKQw3rxYkkIQkY2WA==@lists.infradead.org
X-Gm-Message-State: APuU4Z/D2YG3zty4zf96PeHXFjPx1lnuFG2bzChTDCIBZxNvMQHYqRf7
	Vt89NrVbQjj1j3M3S9rv0hoMc4iuOGAkeugA3QliKnYj0cMm9UMpcrS7uOf3xxmzSyPGT1Fh6+6
	UmvBQR1Q4BfR3hkpaixiBK5sr8UpWpyM=
X-Received: by 2002:a05:6512:1102:b0:5bf:f7e7:85eb with SMTP id
 2adb3069b0e04-5c1aa0736aamr1346704e87.21.1795036532194; Wed, 18 Nov 2026
 13:15:32 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261110094339.749110-1-zhengping.zhang@airoha.com> <695991a0-ae67-4ce0-9b92-f191ae97a468@iopsys.eu>
In-Reply-To: <695991a0-ae67-4ce0-9b92-f191ae97a468@iopsys.eu>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 18 Nov 2026 22:15:15 +0100
X-Gmail-Original-Message-ID: <CAD++jL=_q3SWsh6AW6PLOC=h-z-h-N8AcC8SRCPVKsbzEPktfg@mail.gmail.com>
X-Gm-Features: Aa3M54omwiJF0rg8LzwHPSiyolxNp74aN1hJ5GJPEJYrBTD3qh4Hbo9mWipBH1I
Message-ID: <CAD++jL=_q3SWsh6AW6PLOC=h-z-h-N8AcC8SRCPVKsbzEPktfg@mail.gmail.com>
Subject: Re: [PATCH 00/12] pinctrl: airoha: configure GPIO muxes explicitly
 and fix pad mappings
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Zhengping Zhang <zhengping.zhang@airoha.com>, lorenzo@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, brgl@kernel.org, naseefkm@gmail.com, 
	benjamin.larsson@genexis.eu, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, lei.dong@airoha.com, ansuelsmth@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 15, 2026 at 3:10=E2=80=AFPM Mikhail Kshevetskiy
<mikhail.kshevetskiy@iopsys.eu> wrote:

> Hello Zhengping Zhang,
>
> Please fix your patches. Looks like you insert patches to the e-mail body=
,
> thus your patches were converted to "mail encoding"
> * tabs was replaced by spaces
> * unchanged empty lines "<space>\n" were converted to just "\n"
> * long lines were split with "=3D\n"
> * "=3D" were replaced with "=3D3D"
>
> and so on. So please use "git send-email" for patch sending.

I agree, I can't work with this, maybe review a little.

If possible use the b4 tool to manage your patch set(s).

Yours,
Linus Walleij

