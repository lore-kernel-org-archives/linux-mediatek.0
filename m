Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B02CA5FF1
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Oct 2026 11:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ccFrIMNi8thTcS7ezaWwGEgxkFr3q3PBiPerXaosRs=; b=j+uiqQbLe9HtahooEfCFzZ+gfI
	PTcaVge4xJi19q0rB310QLFqgAkC4ZJqFBaJcbhs+XpsSH7BCNZjKOHxDEoUW9SBrIGEFckDVEIpj
	VrIkGUP90aaUnIQWtKjqHRPkxOV3+/jfaf04I6cvpdnwM9fBW6yK42D0mPRp87aBWspm+LjpVt9pu
	VJ1UBufulH3v155Fs9o3hJICmnDRYS3WwC53aF3Zh7pGHbpR73DJMYo8jHJwFCYIPpSazUgRgmCJU
	9hBSvNBeRWHsV5ifvva7qMamxpwH0VADDLgy7VeOyPZd7kmXdQZYjf9TvMrm93iqeI294VN0PZhGR
	xD/19+7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPw9-00000002L2O-2iy3;
	Wed, 07 Oct 2026 11:35:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPw8-00000002L1z-0M3m
	for linux-mediatek@lists.infradead.org;
	Wed, 07 Oct 2026 11:35:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 785DA6022E
	for <linux-mediatek@lists.infradead.org>; Wed,  7 Oct 2026 11:35:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30E3B1F008A7
	for <linux-mediatek@lists.infradead.org>; Wed,  7 Oct 2026 11:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791372951;
	bh=6ccFrIMNi8thTcS7ezaWwGEgxkFr3q3PBiPerXaosRs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=O13lfC7fZI9543LnfkOM+QX7j9+aaHndmCvTCIC6h91hpGup8MzTEpnynKjXdoZxh
	 Usa68LauI/yxnM5kMkcteBMqM+dXJyfmA5iNFArfOTIGaxktgx+JDT07pZ4cyp5WCp
	 RJVU3xKj+9JPMuxHQCCgPctfFqtgJdyYPfgycRKoUPiNWsNlh4uQ3IXOrzsSr2RUuK
	 3HI5zD73WDuBep40/gojfCA+imj5MFVoCsI2sh8WGdTWCWUOHO7pb5TtDN+zHaZNQR
	 /dGFUvq1H0erUXpjM0bBkQy5vww9kWFZVltHMqqlncqPB2xX3EiQG9TBiebx1FKkWH
	 b+HOoRLWRCDGg==
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-49e1251674cso1332645fac.2
        for <linux-mediatek@lists.infradead.org>; Wed, 07 Oct 2026 04:35:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByXXS40ff/3VwPqEBvcI8wheMhlI/aMR7SN2qthFCXeRct5YN0zOjvNhirxmWs0N+jYN2fCMDVDeL0xEw/vfQ==@lists.infradead.org
X-Gm-Message-State: AFuF++nHDia4q4Pkxb/DEd2L4AYtoTf0ToKkTkbHDVb9uw2n+nu2qTZz
	vtv7kS2O1cGYQ7nLRtcRRcIA7g9jstmd679KAATpcOQMgFl28cXzk5QNyqdwLqB09ExngVOv5Y6
	yYKrwcGEujGqnAslBywIAjGTlWqTJHn0=
X-Received: by 2002:a05:6870:d406:b0:49d:999d:c25a with SMTP id
 586e51a60fabf-4a25915bdc1mr1996175fac.6.1791372950531; Wed, 07 Oct 2026
 04:35:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260925-mt6735-pinctrl-v9-v10-6-cc042983c565@protonmail.com>
In-Reply-To: <20260925-mt6735-pinctrl-v9-v10-6-cc042983c565@protonmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 7 Oct 2026 13:35:36 +0200
X-Gmail-Original-Message-ID: <CAD++jLkupRELX-nA=ZWjCaE4=gzipE_njzxHtVXEo+7O3AUtag@mail.gmail.com>
X-Gm-Features: AclHuK8iblHRTpngvxt6CuhsOQoecYGccKQlKm7R1bCu_zgHyfj-gKel07yiWEg
Message-ID: <CAD++jLkupRELX-nA=ZWjCaE4=gzipE_njzxHtVXEo+7O3AUtag@mail.gmail.com>
Subject: Re: [PATCH v10 6/6] pinctrl: mediatek: Add MT6735 pinctrl driver
To: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Sean Wang <sean.wang@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Andy Teng <andy.teng@mediatek.com>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Sep 25, 2026 at 8:54=E2=80=AFPM Yassine Oudjana
<y.oudjana@protonmail.com> wrote:

> Add a driver for the MediaTek MT6735 SoC pin controller. This driver
> also supports the pin controller on MT6735M, which lacks 6 physical
> pins (198-203) used for MSDC2 on MT6735.
>
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>

Patch applied!

Yours,
Linus Walleij

