Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35FA1C2BD09
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jun 2024 20:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qYPfqbEMN6sw16M9it9ilQpXO99tYg8BSEm27C5utMc=; b=pOdQ7gFyV8mZNSd2UkxeHdFkgI
	hSObkpzgvz+DaPIkv7WMz/rh5ag3dSnRA7eOjsoKaEJYT8rEiyipaX5W8b9eEgzhdT57ggIzJv4qW
	3YCfCRC8QNIuHl4pW1QjYHZiJHSHc643LTbR1hGTUMN0ZmRwxL/mz2LeI0lcHWW6rxKGcDS9i5+Uj
	loiDmRyPhc/uU/dqtUctY9yonLiI1z2MT/Jgh3zYqkrxPqRog2KfPEH9fL9Hl9SyKn+u+5pByRIk7
	+qQ2iwrujJAAdstWGYNYZtjMrgq9VInSuAHM9RfI+UN2AY+LL0rIlCODYGexV09JlOS7QS+K6EisK
	OFNMt2Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNIIN-0000000EsVc-0pyJ;
	Fri, 28 Jun 2024 20:34:11 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNIIJ-0000000EsU8-0U9O
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Jun 2024 20:34:09 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-6b4fdf56903so5168486d6.1
        for <linux-mediatek@lists.infradead.org>; Fri, 28 Jun 2024 13:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1719606846; x=1720211646; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qYPfqbEMN6sw16M9it9ilQpXO99tYg8BSEm27C5utMc=;
        b=X6QxbCBPhTbYm/GgI8TvksG8mNWAk2sFtn5k/Jpxd2zoD5SAJsTrrNgoYpwJoinTRP
         8/WQq6D/SBALepzDy03vUc7GfysoOVFPHEhQNWcH6aPVlgOMMqJCRUeaqQFYTeCD1fj1
         wYAbSxXnD9VTJwR2yCIk6bRzIsgeYfK5ZahZKwtwjXc/9WSJbESsudB1WWCog+DhjBnQ
         HB/Buf7+cE0C4i+7fVh4vMs+vpLRsgTzw/COWHgcDOI9jzc1rZIp1KOexrhmyqWFFW9H
         opHH2PEsMKE7r+hjcH+4Z8p0Im1nxAGMVO0jiFUR2FENlARJLk3xlvHFeoyx2qki7DdB
         WF6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719606846; x=1720211646;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qYPfqbEMN6sw16M9it9ilQpXO99tYg8BSEm27C5utMc=;
        b=DAB1sLXayCSIW2R/VHVut5S3Mo8C/ryq0Q8HCoDyKkSM9rMI4loDZB6/8UbZSzmQH6
         h/rkVowNDybLN4CvrZzXLXwd3Qtrac4mIOVC0z+4ylhVRTZZhVPkM3i0DKhg+Tz7G8Rn
         U5Bd1whck5xvn0/tF7Ub8ua6vDMSkLYnX5IQm/i9ZNg0SjfbmyXoQXx9ZXAsB/IRVU3x
         K0tIuoneCSybltS0TCTR9q6JYxOrs3xseoUgrCyTTETB+pGVry6Ns7ZOoNXtxIgwML5A
         BIRh9oNE3/jRt4vEbdlsfgvCzGPPQLc/RE3adUTsnsXqMEU4Ly8Mgo9vaOKI+zVK7X2V
         BrYw==
X-Forwarded-Encrypted: i=1; AJvYcCW2jYMj3vTA7lHXLefO2fsGBLzLv6KLS478MRCpFeBKkVEX5PerVwz8FeXMDpA/HabbluEQXq+uJAAYPOVPoP6dJeXYGCeLyESFUkklUmTmQQYi
X-Gm-Message-State: AOJu0YyNeAEANk1TdpPKE311UZfYsF8euWLTXR/hTTtNyqx+Eov6W5aB
	5Wv9fqMGMKR/z8BXB6n42cntLoi/TKpIArfsQcfIdBSH/kQ/InvzPopOhXurZbA=
