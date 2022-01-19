Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6DB5C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jan 2022 10:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hltcuF6i87BTibbHcE/RXEchLWk8HbuFhq88GePjyUA=; b=GspWFA1ku9sQy9
	ycCHR1RwUO/cYnoPRberzBQP6S0BZoGVwxZE90pvkhd02chJ4Mh64WZrvULg1Q1NakPKPm5eWEvbV
	/dhu0jPkTCylYUkr5LsZWZYC0Ri2iVZZNg4Tll4yfzkvZa19oG+leLpQCiQf7yZarFY0sqNqgrZa3
	MPH+zM8/EbSVYQzUJwxtUDuqGRxmVk+hRTbMwoAHMi8cxIv8Wwmqj84CiVzAUkP7d/8O5b5cS6Aeo
	dGJmD/idMwac0adwIXAhntqXtDMimhN0+mJJpJkAkMfgtAS5XZiMkuIWfK4R05OIGakClEvnHkbtH
	bMQoqYuPKa50kSiTCq2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nA7yg-004qiX-B5; Wed, 19 Jan 2022 10:14:06 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nA7yR-004qdp-Fz; Wed, 19 Jan 2022 10:13:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 30099B8191F;
 Wed, 19 Jan 2022 10:13:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8C3CC36AE3;
 Wed, 19 Jan 2022 10:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642587228;
 bh=1yUmZ1gtr9CBj5pMoqsvEIB5CbXXsyQeM7ffKKbaC24=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=q81WFpPHkZ7JV6ZOKutx3YkmR40mCv+CdMEBEV/oDqtHeIMtAqjMsI+Lusl40hoF7
 LqRAw540lQZlb3gDjcnAMs6IKjNXYoc2D3wKozp/5wCOq+M/JPlLElqw0l+bIvdk5T
 nNv7bctlnKXGscv3xmuYtKXvaN5Bc1ceZ0tEX6AKAZ0PVl+hhouyzA5nvw2UKuP43W
 K4UabxmcdfsYryv0uIJ47AByUPXCN2kmAb+qFjV8E+g1tS4xzUf3gHME+56cKih0h7
 VgeCDujJ3Dskn7NfyrD+AkhDqXLCoQIzNEFQo8waUrvJgGVL2f4FqAmm8gjls6l9VM
 YjvOnUbbsfGQg==
Received: by mail-wm1-f50.google.com with SMTP id
 h206-20020a1c21d7000000b0034d95625e1fso5221922wmh.4; 
 Wed, 19 Jan 2022 02:13:48 -0800 (PST)
X-Gm-Message-State: AOAM530O6J1l6AXtOFmZuw1Cy91i7zc8XnXIxlJqsg53wtgoBcrnSoNa
 Hi40HgvF4gQHSdSB4KWyVooMkHBzeJaFmv7Ekq0=
X-Google-Smtp-Source: ABdhPJxqBXw77uQHArSK2VBrtoFpSbj05KpONweHZEWVRXOUUkrJGt/k3ZzOnZtzegeC/V1Mhu+oTLrNfHeOMfbtlwY=
X-Received: by 2002:a05:600c:3c9c:: with SMTP id
 bg28mr2689276wmb.190.1642587227212; 
 Wed, 19 Jan 2022 02:13:47 -0800 (PST)
MIME-Version: 1.0
References: <CAHmME9oX+4Ek81xy0nBOegqABH0xYqyONAqinsu7GZ7AaQaqYQ@mail.gmail.com>
 <20220119100615.5059-1-miles.chen@mediatek.com>
In-Reply-To: <20220119100615.5059-1-miles.chen@mediatek.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 19 Jan 2022 11:13:35 +0100
X-Gmail-Original-Message-ID: <CAMj1kXE_6WboUK0VPbTwzTbMNxv8b4XUp7USQUp=YqcCRMTZig@mail.gmail.com>
Message-ID: <CAMj1kXE_6WboUK0VPbTwzTbMNxv8b4XUp7USQUp=YqcCRMTZig@mail.gmail.com>
Subject: Re: [PATCH] lib/crypto: blake2s: fix a CFI failure
To: Miles Chen <miles.chen@mediatek.com>
Cc: "Jason A. Donenfeld" <jason@zx2c4.com>,
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
X-CRM114-CacheID: sfid-20220119_021351_702031_2F872850 
X-CRM114-Status: GOOD (  19.35  )
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

On Wed, 19 Jan 2022 at 11:06, Miles Chen <miles.chen@mediatek.com> wrote:
>
> Hi,
>
> >Hi Miles,
> >
> >I'm actually not able to reproduce your oops. I'm using vanilla clang
> >13, cross compiling for arm64, with thin LTO enabled and CFI enabled.
> >Kernel seems to run fine.
> >
> >
> >Are there other settings that are needed to trigger this? Do you see
> >it in upstream clang or just the Android fork of clang?
> >
> I will try another clang (the previous version I use).
> I am using Android fork of clang and there is a clang upgrade in this merge.
>

One thing that could be worth a try is to make __blake2s_update() and
__blake2s_final() __always_inline rather than just inline, which by
itself does not appear to be sufficient for the code to get inlined.
(If it were, the indirect call should have disappeared as well)

Given that indirect calls suck on x86, we should probably apply that
change in any case, regardless of CFI.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
