Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C395C4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Apr 2024 09:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+OReUEDN2frbNEsMpeetqUaCFfc7dipywbbMjiR36/E=; b=BYLusZqAReB9SIrnYRM5cAFMhi
	f3JbU0fCwGXLuyH1XXXcxi4BsU1GR5GwclYU05y8lHZ/rlUwY1ddlaH6pAcAXj+CYN7qQhgGlLp3O
	9NxFeoZ9b9Ce4MU3t3b+6VO/toJj7Vg+TObBzeZbrZFJFxG9cNS1yO4QBa1I6aMkAIm9Zgcc3W/mP
	hr0nS0X0gAuuAxpbfEuDVbhArGZ0qSpQe+h1nWgy2shjgLgILm5ut5TODoGLi/MUFV5RKL9qHSd2t
	TqQXkENGBcg9El5OpmRFDwgOL51h0PKMJ6jqSQAILtoeA3bzWlrpw4HBATMv/ov7m1Rh8x/Gr5sJ+
	rF81Un/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvDCT-0000000GRsm-0IMQ;
	Fri, 12 Apr 2024 09:28:01 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvDCQ-0000000GRqy-17Rw
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Apr 2024 09:27:59 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-516d4d80d00so944127e87.0
        for <linux-mediatek@lists.infradead.org>; Fri, 12 Apr 2024 02:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712914075; x=1713518875; darn=lists.infradead.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+OReUEDN2frbNEsMpeetqUaCFfc7dipywbbMjiR36/E=;
        b=kYvDDqbgZCbQ05yUdWFKIivVnhd0AQOOr9MxNsJV9L0w9wc7GY9boYI73lZEQFzcaT
         5lts8OxU2Grhy5yZzFW9/OP1CWeN3MHAYctK5cxWkfye00wJSk7M+KclteJ6DxKanVun
         0d6F+jjsCHo7qnmjWuETdeMRTeg5aJL5/cFzTkAM6x2xUe4uYSJrJW7dzbu7TjpJYJU/
         JZt2NJq5RqhORuxDauBhvH28mR0iaJrQ8tuR0Ek6De/pDd+P3ghX18ACwdyfLsA2ftQw
         hsHTBtBhQuk1rvx1j2mLSeh/zLE/cNEe6V2uiDD+aoGZG8HR2qnoekESwvp96Ow1htN8
         QafA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712914075; x=1713518875;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+OReUEDN2frbNEsMpeetqUaCFfc7dipywbbMjiR36/E=;
        b=BZASm6VyscyfKcckDW4KUN73rI7rpKctoACgSgVkroTlEX43pSlB+OiZhvxWMqS7Oq
         bJE1xHjClANlnJW/NeM3uXWr7WzE9PGM7RIvtozBPuoGjtb4XvW/rSyUhVdGE4UqIf0p
         S8Ahm4DpzX/G2lRimsNQfPCnwxl4Ddl7qRSaZ1Y+dBbcJ27cA2BpDd8f0xxiJe4Fiqh3
         OoqRV/40u7bEmAjbFPQsTiJLIbYMxSk+qdyUqC6VPvy8ctypBtm5ew2Z4dzJj2hA6QWp
         SB88e10MF20/WotpXyBaKUKQ+SMgPMx6/mYzovyssGjsUFDjVWbyEI4RaAjkIrWtUaoo
         zUOw==
X-Forwarded-Encrypted: i=1; AJvYcCUMXi/iRQ9I0ux904RnmQiXWZ78myuvq8Q+x6jmdF7peGKvmigCm73yswhEsq+UbqLNF+FjsndlOCGFKDxdjcCXRN2zwK9E4GGuj+27h2/aiIQU
X-Gm-Message-State: AOJu0Yw/tLTvnz86YsMfuftFrFA4JnKsZyHbFoExSZY0FLDtT4D6WXUh
	9rCQ+J7H5ryDoala93/x81Kai7M928/4XaseF3pnAUNgBvkknxl7
X-Google-Smtp-Source: AGHT+IEDzAhghf3BkO/RgZqY7va47me9gidgqhOpwVjCxTStASj/0/EN3dB/L+Y1I2Zc2CAZ0pv1BQ==
X-Received: by 2002:a05:6512:60b:b0:518:6f95:1a37 with SMTP id b11-20020a056512060b00b005186f951a37mr1182850lfe.33.1712914075122;
        Fri, 12 Apr 2024 02:27:55 -0700 (PDT)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id u10-20020a5d6aca000000b0033e9d9f891csm3825825wrw.58.2024.04.12.02.27.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Apr 2024 02:27:54 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 Apr 2024 11:27:54 +0200
Message-Id: <D0I1D2J8EB1L.2DPV9W79YKN2C@gmail.com>
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Mingyen Hsieh" <mingyen.hsieh@mediatek.com>, <nbd@nbd.name>,
 <lorenzo@kernel.org>
Cc: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
 <Soul.Huang@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <km.lin@mediatek.com>,
 <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
 <Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
 <Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, "Leon Yen" <leon.yen@mediatek.com>
Subject: Re: [PATCH] wifi: mt76: mt7921: avoid undesired changes of the
 preset regulatory domain
X-Mailer: aerc 0.17.0
References: <20240412085357.13756-1-mingyen.hsieh@mediatek.com>
In-Reply-To: <20240412085357.13756-1-mingyen.hsieh@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_022758_331117_789E2A92 
X-CRM114-Status: GOOD (  14.95  )
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

On Fri Apr 12, 2024 at 10:53 AM CEST, Mingyen Hsieh wrote:
> From: Leon Yen <leon.yen@mediatek.com>
>
> Some countries have strict RF restrictions where changing the regulatory
> domain dynamically based on the connected AP is not acceptable.
> This patch disables Beacon country IE hinting when a valid country code
> is set from usersland (e.g., by system using iw or CRDA).

I always had trouble fully understanding the regulation but isn't the count=
ry
code IE sole purpose to adapt the regulatory of the client ?=20

>
> Signed-off-by: Leon Yen <leon.yen@mediatek.com>
> Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7921/init.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/n=
et/wireless/mediatek/mt76/mt7921/init.c
> index ef0c721d26e3..3c9a5fcd6924 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
> @@ -135,6 +135,13 @@ mt7921_regd_notifier(struct wiphy *wiphy,
>  	dev->mt76.region =3D request->dfs_region;
>  	dev->country_ie_env =3D request->country_ie_env;
> =20
> +	if (request->initiator =3D=3D NL80211_REGDOM_SET_BY_USER) {
> +		if (dev->mt76.alpha2[0] =3D=3D '0' && dev->mt76.alpha2[1] =3D=3D '0')
> +			wiphy->regulatory_flags &=3D ~REGULATORY_COUNTRY_IE_IGNORE;
> +		else
> +			wiphy->regulatory_flags |=3D REGULATORY_COUNTRY_IE_IGNORE;
> +	}
> +
>  	if (pm->suspended)
>  		return;
> =20


