Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73882C54E58
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Mar 2024 09:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gEOWOzX6IKoL6c6ii5LxOxTGEF/+O/+tJriUbFX64KY=; b=BYvD/3Sbjv8Wh0
	SEmvswH22ihPLzbtenauaXRaHYyTrFWNkrLqA/LgSEiGYqD+S1eK9VUduVrWSDwEAPqCgZS6dHrXd
	NZSdNI0zDTw6cxwuBBDzAGtdgiCNI2r8HI9A3F6cYO3jxwr8Jh8aDVqd4YSDQT312xPiKyTCIyMvL
	yyk87/vYAvoBvbzKr1MU005lEkEsWeg3jNM91eObAuCHe95N0iKirQw/y4X7quDFgaXVA7N7frhb6
	IZ5R6V37YtZ/+/pJA/9lRDxZmfdhwrhRYQC1fT9TBUNxC0MNG4uN9EK8JcJalrA1fp4hscdubEazU
	2fs3fXdatfoZ8lbMGXTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnEkW-00000002UV5-40gu;
	Thu, 21 Mar 2024 09:30:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnEkR-00000002URV-1mQV
	for linux-mediatek@lists.infradead.org;
	Thu, 21 Mar 2024 09:30:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711013405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=gEOWOzX6IKoL6c6ii5LxOxTGEF/+O/+tJriUbFX64KY=;
	b=HKAk1Jgr8Ryzsx5kWCh845SLNYe/TneOrmax3oggnhXcLmpErHlBvHUj5cJhMFqJz5vLp8
	eCMukx3PxXLk3fW/gaUN7wbhJk1kk3K0HYlk0lF5Sd/62CTb16IsP3dkrWKewfWdy+EpRw
	LbVWEaPKPYCMJfNSa8QZCgW/nIYjfMs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-oIxGXNy-MYiA7Ud1LCA1Cw-1; Thu, 21 Mar 2024 05:30:02 -0400
X-MC-Unique: oIxGXNy-MYiA7Ud1LCA1Cw-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-33ecafa5d4dso151343f8f.1
        for <linux-mediatek@lists.infradead.org>; Thu, 21 Mar 2024 02:30:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711013401; x=1711618201;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gEOWOzX6IKoL6c6ii5LxOxTGEF/+O/+tJriUbFX64KY=;
        b=tXusJcJpFA9cAs8+H/sCbneKhl074epv6s9dIQK1MDSZqMVo5s+BWeibit7ymBb/Ti
         JwH5dooO357aKDUz16Tgox2NETh+2ybh+AIFIx/Yo1AlZ9+4raSIjbGbumIw36CeesxV
         ha1/xoDuvHXWJN/4z0ZJ6IXQTS6R0fZmDPgeFYi1cmsQmKnzowcnjiDPGainwtgxBNvI
         wnbp9IwAPte7nhvsfxLXt8T9JXlBYKZFxqHYS5EDM/LOEvoPgG40i7yVElu77dVFoQOo
         NMtVR47U4xIPK9yxtyWsc6PSjWyFABvI/hlQcnXsUABu0vgEb3zvo9DBiCRFiGyUgeec
         htew==
X-Forwarded-Encrypted: i=1; AJvYcCVE5VNe+Ndkfi9V6NXmwtRrylKaF0yJq+Xe667V4aLQEILQW9zSjdIy5TMKDz5VM5FlLWukGwdaLgp6VuX6JJiFbpW5OI6w+ZFCyFUlnbH27lx6
X-Gm-Message-State: AOJu0Yy0UmYdFQU0T0gTiAA/I2s6WECqNr2UPpYFLiNEnS8aDV/Jq+rr
	xPJIhRCUDH508m3qRRnDiKHpPwmunK6blr1B0MFXfLzyv+84+6Z0LVaHEgSzMILqWKB/g4TCcZ5
	RIq+Hv10Hd840zqEB/SIe7o/NmUf2ttMXwd4kcW77Jtwu+0voDEn2jqcSILIgcq1vZCvznw==
