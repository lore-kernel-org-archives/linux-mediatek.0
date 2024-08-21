Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 007ECC52D6F
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Aug 2024 21:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vPNQ3r1NoMlaj0xx7dLL0YCAm3rSnwF6hmKGBdiyvbM=; b=Y8NjjAl+OEixS45G7IpiiHtK3n
	KvftDwQYv2jnGCLNMVfltFL25hoVejCovVItGwuau5uJ2T/k6OyE5u2dPcQB9xVfuU2T/mhFx6KnD
	J4b68jDlhLoNgr1+lRybydC9Z5peltHXEcTFoNO0IPEY4AmgwdlBND/GJ/hmi8qiFWlDq5HNLECeO
	R3oNzbZfOzVyxymSbpfW1HfMJ+mAwKf3+qXOB4gHqiNO4aczS7Ru5IphCIs2jJqRvG+hFhH1OpmQM
	ZYWONOwvq2onI0u7Ai4urZBjwLSDatMFJ8iC/k0TVel5RV0frFMSM2591qrUYEZh78757ML/4FNbk
	VVic481Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgsSL-0000000ALqP-13nv;
	Wed, 21 Aug 2024 21:01:25 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgsSI-0000000ALpJ-03sw;
	Wed, 21 Aug 2024 21:01:23 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3718b5e9c4fso34355f8f.0;
        Wed, 21 Aug 2024 14:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724274080; x=1724878880; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vPNQ3r1NoMlaj0xx7dLL0YCAm3rSnwF6hmKGBdiyvbM=;
        b=Zx7/LuQUrTyC0zgL1aS0WbVsIWRftHoF1860MbZLjjR566ing6W2VbKImdOJ65566I
         AYvjRLf24wbpAZYzoMGvsGal1Jvb5bUIa8iihJ3uTRbASlCCjvZLyvLmxBN8oXVDMMkE
         oS1t9U8gTFxUKeuCes3o2FtabVjSW6w0HKA736jUH/y9I7xQG0J8dOA7rnODYojcdhPI
         G5tstXczT8//hnOrcgMdYMahQFqqWFdwgEF63x/FVnI56x1paUcEZ73J6RlmIQ8x9gPi
         QpGh7NB8ZFNx2tilNwz9U8KvlEVPE8q6SO9MsusxTW4gZep2ptHRYf47emcVQh3FRDFF
         /Q6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724274080; x=1724878880;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vPNQ3r1NoMlaj0xx7dLL0YCAm3rSnwF6hmKGBdiyvbM=;
        b=a9x3SYdQ/4+bkwrIrmVJ8SRBGXaRJP3PTQ+k0Ct0Wc2+JIlXUm0tq89PK4xBNcMwRo
         AP9HNLPF/U+fo3Ru1LpkLcm1EaG0eFPaZtJ+0uGZhuuyRgspq+fJG0bv+fo7oYsV1tDm
         3PNnnGUwyC0UHFTXW99lVHB06+AZyogiCy8289CTE06kM7QJD7MjDohVqXxgI7ViWmp7
         cOQik4Y2ZT3j0IeSVNXk9OsD6c/0ikbl3L7RaBn+wKSbMvdHrUDX7Ug1hTpWZVOkwDeZ
         kGPseyBsk1ktLxK+49HK3dprXY+HWG7iF0x1AR+v5iydGtyE31WbGgmzgvBkPzrL1Jre
         GvCw==
X-Forwarded-Encrypted: i=1; AJvYcCWWJ8q6G1WFbK2+oxs/qvGbV7POOJKTITdCOBdXpvTAgGqzWqmJPqSal4uZJCI6baTGcZeRlZ94DQYvVfhfCns=@lists.infradead.org, AJvYcCWeKOH+dX+xL/ZKJ5gdZgO8dMk8Eb15jhptbTmaZqrEpQrJBQ4fd2QFhbbMBkELDLq1PtNgAI2n5x5EU249fnpt@lists.infradead.org
X-Gm-Message-State: AOJu0YxA41vmO1x0dJ2K7l6KWgJbCBAQWJsLPYa2MutkKLJ9LfxMCzVf
	HLZK40sNXhW+LF7eLT+fVn9TRn+DeHPaPxiVWa5nZBSAPWqVK90rShv9qISmt8zR+fYuc1GsYNI
	NUo6m/PHWqgv/5q8o+dCWqrYtJGE=
X-Google-Smtp-Source: AGHT+IGK5T0nDufa6N8i4fHSCAxyTR0jwbSr6kE4UzzT3vskIhvbCHGDn2AlzCa36TYh+syU4K8aw4v6vDWjtuG2a2s=
X-Received: by 2002:a5d:44c7:0:b0:371:8f15:21df with SMTP id
 ffacd0b85a97d-372fd70fd5bmr2438422f8f.49.1724274079514; Wed, 21 Aug 2024
 14:01:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240821093016.2533-1-Tze-nan.Wu@mediatek.com>
