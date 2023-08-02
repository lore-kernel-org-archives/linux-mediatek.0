Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF2C4EB64DD
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Aug 2023 03:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RlAKMW2hhyEGf7EbQoDjxae+sXt59ciz5L61y3xkpbo=; b=JlgD4nTcU6VzP14O0+x+WpAOos
	ZnlNC6lGSftoB5Sl21tnzT12L6kKaGi35cHmMno7WeGe64j20749lNmJvisWkBy7SoO+0yZF5z4ZP
	9P0H2aQ0MaCc3x/3Wl8hWipkoPm9fKgYZH8CaXqZHWjMCFTwfWahFD9GyZrbK+0YHScqVz41IJ1qx
	l58zNw1POS2w+Dg1iRzZX/ZKqoZ0XcNkGQUWbDqziYIUL53AN65d9IsfFSHV5AWoFWiL5juLi1Xm8
	66l3maL13kGdMMZitD6hLesGtj1jqVyw1HjrlqILQNTvdf1fwp3v1YJbIPkinyeG5zgrUbtUPDtiy
	HivStTHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qR26N-003pe5-2A;
	Wed, 02 Aug 2023 03:00:43 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qR26J-003pc1-1u
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Aug 2023 03:00:41 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3fe32ec7201so7175e9.1
        for <linux-mediatek@lists.infradead.org>; Tue, 01 Aug 2023 20:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690945233; x=1691550033;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RlAKMW2hhyEGf7EbQoDjxae+sXt59ciz5L61y3xkpbo=;
        b=vQJAOG12dWe2jHunL4c0y4nkGH47MCyLHObcx3wytIGo7cJbUOCvivyIOYUfF+wrFO
         unrIYujYnkF+ySOaIF+/kcNOKmOBLJwGwj82XBbWwBb4288Zuc617LPlcbAkRHKXxyc5
         rQZH0wA/4bJp316IZY7q/iIlBwVwzQoknehVtxOnQF9lE4ooLuTLpS3sAyHviJqQTGml
         CUIsHiFKJHycqolab+QqPxjMe5wacy98j7JS/gsZ7WJMly20mExGGR5QswsxqfNN6H8z
         b1QZLQZMBTSFcRd6AW/jY+z3nqiiHzg9EFUz6rDPVjnkT4UfpTVHJzZLPg+mdXbypAn9
         E6iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690945233; x=1691550033;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RlAKMW2hhyEGf7EbQoDjxae+sXt59ciz5L61y3xkpbo=;
        b=hI58pirvfTQVPjdhnk+Ye7O8JX7sgV1jlnCso9KE9aLO8JSKCNXgYTWqu5VJLqOogS
         fA0r71aQWSO0NeW+NFlWxbIsvZG8N754ls7bgs6/nrQUP7NBfHeTDHnw2b4UrZDL9KQZ
         4Nh1ZB1VnMI8kINnU4SqcpoLC8D+5KWqX6uP1Y04CUDSg85pfh1YF/Gr100CK4syDuxm
         yl2WN3/dR7aXfTfTgaB621495AuiaDMcjDKFiLTAfWIFrley6OLEAbpkW05V104uyZy9
         VJOMvTglITvqGZYtmU30lcIRjRSBejkw6HtAlTkpKy8jXcYfdVCE72Et5eOl2t2r1FGZ
         5Q4Q==
X-Gm-Message-State: ABy/qLbhI+nvUFlkSThc9R+cxMhr1QArw8aa52E82JXRU+8OfJ0YB7C+
	AqwKV3P29kk/D2q9OKAfb7wy40Fh1xIMjkPbZUp1Mw==
X-Google-Smtp-Source: APBJJlEAU7sf9LNnkdL9BM8PD1a8rc+IfAWYFJmdLXziM/Js7RppZ43toQ4SbcluXzArg9H2qin9Z8zMAbCrzSlThAg=
X-Received: by 2002:a05:600c:1f0a:b0:3f7:e59f:2183 with SMTP id
 bd10-20020a05600c1f0a00b003f7e59f2183mr310158wmb.5.1690945232638; Tue, 01 Aug
 2023 20:00:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230802001938.3913174-1-kaleshsingh@google.com> <CAOUHufbz-VHZ12b9wrCFxZ9mqVnU=Xstkoo5Ym9_tw72R1-2Gg@mail.gmail.com>
