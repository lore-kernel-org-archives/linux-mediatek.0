Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 213DEC36017
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Apr 2025 15:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TMIWEgwFtWafyi1/bv5jf0ov4gPA0B6DmtDQeyIS7xQ=; b=oRZqSIlZZfwOImHyDVD0qyhs26
	Gu/4OcyMp84AcEERPc/r0XKf0/W1OXDQAqscLUpfez01XqBIcmj/GlhvcOOuHhFTSTGvtCWrRRmV3
	/u3bqJ8GM9WwKKuKqQgBUzSd0YXq4CJDJWNJ5GC1R2f+eWMdflk5ciyOVy4FzmHOBg87eKkUx0V3K
	GtLjEpPYnZOKTMpGVmiN0Dkq7rOaU3jTbqJ8rNR7MbUwZaIRXEHCAuYA54duBQsNTy12YCizdvt09
	tgO7zEO45VNfT0YdMo0bCeWKc4DBaEZiQJbmrJWYVM/Y7NR7o/FvFULA9o/0eDCSaUGIxrfmKXuZX
	lSLzzgWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u008Q-00000006XKi-0dQ1;
	Wed, 02 Apr 2025 15:36:10 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u007J-00000006XE6-13Cm
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Apr 2025 15:35:02 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-4769bbc21b0so61534691cf.2
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Apr 2025 08:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1743608099; x=1744212899; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TMIWEgwFtWafyi1/bv5jf0ov4gPA0B6DmtDQeyIS7xQ=;
        b=KlRwsR6SNbXgKfG3lAsdKvRQ6/X0Crz8O63/5dJUGXOy7YgN/kaTihaGzcw+ps7syC
         AwcKR7iqttYlXbvvBVV61Ez9oY2WP3khaj8+Cu7C5cMOXVm15o/BxRN9aReDhOoeE6om
         HSOdhJFOvyQpSPtDWlEgEVLUqexpwu3cfo7p6TILItAkcwWbecY9zJhD89BrdkthNt4s
         GDozrn6xCoo56o2LClGpC6s1sS2PdkLxzd36YUwJ+Vay+dYwGe7kGD/PztUSWNsX7Mj+
         fGVWruMLK7x0yRayYP/RQUYu/wpiDCIhDNCvzHi+yUqEjoaPUICot6wuxqMB1/lRIixT
         6Krw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743608099; x=1744212899;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TMIWEgwFtWafyi1/bv5jf0ov4gPA0B6DmtDQeyIS7xQ=;
        b=T4TfVi7zLHGQX7cHdE4XFOoIRi7cwxJOwOp2ODPJHJ0+iwdpPlCOPS0XNOBC+YoV37
         PbpgNrc28p9LHcypKq+AN5h28B46QTVlOpCHdJOL5SOmuHhOegYY3/QEm98mY48+2gdY
         4cn9lG/dCYTWLhHOvMRpb//39K7a9+zsYoNL1q2BF2Qq/ZDphT+WGbIidwGXwRMM/Fyg
         NOR6Pp/vrDh5hKiFErmQLE9WyBNoG5zhgK9bcDKyMoRVNQ0wyXX7Wo0v4aXeIntn5hjH
         ShWPYt40T/Ec5A5Qx9MPDliuk7mzfIF9N0L0PIow0i7BnfKZ05BPV/+CvVpclgQaJt+z
         VsYA==
X-Forwarded-Encrypted: i=1; AJvYcCXUiZ2MWFtSXvi/xkHjQwYwVVcly+rbVxagfBcHpcVyrJCb6GrfT1uXxDom1cH85qNMbC0+8VUIH069ZZ3fXA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy38rTDqK9j2V8pwAt4u9jle0oQCUk4RLYIwFdLtbJWm1qI0ckg
	4mb5T4522C/LGvBRpXUvKF5de+3Qx1ie4U+HUlhzTDnezD6grSUwK58Js+OmjFY=
