Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 412BFC6FD1D
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Apr 2023 07:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r+rQt4gmrq5qwKzw64B4d8UQpgE2yZSNRKo3TaPSvmU=; b=ggXCQpfpV1Gq4Kk/ppp20CO2uv
	dmfWGQx0nqGPhHpX0efUICg6I0jSDsm8dXr+CDWoNNoTpsb9CjEnlr9nLQVSJl+UOktmOS7ZGk05h
	kBXcFTDQmRM/eQ8KB63/hXACOrkO2cNUFMc3fPt6IH/AY7SxcxvyxModYRg3CJViXUWF7HfL2pnKT
	ffzqXRHHt7usDY0V5BskykYnwMiYxY2NWxg0LB5bsstnDECzBtcbmTiF+7CKbNAj4Nq/my+MbZQ48
	dndPFF00WytXAf2kl28sL7mkIXhijRUZTkHzaCjYjOmdaMn8dGpYkFDDuKg/1TqG2WDulw8YLK/bJ
	0jiOn2pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjbKz-000LB6-30;
	Tue, 04 Apr 2023 07:44:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjbKw-000LAN-2L
	for linux-mediatek@lists.infradead.org;
	Tue, 04 Apr 2023 07:44:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680594252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r+rQt4gmrq5qwKzw64B4d8UQpgE2yZSNRKo3TaPSvmU=;
	b=AsHL5D4hOri2HlP+x9kgAgT2Af5zJQ9M2kIfh1yCL4AwS2n2ZMtfLNZLkEYDezWIup975F
	SJwO683QY/bwIpZdj4jUMACN+CR4Rpj4/++icRzYKj3TKUuJrKMwPKdsgTBlxyu/Nw/ZYP
	UpKHvdAe/XWt3JKG9ogOSHApUKkZozs=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-317-3OCC40uQORyjCb02vmAmCw-1; Tue, 04 Apr 2023 03:44:09 -0400
X-MC-Unique: 3OCC40uQORyjCb02vmAmCw-1
Received: by mail-qt1-f199.google.com with SMTP id a19-20020a05622a02d300b003e4ecb5f613so16048186qtx.21
        for <linux-mediatek@lists.infradead.org>; Tue, 04 Apr 2023 00:44:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680594248; x=1683186248;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KPVu/xVyTPL2lLJeVRvlW1mZ4UPcNdLxppLFptaHtWw=;
        b=ZK9Por12k8GEESfNa4G/CRfZ8GC0vD/QUASm25tEaVUA+0W2bPFN9jzcTmz6USNpsA
         t3764TGWqIHeiKov9WI5HhkBbO2LlUEsEQ3KRZ/eB50EfqPXe5S5LME/NBQYIQ6cgQdO
         tAZuxcrwmOTlz/s6wOgWn6LbWXrYN56VPe+LXC5ljnZ1L+9ezeJB+uN0aUsh5VIYlz3y
         QlBFG0vSKYAoxhJwzrSOgv6ENXheBvbi61HVxeBcV42q+EImyMytS5eRkcbUx6LkRYxF
         M6Fjab8hCIC1foyaLom2bWnMuT/suruEwQORowxxJ7QjINK8XILk/0NNrcEkVnN8IXsD
         fi5Q==
X-Gm-Message-State: AAQBX9e/WbzRuQV/mDzNZ/OMXQiizLQRg716VHmC4MEryFBYaPlZvDxr
	rcVKO6OU7IU3VXoJly9oBROmEEG4I8YGElZeefuPjwT5M6o4TrQJi9SFd9Y/9a7Ac8HcTrOwe+d
	Bubs93JS+zGb+Z6jcUiYpxu8WZmRs6PSH
X-Received: by 2002:a05:6214:509b:b0:5af:3a13:202d with SMTP id kk27-20020a056214509b00b005af3a13202dmr2072374qvb.4.1680594248405;
        Tue, 04 Apr 2023 00:44:08 -0700 (PDT)
