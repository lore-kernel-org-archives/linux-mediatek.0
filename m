Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A3AC369DC
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 May 2025 15:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xQYoQ6blzMcLADqk42repQh467cCu5FADPOPWsPwKR4=; b=h1Ap/mOK/5pinSd+86OCl970T7
	cnP4wGlDTGpEYp4E1OaI4SvBaa7cy5/GqthElTBiCfnoD9KOyOVCgagec+ISixoQi29MqcfkeuzfJ
	UskveACCH39A5UGNwTe79y9T9D9ELmdgH7+osT9JVjE49OqTRncR7cWJPowLwu2fddi4E68pByq7h
	f3TjeK4bBF2sgSULJiLFHDJeOVEklzbrj0bcxRLjLWlRBRJh2+mBSVJDtSfjiiIGr1WWGD7f1N2Ex
	lDhECLt9zl0f+MeO4Hyta4SVCSl0q/vof9zfEcMpOcbWuXRtk7l2Dnq4Tr9EjeQn45RckgfFdZOx7
	xxXIjx2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAVid-0000000G4XB-1vpQ;
	Thu, 01 May 2025 15:20:59 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAVau-0000000G3QS-2l78;
	Thu, 01 May 2025 15:13:01 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-6ecf99dd567so16258516d6.0;
        Thu, 01 May 2025 08:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746112380; x=1746717180; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xQYoQ6blzMcLADqk42repQh467cCu5FADPOPWsPwKR4=;
        b=XHqH5oyM9+7zuQJHxO0BlItpIM8y/d6mAPuDgV2rU+52laoSzSBnTOC1xAUtKtft7U
         3eZtYx4a42RLDo+eVKFV6bJ/p8kgjm1+xtvTZVAGNl4hzmzasPrWIyEbdMK1B0SHxCnM
         TjEhWQe0E88tQOB0SLX0dc9xqZHhvs0Cj68jPuG5rtUCLkASc7pIX4ShIMBnUtZE8SXt
         QeoWBh4VoYcTbWXEerTZ2/qlpMAZPYTkt1V4UW3TagM+emKApBDKoP4+RDoj5inB6IGE
         DPXlcI0scrLgOB+Xc2m46hXYCKHzWnvfem5w4WwCriR8B45T+suV7kG6iIZhIkXYsXYw
         R0UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746112380; x=1746717180;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xQYoQ6blzMcLADqk42repQh467cCu5FADPOPWsPwKR4=;
        b=a0chHKR1x8EFd3hZc0J69oa1jRjVcVjGIXW3urkiMUXcsWR7bExZKP4QW/4HI+5oQQ
         VDDWu1mLD4nP60qQQC7+oWN7fXIMPRQshN2/UvXZ3sHepfTw1k5vaaWAKmMUDGmBdz11
         G7U+OrVMyNXZKx/NWqvy2GVc8Pau2NbBREn/b+gcMmzlaJ3u/kCncCBW3h/HwX3xUhKu
         jUK2fDqMdnfcG+vcNzUtXOTbVhDRiH8emh8wEHHxdXKeTa6BftCXYwJK2KgOu3x8efHZ
         jjIoWpeyorIIJZxK0Fq8IkL9Ozqn44XJ9PCTOvTZuN6vCYyDaPCxt1+7a6lsl1qXOKNE
         DAEA==
X-Forwarded-Encrypted: i=1; AJvYcCVzs6qFxChUpztYT/AN5VE7wCUzrOGO1GK5LEa6zuq50dMU+VppRQ/+qKcmDqGo8RRy3zlbK5W4kdIylMZXFYXt@lists.infradead.org, AJvYcCWdB2qadnc85gJFB3Zca9pBSst+jpUpv5LPgUeG3MqMII7bbdEjdpLmtBQfNSqmgANvKuqMd6NAnfStX3U11Lo=@lists.infradead.org
X-Gm-Message-State: AOJu0YyBatRRtKrntme9PlGkNP3TLXXOnT45ajvhHYh4uoQYve8RSzxa
	upNNdqUDbcEnkZDRLVhrLrwH5/onDA+zPvbbia8kwLOgLT4YgIIfoY5u/igzQ1fXghaLgUG91uN
	24DqN74o100byFG7QjEeLhxlhb9Y=
X-Gm-Gg: ASbGncthl6OJtWg2CAsaZ2r9qg/1IE2P8H09e6o0W8lf+lwZF2Iz9j/RYXTKd9Z7kKb
	/0erHsfWrg7+ekYMkofl+71HIvPNkJqH/UKqBDS7SFZXJNt9iwkv4YvCRGk6OI43OgMM8bLjENN
	43nXr1A8TmfZXTahm1+8FMqnw=
X-Google-Smtp-Source: AGHT+IGAdTAkywowhkq9htFUL863njyM7arTMBHIbku24t5R7jVNw6BjMXmXswwZnPdgrERB600zafxI6/iVqN/kPo4=
X-Received: by 2002:a05:6214:410d:b0:6e8:fbb7:6769 with SMTP id
 6a1803df08f44-6f50a91ffbbmr48422286d6.14.1746112379547; Thu, 01 May 2025
 08:12:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250430082651.3152444-1-qun-wei.lin@mediatek.com> <20250501140226.GE2020@cmpxchg.org>
In-Reply-To: <20250501140226.GE2020@cmpxchg.org>
From: Nhat Pham <nphamcs@gmail.com>
Date: Thu, 1 May 2025 08:12:48 -0700
X-Gm-Features: ATxdqUHwMXp9jU8G8_cQ9P3g5XjhCdDwSp9AbCfZOwreqQLiBgW7BVs0NuAIwgQ
Message-ID: <CAKEwX=MsP6LGjMRNyaHnO5MkE_ne-u-cKLbGfVQcSR-ALoxBwA@mail.gmail.com>
Subject: Re: [PATCH] mm: Add Kcompressd for accelerated memory compression
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Qun-Wei Lin <qun-wei.lin@mediatek.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Mike Rapoport <rppt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Casper Li <casper.li@mediatek.com>, 
	Chinwen Chang <chinwen.chang@mediatek.com>, Andrew Yang <andrew.yang@mediatek.com>, 
	James Hsu <james.hsu@mediatek.com>, Barry Song <21cnbao@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_081300_694747_29105E77 
X-CRM114-Status: GOOD (  10.27  )
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

On Thu, May 1, 2025 at 7:02=E2=80=AFAM Johannes Weiner <hannes@cmpxchg.org>=
 wrote:
>
>
> The way you implemented this adds time-and-space overhead even on
> systems that don't have any sort of swap compression enabled.
>
> That seems unnecessary. There is an existing method for asynchronous
> writeback, and pageout() is naturally fully set up to handle this.
>
> IMO the better way to do this is to make zswap_store() (and
> zram_bio_write()?) asynchronous. Make those functions queue the work
> and wake the compression daemon, and then have the daemon call
> folio_end_writeback() / bio_endio() when it's done with it.

+1.

