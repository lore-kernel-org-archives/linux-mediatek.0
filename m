Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B02C5FF8860
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Apr 2026 19:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QEwJ0lK1FRVhZ82nSuKWtqBlS4HOBMbpzPCG8GR79rM=; b=gKNY3xG6UFPRFtb/t0iYk3sdem
	W2t3SeSKWhHIXWi05sTrMu6j5gQF6vwR7q3zQOjcrJxY+YmEQq0bH/4wgCjCfRecyYC9wmCIMoCAO
	/nPrvR0Bygzo4XYkbHCesDz9uTmFoIieWVTRNcWDJrnrqv1dbdATsJchx/8AFIR8azK9U/DN5S1SG
	0S3LMfaEEmclohhZ3QBmXRefvPnfpCfYwlQD51Cj1YDJTQ05WnynOzDUkC7gGWjBG75YexHxr9ivv
	zSjjULGTDbHp5HAar3Awzq9ZOSGqJVwx8UcSZDY6ZtSURHCsho1ofe87DhhadtzS32eENoeLNEd3Q
	s47YxnrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHRSM-000000003GR-2r69;
	Mon, 27 Apr 2026 19:17:22 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHRSJ-000000003Fa-3upX
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Apr 2026 19:17:21 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-678a526f374so6343378a12.0
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Apr 2026 12:17:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777317438; cv=none;
        d=google.com; s=arc-20240605;
        b=UpPL0RDm2XWP3vI+bFJFnRZytlI+GIuV0btVlWM0RMJdZ6TnLiB/aO3uC/eSszWXVm
         KHZihb/sO8rf0RaCcJNCsZ93h4biLL7GJmNZb7GVK6vaCXf3w4GlpUAbgVRFrSp/wMAK
         cHS08+rpo6QLsGLuQLVPve0i1mUvn0y9cwrLV/xQUkvgsvDlgK8D4EiOqnZahzUZjw/2
         k7V+9qNEojqQ5OgGV66Rk61fmF+wfN3eRDZa9AxOdNEY416DyqlxJjrd3x0NJoWq4QO4
         T8NxUMMWBlDU1LNe0Ig1U+DioOYnf01fBzQt1NrS0YNgv7W+ckPbhMMl698p1iQO2171
         NtHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QEwJ0lK1FRVhZ82nSuKWtqBlS4HOBMbpzPCG8GR79rM=;
        fh=zo22x12r4FZSmZRqRNkseG0PdlutapMl+jHAXgm7Naw=;
        b=MsT5AjfX0uBl4LQSmoY+0jWVsD0vUj0GlxJKeCsq8bjVeQ2CeCqU2QfMPjJXEDff4c
         NmZ7muG+ocSoRmQrkgmz+zcqHA/19VaUXkOO9XNIuIgKGqya/xCMkoApKnbn89Ae4lN9
         L+Pm3ECPj1yr0rkfNOxP1TyO4KpNOgHHwQQyDNE7LzHE9VEUf2kj0zauGvQD5UiZMxvf
         cwq0cJeWgFLp0Q6fJ+YSQbO+7fTDxplxm9+6gMf44XMeoKlQUcNkrBRYe/FDpC8cTKSO
         GynEwvEvBEUcU4AYh2FN5oVMfRGpjQSK3mzme612t9EkDVa1VskP37JY3C7wd1X3HERG
         DOtA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777317438; x=1777922238; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QEwJ0lK1FRVhZ82nSuKWtqBlS4HOBMbpzPCG8GR79rM=;
        b=kNa9xscH3SNai0sQnpVgmWVEf5AIEHCfMsCtYm0mLllRLXPb5CSJGis7o3QSENJ08U
         o/t8c8vq1Un90yUijKEM/+EtdttlDjyYatbnNFPjGN11m2PIH12xOXxdT+rY+oVA14rE
         p4bH8qDXSqUruRsomTYLJelwZ9KIyJiFwXV3P6NP7sbHf5uN+cuIOzWT+gy0uD3PuqaL
         xnCgVQcF2d4ThD2qOssGzww130kr55qnvYsL+6iZ39ZFUL7S1bV5hqkTdLSXrf9enjZi
         iMwv7yqhoNTxPtVsc3fcxQQqYhf6GweNLTGGPrhdoIelyu42srlsi1eoB1T7GWnUlIea
         LYWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777317438; x=1777922238;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QEwJ0lK1FRVhZ82nSuKWtqBlS4HOBMbpzPCG8GR79rM=;
        b=pBqFRE/QWkZAOUxvlIB6jozaQZs5VZO7flV26HJjX2xzbZ5XB1nqQATj8cHaYv+t13
         VghMrwkooJKmDtmF9y1rMVxtCLE28ix+13zKf3w7xPSvpzFi3KMOoGDs44lPdtDFvgp9
         mfeTEQcgfn/jLW43QEFqsWLs5n0IS0J5AI83LdH6d/w3C1VemX3Z7/ssWo6lwXi0Q2ed
         SmUg7tk57yWGaUzovJ2SZxtN0nNwAvxx7icxaXUNkPEzznQKPIvEK3lxon4QmAyrCij3
         J0hUb8sxPlmreR/silvc1qCpsMp8AqJdUkJBV/GqnACgSptEYx1Mcn6b2x9D9+qyvGVp
         mXPw==
