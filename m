Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39BA2C3601A
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Apr 2025 15:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PSL4oRGEAPHD9iSzx4FRIOJD2xPfGaZhPkphkR7+6y0=; b=nXRRhBOmWYkSVn+BDkxAinYs4Q
	C5pWuc0riQ0RTBGyzi+1mOSK2m0lvbktZpRf2ojQr+ke6ioTUISlnFg2psCjcg1NunEnbYX6yV7BH
	G/HSSnXGIN5rB681CZEtSHrLRNLBpC4ZgOedX4NKr09av/omiB880oQGz4tT62v/jk4xUh1o5LMua
	znThZ8mPE2LJRsKD/LYb6WXySYp31kQUyYVldzCGFQ1fu3Wuc4W/LeSh4htgvqIakIPNdP33CsrmH
	NIr3LNqvpgpLI1e5Nd3vdQwqE95DkDgEBSSMr61C/IaZRrLzNauEH+EAOGDMSSG07Jmb3uolaRDag
	QycixTLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u00Cn-00000006Y1d-16JP;
	Wed, 02 Apr 2025 15:40:41 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u00Cl-00000006Y0P-1BT9
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Apr 2025 15:40:40 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-6eaf1b6ce9aso70864456d6.2
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Apr 2025 08:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1743608438; x=1744213238; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PSL4oRGEAPHD9iSzx4FRIOJD2xPfGaZhPkphkR7+6y0=;
        b=Q1Q9rQ7o0qLLLWOCD+bbN4yKOQlGr0+xKNXAF1xk2lYt8LV0p06CrT5u400UBPge3y
         eie8S6KETXFLN5YVCo1KRY65+V1mqFQ0yezQGNBM1dWsGteziBgSprK7tPCbxEJBz5PL
         wi+S/NinPa0wHxOBy+ZJPUuGrycvP0uHLNLmRk/G74rlQHU/5Dx61H++xMexdeBustDF
         1YvAN7xVBSMG8alsbVZqCzLwZGczm2MAeAIbOvaaAF4MMMubUUcbLIUIzrvx1lI4lfel
         9adke+lHnyq63Ygtu5GUUVHcs99ZcG+gPozdjR1EzKbzUHCqsRxNYVeGxYntaFmEonOK
         nkMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743608438; x=1744213238;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PSL4oRGEAPHD9iSzx4FRIOJD2xPfGaZhPkphkR7+6y0=;
        b=S84GXsp7XgdShIJD69kS40tggcWdqZvEpQO/+4eDCuZFaNQ/l3dee1AFcSluNNN8Ou
         7fKhwe46M6trNlgnGvTFXw7wUZTbgIbaJnrghgDlfT7/nObZCFBlzM4Vk6/Kc4MUTwgD
         hAf19vzoWct5u8ay5yOidcF6bPr6RFgBsM2xA3PAo4sVUyHrWmjdaXB9vOSdQUalqrdN
         OJGcsLdk3nZkXyt7QYksoRR+aIQKV3OnbIgonCBhNs28QpoUj6a3+TM9nn3ab+NtyXjj
         X+/lRboggQnzYCxe19VfoiEH1JE4RKEDycxn82Co8a5UlnPHBsy5BHFCrisVWWnQFWQS
         bHCg==
X-Forwarded-Encrypted: i=1; AJvYcCV+jAsGm9B7X4KaoD6sj/4zx0ZwoyEEyj99RYrrEZ8Sh0QRgiWaxKm1O8oax8pBNawAavRktjakxEmO1NM5Lw==@lists.infradead.org
X-Gm-Message-State: AOJu0YywB9Y/ZUUJUg/7HYUPI61FXz99ooIC+ejk2RNf0Vzv++Y9ug4J
	Kg6Ln3+T2eV0LKWsvaqxTb2xCtOuUgwD/dwgT/r1Vdbq43huMHx8s4OSY4XdeRI=