In-Reply-To: <20240821093016.2533-1-Tze-nan.Wu@mediatek.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 21 Aug 2024 14:01:08 -0700
Message-ID: <CAADnVQLLN9hbQ8FQnX_uWFAVBd7L9HhsQpQymLOmB-dHFR4VRw@mail.gmail.com>
Subject: Re: [PATCH net v4] bpf, net: Check cgroup_bpf_enabled() only once in do_sock_getsockopt()
To: Tze-nan Wu <Tze-nan.Wu@mediatek.com>
Cc: Network Development <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, bobule.chang@mediatek.com, wsd_upstream@mediatek.com, 
	LKML <linux-kernel@vger.kernel.org>, linux-mediatek@lists.infradead.org, 
	Kuniyuki Iwashima <kuniyu@amazon.com>, Yanghui Li <yanghui.li@mediatek.com>, 
	Cheng-Jui Wang <cheng-jui.wang@mediatek.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, 
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_140122_086591_34317A3B 
X-CRM114-Status: GOOD (  26.19  )
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

On Wed, Aug 21, 2024 at 2:30=E2=80=AFAM Tze-nan Wu <Tze-nan.Wu@mediatek.com=
> wrote:
>
> The return value from `cgroup_bpf_enabled(CGROUP_GETSOCKOPT)` can change
> between the invocations of `BPF_CGROUP_GETSOCKOPT_MAX_OPTLEN` and
> `BPF_CGROUP_RUN_PROG_GETSOCKOPT`.
>
> If `cgroup_bpf_enabled(CGROUP_GETSOCKOPT)` changes from "false" to
> "true" between the invocations of `BPF_CGROUP_GETSOCKOPT_MAX_OPTLEN` and
> `BPF_CGROUP_RUN_PROG_GETSOCKOPT`, `BPF_CGROUP_RUN_PROG_GETSOCKOPT` will
> receive an -EFAULT from `__cgroup_bpf_run_filter_getsockopt(max_optlen=3D=
0)`
> due to `get_user()` was not reached in `BPF_CGROUP_GETSOCKOPT_MAX_OPTLEN`=
.
>
> Scenario shown as below:
>
>            `process A`                      `process B`
>            -----------                      ------------
>   BPF_CGROUP_GETSOCKOPT_MAX_OPTLEN
>                                             enable CGROUP_GETSOCKOPT
>   BPF_CGROUP_RUN_PROG_GETSOCKOPT (-EFAULT)
>
> To prevent this, invoke `cgroup_bpf_enabled()` only once and cache the
> result in a newly added local variable `enabled`.
> Both `BPF_CGROUP_*` macros in `do_sock_getsockopt` will then check their
> condition using the same `enabled` variable as the condition variable,
> instead of using the return values from `cgroup_bpf_enabled` called by
> themselves as the condition variable(which could yield different results)=
.
> This ensures that either both `BPF_CGROUP_*` macros pass the condition
> or neither does.
>
> Fixes: 0d01da6afc54 ("bpf: implement getsockopt and setsockopt hooks")
> Co-developed-by: Yanghui Li <yanghui.li@mediatek.com>
> Signed-off-by: Yanghui Li <yanghui.li@mediatek.com>
> Co-developed-by: Cheng-Jui Wang <cheng-jui.wang@mediatek.com>
> Signed-off-by: Cheng-Jui Wang <cheng-jui.wang@mediatek.com>
> Signed-off-by: Tze-nan Wu <Tze-nan.Wu@mediatek.com>
> ---
>
> Chagnes from v1 to v2: https://lore.kernel.org/all/20240819082513.27176-1=
-Tze-nan.Wu@mediatek.com/
>   Instead of using cgroup_lock in the fastpath, invoke cgroup_bpf_enabled
>   only once and cache the value in the newly added variable `enabled`.
>   `BPF_CGROUP_*` macros in do_sock_getsockopt can then both check their
>   condition with the new variable `enable`, ensuring that either they bot=
h
>   passing the condition or both do not.
>
> Chagnes from v2 to v3: https://lore.kernel.org/all/20240819155627.1367-1-=
Tze-nan.Wu@mediatek.com/
>   Hide cgroup_bpf_enabled in the macro, and some modifications to adapt
>   the coding style.
>
> Chagnes from v3 to v4: https://lore.kernel.org/all/20240820092942.16654-1=
-Tze-nan.Wu@mediatek.com/
>   Add bpf tag to subject, and Fixes tag in body.
>
> ---
>  include/linux/bpf-cgroup.h | 15 ++++++++-------
>  net/socket.c               |  5 +++--
>  2 files changed, 11 insertions(+), 9 deletions(-)
>
> diff --git a/include/linux/bpf-cgroup.h b/include/linux/bpf-cgroup.h
> index fb3c3e7181e6..5afa2ac76aae 100644
> --- a/include/linux/bpf-cgroup.h
> +++ b/include/linux/bpf-cgroup.h
> @@ -390,20 +390,20 @@ static inline bool cgroup_bpf_sock_enabled(struct s=
ock *sk,
>         __ret;                                                           =
      \
>  })
>
> -#define BPF_CGROUP_GETSOCKOPT_MAX_OPTLEN(optlen)                        =
      \
> +#define BPF_CGROUP_GETSOCKOPT_MAX_OPTLEN(optlen, enabled)               =
      \
>  ({                                                                      =
      \
>         int __ret =3D 0;                                                 =
        \
> -       if (cgroup_bpf_enabled(CGROUP_GETSOCKOPT))                       =
      \
> +       enabled =3D cgroup_bpf_enabled(CGROUP_GETSOCKOPT);               =
        \
> +       if (enabled)


I suspect the compiler generates slow code after such a patch.
pw-bot: cr

What is the problem with double cgroup_bpf_enabled() check?
yes it might return two different values, so?

