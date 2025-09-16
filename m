Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E365CAC592
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Sep 2025 04:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bogLoMlflI6VbNNnCzsFDXRtZ6mT7yFBE69/g4NDZeI=; b=KSTyu8IhIOLrpJ2UxVzith0L8r
	pg9seI084jkAHV0XHXByE0+X7rPNvCj4Al73HfTCVQJ0XvBUTPFqcB6Q8kccGNYHRU65XlTkjsD5t
	8bFQhvtnMbpA88dRKm2K84cGBut/N08/EXSxnixGH3IEsgU1EMZzKdJT1PZU4IAzdbIndOXvVn2kh
	S5aZIsSlVR+YysLPvyj6PEF0eI8GmSNnnSpd6taqrrcBJ4hPfGc38JJN0FHZtirMMnAtGnsqha8AL
	Bj5kAekekQsRyRc4lrlBu8eNAHOP8JofbE0kYXw6ML8wlb9ngW8ijO9rGeZVA7uwIC4p5cW+hLmuE
	0FkypYpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyNC1-00000006gUa-2W1S;
	Tue, 16 Sep 2025 04:21:25 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyNBy-00000006gTN-2LJz
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Sep 2025 04:21:23 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-72ce9790aceso33520287b3.3
        for <linux-mediatek@lists.infradead.org>; Mon, 15 Sep 2025 21:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757996481; x=1758601281; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bogLoMlflI6VbNNnCzsFDXRtZ6mT7yFBE69/g4NDZeI=;
        b=LZTGHV5ZqlDZI99t5OyPG21XgNuTefLIdNPpcCs/EF0hPewplWAhPPpBB6RYDQZeoV
         e2PIjg57WJYyNxZOeS9OSI+wk2V6IxUGK6i9jxz/b+SswjevN3HSHwA2k9ekeUa3tK2L
         qKrmomaSOlranK5Bff+ZxDhZ5c6mbVj6wsN/0j7VCBn1/avv5OXbvqGwpWLj0fX3egrY
         Sw6Ehbcn+/htwKDSKbvwiwPw1AUTsnr26d7Fcxl/lVblb6kkMzg9e20n0EfIGKb+0iBB
         8OGNIldrNXNmm9yvaReoXGtEQOGT5LeyfOC/RpCAbTE/g0LToiNm+Rba/+9Zvu3XOajl
         X9Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757996481; x=1758601281;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bogLoMlflI6VbNNnCzsFDXRtZ6mT7yFBE69/g4NDZeI=;
        b=FVwCxkDKi1h1kCiPG4UTlxoqLx+r1VXJxHUA39+qT9xGMarLYd0Uiv+uSVpCS0nHPS
         fguwP2GmaJhsL2/ht0Gm5qMqimFhKPPpUZ9m3CEaMBznpxYdbv4l+CFM9/Od5KclyLK3
         JMtqBSg4YaG2w8/0yQB8uRupGW3E38Wh6abbyc+grsWipqu8nLY/hqUiCddf/KdgaNNS
         7mG3Y3CNoN8mQkHc7MObTtGu2U638MiXAgBx26+T5H9EtVFuWbquwoXIDKBS0EG+ervq
         Shouk4/EExS4b1S3QhxovHifVAJYLHXYFIpX0wN8gUAuZK0iBt94xcNO+kQrvyvFhZ5c
         4cPg==
X-Forwarded-Encrypted: i=1; AJvYcCXvW//jaC/trsYKEFX/y7XBz+zfFmW4XgGO6gAlESVS43z51ddh3S+8YeVbRwk4+Cn/GvwbA6+djr5SbZ5Zmg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwUkN7JhNOa8u1z5RpkMykBzJOtSGPjvrU0n6CnUcW65sgphot4
	07s204Sasl+BUBgBs3VMXDdL4gJiGzfKfOz83ycC9PfC764dpPMP/IAa02Y+EB7ohzSmTFtcaKA
	Ai1wBBgyoE1cJUIKhRGoGpgjhUn/rfgA=
X-Gm-Gg: ASbGncsdFsGQkTi9WXfQbSACtb1wPTmo5qR7k+f9MbtnHc7U8d94UgKXFp7NPq4A+WG
	gnn8yvQzeg3uyrLvbwOYL+XcvULU6SMIJ0iDA8idzDtqcEKMpy/u9ub0JVwz3+vw2Juy+IU8dH9
	mQORoD8s0F+UAxM68nlZDcZvtZeixlNFTExmjEeEu/70e0+EZ7Kfr8XRzLa3f9A7vGpxPXbE0aP
	rt78J9FJCWEpywnm6m+aPIbxrbLbySqugawg4LCrSMYTmTDpknsKCspgDiyHG6P+veXlcBu
X-Google-Smtp-Source: AGHT+IFyzGXqLS7HgTpLjfWR0n2UfIRuua03WSClBxtb3ipLLNlXWlUaTN5qUbRS4LtdFGTOHy1hA97gOm1mTGj9g3c=
X-Received: by 2002:a05:690c:60c1:b0:72a:78ee:f265 with SMTP id
 00721157ae682-730623e29f3mr107076077b3.6.1757996481126; Mon, 15 Sep 2025
 21:21:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250913002155.1163908-1-olvaffe@gmail.com> <20250913002155.1163908-2-olvaffe@gmail.com>
 <20250915-numerate-makeshift-c076500aaec3@spud> <20250915-deodorize-proxy-b18e41fa8668@spud>
In-Reply-To: <20250915-deodorize-proxy-b18e41fa8668@spud>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Mon, 15 Sep 2025 21:21:10 -0700
X-Gm-Features: AS18NWDfiAtyEiAampVSnuFJXyQ57PVn2PUsFhR83kG6F0bRG1fbgCjLT-SJhR4
Message-ID: <CAPaKu7TEjG3sWamy3k_YLig=208oXLPhMmbCvPOf96iEL0-uig@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpu: mali-valhall-csf: add MediaTek
 MT8196 compatible
To: Conor Dooley <conor@kernel.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_212122_619108_42765B4C 
X-CRM114-Status: GOOD (  12.00  )
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

On Mon, Sep 15, 2025 at 10:52=E2=80=AFAM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Mon, Sep 15, 2025 at 06:51:16PM +0100, Conor Dooley wrote:
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
>
> Hmm, actually there seems to be a more complete binding proposed here:
> https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250912-m=
t8196-gpufreq-v2-1-779a8a3729d9@collabora.com/
Right. I tried to add the compatible to the binding (this patch)
before adding it to the driver (next patch).

If this patch is not a prerequisite for the driver change, I can drop
this. Or perhaps there is a better way?

