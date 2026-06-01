Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA4DBCD6E60
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Jun 2026 18:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BZCQ8JTHKVYt9Tclu34pPLg1XMbWxAq4Delwv/3YvpU=; b=mHqAMc+lOWAi/eGR0SCl6fqK+w
	ZYycFfL5X/nnSr02oQQGQJgT4o3/P7Nku4drI6YN5GuncPty/c3+qJFpV9RwjVGrckPtwzmPGtAvc
	2r7J4+70TELF4AUuGM9i0TQbAQK9NNMTZSg3KQEWVgKnltIlwEyUOp8QgWwyw/Cl4EJvIQ1dMEQtO
	RR/GlVlRMRNorNrpnsEF5RAvl3oDHxLaF71Z2kFXup+6oezCL3aE8Twr2X5c2OJL60J1Pwl+CZMVn
	x7zNx9FJQ3WeH3keQ/YwcWrimh0ncXaXr7n9SGhubYJedfprM5m6eFhGr+HxZhQkAWaCq0HcM+1LT
	gZ5ofnkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU7UZ-0000000BfYS-3XaG;
	Mon, 01 Jun 2026 18:36:03 +0000
Received: from mail-dl1-x122f.google.com ([2607:f8b0:4864:20::122f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU7UX-0000000BfY3-0pyf
	for linux-mediatek@lists.infradead.org;
	Mon, 01 Jun 2026 18:36:02 +0000
Received: by mail-dl1-x122f.google.com with SMTP id a92af1059eb24-1370417c01cso9971575c88.1
        for <linux-mediatek@lists.infradead.org>; Mon, 01 Jun 2026 11:36:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780338960; cv=none;
        d=google.com; s=arc-20240605;
        b=L7fiPPNX4fgfn947Fb4vDTcp+PvhQQBofV/l7QQES7Y98j3kimrcbO7g6RtNJsPNlY
         WmcsiES4B3s/xY6wBZTb+QffDSe4iBJxphfLf7kG1V3OPLffxRZG+D3zIZwBoRlQaePq
         sEiCB57R9EEUeNtrIZ3YuPOPk56C+6X9tQKadMm1kR15ofzjqzmBw2Xp7AgCSnHuZ15x
         bTYbHSegxBkL4K7VMDLKwrHbtkC115Mdq3ZEFOvt3dRTwWHaO5hW4jfQqRHx+QqV9IlR
         SXZr/Gol+H3Cu19HTqDqmMW7qNVrL9Q9NVuQTijt25AfbB2qIly0Jgq1L1Uie3hXf8Qa
         O9pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BZCQ8JTHKVYt9Tclu34pPLg1XMbWxAq4Delwv/3YvpU=;
        fh=qUG77k5BmnArtwAJfq3M22HCsBnHmPDnt2x+RLsiTko=;
        b=ZxwJgI+7AZAhw1V6hZ5GBXAGNvNh3N6pPrI3lJ8wSWni5u3nqOrUv8tJfDyfF76Elz
         xYcN/7M9mC393Qn1TlvuzC1yp4mmu06GBkVgK1nBuSfebRy2fCdS0MuxFu+wJItBNyDr
         SPCo82bV/2BgmT8qmj3Utiwm7DYFBqWYoeuPutg3ZsKSmVrp9SdiSdGIGisILEh2SSsV
         sLOGC/AMGSfE+MPCaxV22jasAfzIEPaMBAmDgD90TLFb0n7sq4oy/xpjZPPPPuRlWxBI
         d5eZRSRexLFalID+LymmutV+3IteK03vXc5SAcRGaigBj1A3b02FK02eRmlnJRJWNyb2
         BFow==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780338960; x=1780943760; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BZCQ8JTHKVYt9Tclu34pPLg1XMbWxAq4Delwv/3YvpU=;
        b=ncbdvzJNzLHsmJvV0C/XiwmAO8poLTzsmqjfX06V6HuOY2rft0A0l8iAmgzoCr1RFs
         qjfuyCULE6ynGyXl3Ppz6J41RfBbvN0tn1rDDNUS0AdlEy/LFryLACtDtBX3MDieM8od
         AgIVocL66tpQ83psLbtLmwz1RnhV+us93R9SWpxGNAtLE65rjOYXMeFW0LnVtD946btE
         kiB9ukZaawSEb1oteoyYGP7fBULXKIcYBp9yA4pp7s4PT11Rpfpz4UY5zO6hDw/iSSov
         IXGRK6HEsQaoR/gbL/+ndgC9StM9SGl3PAOW4A//eQP8j4EDR7NfiuPsy8lkg8Pql5CW
         ovKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780338960; x=1780943760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BZCQ8JTHKVYt9Tclu34pPLg1XMbWxAq4Delwv/3YvpU=;
        b=GbczLi/LhOv5lMM6/Ktq0MYRYM0zJSuiD8Ebd1oN0SZ1MfY4NbbgaBMrzBHCM/tJXI
         Da2XYpwMfNVuTPBFxOBhvKppt3k2ikvK4igweVU+C3LQ/jxOlmuH+0Npu9VorxKY++L8
         Pa4x2bd3c6+nAW8nKaMaEiq4b6avQLGAt65VKubWMoCErnJmvGHQ0pS8nKLLBbwXo1Lj
         IZ3iIYoNKa8PRkR8eBwrWyTJuBmwRDWLkVpdSycgZPZ2knbHo86NE6KU3MMIrjzvpVQ1
         b8kKPJqIGRa8eT+j5zkfbFSv9iPG8YWu24Dy7Hq9q+BXTD1nVFZs8XxL7PP/rncwkRc7
         mjmA==
X-Forwarded-Encrypted: i=1; AFNElJ9gtgcFwOJr7h7zxiofv6L/qE7PPucYdJ/4ljuDdeul5wPZsNdY3Qy4fPBWfqsHeecB9xFcuRHEtJMiODYAbA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyDIAw9ADlybuDZBwwZma24EH9LmsYuZkeEsCMsGQ3MXRYT04FL
	76vo3PoFJ8h8knrBiaq1KOA4bYvMPtqwouSU/fx6WlzGicrXW7ZJCa9oPZE9EL3ulazuTaM++tk
	AXHhPngkFyG8lY5ATqrWfJhxJn0hsVMBLJP4K1lzB
X-Gm-Gg: Acq92OELUI4iB5Ek32C+jS2xzxQQsIKVVo8rxMmrL5E3VZ7WlwpfEgjD0NSLbH8JYA3
	WoB9nO38hFxrboH09OkoLCC9QNCH0doTzzXRwYX8PS1U4jQT2p3CPycAHqUeb3O/FKpiADIUWfz
	3YvC2u0GCnuqLkq9/TkTMvQd1R2otqxPYFT9YECl5pvWow1YHRW4/0x6eEhgS9a4VF5TrJcnqdg
	Ex/sdvG1QeUsYeOO2V4TMSnD4dQPFau1MrEJx0UFOOnAQ5rBBQsjJqn/7GXApVrEmBeEyMoi7EY
	C89S7GDBoNjJw2SO76L7XYaahfJzFqmjUdpCHHwZp0qYk/FFpfCKPrP5BoclItZOxpkr59ctjbg
	8DTpYOPneNBqIcsUUBL6tWX2hkmUEgRrCYd00IX572982YYuv76PRGiBk10S2
X-Received: by 2002:a05:7022:527:b0:136:7d65:4edc with SMTP id
 a92af1059eb24-137d3f183b3mr5189541c88.8.1780338959580; Mon, 01 Jun 2026
 11:35:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260601113640.231897-1-jianyu.li@mediatek.com> <20260601113640.231897-3-jianyu.li@mediatek.com>
In-Reply-To: <20260601113640.231897-3-jianyu.li@mediatek.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Mon, 1 Jun 2026 11:35:47 -0700
X-Gm-Features: AVHnY4Jo_WRYBs9AuS4ymSPO1yP0VwgvWsTZn-utNlzkeWpRmNrOKaUMo6nfXHw
Message-ID: <CAAVpQUAk5Yyidp6YQwWJYzQfZE-q_2RLKc2eTevmdzSXZ=C8gQ@mail.gmail.com>
Subject: Re: [PATCH net v3 2/2] af_unix: Add test for SCM_INQ on partial read
To: jianyu.li@mediatek.com
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, willemb@google.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, black-ch.chen@mediatek.com, 
	ivan.tseng@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_113601_239573_CFA7AC25 
X-CRM114-Status: UNSURE (   8.91  )
X-CRM114-Notice: Please train this message.
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

On Mon, Jun 1, 2026 at 4:37=E2=80=AFAM <jianyu.li@mediatek.com> wrote:
>
> From: Jianyu Li <jianyu.li@mediatek.com>
>
> Add test to verify that when a skb is partially consumed,
> unix_inq_len() return correct remaining byte count.
>
> Before:
>
>   #  RUN           scm_inq.stream.partial_read ...
>   # scm_inq.c:165:partial_read:Expected remain (512) =3D=3D *(int *)CMSG_=
DATA(cmsg) (768)
>   # partial_read: Test terminated by assertion
>   #          FAIL  scm_inq.stream.partial_read
>   not ok 2 scm_inq.stream.partial_read
>
> After:
>
>   #  RUN           scm_inq.stream.partial_read ...
>   #            OK  scm_inq.stream.partial_read
>   ok 2 scm_inq.stream.partial_read
>
> Signed-off-by: Jianyu Li <jianyu.li@mediatek.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>