X-Forwarded-Encrypted: i=1; AFNElJ9t4OfrTLlB2QWL1uncAk6FfgVFi9qH9pgrF0QTGE8YPw2PTnNwJD9kq9Yfm4zNnw8vclFXSe2SsJTDda0A8A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxck0We9lu3Rmy036VTx+Zbfn6TB/ikgCCZgRchplyvQKh834dU
	aGzCSSjvPS+XOrxRQYHf6jKbLrQnc7eSC60CTkFHBfLMbri5mAmBmdAR5VpvdAkZN0+H93XC5jc
	xlnAWvouQIe3Mk6SaKUVIag7cxt7lRJQ=
X-Gm-Gg: AeBDietIc/HtGWSww3bI8KmcPZ2LQa0rJ///OwZaygqHYETQuu4ZjlMvRR8C7AMI9Xw
	ocOerLge6hjXcHxiYM4Hw3GdWILtDqs1ssYL3q8v7GFmXlUdlARCxl/RS68TBZNMCr7G/bO5vJX
	5k/b6X9X+twa/fLf4xlHVdaiM/3eKSauWo7ZyFRZwI1JG2/cBMUqasEXkfh0Ywrx5SZf0U2tyvY
	HpW4WLewLtvd7EC6KcKA1dtumRqIVvOieiKH0DqtraB4iUWpVTPv9HlBnecGjX4UVf2zs7muMDZ
	iSaGndV+lb6Zld2z5oGlVPpwJLeb/TVQsnmAh+MqPepqrxfR/N4oNjDcrfWw+9H+1AXG6uXTo6i
	aKqushq6HqSsdW9i+Nmsa+P+aOnYAPBVoG32/h67udLVjy6KF
X-Received: by 2002:a17:907:9453:b0:ba4:73da:c with SMTP id
 a640c23a62f3a-bb80530197fmr4956166b.47.1777317437558; Mon, 27 Apr 2026
 12:17:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260427034427.881389-1-rosenp@gmail.com> <20260427034427.881389-4-rosenp@gmail.com>
 <20260427-hug-baboon-d60bb8fdfa51@spud>
In-Reply-To: <20260427-hug-baboon-d60bb8fdfa51@spud>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 27 Apr 2026 12:17:04 -0700
X-Gm-Features: AVHnY4JrG3QUmyGyx0Gb_wy-V9vfTB4Vk66pF2gttwnm5MDKbGyJbNEFCLFWIDI
Message-ID: <CAKxU2N-mhrhjDEc2MnOvDZC5PpMzj=vRgMemNK4qSQzNQ-=BPQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] wifi: mt76: remove mt76_get_of_data_from_mtd
To: Conor Dooley <conor@kernel.org>
Cc: devicetree@vger.kernel.org, Felix Fietkau <nbd@nbd.name>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"open list:MEDIATEK MT76 WIRELESS LAN DRIVER" <linux-wireless@vger.kernel.org>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	"open list:MIPS" <linux-mips@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_121720_007827_D26A2E71 
X-CRM114-Status: GOOD (  21.37  )
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

On Mon, Apr 27, 2026 at 12:09=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Sun, Apr 26, 2026 at 08:44:27PM -0700, Rosen Penev wrote:
> > mt76_get_of_data_from_mtd has been replaced by
> > mt76_get_of_data_from_nvmem in all usages.
>
> All users in the kernel, but what about other sources of devicetrees?
> Those built into firmware etc? Are there none of those too?
I'm actively removing those: https://github.com/openwrt/openwrt/pull/23113

