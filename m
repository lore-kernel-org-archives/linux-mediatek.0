Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44190CA0FE9
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Aug 2025 12:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4hO3ALaftqFmH4oH4pH+kk6zISTsy/rbnhx2jQsr7Dw=; b=lIYm4UAIs5etGuopAWrR2QuCeN
	zKSzfLiiBGuPljr6kykrQNjUMFf6EDuw9gVpb7AolTlcgLvJ8fczmXfdgSOHTxT3ICHx9KpfEzjMZ
	LxRBh1lEPfsa3EeoUrRe1BFXZT00BIY0VlSv4iuq4RWapiKnRMNzmuOyQyAlONH1ZbYF4ruyBGefc
	NhbT85ldaj5ZAiNes6ssGknmoNYiSCI047FKSDByBT+TMaos3bOWFKIF5vn4wUsdCZLqEoWS89CrG
	Ig2ycF0bWNoRB+CuRFVAUXTk2HjNx6rYGldP2tD7RCAnBs9kYCZq8hw9eOefBfjHdKy+efvBGHSL7
	Q1mFb7ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqsxY-0000000By1W-461a;
	Tue, 26 Aug 2025 12:39:32 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqsjo-0000000Bw7I-0GD3
	for linux-mediatek@lists.infradead.org;
	Tue, 26 Aug 2025 12:25:21 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-7e87035a7c3so805771485a.0
        for <linux-mediatek@lists.infradead.org>; Tue, 26 Aug 2025 05:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1756211119; x=1756815919; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4hO3ALaftqFmH4oH4pH+kk6zISTsy/rbnhx2jQsr7Dw=;
        b=m33RLtAX9XvrngUtCLqGPe7ie78sDGCcAlbU2crsHyUb0gUnr2DABI2MVjlvTKVzz5
         Yze4d9bcrHDujxHKiqiItrbuXXfw4A6C/kWfZUY1oiOcyXuIBxB1Qo8BvV77wiPu82HM
         0N7Ffh/eaJD+hkUmjuji1kkc6vRKQucvGlHq2HJm75G2wN6lTholW6ohOxUVUNZ4n1ZD
         znNEI3KUz2kxw6hhTaGIQx64vDbRFzEkmuEr1Q3Z4FF3cS0yVyS6H61Zd4xfFPrnqpId
         GLn0AWyTgRVeWRkXKpkxgVKFCE40QL1GteYl6WV43BLkvZHQlc6heNmowIDOhgxNCT/W
         O+bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756211119; x=1756815919;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4hO3ALaftqFmH4oH4pH+kk6zISTsy/rbnhx2jQsr7Dw=;
        b=KZlRHaOriqCdISGxQXmNZjactmSknFaWfhVs+05RYA2q3k8Tbe/HS01dqx1iG2czOo
         KfkA3CuihhiozQDOWj7i9QJCUOfRJQE6ReOoyZWRk43NyXEtQoIAPlO2cgqMbe3sMEn/
         CtIBBTbOICbJmVPvV7Nhr9IUlAGvPDDEVCscS6tyxb2mFuEb0UxTaLdYAjnSEK/uTTNj
         EbOn5FCaJInZPGRH8BDlhpGqCbgJTVlO936I0sAvuy+DKu3kVQYaocJyo7ptzzXBWhVH
         Ha5EEZobLjbpgvO2XS7CJHSvPQGm2ZPFAcBytfspNrygSrTfD0IQTE83CGOTmz0bvk0f
         0Chw==
X-Forwarded-Encrypted: i=1; AJvYcCXyP2JOC4r56Wl6vHBWYMCBdL/gZ6kTHefoWl0ktiDBw1lhAWtSpG3NAHtroehdGF7UuCc4+95k9nWrYGcW9g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzV95evagPO/q7B8++GE7uax4lpR9hcb2ljah+WZYas1iTLP+ma
	d9vpTxqYq1Qd+ovGoCURNqGcp1cOx2BeSsKqqROqogcpbMWANKsFixH9TABLeRU0TXFpwzernbC
	MhN6cm7oK++mAwPyXKS2mEitnKMPsZN0eHBAZ6zkULw==
X-Gm-Gg: ASbGncuEOAmLtR7B0NfQtSS+qSVIt29eg7zAUOBJv/oVIjbLwCEi0pt0fwBu9/gatJr
	xy5rAlZlA/JDIx7wpZAhjZRuRQBKXmhTunTy811yoODq0SKpA2QbyKEeAMufdvX+UzabCcSpSdC
	CY6cYU8BOIkZTSkRLcI9KOF7KpbOXSvvOLvMqc6eKYudZZOWYDYzhhYMLrVOGM03usfKDMSVpW7
	qjG/Umk/LJ6EQap
