Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D6AC4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Apr 2024 22:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uSCnoH/PG/sLJ5/4iIf/l5rM69YNjTgXqhE0iC8PjJU=; b=ZjzgvGgkmKcCkJ4CpAE1EpMb1K
	zPZ3kQpXACvpeCqhovcXlCmkBHppyN/GULifGwF3ikPc9RNQOFo5kvVpWwyYdWmXXUWonASOiIFCB
	0c9oZh1H2OkuYcQ0fSC8emzCpaDnhGP+gbUOjWTDtGtb1u4/Lqm66r+99vgoTZNEQN+L8Gbo47WZM
	eJgQcAfGaE34D9eXbSKH6UD7YawNs0DTzwx+s7iNH7+4sxjF7Bfw5ew8yvWs7jrB5RULQdZYTSxQ9
	A9SNLk6hJ1BQW9YkCikPuahmDnFO8Wm2m9+qntFVZyCA9YKcVG5eZpiOas4vSGZXwZT+D/ZW6DFXo
	K1NtuEbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxDec-00000000Bf7-04e3;
	Wed, 17 Apr 2024 22:21:22 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxDeZ-00000000BeP-0QOs
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Apr 2024 22:21:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2E8E8CE1407
	for <linux-mediatek@lists.infradead.org>; Wed, 17 Apr 2024 22:21:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A554C3277B
	for <linux-mediatek@lists.infradead.org>; Wed, 17 Apr 2024 22:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713392475;
	bh=+BAMojwjadnSVQR4EfI2pK9waO2X2I20TlzjslDl02U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VezAkQXDloa+HDoGyJmUuhFB4eJk1guhNZMNlXGZeZjhhls3vRB8ixK8DkxF7drMj
	 CLTkx5PtKAkWxTRq3E+b6H8VmD3dM4k6t1xP+iiGEXrs1PJuPTuTPIc5ROiDPwqTip
	 KckyD9hvgyYBQgLdX4pD//+V0FbSwS8f/KDrjfUEWay8uYZ/Ec+OHa5MsFIj9HuK/N
	 Ud9XHFznb4t1uXL6L9l0x4DVgwntnIv8BgH3/5jUhrOd1PnY+Jvp+xxlxFvh2zuoqR
	 dSy00kpCeenb4w+142Kt9kWODVb3SZBq1Mqt+4UO+hlU2arknRzOmNF2wIRD0ucjFQ
	 DeRKHlZZdFkhQ==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5191b61cad3so36762e87.2
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Apr 2024 15:21:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUIiK/xpbSOYPDHhMOFpR97CV68wcV6NZY1T7aW8vg3w30e/2JKCn5UXou+vP3W0idO6fClxPySr22CMPrV9Y2HsocMytKgPWhc1MG3zeLd7ODY
X-Gm-Message-State: AOJu0Yx0l7kdDdEr/DoclERKpxm2uKjC3rpvgSdMMgcafAQ+aL3MqtGp
	5c703wISKjn2eSmmJp1GQKdNL6su2MeLYbCfyfwPO0scIOyLsNby4bu/MXT98V89MveNH2fMdGb
	G9uKb7JqFAgFl3J2MGX7BSgSaEPY=
X-Google-Smtp-Source: AGHT+IFkfXf2OCtLVJmfncYG6vCXNIfGAjjXv3XCrX64sLKZnXX8ETGX/eAiHdJpp9kzCx98UTabt4bVZADhqzoE7cE=
X-Received: by 2002:a19:4302:0:b0:513:30fd:2991 with SMTP id
 q2-20020a194302000000b0051330fd2991mr271662lfa.0.1713392473669; Wed, 17 Apr
 2024 15:21:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240307110815.527-1-mingyen.hsieh@mediatek.com>
In-Reply-To: <20240307110815.527-1-mingyen.hsieh@mediatek.com>
From: Sean Wang <sean.wang@kernel.org>
Date: Wed, 17 Apr 2024 15:21:01 -0700
X-Gmail-Original-Message-ID: <CAGp9LzqHS5Mdge1V37NGY3MFLwxA8YhRSymB+ijw-5u=Uk-66g@mail.gmail.com>
Message-ID: <CAGp9LzqHS5Mdge1V37NGY3MFLwxA8YhRSymB+ijw-5u=Uk-66g@mail.gmail.com>
Subject: Re: [PATCH] wifi: mt76: mt7925: ensure 4-byte alignment for suspend &
 wow command
To: Mingyen Hsieh <mingyen.hsieh@mediatek.com>, Felix Fietkau <nbd@nbd.name>
Cc: lorenzo@kernel.org, deren.wu@mediatek.com, Sean.Wang@mediatek.com, 
	Soul.Huang@mediatek.com, Leon.Yen@mediatek.com, Eric-SY.Chang@mediatek.com, 
	km.lin@mediatek.com, robin.chiu@mediatek.com, ch.yeh@mediatek.com, 
	posh.sun@mediatek.com, Quan.Zhou@mediatek.com, Ryder.Lee@mediatek.com, 
	Shayne.Chen@mediatek.com, linux-wireless@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_152119_528589_92BB52AC 
X-CRM114-Status: GOOD (  16.20  )
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

Hi nbd,

I'm aware that the patch has been merged into the mt76 tree though.
Could you assist in updating the commit message for the patch in the
mt76 tree by including the appropriate "Fixes" tag and CC to the
stable tree? like Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add
Mediatek Wi-Fi7 driver for mt7925 chips")  Otherwise, the mt7925
cannot operate correctly.
      Sean

On Thu, Mar 7, 2024 at 3:08=E2=80=AFAM Mingyen Hsieh <mingyen.hsieh@mediate=
k.com> wrote:
>
> From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
>
> Before sending suspend & wow command to FW, its length should be
> 4-bytes alignd.
>
> Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 1 +
>  drivers/net/wireless/mediatek/mt76/mt7925/mcu.h      | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drive=
rs/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> index af0c2b2aacb0..ef29d093f9c3 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> @@ -2527,6 +2527,7 @@ int mt76_connac_mcu_set_hif_suspend(struct mt76_dev=
 *dev, bool suspend)
>                         __le16 tag;
>                         __le16 len;
>                         u8 suspend;
> +                       u8 pad[7];
>                 } __packed hif_suspend;
>         } req =3D {
>                 .hif_suspend =3D {
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h b/drivers/ne=
t/wireless/mediatek/mt76/mt7925/mcu.h
> index 2a0bbfe7bfa5..b8315a89f4a9 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
> @@ -535,7 +535,7 @@ struct mt7925_wow_pattern_tlv {
>         u8 offset;
>         u8 mask[MT76_CONNAC_WOW_MASK_MAX_LEN];
>         u8 pattern[MT76_CONNAC_WOW_PATTEN_MAX_LEN];
> -       u8 rsv[4];
> +       u8 rsv[7];
>  } __packed;
>
>  static inline enum connac3_mcu_cipher_type
> --
> 2.18.0
>
>

