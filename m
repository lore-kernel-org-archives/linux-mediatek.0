Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 904B1CCD1BC
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Oct 2025 08:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tFK1KO4D+0gMTo4v0IBwFOBDfCPoPkcaJ3yQdNMsf7M=; b=IgjpHEeG7J/EeFV9Lo7qQK32u1
	HYZMvYHUoCYvdbt2M7ZvDXaQ9Fm68oXbWx57mQdNrIGfgQwwgcK1XS+2iv9vv1tGxmvklG68EguNw
	Jc0iGBQ49IV/ZlvPj/j/tjKIB2NBtgReSfyZuEXIffuTyVmncM3e5EnIt3LrMSQCTBt1l2Z5eMJ1I
	M5J9SbJlOUNZhifO5Truj3y8+4b6VKgy0vQVoywXKeMamkFqCnz9vlC8hlqLlRymxhqZHCwQOQORM
	0XfgobPDvdtDQq4enF/ANFFFKYGNN2Rsa4410K3XM7JieVtuWQaBbEt5mbYBjh/bTbMt+UK7OYN2Y
	zYHeDjyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBTvG-000000021Qj-0Eh6;
	Wed, 22 Oct 2025 08:10:18 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBTv4-000000021MW-0OUJ
	for linux-mediatek@lists.infradead.org;
	Wed, 22 Oct 2025 08:10:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761120603;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tFK1KO4D+0gMTo4v0IBwFOBDfCPoPkcaJ3yQdNMsf7M=;
	b=SDno7bQmT1OXWXE6LLygg49XDaPGtLvkRZH/VYHf25yjUSy3kCMFKfi2WqTVBceYnr040q
	n6iwVxfGh6tyVd9dU1Sp6aJU6K90WAurG0BdK6DNXDJNBP6orkvsZmh4Q0VT4+5TcLZBZZ
	uyj9sGpO+0VvSkLyqVfifIaX73shy68=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-477-3dAn5ocSPQ6Zl7R7hFFQpA-1; Wed, 22 Oct 2025 04:08:16 -0400
X-MC-Unique: 3dAn5ocSPQ6Zl7R7hFFQpA-1
X-Mimecast-MFC-AGG-ID: 3dAn5ocSPQ6Zl7R7hFFQpA_1761120496
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-28bd8b3fa67so62827875ad.2
        for <linux-mediatek@lists.infradead.org>; Wed, 22 Oct 2025 01:08:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761120496; x=1761725296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tFK1KO4D+0gMTo4v0IBwFOBDfCPoPkcaJ3yQdNMsf7M=;
        b=I/5/WMjyhdVOmsST5hEvRtt7+7KKSbnpiiDQz9ho/qpAW7xBAcFc9B6kcDhGfCOv/X
         bbxNFzKdLIpMtB1AEHm3w/bsRej7w+C8krJ4Aq4zxB3eGdEUHeToDvT3rMOoew0HOlfO
         Db2Aht3rHJMuFFermd6WaKuk7LhSHyS3+IjGXFwJJejGuYexvR2h1E4TPIAJTju1kHyv
         Z7WyZqLPUkb7BKUUPPUI280q6svIc8PqGasvzLLMySbRvMRobF5QFzyxEXDgKP0t793I
         vWgnBYVIEr6fK6zYLWxPr2shMkqSJox+dtOvzTzjjYerraIXsyQ0SEUNPWVYqlYo1GOT
         vTsQ==
X-Forwarded-Encrypted: i=1; AJvYcCU11oxl7/JxqpifVLrZwzNipLPVxeu/juJVTmDVWolijSv8L13LyhX6yfQ6bFrfBGMZrgmDl7P8UMOb/W8ChQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0BFSU6USDQVz5MJXM1FVUuBRV5WGBOC5l0cwyylgr9oLkZa0+
	7sKyF6IlSAYckUPZjANis/PTpQjJ6G2yyl4Iwp+hFiasvlG+hMdPlAiTcyXeDq05vEceUD6U5Rm
	8EDHTUUOmm98loQhg1nLnronfiiD9aA0PBgC7w9Bd2C1dMeB5EXZ4DHSQ5ZG5tOopLvC+g9IKkl
	+hBu9871x6rpOP+V0p6RwCCjLhGZe58/kKKwmIDWT1EGNp+Oan
