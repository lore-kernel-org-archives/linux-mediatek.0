Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECBD8C3DA49
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jul 2024 18:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wrUl/QqE0nKjd66nMZZSf0qwwi0vmfglBhqvBDkOk1w=; b=pvPd1OgjqxY6YZKVy3yjxNL+r3
	u5Q94xsIkGhfsSmWo/9gx5TLpnOaGlD4mR8K7Iw9HkOCoEP5uuUCJfGeisoT0oAuMNxs+eXxhP+Y1
	+2PwaTekK6PG2iUhBGEtOvhN9RzOzUZ+TQiSVLOLuskRJrlzMl/LRyE7Nx6eXcmeVQWf7+7xGAXfX
	MvwlagOu7tHHtIIphcXs7UYgUqfJYY2SKRtBXiVNXL7nrHOb5LrIgN1TaQOdXjVZeCu+/AImW/WKh
	ZUSkyCHPcNDEq7bMNOkqGkjqPFBovIHzGgzq7x3vZ18ZcXdGPBxNWn+fGN3llnFC9nnmOrZ/zA9os
	sV3bBYLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYri3-0000000G9vr-2gKk;
	Tue, 30 Jul 2024 18:36:31 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYrgw-0000000G9Zx-26Ru;
	Tue, 30 Jul 2024 18:36:00 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4281ca54fd3so22001095e9.2;
        Tue, 30 Jul 2024 11:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722364520; x=1722969320; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wrUl/QqE0nKjd66nMZZSf0qwwi0vmfglBhqvBDkOk1w=;
        b=TzTR27GVS+AzNIc2DPsKM6IaP6GaMTGwe5r1XdOJZgyWNgpubFnm3grDirT6y0PT04
         fZgk45+zC0g2KxS7XBfgUHei4Us1WE8BD7uJG5XC8pdWITOGt5agm9RH80po3BEl4ROo
         h4UWjODvfN+kDaLuyePBOMNfhb3bx9On4ojtX16gIMveM2+is157xfg795z+ztR+zYjP
         Qc1YqJStIK9vyeBDzOqSotRFw8yz8yPrnVRjd3CeDiyWe7Q1WcGi3kjyMsQ5WBGB2dOg
         QbasEYhS4qBhrjNh0ccHnN8yJyZcgbWA5hlfGjD08zpJYMARwzQ18G8ZEHbicZ0Dtf5Z
         eIjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722364520; x=1722969320;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wrUl/QqE0nKjd66nMZZSf0qwwi0vmfglBhqvBDkOk1w=;
        b=hf3WV8IWyYzC5cbN8YumgKDCgzcBtZnP4jlCS7AGWXu1GWZaXDYkkZwpmf3GWBMvLq
         HL2aMDus15oK5c2ZoTqVAJuCAtIAV8Zv3tz9XY5YXMXK2noBFPz+XtQyzEii80dK8n/C
         tNF55cjWBUqzu+mnwLBtTR/NaZ+3Ea9/qHJiKAYltE/yMBeagJrznRiNApGc/oNtym0m
         1qRFF8zh8OVOMlNb/O83LiBafrICi1eoLabcaE6h2lavbgbvliTcNwWbfCkqS5f1aWh5
         w8KuJUaUGzXVV/grZCgd8sVJZnEZhs1BaZXigC5HONwIs26fhDNYvgZtX43Bv6TDPNFB
         DnRA==
X-Forwarded-Encrypted: i=1; AJvYcCU2qh+l0U1hrdrOEqMvQdSGm3M4qUiIKvaQ5t2KnP6vD3NW5VjSEG7FWhqBeACWPWBMSUn7XFB4HAS6M07ZGOHdySkc6wx0GdS00M/bcBHMDS5DAI2s2XbtnEz6CHkeVPpLGl7Jybu5/4QQEcrrHg8V4GeQiBoixOk=
X-Gm-Message-State: AOJu0YyBvJ7VScZwVXcv0LHmYs3KRpQV994Itd7ZIuIkbUX73JeHZVfq
	FDkGJsCmPnk0/3WWtf7ngzBQoUFEzievxXWuGhMNa8cQfIbLx8cPWEfU81B9K8SsYya5dwMcZ5N
	AcEA7E1i0KHLWxAn901MlHXk7Xe4=
X-Google-Smtp-Source: AGHT+IGUMs3KJS+FkWbup/9qo//aVW8oevFDm36CcNuXhST2ddPZ2LgWixjb4GV1XYV/LixtZssTKYD7kfUBQo+vK48=
X-Received: by 2002:adf:fbcc:0:b0:369:f664:ff4a with SMTP id
 ffacd0b85a97d-36b5d073da8mr8311007f8f.38.1722364519826; Tue, 30 Jul 2024
 11:35:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240729183038.1959-1-eladwf@gmail.com> <20240729183038.1959-2-eladwf@gmail.com>
 <ZqirVSHTM42983Qr@LQ3V64L9R2>
In-Reply-To: <ZqirVSHTM42983Qr@LQ3V64L9R2>
From: Elad Yifee <eladwf@gmail.com>
Date: Tue, 30 Jul 2024 21:35:08 +0300
Message-ID: <CA+SN3soUmtYfM_qVQ7L1gHMSLYe2bDm=6U9UwFLvj35odT0Feg@mail.gmail.com>
Subject: Re: [PATCH net-next v2 1/2] net: ethernet: mtk_eth_soc: use prefetch methods
To: Joe Damato <jdamato@fastly.com>, Elad Yifee <eladwf@gmail.com>, Felix Fietkau <nbd@nbd.name>, 
	Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>
Cc: Stefan Roese <sr@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_113522_563360_ACE428A5 
X-CRM114-Status: GOOD (  15.31  )
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

On Tue, Jul 30, 2024 at 11:59=E2=80=AFAM Joe Damato <jdamato@fastly.com> wr=
ote:
>
> Based on the code in mtk_probe, I am guessing that only
> MTK_SOC_MT7628 can DMA to unaligned addresses, because for
> everything else eth->ip_align would be 0.
>
> Is that right?
>
> I am asking because the documentation in
> Documentation/core-api/unaligned-memory-access.rst refers to the
> case you mention, NET_IP_ALIGN =3D 0, suggesting that this is
> intentional for performance reasons on powerpc:
>
>   One notable exception here is powerpc which defines NET_IP_ALIGN to
>   0 because DMA to unaligned addresses can be very expensive and dwarf
>   the cost of unaligned loads.
>
> It goes on to explain that some devices cannot DMA to unaligned
> addresses and I assume that for your driver that is everything which
> is not MTK_SOC_MT7628 ?

I have no explanation for this partial use of 'eth->ip_align', it
could be a mistake
or maybe I'm missing something.
Perhaps Stefan Roese, who wrote this part, has an explanation.
(adding Stefan to CC)

