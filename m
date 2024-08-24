Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0843CC5321E
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Aug 2024 02:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1m+RyyeVq2vKKoA8+4isEUsNBf+vWhzfSvt6LSdw9/k=; b=pkxDhm+hrLoVwgp29rbSAcD/4r
	fgpXmulJfI3HngIYNPgPm2VLAr/Ooujtu5l0N7DTqv6rgxC9ZPiGf7z3pTwFPI5rA1oYqx/clkyHw
	b8bOdLJOM46PBT86kA0zfD9TGc5LunE3HCmn55hQjItQykUeNMsnxXSasK+dShawfVDjhdOMTMzX7
	eauLCNLIacSvTBVrfKdvANzmG3rEKFuTEmzlUmV9eQOfYShzmZn33Jrl6xCNRtDOtLglDgBZ/1tfp
	HRplhZ7dyavZUiHhd9qEFANmXyJVTGoDDCz0hPW8LfxqnkbHvKZpiXcbutBfqlIa2MEpHuyQeoNge
	WMZ3qwQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shg9B-00000001ClU-0Dow;
	Sat, 24 Aug 2024 02:04:57 +0000
Received: from mail-pf1-f181.google.com ([209.85.210.181])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shg8N-00000001CeU-3pf0;
	Sat, 24 Aug 2024 02:04:09 +0000
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-714226888dfso2305414b3a.1;
        Fri, 23 Aug 2024 19:04:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724465046; x=1725069846;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1m+RyyeVq2vKKoA8+4isEUsNBf+vWhzfSvt6LSdw9/k=;
        b=NF684quOoJYSaw3aFZi1F1ZqiaPwkJpURX89vtXdrDxNJHDYtkUulV+wItdWuOXlEv
         sKHFzV2ncKS2opFqRBTLSP9sV9XJgK4Rn0oFF9VtZQDhzX+65iJYFeULQJG0x5xHnPiR
         Bl91DSiN6TxgVLK33WKkwE96+ewDLI1kmZdxTyFihxxmA7DiHMKTu5wHzjSyzHTRFU+F
         T//9+px4S9XoM8zmICnsy6Ce/9VquWpuCyA5bmAr9UmhBts+5WuPmSTbbsUEw1jiln7l
         50/gpQUoecqCmf/2zItEk62cKL0SADsBeT/PhV5Kp70Wa80fTLZ53OI6PgQRkXbQVByP
         jvNQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+ClIh+D4odZ8F/qRrojMScEJN5XskgbPLOCMh6euHTnjunykmke91asrILMxDMsmXcQwz5fUkkWT3+2bDSNfQ@lists.infradead.org, AJvYcCWqFjFiyP5HSzPTKCp7oBig0lXgSM/R75F7EsNfarxKNNhQPW2x9I/rWxm0kaFyBtpyI7MYurbZhg6tksAv1Gk=@lists.infradead.org
X-Gm-Message-State: AOJu0YwbjtDdVOu5UdQqu24tWJRnyHwWlrdndn/k8DrysxXuVAL1hCcq
	Z3PkUxpWWZ+z08NN9XQ24tKawSdstpSSqXEidYUPjbqG0tFCB+Y=
X-Google-Smtp-Source: AGHT+IHIZyeBM3Hl85jWwMdJX+SUb22b92N+zGjq37DFSit0JMCfEm3aWfiRw4k5sOQm4Tu/80NwxQ==
X-Received: by 2002:a05:6a00:124c:b0:706:61d5:2792 with SMTP id d2e1a72fcca58-7144579d85amr5466242b3a.8.1724465046198;
        Fri, 23 Aug 2024 19:04:06 -0700 (PDT)
