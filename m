Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B9BC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jan 2022 10:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xzbvod72kppoY0rdLL1IKREaL9vXGHoIPxjXx9iU3Lo=; b=wZdFyzEffvcREa
	jGLq9SyzDrufzUZQXIhiiWO4Jw4ogejyYFHSnzKkoTz91kBycSZiPTzkfXKhu1750D/HMJpyKxyjn
	XPuksxrDy62Ydiv1s8YDBWBsRIJCrg1PSvbNGNVCaBxJ4DBtcpoldrkYl8EvLyLGX32qptNP07jVl
	91w4mwWVfheECJwXLv3GTypSXBZJOHLHR/IA+g+Wyo0ibqznxqRzKeStE7Ywe+w1AmcfO8VheuCfv
	57ThIWxmzm1ET5p0aF4P/B60jJ08S3YmPWs4/8AFfG4AvGdDMeYO+CKGG9Ajh+VrngNPWwIJBPrF9
	INaZZrjnpEol7iU98R6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nA8Jt-004xPw-3t; Wed, 19 Jan 2022 10:36:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nA8Jd-004xJw-TT; Wed, 19 Jan 2022 10:35:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6EF0D61599;
 Wed, 19 Jan 2022 10:35:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6625C36AE3;
 Wed, 19 Jan 2022 10:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642588544;
 bh=dLVBsjWsa3tGe7VI+gEjPAK21hcD2zsUppaxNspCidw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=OY+FuNZsU4FCGv13S5pE17km9nFJ1sREVRgpDGQ3pF1hqIWYJj8cI5XCxXu372wy/
 x8qRQrobeWclhryEaq/pzYK0MrdOCEu9NcYrJ29i4IpnUqbQXN5oZ/Ibd1wYTh7Icr
 fIDmXjiYEcnQ4R5kQzKQWcrgUtdgL4TMU28ukJlmRMrmncy5mtPeWwlStAI7Z06KbW
 tQJpb54LWKlSp0sliFIzFwuiS98/B9vCwQaZtKuYxBKehYH5lDeD2kdFGSgM2bLL+H
 iYtuj0ZJhGM5vIlNeKiRPtvNK1JnwxlfhAVe7PRK4OZ9279oqgJmf5WHeBjEgVYksT
 olvWSmwJx5vpg==
Received: by mail-wm1-f46.google.com with SMTP id
 q141-20020a1ca793000000b00347b48dfb53so5046761wme.0; 
 Wed, 19 Jan 2022 02:35:44 -0800 (PST)
X-Gm-Message-State: AOAM532JGO/WbU0DggVjKpLwV6cl0DH0/zZw4YRHrH5zcWIm3Q2Sgyzx
 TjGR6p3QPNjBB38tCrTD4Gpx/Zra+M1YcQdmwp4=
X-Google-Smtp-Source: ABdhPJxz62Vu1t8USPQKfzN9UxWCuXzIdAWIMYfTvzG08o48WSftiicOZMHsxR2P9Zuf5cNWB4skcW66Hpc+FiM5xGo=
X-Received: by 2002:a05:600c:3c9c:: with SMTP id
 bg28mr2778170wmb.190.1642588543206; 
 Wed, 19 Jan 2022 02:35:43 -0800 (PST)
MIME-Version: 1.0
References: <CAHmME9oX+4Ek81xy0nBOegqABH0xYqyONAqinsu7GZ7AaQaqYQ@mail.gmail.com>
 <20220119100615.5059-1-miles.chen@mediatek.com>
 <CAMj1kXE_6WboUK0VPbTwzTbMNxv8b4XUp7USQUp=YqcCRMTZig@mail.gmail.com>
 <CAHmME9o-=q6jT6mF3XsfoA17756YVEWdXGHukP=rxWS1gs5irg@mail.gmail.com>
In-Reply-To: <CAHmME9o-=q6jT6mF3XsfoA17756YVEWdXGHukP=rxWS1gs5irg@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 19 Jan 2022 11:35:32 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFdgPj7Ky-361QNAOLccr1mq5m9LSsPfbgpwV58fLAxJw@mail.gmail.com>
Message-ID: <CAMj1kXFdgPj7Ky-361QNAOLccr1mq5m9LSsPfbgpwV58fLAxJw@mail.gmail.com>
Subject: Re: [PATCH] lib/crypto: blake2s: fix a CFI failure
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Miles Chen <miles.chen@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_023546_054926_817A40B0 
X-CRM114-Status: GOOD (  28.39  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 19 Jan 2022 at 11:20, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> On 1/19/22, Ard Biesheuvel <ardb@kernel.org> wrote:
> > On Wed, 19 Jan 2022 at 11:06, Miles Chen <miles.chen@mediatek.com> wrote:
> >>
> >> Hi,
> >>
> >> >Hi Miles,
> >> >
> >> >I'm actually not able to reproduce your oops. I'm using vanilla clang
> >> >13, cross compiling for arm64, with thin LTO enabled and CFI enabled.
> >> >Kernel seems to run fine.
> >> >
> >> >
> >> >Are there other settings that are needed to trigger this? Do you see
> >> >it in upstream clang or just the Android fork of clang?
> >> >
> >> I will try another clang (the previous version I use).
> >> I am using Android fork of clang and there is a clang upgrade in this
> >> merge.
> >>
> >
> > One thing that could be worth a try is to make __blake2s_update() and
> > __blake2s_final() __always_inline rather than just inline, which by
> > itself does not appear to be sufficient for the code to get inlined.
> > (If it were, the indirect call should have disappeared as well)
> >
> > Given that indirect calls suck on x86, we should probably apply that
> > change in any case, regardless of CFI.
> >
>
> Had the same thought at first, but then looking at the original stack
> trace, it looks like the __ function is inlined:
>
> [    0.000000][    T0]  __cfi_slowpath_diag+0x354/0x4b0
> [    0.000000][    T0]  blake2s_update+0x14c/0x178
> [    0.000000][    T0]  _extract_entropy+0xf4/0x29c
>

Indeed. How odd. I hope this doesn't happen with the x86 backend
because that would be plain silly. On arm64, it doesn't actually
matter in terms of performance, it just needs one additional callee
save register to preserve the function pointer across calls.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
