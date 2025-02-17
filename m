Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 435C2C021A9
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Feb 2025 19:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AzAfbcIU/2Am+v+jnPFOtCbj7SMgMMXKSogURXBFTnU=; b=iShgObvM6O/r5I5ERIP2L2yOgb
	9p7OWWpMCsUqS9s6Red3Y+WPy/SJjggfm8FtZY6jgDzd83ts3yEuWulN0HhHOt41h90+cga5Ny9Oi
	x4SwV6Dw8CWbSL9/UChniXcw68TGoRcuauHgdiaWCTmL0OdukQFwxCDuHSNym2UCYoOVtBupy/+Ql
	yYfYztAvxCbiRyCrj/2rx1hwHuWg22A97enA4rDrOEUtpmfwTqt3JkyMwcdNMZ3zpEZm2ieRUlIVa
	IAXx0C6ZHiXqpfdy6Zd03Sk2MzqnYoaLV4n4BlMpVkE31/2R3U/H2AjHaIVG5nw0JQQu71R5ZQPKI
	FI1dJH5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk6nV-00000005knn-1YAs;
	Mon, 17 Feb 2025 19:28:53 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk6nS-00000005kle-1J8n
	for linux-mediatek@lists.infradead.org;
	Mon, 17 Feb 2025 19:28:51 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-7c07838973eso445936085a.2
        for <linux-mediatek@lists.infradead.org>; Mon, 17 Feb 2025 11:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1739820528; x=1740425328; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AzAfbcIU/2Am+v+jnPFOtCbj7SMgMMXKSogURXBFTnU=;
        b=22gSFExae+aEu43kckWWrCwxFrVRh0+5A/8pYEuS2QKYRq5xreyQXKzCm01N74YApz
         F7XX758Xs+uZhJ9IljLNc5uAgoavZMHO5UVNG7bXcBL/ER9T/oKA3uILielRK+iAZAOV
         iiRN7Uo5P63Ot51YGwxjTuWv3QpWYUT2oVIxHtovGJyzQJsnyvemXW/aMYJj+B7WJT1E
         3nRlDvdrGS7jvCn2POUQCSpkxp7rvOELYHhlfmh6efLKDSsZW/Y+kVj+Omuh2Qv0dKjH
         x8HPI5WpMx5Ccuh4hp+463Shmp2GaJwwP59QUEUXVGqUtRZxhqVjWCLNm2JE5r8KDD/Q
         54qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739820528; x=1740425328;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AzAfbcIU/2Am+v+jnPFOtCbj7SMgMMXKSogURXBFTnU=;
        b=QVdBnHV1bdzn8kT9zV0MhchRwYwP2QsyPo5risfivo4L162SzAWfCirY2UPZYl7rzO
         kB64ewiBpyuMvuKwVtGKUNSl3HGTZ5Lx7fWXEFH7xo0un6OiHwuk3z1Lg97A2jFfq4OU
         XXH5/0w6vR5lAJHVtILenb3IGeDLWlm35CI5vadyxAnnoM0XGWZ4jveDnXK5r165MgIB
         cxQJO0pq+Rvr6jkYSPMyFZg51yWmXul6YHh8tmEg+NGlIz3Jhq8jF//B02/b3vXC7l8P
         skn+OJGd/zBxjS/cnNhc4mxTCDUwP9KGvhwGZRBlJqHSHeFlzKIkcIg3k1SzDOg4lTeA
         yi0A==
X-Gm-Message-State: AOJu0Yw96VS9n+LNAIMKEpByQwMIVHJ8FskDNnEFAnBw1x4dqbrbRiOb
	C6xcrRo1hFjqtuziPWEoFjgvn+CQLIhC062IW8WhGE+uU6Bc+DboDLt19QN9rmY=
X-Gm-Gg: ASbGncscM/gRpaH9t0h6sBh+91wLeMGwTUiUKdFkSPTAHInMUgMvSGf3RLZYNMNc5zJ
	p86//Kqg1g45EnokIYWEcpbWN7ZGBjWOyFYABSK6L2194eYzIyvNyUn9R9Vioxjqhcno06ctnzf
	Ob/RoJeA3OMToMrZzd61//D8kUk2oMk50U6oXUucd1mJyMgTmchLLTDdZw4V/HIuIDtyIPcSlIl
	KNtyBZy6lp4Pg2Wmvo/ZaCIjWBNn572Jtftk89Kz1khXjSLPF9PDtpLaJJilDp11Gl0N6o7y+x0
	IJJ7CcSY5ONnxZquRLG+
