Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD4AC3065A
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jun 2024 20:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=meF+jxyCw4OoAYyu1gwMI5pGdbLesBvTuciMbHzTey8=; b=ciDU/WFEH3c2W4i6rGLLkO/StU
	G4YnVoJIfnfUzMGAQVNHcbgwXIZPPdfpUVYrmtPGI2UNmVphHRQh3TVzs+WyZRM0XLb+L9DvM1Vv6
	MWMkJeXf6xJD/EJLmoquQoEcfMybiRhAbvH45KwjM/qPEXivGrcClZa/Mb+V9wKTANURpU8TZRlN6
	f8MKkc3Z5midTXMFdbQ0nL2gPDB9O4sHFhaQ5btqFjmOfWsxmceS+HyykUFZD9oaQyXk1xmbQz0+g
	LLnsO9RA39muytmpnEOu4wLfRrysXAFZIUXLa0pcb2gO01eQ6IpvAsa327h7jCdj0jpQnCWtuHPXK
	ayo6r76g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNI83-0000000ErP5-2mrw;
	Fri, 28 Jun 2024 20:23:31 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNI80-0000000ErO5-43Xk
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Jun 2024 20:23:30 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-6b4febddfd3so5507816d6.1
        for <linux-mediatek@lists.infradead.org>; Fri, 28 Jun 2024 13:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1719606207; x=1720211007; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=meF+jxyCw4OoAYyu1gwMI5pGdbLesBvTuciMbHzTey8=;
        b=aK3Di7Gh2lp/04OFeaOOpDWlQAzbODk2ThNsu+tPE95mRNrZSyOMUfH8J3vdZifiUz
         70Zb9fsfLtV/HYf34esnRPipHK3bu3V206wU2CeqYUGZWKw/AV+/TRxMFQKS3FEZM6NZ
         dPXGF69c6hlkGR0f3qgLTX+Lf3axDpbLfR8eP1lSfgojQMlsoPm5b1Daq+Dof1ukvpSY
         HC340C+T9ALJb7gcArIVqf6kdAgT8sUFVKUL95irdcP8lWS9IZI2w6tM9KSKrH/oOcI5
         qqCvOlfFCMhgKxGO7VmKWjOk54k4rfDeJznVQLxrunZgKoYEd05tiGQS3o7afYaGikEw
         pDbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719606207; x=1720211007;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=meF+jxyCw4OoAYyu1gwMI5pGdbLesBvTuciMbHzTey8=;
        b=GM4yB619JZ8LIiBJVibbCjkDrIXlTU6HGaEuE1WFzclXziOorTO/NeaGFOEbnsBpzU
         8dFmCythGlDmQlihXXogeRU0VLSR5MzJ5QaPXj+szRZOsJP+m2v+kUkL7dFg72xFRk08
         qMY+T5UVFRE5QqXpUU3B4+1xPE+kNiRcM/cX7/bRWOp3M9onAsCy8Rt0H4tuqgMNzCS8
         9IswPKX4CKnUmy7hCWOUKxM/yhaxqVhzczVxsz8F0vYdp3uiemb7iBFEVRxV/Q+CeQtD
         AE/vJ3+QQJHWny4RUFH7vWON4yJK1aeyAVfB4y/mrvz99BI5toxEVr0ARBRrdTYjFgQu
         TL3w==
X-Forwarded-Encrypted: i=1; AJvYcCXyWJ9h16wnjvTNRrAJSc2SLPzHknmcw78fZBxDG7wXlpJOtZfjLrYFcEOD2gQKh7SnIimZ0+FyScgcarvs25DADkUM+gZMFSLBHtrOwRL3fh7r
X-Gm-Message-State: AOJu0YzAEAYst9imN3kf6OeEG91D9laeYdddfz1TOnvCraSXq2ww7hua
	u44sZIh9fD7GChlMTacMYnMSxfulj8hNj4ukwPv5UUAlYLdeZgrdKES+leUuscs=
