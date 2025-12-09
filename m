Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDEC9D3B7F3
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Dec 2025 20:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ks4rfgwcPnh21bBJ5QetQ/t2Y7bRA0w+3d0dKO5oFWI=; b=jZ2ZfMTyBofNIemgbaMtqMEb1H
	92IbLuP9wCtKkzUZISqz+KZgg66ZQuXYE0ai1RkN+PjyDhaFSk27lqo8gX4HQwfYsZ2AkFUiiy3H4
	4cqAEl5AXHmNmak2QaemgSspyfd5zwFY9cgN808uExxybE00NdiFT0Z+72pt9Sf9kYjckiJrttvsI
	wjVZMqgDhaP2QTz1vGlHJk11KTBVHaM8ubkp61AEq31ZiU5sZYxJ+EHnZ0MC8vlVeNpxfl3AMDvcw
	0xTkr+fJt7SArapIXyveklRBki6VFSfOzUEuiSVenUwwgd4KrXU1euHueCA8lCDbo9/yKX5zqbH2V
	7rOBuhRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT4m9-0000000Ems8-3Y7q;
	Tue, 09 Dec 2025 20:57:37 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT4m7-0000000EmrR-1zJP
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Dec 2025 20:57:36 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-8b28f983333so666070485a.3
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Dec 2025 12:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1765313854; x=1765918654; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ks4rfgwcPnh21bBJ5QetQ/t2Y7bRA0w+3d0dKO5oFWI=;
        b=dGSs5kmbuVq4519dbM6MUzRgBPN7nGV9/5MAabYuLsFhMIvECW96e0sUaCYmJGZinK
         iYgZsvCwPV36H5Om0hWMRbCzaI6cRV9/vTKk8wdvnrX8pd0MXAm+eX+dMeSEyR4u3Iet
         XtYLZuHkORxGeKtPlCd+AjKWpDA5w7rhiyzJIwjrBXNn/Ty/xCMglSvDjfDmAIlXIGvW
         Xi4AAxUgs+MZz4Pf85fXAr0/hd7onCVsPbYgjm3+9sOEc6ujWRZJ0MQ/acN9Vjd1CNdu
         N3fQpiztWDtGnluEcgr/qqR3Ot1s5fSYE2uW5VLvjSuBKIsF7mwwtElEgbrbVvBYfU2I
         BDNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765313854; x=1765918654;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ks4rfgwcPnh21bBJ5QetQ/t2Y7bRA0w+3d0dKO5oFWI=;
        b=IbJc/oFtBHrQS30a8wVbP8pBZcSEnZ1uKR3Aht9RLDEX05nledHOSrMFp013c0RxUq
         nikVddAifji2fsVsZr2WOFicLD4rqmheqH45n/0FjPXi77y45TDc3Kqa7KXM9FkdTPrS
         c7nnxmt6i4oXWJrM3eDDjI4of3W/0VBi8K1RNd0Yg5S1/KEdvsc0MF1ocTuXZNIw+1hs
         uirJQ1RnHcFRX94rigbwJQaKlbKCtdOLTMt+Ym8rmq7Pfs3+PBQkPXVFvyorB9sekxe1
         IXHrAGfmNoO6DVBL8VzTJQ0O9Weqn6gIeZDi0xRLxM7X+OLekS0Wbnd0XrMGWK6q37gN
         deWA==
X-Forwarded-Encrypted: i=1; AJvYcCWAlMiTsv2fStWC2lZeSMlf9FKIaHZ1meOOJZdN7JSs7ufTJUL4q2Swa1vJKY4F2jqKdtRaxxq+8Kl2uahFow==@lists.infradead.org
X-Gm-Message-State: AOJu0YwnKp4giuW2hDNfPwd8BHA6FOgCzdbutmr16LvKGe99ju1hvnqO
	wS6KnbVB02mgpXOK3jbdNn+A9HzlRpiH0xkRqGi/cZCEteFCuEUhncmJR/aHIqFwjVk=
X-Gm-Gg: ASbGncume5BqrqAmTz9/i75yOPtVBtRTdZagP9VTjHotmqQmudYHhhxpRKqjrikP3dm
	SNg+8ASeZFI9Lts5QpDCIefaWQKL2OpIETe6kiusW+AwHsBaBj5KT1bZQdIV8/Erz7gbQdKd6rR
	+Gj8WG+wJReZBqBsrauM/JEHnskJ4U1v91TQFbFaIfAS/xeSYbmfvtg3Sf4AUUlKQ/nTQt+kHXp
	tR1B/CsAK+Rb9VjRJ7bczoE5Y8xPOyUjF1+C5BFU2liqXcnfKrFQwS0yqFpxezeD8GvBwYKLLI8
	C3jIr87oJSzKbkQrVZZ+p+toglfkGlBy7sOMf8kYjU0Bv/hPWCQLJNLwd/hZ1cRdhWRulaN3aGk
	oBeQzIGiXs/UOqY5okTXzLvVYEei2tF0wYBMVHaY2XHcXDydmxphd5Z8NcAenuir164w6nNF/Li
	Vv9rGbeiS08oKPJSy/IFFaFMaCz0M=
