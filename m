Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F85F606A320
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2026 08:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DQ6jaOCL;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Ku8vmCuI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=i4dWKs4ci8K3OMa5e1MlzMTJiiLuTKUPNju8rpwDqTM=; b=DQ6jaOCL05hCR+
	ogoffrUFVtf6lPudbdR2WD/mnCe1Fd0nL/i3nURYbrjhpswjQWS4lSN9QAchYP9qDOHmrgtqTZzrx
	NbtVfodt51j5V+RH8Z0v/Yz/eVv/zJwnTqfJyYvSPhl+KGK7ycCMDYerjJDa2hu0E3P//sL+nW6xI
	RzNUwQzNRftGVp23SAXx9WM+O5r6NSZB6N8A0e8d4sNmA/V2YCTOHPkZhOdA1I/PbLpLEkgBdXd09
	alXmyE5xbJ0TrHJFqpqDcPL5BfDckam55mHMyuIpe4metp7kiyh1hbe559NCSDenC/hYZ7Pz/pwWu
	N+SfG8e9W1F6zjZ7qPWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKAE0-0000000FqUS-48ky;
	Fri, 23 Oct 2026 08:02:05 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKADy-0000000FqTV-2LIi
	for linux-mediatek@lists.infradead.org;
	Fri, 23 Oct 2026 08:02:03 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-8a05f2d5cd3so274069b3a.0
        for <linux-mediatek@lists.infradead.org>; Fri, 23 Oct 2026 01:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792742522; x=1793347322; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i4dWKs4ci8K3OMa5e1MlzMTJiiLuTKUPNju8rpwDqTM=;
        b=Ku8vmCuIyP+KKcF4wuwqYrNJh2FixEd9/qqSFAz2ymki8sAhdYmDZ3YXafzj1j7NR8
         G7p+4uEp1IaAZKuAySjP8KEZo6C6tv1HAGnjlWZ1DMyJtifuxPR2cvX2NGwYzbxh3byE
         Cg/7/6DoXIVJkOmfGpnK7/hLhFu6O7cvbw1Ws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792742522; x=1793347322;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i4dWKs4ci8K3OMa5e1MlzMTJiiLuTKUPNju8rpwDqTM=;
        b=WHCZOo6Kc8Ixf8H+/koYhnoJ0KRsFEjFMXFnsqH7V6YXS3zZu7WGCMuVQq5WP22zYi
         5mMHzS1I2HtFzI20X2zGss7Vr9jGIDS6GCWKxTw0piSzeqqIQzPAksqnfNrnPatFHABO
         5RkpCsznONL79/gDshQX8c0gKv07jpk3zLVrhfQZp7AXoUZiX4u3xto9zJOaTIPdRBoG
         yvK1mHk8bBOI3RrxnDxDI2wRk8EXfwOHuGltlUyZuo9ZhnMTYrfxdVlCnfHp8J5bvbu/
         FSn0txsnxs9KvfuSv4oJtqszKsrQhs13uuE3ccv9etjCDB4pvtmqu2L62/BTTOb2MKVh
         1f9w==
X-Forwarded-Encrypted: i=1; AKwUvBwKJV97LR/eSd9Qvv6ckePhxsZii8NdGUZEeb4leiyxKy8H8Nr6uj1QfThDuUZEE1+HK5fIFVxK+udPC5J7fw==@lists.infradead.org
X-Gm-Message-State: AFq9FYJPyDZArJWouWQhHy3JirbA8GlquNxd9mhVJJdgOUK3BWWqAVkv
	vX71U3Cdn/0Flq+ah+Kh0UCEm8oc29804kjGBP9rXXxNIclfu1bs7QUR+XO/31RAH4RP5oV/Vfg
	NmhbaA1mR
