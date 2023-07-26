Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 732C4C0015E
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jul 2023 16:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WemSbbi4nmxYWdvYoU1QjodfrKLGaKVRJYiHpPTC3RM=; b=aKsdS4tXg5VSuZ/SDSJlC+iTZ6
	Zfxz07wMvFXinJCLqXV0D4fx9Pom1HrbFMs74s/idNj4FNgpF6//7z3VSvdMafL4I3yrtztuH8Xxm
	wqmsF22N1OGSg2bPSd4+XWIu6tvgKWtefaEwNM/KVd2d0QCKHKPEM5erQcRZ438cgghzno2L0q86/
	a4uGJy3D/5mM6Dp7VK0MfPd2B6TKunf+P4Mnoh9GRwemfMKtAAftdFoeNTGmdY1TiUTUTDuGCU3mE
	Tx0crASnnsvm4vcJt/ak84vhADU3tOV872zIRzVWwmjltVZYuDZCsWANB9FoxV9R7eMXDUFPsiz8E
	8mX1Z7EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOh07-00Awv7-0M;
	Wed, 26 Jul 2023 16:04:35 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOh03-00AwuA-2W;
	Wed, 26 Jul 2023 16:04:33 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-563f4e49ff9so150518a12.3;
        Wed, 26 Jul 2023 09:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690387470; x=1690992270;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WemSbbi4nmxYWdvYoU1QjodfrKLGaKVRJYiHpPTC3RM=;
        b=J0uZTtexUewfxyw8NOt1QJaabWMwcKVAmRiNXdw7EIVcafRcbFpmWYJpX070uwkLeK
         Apemi6nazciA4BoUOE5uFffUn0Fe7lTaMygTPnBYt9xtiqF1RtRUPFXHQez2i3proKBG
         eQ1aGXhownS9FM/d67rYQXP89cZx7X9o4Q+/B1B2jvXZwFu6M6NdNvb0VVgOhlcsdB6I
         LRN6wYwinE67cmw7ZY0L7Cx8by++iVSlczDTexCz5jFu9Auc5S5jOTd9Y3xJfng/L/iP
         IBbmKWmGmkUxQTOX/2qecqjkHl4kFnxlyQAAUB3MWXI/Qp08AGcQhvCoe53NZy9cMbGm
         6SFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690387470; x=1690992270;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WemSbbi4nmxYWdvYoU1QjodfrKLGaKVRJYiHpPTC3RM=;
        b=ReLAjYGLogCpjn5KkuKBAsYYhUgzcxiNxofHLJPZp2Wy6NT3sGrt1DAL6ymb4TUfwe
         Ml2nVhfO+h9EfEBByZGkN/+yhvcKJlcw9L3AD+hdbkqoAeED1ev+QB8FkPiMQFlG16lP
         7cJ0aZcx5c2esqeYMehnlalmEbYwoVZFk4VVCr8ULGH/VH0UznjLXwrnkDKo3IX/nkPA
         Pwo7muR1uZb7beSBAeekz3SH/vu2prbH7uIBdptypgsxIv7QpceWiPKHnucOvYO/f0WE
         w+o1XbaFHATZXVuqU28uxfPcpd+6QV/swoyyQIIMK8X+51wDvRMjf0J02laSgaV3Ubk1
         s6Ew==
X-Gm-Message-State: ABy/qLaVCCnGCNdtP3v/riXS0PnsLVzldbMPEgnV9T5UomOo/plPMPYm
	FyOAD73qhsQIPi4SLM6IZT6XY+hdwTf0jZKIJXY=
X-Google-Smtp-Source: APBJJlF3raRu7/V95hjDIqFG7tdPTZZsjE+OlqvOdwQaOS4lGXOjZbMI2nXIx5RVa9d1ARY03sOAeDCNzU7ZCYQjNyM=
X-Received: by 2002:a17:90b:4018:b0:262:f449:4492 with SMTP id
 ie24-20020a17090b401800b00262f4494492mr1928327pjb.30.1690387469576; Wed, 26
 Jul 2023 09:04:29 -0700 (PDT)
MIME-Version: 1.0
References: <ZK9mXE00xEHZV4fi@makrotopia.org>
In-Reply-To: <ZK9mXE00xEHZV4fi@makrotopia.org>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Wed, 26 Jul 2023 18:04:18 +0200
Message-ID: <CAOiHx=m5jRYd70ymvX=-9Xh4ZDApJ04G39j9+U0YB18W1QPv7A@mail.gmail.com>
Subject: Re: [PATCH] wifi: mt76: support per-band MAC addresses from OF child nodes
To: Daniel Golle <daniel@makrotopia.org>
Cc: linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Kalle Valo <kvalo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Christian Marangi <ansuelsmth@gmail.com>, John Crispin <john@phrozen.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_090431_819493_378D1672 
X-CRM114-Status: GOOD (  20.06  )
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

Hi,

On Thu, 13 Jul 2023 at 04:53, Daniel Golle <daniel@makrotopia.org> wrote:
>
> With dual-band-dual-congruent front-ends which appear as two independent
> radios it is desirable to assign a per-band MAC address from device-tree,
> eg. using nvmem-cells.
> Support specifying MAC-address related properties in band-specific child
> nodes, e.g.
>         mt7915@0,0 {
>                 reg = <0x0000 0 0 0 0>;
>                 #addr-cells = <1>;
>                 #size-cells = <0>;
>
>                 band@0 {
>                         /* 2.4 GHz */
>                         reg = <0>;
>                         nvmem-cells = <&macaddr 2>;
>                         nvmem-cell-names = "mac-address";
>                 };
>
>                 band@1 {
>                         /* 5 GHz */
>                         reg = <1>;
>                         nvmem-cells = <&macaddr 3>;
>                         nvmem-cell-names = "mac-address";
>                 };
>         };
>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  drivers/net/wireless/mediatek/mt76/eeprom.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/eeprom.c b/drivers/net/wireless/mediatek/mt76/eeprom.c
> index dce851d42e083..90ee138843a55 100644
> --- a/drivers/net/wireless/mediatek/mt76/eeprom.c
> +++ b/drivers/net/wireless/mediatek/mt76/eeprom.c
> @@ -106,7 +106,20 @@ void
>  mt76_eeprom_override(struct mt76_phy *phy)
>  {
>         struct mt76_dev *dev = phy->dev;
> -       struct device_node *np = dev->dev->of_node;
> +       struct device_node *child_np, *np = dev->dev->of_node;
> +       u32 reg;
> +       int ret;
> +
> +       for_each_child_of_node(np, child_np) {
> +               ret = of_property_read_u32(child_np, "reg", &reg);
> +               if (ret)
> +                       continue;
> +
> +               if (reg == phy->band_idx) {
> +                       np = child_np;
> +                       break;

When breaking out of the loop here you still hold an additional
reference to child_np, so you need to call of_node_put() for it,
probably after calling of_get_mac_address().

> +               }
> +       }
>
>         of_get_mac_address(np, phy->macaddr);
>

probably just add a of_node_put(child_np); here, of_node_put() seems
to be NULL safe.


Regards,
Jonas