X-Google-Smtp-Source: AGHT+IEXuP3gduHDjZ+BJ+UcY5fM7ciYm9iPLAaAwZ5toDAd6Y+XsgFLolUEdBbI7QgsGC3wyhqL+A==
X-Received: by 2002:ac8:7d48:0:b0:4e8:a850:e7db with SMTP id d75a77b69052e-4f1b1acb520mr453381cf.71.1765313854144;
        Tue, 09 Dec 2025 12:57:34 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f02cdaf4e6sm100873991cf.3.2025.12.09.12.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 12:57:33 -0800 (PST)
Message-ID: <7e24110636db36e8c0a877d90d2ed9570c4aecf5.camel@ndufresne.ca>
Subject: Re: [PATCH] media: platform: mtk-mdp3: add WQ_PERCPU to
 alloc_workqueue users
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Marco Crivellari <marco.crivellari@suse.com>, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
 Frederic Weisbecker	 <frederic@kernel.org>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>,  Michal Hocko <mhocko@suse.com>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Matthias Brugger	 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno	 <angelogioacchino.delregno@collabora.com>
Date: Tue, 09 Dec 2025 15:57:32 -0500
In-Reply-To: <20251107141303.223254-1-marco.crivellari@suse.com>
References: <20251107141303.223254-1-marco.crivellari@suse.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-UeS4cSZwWRtHwAn48Sle"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_125735_544984_D9BBDE2C 
X-CRM114-Status: GOOD (  22.63  )
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


--=-UeS4cSZwWRtHwAn48Sle
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le vendredi 07 novembre 2025 =C3=A0 15:13 +0100, Marco Crivellari a =C3=A9c=
rit=C2=A0:
> Currently if a user enqueues a work item using schedule_delayed_work() th=
e
> used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
> WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
> schedule_work() that is using system_wq and queue_work(), that makes use
> again of WORK_CPU_UNBOUND.
> This lack of consistency cannot be addressed without refactoring the API.
>=20
> alloc_workqueue() treats all queues as per-CPU by default, while unbound
> workqueues must opt-in via WQ_UNBOUND.
>=20
> This default is suboptimal: most workloads benefit from unbound queues,
> allowing the scheduler to place worker threads where they=E2=80=99re need=
ed and
> reducing noise when CPUs are isolated.
>=20
> This continues the effort to refactor workqueue APIs, which began with
> the introduction of new workqueues and a new alloc_workqueue flag in:
>=20
> commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
> commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")
>=20
> This change adds a new WQ_PERCPU flag to explicitly request
> alloc_workqueue() to be per-cpu when WQ_UNBOUND has not been specified.
>=20
> With the introduction of the WQ_PERCPU flag (equivalent to !WQ_UNBOUND),
> any alloc_workqueue() caller that doesn=E2=80=99t explicitly specify WQ_U=
NBOUND
> must now use WQ_PERCPU.
>=20
> Once migration is complete, WQ_UNBOUND can be removed and unbound will
> become the implicit default.

I have to admit, there is likely no review here due to the lack of knowledg=
e, so
in order to help educate myself (hopefully its not just me), can you explai=
n why
the new default of WQ_UNBOUND would not be a fit for this driver ? After al=
l,
the author didn't care and didn't make a choice, so I feel like its worth
asking.

cheers,
Nicolas

>=20
> Suggested-by: Tejun Heo <tj@kernel.org>
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
> ---
> =C2=A0drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c | 6 ++++--
> =C2=A01 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
> b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
> index 6559d72d5d42..9083367ae2e4 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
> @@ -255,14 +255,16 @@ static int mdp_probe(struct platform_device *pdev)
> =C2=A0		goto err_free_mutex;
> =C2=A0	}
> =C2=A0
> -	mdp->job_wq =3D alloc_workqueue(MDP_MODULE_NAME, WQ_FREEZABLE, 0);
> +	mdp->job_wq =3D alloc_workqueue(MDP_MODULE_NAME,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WQ_FREEZABLE | WQ_PERCPU, 0);
> =C2=A0	if (!mdp->job_wq) {
> =C2=A0		dev_err(dev, "Unable to create job workqueue\n");
> =C2=A0		ret =3D -ENOMEM;
> =C2=A0		goto err_deinit_comp;
> =C2=A0	}
> =C2=A0
> -	mdp->clock_wq =3D alloc_workqueue(MDP_MODULE_NAME "-clock",
> WQ_FREEZABLE,
> +	mdp->clock_wq =3D alloc_workqueue(MDP_MODULE_NAME "-clock",
> +					WQ_FREEZABLE | WQ_PERCPU,
> =C2=A0					0);
> =C2=A0	if (!mdp->clock_wq) {
> =C2=A0		dev_err(dev, "Unable to create clock workqueue\n");

--=-UeS4cSZwWRtHwAn48Sle
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaTiNPAAKCRDZQZRRKWBy
9FiwAP0fJ+8iO5Ik0RjPFylUjAq7S8bsNJJcC+1KzXvIKpRkNQEA3unsVtcMYzBe
Tyv8O0zclWEEPN7vZaUVvfJOXbdoVwU=
=UyuZ
-----END PGP SIGNATURE-----

--=-UeS4cSZwWRtHwAn48Sle--