X-Gm-Gg: ASbGnctZry9viGV4+tba/5lxnI6XAjJ40zY3YQKNewtz94TTnkt+K07dcLE1Jzn56C6
	JH0T6k6y+gdTEdYxPToff2zF/JX08nDxr5F82miaoWEHDf1gfNq1Krpkcyey4r4qp9etRvjMybu
	BjpnF+xaf282pXe8H71Xx57E+EyqXPb3ino86wutWmEyw7vVsKb+hfdCHjF+Zaz87pndRuM4LYS
	S5ljUCdAufWeoxQ
X-Received: by 2002:a17:902:e5cf:b0:290:91b1:2a69 with SMTP id d9443c01a7336-290cb7560b8mr260211685ad.52.1761120495727;
        Wed, 22 Oct 2025 01:08:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHo2XP/jVdY2pcYFKz6OnG7bzc461hULcT1/QO/xAI+P9k7vDhd+aVTkvwMGDjMEU/z3u35v2XMOR7IkEnO8xg=
X-Received: by 2002:a17:902:e5cf:b0:290:91b1:2a69 with SMTP id
 d9443c01a7336-290cb7560b8mr260211445ad.52.1761120495404; Wed, 22 Oct 2025
 01:08:15 -0700 (PDT)
MIME-Version: 1.0
References: <20251022072729.14820-1-xion.wang@mediatek.com>
In-Reply-To: <20251022072729.14820-1-xion.wang@mediatek.com>
From: Ondrej Mosnacek <omosnace@redhat.com>
Date: Wed, 22 Oct 2025 10:08:04 +0200
X-Gm-Features: AS18NWB0L38kFa0XqRBxBuxoOL0blj0prvtzV3DKxomco7xkygfsMEqvL9322_U
Message-ID: <CAFqZXNuPqwfqA23LH8NOG6KM1Nb7WvW77wnpp-vZ5omU40j_qQ@mail.gmail.com>
Subject: Re: [PATCH 0/1] selinux: export current_sid API for use in other
 kernel modules
To: xion.wang@mediatek.com
Cc: Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, wsd_upstream@mediatek.com, 
	huadian.liu@mediatek.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yVGiqZGtZ5dcXRq5snATOtCgUWCTDySRUzOVCuakZlU_1761120496
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_011006_263152_85A0A997 
X-CRM114-Status: GOOD (  23.77  )
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

On Wed, Oct 22, 2025 at 9:43=E2=80=AFAM <xion.wang@mediatek.com> wrote:
>
> From: Xion Wang <xion.wang@mediatek.com>
>
> We have a kernel driver designed to monitor the status of the Android
> userspace watchdog. The implementation works as follows: we modify the
> Android userspace watchdog code to periodically send a "kick" signal to
> the kernel driver via ioctl, so that the kernel driver can determine
> whether the userspace is still responsive. If the kernel driver does not
> receive a kick signal from the userspace watchdog within a certain
> period, it infers that the userspace is stuck. In this case, the kernel
> driver will dump key process information at the kernel level and trigger
> a full system reboot.
>
> To ensure that only the legitimate Android userspace watchdog process can
> access the ioctl interface and perform the kick operation, and to prevent
> malicious or unauthorized processes from spoofing the kick action (which
> could compromise system reliability), we want to identify the calling
> task by its security identifier (sid). By checking the sid, we can
> effectively prevent unauthorized processes from sending kick signals.
>
> Currently, the current_sid() function in the kernel is defined as
> static inline and cannot be directly called from modules or drivers. We
> propose to export this function, so that the kernel driver can call
> current_sid() to obtain the sid of the current process and decide whether
> to allow the kick operation.
>
> This change will help enhance system security and robustness by
> preventing the watchdog mechanism from being bypassed or abused.
>
> I would like to ask the maintainers if there are any additional security
> concerns regarding exporting current_sid() as a public API, or if there
> are any alternative or more recommended approaches to achieve this goal.
> Any feedback or suggestions would be greatly appreciated.

Couldn't you just use security_cred_getsecid() or the new
security_cred_getlsmprop()?

Untested:

u32 sid;
security_cred_getsecid(current_cred(), &sid);

-- or --

lsm_prop prop;
security_cred_getlsmprop(current_cred(), &prop);
u32 sid =3D prop.selinux->secid;

--=20
Ondrej Mosnacek
Senior Software Engineer, Linux Security - SELinux kernel
Red Hat, Inc.


