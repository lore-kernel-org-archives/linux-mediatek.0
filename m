Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A23EC83F2F
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Aug 2024 16:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qcGXTdRd6WPKGiWNucLgLmix94On78py4jzzAZMzxTU=; b=mFDrb81lJeObvAhT/L8Gl8mwNh
	6hklpYcCqqKWfD7NPiYA7u6bhLnKQ75h1E70nh+7ELxfkaIdQNhLJSfiFebZaiFPUGQNgQS8NmB0Y
	oB81kQH4MU/zHbeWCxP8RMUsAcle2VJpt3W75v1FHcRdhtsZ3jHvY0YU0S5dMbSsZPPZlVSqWsjsm
	Vxfqd6xQmVER/Idhx4eIvVA5iOfpPAcrtwIQSm5M7LGP5YwztjVVdtOqSU+1pYyBI0t3BjFSYzrTW
	iVrvkNliwZNsdsAhykeBGxNpE1JukC2iQM88xEImnDOC+MyVLZtZtlIrK8+tdHXRzMIdZIOTP4ld+
	uIIk0k5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sji0V-00000002pvI-2nN7;
	Thu, 29 Aug 2024 16:28:23 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjhzj-00000002pmp-3ucZ;
	Thu, 29 Aug 2024 16:27:37 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-428e0d184b4so7411255e9.2;
        Thu, 29 Aug 2024 09:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724948853; x=1725553653; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qcGXTdRd6WPKGiWNucLgLmix94On78py4jzzAZMzxTU=;
        b=b7kBemL/bv6oMCWAr5rcypPFPC+c+IQHEbSApE8dAUlUaLtcV9bvXirfKsv8R0HCGg
         NtecC2k+qQrg/baaFudgwr87w3He2/QCg1YzxEBRpW7XN7v2QlkZy3qGJNDyw6i8BSXC
         x111qeQhYXxUdyFNYVSBA31T1GEtFCBo8eDKkmpQYGdibcrycVeuHo7G+lqNvUgD8b4h
         ptk+kD1JH/yqcmcWbuk4qYpkxgbv1FVI90KmsT5fTnHTHrr+rltOe3KSRUtsj2BE6edf
         xIcOA1Ed/uLptJSEfuVrxoXtRf4Isq648azVc9BIc5I8cfP3sgPeC0btGQJM2qY/1Eyk
         n16w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724948853; x=1725553653;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qcGXTdRd6WPKGiWNucLgLmix94On78py4jzzAZMzxTU=;
        b=tNu+aOg2z5lJb84JHvviEtu8DcaiVWjd8BFI91VI8IANuIpVWS1nuc7wpSLgitiZ5+
         cJJYp4pvev8VfjwawnuRu+f1sqObBQmgMwBsTkI9/IX1pfaOj6jNqyUxowFPAy0BhAXO
         +s2Ixe5DLfCmu9qLbb2WBxASmYZ7Li/89qXvJCnrh1oxXaj0hHs2NdopcMnmmoSNSajt
         0kIV8ikCItuToE4HPvZT92YeakmHD///cQTmmR05XLrt/gJhnoqBBw1eNLrJu5rQyD8o
         k/VxM5r8jodh+ChiZbNfc5I8w0nwxlgiqcwXOHoGbDXf1srM1FudtX45y9e3k6Cf0Xro
         MmLA==
X-Forwarded-Encrypted: i=1; AJvYcCU5niQ5AtCplOSInmB2g75PtoyGIkgsGTCe2y6oxmiLNvLzTwAVPrGPVkUgZxxYnvEHTPgEAg56YPdwkVStm93+@lists.infradead.org, AJvYcCXJ/lUcrSmdfaOBe71PWAG3WR4J46bijriTdm2/EQdzu7SeyhquNcuHpzEIw7Czri9wB4euo4qw0eyDw68dTVo=@lists.infradead.org
X-Gm-Message-State: AOJu0YxeIIuaJNJsT/LriESGsjP8v06R8XldZHb947x0sMZKvVX7zNHC
	x6HTzscTl1odvScWBgZfcxNun2ZHhsHz21XVr4+KE8SbbhyFwjDn5U39q19yNB/T8xjbawU5Xuw
	9TQGJntW+iSu3aJEKxSO2n8JPJoA=
