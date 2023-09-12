Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E0DDCA0EEB
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Sep 2023 15:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZUdgHz1EThvHhDCfER2QcOxP464/TYWECsF6ss3Llv8=; b=dOQKqC38QFTjwPDxULLimMqs1a
	PblBRwGQkVwCgYVqBTIrKgEH0rMdsjKJwRI2OK7YU+tLh7zgZ91aclnPCyL8cy8BIa0UPDMaI18Q+
	mQeOAWX3GjRcjajjt1iYe9JJQ2vZDLDp/qgyMcIc9GMWHS1HFgRWK3RGFP3KR6lFXDcSbBgTTxBtJ
	HqT5nwvAxfs3vsW//0zbpxquxDstWAEO++lrNV2D2QWDwB42bZZTQRuundXzOpYIdLN4SAVsxMFNY
	s+hPHX/S3/n7bpT+Y7t2w+YDGWmL0tvpAowdNAg28Ak9p9+repTt7x6tmURG6KG8FqlLdSzGJiS5C
	xHA3H1WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg5fZ-003kjz-3B;
	Tue, 12 Sep 2023 15:51:18 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg5fW-003kir-2t;
	Tue, 12 Sep 2023 15:51:16 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-52c9be5e6f0so7005262a12.1;
        Tue, 12 Sep 2023 08:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694533871; x=1695138671; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZUdgHz1EThvHhDCfER2QcOxP464/TYWECsF6ss3Llv8=;
        b=sN11SYaf+ieCv6Fb/1bhcZwNployLM5eAG5XUNxSF11dj9vWyyxTS3++zedScR9VRs
         DKpJC/uKDb3VM8djcyeCZF/Kvl8vIMAk3/g5CDTRh1SNE87YKUGqlItOQlwuPAZof3Kx
         gdjpIpMB6o81LyhuIOxHFSfEcBfx3cninV6/hb34/KAdejCQN6RBdVPn50tn72LzecZy
         NNzI7GVwoHqTa1me0SSgPxt3GwinEOAz7omW5bJTY4qhSKFsXdRy8japIWsfZtY/dM1D
         CJD81sL3ueEDAVSWeNJ6suh91GQ0hRiHFDq5xpOVZd1jKrHSkPU8gjCAY0PkW5EVounJ
         w7dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694533871; x=1695138671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZUdgHz1EThvHhDCfER2QcOxP464/TYWECsF6ss3Llv8=;
        b=cap9k4gVfbemFGg85iRC6X6RDDAYLufL+96D9TlHZFm/AbnV6HLa885SRt2I4s7A1r
         ivdykycfy/hPexoy7oGEOQ4f3nuVF15WPhaaiSTui2+uZMuaQO9yWVC5OWUIMPhdQoJS
         bhSeeWvOFCYIWV7YS3Ij+G/dfE7F6H8xzaAXGAGxculOtd6l5huo6EeMMEu19XFRR8p2
         CKuqZpY87Cr5P6m0j9w6Z7QaEfullHdtyqKIZ4o+6Tnor+F/ixqPq5Pqel7p7DNLbim1
         J+dStaUMauoHdHKKXyNlRqc9ZQT0sJboEzuhAxLaF7bBADi5MreA0A9GNO2RMNbXussL
         sBPw==
X-Gm-Message-State: AOJu0YxnvUuCOXkWBTkJG7f2XV3qH18p6H2+KAm5fLzSIEFEJMovK02G
	bv6jsDV09163aO5niFmrpRcmETrq4sP+YL/T
X-Google-Smtp-Source: AGHT+IEPyTBOuD137PDb5hsrEYqnclMHOWuZ7gkQz54FV5aXlia/e1v2LPpVwhbzWGM1Q6iInFPsoA==
X-Received: by 2002:a17:906:a18b:b0:99d:e417:d6f6 with SMTP id s11-20020a170906a18b00b0099de417d6f6mr9574690ejy.32.1694533870294;
        Tue, 12 Sep 2023 08:51:10 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id op5-20020a170906bce500b009a1fef32ce6sm7143043ejb.177.2023.09.12.08.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 08:51:09 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: mchehab@kernel.org, tfiga@chromium.org, m.szyprowski@samsung.com,
 ming.qian@nxp.com, ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
 gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl,
 nicolas.dufresne@collabora.com,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev, kernel@collabora.com
Subject: Re: [PATCH v6 14/18] media: verisilicon: vp9: Use destination buffer height
 to compute chroma offset
