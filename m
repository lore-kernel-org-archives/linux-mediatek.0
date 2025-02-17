Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE1FC021A9
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Feb 2025 18:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6L6CLEKqcPrRJhrzPfeseJlwds1PXfz2BxfcoLKD2Oc=; b=W2gQ0cEYyJqGfCYU9J1I/IZX0l
	So2wFatXofrY7LLp1n/XcIYur6OPw2WwFTwh3y/W7/4nWCB/y0DFLXHQ4DkzFGp3qThG3RXIsxjor
	SkiW8IpwtsSjyzJ0ug+n04N3xYSpW6BWERyg2P46dI+ksyhXZ9MSRTWfk9Dwt0tFl2PJ0ju0EaeVo
	gmKy/A/fYZoeLd+QrLO2XkXQQkt6MbnEw8FAcvrmAbA1rvF4AnVGs6o4xyBEVtygoD55O04z1WSTU
	SAfPot/WcLCJidGC83Y30nwzg1cxrYdp44pBUKH2ccsKNUEtH3ndH8mgqYRceiuc91PA1vjw224eE
	iq8VCd9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk69S-00000005ecH-0mOY;
	Mon, 17 Feb 2025 18:47:30 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk67O-00000005eGb-3nLI
	for linux-mediatek@lists.infradead.org;
	Mon, 17 Feb 2025 18:45:24 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-6e660740061so42947856d6.3
        for <linux-mediatek@lists.infradead.org>; Mon, 17 Feb 2025 10:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1739817920; x=1740422720; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6L6CLEKqcPrRJhrzPfeseJlwds1PXfz2BxfcoLKD2Oc=;
        b=XKrAk+dZMadnBtrlIEb4TRaBviMWCZieh4AaGFGYMlod8C9cZbR2hOo7AkGAPF/wY8
         HIvwoeDvgk3NSQLNVdEclGuAY7YNXlO1jsCvcw+XiNhXzHFA+iEfIjw54e5BjMpEvcpI
         nO20TVbOhVLEjrSAA8wdPUT4i1PRZjpzWfjaGr1OzjFkm+FBlcYhSSnQcTR1zOnpFpy5
         tlVWZ+KocOWBVBWGlvYGHnVtylQrpbfB1TF++VH3GURD3Fs2C4S2/3l+fE05CwobbX8C
         CMP8K1UZ0vrFy5BGqnN+akv7QSGtptKyNRsgHlsZ4DbSTVdoHHpAM2Jgkf+xMuKd0udu
         TVhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739817920; x=1740422720;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6L6CLEKqcPrRJhrzPfeseJlwds1PXfz2BxfcoLKD2Oc=;
        b=p9PM9Skxc33RBnyiFBPdFKDPMXa88oZS0EWzR4KHp0h9j5VOI44gQNrbLTFLqSzVGk
         sNQ0lIpzgmY6e/SvvNJYDiSzCALtmtBqRHrScuPuGAVENiMrtiWMbSUqcHrrYHUWkYuv
         KQaz8EwFA+lwzd2L6iMrcKgsfz3oRf8yFc848U231M2+TBJcKGZopuiKU6Tqy+SVTfR3
         sxi1mRIAVPv++HSOF/c99JJzj4X2K18nJnn1heqb+np6x5bI+/V7IcM4c5wTXcW5ClOO
         xtgt3xCEwpOzSvB+tnUTqqMoNqz42PzxNdItC9fQXpS53/dn0r5X3eif8KdFYokKRcSJ
         5jIg==
X-Gm-Message-State: AOJu0Yz2SuNTVPKM6LjaOj+qqMtmvq8tDOvHRO5AonNKzl2sfHljfWtn
	68eIcQfLdpGnJRudAS+KkoHFTs61nZusFajAGvvLNq8SDkZU39M3DftysQtSaHs=