X-Google-Smtp-Source: AGHT+IHs/WnNtIXb4q/iUBMt25HPdsxvozE/0N9Tj7fQbmDtFbEHALZdaQH6XWo8cNzvQHXSdUV93ADVuFcVF56fPRQ=
X-Received: by 2002:a05:600c:3b87:b0:428:abd:1df1 with SMTP id
 5b1f17b1804b1-42bb02ee46cmr30849495e9.9.1724948853022; Thu, 29 Aug 2024
 09:27:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240821093016.2533-1-Tze-nan.Wu@mediatek.com>
 <CAADnVQLLN9hbQ8FQnX_uWFAVBd7L9HhsQpQymLOmB-dHFR4VRw@mail.gmail.com>
 <3a7864f69b8c1d45a3fe8cda1b1e7a7c85ac9aee.camel@mediatek.com>
 <49d74e2c74e0e1786b976c0b12cb1cdd680c5f58.camel@mediatek.com>
 <CAADnVQLvbMRvCg2disV+_AR-154BwRpeB8Zg_8YpO=7gzL=Trg@mail.gmail.com>
 <Zsk_lGsZBBqbesqS@mini-arch> <2efb1f4751fa47380d51ce538253983974a4947c.camel@mediatek.com>
In-Reply-To: <2efb1f4751fa47380d51ce538253983974a4947c.camel@mediatek.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 29 Aug 2024 09:27:21 -0700
Message-ID: <CAADnVQ+woLxmNNbU--YkVc8kqevBszNbNG3WoOwKQadWvBXF-g@mail.gmail.com>
Subject: Re: [PATCH net v4] bpf, net: Check cgroup_bpf_enabled() only once in do_sock_getsockopt()
To: =?UTF-8?B?VHplLW5hbiBXdSAo5ZCz5r6k5Y2XKQ==?= <Tze-nan.Wu@mediatek.com>
Cc: "sdf@fomichev.me" <sdf@fomichev.me>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kuniyu@amazon.com" <kuniyu@amazon.com>, 
	"bpf@vger.kernel.org" <bpf@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "ast@kernel.org" <ast@kernel.org>, 
	=?UTF-8?B?Q2hlbmctSnVpIFdhbmcgKOeOi+ato+edvyk=?= <Cheng-Jui.Wang@mediatek.com>, 
	=?UTF-8?B?Q2hlbi1ZYW8gQ2hhbmcgKOW8teemjuiAgCk=?= <Chen-Yao.Chang@mediatek.com>, 
	wsd_upstream <wsd_upstream@mediatek.com>, "andrii@kernel.org" <andrii@kernel.org>, 
	=?UTF-8?B?Qm9idWxlIENoYW5nICjlvLXlvJjnvqkp?= <bobule.chang@mediatek.com>, 
	"jolsa@kernel.org" <jolsa@kernel.org>, "daniel@iogearbox.net" <daniel@iogearbox.net>, 
	"john.fastabend@gmail.com" <john.fastabend@gmail.com>, "song@kernel.org" <song@kernel.org>, 
	"kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>, 
	"edumazet@google.com" <edumazet@google.com>, =?UTF-8?B?WWFuZ2h1aSBMaSAo5p2O6Ziz6L6JKQ==?= <Yanghui.Li@mediatek.com>, 
	"martin.lau@linux.dev" <martin.lau@linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, "eddyz87@gmail.com" <eddyz87@gmail.com>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "davem@davemloft.net" <davem@davemloft.net>, 
	"kpsingh@kernel.org" <kpsingh@kernel.org>, 
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>, 
	"yonghong.song@linux.dev" <yonghong.song@linux.dev>, "haoluo@google.com" <haoluo@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240829_092736_001227_F6C81BDF 
X-CRM114-Status: GOOD (  29.66  )
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