X-Google-Smtp-Source: AGHT+IFFEvoaMcKgm5m3TuxTsgOgeGElh1NuxRFHPcJq6Y2G5kPP9VT4kQ/uAp+UHGZaUN6CP8rP/Q==
X-Received: by 2002:a05:6214:4c05:b0:6b5:9fa:3224 with SMTP id 6a1803df08f44-6b54099a199mr179430376d6.13.1719606845881;
        Fri, 28 Jun 2024 13:34:05 -0700 (PDT)
Received: from nicolas-tpx395.mtl.collabora.ca (mtl.collabora.ca. [66.171.169.34])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b59e36849csm10929706d6.4.2024.06.28.13.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 13:34:05 -0700 (PDT)
Message-ID: <32f2d748c6926f57be032c60cecfdc790ea2c1c0.camel@ndufresne.ca>
Subject: Re: [PATCH v5 2/9] scatterlist: Add a flag for the restricted memory
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Thierry Reding <thierry.reding@gmail.com>, "mripard@kernel.org"
	 <mripard@kernel.org>
Cc: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,  Jason-JH
 Lin =?UTF-8?Q?=28=E6=9E=97=E7=9D=BF=E7=A5=A5=29?=
 <Jason-JH.Lin@mediatek.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, 
 "quic_vjitta@quicinc.com" <quic_vjitta@quicinc.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "sumit.semwal@linaro.org"
 <sumit.semwal@linaro.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
 "jkardatzke@google.com" <jkardatzke@google.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "joakim.bech@linaro.org" <joakim.bech@linaro.org>, Youlin Pei
 =?UTF-8?Q?=28=E8=A3=B4=E5=8F=8B=E6=9E=97=29?= <youlin.pei@mediatek.com>,
 "logang@deltatee.com" <logang@deltatee.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Kuohong Wang =?UTF-8?Q?=28=E7=8E=8B=E5=9C=8B=E9=B4=BB=29?=
 <kuohong.wang@mediatek.com>, Jianjiao Zeng
 =?UTF-8?Q?=28=E6=9B=BE=E5=81=A5=E5=A7=A3=29?= <Jianjiao.Zeng@mediatek.com>,
 "contact@emersion.fr" <contact@emersion.fr>, 
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "willy@infradead.org" <willy@infradead.org>,  "pavel@ucw.cz"
 <pavel@ucw.cz>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, 
 "Brian.Starkey@arm.com" <Brian.Starkey@arm.com>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>,  "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "tjmercier@google.com"
 <tjmercier@google.com>,  "jstultz@google.com" <jstultz@google.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "robin.murphy@arm.com"
 <robin.murphy@arm.com>, Yong Wu =?UTF-8?Q?=28=E5=90=B4=E5=8B=87=29?=
 <Yong.Wu@mediatek.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "ppaalanen@gmail.com" <ppaalanen@gmail.com>
Date: Fri, 28 Jun 2024 16:34:03 -0400
In-Reply-To: <72dx7gqentafhwqnfjmosemm35vfl3blqrfiu5skm3cj33eqqu@vj7kmbllgehk>
References: <1050c44512374031d1349b5dced228d0efc3fbde.camel@mediatek.com>
	 <3104b765-5666-44e4-8788-f1b1b296fe17@amd.com>
	 <98c11bad7f40bcc79ed7a2039ddb3a46f99908f5.camel@mediatek.com>
	 <75dc1136-7751-4772-9fa7-dd9124684cd2@amd.com>
	 <ZnxWWtdShekGSUif@phenom.ffwll.local>
	 <ae73a0203d6acf2878c9e3ae2d7554816b9c66ad.camel@mediatek.com>
	 <5739abdb-0234-412a-9f25-49219411bbc6@amd.com>
	 <20240627-impetuous-aboriginal-cougar-cdcbbf@houat>
	 <w3xcvakoytubud6dw4wxr6ntbe6uvfrldihnd26vai6uyyto6j@vcq7gizxolag>
	 <20240628-hypnotic-kagu-of-hurricane-5fbc82@houat>
	 <72dx7gqentafhwqnfjmosemm35vfl3blqrfiu5skm3cj33eqqu@vj7kmbllgehk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_133407_191747_1759C05C 
X-CRM114-Status: GOOD (  71.71  )
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

Hi Thierry,

