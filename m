Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B28AECCA468
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Sep 2025 12:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JfRlA2NUhU1kG602IPax22A5h+dNSAH5OIBQUrcaHKQ=; b=Y8x7YPy8zpUJPxu77OR6NOLTni
	IoWNsiF1M7yhHbNhM22gbUvx6JiXPIlmMaFXW5PudvjN6xu/wsig9pIzFa2ss27JMuLp0R0mVDXCG
	l/HBHVH4QCoBh62tj+icih09BTeHG3Lq1gU6R8JJfhC4vjSHurPBXXimZq9yq0bJgNwgo0xQFvQGo
	Kq3yXqKEgEnm0qHTF/z5mad75YE4sd4mBmVMiz/cpHmdcLQ06n4qV4V54j7IG2uY2SbxMy1NegqbR
	3kqnFWdbj/rt7JKCDiRhrQcnoFPXcL9zdiKUpKWCahCxKYCf9Jpz5uu19l8cGxqXudzeAu2Synp7u
	r3s63+2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3ZLE-00000005F3p-1kez;
	Tue, 30 Sep 2025 12:20:24 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3ZLC-00000005F32-0gDO
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Sep 2025 12:20:23 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-85b94fe19e2so569829885a.3
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Sep 2025 05:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1759234820; x=1759839620; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JfRlA2NUhU1kG602IPax22A5h+dNSAH5OIBQUrcaHKQ=;
        b=b6zqCVnWAB5eVEH3cNEJjAWQueIHsDszHGqxVmubeJblwzSZRvEBqJEAO+x4jeuxb+
         LltjBJG0QN1bedAqESuqldaKoMZKxcHguwhACjsP42uZLb9GmgbfWlrNRSiYH3WASSNi
         59CafPiZCbpHUSrxo2r/7XjwDp3A8aF8zdnu0/r9JyRPn/ZwSSJMMlBYCeHDdJ+NIyFu
         DI0LFYGr1ti8YGLj25txNQ4PYBCRW0KZJmsWmm32CL55MQHUAqaXhYB0IQMIyZxDlwXO
         2yJAgZ68k/q9BJfUnR0y08WwOeFei4RELovIyum/AR8PssKh9itcUK5tz+nML+z1nYA7
         LpMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759234820; x=1759839620;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JfRlA2NUhU1kG602IPax22A5h+dNSAH5OIBQUrcaHKQ=;
        b=FRUZ9i/uDUyMH6sTq5LhzbM1slZyWYQCPR/YkDyw0KthAkABJUnykUQxGfRRsz24JB
         FAq+FF0ACE5VYgzMsWJ/1/VIITep6htJO48vseo9xPX1YoKYZO32ZU6x9E5FhygFulZV
         BWs4D9qY3obxjVeqz5hkRiNKn/SiRV+F+S28XZIEzwEsOCCBRYC7qtbBXWFvs3FehTz4
         sUhf0/lxM+hmgIJ50Mw+AGERgTdhYV0UYNdlPb/qdfi8Zk4eeDg/rpKaiZdt6YrsYmvV
         m287Rpc1Vpy0Ztyc4cdg61BxQ4CulkwCcS7f72wYopdu07LqawLF5BdOXyczIBc8wMoO
         do9w==
X-Forwarded-Encrypted: i=1; AJvYcCVZoTzqoZPPYvDQ4vuuAfooE1Ki0pLc0WTp2bmadcYbzCYzDoYjrWQQuKNcjDN3/aD5kZh8b9qLtTcJPmnrQA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzycQK2vokG1hIipAqtqFQn4gkCN81bT6ub/mxHFWdaRjY1i692
	sTkk4ig6Fc/5lEsHRQagTooD9/L3Q9WQwjyqAShWbExMju4zrnjwgiqCn2ujXMxuA5iM4iOAEeN
	ybAzCqLOvoTPgyvwwJnhirc5Dj9jS9ra2umtG96RzMw==
X-Gm-Gg: ASbGncuc0nrD0x+iosHEvI8wkoMVLsZqy739N+xZXwUPH50wMcJYNtoedd8pEYgcoNQ
	/97VL/cQVKhqafMKoV1ILeYHbbo3kPVzoes/s8GW47Qt2wgnPJAsGk+Isgfa+OIsHqf5/b+yuo3
	oxOHRhEUAboPpx0EUaNRy9u9uCCV9i+Uz2gCkCB4mAYWB0/SRvTvbOkEja+uwPjjMWKHb4I/0Qv
	3dNVrJH8Fma/J7fE/Qd3hKLdE5XE2k2XPKstGNO
