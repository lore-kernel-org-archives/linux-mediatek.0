Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A70D1C001B0
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Aug 2023 13:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1rJTz5bg4rzwnI3ff4rWN2qUwfmBH27c5Qh2BAvyn5w=; b=ubRrqR+Eo0uM6WlJcBDfzjujEv
	+KY/8ziFN4a2Gt5jIgFgcx2moz8oeH8HC+9/h/sYW8X4Errv+aK4GTdMb+nh0SGFOMGzoFKvvHxYr
	13cEgjzxdpqRTrDW3R2UTDC1PnZ4gMfLAKxMAK7kBy61clrVanjG6DovJnpMM9HvBfVaRHKIMlUkM
	tKkkPMGvE0/GaHhdiIGjPyLvqZzpbBS6UzItT7ThJeT1p+VtmvHlxsZuepnj4j1AB3JW05++d5aro
	BtiylAUlRgaJlkfIF0OaLVVhvWhB5JiAE4cflmAATfef0SFj2AbOm0eqR+dGuRJkI/vdCGmNQsA8g
	4phFE/bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU6BD-007nzp-3B;
	Thu, 10 Aug 2023 13:58:23 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU6BB-007nyS-0C
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Aug 2023 13:58:22 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-63cf96c37beso4304816d6.0
        for <linux-mediatek@lists.infradead.org>; Thu, 10 Aug 2023 06:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20221208.gappssmtp.com; s=20221208; t=1691675899; x=1692280699;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1rJTz5bg4rzwnI3ff4rWN2qUwfmBH27c5Qh2BAvyn5w=;
        b=ndjuLFarKWmxp0QE3j1BO1vhYb4/6pLnad8C4kQcrHaNNL88TKuLQ2SHjDEgt7l443
         aI5Krkq3C5BHh/B/BhChf+P5jqieFmbgL0r75qd30KDOFJGLBdXoFPnGKQ7/5XyBPaWd
         KgkF3cIkg6+HlWTUvoCLuhb2GSjAY2SffLX2d+8bbCy1aLKL7h93+OGBseelXC26cO0V
         90vgtnJ+OqIZI1kHXmFraAd510MMGIf/X7wG/q8v7g6StOnSATFU6/IqUcSHMvqmgJma
         r8E9ge5QwC45LQawKQbILJIoaKFnQmkDB4dmz6UnFLf+1EDLH1x/VIHX3XsCj6eLVWkt
         NYFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691675899; x=1692280699;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1rJTz5bg4rzwnI3ff4rWN2qUwfmBH27c5Qh2BAvyn5w=;
        b=bdCI5t2FndNHdztU5kBACRbO4bAxxKaFEv4C4ZgK/pkz3z9xQ0YvTbws25Wvjx84wt
         RZ6QY6Guyp3eHkvonIoUc1i35JX1gjwG7nFBzb9QdijpilS4nibOl+N9gMMIIEUTQptk
         Smdlcv6hyNtpoDhSA3cDTG6kZ7lrqGR8bYLaeiR/2ne44QQloNIlCXC0m/YFV2WE2weo
         3d5QFNi71gfeHKIeMQLvOmihrXjulc7yfJLPvPLkqGxkgheLcyR/P6muabTULgSU3c3h
         4C4x2dXS1vbPfILGSihJi2GTLYQtBLmdqjGyDgDpKlAjCWsjvRduoOsx60iXcpBCfqhI
         rxBQ==
X-Gm-Message-State: AOJu0YwNMMen7o9MruIYl257GoUpvy2+ZafQcpGtNKEN22hK8ilO+k+r
	YmtotF+C5gitJcdD2NG5LcXesA==
X-Google-Smtp-Source: AGHT+IGy90htbxaGVBLfMsqw9TjY9f1KySdKUMqiW6L1VOLB4Zx6hUjqKjFiwiogcvkiBUNYIqIvVg==
X-Received: by 2002:a0c:e54f:0:b0:63f:c070:492f with SMTP id n15-20020a0ce54f000000b0063fc070492fmr1963509qvm.8.1691675898960;
        Thu, 10 Aug 2023 06:58:18 -0700 (PDT)
Received: from nicolas-tpx395.localdomain ([2606:6d00:15:bae9::7a9])
        by smtp.gmail.com with ESMTPSA id y3-20020a0cf143000000b0063d4631d1e4sm173766qvl.68.2023.08.10.06.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 06:58:18 -0700 (PDT)
Message-ID: <5a70c141736e91f635f71d9922a3bbe993a76c69.camel@ndufresne.ca>
Subject: Re: [PATCH v2] media: vcodec: Fix potential array out-of-bounds in
 encoder queue_setup
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Wei Chen <harperchen1110@gmail.com>, tiffany.lin@mediatek.com
Cc: andrew-ct.chen@mediatek.com, yunfei.dong@mediatek.com,
 mchehab@kernel.org,  matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com,  linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,  stable@vger.kernel.org
Date: Thu, 10 Aug 2023 09:58:17 -0400
In-Reply-To: <20230810082333.972165-1-harperchen1110@gmail.com>
References: <20230810082333.972165-1-harperchen1110@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_065821_292226_E6D94C94 
X-CRM114-Status: GOOD (  19.51  )
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

Le jeudi 10 ao=C3=BBt 2023 =C3=A0 08:23 +0000, Wei Chen a =C3=A9crit=C2=A0:
> variable *nplanes is provided by user via system call argument. The
> possible value of q_data->fmt->num_planes is 1-3, while the value
> of *nplanes can be 1-8. The array access by index i can cause array
> out-of-bounds.
>=20
> Fix this bug by checking *nplanes against the array size.
>=20
> Fixes: 4e855a6efa54 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video E=
ncoder Driver")
> Signed-off-by: Wei Chen <harperchen1110@gmail.com>
> Cc: stable@vger.kernel.org
> ---
> Changes in v2:
> - Add Fixes tag and CC stable email address
> - Change the title to be more expressive
>=20
>  drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c b/dr=
ivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
> index 9ff439a50f53..9e8817863cb8 100644
> --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
> +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
> @@ -821,6 +821,8 @@ static int vb2ops_venc_queue_setup(struct vb2_queue *=
vq,
>  		return -EINVAL;
> =20
>  	if (*nplanes) {
> +		if (*nplanes !=3D q_data->fmt->num_planes)
> +			return -EINVAL;

I don't think the claim really exists. 	For this driver, when *nplane is se=
t,
it will be:


        case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
                requested_planes =3D f->fmt.pix_mp.num_planes;
                if (requested_planes =3D=3D 0 ||
                    requested_planes > VIDEO_MAX_PLANES)
                        return -EINVAL;
                for (i =3D 0; i < requested_planes; i++)
                        requested_sizes[i] =3D
                                f->fmt.pix_mp.plane_fmt[i].sizeimage;
                break;

Or the value the driver have set it in the previous call with *nplane =3D=
=3D 0. So
unless there is a bug, this should not happen, and more importantly, the co=
re
should not let that happen, meaning it should not be driver jobs to validat=
e
this.

my 2 cents,
Nicolas


>  		for (i =3D 0; i < *nplanes; i++)
>  			if (sizes[i] < q_data->sizeimage[i])
>  				return -EINVAL;


