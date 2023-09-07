Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF3FDEE14D9
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Sep 2023 09:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SDnMgm2pO9DiKf5tQ2V3g1yxw6hd2QGFbQ7HyFd9eI8=; b=pzKv6krDGCIA8WMQPRgwlQVkAz
	x2C1eAvDl8XVyEYmWu2bj7OYk75AKj6IavkMuVFA8xncdfEbGb5W9f6/K6GxAlagH6x4TtHWREJgr
	LfA7LYGJw1Npff1FRL9JOGXkLkYNSAh/ubV/JbdXlXgmxcELPWX2IaaMktebRb+/Ox7bRDh69ODpN
	KJJj/cNSHjMEVwwHRpC4wirxk96eL9asnrJZrFMd8h7WGiDutwQUmYscAvdxxGffsvK8YK3m9bapK
	bOpFSOGvUE6QpXqJSrYw6xF2hMjL4fXrVJ6xuWao3l/BIPDy1tgeVjUe1c4r2HTPAnPL7udZS5t8R
	BzussTVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeBZJ-00Bhwd-1n;
	Thu, 07 Sep 2023 09:44:57 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeBZG-00BhvI-1t
	for linux-mediatek@lists.infradead.org;
	Thu, 07 Sep 2023 09:44:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694079893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SDnMgm2pO9DiKf5tQ2V3g1yxw6hd2QGFbQ7HyFd9eI8=;
	b=Fa+dk2+in+TR4ILkgZFy+9wlIqECJvI4VaAZo/WnOSE2rNDRUCxfru1pdI1dVRQc22DEic
	ssTMqPf5sPLq8WnraAUax3Ulqrf7ksAiUY/S0qlT3dG3W2eZ7KLcxwojsSU31WDSHLbqIr
	bZke/NwD9mvjBnwXmPwZXT7+4O2nfAg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-424-5bEMiUnzO1evLqhThFfl1w-1; Thu, 07 Sep 2023 05:44:50 -0400
X-MC-Unique: 5bEMiUnzO1evLqhThFfl1w-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-9a5c5f0364dso16946066b.0
        for <linux-mediatek@lists.infradead.org>; Thu, 07 Sep 2023 02:44:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694079889; x=1694684689;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7iV8N0Zs9ekoCmuMeKBQuzMuRWS57eO3gP7qT4sD/5o=;
        b=UahyuhfYuMT9PEGGsxLNAC2hDQc3iFMv6CHfI1RZYS4AWKnFfzYcF8iKuv9nDAJ4A/
         zDFFup85eE17mRv3QVfIp+DbUEgXgBLz/Qs/oxgTIpyL+jf0ITwONU+aUMpZHd6EUP60
         9YSUkz7DBusEGrKkjfVKcVPALnTiweQcoEVzl5dCg/cLm2ayv7waI+/BZA0PGVic/GTC
         2i6JbIPNU7K4Nli4TGI3zNP+7i4b/qM9oNyly71Ib/u0Xk86PP9qCMO5XEC+jFbD45rW
         wIDOVBHZhCsfzKFH4/ZcktvtCRdAla+rlKcaRJUVaPmQ8XKdnzM+ISTzWkdijl4O0A+G
         VRlQ==
X-Gm-Message-State: AOJu0YyWMmx1qZB3Rk7dZ8HNwrrRVazCIgSLp39j3SE3rWinAefoJAND
	kkr9yDHau+SbjYS5AVcPnPjUX350PWqTqcCFuS4QqCa2QWoCz6zJ9+bp4xUgIhD74Ei0owNrOcq
	9Qr/+gdHxLPavRBXT3IjdyFFBq42g0DoW
X-Received: by 2002:a17:907:cca1:b0:9a6:ae76:d6ae with SMTP id up33-20020a170907cca100b009a6ae76d6aemr3715601ejc.3.1694079889068;
        Thu, 07 Sep 2023 02:44:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnPN4syHJKZykCDJc7KbCt9GyZHbum1qYTeTY8d2HUtrQ1128rOz00zDgwcLVUTwKZzjDO1g==
X-Received: by 2002:a17:907:cca1:b0:9a6:ae76:d6ae with SMTP id up33-20020a170907cca100b009a6ae76d6aemr3715589ejc.3.1694079888723;
        Thu, 07 Sep 2023 02:44:48 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-251-112.dyn.eolo.it. [146.241.251.112])
        by smtp.gmail.com with ESMTPSA id ja8-20020a170907988800b0099290e2c163sm10063541ejc.204.2023.09.07.02.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 02:44:48 -0700 (PDT)
Message-ID: <7b42e1ca549f8d7d18a4df9d74a93cf527071a4d.camel@redhat.com>
Subject: Re: [PATCH 1/3] net: ethernet: bcmasp: fix possible OOB write in
 bcmasp_netfilt_get_all_active()
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
Date: Thu, 07 Sep 2023 11:44:46 +0200
In-Reply-To: <20230906092107.19063-2-hbh25y@gmail.com>
References: <20230906092107.19063-1-hbh25y@gmail.com>
	 <20230906092107.19063-2-hbh25y@gmail.com>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_024454_691134_94CFFECE 
X-CRM114-Status: GOOD (  16.32  )
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
> rule_locs to avoid OOB writing or NULL pointer dereference.
>=20
> Fixes: c5d511c49587 ("net: bcmasp: Add support for wake on net filters")
> Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
> ---
>  drivers/net/ethernet/broadcom/asp2/bcmasp.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/net/ethernet/broadcom/asp2/bcmasp.c b/drivers/net/et=
hernet/broadcom/asp2/bcmasp.c
> index d63d321f3e7b..4df2ca871af8 100644
> --- a/drivers/net/ethernet/broadcom/asp2/bcmasp.c
> +++ b/drivers/net/ethernet/broadcom/asp2/bcmasp.c
> @@ -535,6 +535,9 @@ void bcmasp_netfilt_get_all_active(struct bcmasp_intf=
 *intf, u32 *rule_locs,
>  =09int j =3D 0, i;
> =20
>  =09for (i =3D 0; i < NUM_NET_FILTERS; i++) {
> +=09=09if (j =3D=3D *rule_cnt)
> +=09=09=09break;

Side note: it's a bit unfortunate/confusing that the drivers can
arbitrary return  -EMSGSIZE or silently truncate the list. I think it
would be clearer if we could stick to single behavior - and I'll vote
for -EMSGSIZE.

Cheers,

Paolo