On Thu, Aug 29, 2024 at 5:45=E2=80=AFAM Tze-nan Wu (=E5=90=B3=E6=BE=A4=E5=
=8D=97)
<Tze-nan.Wu@mediatek.com> wrote:
>
> On Fri, 2024-08-23 at 19:04 -0700, Stanislav Fomichev wrote:
> >
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >  On 08/22, Alexei Starovoitov wrote:
> > > On Thu, Aug 22, 2024 at 12:02=E2=80=AFAM Tze-nan Wu (=E5=90=B3=E6=BE=
=A4=E5=8D=97)
> > > <Tze-nan.Wu@mediatek.com> wrote:
> > > >
> > > >
> > > > BTW, If this should be handled in kernel, modification shown
> > below
> > > > could fix the issue without breaking the "static_branch" usage in
> > both
> > > > macros:
> > > >
> > > >
> > > > +++ /include/linux/bpf-cgroup.h:
> > > >     -#define BPF_CGROUP_GETSOCKOPT_MAX_OPTLEN(optlen)
> > > >     +#define BPF_CGROUP_GETSOCKOPT_MAX_OPTLEN(optlen, compat)
> > > >      ({
> > > >             int __ret =3D 0;
> > > >             if (cgroup_bpf_enabled(CGROUP_GETSOCKOPT))
> > > >                 copy_from_sockptr(&__ret, optlen, sizeof(int));
> > > >      +      else
> > > >      +          *compat =3D true;
> > > >             __ret;
> > > >      })
> > > >
> > > >     #define BPF_CGROUP_RUN_PROG_GETSOCKOPT(sock, level, optname,
> > > > optval, optlen, max_optlen, retval)
> > > >      ({
> > > >          int __ret =3D retval;
> > > >     -    if (cgroup_bpf_enabled(CGROUP_GETSOCKOPT) &&
> > > >     -        cgroup_bpf_sock_enabled(sock, CGROUP_GETSOCKOPT))
> > > >     +    if (cgroup_bpf_sock_enabled(sock, CGROUP_GETSOCKOPT))
> > > >              if (!(sock)->sk_prot->bpf_bypass_getsockopt ||
> > > >                ...
> > > >
> > > >   +++ /net/socket.c:
> > > >     int do_sock_getsockopt(struct socket *sock, bool compat, int
> > level,
> > > >      {
> > > >         ...
> > > >         ...
> > > >     +     /* The meaning of `compat` variable could be changed
> > here
> > > >     +      * to indicate if cgroup_bpf_enabled(CGROUP_SOCK_OPS)
> > is
> > > > false.
> > > >     +      */
> > > >         if (!compat)
> > > >     -       max_optlen =3D
> > BPF_CGROUP_GETSOCKOPT_MAX_OPTLEN(optlen);
> > > >     +       max_optlen =3D BPF_CGROUP_GETSOCKOPT_MAX_OPTLEN(optlen,
> > > > &compat);
> > >
> > > This is better, but it's still quite a hack. Let's not override it.
> > > We can have another bool, but the question:
> > > do we really need BPF_CGROUP_GETSOCKOPT_MAX_OPTLEN  ?
> > > copy_from_sockptr(&__ret, optlen, sizeof(int));
> > > should be fast enough to do it unconditionally.
> > > What are we saving here?
> > >
> > > Stan ?
> >
> > Agreed, most likely nobody would notice :-)
>
> Sorry for my late reply, just have the mailer fixed.
>
> If it is feasible to make the `copy_from_sockptr` unconditionally,
> should I submit a new patch that resolve the issue by removing
> `BPF_CGROUP_GETSOCKOPT_MAX_OPTLEN`? Patch A shown as below.
>
>   +++ /net/socket.c:
>    int do_sock_getsockopt(...)
>    {
>   -     int max_optlen __maybe_unused;
>   +     int max_optlen __maybe_unused =3D 0;
>         const struct proto_ops *ops;
>         int err;
>   ...
>   ...
>         if (!compat) <=3D=3D wonder if we should keep the condition here?
>   -         max_optlen =3D BPF_CGROUP_GETSOCKOPT_MAX_OPTLEN(optlen);
>   +         copy_from_sockptr(&max_optlen, optlen, sizeof(int));

This one.
And delete the macro from bpf-cgroup.h

