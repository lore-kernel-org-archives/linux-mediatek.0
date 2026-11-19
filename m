Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDDA606A320
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2026 07:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tN1Hu8Uf;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=EwLd+eVC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=glNQGelvD/kDLrH/fiSkPVz0Z5oOzNw/2XFScRnp138=; b=tN1Hu8Ufexo1Tg
	0C0YErLzgNkmF2OcYw949fs356HvIA6QuEg0gq4UumftnstgQIcckGPWHWTzUoI7s2IRbTQ4zXTij
	Olay2PuVISICy1OwXrK0mZovilZSXJgRfHZ1WI53qIRd311xORmapDCqNtNOW78NPTTOnE8LDDiKx
	Z7r8qDpFSC0fDtyVkq/0NWhGkRHkA00hePXfVom4+DvEmxI/1J44D/fz8YzPm7LpUs1yZZ07HSzBZ
	iKM755k+cFmDfxakmKCPE8H/VR2Clpn82srtAYrrl3uOtn7JJjqZU/2rMfjnxCgk/Bc4KuhpkVQvx
	KqGlJtTxetM7yqSdKxjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTwzy-0000000B7E6-0QEP;
	Thu, 19 Nov 2026 07:56:02 +0000
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTwzv-0000000B7DP-3kIy
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Nov 2026 07:56:01 +0000
Received: by mail-yx1-xb12b.google.com with SMTP id 956f58d0204a3-67990a45e02so1893111d50.3
        for <linux-mediatek@lists.infradead.org>; Wed, 18 Nov 2026 23:55:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795074959; cv=none;
        d=google.com; s=arc-20260327;
        b=YINZABMKKZH7wqCbHdrTKg6OL1xZa8LTwZnhKVYqkcmtrUg0YklJZSn1KwLfudLma5
         10aJyTwzTdxGSS7nB3wLvEuAR7bKCQIsNdgFPQspx2iCcP0EJch4Vqp8+agYh2FjHMfO
         8rqzHQOXdd1JQoFho/g+xq1AL6DYYZ4qTbZ5PowEM6vFhPsaR0DkZaXT5CcrxQKwSDMT
         o9lTP6kkDJTw9OENONrRz++EMlJRZvIfAnrxr1PT264VjhtJSXMkvWYWkYMVdY5GyIVh
         e9grYg4pKLJBddYi9MvofRgRyuUgsQySdee8N3w0sI6RBRjXSOmkJI3Jsk1rMWyw3e2D
         GcMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=glNQGelvD/kDLrH/fiSkPVz0Z5oOzNw/2XFScRnp138=;
        fh=zpbZRZrc+tgDaJCNKMni37MmQAblL423RUbBkvSs7LQ=;
        b=p6TrCp4ImOi+zACKKP3iKl8a1s6wqHZ7HAM8Fh36SlwSNIiMCdLV73C15woKGA8lE0
         a6nOE1mAqJdfVbC7RQvKeqwyPf0CPJ4Jf/n+fckotX7WpPcn7tRHHz+xnGURd7pTGGLY
         iqIgKjS0oCqDWAJJynjwmPIRZ7NkvDsUYdwsnH8lgcOdQuQCDqNn4q7S0i69c0lEowye
         P3M1WfbOWilUK6y9zOXYpNqd5VVD2xiwVB4NNgTIRprMGLPZSJCKGqXO9Ok+I+EydCj0
         +5NrRmLtX7ncBCgoMiaNAP/RFPd0i6rfPQtWCNteoTsNUzA0TbLsYx/ccQ0zbzyxDLU8
         ZtIA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795074958; x=1795679758; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=glNQGelvD/kDLrH/fiSkPVz0Z5oOzNw/2XFScRnp138=;
        b=EwLd+eVCshNrd4COslojsSfbTYxvOGpg2pmZFihqJiU9evXh/nrsfCWb70CRIUckWJ
         o1c6c+8jIxv/wKLSOrRWdLlX/9Gp7Ditc8FZFQQsmVnhX7F7ZPlQNVAM/gFFb63YVgZE
         NVFG64lM9PMs8MI3JRXc6KxJRhnkN7LQdqQaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795074959; x=1795679759;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=glNQGelvD/kDLrH/fiSkPVz0Z5oOzNw/2XFScRnp138=;
        b=URuh4INqAZpWgKed8NF+pRcnLx3qkPuhiFJ2MsTgyExuwqBb9px42jIsQGn+alYMsG
         u5JWP+IRrK/egdL8YP862V+y1O+NAIU8e2PCX6Vdz8inla37MgdlOsfBeHkTrdMOaeVv
         TG2NgR8JtlLllGOAvn8dbLiKXsLTaUnrW+jzFzU/O5KfcX7Ywm1S7dyAjjI/kQx5O95c
         uZzCxiJJQ7BJgMYL04dvx/DV/zrJSA4P7Jo1RAxfo+pTFqB7fIBcQTq3hP7Y6CVkwCFK
         05S3TuPDXeMI+evoRBebk9k4+51JKSAPXJwYexpX1SA20tUDlitn7WZEm+aMfWrbnaCp
         +/xQ==
