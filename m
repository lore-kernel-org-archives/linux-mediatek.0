Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E5C8CA0EFA
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Aug 2025 15:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gNAXqOqDA9cqjdX2o6MNVIoW7F+Slfq6PVIdvquqCX0=; b=VOQcdIq4ie/HIEzo9IhKj1LnE+
	PWMrrTNEr2j6TI/Xrgv4fJ5QPVW3dLEyBc0CmMmu6hz8IC4t6e9LpEqBWcHhuA50tWVpI0BBnQEtU
	G5Rl7szGiTvbkk4BempRRqd/OniBFqKnUvh64XUpEt9AcHixrv/HuHvNlzBdqY/XNxVYH+fyyGYRE
	soxf7o7y27iHERpkA7vfYtrkShfJSeq+MhbuFEuCweTF/qycQCJgaPfv5dqHCG/5ZorTWX54HTd/u
	d3hcvpfMwBPsc2qvopBIl/1hf/vu1wUf/Uyq6Z1L/y2rz0ZkFTF1LNHMxqcHKokPEz6oUu+IkZixz
	+cj+XH6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYgn-00000008Njb-0GdG;
	Mon, 25 Aug 2025 15:00:53 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqXLi-0000000865L-24F6
	for linux-mediatek@lists.infradead.org;
	Mon, 25 Aug 2025 13:35:04 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-7e86f90d162so473025885a.0
        for <linux-mediatek@lists.infradead.org>; Mon, 25 Aug 2025 06:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1756128901; x=1756733701; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gNAXqOqDA9cqjdX2o6MNVIoW7F+Slfq6PVIdvquqCX0=;
        b=c5k3sQ4YnfTrz7VHq59iGgcMWQrQYQu0U/QKenDAxWRVdNNXNMFoq6BQBnse2Rv4yt
         Ym7B9EGme1NtIv5x7eGpqS8bfNa+aMp/FdML1/vp/i97aA9mRv7e40VXR8QOqoAYsIVh
         HuMFaJnXmWxwAf+z8GPRPYQzypev1Y0Ltq1NlDSv+tpLGfTtR3Czp7/FP2cHHGIWqtpz
         umS31LtLo6ZaAn/6Bo/I/oLTsIqCP5SBcnWa8Ql1r82BDOW8w9DmW2yn6tVUtIK2o2RE
         VkIdNHKDrU8lej/vnAmWs10p5VRvG00uTpx8OEerFC9EkE+20UbWUEUhKxDs4yxAG2Dr
         5O0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756128901; x=1756733701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gNAXqOqDA9cqjdX2o6MNVIoW7F+Slfq6PVIdvquqCX0=;
        b=uOrNia5JYSP9Bx6xmcrdE3VtFYSKQ47q8C5E3WDybZDarxBhQbWCTDXkphVkXQAn94
         vRYmpHBbFh62FPhzYkUdCV61c7mnpZCTWkP3u/Tpajk55TXL0T1VNbQsUUf6Cnp2mcyy
         yUfNL6fyMLJSVYc1WzaUZim8RC5rNjbacbHY8HTbfxfbStXzdyPwwJFLZ6FdV7Q2einG
         jgVzDUajsZXWzzowN3AiQUxw7T0HZCy+rR0HLnfukHyvlnulwWC2z8Lf/SE2ueiy+7cO
         jEYwPUtCnebAwScvZi+t+xIshaFV64Dtqtp6wq+2RigRWGgVjH/meCSOC639zX/haz/A
         7mlg==
X-Forwarded-Encrypted: i=1; AJvYcCXaLFeqzIi6B+LWbJk4SmHkq3smb8/wt4zoWRyNbgaSKg0K9x1IKr72U0nL8HlG23OAAF2LSbAgXszMoXvuoQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxuJjCpFZWZBPnd+LicfnPcTlH6oUQdqx4fNsdlH5SizOLktQXs
	7s4j4E5ID0JEGUIppmbSmTxdy3hj/5kHXM2QRN9wftgNQkpB1TnbT2Cts7gxdSUWuSCrwaJMPT4
	FiWjRRAv/9QbVD8rF8Q0Oq0cIA4fz+kqbrw0dFJJE3A==
X-Gm-Gg: ASbGnctgCPsG27K7SQt0NRs6H14cHjx1ll6LffBnxkEUfwNhBbMPrh+VzU+A5Fyec+y
	YVqRhLW5Obx3JQccCkW57dNJVIvNRQDCrhwKLhNacKg5cZV9FbCZ9HinLMUEsausLnuZhcZi37N
	6QjYDbG1Uhu8+hU6ErhfR8dEX8m+MCiO9QPdmt3O2GTnt1aN6N+0n/Jzm8ScEECdAyTWgjADDqT
	MJp7cgwNgBcrk4VdtWO7K6sVSEG3ZYFdQynq7Oznjq/ImDRgUSl