X-Gm-Gg: ASbGncvVu4mLNJtt2goVLmrqj2zzsG6kj5hzOKwhs+6/0Ew1ZpRI/XGux2Kjxrv8w8t
	N51MKOk/2hC1QhH1FkXeanpPLTq3mIH7Q+dyuuZSn8LEN9aoOQVVAv0B3uKxRbhsgCjsELYWIoh
	w/o0EtcN8jdx/h4snbsAvCSyceq6llsJRKzPete27BRFWNeyJ1gkO8HmLIKvHg/7qtf6tstRNgl
	cYytWlq6mWteN+Z+yXPrF2cKb+rU+D2UaWNH2QeW1iRoGN2/R16Sap5bEQvW4LEorh7r/PRXlH+
	/s7W+sw7bJvYB/iZSR/Aa/AcguUDa6WdfwkviOqqm38DWUhrHw==
X-Google-Smtp-Source: AGHT+IF4Dz/stCS5BEC5GFlEUNzvWwaks8m+IIa7woNJtCMmFQbWLxjNz8YenZdUROs678sB7aZKEw==
X-Received: by 2002:a05:6214:b62:b0:6d8:9ead:c665 with SMTP id 6a1803df08f44-6ef02c92ed5mr46211356d6.27.1743608437967;
        Wed, 02 Apr 2025 08:40:37 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:e976::5ac? ([2606:6d00:11:e976::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eec965a1desm75344486d6.60.2025.04.02.08.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 08:40:37 -0700 (PDT)
Message-ID: <14a86f60d026411eb7e4546b8a4879a90f247843.camel@ndufresne.ca>
Subject: Re: [PATCH] media: mtk-vcodec: Fix reference count leak in
 mtk_vcodec_fw_scp_init
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Miaoqian Lin <linmq006@gmail.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>,  Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Fullway Wang <fullwaywang@outlook.com>, 	linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Date: Wed, 02 Apr 2025 11:40:36 -0400
In-Reply-To: <cfc905988dda23078b5086f3eb0975863bbb6c2d.camel@ndufresne.ca>
References: <20250318110556.903-1-linmq006@gmail.com>
	 <cfc905988dda23078b5086f3eb0975863bbb6c2d.camel@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_084039_316835_EFD477F8 
X-CRM114-Status: GOOD (  17.61  )
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

Le mercredi 02 avril 2025 =C3=A0 11:37 -0400, Nicolas Dufresne a =C3=A9crit=
=C2=A0:
> Hi,
>=20
> Le mardi 18 mars 2025 =C3=A0 19:05 +0800, Miaoqian Lin a =C3=A9crit=C2=A0=
:
> > scp_get() returns a reference that needs to be released with scp_put().
> > Add missing scp_put() before returning error in mtk_vcodec_fw_scp_init(=
).
> >=20
> > Fixes: 53dbe0850444 ("media: mtk-vcodec: potential null pointer deferen=
ce in SCP")
> > Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> > ---
> > =C2=A0.../platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 5 +++--
> > =C2=A01 file changed, 3 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_f=
w_scp.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c
> > index ff23b225db70..11ab3bc60217 100644
> > --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c
> > +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c
> > @@ -71,7 +71,6 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_scp_init(void *pr=
iv, enum mtk_vcodec_fw_use
> > =C2=A0		pr_err("Invalid fw_use %d (use a reasonable fw id here)\n", fw_=
use);
> > =C2=A0		return ERR_PTR(-EINVAL);
> > =C2=A0	}
> > -
>=20
> Might sound nit-picky, but don't do style fixes in patches intended for
> backports. It increases the chance of conflicts.
>=20
> > =C2=A0	scp =3D scp_get(plat_dev);
> > =C2=A0	if (!scp) {
> > =C2=A0		dev_err(&plat_dev->dev, "could not get vdec scp handle");
> > @@ -79,8 +78,10 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_scp_init(void *p=
riv, enum mtk_vcodec_fw_use
> > =C2=A0	}
> > =C2=A0
> > =C2=A0	fw =3D devm_kzalloc(&plat_dev->dev, sizeof(*fw), GFP_KERNEL);
> > -	if (!fw)
> > +	if (!fw) {
> > +		scp_put(scp);
> > =C2=A0		return ERR_PTR(-ENOMEM);
> > +	}
>=20
> With the above style change removed:
>=20
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@colllabora.com>

Sorry for the noise, I see that Hans fixed and merged it already.

Nicolas

>=20
> > =C2=A0	fw->type =3D SCP;
> > =C2=A0	fw->ops =3D &mtk_vcodec_rproc_msg;
> > =C2=A0	fw->scp =3D scp;