X-Gm-Gg: ASbGncu7L+EsmxhpO4sVPi+DuqjCmIFlFoHNBDGq3SFIUiF0BApc+eMTf7w/9JzqRe/
	aZ0Igt3h6tTXF/X3+XsJUxXzqgdvNcMuBGtY829hCYD7QgKb+7jWNvI31f/+rdZG3DKw8qqrWvr
	z3vaJgaG4Nngi9aQJ8CxXQkGKBQUe6IHCzNMKN42kw/AsqTtTERyUQySrMDYSXTkRcQbdI0EAFf
	a05OJGau7qtXragsM1gMWYfONm65wgfgKKrjq/aqLd7PjpSM5XZBNMaIYbZnBYYi6jun2eVnSIw
	/gTNcK9acjwrVgqP9sxj
X-Google-Smtp-Source: AGHT+IGNdl7vF080sQ0ioTe7+4SN17jK4snwRBjBnucmBNF6nJHjI5dIs2Whm+kD76Bwzk4VXdCbEw==
X-Received: by 2002:a05:6214:1bce:b0:6e6:6711:d7f1 with SMTP id 6a1803df08f44-6e66cc865b6mr166508596d6.8.1739817919179;
        Mon, 17 Feb 2025 10:45:19 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:e976::5ac? ([2606:6d00:11:e976::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-471f0bfe304sm14136191cf.55.2025.02.17.10.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 10:45:18 -0800 (PST)
Message-ID: <f257832e823d23c8324a9eaf7890dd4b6d50a6f0.camel@ndufresne.ca>
Subject: Re: [PATCH] media: mediatek: vcodec: Enable HEVC main still picture
 decode
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Nathan Hebert <nhebert@chromium.org>, Yunfei Dong
 <yunfei.dong@mediatek.com>,  Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Mon, 17 Feb 2025 13:45:17 -0500
In-Reply-To: <20250211-enable_hevc_still_picture-v1-1-0c06c0c9add2@chromium.org>
References: <20250211-enable_hevc_still_picture-v1-1-0c06c0c9add2@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_104522_940231_0668DB33 
X-CRM114-Status: GOOD (  17.21  )
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

Hi Nathan,

Le mardi 11 f=C3=A9vrier 2025 =C3=A0 16:34 -0800, Nathan Hebert a =C3=A9cri=
t=C2=A0:
> Mediatek devices that support HEVC also support the main still picture
> profile, but today, the main still picture profile is excluded.
>=20
> This removes the skip mask for HEVC, and enables the main still
> picture profile decoding.
>=20
> Signed-off-by: Nathan Hebert <nhebert@chromium.org>
> ---
> On Mediatek devices that support HEVC decoding, HEVC Main Still Picture
> profile is also supported by the SOC and firmware. However, this
> capability is turned off in the vcodec driver.
>=20
> This removes the code that disables HEVC Main Still Picture profile
> decoding. Validation of the decoder has been done via V4L2-backed
> Android CTS tests on an MT8196 device.

While its nice to know that you are working on upcoming SoC, we need
confirmation that this is working on all the upstream stateless
decoders supported: 8183, 8186, 8192, 8195. Ideally testing on 8188,
which I can see has merged support without the linux-firmware file to
go with it.

I'll wait for that and Yunfei's ack before picking it. Yunfei, please
fix the situation with 8188 in linux-firmware, and CC me.

regards,
Nicolas

> ---
> =C2=A0.../media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless=
.c=C2=A0=C2=A0 | 2 --
> =C2=A01 file changed, 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_d=
ec_stateless.c
> index afa224da0f41..d873159b9b30 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
less.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
less.c
> @@ -152,8 +152,6 @@ static const struct mtk_stateless_control mtk_statele=
ss_controls[] =3D {
> =C2=A0			.id =3D V4L2_CID_MPEG_VIDEO_HEVC_PROFILE,
> =C2=A0			.def =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
> =C2=A0			.max =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
> -			.menu_skip_mask =3D
> -				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE),
> =C2=A0		},
> =C2=A0		.codec_type =3D V4L2_PIX_FMT_HEVC_SLICE,
> =C2=A0	},
>=20
> ---
> base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
> change-id: 20250211-enable_hevc_still_picture-26b35eb08270
>=20
> Best regards,