X-Google-Smtp-Source: AGHT+IGOpK3uEJnQCrmnbOgq3jE9IN0xRtPnGuzZNnzUoPGGiNaxqS5J379tibwH0bqxmCutM7cmIZBZS3IWNjGPhFY=
X-Received: by 2002:a05:620a:7109:b0:7e6:81cc:6999 with SMTP id
 af79cd13be357-7ea0948df2fmr1733993185a.32.1756128900796; Mon, 25 Aug 2025
 06:35:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250822-mtk-post-blend-color-pipeline-v1-0-a9446d4aca82@collabora.com>
 <20250822-mtk-post-blend-color-pipeline-v1-1-a9446d4aca82@collabora.com>
In-Reply-To: <20250822-mtk-post-blend-color-pipeline-v1-1-a9446d4aca82@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Mon, 25 Aug 2025 14:34:48 +0100
X-Gm-Features: Ac12FXydArko6F2KpO-xscTn2Bhfj39k97NaH0mQfBe9_vPNG3yvbIIh17F1fXw
Message-ID: <CAPj87rPAoD2D99zTdsvJ=9K8+G17mTS2jDYHMPYmXNtUyp2L_Q@mail.gmail.com>
Subject: Re: [PATCH RFC 1/5] drm: Support post-blend color pipeline API
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Alex Hung <alex.hung@amd.com>, 
	wayland-devel@lists.freedesktop.org, harry.wentland@amd.com, leo.liu@amd.com, 
	ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com, 
	contact@emersion.fr, mwen@igalia.com, jadahl@redhat.com, 
	sebastian.wick@redhat.com, shashank.sharma@amd.com, agoins@nvidia.com, 
	joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org, xaver.hugl@gmail.com, 
	victoria@system76.com, uma.shankar@intel.com, quic_naseer@quicinc.com, 
	quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com, marcan@marcan.st, 
	Liviu.Dudau@arm.com, sashamcintosh@google.com, 
	chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com, mcanal@igalia.com, 
	kernel@collabora.com, daniels@collabora.com, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Simona Vetter <simona.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_063502_625817_94FF8B68 
X-CRM114-Status: GOOD (  15.82  )
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

Hi Nicolas,
Thanks for doing this! It's great to see.

On Fri, 22 Aug 2025 at 19:36, N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
> -/**
> - * drm_plane_colorop_curve_1d_lut_init - Initialize a DRM_COLOROP_1D_LUT
> - *
> - * @dev: DRM device
> - * @colorop: The drm_colorop object to initialize
> - * @plane: The associated drm_plane
> - * @lut_size: LUT size supported by driver
> - * @lut1d_interpolation: 1D LUT interpolation type
> - * @flags: bitmask of misc, see DRM_COLOROP_FLAG_* defines.
> - * @return zero on success, -E value on failure
> - */
> -int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct d=
rm_colorop *colorop,
> -                                       struct drm_plane *plane, uint32_t=
 lut_size,
> -                                       enum drm_colorop_lut1d_interpolat=
ion_type lut1d_interpolation,
> -                                       uint32_t flags)
> +static int
> +drm_common_colorop_curve_1d_lut_init(struct drm_device *dev,
> +                                    struct drm_colorop *colorop,
> +                                    uint32_t lut_size,
> +                                    enum drm_colorop_lut1d_interpolation=
_type lut1d_interpolation,
> +                                    uint32_t flags)

I think these would be better in a prior commit which only moved the
plane init around.

> @@ -416,6 +417,24 @@ int drm_mode_object_get_properties(struct drm_mode_o=
bject *obj, bool atomic,
>                                 continue;
>                 }
>
> +               if (post_blend_color_pipeline && obj->type =3D=3D DRM_MOD=
E_OBJECT_CRTC) {
> +                       struct drm_crtc *crtc =3D obj_to_crtc(obj);
> +                       struct drm_mode_config mode_config =3D crtc->dev-=
>mode_config;
> +
> +                       if (prop =3D=3D mode_config.gamma_lut_property ||
> +                           prop =3D=3D mode_config.degamma_lut_property =
||
> +                           prop =3D=3D mode_config.gamma_lut_size_proper=
ty ||
> +                           prop =3D=3D mode_config.ctm_property)
> +                               continue;
> +               }
> +
> +               if (!post_blend_color_pipeline && obj->type =3D=3D DRM_MO=
DE_OBJECT_CRTC) {
> +                       struct drm_crtc *crtc =3D obj_to_crtc(obj);
> +
> +                       if (prop =3D=3D crtc->color_pipeline_property)
> +                               continue;
> +               }

Hmmm. One issue with this is that it makes things like drm_info
harder: if drm_info opted into the client cap, it would no longer be
able to see any GAMMA_LUT/etc programmed by the prior userspace. So I
think allowing at least read-only access would be reasonable here.

Having a client cap without a driver cap also puts userspace in a
difficult position. If the driver doesn't support post-blend colorops,
then enabling the client cap strictly removes support without a
replacement. And without a driver cap, the client doesn't have a way
to know which is better.

Cheers,
Daniel

