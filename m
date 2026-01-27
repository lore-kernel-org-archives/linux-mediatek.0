Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B222CA6CB6
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jan 2026 09:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MeqVQloYBUgHFacGrCxsF/LQzrrfHdlNQ+KOGNUpnDY=; b=YK4pFWXegM4PXTYN3/jgtvDcdo
	fNsUdVX1e3r6xyO0g0f7uCp2gmoG1jPrsTZ8GZgXwKO99qvAOhGbvPlWXjUYHhFHoaXtVLhX1RMIm
	4c5zq+voJ9CbooWGu4vdUwgFn465fWuaK4zB48dZltsmjtvcWEo9wWY1OsF+C3i4lI1cE6Ip2TOnk
	Rl94jKupAYeBup1dbT26LsMV/LiGC1uAcAmx2fMuai4RYVYRTtCh7soMysUmMhKkHvzlqKvS7H28M
	j3kEFqcDT54Eub4YwtqEn2RENEW5hdyDw041r4E9l9Y7WSS3XgE2wNrIskrwTTWNFJAgOr63acCBB
	U4cB4SZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkeym-0000000DtkN-2ZWt;
	Tue, 27 Jan 2026 09:03:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkeyg-0000000Dtj3-2i3o
	for linux-mediatek@lists.infradead.org;
	Tue, 27 Jan 2026 09:03:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B5DB142DF5
	for <linux-mediatek@lists.infradead.org>; Tue, 27 Jan 2026 09:03:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97D0CC116C6
	for <linux-mediatek@lists.infradead.org>; Tue, 27 Jan 2026 09:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769504593;
	bh=MeqVQloYBUgHFacGrCxsF/LQzrrfHdlNQ+KOGNUpnDY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pPV4DL7m/gJvEHlaiCbGnx+4lsWCYgMcLWzvj+ZC6g2LZ8/ujtsYjQZwM8+zNeHr+
	 lbl0L29BFzybBu0YzW/P8gDh1fhHNrahKL0lP0C8pUEl8A/ud0jLY8XTPG34BV/YCX
	 fHaC1vSf7nRAEdZB+Rg6Fzuu+NGqNjpv/e7le0Hk7ElHPjkArc7MnW04pKzkxEYSds
	 8XBwpoyMTZog+4Y9LHtO9ATOcA1rVBOh4xADhxtlP+mpKgR23jsWPnxO8ywxGK5TTX
	 aGQovehOrhQZm6Rv9M6L7IqWMWq02SoJ7UG1EAhciLIgsWYG9lnDxayANpZ1P2nzcT
	 WRhDrQFDoDtcw==
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-6446c1a7a1cso4366471d50.3
        for <linux-mediatek@lists.infradead.org>; Tue, 27 Jan 2026 01:03:13 -0800 (PST)
X-Gm-Message-State: AOJu0YzwiKap1uAWAFLGyfzhxY9VDDs3euIhWKCcCXdRJON+Lz7RP3UL
	vBSmBZMijgZxRiipe+odcNvwUiYAdCCoW5IggXc5s7OH+FyYN8l2T5RgJ1NknlZF8lzd0+8ssk2
	aHKmJS62wCq1G6+x5UE/Gdn93hfKfpNU=
X-Received: by 2002:a05:690e:b4d:b0:649:6581:a68f with SMTP id
 956f58d0204a3-6498fc15729mr549082d50.19.1769504592911; Tue, 27 Jan 2026
 01:03:12 -0800 (PST)
MIME-Version: 1.0
References: <OS7PR01MB13834D5838A90C138C62CD817BC8AA@OS7PR01MB13834.jpnprd01.prod.outlook.com>
In-Reply-To: <OS7PR01MB13834D5838A90C138C62CD817BC8AA@OS7PR01MB13834.jpnprd01.prod.outlook.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 27 Jan 2026 10:03:02 +0100
X-Gmail-Original-Message-ID: <CAD++jLmx_kdVF9HuOt35EEtFVBYnaRrDYBkTfU4AyaaKeBPdVA@mail.gmail.com>
X-Gm-Features: AZwV_QhrL_MsPD_jNlzFPukjH1u2v412Vs0zwRaVna-VU9spr3ixByrU9UpuLWU
Message-ID: <CAD++jLmx_kdVF9HuOt35EEtFVBYnaRrDYBkTfU4AyaaKeBPdVA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: enable ies_present flag for MT798x
To: Shiji Yang <yangshiji66@outlook.com>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sam Shih <sam.shih@mediatek.com>, 
	Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_010314_702309_53CED676 
X-CRM114-Status: UNSURE (   8.28  )
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

On Sat, Jan 17, 2026 at 4:05=E2=80=AFAM Shiji Yang <yangshiji66@outlook.com=
> wrote:

> The MT798x series SoCs have IES regiter definitions. I think we
> must enable the ies_present flag to correctly configure the pin
> input mode.
>
> Signed-off-by: Shiji Yang <yangshiji66@outlook.com>

No one said anything so patch applied!

Yours,
Linus Walleij