X-Google-Smtp-Source: AGHT+IF0M1JuegcbLy3i0Bijjwl67r9LgXH3tketiaHBXEgodxNXXo5qAbFCYzz/X43MZ2CJv0eXEA==
X-Received: by 2002:a05:620a:40c1:b0:7c0:7350:9adb with SMTP id af79cd13be357-7c08a9801b5mr1443794485a.11.1739820527975;
        Mon, 17 Feb 2025 11:28:47 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:e976::5ac? ([2606:6d00:11:e976::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c096e87af7sm193307485a.79.2025.02.17.11.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 11:28:46 -0800 (PST)
Message-ID: <1f1e41700b16eef7fe790b9b14d6ccfd157f67ad.camel@ndufresne.ca>
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
Date: Mon, 17 Feb 2025 14:28:45 -0500
In-Reply-To: <f257832e823d23c8324a9eaf7890dd4b6d50a6f0.camel@ndufresne.ca>
References: <20250211-enable_hevc_still_picture-v1-1-0c06c0c9add2@chromium.org>
	 <f257832e823d23c8324a9eaf7890dd4b6d50a6f0.camel@ndufresne.ca>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mQGiBEUQN0MRBACQYceNSezSdMjx7sx6gwKkMghrrODgl3B0eXBTgNp6c431IfOOEsdvk
 oOh1kwoYcQgbg4MXw6beOltysX4e8fFWsiRkc2nvvRW9ir9kHDm49MkBLqaDjTqOkYKNMiurFW+go
 zpr/lUW15QqT6v68RYe0zRdtwGZqeLzX2LVuukGwCg4AISzswrrYHNV7vQLcbaUhPgIl0D+gILYT9
 TJgAEK4YHW+bFRcY+cgUFoLQqQayECMlctKoLOE69nIYOc/hDr9uih1wxrQ/yL0NJvQCohSPyoyLF
 9b2EuIGhQVp05XP7FzlTxhYvGO/DtO08ec85+bTfVBMV6eeY4MS3ZU+1z7ObD7Pf29YjyTehN2Dan
 6w1g2rBk5MoA/9nDocSlk4pbFpsYSFmVHsDiAOFje3+iY4ftVDKunKYWMhwRVBjAREOByBagmRau0
 cLEcElpf4hX5f978GoxSGIsiKoDAlXX+ICDOWC1/EXhEEmBR1gL0QJgiVviNyLfGJlZWnPjw6xhhm
 tHYWTDxBOP5peztyc2PqeKsLsLWzAr7RDTmljb2xhcyBEdWZyZXNuZSAoQi4gU2MuIEluZm9ybWF0
 aXF1ZSkgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPohgBBMRAgAgBQJFlCyOAhsDBgsJCAcDA
 gQVAggDBBYCAwECHgECF4AACgkQcVMCLawGqBwhLQCgzYlrLBj6KIAZ4gmsfjXD6ZtddT8AoIeGDi
 cVq5WvMHNWign6ApQcZUihtElOaWNvbGFzIER1ZnJlc25lIChCLiBTYy4gSW5mb3JtYXRpcXVlKSA
 8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY28udWs+iGIEExECACIFAkuzca8CGwMGCwkIBwMC
 BhUIAgkKCwQWAgMBAh4BAheAAAoJEHFTAi2sBqgcQX8An2By6LDEeMxi4B9hUbpvRnzaaeNqAJ9Ro
 x8rfqHZnSErw9bCHiBwvwJZ77QxTmljb2xhcyBEdWZyZXNuZSA8bmljb2xhcy5kdWZyZXNuZUBjb2
 xsYWJvcmEuY29tPohiBBMRAgAiBQJNzZzPAhsDBgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRB
 xUwItrAaoHLlxAKCYAGf4JL7DYDLs/188CPMGuwLypwCfWKc9DorA9f5pyYlD5pQo6SgSoiC0J05p
 Y29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPohiBBMRAgAiBQJVwNwgAhsDBgsJC
 AcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRBxUwItrAaoHCZ4AJ0QwU6/G4c7h9CkMBT9ZxGLX4KSnQ
 Cgq0P7CX7hv/M7HeyfMFZe8t3vAEW0RE5pY29sYXMgRHVmcmVzbmUgKEIuIFNjLiBJbmZvcm1hdGl
 xdWUpIDxuaWNvbGFzZEBibHVlc3RyZWFrdGVjaC5jb20+iGAEExECACAFAkZjGzoCGwMGCwkIBwMC
 BBUCCAMEFgIDAQIeAQIXgAAKCRBxUwItrAaoHBl7AJ0d2lrzshMmJaik/EaDEakzEwqgxQCg0JVZM
 Zm9gRfEou1FvinuZxwf/mu0R05pY29sYXMgRHVmcmVzbmUgKEIgU2MuIEluZm9ybWF0aXF1ZSkgPG
 5pY29sYXMuZHVmcmVzbmVAdXNoZXJicm9va2UuY2E+iGAEExECACAFAkUQN0MCGwMGCwkIBwMCBBU
 CCAMEFgIDAQIeAQIXgAAKCRBxUwItrAaoHPTnAJ0WGgJJVspoctAvEcI00mtp5WAFGgCgr+E7ItOq
 ZEHAs+xabBgknYZIFPU=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_112850_348479_51FFD5A6 
X-CRM114-Status: GOOD (  23.95  )
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

aLe lundi 17 f=C3=A9vrier 2025 =C3=A0 13:45 -0500, Nicolas Dufresne a =C3=
=A9crit=C2=A0:
> Hi Nathan,
>=20
> Le mardi 11 f=C3=A9vrier 2025 =C3=A0 16:34 -0800, Nathan Hebert a =C3=A9c=
rit=C2=A0:
> > Mediatek devices that support HEVC also support the main still picture
> > profile, but today, the main still picture profile is excluded.
> >=20
> > This removes the skip mask for HEVC, and enables the main still
> > picture profile decoding.
> >=20
> > Signed-off-by: Nathan Hebert <nhebert@chromium.org>
> > ---
> > On Mediatek devices that support HEVC decoding, HEVC Main Still Picture
> > profile is also supported by the SOC and firmware. However, this
> > capability is turned off in the vcodec driver.
> >=20
> > This removes the code that disables HEVC Main Still Picture profile
> > decoding. Validation of the decoder has been done via V4L2-backed
> > Android CTS tests on an MT8196 device.
>=20
> While its nice to know that you are working on upcoming SoC, we need
> confirmation that this is working on all the upstream stateless
> decoders supported: 8183, 8186, 8192, 8195. Ideally testing on 8188,
> which I can see has merged support without the linux-firmware file to
> go with it.
>=20
> I'll wait for that and Yunfei's ack before picking it. Yunfei, please
> fix the situation with 8188 in linux-firmware, and CC me.

In case this is useful, we recommend providing fluster scores for the
codec, which in that case runs some public ITU conformance vectors.
Since most of the testing has been done with GStreamer, you may be able
to find old report and confirm it it works. GStreamer does not
currently filter the profile/level (on my todo), so it will try anyway.
IPRED_B_Nokia_3 is the one vector in the base suite that expose that
profile.

resources/JCT-VC-HEVC_V1/IPRED_B_Nokia_3/IPRED_B_Nokia_3.bit
  Stream #0:0: Video: hevc (Main Still Picture), none, 1920x1080, 25 fps, 1=
200k tbr, 1200k tbn

regards,
Nicolas

>=20
> regards,
> Nicolas
>=20
> > ---
> > =C2=A0.../media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_statele=
ss.c=C2=A0=C2=A0 | 2 --
> > =C2=A01 file changed, 2 deletions(-)
> >=20
> > diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_=
dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec=
_dec_stateless.c
> > index afa224da0f41..d873159b9b30 100644
> > --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_sta=
teless.c
> > +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_sta=
teless.c
> > @@ -152,8 +152,6 @@ static const struct mtk_stateless_control mtk_state=
less_controls[] =3D {
> > =C2=A0			.id =3D V4L2_CID_MPEG_VIDEO_HEVC_PROFILE,
> > =C2=A0			.def =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
> > =C2=A0			.max =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
> > -			.menu_skip_mask =3D
> > -				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE),
> > =C2=A0		},
> > =C2=A0		.codec_type =3D V4L2_PIX_FMT_HEVC_SLICE,
> > =C2=A0	},
> >=20
> > ---
> > base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
> > change-id: 20250211-enable_hevc_still_picture-26b35eb08270
> >=20
> > Best regards,
>=20


