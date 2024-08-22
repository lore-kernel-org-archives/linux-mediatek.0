Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E5C0C52D7C
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Aug 2024 16:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oCbWOITMko0wEoeUzzqieqzDXgm1IIaSCqGTrIEvCj0=; b=jaSg15I1WSQ4EDTTbEHcp3gORn
	pKMIHLHDPgN5q1IMWS//MCS9fPbChT9XOsgFw7WaAxKGC4Fp8+IuDuDAB4BWHhYn0e+ZwsodDhmFs
	peZ2V7IUD+OaQcZbyB+pPa6zmp2OD710nP04RC2kcIeY68xydsz8FoVD90PBcN4Hxv9OHZfMnd4kW
	aobG+VKNnJkZdDTW7iy9rQgl7Im8ez3hMHGcmsx+T/6p8bWbcoCcxV1ZB2iyT65RrIRaitRGc3UGt
	8Zsz7IlA9b3Bkf2b1PSVlF9MH+DLgTyLKRiK8NHDxQDRf0W1zOEP0KyEYPXn7iuOqhxMok2jp/FXd
	iKSIwr+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shALo-0000000DWDJ-0UEK;
	Thu, 22 Aug 2024 16:07:52 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shAEy-0000000DUFW-3uXp;
	Thu, 22 Aug 2024 16:00:50 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-42ab880b73eso7709115e9.0;
        Thu, 22 Aug 2024 09:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724342447; x=1724947247; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oCbWOITMko0wEoeUzzqieqzDXgm1IIaSCqGTrIEvCj0=;
        b=ZW+pn0Yr/jF5Uw9qb5DvLXbznxpRmJIOYpyoqWQiYmuLnsaQ8DCloRbJSpIxWpzuJr
         GkDKjxWzlRAMt7j95PAaBwFKZj3N7fhob1gQwgNJTzfo3LG7mVZzcS3HRt/pq6zifEed
         ftEF1+NVrrqAQIhCf9bUYZpL+2cS7ByKYDzhR4T5m2lj3ez4j0g3KQ09CKl/jDzAsBqy
         kSUEetn0pDO3LayJEtgDCW2AFn/e2dXXY6s9bFG0fmFKWAZUQGve2wN0HydhNzl+Qtgk
         UtH0Px1TXic2zdVNG8Ce9DfiteVveJltoWYtxxVmryLZ0Yh4vWuaiQDOggHABiYio8kg
         3FGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724342447; x=1724947247;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oCbWOITMko0wEoeUzzqieqzDXgm1IIaSCqGTrIEvCj0=;
        b=cj1EM2dmm90lk7165ek0ACaLtsM4xx197w94tXkm9mjrPACsm+SJMOfQ/QOaQs57Y5
         EcgcHU86nnN/mkwGmc/e8EdH2RDRweSSeDJAgjyqEvnahM2qwez06Y7vOv2WxrcdlI1e
         JlKduPyhdtD/KNln+p9eQHf/j/0f6mKyhET+gbsiOSaRJW3nk0OsldrqhpPiAVHd7LOg
         lU284OUlVLHQMfRYrrA2Rb0eCHxbGq4uMSBH+mDWZ/hamtWwCh5sXqNhp5atMTKuSvAU
         5LT1kenQciZIrnD5bnkd80w3R6STVNHFgZa69VNPMPfLrdOofEp0teYMAKMidjFVYJwc
         WI4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWPGjLo7w/EG5jTZR0e93vv2FONmcisHIbvu2IopghIYy93cF5Q1xfARsaXmxuRCBWFb6/g20LhPgk6XHMQGA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxAdU8YyeQePGvldadKZg9J2kqlkczUKSvYwxxW/ewnHDl1GF05
	6TcJ2WM2y4SLJAYFJu4IGKuSamoMSc6nFWGA0BM5R7Kv76bUIob39nNz1IKyIylFFRP13ozj/TN
	CDPlly997fI6j+Hh3R+QTBO9jbhg=
X-Google-Smtp-Source: AGHT+IHcNIR54GEsYVfVx+0ed5NoDx9ZmcggKZXL1hughSPoIlUuhTZHJILgoDg7E/MKuN45stdeDEAckEYHAP13rM8=
X-Received: by 2002:a05:600c:3b1e:b0:427:fa39:b0db with SMTP id
 5b1f17b1804b1-42abd245821mr39428145e9.27.1724342446903; Thu, 22 Aug 2024
 09:00:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240821093016.2533-1-Tze-nan.Wu@mediatek.com>
 <CAADnVQLLN9hbQ8FQnX_uWFAVBd7L9HhsQpQymLOmB-dHFR4VRw@mail.gmail.com>
 <3a7864f69b8c1d45a3fe8cda1b1e7a7c85ac9aee.camel@mediatek.com> <49d74e2c74e0e1786b976c0b12cb1cdd680c5f58.camel@mediatek.com>
