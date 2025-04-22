Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C6BEC369C2
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Apr 2025 20:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h2racLDTZ4BkogFjHmNJhfnBse5H17sx7z3H/zKT9ZY=; b=1JjX3ZJZCBeuT4ZJ0tIXX9Wbn9
	mZXzMnYZmtaRNRtCif7/V1gkk/ic1Qaim83vZLijqK4lG5x/ThrQKYuQ8yAf7g45FkilExKTIkkrI
	qCVS4X+6WOD0hqTkiUGh4AqxGhmkH3PBv+TBJmBZkqBp92UYuIYDuO8YZe6HB35fafTQ8brYmiIKC
	8YuWcO9kHGmGYLmUXwhI4Xp03bLarkcKllvn++FDO8tn4FN/2kBV8fwKCJmU5uFQ9GTy9o2oQrm8h
	71xVSnYSsEggABNImTf1/b9gnoEOegKw6X2atGWxtIfgFXR5fRZJR5oko+KXgph21SeZc5fdy6sJL
	WSywV5OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7KfU-00000008X3g-1LLz;
	Tue, 22 Apr 2025 20:56:36 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Kdq-00000008Wsq-2xdB
	for linux-mediatek@lists.infradead.org;
	Tue, 22 Apr 2025 20:54:56 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-7c597760323so524324985a.3
        for <linux-mediatek@lists.infradead.org>; Tue, 22 Apr 2025 13:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1745355293; x=1745960093; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=h2racLDTZ4BkogFjHmNJhfnBse5H17sx7z3H/zKT9ZY=;
        b=OpY8RTixHKUWwyOvzxz0CSKjDF5yUkIAeltj8hzfl+fKiopSwlJARCxCfcRMthi8uY
         VQ4B7RBkXaU/kOKVC7W0uRC86S6jWP+oLxRCS5zaJzw5oR7stoTfPkYe71zP1v5obMuu
         jkug26KraS5tZdtEiAEpOEJ7rZL9h4EwXxoDNv2NGZ1ZhwoECQ8GDz7b8mgUgHWMGSVL
         aLKCkwjIEP9Z/X8OFNfDyoqJ6BtlEx4koax/MnJs78BXjGxopmhoOpHkttdoqQ321Qdj
         mT6SP88MvXTN7LvaaSY/M+Zil5bKbKqFwZf52H1EdTgr169GmX9DpLCZKEL6ZibWY64Y
         tCtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745355293; x=1745960093;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h2racLDTZ4BkogFjHmNJhfnBse5H17sx7z3H/zKT9ZY=;
        b=srJJDqxtEBlYWtVM8ctdrQMwtht7DKLJKhELO/+UQn1UMTSz9w/PTrJIB7FfpeSipK
         1Vb28FmJuWiueRYnZxjQv0EdBuEDy/4m2WJ4N5WUpApJ3mK5V76vO6Ar/oLONLHVugop
         HAIxBpvhryV4V3FgsjdymKUq6KCv4mVouKVd8qIDHeKJ9hiouO9p1RfneEBkdoxcBfS9
         wwaKvsKMdETFuRYVhfk3t4ZX3sUSWJgrle611M2Q1SpLebf+vmoF416hsIEEgyBu0Xr8
         dWoNpaYLYyUv8Gc+IW9R/dXHf7GzNuv3hKwqvP5VwrFkEdjaofyqe5GE2fltr61SJq+T
         9Uqw==
X-Gm-Message-State: AOJu0YzdSdKgQUbhEmaIq6/Oh1SO7cMhnTHWdXM8aJVuOFQSx0Kuspbc
	EWC+rOgbi0MhfYKT1AGqX6PTmc8Rtnjw/nOzWolOflBY+xtiL2m+LzJ9484aUKk=
X-Gm-Gg: ASbGncsZyNcqSF1FCC62ZSFF1DgagceZB+g+JKvr9IoqJl8zBMIYsG+MKe0Ck81drHA
	fkNJ2jzlbh2IIGtNMiJc/DK8HfS7x62isGeoZDJbeoB8DstRPxGmiTRY8qllu3GoJTAwJLwFMu0
	jutMXkNBEAPJdcW9FCgWtuLkzL6vuhJaJ2DKDDA/uJCngZa5iEKc4Ca6KuK9E6bZ7UfOVNOkFuN
	onFOvNR0XKAeXu5jL7bbbbcCQD43WSsXdCpPlYRhQ3wFG1OXZXjg9fwe9NFuT8j2VNlKo+QT8JE
	grgN3QZpuP5mJR7RbZkvZqRl2+exLmTX2pD6q4ddMB1GJQ==
