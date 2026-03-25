Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21C4BFEA83C
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Mar 2026 09:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MY2gl1nH38Ouss3TR0Op2BV2a45ltxMnBfWmMEGs8W0=; b=OWB/mB7+bQFWEJ
	J6wZG384xz3RxaYUOtXp/H2ZDAscMORyRY0x7dn8MBOqO7Mi8F7KFDgzEtbVNEwwNVy6i3eAU/SFM
	CREkrQnbqaOOz8J7NIOeNoI7cAzTUGyt8lzOvj1VGtkZnCtrmEG4zD4yth3UrsPq4JbSpEYeBGn7z
	8bWrPiVyp2SlrCxKIx/XKcCZYFDNn80lgoEF81a7bhHe4CufEdd2Fw82bC2gaQlrugVxfpwQfrITH
	cQCzD8tutTbpC4vnt9oqgJ7+P4+AwuAe89gQqJ6bJOl5yXUBnf+N6skKZnL5ExN9tiTns5rA9JrKM
	pNfXCnhtYhzttOqX9Vww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Kcn-00000003406-15bP;
	Wed, 25 Mar 2026 09:34:05 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Kcl-000000033zH-0a9a
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Mar 2026 09:34:04 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5a283c44478so4974173e87.3
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Mar 2026 02:34:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774431241; cv=none;
        d=google.com; s=arc-20240605;
        b=ELnfMFG/tzesVrnFeEQqO72GsVWaY93jDpHAeWwXt300jdZM5V8S01gDKd/+atv1eM
         RlNdmvYyGd4OtMgbjNnzejM2NmGHVWoPWF6wlJntqWcOIfMjBz4CBBw/ZsY+4ZjndvP9
         XQkBxvI5EBmSr9azZrIQGNWEUy910PcM7AZ9exq2IFK+FwjW9ZIjo2YfeiA+BvppUnSd
         4c/xjZpOT0oojFML1Zt14HhZck1BByhaV0UQ2YT1I5m8+a6HxEOOjg/qmhe+6z/7ANEG
         gSPdh9KwufnV+w/Vr9BsjBnw3hDLAu3KxrL+UtqOtQs5ZR9LTAzxOGBRfTgdDyZEGvvA
         q0cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MY2gl1nH38Ouss3TR0Op2BV2a45ltxMnBfWmMEGs8W0=;
        fh=QNJC08BlPq5ZDvGfX++8SFhLQerEVvoQyAZUgBo4I2s=;
        b=ZwOAcvRaK8e8O/t2iDMfU2oQUqReP8q6ProVZmO2MRf9JpjbIkDHn0KDSf/F4+82UO
         Xx8K2PKUVoZZgPV+DWWoj1tuiL/2iDeD/SLW9Jnx4Bhd8u3BPi8qA96WhX03dPEofV5K
         aVH3uQ+brSztivztBOiRwdJCqSDfg+tAp/X0pH7lwqoF8eSHmJUzB5iC2BxI07iZ3UIv
         SITGKnsES8urLLD68PlgBDVb03zpeYapLid8AKn1C7CI3XpRRXrf/PDCr3lk3WkUM2cP
         0xzkyKWjsPY6bylAD3EkxSXAFSOffrblXAZR2aUVQLFpYCKJ1IkDo2pjV6NRhugTLWpi
         m7bg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774431241; x=1775036041; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MY2gl1nH38Ouss3TR0Op2BV2a45ltxMnBfWmMEGs8W0=;
        b=Z7+c4VZffI2YFB1gU19s73DpUlvX6lEeJqA/bZHvE86Dqmt/vpP86WVtUCSSaBBc+d
         Rc0Eh8UtSUxwXv56NwY5IzZOCcx0DDZPE590pxsQCeEUMm5zqT6V+2HZvkCUH7AMp6NA
         MYBWtfYrVOI5a5BY8yD9CVneWgACKfjTyPMfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774431241; x=1775036041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MY2gl1nH38Ouss3TR0Op2BV2a45ltxMnBfWmMEGs8W0=;
        b=p6EzlHRUcpaEZKp2gOXMstnKDBRPqzQudwCTSG1WHfG3cC9SGS6K/DCttQuYPG93nB
         DLUFe+qYWWnFS+n9FRLhiuFzeU7WVB6241j5RYIrFRM6unDvJjzi5MA63WSsHWXe2OI8
         XCn94H4A9QMB+nrfD4ISmXTy744e2n5g3pv6VuE+TBwpH2jAZqi678dP1jEspF3/6olO
         +b/vYqjdiDo+mMLgZrmWjMLo0BMgGMoMl+z7RkZhkWzCjwhU6Re7kSZ9IFRZt1E19p36
         IBxWO0jLmzhUO7qbjc5rjf5eeatA8mUcbXXsZGxThwEIqOf41EyBVLwQDErfXX7/9JRD
         1UCw==