X-Google-Smtp-Source: AGHT+IGNbjw6RNqsJAvb7qKyVX9JU+8Q52yRLDkjXoWDZvMcGT/3qrwgZCNcyKpRwrI6Z9Mglf9tBhqM86fyt3kXMf8=
X-Received: by 2002:ad4:594c:0:b0:794:5578:6a with SMTP id 6a1803df08f44-7fc29999880mr292314156d6.10.1759234820411;
 Tue, 30 Sep 2025 05:20:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250822-mtk-post-blend-color-pipeline-v1-0-a9446d4aca82@collabora.com>
 <20250822-mtk-post-blend-color-pipeline-v1-1-a9446d4aca82@collabora.com>
 <CAPj87rPAoD2D99zTdsvJ=9K8+G17mTS2jDYHMPYmXNtUyp2L_Q@mail.gmail.com>
 <CAFZQkGwotQ6cxVCSgp-BhUi5DaZ7MyVvbnrDJW11Z7ztzqy58g@mail.gmail.com>
 <CAPj87rMTOD3_tC70QX4xz3G4zdG=tmwt5VgPhq6jNyf8bbW49Q@mail.gmail.com>
 <269ca85a59f613568543f45867fba7e604cc9f11.camel@collabora.com>
 <CAPj87rMhsFy+uzKmNecrQG4e+BEoeX1FyEobO7bnHdQqhy1_2Q@mail.gmail.com> <2a985767-0fe1-40fc-b45e-921bbf201e07@app.fastmail.com>
In-Reply-To: <2a985767-0fe1-40fc-b45e-921bbf201e07@app.fastmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 30 Sep 2025 14:20:09 +0200
X-Gm-Features: AS18NWC_qgpU_0cN4JQ19aLDGw_PL71UmwKNqFB1ss4l60CpIYnHrco3rK8zc9M
Message-ID: <CAPj87rMHP_np_9vtnyJ_NU4S3W09DoMRrLPps-33hTngdLyKCw@mail.gmail.com>
Subject: Re: [PATCH RFC 1/5] drm: Support post-blend color pipeline API
To: Sebastian Wick <sebastian@sebastianwick.net>
Cc: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Xaver Hugl <xaver.hugl@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Alex Hung <alex.hung@amd.com>, 
	wayland-devel@lists.freedesktop.org, harry.wentland@amd.com, leo.liu@amd.com, 
	ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com, mwen@igalia.com, 
	jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com, 
	agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org, 
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
X-CRM114-CacheID: sfid-20250930_052022_362613_17B53BDE 
X-CRM114-Status: GOOD (  20.81  )
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

On Fri, 26 Sept 2025 at 15:45, Sebastian Wick
<sebastian@sebastianwick.net> wrote:
> So I'm going to argue that making the properties read-only or read-write =
is useless.
>
> The only case where knowing the color pipeline of the previous user would=
 be useful is if you want to re-use the framebuffer of said user. Otherwise=
, the color pipeline and the generated framebuffer have to somehow just mat=
ch to produce the desired output and that does not require any previous sta=
te, making the legacy properties useless.

I don't think it's useless; if nothing else, drm_info is a thing and
having it work is nice.

> If we genuinely believe that this is something to be supported, then my q=
uestion is why the new color pipeline should not be able to accurate reflec=
t the state of the previous user, even if they used the legacy props?

That's reasonable. My hunch was that it would be too much code in the
kernel to essentially just do format reinterpretation on userspace's
behalf.

> The hardware was able to get into some state based on the legacy props, s=
o it will be able to get into the same state with the color pipeline props;=
 it's "just" a matter of exposing the right pipeline.
>
> If we are not able to accurate reflect the previous state with the pipeli=
ne props, then use space will see inconsistent state between the legacy and=
 color pipeline props. Which state is the right one? We cannot know. The pr=
evious user could have used either one. So having the legacy props does not=
 help because we don't know if we should use them or the pipeline state.
>
> So, I would argue that we should *remove* the legacy props if DRM_CLIENT_=
CAP_POST_BLEND_COLOR_PIPELINE is set. If the handover is relevant for a dri=
ver, they should ensure the legacy props state translates to the correct co=
lor pipeline state.

FWIW, the usecase I can see in mind would be doing a fade-style
transition between the old and new clients. But I don't really care
too strongly about it to be honest; I mostly care about having
drm_info work because it's a super-useful tool.

Cheers,
Daniel

