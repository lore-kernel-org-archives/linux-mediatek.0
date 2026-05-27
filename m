Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B0DCD4F54
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 May 2026 16:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mzeRY6sPehjEn+BPgx6Xi1es20BdfMexE0A8mncyA7U=; b=JPQtw77LXX+brxzrFcokpdqA9t
	fJ+RIT6wE2vhpkG9R6NL8OHU3CUKoexneT96PJQxaJ0APPLwqVOyH7g2eTSuc+zKZJxwV26UM/JAb
	HF08+kd4PsZrwWpxTycQ/ScBJuFJeIyeEpINRAS32nCMA3ayQWGsGVAZZjrOfPESd5VvwHWGwsQ0z
	nJtSoBZ1LNJoIiDBG74VhS9DO9vlunPFKkF/w3xURbjIE4zPM6UXgVi5+H4n7V9oD53EellrYOAl2
	+wQx5PqHxJXbM1P62/fDUXYZYLWk8cS7cDMF5IbY4NoH/fu4FBST8WsodpgXAI246xnWUqi1kbTtQ
	Cg63f5ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSGuM-00000004U6n-12S8;
	Wed, 27 May 2026 16:15:02 +0000
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSGuJ-00000004U5j-1usU
	for linux-mediatek@lists.infradead.org;
	Wed, 27 May 2026 16:15:00 +0000
Received: by mail-yx1-xb132.google.com with SMTP id 956f58d0204a3-65dead17c24so11070766d50.2
        for <linux-mediatek@lists.infradead.org>; Wed, 27 May 2026 09:14:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779898498; cv=none;
        d=google.com; s=arc-20240605;
        b=QivK9NEqE2z1nLJcspy2wU8hABWSyJ3GDd8tjEeLC/u7FldWwCON5Xt2QNN8s0SSyD
         gO85TFGsMAzR0TObJWRExH+upGp2Q36goxD9gdkmukhZP3UOtRC928JH+1/2W274CwGa
         DNssJ5+t4GL5JNdJYnZosKkguOJ3joll5EK3JS6uWl2O6HcDy+DZwBSw9+BzmBOqlB7W
         9R6h0Sr+iHtpXliDwcWPhRdarB5WiDXxL1wrjgzH06TCOYU5omi0/gJYL8kuFN8CfWJd
         mo1Ta/rYufpyOLvfQaMh82TkjPAQ4wAfs5arC+eZMceqPHg7ruLNwK5tbBkRhBVvQElZ
         FxVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mzeRY6sPehjEn+BPgx6Xi1es20BdfMexE0A8mncyA7U=;
        fh=OPuS5zaQsBLZJkExeq9ynVYZa/aA2n7XyJqunhgRp6w=;
        b=iEfMK4R0yAR1l6Ze+L22ODvmxXoJdwFnUT7sFlKwhZVYcoohpaO99sDrg/uLtnTqEm
         RABJHi+78vtqLDL6XC+WiZezzl0IX/xgEqwuetwk7o+gh78aTlYLfue5shQlJIy/uRxh
         +otOckc6nJreziy0nedAQwP1maEh1DpqmSOISB8cUotwjTJdwHEkxrIXQnp9C00m0pRx
         q12cxBsua+athpYSG4ND26Df/pC2rbRaCfWdDsYRl2kdv6s5SfRQZe79GQXX0Qgj4W8s
         CUd6inzlX+XFEsSZnR6otH26XZ25tS/y0I1b0pwDaYU+edNP0d/8CPoNEai2uH9UzwYV
         8Y/w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779898498; x=1780503298; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mzeRY6sPehjEn+BPgx6Xi1es20BdfMexE0A8mncyA7U=;
        b=NKC7JDGNDTtBtka23RsVyxV8cmyma6n/mJkcsSjs2uP9S0qTj/aquOIY698xobtngA
         +42X7zCc24LC0aBHoEqLlWnwESacqDgMQSMRFT5rplMP8cT0WBrDcZZQFkaisEM3UCSQ
         iFhzUx5RImrhBv/gvdJpNEkxnaoiDdW3uBG6N4Kt1rL45SfC53qQliSjSCAdDlSo8rzs
         zuSL99I1sdQtlRxQOzBoSr+CMmhII2F33nOSUGzy8SLmRdFI0HiKH1th1coYI/A/YT52
         0aMr+cj4p3YuXdZf00kaschGc0giM8xiZjlIUYHTUIsFoRjubQMqkIifkhIWLUlsXKXU
         t/Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779898498; x=1780503298;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mzeRY6sPehjEn+BPgx6Xi1es20BdfMexE0A8mncyA7U=;
        b=XKnp6TNAnA1UCPi0zUjEmd5fKzxIYNhInvX1MeVLVJGMiDtsisxKH5I0xVzuUZoi/5
         9aySphei4ohCOmG+QsvfuQNyhFRYjiC34ZuEVf5q0uUThll69sIT+r6C3M9goZ5jadH3
         PxYNrRRcqZswS7GtHPS0IDol1W57zwSR3wdVj/+3jK1jBdMcZEn/5Qo2vL2fNor77GtV
         Be2oYGUYUQXeq/eYCDkMv4AYlSZGA/98a/+s8h6brWxQGTzsxJRCOn8imZX0QnxvaH/5
         UIU2iLaNs4RL4trWS/E6xSP+PDHJwvydF9tjMwb3HhSLH/S2aa04BwPpruzaY9m0yqVH
         vDKA==