Date: Tue, 12 Sep 2023 17:51:07 +0200
Message-ID: <1940906.PYKUYFuaPT@jernej-laptop>
In-Reply-To: <40329795-a57d-d0f3-adb4-0720dd20f6e2@collabora.com>
References: <20230901124414.48497-1-benjamin.gaignard@collabora.com>
 <3248154.aeNJFYEL58@jernej-laptop>
 <40329795-a57d-d0f3-adb4-0720dd20f6e2@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_085114_959229_FB4EC8EE 
X-CRM114-Status: GOOD (  26.35  )
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

Dne torek, 12. september 2023 ob 10:41:10 CEST je Benjamin Gaignard=20
napisal(a):
> Le 11/09/2023 =C3=A0 18:36, Jernej =C5=A0krabec a =C3=A9crit :
> > Dne ponedeljek, 11. september 2023 ob 10:55:02 CEST je Benjamin Gaignard
> >=20
> > napisal(a):
> >> Le 10/09/2023 =C3=A0 15:21, Jernej =C5=A0krabec a =C3=A9crit :
> >>> Hi Benjamin!
> >>>=20
> >>> Dne petek, 01. september 2023 ob 14:44:10 CEST je Benjamin Gaignard
> >>>=20
> >>> napisal(a):
> >>>> Source and destination buffer height may not be the same because
> >>>> alignment constraint are different.
> >>>> Use destination height to compute chroma offset because we target
> >>>> this buffer as hardware output.
> >>>>=20
> >>>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> >>>> Fixes: e2da465455ce ("media: hantro: Support VP9 on the G2 core")
> >>>> ---
> >>>>=20
> >>>>    drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c | 4 +---
> >>>>    1 file changed, 1 insertion(+), 3 deletions(-)
> >>>>=20
> >>>> diff --git a/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
> >>>> b/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c index
> >>>> 6db1c32fce4d..1f3f5e7ce978 100644
> >>>> --- a/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
> >>>> +++ b/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
> >>>> @@ -93,9 +93,7 @@ static int start_prepare_run(struct hantro_ctx *ct=
x,
> >>>> const struct v4l2_ctrl_vp9_ static size_t chroma_offset(const struct
> >>>> hantro_ctx *ctx,
> >>>>=20
> >>>>    			    const struct v4l2_ctrl_vp9_frame
> >>>=20
> >>> *dec_params)
> >>>=20
> >>>>    {
> >>>>=20
> >>>> -	int bytes_per_pixel =3D dec_params->bit_depth =3D=3D 8 ? 1 : 2;
> >>>> -
> >>>> -	return ctx->src_fmt.width * ctx->src_fmt.height * bytes_per_pixel;
> >>>> +	return ctx->dst_fmt.width * ctx->dst_fmt.height * ctx->bit_depth /
> >>>=20
> >>> 8;
> >>>=20
> >>> Commit message doesn't mention bit_depth change at all. While I think
> >>> there is no difference between dec_params->bit_depth and ctx->bit_dep=
th,
> >>> you shouldn't just use ordinary division. If bit_depth is 10, it will=
 be
> >>> rounded down. And if you decide to use bit_depth from context, please
> >>> remove dec_params argument.
> >>=20
> >> I will change this patch and create a helpers function for chroma and
> >> motion vectors offsets that VP9 and HEVC code will use since they are
> >> identical. I don't see issue with the division. If you have in mind a
> >> solution please write it so I could test it.
> >=20
> > Solution is same as the code that you removed:
> > int bytes_per_pixel =3D dec_params->bit_depth =3D=3D 8 ? 1 : 2;
> >=20
> > Or alternatively:
> > int bytes_per_pixel =3D DIV_ROUND_UP(dec_params->bit_depth, 8);
> >=20
> > Consider bit_depth being 10. With old code you get 2, with yours you get
> > 1.
>=20
> The old code is wrong ;-)
> If the format depth is 10 bits per pixel then chroma offset (in bytes)
> formula is width * height * 10 / 8 not width * height * 16 / 8.
>=20
> I have already confirm that with HEVC on the same hardware.

Ok, mention of bit_depth issue in commit log would be great. It talks only=
=20
about width and height.

In any case, are width and/or height always dividable by 8?

Best regards,
Jernej

>=20
> Regards,
> Benjamin
>=20
> > Best regards,
> > Jernej
> >=20
> >> Regards,
> >> Benjamin
> >>=20
> >>> Best regards,
> >>> Jernej
> >>>=20
> >>>>    }
> >>>>   =20
> >>>>    static size_t mv_offset(const struct hantro_ctx *ctx,





