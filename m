Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E88CD13DF
	for <linux-mediatek@archiver.kernel.org>; Sat, 31 Aug 2024 22:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iHiTRjE5wPqafGdsOpFQFAP5aZVxpmACA5LO9Bj0aoQ=; b=cXZq7O8GM77Fn2UrPISpTBWyON
	2BH8xcDUSmUnQxtBugxr8wCOii/Hk8CCRiyhc7Ql9OXBzcu8pw6S+iYlt+2FP6nEoJgnUwbnjHrMK
	9shFV+kNzDczsBjPTyWoANP/OFLh64Rxwq5Tr6neSyoRWm39FRfMEY5sTFyQWuavK/4roFC8Iwbar
	0zrecPZPNy+f+fp0ZLQqjTf4K1vpJ5/qXKG5IAO7kcE7YZlgZe8N6It1c/ocnS3j//NJaWypSrchv
	YQuSumwqFXjl851UZBtyMbtnKS71fqwDPNgGFE2im19p1NTUw+JjH/axKvU8lh14MS/0NvScgnbsH
	IwNBRZgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skWEa-0000000ACbD-1EsZ;
	Sat, 31 Aug 2024 22:06:16 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skWEY-0000000ACaE-0rG0;
	Sat, 31 Aug 2024 22:06:15 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-371ba7e46easo1996066f8f.0;
        Sat, 31 Aug 2024 15:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725141972; x=1725746772; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iHiTRjE5wPqafGdsOpFQFAP5aZVxpmACA5LO9Bj0aoQ=;
        b=BvJfW+FhSWngYCwnB5stMQh4xo09fAwnZDUQT6Nqe4Nw2hTCc2wiYE4UYbXNvo9eP1
         hH6xDr/Q9+9Nhk3RPzjnBxEn2bOQe/NM//yQaWb9QL4Pr1BBoAAhocZTfH1YJuzk5qmr
         0bw6Qs3guHz+bQ9lZXbB6mMonh8pSJcdemARAwJXcGsj5ymPld0UMsE5UPYUdS6sG6rO
         IffBGNtpBShWGmyEeTN+e+3zfINCyhbHrUBE042AEKdJN4PPz1AVk4XP1Dm2UiBni2BB
         dWvbgZ+gta6Byrh2Fa4D0griBH3c8No96YcrfIYBcfSvzRQorjS4+lZVk4Xsg/YiiE1x
         RIxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725141972; x=1725746772;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iHiTRjE5wPqafGdsOpFQFAP5aZVxpmACA5LO9Bj0aoQ=;
        b=JpMYVYM6GCnG972oOVpORTuFvmVagfguZW2Zw5j8ojROhnR7X7EYyVsOfLR6OfOMOD
         LSqRA1xXbkwwmXulpJMmlSk+psFvL/gKJ9Reg558ugLRji6c5hB/1zRq6DB1uaz0tmiC
         uXJgwXFsrGu3+uqjLhCXU6ZsaqitxI14j5ixQC+UEu2FrNO3gEAzCgjyP3pMD/+WEayh
         tlcNfXvf9Wla8CJ6UYYRqwXYP8G0r85YJmoiF+IBS3w4gyN06f1kf66h8ZmGQkH9EUDt
         HHKEIN220t8os2ETY3D4GrMgARE4sMKGRkwQ3uwS93Dd3OL8Bx7lMNGcEv5z6J9wEAjr
         41sw==
X-Forwarded-Encrypted: i=1; AJvYcCW6fBzlgupmiAO1gdc1SWWSKGGP01dhl9kn/M6O4ffv7iUVC2gW0QkkAFuKxeYD6DRmxDQhtttPm6wylVarAoo=@lists.infradead.org, AJvYcCWYCZsTMhPSm6sxIMXZ9evSpTelfs7cap6cqlUxo+Jh27BadrmDlQ+G0i6d/n9RaTq5h4sLyDeRNeGC2qt5xFDy@lists.infradead.org
X-Gm-Message-State: AOJu0Yzi85pUpFaF0FdezXRBzJI3zw8jT5sWeOm9Cv6sm0TyeFjoAQwY
	55FK81qXjwyHsTiIruYqarwqckcidc0ZwA27Z9fPdmGIymk9uBxgwGvnOB1fsCuAi2pBWZUusLw
	I8C9zYEr6lhwc9pSkrjTLxWYVW9Y=