X-Google-Smtp-Source: AGHT+IFgi8Q9hHqPvEtovjl/Iou25u0OhOejPE9XEDWvvY8QwIuVfSOpzRV+vwb4VBRl5Im89zG6tFcD4jX2gBQishU=
X-Received: by 2002:a05:620a:4149:b0:7e8:6a84:e82e with SMTP id
 af79cd13be357-7ea10fdbed6mr1861144585a.32.1756211118444; Tue, 26 Aug 2025
 05:25:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250822-mtk-post-blend-color-pipeline-v1-0-a9446d4aca82@collabora.com>
 <20250822-mtk-post-blend-color-pipeline-v1-1-a9446d4aca82@collabora.com>
 <CAPj87rPAoD2D99zTdsvJ=9K8+G17mTS2jDYHMPYmXNtUyp2L_Q@mail.gmail.com> <CAFZQkGwotQ6cxVCSgp-BhUi5DaZ7MyVvbnrDJW11Z7ztzqy58g@mail.gmail.com>
In-Reply-To: <CAFZQkGwotQ6cxVCSgp-BhUi5DaZ7MyVvbnrDJW11Z7ztzqy58g@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 26 Aug 2025 13:25:05 +0100
X-Gm-Features: Ac12FXxHW5zk0HB8cp7qpDLRzhJSLilNkY6mrjMA15E-TnryutF26kuEp3eSmiI
Message-ID: <CAPj87rMTOD3_tC70QX4xz3G4zdG=tmwt5VgPhq6jNyf8bbW49Q@mail.gmail.com>
Subject: Re: [PATCH RFC 1/5] drm: Support post-blend color pipeline API
To: Xaver Hugl <xaver.hugl@gmail.com>
Cc: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Alex Hung <alex.hung@amd.com>, 
	wayland-devel@lists.freedesktop.org, harry.wentland@amd.com, leo.liu@amd.com, 
	ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com, 
	contact@emersion.fr, mwen@igalia.com, jadahl@redhat.com, 
	sebastian.wick@redhat.com, shashank.sharma@amd.com, agoins@nvidia.com, 
	joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org, 
	victoria@system76.com, uma.shankar@intel.com, quic_naseer@quicinc.com, 
	quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com, marcan@marcan.st, 
	Liviu.Dudau@arm.com, sashamcintosh@google.com, 
	chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com, mcanal@igalia.com, 
	kernel@collabora.com, daniels@collabora.com, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Simona Vetter <simona.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_052520_285538_BFE9BCEE 
X-CRM114-Status: GOOD (  19.13  )
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

On Mon, 25 Aug 2025 at 19:45, Xaver Hugl <xaver.hugl@gmail.com> wrote:
> > > @@ -416,6 +417,24 @@ int drm_mode_object_get_properties(struct drm_mode_object *obj, bool atomic,
> > > +               if (post_blend_color_pipeline && obj->type == DRM_MODE_OBJECT_CRTC) {
> > > +                       struct drm_crtc *crtc = obj_to_crtc(obj);
> > > +                       struct drm_mode_config mode_config = crtc->dev->mode_config;
> > > +
> > > +                       if (prop == mode_config.gamma_lut_property ||
> > > +                           prop == mode_config.degamma_lut_property ||
> > > +                           prop == mode_config.gamma_lut_size_property ||
> > > +                           prop == mode_config.ctm_property)
> > > +                               continue;
> > > +               }
> > > +
> > > +               if (!post_blend_color_pipeline && obj->type == DRM_MODE_OBJECT_CRTC) {
> > > +                       struct drm_crtc *crtc = obj_to_crtc(obj);
> > > +
> > > +                       if (prop == crtc->color_pipeline_property)
> > > +                               continue;
> > > +               }
> >
> > Hmmm. One issue with this is that it makes things like drm_info
> > harder: if drm_info opted into the client cap, it would no longer be
> > able to see any GAMMA_LUT/etc programmed by the prior userspace. So I
> > think allowing at least read-only access would be reasonable here.
>
> FWIW the cap for per-plane pipelines also hides COLOR_RANGE and
> COLOR_ENCODING properties from the client.
>
> From a compositor POV, I slightly prefer hiding the properties
> entirely, but ignoring them on the compositor side when a color
> pipeline is available would also be trivial.

It makes it impossible to do smooth transitions from legacy clients,
as the old (current) properties can't be read back.

I assume the atomic state would also carry the old values (even if the
drivers are specified to have to ignore them), so there would be an
odd transition:
* pre-colorop userspace sets GAMMA_LUT to invert brightness
* colorop userspace takes over, does not set any colorops on the CRTC,
brightness is no longer inverted (presumably? depends on what the
default set of colorops is? and what the drivers do?), but the atomic
state still carries the old gamma_lut blob
* pre-colorop userspace takes over, does not touch GAMMA_LUT,
brightness is inverted as the colorop from the previous atomic state
is ignored and the pre-atomic one now takes precedence

This isn't necessarily wrong per se, but does seem kind of janky and
error-prone: like should the old state be reset to zero/bypass for
commits from colorop-aware clients? Or should we explicitly allow 0
but no other value?

Cheers,
Daniel