Le vendredi 28 juin 2024 =C3=A0 16:11 +0200, Thierry Reding a =C3=A9crit=C2=
=A0:
> On Fri, Jun 28, 2024 at 03:21:51PM GMT, mripard@kernel.org wrote:
> > On Fri, Jun 28, 2024 at 01:47:01PM GMT, Thierry Reding wrote:
> > > On Thu, Jun 27, 2024 at 04:40:02PM GMT, mripard@kernel.org wrote:
> > > > On Thu, Jun 27, 2024 at 08:57:40AM GMT, Christian K=C3=B6nig wrote:
> > > > > Am 27.06.24 um 05:21 schrieb Jason-JH Lin (=E6=9E=97=E7=9D=BF=E7=
=A5=A5):
> > > > > >=20
> > > > > > On Wed, 2024-06-26 at 19:56 +0200, Daniel Vetter wrote:
> > > > > > >   > External email : Please do not click links or open attach=
ments
> > > > > > until
> > > > > > > you have verified the sender or the content.
> > > > > > >  On Wed, Jun 26, 2024 at 12:49:02PM +0200, Christian K=C3=B6n=
ig wrote:
> > > > > > > > Am 26.06.24 um 10:05 schrieb Jason-JH Lin (=E6=9E=97=E7=9D=
=BF=E7=A5=A5):
> > > > > > > > > > > I think I have the same problem as the ECC_FLAG menti=
on in:
> > > > > > > > > > > > > > https://lore.kernel.org/linux-media/20240515-dm=
a-buf-ecc-heap-v1-0-54cbbd049511@kernel.org/
> > > > > > > > > > > > > I think it would be better to have the user confi=
gurable
> > > > > > > private
> > > > > > > > > > > information in dma-buf, so all the drivers who have t=
he same
> > > > > > > > > > > requirement can get their private information from dm=
a-buf
> > > > > > > directly
> > > > > > > > > > > and
> > > > > > > > > > > no need to change or add the interface.
> > > > > > > > > > > > > What's your opinion in this point?
> > > > > > > > > >  > Well of hand I don't see the need for that.
> > > > > > > > > > > What happens if you get a non-secure buffer imported =
in your
> > > > > > > secure
> > > > > > > > > > device?
> > > > > > > > > > > > We use the same mediatek-drm driver for secure and
> > > > > > non-secure
> > > > > > > buffer.
> > > > > > > > > If non-secure buffer imported to mediatek-drm driver, it'=
s go to
> > > > > > > the
> > > > > > > > > normal flow with normal hardware settings.
> > > > > > > > > > > > We use different configurations to make hardware ha=
ve
> > > > > > different
> > > > > > > > > permission to access the buffer it should access.
> > > > > > > > > > > > So if we can't get the information of "the buffer i=
s
> > > > > > allocated
> > > > > > > from
> > > > > > > > > restricted_mtk_cma" when importing the buffer into the dr=
iver, we
> > > > > > > won't
> > > > > > > > > be able to configure the hardware correctly.
> > > > > > > > > > Why can't you get this information from userspace?
> > > > > > > > Same reason amd and i915/xe also pass this around internall=
y in the
> > > > > > > kernel, it's just that for those gpus the render and kms node=
 are the