X-Gm-Gg: ASbGncv7GYwbaHIrIf3mmezTV2N0Gyo5YMWvBRi9BuD0qZCmWBg9ZfZZiZAzFWK0h0E
	0pz2qglSZa9bqE8GsaZHmrlkQbOzoIu52b2Kw64FrRttAakN9Hppzi8ooixg/zZl1GSX4E2pZsy
	e80jAZB3sqzmqUjfZCMu/sFQ99fsxctu9MORmOs2alyfJWd7QkamOI7+ENMNPlAnxta5HsFUH+l
	X18VzbB0STuow7kKBqDjkH6xUetPHFmFcLZn3Ctkg8dTJq/SjytTW4pyOXLKC3BW2WhiJQyV97t
	dXTotpYpa9IQOqJ0/n50/RCTQeyVlPwciwHd/w6ikh7CKwEJxA==
X-Google-Smtp-Source: AGHT+IF86UTdqujtK2ylyC4iKj51JDYDBGg0ZkrtMCZ8qTcR6Ji/O+4OQfsimKWJomrOBg7nwZAemg==
X-Received: by 2002:ac8:5991:0:b0:476:9e82:6515 with SMTP id d75a77b69052e-47909fa7e14mr42821291cf.23.1743608099524;
        Wed, 02 Apr 2025 08:34:59 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:e976::5ac? ([2606:6d00:11:e976::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47782a7fbf4sm80192371cf.39.2025.04.02.08.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 08:34:59 -0700 (PDT)
Message-ID: <8fe576366e52d530d0507d8475fb52210a27b6df.camel@ndufresne.ca>
Subject: Re: [PATCH] media: mediatek: vcodec: Correct vsi_core framebuffer
 size
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Fei Shao <fshao@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Yunfei Dong
	 <yunfei.dong@mediatek.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Date: Wed, 02 Apr 2025 11:34:57 -0400
In-Reply-To: <20250314075703.4167532-1-fshao@chromium.org>
References: <20250314075703.4167532-1-fshao@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_083501_559279_5671B7E4 
X-CRM114-Status: GOOD (  16.23  )
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

Le vendredi 14 mars 2025 =C3=A0 15:56 +0800, Fei Shao a =C3=A9crit=C2=A0:
> The framebuffer size for decoder instances was being incorrectly set -
> inst->vsi_core->fb.y.size was assigned twice consecutively.
>=20
> Assign the second picinfo framebuffer size to the C framebuffer instead,
> which appears to be the intended target based on the surrounding code.
>=20
> Fixes: 2674486aac7d ("media: mediatek: vcodec: support stateless hevc dec=
oder")
> Signed-off-by: Fei Shao <fshao@chromium.org>
> ---
>=20
> =C2=A0.../mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hev=
c_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec=
_hevc_req_multi_if.c
> index aa721cc43647..2725db882e5b 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_m=
ulti_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_m=
ulti_if.c
> @@ -821,7 +821,7 @@ static int vdec_hevc_slice_setup_core_buffer(struct v=
dec_hevc_slice_inst *inst,
> =C2=A0	inst->vsi_core->fb.y.dma_addr =3D y_fb_dma;
> =C2=A0	inst->vsi_core->fb.y.size =3D ctx->picinfo.fb_sz[0];
> =C2=A0	inst->vsi_core->fb.c.dma_addr =3D c_fb_dma;
> -	inst->vsi_core->fb.y.size =3D ctx->picinfo.fb_sz[1];
> +	inst->vsi_core->fb.c.size =3D ctx->picinfo.fb_sz[1];

To Yunfei, this information is copied to be passed to the CORE, is that
value not used by the firmware ? I can see that everything else in the
driver uses the picinfo structure. I'm simply trying to understand why
that didn't break anything and what is the implication before this fix,
so I can determin is that's more or less cosmetic at the moment. That
being asked, I'll give it my:

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> =C2=A0
> =C2=A0	inst->vsi_core->dec.vdec_fb_va =3D (unsigned long)fb;
> =C2=A0