X-Forwarded-Encrypted: i=1; AJvYcCXCxRJvSjSzYPT6Qh04R/slA7g1CIlvZfma2JpLd2qPYmyG6njq5JYAWtsMn2r87hStTVZsquWt70FlXA1OGA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwuON7gTPxZgk8NJ4beoSsTGLqfXmQtzX5YakGj5uKzHFjqJsxx
	VTwS8fDmh3lAVoxXJXusYEJVBI/qxTl9HkB5C+tFRPzfI8vL0qgR/9m2lL3b+g3VjRBfU8GN4zC
	fCb6afGjXlRo2lN8mHgBxB9sApR7Qdcd1UvG9k1wj
X-Gm-Gg: ATEYQzxAW/m6dYwc5t7HcvuM4lfeZNjPNDIx5nce10BJfI+D1O0Miozb68uej2QbtaK
	fSl/cfZj+he1mRyHwQ3nDvRYcHKe92AmwqHlFvFMpKQ1jNpq9BwgKTKhjkMzkPJtvM4KFns5Fmu
	nWuklMdfa2lKdczkmihd9eWQGfXdTCKrsT6mi3Q3mtFle6umWwijYM28XtFHXenE/kHaazMMmWK
	z6ELusMi0nvDHGKGynsCgZMUjlfZjipFZYmZ8ig8sfXftZbNWm5qDUsTrWLhxbJQskK1asf3akE
	kUkBEyxAKYWs42r8/GxALrHHF7f3st59aMNk
X-Received: by 2002:ac2:46c7:0:b0:5a2:95e6:8349 with SMTP id
 2adb3069b0e04-5a29b995620mr642031e87.31.1774431241276; Wed, 25 Mar 2026
 02:34:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260325082546.1572405-1-zhengxingda@iscas.ac.cn> <20260325082546.1572405-2-zhengxingda@iscas.ac.cn>
In-Reply-To: <20260325082546.1572405-2-zhengxingda@iscas.ac.cn>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 25 Mar 2026 17:33:50 +0800
X-Gm-Features: AQROBzBoVW0M0QSdDVNGtSFKBNttJVM9VIsbTSnjXBMQkFjb8Ekw7FmKmmCMyQE
Message-ID: <CAGXv+5EEFtifhMeTKQ9uCvih+Le8XPafxASiVXzd8BW0swaRng@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: mt8173: add hana revision 2
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_023403_197909_BFBAEB97 
X-CRM114-Status: GOOD (  11.00  )
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
Cc: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Max Shevchenko <wctrl@proton.me>, Cristian Cozzolino <cristian_ci@protonmail.com>, Icenowy Zheng <uwu@icenowy.me>, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, Gary Bisson <bisson.gary@gmail.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Mateusz Koza <mateusz.koza@grinn-global.com>, devicetree@vger.kernel.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Mar 25, 2026 at 4:26=E2=80=AFPM Icenowy Zheng <zhengxingda@iscas.ac=
.cn> wrote:
>
> The current mt8173-elm-hana.dts file only contains compatible strings
> for revision 3~6, makes boards with revision 0~2 to fail to match a
> revision-specific DTS and may fall back to the rev7 one (which lacks
> some gpio-keys).
>
> As I've got a Lenovo Flex 11 Chromebook with board revision 2, add it to
> the base hana DTB file.
>
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>

I couldn't dig up which revisions were commercially available, but
our downstream kernel says that regvisions 0 through 6 are all
compatible.

Acked-by: Chen-Yu Tsai <wenst@chromium.org>

