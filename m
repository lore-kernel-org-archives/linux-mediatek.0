Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C318AEB64DD
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Aug 2023 02:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aja2sp26dbGeO9esoM3QzIDVku+dq0XwVDIc+IsolCQ=; b=H/Kt/s6cb6TTxxHoLboR+JE4Cx
	GjQAE/EPoAso9shDXguK+8cochFmltFeEy1kY5ju/IyrIbY0RD95yOFpKU6EaoN/wwLeLs/brhP4m
	qK7/qBSaXEcrHg/5MQBF/Wu3JDHsxhnMtNgl7lxBmnEGxVOolLguXEzv+YhEjG1Wuvq255DOjUG7I
	5mhQYuyKGWI7QpP6gAMSFwsxxYa0g+0G8dtH0O/2IZCO1CxfSgsK5JaxS22qncOVUjCbQrnTAgiyE
	FWl35TqIanemhySW6jWd+hts519UkdGtnJcdUe73SZPQ0G30s5ign+FRvrhpqQHoI/PPljFJc4LTv
	x3cAfIuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qR1Hh-003lFO-0x;
	Wed, 02 Aug 2023 02:08:21 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qR1He-003lDr-0S
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Aug 2023 02:08:19 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-407db3e9669so97331cf.1
        for <linux-mediatek@lists.infradead.org>; Tue, 01 Aug 2023 19:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690942095; x=1691546895;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aja2sp26dbGeO9esoM3QzIDVku+dq0XwVDIc+IsolCQ=;
        b=Dk7unEKbfc4Uh9Givnij3H7AlSDRccS+dzyPLr8xBsdgsQgvwF5I0MXyDh9gxrQm/V
         e7RZD3qQlzZDsIuK2AY5tA0WehBbm6Cp3Cjlu5qKOb/awWrB8NU+LIpZhYWJTiulN10N
         uU9YiJDDI4NEuQ2PuZUuIrQRncbZKcOSZ9d2jj8kmyLeFUdV5BVfaO+dgkCYY9MKhwSI
         gk2xNiyOuUqLWeSeP4q7oUpyTBXXNMBbFnaV1maQx9xuTOBHYZnnpZ380/pFN5M617av
         HDP9kYxN2E/hVUt5k+gBlRaAKk2I+xJnlM1r29XWOV2fnJUGXK9+TgnaP2e1G2pZuf+f
         CSTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690942095; x=1691546895;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Aja2sp26dbGeO9esoM3QzIDVku+dq0XwVDIc+IsolCQ=;
        b=I86AMOYfoItuIOGKHEhT7tNJWj3L3lJIwiL6M6fdkIhMVx8OJP2iOiLy9O+5NIaKQd
         Akr+Fg31T/Zgffvu8m5gztjJAk1hi+OvWLQDaEhKg8WHdoxAqnEaPpEtX4bu65nfDqwp
         p/Za/9/ESYx9oLOdlOhVyub26yV5wQEaMEeyhbRSumeeVctNkQ2KesR6g0ve/S4wiftx
         QPXcyy1qG8t0aqSN/FnlxHz/RMds1nRvcbpkbCTa9CVejPeOkZPKp64GMsv/Ya21B/zm
         dq4mDkrJ2BpmNWud7YFycxXVCZTSYVWlDoPFzovrTu39l/7x9et0E1yFmbq0yIFqsgrm
         03kw==
X-Gm-Message-State: ABy/qLZqBAlxwQcvCwm8jtHRze9lAyR4uMrsvgTpJskWZRvZqykJ3v3Q
	UTZuVYtxb+Gt9y5rDhR5wnqe3JcEyHcK5IICNVbuWQ==