X-Forwarded-Encrypted: i=1; AFNElJ/8wQZzmsVsiQLH8nWLYVk0zpGECqNT0QDum+5t7rYuRUwacIkcsREsJJUWttP4TDjltuK0zhI8gJ9VXm7AZA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1ldqv1PajUTtgmvWBObyR/OXgqZoDvL1AzblSHYxzJ0wFTCYQ
	9zmefdFjPAhjv/kIACPoVXJlMUodpCU2hyCOa4OZTEF7rkfKBTZtQXHHrJTTmJqzonKLeO6a6Sw
	JT4XhYCaabWm5/Qi13SH3cH0RGNFzs1o=
X-Gm-Gg: Acq92OFU7bEFmKwr+90/Iini+mkIilarvLg4x12HPeE9b3/y/OMOOUK1IDR94ELxVQg
	z4CgBmtaiGxfNO/GOz/fPuPPl8CKNZoW2k1BMASkXY4NJvp+Xo7h+GBVr52pdbDBNP9clDn1JSr
	wU4lKSlMvKS9c9oEkq5RfmAUKNkFwtNeXT9uCzGUWsi6eCRyeKctjKjr4WzmCVnrAcZ2sTfX6iM
	0D53q0oCoaXPMg7ngpws8OkERWMwa6v/gLA7rQ15YjndK8Tc0rBolSWFtoQAEj7pOVOsQIVv+C3
	EBKZJ6RsB1v2hzp7LDgh6m0+AOhhFpeVMDoCLvSe3QQrZn4b+aRzd8LZ8hhH3VUPSMI7rCEbbLP
	3npy3vW0=
X-Received: by 2002:a05:690e:d02:b0:64e:f106:60ea with SMTP id
 956f58d0204a3-65ec9938bb6mr23186309d50.44.1779898497803; Wed, 27 May 2026
 09:14:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260526060138.3924-1-adibente@gmail.com> <ahaek23tB7D8tQUe@strlen.de>
In-Reply-To: <ahaek23tB7D8tQUe@strlen.de>
From: =?UTF-8?Q?Adrian_Ben=C8=9Be?= <adibente@gmail.com>
Date: Wed, 27 May 2026 19:14:45 +0300
X-Gm-Features: AVHnY4KoQXI1OIdlCwJpu_wAoEyKtvQ1_8Zwx8HehnmyUWKWVvT2QHSF5yMJ68c
Message-ID: <CAC2HPwt_3D7k7tYr8OqNiguc-jMF3PEKtayFKmvOp37M2=QCZA@mail.gmail.com>
Subject: Re: [RFC PATCH net] netfilter: flowtable: fix offloaded ct timeout
 never being extended
To: Florian Westphal <fw@strlen.de>
Cc: pablo@netfilter.org, netfilter-devel@vger.kernel.org, phil@nwl.cc, 
	nbd@nbd.name, sean.wang@mediatek.com, lorenzo@kernel.org, 
	andrew+netdev@lunn.ch, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, daniel@makrotopia.org, 
	coreteam@netfilter.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_091459_505464_99E36EF8 
X-CRM114-Status: GOOD (  12.87  )
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

> I guess we need to open-code expires, something like this (not even
> compile tested). Also see https://sashiko.dev/#/patchset/20260526060138.3924-1-adibente%40gmail.com
>
> diff --git a/net/netfilter/nf_flow_table_core.c b/net/netfilter/nf_flow_table_core.c
> --- a/net/netfilter/nf_flow_table_core.c
> +++ b/net/netfilter/nf_flow_table_core.c
> @@ -506,7 +506,12 @@ static u32 nf_flow_table_tcp_timeout(const struct nf_conn *ct)
>  static void nf_flow_table_extend_ct_timeout(struct nf_conn *ct)
>  {
>         static const u32 min_timeout = 5 * 60 * HZ;
> -       u32 expires = nf_ct_expires(ct);
> +       u32 ct_timeout = READ_ONCE(ct->timeout);
> +       s32 expires;
> +
> +       expires = ct_timeout - nfct_time_stamp;
> +       if (expires <= 0) /* already expired */
> +               return;
>
>         /* normal case: large enough timeout, nothing to do. */
>         if (likely(expires >= min_timeout))
> @@ -524,7 +529,7 @@ static void nf_flow_table_extend_ct_timeout(struct nf_conn *ct)
>         if (nf_ct_is_confirmed(ct) &&
>             test_bit(IPS_OFFLOAD_BIT, &ct->status)) {
>                 u8 l4proto = nf_ct_protonum(ct);
> -               u32 new_timeout = true;
> +               u32 new_timeout = 1;
>
>                 switch (l4proto) {
>                 case IPPROTO_UDP:
> @@ -549,7 +554,7 @@ static void nf_flow_table_extend_ct_timeout(struct nf_conn *ct)
>                  */
>                 if (new_timeout) {
>                         new_timeout += nfct_time_stamp;
> -                       cmpxchg(&ct->timeout, expires, new_timeout);
> +                       cmpxchg(&ct->timeout, ct_timeout, new_timeout);
>                 }
>         }
>

Thanks. Applied your diff to my OpenWrt 6.18 tree with one small
adjustment: changed min_timeout from u32 to s32 so the
"expires >= min_timeout" comparison has both operands signed.
Compiles clean.

Tested on MT7986 with the WED-offloaded flows that originally
reproduced the 300s drop. The flows now stay up well past 300s with
normal offloaded traffic, solution works fine.

I'll send v2 with this diff and Suggested-by: you, unless you'd
rather submit it yourself.

