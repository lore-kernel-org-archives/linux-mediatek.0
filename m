Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E59CAC58E
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Sep 2025 00:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=udoHF/ewggrli9LT0yBxNvcwZCggkGncBKGw8/rNr7c=; b=eICpZzWVdKskrs9fO711EvjAoe
	qAbY4uqcgyySXDddx2QQ8134erz16tAUa654NQz6g60YtiQIQKrRa8TWtIc+CgcsrHkJm1+mg24/6
	T97APNLAaPCg8POWrlIVY5iv13R4wLNZ/sPZWbZ6N1yWUT/UA+72rSzpf+iuEKoGDpYZCJbG8pcDB
	/P1IbLg/Ed1AUs1hBeUM6CzWYvoRjgi7sT0bvafdYREGAb17GBxf5IYpMv4jBsSHgUkh7TsOw2HkB
	0I/vB4J4SZWmn8l8x8vGfGra9qVwWhsCeFdv/aDCiZVJy8FoQEsoHjnGbBKhK7/CN0b7BDpKe0jEv
	BOIaa47A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwrNJ-000000061Zt-0wNE;
	Fri, 12 Sep 2025 00:10:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwrNH-000000061Yd-2Xcf
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Sep 2025 00:10:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8FFF4404BE
	for <linux-mediatek@lists.infradead.org>; Fri, 12 Sep 2025 00:10:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70515C4CEF1
	for <linux-mediatek@lists.infradead.org>; Fri, 12 Sep 2025 00:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757635846;
	bh=As0st2mk2L0Hyv308eIrHbtQh5TjekLWLPV+ifYiL5s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qMpIx4IgtVLlsi6LiDk9WM4G5NIXqk2vJMlQcYqfNyIG0UhdfRyvChYLEJqj5snxz
	 bj3B/Q3dTu6d2YvnXim26H63nFoGrtEM/v9se8CDOs+Hy9pBdd2tFXz1OD6/bVcLVS
	 WNhcKqH1ifK6Bpw4omCXCt7SiuA2uUwlJUnvDn1bpZXXZM9eXJSMR2pM28+Im41D6p
	 XHOGIcdrMSb4yG7mmuQ7wORO2ehoA3OKIXQVaqlECxI6EfjdAQ9x2T8vKfIcYGftjE
	 Dpm4GWqaKbbHcreuu5dx3YCeDplTMzTkWpG3wgVIOUggX7s81pzqkDmCrld/jWxhNb
	 XCiyGWaNOoCUA==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b07ba1c3df4so153001066b.3
        for <linux-mediatek@lists.infradead.org>; Thu, 11 Sep 2025 17:10:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXw94vWmoqy8GrbiwUehiLJIUltAsh2rZvKRYxhF8rWC/d1Rj3xgnPW99rMUhskB08sGKts3tmdtnxNX5J7ew==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywp28fM96IjIo/tSrcZv0os3QyghGcFWwaoeIBBzXDgV+bGqmHa
	lf/PqJyHkNOknUbrHXsplXOBp4RBD17krY74NFUyaA1RQsgl0S3HARdVf5f1wJnZTa7d+ihFhj0
	9MwqIO8i3MVEeWXr5bUIsmcWiRBVeijM=
X-Google-Smtp-Source: AGHT+IGlZB9ve92AUsjeuNU1Q5ZaXqNU8y7VQEYnPyGvDio1YpPC6YK436PmiT1NHNvhnGHWryG+F5/8KZPOgJm7JoQ=
X-Received: by 2002:a17:906:478b:b0:b04:5435:901b with SMTP id
 a640c23a62f3a-b07c3a77fcfmr91410466b.62.1757635845021; Thu, 11 Sep 2025
 17:10:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250905084059.26959-1-ot_zhangchao.zhang@mediatek.com>
 <20250905084059.26959-2-ot_zhangchao.zhang@mediatek.com> <a7589659-0352-4d47-a3cf-f2433cc512ec@kernel.org>
 <CAGp9Lzrp-cfn_GiLrHCU629wEAxWy=egOMrRh6thYbymu+QXjA@mail.gmail.com> <0760036f-db69-487c-94b9-a6e405dee0e8@kernel.org>
In-Reply-To: <0760036f-db69-487c-94b9-a6e405dee0e8@kernel.org>
From: Sean Wang <sean.wang@kernel.org>
Date: Thu, 11 Sep 2025 19:10:33 -0500
X-Gmail-Original-Message-ID: <CAGp9Lzqk-mXiNq2iSrTk-Ed40_2j3GSuLMJcWoE1_iy7yY9-qw@mail.gmail.com>
X-Gm-Features: Ac12FXz8IhbvaLWT27HxTo9duYFHYYWRiZ_PiuVbsnFzUeOWnt4swjEH76TSLOQ
Message-ID: <CAGp9Lzqk-mXiNq2iSrTk-Ed40_2j3GSuLMJcWoE1_iy7yY9-qw@mail.gmail.com>
Subject: Re: [PATCH v7 1/1] Bluetooth: mediatek: add gpio pin to reset bt
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Zhangchao Zhang <ot_zhangchao.zhang@mediatek.com>, Marcel Holtmann <marcel@holtmann.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Sean Wang <sean.wang@mediatek.com>, Jiande Lu <jiande.lu@mediatek.com>, 
	Deren Wu <deren.Wu@mediatek.com>, Chris Lu <chris.lu@mediatek.com>, 
	Hao Qin <Hao.qin@mediatek.com>, linux-bluetooth <linux-bluetooth@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	linux-mediatek <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_171047_678230_9F0D6213 
X-CRM114-Status: GOOD (  17.65  )
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

On Thu, Sep 11, 2025 at 1:07=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 11/09/2025 01:29, Sean Wang wrote:
> > Hi Krzysztof,
> >
> > Sorry again for the confusion. I believe Zhangchao is still new to the
> > upstream process, and we=E2=80=99ll work together to improve this. Sinc=
e this
> > series has become a bit hard to follow, would you agree that it might
> > be better for us to restart with a clean patch that addresses the
> > review comments? A clean version would make it easier for reviewers to
> > focus on the current issues without being distracted by earlier
> > mistakes.
>
> No. If you cannot send v7 of patchset as real patchset, sending again v1
> won't change anything.
>
> For seven versions contributor did not bother to respond to feedback and
> did not care to read submitting patches how this process looks like.
>
> Effect is this totally broken v7.
>
> This patch introduces undocumented ABI which kernel tools, if used, also
> point out.
>
> Best regards,
> Krzysztof

Hi Krzysztof,

Thanks for the feedback and for spending time reviewing this driver.
We=E2=80=99ll continue with v8 instead of restarting from v1, and hope it w=
ill
be improved to meet the requirements.

                          Sean

