Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84D5DC5474C
	for <linux-mediatek@archiver.kernel.org>; Sat, 31 Aug 2024 03:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CmUNI7dopbgPT4zjvSEr3dpJrjim6ozHINXa3gY07bw=; b=da/vuQQ9g3fXl8WBztl45KdvEj
	3orRPVPFU3T5oIwh7iWizJLp3My2Q8DGwu6l+/cqk/OCsYYnr6WH3xtpRLCVIyzRcgvz6efpzIFGr
	6UV/DzEaCWnDRixnFmIjEojzr4h3q79ZO00Ty90mf3mk2ykVU1ofizTf8C8lDlYrdXixljGEdKuBt
	fOvnbfdyFOUhC/DImxBB/tDOPJusmbakJdpaxXEdZNJDjzJ4VrSU2f9aHZxRBzDXMfxJXxe+cWbBN
	OFLIB4jui0X3ye8hVPsI28soiUodeDYG2rrnNQdOObNNfl+lL/CiHq1Sbq7b+StJLgivVvNc2Nxdv
	t3us7nWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skEnX-00000008Qds-0Nmh;
	Sat, 31 Aug 2024 03:29:11 +0000
Received: from mail-pl1-f182.google.com ([209.85.214.182])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skEnT-00000008QdR-1h5K;
	Sat, 31 Aug 2024 03:29:09 +0000
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-20203988f37so23881145ad.1;
        Fri, 30 Aug 2024 20:29:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725074946; x=1725679746;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CmUNI7dopbgPT4zjvSEr3dpJrjim6ozHINXa3gY07bw=;
        b=jfuSanPXgzyoKgZXqkpaphqRp+QLrduYw6DLQ/aVdftRQeoWLyOXpPMo5L1ae+F2OR
         yPUc5rY948+NgJR1ORrUE5cFaR8W5ZAfNAKuPoq12knlmXT9cq+lnrhEFvJPqJIITQw5
         A+iz/2euozAgp/5OTUzokYiiaQ1nh0yPaq4/IvcY0q0hVYmIqdGPuLPwvW3gFB278Kae
         gB7D/imf9F8vbQkd3GJ8NJ//21z9+RwaS0ZvJGyyaL7ELsOMCHBlaTOA1T7QMhqkmFHn
         AeF+U+JeR7Sx44nEpqwdu9/vRfMRB0G0lUD85ss+WCH2WOHCMVdFA3ba1SSsK1TFLjYq
         Z6YQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtuAjq/tu5BXDLLEvtBwrH11w4ZdVbq3vTYhNYPC2O+DcJVAGpt+vYCoWeG5GQ8c6coIe+qg0j4cqJkZQIMkH2@lists.infradead.org, AJvYcCXiF2u7rCFyZn28L+I0sqGJ5mpbqzkbjCPMLb1fXIbPgT1Jg6/+ANskLSwIJSfsSrMdYqdICjGIZ6V/q3uCKDA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzFE8TD/exFe5gM1sipKwEM+S18wIZW4E4jcaDECrLNiAwdFUYs
	ITBUL/zP1PTGvwLpZv3+EnUw+ctrW+l0vi+EQkS55yULJB46AGA=
X-Google-Smtp-Source: AGHT+IHd6g6pyez/8oZoyMFdR/yCZyTkS9LN5xXtI/s4MBHHHdVw0Q6ZuduT6Yegky8Pq/nfuJhkGQ==
X-Received: by 2002:a17:902:d486:b0:202:2a38:f9f1 with SMTP id d9443c01a7336-2050c4bc469mr90250375ad.58.1725074946166;
        Fri, 30 Aug 2024 20:29:06 -0700 (PDT)
Received: from localhost ([2601:646:9e00:f56e:73b6:7410:eb24:cba4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2054baf1423sm2147985ad.175.2024.08.30.20.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 20:29:05 -0700 (PDT)
Date: Fri, 30 Aug 2024 20:29:04 -0700
From: Stanislav Fomichev <sdf@fomichev.me>
To: Tze-nan Wu <Tze-nan.Wu@mediatek.com>
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>, alexei.starovoitov@gmail.com,
	bobule.chang@mediatek.com, wsd_upstream@mediatek.com,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	Kuniyuki Iwashima <kuniyu@amazon.com>, chen-yao.chang@mediatek.com,
	Yanghui Li <yanghui.li@mediatek.com>,
	Cheng-Jui Wang <cheng-jui.wang@mediatek.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	KP Singh <kpsingh@kernel.org>, Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net v5] bpf, net: Fix a potential race in
 do_sock_getsockopt()
Message-ID: <ZtKOAKlNalVLIz2E@mini-arch>
References: <20240830082518.23243-1-Tze-nan.Wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240830082518.23243-1-Tze-nan.Wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_202907_482196_02ED43F5 
X-CRM114-Status: GOOD (  11.51  )
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

On 08/30, Tze-nan Wu wrote:
> There's a potential race when `cgroup_bpf_enabled(CGROUP_GETSOCKOPT)` is
> false during the execution of `BPF_CGROUP_GETSOCKOPT_MAX_OPTLEN`, but
> becomes true when `BPF_CGROUP_RUN_PROG_GETSOCKOPT` is called.
> This inconsistency can lead to `BPF_CGROUP_RUN_PROG_GETSOCKOPT` receiving
> an "-EFAULT" from `__cgroup_bpf_run_filter_getsockopt(max_optlen=0)`.
> Scenario shown as below:
> 
>            `process A`                      `process B`
>            -----------                      ------------
>   BPF_CGROUP_GETSOCKOPT_MAX_OPTLEN
>                                             enable CGROUP_GETSOCKOPT
>   BPF_CGROUP_RUN_PROG_GETSOCKOPT (-EFAULT)
> 
> To resolve this, remove the `BPF_CGROUP_GETSOCKOPT_MAX_OPTLEN` macro and
> directly uses `copy_from_sockptr` to ensure that `max_optlen` is always 
> set before `BPF_CGROUP_RUN_PROG_GETSOCKOPT` is invoked.
> 
> Fixes: 0d01da6afc54 ("bpf: implement getsockopt and setsockopt hooks")
> Co-developed-by: Yanghui Li <yanghui.li@mediatek.com>
> Signed-off-by: Yanghui Li <yanghui.li@mediatek.com>
> Co-developed-by: Cheng-Jui Wang <cheng-jui.wang@mediatek.com>
> Signed-off-by: Cheng-Jui Wang <cheng-jui.wang@mediatek.com>
> Signed-off-by: Tze-nan Wu <Tze-nan.Wu@mediatek.com>

Acked-by: Stanislav Fomichev <sdf@fomichev.me>

