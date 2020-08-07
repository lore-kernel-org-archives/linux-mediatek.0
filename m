Return-Path: <SRS0=9FsO=BR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12D25C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2020 18:07:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0D1C2075D
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2020 18:07:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tGMEtN0I";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h+X+IDG5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0D1C2075D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lvVT831FHQTjDcjiyegG2oul+tSgMDKBnuPTOKvy+3I=; b=tGMEtN0IXXqEFI7TdvZiLXOR/
	RwMGxMPLrCAZ6P1b7+YzscmvcHZORmh/jow6gLlcc1d9k+2tPhAC+IZtW6fdegvf9M0AjGG3aVCry
	PnIUgVKhgWaxkKF1ApDEAf0E+zFCAeozhEKLa1agwHW+zYZ1sT0a4IAfqZC45RQW4txY/6/Aey2qT
	Uuw3XeK8O96ilxcPrWmIRh1c5fpqS8OIb+jsIvqDrlUdidkQ8LgfDn01QgO9kUxquatd1jIdTor9O
	qURl3JphohjNPz5dlRrFin9AHZ8rvWnUFY0+gUmEssR32GW1xSLPqP8Vcgz6FnYJtZh1Zd2uNfgbe
	dGr9OROCA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k46mI-0006qC-7H; Fri, 07 Aug 2020 18:07:38 +0000
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k46mF-0006ox-3R; Fri, 07 Aug 2020 18:07:35 +0000
Received: by mail-oi1-x242.google.com with SMTP id b22so2687704oic.8;
 Fri, 07 Aug 2020 11:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7F5o5gH/tEwEajzpI7fTjneSGKfDGJAlpNidTq6oDnU=;
 b=h+X+IDG5dLANG+FOYNwmT/mCzl4Eb5Ny4ytokQkbBAz6vm7JzGxrWxCh6OV0G41Ykp
 S2ejLI8XMS4YUc+lMRsIWn0uc7CVSjSzAeAGa27laMge9LsOK2CPGIijmkWa+E7ks4K0
 jJ5r4IpBgYA1ztYzjHeBvXUzdb1kVTFDMdG0Wwao/aFVgz3IeaDxX45YwG1kBfoVjr22
 IQaqs8IXPcgqnbByfxJJ/zRFIJmL6RBbpsQsFv2tYI2QJYdeia+uouapjk95vdMma8/l
 mz3+NKks7GOgRHY2CkxNuKWAPs34MlpC7/xXPigdPv7wQe+sT98EW4iDrialwFEl6PR0
 M5/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7F5o5gH/tEwEajzpI7fTjneSGKfDGJAlpNidTq6oDnU=;
 b=STuN5As43SyAN6/eW4dVqk+o5GuHqoCqY/gxN/qLzvnt5zhHQgPwH5HBlz1B2h0nHm
 49izlih2sjZBtpqFMCjZ7rsgK6j9F3lfeBvVbQ+Qvq6GIz718n/BrlLjMgyjjfnPrkCd
 QWiTbWAd3tKNF5sKOz8PVlwaWbjDUYugt1VFCfaDhQ2urzSANHvQEVXvSZnw7CqHZIPg
 AC6GP0IBnE9KbIsJ4IF5mfrEZoR0Zj8na+Wg69SjhrKgISIBc4UPFmFyTRycOzWDfx94
 sHfYQPWkqhApsroySrdWSNtTu4XNkF2PydCCcF2OWRPW3RBpPeqZKSgAow0Wu7LoDLHE
 VNSw==
X-Gm-Message-State: AOAM533buNt+ZLiWU7dEqhWim4FFAWvguoB1CCVHgQRn6bPRnqMkpAaj
 uwsXgDweiFX58WvI5PXteDyOChl76KrCKyKLG1Y=
X-Google-Smtp-Source: ABdhPJwAwFyKTWZBNEByGdfE4mVSiUP2K7OvxM69x0Fq4mUmGEi6WMVAeDWuVNdDDca6vu4Gvg3YPhC4XatMWkG74EA=
X-Received: by 2002:aca:2306:: with SMTP id e6mr12413148oie.108.1596823653421; 
 Fri, 07 Aug 2020 11:07:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200730205112.2099429-1-ndesaulniers@google.com>
 <20200730205112.2099429-2-ndesaulniers@google.com>
In-Reply-To: <20200730205112.2099429-2-ndesaulniers@google.com>
From: Nathan Huckleberry <nhuck15@gmail.com>
Date: Fri, 7 Aug 2020 13:07:21 -0500
Message-ID: <CAN=-RxtoXCG5h2qirsrLG2P37pjjMEHgfAv-7+NSVUy9_LPaYQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] ARM: backtrace-clang: check for NULL lr
To: Nick Desaulniers <ndesaulniers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200807_140735_169493_9C1AD3E7 
X-CRM114-Status: GOOD (  19.18  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Chunyan Zhang <zhang.lyra@gmail.com>, Dmitry Safonov <0x7f454c46@gmail.com>,
 Russell King <linux@armlinux.org.uk>, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 Miles Chen <miles.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Lvqiang Huang <lvqiang.huang@unisoc.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jul 30, 2020 at 3:51 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> If the link register was zeroed out, do not attempt to use it for
> address calculations for which there are currently no fixup handlers,
> which can lead to a panic during unwind. Since panicking triggers
> another unwind, this can lead to an infinite loop.  If this occurs
> during start_kernel(), this can prevent a kernel from booting.
>
> commit 59b6359dd92d ("ARM: 8702/1: head-common.S: Clear lr before jumping to start_kernel()")
> intentionally zeros out the link register in __mmap_switched which tail
> calls into start kernel. Test for this condition so that we can stop
> unwinding when initiated within start_kernel() correctly.
>
> Cc: stable@vger.kernel.org
> Fixes: commit 6dc5fd93b2f1 ("ARM: 8900/1: UNWINDER_FRAME_POINTER implementation for Clang")
> Reported-by: Miles Chen <miles.chen@mediatek.com>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>  arch/arm/lib/backtrace-clang.S | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm/lib/backtrace-clang.S b/arch/arm/lib/backtrace-clang.S
> index 6174c45f53a5..5388ac664c12 100644
> --- a/arch/arm/lib/backtrace-clang.S
> +++ b/arch/arm/lib/backtrace-clang.S
> @@ -144,6 +144,8 @@ for_each_frame:     tst     frame, mask             @ Check for address exceptions
>   */
>  1003:          ldr     sv_lr, [sv_fp, #4]      @ get saved lr from next frame
>
> +               tst     sv_lr, #0               @ If there's no previous lr,
> +               beq     finished_setup          @ we're done.
>                 ldr     r0, [sv_lr, #-4]        @ get call instruction
>                 ldr     r3, .Lopcode+4
>                 and     r2, r3, r0              @ is this a bl call
> --
> 2.28.0.163.g6104cc2f0b6-goog
>

Reviewed-by: Nathan Huckleberry <nhuck15@gmail.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