X-Gm-Gg: AYBFou1FULB1WjxN5Ec5dSFoRjJyzprtHvL5XHumIpx/ZuReuEph4RH4CwKkeDsI2S+
	VEq4H/OvNtvoyk+xGLLVyi1WeAFSVsBNwQJ5x/2PZaE33woFDHL0DrUe5MW9qxaG6+2mfWIlhGW
	abFzgVGd/TtQUiMpRhtpIy+ouCAj+ESSqtLqgQAJ7nTlL+7X37v1Cou77UdCKRJ7Q1TWt8s0Coc
	tAfMOrSk8EzHRoXzteFAVkmusKDXzAOYiHqzelzFWc/f6wwW4z7YpVmaNUfWz7y6Z07wTspD/dJ
	s1ljMHs+0GcWY3jq86Swz1u+y7u98jtdFSubCWwkGfFSK3w61ViC4tPa/NTWzGL/bxshdLja/Nh
	tYCSbh0BAIM1kCWUE2rsRtAmxjl8sA9681HLEp5m7sRwstfXH2MYYgusjudxHA4msyeBh15hpKI
	cdxIgFN0L6aHnPy3IqH6VeayJ7Ev2GSIZjBA5epcPEvTeMrl8Mcus6N4yvV4p3CzRJ69HXWZOSX
	EhHWV16Qew3YzZtHUfIUwM+1IqlYZsDeKTyfrbX5J5t6KslNNlYNNaQa3YD8W6y+nASQbRyukjm
	DVmf55IWN2G7gRz9h7O1CExZzwBOqp4oIRpMIR8=
X-Received: by 2002:a05:6a00:180b:b0:89e:5133:d98b with SMTP id d2e1a72fcca58-8a2c66c33c6mr1128757b3a.24.1792742521570;
        Fri, 23 Oct 2026 01:02:01 -0700 (PDT)
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com. [74.125.82.170])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a2c9311a02sm431539b3a.53.2026.10.23.01.02.00
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 01:02:01 -0700 (PDT)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36681e85e87so1548533eec.1
        for <linux-mediatek@lists.infradead.org>; Fri, 23 Oct 2026 01:02:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw+IwQMGVEJPZEgYDTWSF36gVzFsTdFZsiTud4y2uuC2G3m7MRTIG/QMEgy4KHxUmjmv5EiYG+KdJQIstSuIg==@lists.infradead.org
X-Received: by 2002:a05:693c:41d1:20b0:368:6841:c4fa with SMTP id
 5a478bee46e88-369d97cba44mr2146857eec.25.1792742519525; Fri, 23 Oct 2026
 01:01:59 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261019060825.4163770-1-fshao@chromium.org>
In-Reply-To: <20261019060825.4163770-1-fshao@chromium.org>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 23 Oct 2026 16:01:21 +0800
X-Gmail-Original-Message-ID: <CAC=S1niGn0omF1WCr3NbNvY6jZvqZu=3EOgrPEXR9ER7L+onfQ@mail.gmail.com>
X-Gm-Features: AclHuK-R_JeODaJVMp0e_2XshjhzldOiDGJ3AA99g544rt-KmJQNU86dD3TgdPI
Message-ID: <CAC=S1niGn0omF1WCr3NbNvY6jZvqZu=3EOgrPEXR9ER7L+onfQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] media: mediatek: vcodec: Fix NULL source address
 handling in decoders
To: Yunfei Dong <yunfei.dong@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_010202_593003_51DC3565 
X-CRM114-Status: GOOD (  14.01  )
X-Spam-Score: -2.4 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 2:08=E2=80=AFPM Fei Shao <fshao@chromium.org> wrote=
:
>
> Both the stateful and the stateless decoder workers peek the source
> buffer and, if vb2_plane_vaddr() returns NULL, finish the m2m job without
> returning the buffer. The buffer stays at the head of the ready list, so
> the same job is scheduled again and fails the same way. In the stateless
> decoder the media request is also never completed.
>
> The two fixes are split because they fix different commits, and the
> stateless fix also has to complete the media request.
>

I sent v2 to fix an issue where I misused mtk_vdec_stateless_cap_to_disp():
https://lore.kernel.org/all/20261023075642.3671805-1-fshao@chromium.org/

Please disregard this series.

Regards,
Fei

>
> Fei Shao (2):
>   media: mediatek: vcodec: Return source buffer on NULL va in stateful
>     decoder
>   media: mediatek: vcodec: Complete request on NULL va in stateless
>     decoder
>
>  .../vcodec/decoder/mtk_vcodec_dec_stateful.c  |  4 +++-
>  .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 22 ++++++++++++-------
>  2 files changed, 17 insertions(+), 9 deletions(-)
>
> --
> 2.56.0.176.g3575e65682-goog
>