X-Received: by 2002:a5d:420d:0:b0:33e:cf64:3cae with SMTP id n13-20020a5d420d000000b0033ecf643caemr2795184wrq.6.1711013401713;
        Thu, 21 Mar 2024 02:30:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZKL38fQ0kBB0YPNBOPou+NBPXAESCQCgqsVcrPya+gVQ9qcjAyLxm+5+FxxlReXioFo/UjA==
X-Received: by 2002:a5d:420d:0:b0:33e:cf64:3cae with SMTP id n13-20020a5d420d000000b0033ecf643caemr2795161wrq.6.1711013401310;
        Thu, 21 Mar 2024 02:30:01 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-249-130.dyn.eolo.it. [146.241.249.130])
        by smtp.gmail.com with ESMTPSA id i18-20020adffc12000000b0033e786abf84sm16745438wrr.54.2024.03.21.02.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 02:30:00 -0700 (PDT)
Message-ID: <9762d71f1b3858c6b362696277702409e885fa1d.camel@redhat.com>
Subject: Re: [PATCH net v2 0/2] MT7530 DSA subdriver fix VLAN egress and
 handling of all link-local frames
From: Paolo Abeni <pabeni@redhat.com>
To: =?UTF-8?Q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>, Daniel
 Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, Sean Wang
 <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli
 <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Date: Thu, 21 Mar 2024 10:29:59 +0100
In-Reply-To: <f6f064b8-efb2-4ab0-94f1-468d5d273d6e@arinc9.com>
References: <20240314-b4-for-net-mt7530-fix-link-local-vlan-v2-0-7dbcf6429ba0@arinc9.com>
	 <f6f064b8-efb2-4ab0-94f1-468d5d273d6e@arinc9.com>
Autocrypt: addr=pabeni@redhat.com; prefer-encrypt=mutual; keydata=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
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_023007_561599_39745CD5 
X-CRM114-Status: GOOD (  15.57  )
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
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, erkin.bozoglu@xeront.com, mithat.guner@xeront.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2024-03-20 at 19:41 +0300, Ar=C4=B1n=C3=A7 =C3=9CNAL wrote:
> On 14.03.2024 12:33, Ar=C4=B1n=C3=A7 =C3=9CNAL via B4 Relay wrote:
> > Hi.
> >=20
> > This patch series fixes the VLAN tag egress procedure for link-local
> > frames, and fixes handling of all link-local frames.
> >=20
> > Signed-off-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
> > ---
> > Changes in v2:
> > - Add Fixes: tag to both patches.
> > - Link to v1: https://lore.kernel.org/r/20240311-b4-for-net-mt7530-fix-=
link-local-vlan-v1-0-d67e6cc31af2@arinc9.com
> >=20
> > ---
> > Ar=C4=B1n=C3=A7 =C3=9CNAL (2):
> >        net: dsa: mt7530: fix link-local frames that ingress vlan filter=
ing ports
> >        net: dsa: mt7530: fix handling of all link-local frames
> >=20
> >   drivers/net/dsa/mt7530.c | 52 +++++++++++++++++++++++++++++++++++++++=
+--------
> >   drivers/net/dsa/mt7530.h | 22 +++++++++++++++++++-
> >   2 files changed, 65 insertions(+), 9 deletions(-)
> > ---
> > base-commit: d7d75124965aee23e5e4421d78376545cf070b0a
> > change-id: 20240208-b4-for-net-mt7530-fix-link-local-vlan-af6e9928ad8d
> >=20
> > Best regards,
>=20
> Reminder this patch series is waiting to be applied.

I hoped to get some feedback from the DSA crew, so it waited a bit in
patchwork. Anyway it looks like it staged long enough and I'll go
through it soon.

Cheers,

Paolo