> > > > > > > same
> > > > > > > driver so this is easy.
> > > > > > >=20
> > > > >=20
> > > > > The reason I ask is that encryption here looks just like another =
parameter
> > > > > for the buffer, e.g. like format, stride, tilling etc..
> > > > >=20
> > > > > So instead of this during buffer import:
> > > > >=20
> > > > > mtk_gem->secure =3D (!strncmp(attach->dmabuf->exp_name, "restrict=
ed", 10));
> > > > > mtk_gem->dma_addr =3D sg_dma_address(sg->sgl);
> > > > > mtk_gem->size =3D attach->dmabuf->size;
> > > > > mtk_gem->sg =3D sg;
> > > > >=20
> > > > > You can trivially say during use hey this buffer is encrypted.
> > > > >=20
> > > > > At least that's my 10 mile high view, maybe I'm missing some exte=
nsive key
> > > > > exchange or something like that.
> > > >=20
> > > > That doesn't work in all cases, unfortunately.
> > > >=20
> > > > If you're doing secure video playback, the firmware is typically in
> > > > charge of the frame decryption/decoding, and you'd get dma-buf back=
 that
> > > > aren't accessible by the CPU (or at least, not at the execution lev=
el
> > > > Linux runs with).
> > >=20
> > > Can you clarify which firmware you're talking about? Is this secure
> > > firmware, or firmware running on the video decoding hardware?
> >=20
> > Secure firmware
>=20
> Ah... interesting. So you actually need to interop with that firmware in
> order to start decryption/decoding. That's quite different from how this
> works on Tegra. Well, maybe not entirely. For Tegra there is firmware
> that runs on the hardware decoder and which has access to the keys, so
> in that way I guess it's similar to your use-case, except the firmware
> runs on a different chip.

That is something interesting for the linux-media discussions too. So in on=
e
case, you have a seperate TF-A in the secure firmware following the CDM
specification, and it gives you back a restricted bitstream buffer. You the=
n
don't need any CDM specific session/key information into the CODEC driver.

But in the case of Tegra, it would mean the CODEC driver is not agnostic to=
 the
CDM, so we can expect (if this endup as a V4L2 driver) some controls for
Widewine, Playready and other CDM ? (adding explicit CDM API in the kernel =
is a
hot potato imho, I myself would try and stay away from that at all cost, an=
d
focus on restricted storage feature only).

Nicolas


> > > > So nobody can map that buffer, and the firmware driver is the one w=
ho
> > > > knows that this buffer cannot be accessed by anyone. Putting this o=
n the
> > > > userspace to know would be pretty weird, and wouldn't solve the cas=
e
> > > > where the kernel would try to map it.
> > >=20
> > > Doesn't userspace need to know from the start whether it's trying to =
do
> > > secure playback or not?
> >=20
> > It does, but it won't know the capabilities of the buffer it gets back
> > from the secure firmware.
>=20
> I think that's kind of the point. Does it really have to know the
> capabilities? Isn't it enough to know that it's got some sort of
> protected buffer back and then use it more or less blindly? I mean
> these are things that have to be tightly coupled no matter what, so
> how much point is there in trying to validate what you get?
>=20
> > > Typically this involves more than just the decoding part. You'd
> > > typically set up things like HDCP as part of the process, so userspac=
e
> > > probably already does know that the buffers being passed around are
> > > protected.
> > >=20
> > > Also, the kernel shouldn't really be mapping these buffers unless
> > > explicitly told to. In most cases you also wouldn't want the kernel t=
o
> > > map these kinds of buffers, right? Are there any specific cases where
> > > you expect the kernel to need to map these?
> > >=20
> > > I've been looking at this on the Tegra side recently and the way it
> > > works on these chips is that you basically get an opaque carveout reg=
ion
> > > that has been locked down by secure firmware or early bootloaders, so
> > > only certain hardware blocks can access it. We can allocate from that
> > > carveout and then pass the buffers around.
> >=20
> > So you allocate both the input and output buffers (and from different
> > regions) from the application, and pass both to the secure firmware?
> >=20
> > Yeah, I guess that would work then.
>=20
> It doesn't really matter who allocates the buffers. It could be the
> application allocating the scanout buffer from a DRM/KMS device and the
> input buffer from the multimedia decoder. Or it could be the application
> allocating both buffers from different DMA-BUF heaps. In the end it
> shouldn't really matter where they are coming from. It's effectively up
> to the application to pass the right buffers into the right IOCTLs.
>=20
> > > It may be possible to use these protected carveout regions exclusivel=
y
> > > from the DRM/KMS driver and share them with multimedia engines via DM=
A-
> > > BUF, but I've also been looking into perhaps using DMA-BUF heaps to
> > > expose the carveout, which would make this a bit more flexible and al=
low
> > > either userspace to allocate the buffers or have multiple kernel driv=
ers
> > > share the carveout via the DMA-BUF heap. Though the latter would requ=
ire
> > > that there be in-kernel APIs for heaps, so not too sure about that ye=
t.
> >=20
> > What would be the advantage of using a heap compared to having all thes=
e
> > devices in DT use the reserved-memory property and point to that
> > carveout? It should already work today.
>=20
> You can't just have all of these point to a common reserved-memory node
> because there can be multiple concurrent users. You could have multiple
> protected streams running at the same time. DMA-BUF heaps allows us to
> expose a central provider for the protected memory so that allocations
> can be properly arbitrated.
>=20
> Thierry


