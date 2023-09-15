Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B0AEED619
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Sep 2023 16:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OpolqE+SEAVwVFTY41H2JAWAfBtJPW7sGVhV9bEg07M=; b=0EoIt6hlwb1qacf0R2aYNnhn6t
	WTCGUg253sz0fwaxWsRAAEHzdTaVxQx5V4u7efcGCny5dik3MlMT928/WCJ03M4+VxGvly+Cv2REf
	snAmBx9/mMwvEYtHB/rZTwDLTetoIASpvfwtg21wysEd8DXEx19wXctL07RDWPWMfpuX5ITg4OYgc
	3zMsHyEsx/L5jQ/MSb5ApAlk+q2AVQRAya93YcSpjqH/tOOidWKk5zobcs3dhdZ7m5GG336RyEYyu
	gGV477RqUblVyoSkO63peT8VrsJ8+1Us1YjAs5Ic2NaBYpa/Bmhz7oSRb/2AxqBBLzakzmescJ0ws
	WMS8txOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhC4k-00B5Aq-2v;
	Fri, 15 Sep 2023 16:53:50 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhC4i-00B59i-13;
	Fri, 15 Sep 2023 16:53:49 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1bf7423ef3eso20042075ad.3;
        Fri, 15 Sep 2023 09:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694796825; x=1695401625; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OpolqE+SEAVwVFTY41H2JAWAfBtJPW7sGVhV9bEg07M=;
        b=ffeb+DABOr4a9nbOajBsKW4Pmh9raU3xkDKOVcZZMz21kFUrOOdNnwxtFo1RhF2sbb
         dVi0XjNiSGvVBQH1Brta0RFVQRxa/ExJNmAZrCTnoPN3fUlqGGmWJ9aBSAUwe8pjGH4/
         dCcioOIIrjxcDpS5O+1F1A8MkerUffG+P0K639dwn/tIdPr82dq2pJBYyPxJoTNNUxVT
         gTgtCw1YxZ6xq6y261RWsfIH+YSpPOWHq4h48HLT0Hf+EATQjam1KauEnO9kX9nOOmiW
         nb/nR2p6fvbLOqWUbx/okuxjjxYA3iBh6qHhpDO93XaCYAnFqM7XiLq5AIbaL/BEfEGI
         7p5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694796825; x=1695401625;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OpolqE+SEAVwVFTY41H2JAWAfBtJPW7sGVhV9bEg07M=;
        b=lkuCTaMyRXSTW0OSQlRoTcGdtoUFbP2tqQqk8KFwf/KagH410FBqm0YjnHft0tScp+
         ZDS9O2Z8eMxAu0f08M4MEq3/wU2K8aNMh5dLrYUZZtHAjQMocNAuBsUNycJQJUzyeaID
         2OOMMmLfbw5H9Yr7VTgq49jRldur2nQGl/jMEqiSo8fSxWp++RlvSvj51LzEmzEhcKwE
         HqAnW4HUtHzvcX2h/lkiq/gxqUOZNac3wEacO1LNkFKxn1wk33tsTHAcXeEYrwZtHsz0
         UdWaSySDJn/mtJUoE8JpUfd2926YDn2AoKAvCWu/hYDZGJIqYTloLS9TuNEmiI7L/SCV
         Epmg==
X-Gm-Message-State: AOJu0YxoqPMr1SYOH3zUfLOacnGE49IJ8LbMHMG6P957gbpr1LuUQsvv
	nz5dnzGab0fBds4T4kPxEUTzhsU7dnSRrqo0AUM=
X-Google-Smtp-Source: AGHT+IHdg5qFvGAFmPjYLsoqHgR9aVE+mxhLvc6aKZLyM2Lf8HzCOCEXGWDSsjgJmyQBolmCaP2cdGU4Fzy9TenO3Dw=
X-Received: by 2002:a17:903:1109:b0:1c3:bbad:9b7c with SMTP id
 n9-20020a170903110900b001c3bbad9b7cmr2546503plh.31.1694796825027; Fri, 15 Sep
 2023 09:53:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230915024559.32806-1-haibo.li@mediatek.com> <20230915094004.113104-1-haibo.li@mediatek.com>
In-Reply-To: <20230915094004.113104-1-haibo.li@mediatek.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Fri, 15 Sep 2023 18:53:34 +0200
Message-ID: <CA+fCnZd0FkKNf1ZQxbXWvNM8NAt=ML+yXu5n4VgLOmhFf9TPfQ@mail.gmail.com>
Subject: Re: [PATCH] kasan:fix access invalid shadow address when input is illegal
To: Haibo Li <haibo.li@mediatek.com>
Cc: akpm@linux-foundation.org, angelogioacchino.delregno@collabora.com, 
	dvyukov@google.com, glider@google.com, jannh@google.com, 
	kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-mm@kvack.org, mark.rutland@arm.com, matthias.bgg@gmail.com, 
	ryabinin.a.a@gmail.com, vincenzo.frascino@arm.com, xiaoming.yu@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_095348_386188_38E157D4 
X-CRM114-Status: UNSURE (   8.87  )
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

On Fri, Sep 15, 2023 at 11:40=E2=80=AFAM 'Haibo Li' via kasan-dev
<kasan-dev@googlegroups.com> wrote:
>
> I checked inline mode just now.kasan_non_canonical_hook can print
> something like below:
>
> Unable to handle kernel paging request at virtual address ffffffb80aaaaaa=
a
> KASAN: maybe wild-memory-access in range [0xffffff80aaaaaaa0-0xffffff80aa=
aaaaaf]
>
> When addr < KASAN_SHADOW_OFFSET meets,the original addr_has_metadata shou=
ld return false
> and trigger kasan_report in kasan_check_range.

It should, but I don't think it always does. But if it works for you,
let's leave it at that. I'll double check why it failed for me later.

Thanks!