X-Forwarded-Encrypted: i=1; AL+hErEPdfx9IJiNyJEYFKnuAi916Ukmkt/FbXcF8ItMk5SVwtqk5TCxWZC5ppaE//kk6vAKeF4zz5KUUbaVl6TDSA==@lists.infradead.org
X-Gm-Message-State: APuU4Z/I1mr/aZKisyi9RZy1kO1t4Rm9VnSt1/Rr03uBUgHxeUtfne0/
	1gZrkVSyv6x/V2Wz0FzqGHzVIHY//eqaEgEziQx3hahSG4LlEOpjiwAyT3tHUyZzUX3PbpjO+ph
	EjLrw6Um1PlrFMGT1sgTi+LA1F9WI7ZyHb087FtnL
X-Gm-Gg: AZFdTZdv8cHTc49M/GvKgjdQdlXJAWKtJ2baa3XpxBRhEaC3B5g5qBr16LBcyvaQJOi
	KzkwpJBC7TFlYcTIrXPNx6XtVMb16v+/Mb5dWPfYKKAuu/sdOdsD2t78TWOgCqCMPE8iy1Pjh4o
	p2XlLpHfjlO+QxQsOFlFQlzKFnuR2YYEIQakfi2GRlLkiPaSZyRTAkG5aACqbMgfItMJ95aLfj2
	a6GPkKEH4/qsUk5awVYnorsAPkgvUeZ0rRkK6Su90K1Gl+5FN1unRYE8X9KE6H+SbpuC8M8QBIw
	cmGHQEgxM+b+HICgK0J/nAzwBVD3RL3OdAOBa5myFvguWtn18sZE8MDXIcKeP2QK9xVL0Jg7uBc
	lLtY0kCfS7F0DgGLOHxWNgwXtgykBoernu9xYPytbUCRMmxK0MAInDen453116y37nQY=
X-Received: by 2002:a05:690e:4853:b0:67d:a059:2f39 with SMTP id
 956f58d0204a3-67dd3f1b3efmr1369617d50.21.1795074958750; Wed, 18 Nov 2026
 23:55:58 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030103418.2355854-1-wenst@chromium.org> <179491350817.164578.3923681659802112857.b4-ty@b4>
In-Reply-To: <179491350817.164578.3923681659802112857.b4-ty@b4>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 19 Nov 2026 15:55:47 +0800
X-Gm-Features: AclHuK_NKKojwe2jAIh6fAUopYilD5lO7S60sKZvTblPy9cW1Wbrg51aFpv1c_s
Message-ID: <CAGXv+5FiRyp6MzTdOo3KygM1w20YPD+eCG=-K+VVbPZUYsQQnA@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: mediatek: mt8192-asurada: Add ramp-delay
 for MT6315 regulators
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_235559_979665_5C647F45 
X-CRM114-Status: GOOD (  12.46  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 17, 2026 at 7:05=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> On Fri, 30 Oct 2026 18:34:15 +0800, Chen-Yu Tsai wrote:
> > On Asurada, the MT6315 buck regulators (Vbcpu, Vlcpu, and Vgpu) are
> > missing the regulator-ramp-delay property. Without the slew rate
> > specified, voltage increases may not have settled before switching CPU
> > or GPU to higher operating points, risking undervoltage crashes.
> >
> > Add regulator-ramp-delay properties matching the slew rates configured
> > by firmware, with values provided by MediaTek: 8000 uV/us for Vbcpu, an=
d
> > 4500 uV/us for Vlcpu and Vgpu.
> >
> > [...]
>
> Applied to v7.4-next/dts64, thanks!
>
> [1/3] arm64: dts: mediatek: mt8192-asurada: Add ramp-delay for MT6315 reg=
ulators
>       commit: 9c9f83e3368d27d1e0ba55827a171ebf551c3d0c

It looks like commit 9c9f83e3368d27d1e0ba55827a171ebf551c3d0c ("arm64: dts:
mediatek: mt8192-asurada: Add ramp-delay for MT6315 regulators") ended up
with the regulator-ramp-delay values for Vbcpu and Vlcpu swapped:

- mt6315_6_vbuck1 (Vbcpu) got regulator-ramp-delay =3D <4500> (should be 80=
00)
- mt6315_6_vbuck3 (Vlcpu) got regulator-ramp-delay =3D <8000> (should be 45=
00)

Do you want me to send a followup patch to swap them around, or do you
want to handle it and fix it up directly in your tree?


Thanks,
ChenYu

> [2/3] arm64: dts: mediatek: mt8195-cherry: Fix ramp-delay for Vgpu
>       commit: 04560888cde5fd8adc325a6ce47466f80b8c668f
> [3/3] arm64: dts: mediatek: mt8186-corsola-voltorb: Add MT6319 ramp-delay
>       commit: 929638df9f3b36665efd60ac71f1eed4ba36a0a5
>
> Cheers,
> Angelo
>
>