In-Reply-To: <CAOUHufbz-VHZ12b9wrCFxZ9mqVnU=Xstkoo5Ym9_tw72R1-2Gg@mail.gmail.com>
From: Kalesh Singh <kaleshsingh@google.com>
Date: Tue, 1 Aug 2023 20:00:20 -0700
Message-ID: <CAC_TJveohqQNDT+AuoP-25Bm+=GWTZY=XWV+Q=_t=H5YujNF4g@mail.gmail.com>
Subject: Re: [PATCH 1/3] mm-unstable: Multi-gen LRU: Fix per-zone reclaim
To: Yu Zhao <yuzhao@google.com>
Cc: akpm@linux-foundation.org, surenb@google.com, android-mm@google.com, 
	kernel-team@android.com, Charan Teja Kalla <quic_charante@quicinc.com>, 
	Lecopzer Chen <lecopzer.chen@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_200039_643434_3B28F1AB 
X-CRM114-Status: GOOD (  26.52  )
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

On Tue, Aug 1, 2023 at 7:08=E2=80=AFPM Yu Zhao <yuzhao@google.com> wrote:
>
> On Tue, Aug 1, 2023 at 6:19=E2=80=AFPM Kalesh Singh <kaleshsingh@google.c=
om> wrote:
> >
> > MGLRU has a LRU list for each zone for each type (anon/file) in each
> > generation:
> >
> >         long nr_pages[MAX_NR_GENS][ANON_AND_FILE][MAX_NR_ZONES];
> >
> > The min_seq (oldest generation) can progress independently for each
> > type but the max_seq (youngest generation) is shared for both anon and
> > file. This is to maintain a common frame of reference.
> >
> > In order for eviction to advance the min_seq of a type, all the per-zon=
e
> > lists in the oldest generation of that type must be empty.
> >
> > The eviction logic only considers pages from eligible zones for
> > eviction or promotion.
> >
> >     scan_folios() {
> >         ...
> >         for (zone =3D sc->reclaim_idx; zone >=3D 0; zone--)  {
> >             ...
> >             sort_folio();       // Promote
> >             ...
> >             isolate_folio();    // Evict
> >         }
> >         ...
> >     }
> >
> > Consider the system has the movable zone configured and default 4
> > generations. The current state of the system is as shown below
> > (only illustrating one type for simplicity):
> >
> > Type: ANON
> >
> >         Zone    DMA32     Normal    Movable    Device
> >
> >         Gen 0       0          0        4GB         0
> >
> >         Gen 1       0        1GB        1MB         0
> >
> >         Gen 2     1MB        4GB        1MB         0
> >
> >         Gen 3     1MB        1MB        1MB         0
> >
> > Now consider there is a GFP_KERNEL allocation request (eligible zone
> > index <=3D Normal), evict_folios() will return without doing any work
> > since there are no pages to scan in the eligible zones of the oldest
> > generation. Reclaim won't make progress until triggered from a ZONE_MOV=
ABLE
> > allocation request; which may not happen soon if there is a lot of free
> > memory in the movable zone. This can lead to OOM kills, although there
> > is 1GB pages in the Normal zone of Gen 1 that we have not yet tried to
> > reclaim.
> >
> > This issue is not seen in the conventional active/inactive LRU since
> > there are no per-zone lists.
> >
> > If there are no (not enough) folios to scan in the eligible zones, move
> > folios from ineligible zone (zone_index > reclaim_index) to the next
> > generation. This allows for the progression of min_seq and reclaiming
> > from the next generation (Gen 1).
> >
> > Qualcomm, Mediatek and raspberrypi [1] discovered this issue independen=
tly.
> >
> > [1] https://github.com/raspberrypi/linux/issues/5395
> >
> > Cc: Yu Zhao <yuzhao@google.com>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Reported-by: Charan Teja Kalla <quic_charante@quicinc.com>
> > Reported-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
> > Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
>
> LGTM. But I think we need the Fixes tag and Cc stable.

I've reposted the patches with fixes tag and stable cc'ed at:
https://lore.kernel.org/lkml/20230802025606.346758-1-kaleshsingh@google.com=
/#t

Thanks,
Kalesh