X-Google-Smtp-Source: APBJJlFI0LpzT3Dxb29zrFcaiBceXtmAw2GDelbar44DfZF8uuQLNGEI78+/S1i3xVkHS0a1TO1gl0VExunoRFjXvvE=
X-Received: by 2002:ac8:584b:0:b0:40f:dc70:fde2 with SMTP id
 h11-20020ac8584b000000b0040fdc70fde2mr129571qth.26.1690942094306; Tue, 01 Aug
 2023 19:08:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230802001938.3913174-1-kaleshsingh@google.com>
In-Reply-To: <20230802001938.3913174-1-kaleshsingh@google.com>
From: Yu Zhao <yuzhao@google.com>
Date: Tue, 1 Aug 2023 20:07:38 -0600
Message-ID: <CAOUHufbz-VHZ12b9wrCFxZ9mqVnU=Xstkoo5Ym9_tw72R1-2Gg@mail.gmail.com>
Subject: Re: [PATCH 1/3] mm-unstable: Multi-gen LRU: Fix per-zone reclaim
To: Kalesh Singh <kaleshsingh@google.com>
Cc: akpm@linux-foundation.org, surenb@google.com, android-mm@google.com, 
	kernel-team@android.com, Charan Teja Kalla <quic_charante@quicinc.com>, 
	Lecopzer Chen <lecopzer.chen@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_190818_177120_B5FF804C 
X-CRM114-Status: GOOD (  22.76  )
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

On Tue, Aug 1, 2023 at 6:19=E2=80=AFPM Kalesh Singh <kaleshsingh@google.com=
> wrote:
>
> MGLRU has a LRU list for each zone for each type (anon/file) in each
> generation:
>
>         long nr_pages[MAX_NR_GENS][ANON_AND_FILE][MAX_NR_ZONES];
>
> The min_seq (oldest generation) can progress independently for each
> type but the max_seq (youngest generation) is shared for both anon and
> file. This is to maintain a common frame of reference.
>
> In order for eviction to advance the min_seq of a type, all the per-zone
> lists in the oldest generation of that type must be empty.
>
> The eviction logic only considers pages from eligible zones for
> eviction or promotion.
>
>     scan_folios() {
>         ...
>         for (zone =3D sc->reclaim_idx; zone >=3D 0; zone--)  {
>             ...
>             sort_folio();       // Promote
>             ...
>             isolate_folio();    // Evict
>         }
>         ...
>     }
>
> Consider the system has the movable zone configured and default 4
> generations. The current state of the system is as shown below
> (only illustrating one type for simplicity):
>
> Type: ANON
>
>         Zone    DMA32     Normal    Movable    Device
>
>         Gen 0       0          0        4GB         0
>
>         Gen 1       0        1GB        1MB         0
>
>         Gen 2     1MB        4GB        1MB         0
>
>         Gen 3     1MB        1MB        1MB         0
>
> Now consider there is a GFP_KERNEL allocation request (eligible zone
> index <=3D Normal), evict_folios() will return without doing any work
> since there are no pages to scan in the eligible zones of the oldest
> generation. Reclaim won't make progress until triggered from a ZONE_MOVAB=
LE
> allocation request; which may not happen soon if there is a lot of free
> memory in the movable zone. This can lead to OOM kills, although there
> is 1GB pages in the Normal zone of Gen 1 that we have not yet tried to
> reclaim.
>
> This issue is not seen in the conventional active/inactive LRU since
> there are no per-zone lists.
>
> If there are no (not enough) folios to scan in the eligible zones, move
> folios from ineligible zone (zone_index > reclaim_index) to the next
> generation. This allows for the progression of min_seq and reclaiming
> from the next generation (Gen 1).
>
> Qualcomm, Mediatek and raspberrypi [1] discovered this issue independentl=
y.
>
> [1] https://github.com/raspberrypi/linux/issues/5395
>
> Cc: Yu Zhao <yuzhao@google.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Reported-by: Charan Teja Kalla <quic_charante@quicinc.com>
> Reported-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
> Signed-off-by: Kalesh Singh <kaleshsingh@google.com>

LGTM. But I think we need the Fixes tag and Cc stable.

