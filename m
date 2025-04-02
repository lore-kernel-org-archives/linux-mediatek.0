Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D648C36017
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Apr 2025 15:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rhmKnF0oiTEPkeisoeZbaGPYtFNcuzXscDMztyaRd+w=; b=OikdhSLEJd368wS9JoACu4kExS
	deDkKRRojWeI/aB4IsyaXRF9IR5FHyU/ueiRq6lqmmhbbII6FsOLouhgkv3N8XukB6skfAe+3kfbO
	pf/1fX+4tSRZG2DDd7h92LytkxgWU/npCKmDS9aAf3q2dFBvQ2szWccWQT5+lN/YQnYRG98wH/o8o
	QBAOWlgOITnT6cWp67nlh0PagnYxKt99hFOG29MAr+Mr93Dy9yaSgvWy9Qz0rbWfKP+1PIZBfi5yN
	ewbDa1Yx9C55FGP70/hLSb2Cam3b+nTbFwyR2T+sEOsS4kZ0emDWehkJjd7HkyOhxFd4UHOH7zEvq
	89BFX/8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u00Bs-00000006Xlk-25wd;
	Wed, 02 Apr 2025 15:39:44 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u009n-00000006XU5-0JuS
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Apr 2025 15:37:37 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-7c5f720c717so103788685a.0
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Apr 2025 08:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1743608254; x=1744213054; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rhmKnF0oiTEPkeisoeZbaGPYtFNcuzXscDMztyaRd+w=;
        b=baWgjhioyYbvVnsKaV5Tb1ckcOcdebwJ8VITaTa2jYxIO2h/Wpo2iGCG74B2WEHaJo
         cJXWYXfxSAILRuxuTz698ceiPjjqxHtbpvyqUALAxKg1ALrS+MFB9CUP29sryVupcbN0
         pj/eOa+f7BD3WgN6M2h3JCkpMokQtC3JyRElxRtM5GtUwTZ/VobDJ/4oEANFjDGMnXuG
         F0VeTOr5ZyJJL+3mmlOzcDeHGoNZOTFiiq4kjLwLBPs7ZDjr2LkY1bPwa5yOmvRGyet5
         xnxBx+HTYtUsXFC99MioW1zWQsH/TMLd8dOp59PXQbj5EwjP0XUT/fMUs7HPp0aInqlC
         6NVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743608254; x=1744213054;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rhmKnF0oiTEPkeisoeZbaGPYtFNcuzXscDMztyaRd+w=;
        b=AoQD9wroGCzp7lsXo8LdAdE3TKymFGaW3BEp3IHcfjkIatsY1WVPMwZgKhO2CeF4av
         ds/rY5xkpsa/CfRhYRZCMsAQIDDRnA0rPOOmiGh28iqPVf0JmAtkN3rqILw9YoEP5Sgj
         lYTbF1IOjDKJDqaH15al9rVpbfzSkzWbd3SxyOPLruGJJmFGo6wQcGiRi5fIeLmxhdls
         RKqXdxoefBgc0ufcUmRP7/toU/hjr63UjYvhYFl+E5NIIHSblFYxjOl+eaYTkNtgq5mR
         sGca/NI1kngdXAfFae6LI0CrJyKMMPlB6TNoFjMpOUcGrvEHjJ8w9i2eHJ5MYRk63wZ2
         bICw==
X-Forwarded-Encrypted: i=1; AJvYcCUXl27qsccO7Icabq+vYygpy4NDrluPgo31dU3uQ5WmQ8cFlXc40g8uonp2nJv1cOsFmGYgRUm3fC5eZeR6JQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3ewx1x1yfAA3ccwRSKU1pILlhQJzXYyQITa6y8Q7AAB6cHtnE
	wGvJVq5ndQWSafBvXgrbaNrOhHWLsgDCmKwoARW/kizMcCwLJiU7Fj3eTYiyjII=
X-Gm-Gg: ASbGncuRGDdnXTL4TZCWrJz++KpSdxJb9mFwDTqTGuQPIZg4eDCld3cE0u+H4QrnIxX
	OvjbdijC1sB0FdAS8yaQQGQYZwj87F7tJEB3oYtiQUD8YCKMaPuH2NxScKYiwoWKbCbXPo0ySMv
	gFCipdcoNCEe9tJQ919ytIIXiT4Pr1znAY5NVi0jOs53tOzUJtntiHeBMSmKHzu+77PJE0aWk2A
	nhUS9fS+yKsvBciPMt2Aik/wQsdaNF3x0The6as4fr1o2tqLldX5flbx1PncO0T84HLWkXuN8s9
	Xwk9ZOdUwtYS7VvEdNnYqYZqPUx4V+oPYI8FlfiX9SMgMy0u7w==
X-Google-Smtp-Source: AGHT+IGt12U4LeoNV08d0rSucCuL30UKo3Q/u+eYpiDfdZNZWOV5NQwkfWw/ZI52IiTuX89vZtkt/g==
X-Received: by 2002:a05:620a:d89:b0:7c5:9452:4a60 with SMTP id af79cd13be357-7c76c970550mr2456785a.5.1743608253843;
        Wed, 02 Apr 2025 08:37:33 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:e976::5ac? ([2606:6d00:11:e976::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c5f77804a9sm796103585a.112.2025.04.02.08.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 08:37:33 -0700 (PDT)
Message-ID: <cfc905988dda23078b5086f3eb0975863bbb6c2d.camel@ndufresne.ca>
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
Date: Wed, 02 Apr 2025 11:37:32 -0400
In-Reply-To: <20250318110556.903-1-linmq006@gmail.com>
References: <20250318110556.903-1-linmq006@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_083735_118978_17BBD34E 
X-CRM114-Status: GOOD (  14.23  )
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

Le mardi 18 mars 2025 =C3=A0 19:05 +0800, Miaoqian Lin a =C3=A9crit=C2=A0:
> scp_get() returns a reference that needs to be released with scp_put().
> Add missing scp_put() before returning error in mtk_vcodec_fw_scp_init().
>=20
> Fixes: 53dbe0850444 ("media: mtk-vcodec: potential null pointer deference=
 in SCP")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
> =C2=A0.../platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 5 +++--
> =C2=A01 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_=
scp.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c
> index ff23b225db70..11ab3bc60217 100644
> --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c
> @@ -71,7 +71,6 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_scp_init(void *priv=
, enum mtk_vcodec_fw_use
> =C2=A0		pr_err("Invalid fw_use %d (use a reasonable fw id here)\n", fw_us=
e);
> =C2=A0		return ERR_PTR(-EINVAL);
> =C2=A0	}
> -

Might sound nit-picky, but don't do style fixes in patches intended for
backports. It increases the chance of conflicts.

> =C2=A0	scp =3D scp_get(plat_dev);
> =C2=A0	if (!scp) {
> =C2=A0		dev_err(&plat_dev->dev, "could not get vdec scp handle");
> @@ -79,8 +78,10 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_scp_init(void *pri=
v, enum mtk_vcodec_fw_use
> =C2=A0	}
> =C2=A0
> =C2=A0	fw =3D devm_kzalloc(&plat_dev->dev, sizeof(*fw), GFP_KERNEL);
> -	if (!fw)
> +	if (!fw) {
> +		scp_put(scp);
> =C2=A0		return ERR_PTR(-ENOMEM);
> +	}

With the above style change removed:

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@colllabora.com>

> =C2=A0	fw->type =3D SCP;
> =C2=A0	fw->ops =3D &mtk_vcodec_rproc_msg;
> =C2=A0	fw->scp =3D scp;

