Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF1C6EE14D0
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Sep 2023 09:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m2TBjPhN9uyMHRdPdlZGBRjpz24WrszzRQ2gGkDyEa8=; b=C7vHqjCPit27y6SKF+4OAfDD4h
	vJdsISJkfCy55fkgmsRLPi6sRiNKO6FXF8Ze0c6Ar4GTOYc9lrpbYWyj4Wk8CKO9xdTiKBpmxrMQ+
	hhMpZ/Ic2BJulM1x0wRVn3HaIo38finytNMHYNxK0cf/+LJdsTbEUs7HH1ygMNvQUTob1517sxMU7
	uwiMVsfpoVIeAM5mhTFgzr3GBQ27KqC6oXr2ngdnRBruRdr1sG1vRfPn+IS6SgJIsN6v7wfyJClNt
	sLb3XJk5tkoN1fKClGbIdKpnLqDlkrB8HEOSveiEjVBgMNyp6KcXvQmguPUSDalPf3dAKZXZU24BN
	7RWU57HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeBOJ-00BgnW-15;
	Thu, 07 Sep 2023 09:33:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeBOF-00Bgmb-2b
	for linux-mediatek@lists.infradead.org;
	Thu, 07 Sep 2023 09:33:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694079209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m2TBjPhN9uyMHRdPdlZGBRjpz24WrszzRQ2gGkDyEa8=;
	b=bOYGZA3GP+VRZsoe1SQ3V0vfULd7zmDW2OUU4JPMzVNisGzJG+5byscgMn0J0aYDGSKv0h
	1kpfOqG6jCyDJEmTeRYyXOhlFmiSd3OwfCQuIYrToiFK/Mt6AkSYCKtAVS7Nj7b9bF/gZF
	lzmbrjrJPKl89bflDU3oUIf3WADv7xQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-36-W3HRCA6jOpO6xZRA_9wNUg-1; Thu, 07 Sep 2023 05:33:28 -0400
X-MC-Unique: W3HRCA6jOpO6xZRA_9wNUg-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5222c47ab80so127805a12.0
        for <linux-mediatek@lists.infradead.org>; Thu, 07 Sep 2023 02:33:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694079207; x=1694684007;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=55eaXlRBQUU9N09Mwpc7awwH+wml0BVgfM2qq1emsMU=;
        b=dAgwQZDaDwr3aSx6xp2PronxteVMrsnm/boMxGJGsmUpbkIWQvwhVnVxpMHhdGlt/6
         Q4pdiHgf8HWxwAZ1kAatehsgjVFIGzUDLqNz32uVw+8FSlNzS7CAeB+bpJEbQxTODto+
         mubwSEyxbzBJcc+AIlAfp3K0PLYJgZFGL1/2OKexHi907XITWg0IYqGUzDYmJ1HmcO83
         CbJc+j0Xz4fLbnw/xCzMDjxn7s/SQzR/7UnKrSmEqa9km+XlBBMlfLRAx5UoyIeRk91X
         mVQ0Fp48rdZcWPJuUC8tEl75PrNWS+ANnNVYdIjZsa0VHs1KClsSJT3Fhpnytrn7HMuC
         a1Mg==
X-Gm-Message-State: AOJu0YzLcvrmqWeOUuZqi3TMQNBGaDhaz79Lcc+wAojuZLnv+RqhytHE
	0f45dPk/JAtAon/n+aOKdj+0M+Iriw6jal/nCB+LWH3UQ3yoenA0wGrj82Jy/ycmNtJ+6Eg+tye
	bpTJsxYyA8IJvOv4UmEyM1WgG6HhtKRL/
X-Received: by 2002:a05:6402:50cf:b0:523:f69:9a0d with SMTP id h15-20020a05640250cf00b005230f699a0dmr14508643edb.4.1694079207006;
        Thu, 07 Sep 2023 02:33:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmARKuVvbeJv/K5MH7+O9TdP72ANin2DJmSer2ZNOOqrgJvqT72yBewQCDz9oi34ZcnnXSiw==
X-Received: by 2002:a05:6402:50cf:b0:523:f69:9a0d with SMTP id h15-20020a05640250cf00b005230f699a0dmr14508619edb.4.1694079206712;
        Thu, 07 Sep 2023 02:33:26 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-251-112.dyn.eolo.it. [146.241.251.112])
        by smtp.gmail.com with ESMTPSA id k7-20020aa7c387000000b0052a19a75372sm9425264edq.90.2023.09.07.02.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 02:33:26 -0700 (PDT)
Message-ID: <5c3360711cbfa8503402ed2e3c02b5b24a0f405f.camel@redhat.com>
Subject: Re: [PATCH 3/3] net: ethernet: mtk_eth_soc: fix possible NULL
 pointer dereference in mtk_hwlro_get_fdir_all()
From: Paolo Abeni <pabeni@redhat.com>
To: Hangyu Hua <hbh25y@gmail.com>, justin.chen@broadcom.com, 
	florian.fainelli@broadcom.com, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, mw@semihalf.com, linux@armlinux.org.uk, nbd@nbd.name, 
	john@phrozen.org, sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, 
	lorenzo@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, maxime.chevallier@bootlin.com, 
	nelson.chang@mediatek.com
Cc: bcm-kernel-feedback-list@broadcom.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Date: Thu, 07 Sep 2023 11:33:24 +0200
In-Reply-To: <20230906092107.19063-4-hbh25y@gmail.com>
References: <20230906092107.19063-1-hbh25y@gmail.com>
	 <20230906092107.19063-4-hbh25y@gmail.com>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_023331_932999_A7382100 
X-CRM114-Status: GOOD (  13.85  )
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

On Wed, 2023-09-06 at 17:21 +0800, Hangyu Hua wrote:
> rule_locs is allocated in ethtool_get_rxnfc and the size is determined by
> rule_cnt from user space. So rule_cnt needs to be check before using
> rule_locs to avoid NULL pointer dereference.
>=20
> Fixes: 7aab747e5563 ("net: ethernet: mediatek: add ethtool functions to c=
onfigure RX flows of HW LRO")
> Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
> ---
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/et=
hernet/mediatek/mtk_eth_soc.c
> index 6ad42e3b488f..d91fc0483c50 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> @@ -2994,6 +2994,10 @@ static int mtk_hwlro_get_fdir_all(struct net_devic=
e *dev,
>  =09int i;
> =20
>  =09for (i =3D 0; i < MTK_MAX_LRO_IP_CNT; i++) {
> +=09=09if (cnt =3D=3D cmd->rule_cnt) {
> +=09=09=09return -EMSGSIZE;
> +=09=09}

Please drop the brackets above, they are not needed.

Thanks!

Paolo