X-Google-Smtp-Source: AGHT+IHtfw7Xq3Cf0WFYd9L6i5fVpDUyYC/Xic5L6R5XMrTyAZAROOc6sOeuO8nND/pHTXuCm/Q3Pg==
X-Received: by 2002:a05:6214:27e9:b0:6b5:98aa:8b1b with SMTP id 6a1803df08f44-6b598aa8c3amr67210986d6.50.1719606207610;
        Fri, 28 Jun 2024 13:23:27 -0700 (PDT)
Received: from nicolas-tpx395.mtl.collabora.ca (mtl.collabora.ca. [66.171.169.34])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b59e6146bcsm10736956d6.120.2024.06.28.13.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 13:23:27 -0700 (PDT)
Message-ID: <ee405147d5e9826f1b2ad7d7c3bdb2fb745de420.camel@ndufresne.ca>
Subject: Re: [PATCH v5 2/9] scatterlist: Add a flag for the restricted memory
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: "mripard@kernel.org" <mripard@kernel.org>, Christian
 =?ISO-8859-1?Q?K=F6nig?=
	 <christian.koenig@amd.com>
Cc: Jason-JH Lin =?UTF-8?Q?=28=E6=9E=97=E7=9D=BF=E7=A5=A5=29?=
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
Date: Fri, 28 Jun 2024 16:23:25 -0400
In-Reply-To: <20240627-impetuous-aboriginal-cougar-cdcbbf@houat>
References: <98721904-003d-4d0d-8cfe-1cecdd59ce01@amd.com>
	 <779ce30a657754ff945ebd32b66e1c644635e84d.camel@mediatek.com>
	 <cef8f87d-edab-41d8-8b95-f3fc39ad7f74@amd.com>
	 <1050c44512374031d1349b5dced228d0efc3fbde.camel@mediatek.com>
	 <3104b765-5666-44e4-8788-f1b1b296fe17@amd.com>
	 <98c11bad7f40bcc79ed7a2039ddb3a46f99908f5.camel@mediatek.com>
	 <75dc1136-7751-4772-9fa7-dd9124684cd2@amd.com>
	 <ZnxWWtdShekGSUif@phenom.ffwll.local>
	 <ae73a0203d6acf2878c9e3ae2d7554816b9c66ad.camel@mediatek.com>
	 <5739abdb-0234-412a-9f25-49219411bbc6@amd.com>
	 <20240627-impetuous-aboriginal-cougar-cdcbbf@houat>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_132329_034408_432A781E 
X-CRM114-Status: GOOD (  17.81  )
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

Le jeudi 27 juin 2024 =C3=A0 16:40 +0200, mripard@kernel.org a =C3=A9crit=
=C2=A0:
> > You can trivially say during use hey this buffer is encrypted.
> >=20
> > At least that's my 10 mile high view, maybe I'm missing some extensive =
key
> > exchange or something like that.
>=20
> That doesn't work in all cases, unfortunately.
>=20
> If you're doing secure video playback, the firmware is typically in
> charge of the frame decryption/decoding, and you'd get dma-buf back that
> aren't accessible by the CPU (or at least, not at the execution level
> Linux runs with).
>=20
> So nobody can map that buffer, and the firmware driver is the one who
> knows that this buffer cannot be accessed by anyone. Putting this on the
> userspace to know would be pretty weird, and wouldn't solve the case
> where the kernel would try to map it.

Userspace will be the one calling into the CDM TF-A to get the bitstream bu=
ffer
to be decrypted, not the firmware. The encrypted buffers are not using
restricted memory. Userspace is also responsible for calling into the MTK
restricted heap to allocate the destination buffer (on other platform it co=
uld
be CMA heaps + TF-A call to restrict the allocated memory, I've seen some
discussions related to this, but its not possible on Mediatek HW).

I think its fair to assume that userspace always know which buffers are
restricted or not in the SVP process.

Nicolas