X-Google-Smtp-Source: AGHT+IG7H1gakbIZ84kGicq0NVQy0jmgb+jY1czwu6X0ujlQIaddI3Iuf1eaCrSBqUaX2okXmWyUXQ==
X-Received: by 2002:a05:620a:bc4:b0:7c5:562d:ccf8 with SMTP id af79cd13be357-7c927f76f3cmr2993734385a.8.1745355293398;
        Tue, 22 Apr 2025 13:54:53 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:9913::5ac? ([2606:6d00:15:9913::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925b778b5sm595240385a.102.2025.04.22.13.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 13:54:52 -0700 (PDT)
Message-ID: <a2cb7a26f120558ab7b84a6f954188c8e61f37a8.camel@ndufresne.ca>
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
Date: Tue, 22 Apr 2025 16:54:51 -0400
In-Reply-To: <1f1e41700b16eef7fe790b9b14d6ccfd157f67ad.camel@ndufresne.ca>
References: <20250211-enable_hevc_still_picture-v1-1-0c06c0c9add2@chromium.org>
		 <f257832e823d23c8324a9eaf7890dd4b6d50a6f0.camel@ndufresne.ca>
	 <1f1e41700b16eef7fe790b9b14d6ccfd157f67ad.camel@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_135454_984396_F6B26087 
X-CRM114-Status: GOOD (  26.37  )
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

Le lundi 17 f=C3=A9vrier 2025 =C3=A0 14:28 -0500, Nicolas Dufresne a =C3=A9=
crit=C2=A0:
> aLe lundi 17 f=C3=A9vrier 2025 =C3=A0 13:45 -0500, Nicolas Dufresne a =C3=
=A9crit=C2=A0:
> > Hi Nathan,
> >=20
> > Le mardi 11 f=C3=A9vrier 2025 =C3=A0 16:34 -0800, Nathan Hebert a =C3=
=A9crit=C2=A0:
> > > Mediatek devices that support HEVC also support the main still pictur=
e
> > > profile, but today, the main still picture profile is excluded.
> > >=20
> > > This removes the skip mask for HEVC, and enables the main still
> > > picture profile decoding.
> > >=20
> > > Signed-off-by: Nathan Hebert <nhebert@chromium.org>
> > > ---
> > > On Mediatek devices that support HEVC decoding, HEVC Main Still Pictu=
re
> > > profile is also supported by the SOC and firmware. However, this
> > > capability is turned off in the vcodec driver.
> > >=20
> > > This removes the code that disables HEVC Main Still Picture profile
> > > decoding. Validation of the decoder has been done via V4L2-backed
> > > Android CTS tests on an MT8196 device.
> >=20
> > While its nice to know that you are working on upcoming SoC, we need
> > confirmation that this is working on all the upstream stateless
> > decoders supported: 8183, 8186, 8192, 8195. Ideally testing on 8188,
> > which I can see has merged support without the linux-firmware file to
> > go with it.
> >=20
> > I'll wait for that and Yunfei's ack before picking it. Yunfei, please
> > fix the situation with 8188 in linux-firmware, and CC me.
>=20
> In case this is useful, we recommend providing fluster scores for the
> codec, which in that case runs some public ITU conformance vectors.
> Since most of the testing has been done with GStreamer, you may be able
> to find old report and confirm it it works. GStreamer does not
> currently filter the profile/level (on my todo), so it will try anyway.
> IPRED_B_Nokia_3 is the one vector in the base suite that expose that
> profile.
>=20
> resources/JCT-VC-HEVC_V1/IPRED_B_Nokia_3/IPRED_B_Nokia_3.bit
> =C2=A0 Stream #0:0: Video: hevc (Main Still Picture), none, 1920x1080, 25=
 fps, 1200k tbr, 1200k tbn

Ran the test myself on MT8195 and can confirm it passes if you ignore
the profiles.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

>=20
> regards,
> Nicolas
>=20
> >=20
> > regards,
> > Nicolas
> >=20
> > > ---
> > > =C2=A0.../media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
less.c=C2=A0=C2=A0 | 2 --
> > > =C2=A01 file changed, 2 deletions(-)
> > >=20
> > > diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcode=
c_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcod=
ec_dec_stateless.c
> > > index afa224da0f41..d873159b9b30 100644
> > > --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_s=
tateless.c
> > > +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_s=
tateless.c
> > > @@ -152,8 +152,6 @@ static const struct mtk_stateless_control mtk_sta=
teless_controls[] =3D {
> > > =C2=A0			.id =3D V4L2_CID_MPEG_VIDEO_HEVC_PROFILE,
> > > =C2=A0			.def =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
> > > =C2=A0			.max =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
> > > -			.menu_skip_mask =3D
> > > -				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE),
> > > =C2=A0		},
> > > =C2=A0		.codec_type =3D V4L2_PIX_FMT_HEVC_SLICE,
> > > =C2=A0	},
> > >=20
> > > ---
> > > base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
> > > change-id: 20250211-enable_hevc_still_picture-26b35eb08270
> > >=20
> > > Best regards,
> >=20