In-Reply-To: <49d74e2c74e0e1786b976c0b12cb1cdd680c5f58.camel@mediatek.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 22 Aug 2024 09:00:35 -0700
Message-ID: <CAADnVQLvbMRvCg2disV+_AR-154BwRpeB8Zg_8YpO=7gzL=Trg@mail.gmail.com>
Subject: Re: [PATCH net v4] bpf, net: Check cgroup_bpf_enabled() only once in do_sock_getsockopt()
To: =?UTF-8?B?VHplLW5hbiBXdSAo5ZCz5r6k5Y2XKQ==?= <Tze-nan.Wu@mediatek.com>, 
	Stanislav Fomichev <sdf@fomichev.me>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, 
	"kuniyu@amazon.com" <kuniyu@amazon.com>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "ast@kernel.org" <ast@kernel.org>, 
	=?UTF-8?B?Q2hlbmctSnVpIFdhbmcgKOeOi+ato+edvyk=?= <Cheng-Jui.Wang@mediatek.com>, 
	wsd_upstream <wsd_upstream@mediatek.com>, "andrii@kernel.org" <andrii@kernel.org>, 
	=?UTF-8?B?Qm9idWxlIENoYW5nICjlvLXlvJjnvqkp?= <bobule.chang@mediatek.com>, 
	"jolsa@kernel.org" <jolsa@kernel.org>, "daniel@iogearbox.net" <daniel@iogearbox.net>, 
	"john.fastabend@gmail.com" <john.fastabend@gmail.com>, "song@kernel.org" <song@kernel.org>, 
	"kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>, 
	"edumazet@google.com" <edumazet@google.com>, =?UTF-8?B?WWFuZ2h1aSBMaSAo5p2O6Ziz6L6JKQ==?= <Yanghui.Li@mediatek.com>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, "eddyz87@gmail.com" <eddyz87@gmail.com>, 
	"martin.lau@linux.dev" <martin.lau@linux.dev>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"davem@davemloft.net" <davem@davemloft.net>, "kpsingh@kernel.org" <kpsingh@kernel.org>, 
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>, 
	"yonghong.song@linux.dev" <yonghong.song@linux.dev>, "haoluo@google.com" <haoluo@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_090048_992724_78829CD6 
X-CRM114-Status: GOOD (  17.28  )
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

On Thu, Aug 22, 2024 at 12:02=E2=80=AFAM Tze-nan Wu (=E5=90=B3=E6=BE=A4=E5=
=8D=97)
<Tze-nan.Wu@mediatek.com> wrote:
>
>
> BTW, If this should be handled in kernel, modification shown below
> could fix the issue without breaking the "static_branch" usage in both
> macros:
>
>
> +++ /include/linux/bpf-cgroup.h:
>     -#define BPF_CGROUP_GETSOCKOPT_MAX_OPTLEN(optlen)
>     +#define BPF_CGROUP_GETSOCKOPT_MAX_OPTLEN(optlen, compat)
>      ({
>             int __ret =3D 0;
>             if (cgroup_bpf_enabled(CGROUP_GETSOCKOPT))
>                 copy_from_sockptr(&__ret, optlen, sizeof(int));
>      +      else
>      +          *compat =3D true;
>             __ret;
>      })
>
>     #define BPF_CGROUP_RUN_PROG_GETSOCKOPT(sock, level, optname,
> optval, optlen, max_optlen, retval)
>      ({
>          int __ret =3D retval;
>     -    if (cgroup_bpf_enabled(CGROUP_GETSOCKOPT) &&
>     -        cgroup_bpf_sock_enabled(sock, CGROUP_GETSOCKOPT))
>     +    if (cgroup_bpf_sock_enabled(sock, CGROUP_GETSOCKOPT))
>              if (!(sock)->sk_prot->bpf_bypass_getsockopt ||
>                ...
>
>   +++ /net/socket.c:
>     int do_sock_getsockopt(struct socket *sock, bool compat, int level,
>      {
>         ...
>         ...
>     +     /* The meaning of `compat` variable could be changed here
>     +      * to indicate if cgroup_bpf_enabled(CGROUP_SOCK_OPS) is
> false.
>     +      */
>         if (!compat)
>     -       max_optlen =3D BPF_CGROUP_GETSOCKOPT_MAX_OPTLEN(optlen);
>     +       max_optlen =3D BPF_CGROUP_GETSOCKOPT_MAX_OPTLEN(optlen,
> &compat);

This is better, but it's still quite a hack. Let's not override it.
We can have another bool, but the question:
do we really need BPF_CGROUP_GETSOCKOPT_MAX_OPTLEN  ?
copy_from_sockptr(&__ret, optlen, sizeof(int));
should be fast enough to do it unconditionally.
What are we saving here?

Stan ?


>
> > Thanks,
> > --tze-nan
>
> *********** MEDIATEK Confidentiality Notice ***********

Pls fix your mailer. Such a footer is not appropriate for the public
mailing list.