Anyway, irrelevant here.
>
> Conor.
>
> >
> > Remove it to prevent people from using the deprecated
> > mediatek,mtd-eeprom binding.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/net/wireless/mediatek/mt76/eeprom.c   | 87 -------------------
> >  drivers/net/wireless/mediatek/mt76/mt76.h     |  1 -
> >  .../wireless/mediatek/mt76/mt7915/eeprom.c    |  4 -
> >  3 files changed, 92 deletions(-)
> >
> > diff --git a/drivers/net/wireless/mediatek/mt76/eeprom.c b/drivers/net/=
wireless/mediatek/mt76/eeprom.c
> > index afdb73661866..092804323d81 100644
> > --- a/drivers/net/wireless/mediatek/mt76/eeprom.c
> > +++ b/drivers/net/wireless/mediatek/mt76/eeprom.c
> > @@ -35,89 +35,6 @@ static int mt76_get_of_eeprom_data(struct mt76_dev *=
dev, void *eep, int len)
> >       return 0;
> >  }
> >
> > -int mt76_get_of_data_from_mtd(struct mt76_dev *dev, void *eep, int off=
set, int len)
> > -{
> > -#ifdef CONFIG_MTD
> > -     struct device_node *np =3D dev->dev->of_node;
> > -     struct mtd_info *mtd;
> > -     const __be32 *list;
> > -     const char *part;
> > -     phandle phandle;
> > -     size_t retlen;
> > -     int size;
> > -     int ret;
> > -
> > -     list =3D of_get_property(np, "mediatek,mtd-eeprom", &size);
> > -     if (!list)
> > -             return -ENOENT;
> > -
> > -     phandle =3D be32_to_cpup(list++);
> > -     if (!phandle)
> > -             return -ENOENT;
> > -
> > -     np =3D of_find_node_by_phandle(phandle);
> > -     if (!np)
> > -             return -EINVAL;
> > -
> > -     part =3D of_get_property(np, "label", NULL);
> > -     if (!part)
> > -             part =3D np->name;
> > -
> > -     mtd =3D get_mtd_device_nm(part);
> > -     if (IS_ERR(mtd)) {
> > -             ret =3D  PTR_ERR(mtd);
> > -             goto out_put_node;
> > -     }
> > -
> > -     if (size <=3D sizeof(*list)) {
> > -             ret =3D -EINVAL;
> > -             goto out_put_node;
> > -     }
> > -
> > -     offset +=3D be32_to_cpup(list);
> > -     ret =3D mtd_read(mtd, offset, len, &retlen, eep);
> > -     put_mtd_device(mtd);
> > -     if (mtd_is_bitflip(ret))
> > -             ret =3D 0;
> > -     if (ret) {
> > -             dev_err(dev->dev, "reading EEPROM from mtd %s failed: %i\=
n",
> > -                     part, ret);
> > -             goto out_put_node;
> > -     }
> > -
> > -     if (retlen < len) {
> > -             ret =3D -EINVAL;
> > -             goto out_put_node;
> > -     }
> > -
> > -     if (of_property_read_bool(dev->dev->of_node, "big-endian")) {
> > -             u8 *data =3D (u8 *)eep;
> > -             int i;
> > -
> > -             /* convert eeprom data in Little Endian */
> > -             for (i =3D 0; i < round_down(len, 2); i +=3D 2)
> > -                     put_unaligned_le16(get_unaligned_be16(&data[i]),
> > -                                        &data[i]);
> > -     }
> > -
> > -#ifdef CONFIG_NL80211_TESTMODE
> > -     dev->test_mtd.name =3D devm_kstrdup(dev->dev, part, GFP_KERNEL);
> > -     if (!dev->test_mtd.name) {
> > -             ret =3D -ENOMEM;
> > -             goto out_put_node;
> > -     }
> > -     dev->test_mtd.offset =3D offset;
> > -#endif
> > -
> > -out_put_node:
> > -     of_node_put(np);
> > -     return ret;
> > -#else
> > -     return -ENOENT;
> > -#endif
> > -}
> > -EXPORT_SYMBOL_GPL(mt76_get_of_data_from_mtd);
> > -
> >  int mt76_get_of_data_from_nvmem(struct mt76_dev *dev, void *eep,
> >                               const char *cell_name, int len)
> >  {
> > @@ -163,10 +80,6 @@ static int mt76_get_of_eeprom(struct mt76_dev *dev,=
 void *eep, int len)
> >       if (!ret)
> >               return 0;
> >
> > -     ret =3D mt76_get_of_data_from_mtd(dev, eep, 0, len);
> > -     if (!ret)
> > -             return 0;
> > -
> >       return mt76_get_of_data_from_nvmem(dev, eep, "eeprom", len);
> >  }
> >
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wi=
reless/mediatek/mt76/mt76.h
> > index 527bef97e122..f447ecac664d 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt76.h
> > +++ b/drivers/net/wireless/mediatek/mt76/mt76.h
> > @@ -1339,7 +1339,6 @@ void mt76_seq_puts_array(struct seq_file *file, c=
onst char *str,
> >
> >  int mt76_eeprom_init(struct mt76_dev *dev, int len);
> >  int mt76_eeprom_override(struct mt76_phy *phy);
> > -int mt76_get_of_data_from_mtd(struct mt76_dev *dev, void *eep, int off=
set, int len);
> >  int mt76_get_of_data_from_nvmem(struct mt76_dev *dev, void *eep,
> >                               const char *cell_name, int len);
> >
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c b/drive=
rs/net/wireless/mediatek/mt76/mt7915/eeprom.c
> > index eb92cbf1a284..c24e1276700b 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
> > +++ b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
> > @@ -29,10 +29,6 @@ static int mt7915_eeprom_load_precal(struct mt7915_d=
ev *dev)
> >
> >       offs =3D is_mt7915(&dev->mt76) ? MT_EE_PRECAL : MT_EE_PRECAL_V2;
> >
> > -     ret =3D mt76_get_of_data_from_mtd(mdev, dev->cal, offs, size);
> > -     if (!ret)
> > -             return ret;
> > -
> >       ret =3D mt76_get_of_data_from_nvmem(mdev, dev->cal, "precal", siz=
e);
> >       if (!ret)
> >               return ret;
> > --
> > 2.54.0
> >

