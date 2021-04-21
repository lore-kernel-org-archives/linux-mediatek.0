Return-Path: <SRS0=vHqv=JS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D782C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 16:13:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E5B26144E
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 16:13:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E5B26144E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3rMBf9XQ6V1yizhWkqpEYGKgwVwgY8tRRqqYmXtIupE=; b=JqfnTF0BL1NSV72RVM5zZ2HWE
	EziVPDup7Z0aWb7vZ6nR+7evvjV6hK2s9a9LRiJjlBF3aC0XJ2IvZV4k3DeuPi0P1oK8482g2fvIZ
	FkNx/kSMHmB6XmxzdKK6VYsdoWVYNz5BWkNLC/HXgMEmKXD5OHmVdib8a9ea/9/aNa21woRtKy9VD
	DQZlpGGzIxyLOALNDHxDu3Mbchxx52Rulm4IJbHgtixu94txaPJLoUKFEIf1cQ+f/1ca9YZmN2fR0
	QJcD0NW3dp90UPjpyKlE5hSz4ysXRnCfbCHXs2ZEVlGMDbFtzu3kqaMeE5x+NukhTjfjepgRHG/8T
	78U90vx/g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZFTT-00Ej3H-Jt; Wed, 21 Apr 2021 16:13:11 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZFTH-00Ej2C-R7; Wed, 21 Apr 2021 16:13:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=8jqI6aiH4hwiHUgcEN1wRksGRNJ3OFRgxcK50mKzTYw=; b=afuoGxwSTmKtAQXqr9ZW5OqO9G
 pyWNtkHPs6+g94ZeiBDNbHYSx4iygmnxsDlff/GLipKB+Wv8odhuY6UC56XczWR3C2Kvq5MoYHfPT
 Vt/Tf7Izln0Mh0tTW+3ofAf5x2H3CiY0FFaoDlRUPygNdCyFFJww9Yu2VlPpJAPoCnrS1FD+Zim8e
 oPL8acjLzbwuWr6xx9t4GHpayTA1DLSLrIXvOHC+hEMTufZFDywInIsFhFLThWPg7YWCDlTfptZ8j
 JMdpOAy38bLqW2HjxS/ytpq5F7fUYigOb0wiVeH8xt5sBaoHZRpLsbS08u3fgPCj4hfztrBVNxRvM
 lzxNHGIQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZFTF-00D1Hn-00; Wed, 21 Apr 2021 16:12:58 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5D64E61422;
 Wed, 21 Apr 2021 16:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619021575;
 bh=8jqI6aiH4hwiHUgcEN1wRksGRNJ3OFRgxcK50mKzTYw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fPQcWTXKg4IZRaXn4/53Yl4hzHzapNVbn+DLd1wwgWAjBax7AgkREfPjUsErp4H3M
 jNmMiZ5rPN9f1ZGfy30vQvByCVwwkKhIMSoFglUgUgJETzjLcpNVHGzU+XAWdC4Sq2
 4DajKoc79CxkU0iCv5gL5N+Oo6N2h9YonTOrOCgvGEvTrnBpnh/iYEVV6atDJlFoWX
 gSynMO0aG14h+kWt17RQQqyFQ10/83koXf9icg5K3RmFoJWADw2q3iAK2gxcNtC56f
 GFTU+ScXneP80QZzU+z0fVZ8zZew4jGc5g/HZAcQJfxbOgi57+gJewRRfIY26ho9KK
 CHpSqL7gZO/5w==
Received: by mail-ej1-f42.google.com with SMTP id u17so64380210ejk.2;
 Wed, 21 Apr 2021 09:12:55 -0700 (PDT)
X-Gm-Message-State: AOAM530KWe8wQA+/U3WWNG4DezKMT/u8VXE5we64YXLtE41LJ4PnN1jl
 ydbfomil/Pm6CtNr3O9JB2h7c79w+uYJNzy1mg==
X-Google-Smtp-Source: ABdhPJxOKAdqZq6IBYcoFGb3nyhYuCkTa9hB/kMgxIzc6Zfwc8YSVY7+dSAiZk8bwd57agaZVZVrL3grCvYgGpATndc=
X-Received: by 2002:a17:907:70d3:: with SMTP id
 yk19mr33344448ejb.108.1619021573865; 
 Wed, 21 Apr 2021 09:12:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210419154659.44096-1-ilya.lipnitskiy@gmail.com>
 <20210419154659.44096-3-ilya.lipnitskiy@gmail.com>
 <20210420195132.GA3686955@robh.at.kernel.org>
 <CALCv0x2SG=0kBRnxfSPxi+FvaBK=QGPHQkHWHvTXOw64KawPUQ@mail.gmail.com>
 <trinity-47c2d588-093d-4054-a16f-81d76aa667e0-1619013874284@3c-app-gmx-bs34>
In-Reply-To: <trinity-47c2d588-093d-4054-a16f-81d76aa667e0-1619013874284@3c-app-gmx-bs34>
From: Rob Herring <robh@kernel.org>
Date: Wed, 21 Apr 2021 11:12:41 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKne=ASOyd0E9GakVvDvaXDauHOOU5NgxU8X8ySvyrAcw@mail.gmail.com>
Message-ID: <CAL_JsqKne=ASOyd0E9GakVvDvaXDauHOOU5NgxU8X8ySvyrAcw@mail.gmail.com>
Subject: Re: Re: [PATCH net-next v2 2/2] net: ethernet: mediatek: support
 custom GMAC label
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, 
 Jakub Kicinski <kuba@kernel.org>, Felix Fietkau <nbd@nbd.name>,
 John Crispin <john@phrozen.org>, 
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Russell King <linux@armlinux.org.uk>,
 netdev <netdev@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_091257_145189_F1B5E2B9 
X-CRM114-Status: GOOD (  15.96  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Apr 21, 2021 at 9:05 AM Frank Wunderlich
<frank-w@public-files.de> wrote:
>
> Hi,
>
> for dsa slave-ports there is already a property "label", but not for master/cpu-ports

Is that because slave ports are external and master are not? If so,
that makes sense.

> https://elixir.bootlin.com/linux/v5.12-rc8/source/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts#L163
>
> handled here:
>
> https://elixir.bootlin.com/linux/v5.12-rc8/source/net/dsa/dsa2.c#L1113
>
> @ilya maybe you can rename slave-ports instead of master-port without code change?
>
> i also prefer a more generic way to name interfaces in dts, not only in the mtk-driver, but the udev-approach is a way too, but this needs to be configured on each system manually...a preset by kernel/dts will be nice (at least to distinguish master/cpu- and user-ports).


Seems like it could be possible to want to distinguish port types for
reasons other than just what to name the device. Better to describe
that difference in DT and then base the device name off of that.

If you just want fixed numbering, then 'aliases' node is generally how
that is done (either because it sneaks in or fatigue from arguing
fixed /dev nodes are an anti-feature). There's already 'ethernetN'
which u-boot uses, but the kernel so far does not.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