Received: from localhost ([2601:646:9e00:f56e:73b6:7410:eb24:cba4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9acdcf7dsm3351501a12.50.2024.08.23.19.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 19:04:05 -0700 (PDT)
Date: Fri, 23 Aug 2024 19:04:04 -0700
From: Stanislav Fomichev <sdf@fomichev.me>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Tze-nan Wu =?utf-8?B?KOWQs+a+pOWNlyk=?= <Tze-nan.Wu@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"bpf@vger.kernel.org" <bpf@vger.kernel.org>,
	"kuniyu@amazon.com" <kuniyu@amazon.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"ast@kernel.org" <ast@kernel.org>,
	Cheng-Jui Wang =?utf-8?B?KOeOi+ato+edvyk=?= <Cheng-Jui.Wang@mediatek.com>,
	wsd_upstream <wsd_upstream@mediatek.com>,
	"andrii@kernel.org" <andrii@kernel.org>,
	Bobule Chang =?utf-8?B?KOW8teW8mOe+qSk=?= <bobule.chang@mediatek.com>,
	"jolsa@kernel.org" <jolsa@kernel.org>,
	"daniel@iogearbox.net" <daniel@iogearbox.net>,
	"john.fastabend@gmail.com" <john.fastabend@gmail.com>,
	"song@kernel.org" <song@kernel.org>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"edumazet@google.com" <edumazet@google.com>,
	Yanghui Li =?utf-8?B?KOadjumYs+i+iSk=?= <Yanghui.Li@mediatek.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"eddyz87@gmail.com" <eddyz87@gmail.com>,
	"martin.lau@linux.dev" <martin.lau@linux.dev>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"kpsingh@kernel.org" <kpsingh@kernel.org>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>,
	"yonghong.song@linux.dev" <yonghong.song@linux.dev>,
	"haoluo@google.com" <haoluo@google.com>
Subject: Re: [PATCH net v4] bpf, net: Check cgroup_bpf_enabled() only once in
 do_sock_getsockopt()
Message-ID: <Zsk_lGsZBBqbesqS@mini-arch>
References: <20240821093016.2533-1-Tze-nan.Wu@mediatek.com>
 <CAADnVQLLN9hbQ8FQnX_uWFAVBd7L9HhsQpQymLOmB-dHFR4VRw@mail.gmail.com>
 <3a7864f69b8c1d45a3fe8cda1b1e7a7c85ac9aee.camel@mediatek.com>
 <49d74e2c74e0e1786b976c0b12cb1cdd680c5f58.camel@mediatek.com>
 <CAADnVQLvbMRvCg2disV+_AR-154BwRpeB8Zg_8YpO=7gzL=Trg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAADnVQLvbMRvCg2disV+_AR-154BwRpeB8Zg_8YpO=7gzL=Trg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_190407_977774_CA3A5F95 
X-CRM114-Status: GOOD (  20.32  )
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

On 08/22, Alexei Starovoitov wrote:
> On Thu, Aug 22, 2024 at 12:02 AM Tze-nan Wu (吳澤南)
> <Tze-nan.Wu@mediatek.com> wrote:
> >
> >
> > BTW, If this should be handled in kernel, modification shown below
> > could fix the issue without breaking the "static_branch" usage in both
> > macros:
> >
> >
> > +++ /include/linux/bpf-cgroup.h:
> >     -#define BPF_CGROUP_GETSOCKOPT_MAX_OPTLEN(optlen)
> >     +#define BPF_CGROUP_GETSOCKOPT_MAX_OPTLEN(optlen, compat)
> >      ({
> >             int __ret = 0;
> >             if (cgroup_bpf_enabled(CGROUP_GETSOCKOPT))
> >                 copy_from_sockptr(&__ret, optlen, sizeof(int));
> >      +      else
> >      +          *compat = true;
> >             __ret;
> >      })
> >
> >     #define BPF_CGROUP_RUN_PROG_GETSOCKOPT(sock, level, optname,
> > optval, optlen, max_optlen, retval)
> >      ({
> >          int __ret = retval;
> >     -    if (cgroup_bpf_enabled(CGROUP_GETSOCKOPT) &&
> >     -        cgroup_bpf_sock_enabled(sock, CGROUP_GETSOCKOPT))
> >     +    if (cgroup_bpf_sock_enabled(sock, CGROUP_GETSOCKOPT))
> >              if (!(sock)->sk_prot->bpf_bypass_getsockopt ||
> >                ...
> >
> >   +++ /net/socket.c:
> >     int do_sock_getsockopt(struct socket *sock, bool compat, int level,
> >      {
> >         ...
> >         ...
> >     +     /* The meaning of `compat` variable could be changed here
> >     +      * to indicate if cgroup_bpf_enabled(CGROUP_SOCK_OPS) is
> > false.
> >     +      */
> >         if (!compat)
> >     -       max_optlen = BPF_CGROUP_GETSOCKOPT_MAX_OPTLEN(optlen);
> >     +       max_optlen = BPF_CGROUP_GETSOCKOPT_MAX_OPTLEN(optlen,
> > &compat);
> 
> This is better, but it's still quite a hack. Let's not override it.
> We can have another bool, but the question:
> do we really need BPF_CGROUP_GETSOCKOPT_MAX_OPTLEN  ?
> copy_from_sockptr(&__ret, optlen, sizeof(int));
> should be fast enough to do it unconditionally.
> What are we saving here?
> 
> Stan ?

Agreed, most likely nobody would notice :-)