X-Google-Smtp-Source: AKy350YNPzgAt4LCli7vsPt8ETdKcZYvIfxINM+yAfP6TYUZEhrps0QrwoT66NgD1VoJtY6LVaQvvw==
X-Received: by 2002:a05:6214:509b:b0:5af:3a13:202d with SMTP id kk27-20020a056214509b00b005af3a13202dmr2072350qvb.4.1680594248046;
        Tue, 04 Apr 2023 00:44:08 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-227-151.dyn.eolo.it. [146.241.227.151])
        by smtp.gmail.com with ESMTPSA id t187-20020a3746c4000000b007468cc74c77sm3432729qka.4.2023.04.04.00.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 00:44:07 -0700 (PDT)
Message-ID: <10e9e8dd6eadf68eca55c5742adf18dad23661dc.camel@redhat.com>
Subject: Re: [PATCH v2 net-next 02/10] net: ethernet: mtk_wed: move cpuboot
 in a dedicated dts node
From: Paolo Abeni <pabeni@redhat.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>, netdev@vger.kernel.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org, nbd@nbd.name, 
	john@phrozen.org, sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, 
	lorenzo.bianconi@redhat.com, daniel@makrotopia.org, 
	krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, 
	devicetree@vger.kernel.org
Date: Tue, 04 Apr 2023 09:44:02 +0200
In-Reply-To: <56ed497762b1c031c553210a0e5c7717c6069642.1680268101.git.lorenzo@kernel.org>
References: <cover.1680268101.git.lorenzo@kernel.org>
	 <56ed497762b1c031c553210a0e5c7717c6069642.1680268101.git.lorenzo@kernel.org>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_004414_863234_0E803188 
X-CRM114-Status: GOOD (  14.25  )
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

On Fri, 2023-03-31 at 15:12 +0200, Lorenzo Bianconi wrote:
> Since the cpuboot memory region is not part of the RAM MT7986 SoC,
> move cpuboot in a deidicated syscon node.
> Keep backward-compatibility with older dts version where cpuboot was
> defined as reserved-memory child node.
>=20
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/ethernet/mediatek/mtk_wed_mcu.c | 34 +++++++++++++++++----
>  drivers/net/ethernet/mediatek/mtk_wed_wo.h  |  3 +-
>  2 files changed, 30 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/mediatek/mtk_wed_mcu.c b/drivers/net/et=
hernet/mediatek/mtk_wed_mcu.c
> index 6624f6d6abdd..797c3b412ab6 100644
> --- a/drivers/net/ethernet/mediatek/mtk_wed_mcu.c
> +++ b/drivers/net/ethernet/mediatek/mtk_wed_mcu.c
> @@ -18,12 +18,23 @@
> =20
>  static u32 wo_r32(struct mtk_wed_wo *wo, u32 reg)
>  {
> -=09return readl(wo->boot.addr + reg);
> +=09u32 val;
> +
> +=09if (!wo->boot_regmap)
> +=09=09return readl(wo->boot.addr + reg);
> +
> +=09if (regmap_read(wo->boot_regmap, reg, &val))
> +=09=09val =3D ~0;
> +
> +=09return val;
>  }
> =20
>  static void wo_w32(struct mtk_wed_wo *wo, u32 reg, u32 val)
>  {
> -=09writel(val, wo->boot.addr + reg);
> +=09if (wo->boot_regmap)
> +=09=09regmap_write(wo->boot_regmap, reg, val);
> +=09else
> +=09=09writel(val, wo->boot.addr + reg);

Very minor nit: it would be more consistent with the read function
above if you invert the 2 branches, e.g.:

=09if (!wo->boot_regmap)
=09=09writel(val, wo->boot.addr + reg);
=09else
=09=09regmap_write(wo->boot_regmap, reg, val);

No need to repost just for the above, just take into consideration if a
new version will be needed for other reasons (DT)

Cheers,

Paolo


