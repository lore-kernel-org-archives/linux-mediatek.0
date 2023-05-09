Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A26E8C77B75
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 May 2023 09:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2UTv4jt07Sqe3HT5p7GBcDXgoMVyDhALeAGwt9fFf78=; b=r+qZ2CEFi9X7HvAOr4PnjKO3vn
	ZPMfYtp4F+zezaGggdVwZd+h/tdW6LWi1GKOpjN7pFWuJVdX0MeoLo3ZtDmJUagqfLRTf0jqoaOp5
	zKUSnbw88hbfHFiV8idzfkr15XHo7KOc0pVn0oCoH5HA7ED5aWtdnEqVtPubjk0Ncru89Byio0s/9
	eaZvUf+RtS9+/vxgvZxVs8NyceHQBOcukD0b6jFjAvECpKowDduIJZgO3w0s+LcFXzmpsiEigzrKH
	cl5IGzGzk7Pnt7oVfD8gcTTqUwDmanXO+R90XwzCK12rh2XmQEx1JOaoODbVcfEsMKtDUqoo4czws
	XzWWvHGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwJfu-002kGb-0Y;
	Tue, 09 May 2023 09:30:26 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwJfr-002kFF-1h
	for linux-mediatek@lists.infradead.org;
	Tue, 09 May 2023 09:30:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683624621;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2UTv4jt07Sqe3HT5p7GBcDXgoMVyDhALeAGwt9fFf78=;
	b=FluAQbnEZhb4A7XkZIW9kee8TujPIgvxP9tk7Dh92de7H+8DeIdotgxTihQuduzAXPnE7/
	26dxEdV81BN1t/zWLZ2WXWpAX3WnC4AGMHJa7/NuUuSz6ZgCX0HXtEJe0RHtVPD9cZ/HT1
	vsiTlohnSew+L27IQC+4uFXTjXXw0CQ=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-214-kwXs2BuxNMGJEgEx0nSjbw-1; Tue, 09 May 2023 05:30:20 -0400
X-MC-Unique: kwXs2BuxNMGJEgEx0nSjbw-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7579edafe0eso264785a.1
        for <linux-mediatek@lists.infradead.org>; Tue, 09 May 2023 02:30:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683624620; x=1686216620;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WWUbYFjjx+ICPyEkXBm8kY/O+ZEJSV1Cd7/THSNoG6A=;
        b=f3+1rWWUSG6hgjSdCUJWYx0ExGpCa4rCTdS80PccE4JVepPkqXjzKFWYvazalFoxkp
         6BsbcikUgXh4r0qvNF/4TtuOGzpY63jYAuBvGBgc4YCCWjsjWizQYKUiyLcNm1f3JOce
         ZQ5YPZcRj5/9e03OVnCS+cJ55ftDOmO43w/9fPDvbGNB5yRhmoruhhlH5OTkn2PdvkiP
         Lesszn2kbHB04OB6oLwE2ZR+lO0Ysjo1nRJZqR3EsUdmIg/OOC2WxaVwlDfEGOmRaMc9
         eha83/0TUmWHlh4brA6tUU9sfbY1AlCAUGcedbyqnpn+nwQcWT7bptKQAkxAKDzSGs8n
         G0MA==
X-Gm-Message-State: AC+VfDx4R0A7D04pZvqCL2GOvfGI1KtLCHoOanSwkoadpeWaAvkQVsOj
	nCK4Kg408U41N6Au+NbqM/QTuoDlVPU6yuR/BV2+1z61DWfeYCceC1fSsVTYWfkL6KpCzD5yW7y
	4Bm/emDyW0J9jcKwwXiwLapH8li7IfWUq
X-Received: by 2002:a05:622a:1896:b0:3ef:4839:2632 with SMTP id v22-20020a05622a189600b003ef48392632mr19423900qtc.0.1683624619869;
        Tue, 09 May 2023 02:30:19 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7IdngGu4W6HDlzDwmPcGS8eug7c+TlJ/S1IhOJKt48LSsfRPPnQ/xdS5LfvIaZhGdLosuPSw==
X-Received: by 2002:a05:622a:1896:b0:3ef:4839:2632 with SMTP id v22-20020a05622a189600b003ef48392632mr19423868qtc.0.1683624619516;
        Tue, 09 May 2023 02:30:19 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-255-65.dyn.eolo.it. [146.241.255.65])
        by smtp.gmail.com with ESMTPSA id c18-20020a05620a11b200b0074fafbea974sm3159641qkk.2.2023.05.09.02.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 02:30:19 -0700 (PDT)
Message-ID: <c77b8989fa4a1424a159fdd4450109a239babaa1.camel@redhat.com>
Subject: Re: [PATCH] net: ethernet: mtk_eth_soc: log clock enable errors
From: Paolo Abeni <pabeni@redhat.com>
To: Lorenz Brun <lorenz@brun.one>, Felix Fietkau <nbd@nbd.name>, John
 Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>, Mark Lee
 <Mark-MC.Lee@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>,  Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Tue, 09 May 2023 11:30:15 +0200
In-Reply-To: <20230507214035.3266438-1-lorenz@brun.one>
References: <20230507214035.3266438-1-lorenz@brun.one>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_023023_657267_BB5CEA1C 
X-CRM114-Status: GOOD (  14.44  )
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

On Sun, 2023-05-07 at 23:40 +0200, Lorenz Brun wrote:
> Currently errors in clk_prepare_enable are silently swallowed.
> Add a log stating which clock failed to be enabled and what the error
> code was.
>=20
> Signed-off-by: Lorenz Brun <lorenz@brun.one>
> ---
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/et=
hernet/mediatek/mtk_eth_soc.c
> index e14050e17862..ca66a573cfcb 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> @@ -3445,8 +3445,10 @@ static int mtk_clk_enable(struct mtk_eth *eth)
> =20
>  =09for (clk =3D 0; clk < MTK_CLK_MAX ; clk++) {
>  =09=09ret =3D clk_prepare_enable(eth->clks[clk]);
> -=09=09if (ret)
> +=09=09if (ret) {
> +=09=09=09dev_err(eth->dev, "enabling clock %s failed with error %d\n", m=
tk_clks_source_name[clk], ret);

I'm sorry for nit-picking, but this lines really exceed any reasonable
max len. Please reformat the above as:

=09=09=09dev_err(eth->dev, "enabling clock %s failed with error %d\n",
=09=09=09=09mtk_clks_source_name[clk], ret);

Thanks!

Paolo