X-Google-Smtp-Source: AGHT+IElcSjXVcepALYdR4g4ZBYS52ra8HL1nFrQuNIj918KyHcB0GxmzUlRohlXi6yN7dyNwTT9La4BHx8mt28MpUE=
X-Received: by 2002:adf:e5cb:0:b0:368:526d:41d8 with SMTP id
 ffacd0b85a97d-374bceb003fmr2076156f8f.23.1725141971473; Sat, 31 Aug 2024
 15:06:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240830082518.23243-1-Tze-nan.Wu@mediatek.com> <ZtKOAKlNalVLIz2E@mini-arch>
In-Reply-To: <ZtKOAKlNalVLIz2E@mini-arch>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sat, 31 Aug 2024 15:06:00 -0700
Message-ID: <CAADnVQKF=o6q2FzssEy9-jmye7+DB=S58KD8=dh=aRR5QTpJrA@mail.gmail.com>
Subject: Re: [PATCH net v5] bpf, net: Fix a potential race in do_sock_getsockopt()
To: Stanislav Fomichev <sdf@fomichev.me>
Cc: Tze-nan Wu <Tze-nan.Wu@mediatek.com>, Network Development <netdev@vger.kernel.org>, 
	bpf <bpf@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	=?UTF-8?B?Qm9idWxlIENoYW5nICjlvLXlvJjnvqkp?= <bobule.chang@mediatek.com>, 
	wsd_upstream <wsd_upstream@mediatek.com>, LKML <linux-kernel@vger.kernel.org>, 
	linux-mediatek@lists.infradead.org, Kuniyuki Iwashima <kuniyu@amazon.com>, 
	=?UTF-8?B?Q2hlbi1ZYW8gQ2hhbmcgKOW8teemjuiAgCk=?= <chen-yao.chang@mediatek.com>, 
	Yanghui Li <yanghui.li@mediatek.com>, Cheng-Jui Wang <cheng-jui.wang@mediatek.com>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, 
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240831_150614_269539_BCC8FFB1 
X-CRM114-Status: GOOD (  15.77  )
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

On Fri, Aug 30, 2024 at 8:29=E2=80=AFPM Stanislav Fomichev <sdf@fomichev.me=
> wrote:
>
> On 08/30, Tze-nan Wu wrote:
> > There's a potential race when `cgroup_bpf_enabled(CGROUP_GETSOCKOPT)` i=
s
> > false during the execution of `BPF_CGROUP_GETSOCKOPT_MAX_OPTLEN`, but
> > becomes true when `BPF_CGROUP_RUN_PROG_GETSOCKOPT` is called.
> > This inconsistency can lead to `BPF_CGROUP_RUN_PROG_GETSOCKOPT` receivi=
ng
> > an "-EFAULT" from `__cgroup_bpf_run_filter_getsockopt(max_optlen=3D0)`.
> > Scenario shown as below:
> >
> >            `process A`                      `process B`
> >            -----------                      ------------
> >   BPF_CGROUP_GETSOCKOPT_MAX_OPTLEN
> >                                             enable CGROUP_GETSOCKOPT
> >   BPF_CGROUP_RUN_PROG_GETSOCKOPT (-EFAULT)
> >
> > To resolve this, remove the `BPF_CGROUP_GETSOCKOPT_MAX_OPTLEN` macro an=
d
> > directly uses `copy_from_sockptr` to ensure that `max_optlen` is always
> > set before `BPF_CGROUP_RUN_PROG_GETSOCKOPT` is invoked.
> >
> > Fixes: 0d01da6afc54 ("bpf: implement getsockopt and setsockopt hooks")
> > Co-developed-by: Yanghui Li <yanghui.li@mediatek.com>
> > Signed-off-by: Yanghui Li <yanghui.li@mediatek.com>
> > Co-developed-by: Cheng-Jui Wang <cheng-jui.wang@mediatek.com>
> > Signed-off-by: Cheng-Jui Wang <cheng-jui.wang@mediatek.com>
> > Signed-off-by: Tze-nan Wu <Tze-nan.Wu@mediatek.com>
>
> Acked-by: Stanislav Fomichev <sdf@fomichev.me>

Considering it's rc6 I was debating whether it's net/bpf or -next
material, but could argue either way.

Tze-nan,
if I recall you were saying it affects android boot ?
If so please describe such details in the commit log next time.

Acked-by: Alexei Starovoitov <ast@kernel.org>

Kuba,
feel free to take it into net if you think it's an appropriate fix.

