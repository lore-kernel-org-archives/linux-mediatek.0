Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 230DAE77198
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jan 2025 12:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FA34be2teYEYsr2t/72VryT2qJhAIzW5Ui7xESwTB6o=; b=cA+m5OZVr5bzS6abpPbrMrWzHs
	uo+cJl0GwUm7V8CN+HdVz6tzO8Bk0DjhxEldlKNRcau8d08xaGnAw1DTfABW1tnSFu2xXGaGrO93K
	dZKXjxLtI0glKUkaflwE8XQNxIOXUuLrCACJ1LHl3rdxhb7aRR2Q8Qp2keKTFCFz3SNPWZJ2dBw+z
	xXCMZz9Y9A7BgLGcj02XLAhz/qRiSVICFk244onzUZIFv3n2r+hz4/ultlJMi315ehl5W4YRSfnjF
	slhf+s0kTfFyPkQ+p3JZNLHYsEUnPF8jEYmwWeIx/fQT6zYUEWImwgyEXYPlwOI25PJxhN7VBFnV6
	P62r9SqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV8md-00000004mkR-0ULx;
	Tue, 07 Jan 2025 12:34:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV8mY-00000004miR-2bHI
	for linux-mediatek@lists.infradead.org;
	Tue, 07 Jan 2025 12:34:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736253240;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FA34be2teYEYsr2t/72VryT2qJhAIzW5Ui7xESwTB6o=;
	b=dLi2D0+/5pz9F0ZhYEyjhCXAMaISbnkUdIwbxOHa339T8WNIEw7aSMuQh4ciPtcQCRx3gg
	51JDsrhMGymdwngUWzcUQ146MsNJlh1qH4HXisQKSIvZX/crmB6yBmzKCgLOYeU5SijNJh
	dwA7vHCzC4A9RTFn98hZ0ggEIJdQu4I=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-492-Ym1YjD90NlS5gzvvsGgHxg-1; Tue, 07 Jan 2025 07:32:24 -0500
X-MC-Unique: Ym1YjD90NlS5gzvvsGgHxg-1
X-Mimecast-MFC-AGG-ID: Ym1YjD90NlS5gzvvsGgHxg
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ef6ef86607so21536103a91.0
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Jan 2025 04:32:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736253143; x=1736857943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FA34be2teYEYsr2t/72VryT2qJhAIzW5Ui7xESwTB6o=;
        b=P56c988FBkqJcZK/9xeZhM+yYK4q2QyxrjyVQmZEAQ3pSMSyJ6uazLXw1kA2aeyFCW
         5CroQwtfJKUzMaKMXLWEViYWc+Y2nKssDY25tEWdf2YWn9pFdIsVeoQILjOBK945P1YE
         Bw4tk48HBOVQrPkmlU40oiHHc3DjyIdOB5HqyTc+ncnwpXiA4Nl39V9q6IhFHxFE/+KE
         bnCB9yZFpdpBfXsw2kbbz1l5ZNG10lY+f3/IiXWtXh+88lt0/ioQWPpINKmOoNw2U9kh
         JSdxb3N0gwOGox5WMQHMcEwl0YwpVokJqF1mUdXmy1tiMTD0Q730fTOgM1x+vUIuDrDO
         P2OA==
X-Forwarded-Encrypted: i=1; AJvYcCVyQUriEs47Nhmka2I8P7aen0VKbp9WlC5alN8bufpIlXRO+qQKgmFXcdLv+5kQT6d69U3RiI1DP9zDHFRZig==@lists.infradead.org
X-Gm-Message-State: AOJu0YyDYkB79rhT9WzN9R61t3He6be1IYld+csaqjS8SQ1ajL0KPpZG
	wQaPkj3gVfzbvHh5kXNP9s6ahlcJIxOIimh3uy+LMFoI4M6UoUaW16GQj9aDaunmiNeqv3uN7YF
	ixjf3vRuU75FBvqS2igMfQE6/C4UvtjnFek3vC2IQPe3e12yOdtFxJKYYtrWV+rOuYcJ6doMYWW
	Hv739QMcJrKJgVDXzrjzj0DkXSVjIkaTUpfoQmMmnIjigu
X-Gm-Gg: ASbGncu1fpNGHG7OaPj2lixEDFUvx1mpLdDkZJ8s+CC6Emx28RYnfcLSYNqGULm0g3+
	aVJm+rdKppY2ZloVKY/EHpWyEIDViQ7B5LPn/E6+yrjPoIIPtocye88s4zn6PK/WRlL2hJw==
X-Received: by 2002:a17:90b:2f08:b0:2ee:5c9b:35c0 with SMTP id 98e67ed59e1d1-2f53cc0026amr4449311a91.9.1736253143211;
        Tue, 07 Jan 2025 04:32:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHXEm8Tpwx9R6D9Gw9QHyKE+GR3tsYiiCv4Ym0+gd1Cz9oD6CrSF51bAc0DLA4TAYCA4UkwcBAPiOxCypE3SI8=
X-Received: by 2002:a17:90b:2f08:b0:2ee:5c9b:35c0 with SMTP id
 98e67ed59e1d1-2f53cc0026amr4449278a91.9.1736253142921; Tue, 07 Jan 2025
 04:32:22 -0800 (PST)
MIME-Version: 1.0
References: <20250103-airoha-en7581-qdisc-offload-v1-0-608a23fa65d5@kernel.org>
 <173625003251.4120801.586359106755098449.git-patchwork-notify@kernel.org>
In-Reply-To: <173625003251.4120801.586359106755098449.git-patchwork-notify@kernel.org>
From: Davide Caratti <dcaratti@redhat.com>
Date: Tue, 7 Jan 2025 13:32:10 +0100
X-Gm-Features: AbW1kvZ_ZjT4b_8fuDBZTcCBlMZd_2JVzhsmZ6fS1Bss4oQKv0WT0sawYektIcY
Message-ID: <CAKa-r6v0bEjQfbSG75E9kV1Qki-5eAbrqiy2maB2iG2O4Wf5Xw@mail.gmail.com>
Subject: Re: [PATCH net-next 0/4] net: airoha: Add Qdisc offload support
To: patchwork-bot+netdevbpf@kernel.org
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, nbd@nbd.name, sean.wang@mediatek.com, 
	Mark-MC.Lee@mediatek.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	netdev@vger.kernel.org, upstream@airoha.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nSAmaaub0pPmIDqiknGY37yPZQcnbQyz0QLryhwkaQw_1736253143
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_043402_730610_2431B88D 
X-CRM114-Status: UNSURE (   9.54  )
X-CRM114-Notice: Please train this message.
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

hi,

On Tue, Jan 7, 2025 at 12:40=E2=80=AFPM <patchwork-bot+netdevbpf@kernel.org=
> wrote:
>
> Hello:
>
> This series was applied to netdev/net-next.git (main)
> by Paolo Abeni <pabeni@redhat.com>:
>
> On Fri, 03 Jan 2025 13:17:01 +0100 you wrote:
> > Introduce support for ETS and HTB Qdisc offload available on the Airoha
> > EN7581 ethernet controller.
> >
> > ---
> > Lorenzo Bianconi (4):
> >       net: airoha: Enable Tx drop capability for each Tx DMA ring
> >       net: airoha: Introduce ndo_select_queue callback
> >       net: airoha: Add sched ETS offload support

I was about to comment that ETS offload code probably still lacks
validation of priomap [1]. Otherwise every ETS priomap will behave
like the one that's implemented in hardware. It can be addressed in a
follow-up commit, probably.

thanks,
--
davide

[1] https://lore.kernel.org/netdev/CAKa-r6shd3+2zgeEzVVJR7fKWdpjKv1YJxS3z+y=
7QWqDf8zDZQ@mail.gmail.com/


