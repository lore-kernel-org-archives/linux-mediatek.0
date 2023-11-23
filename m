Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D54BC27C40
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Nov 2023 00:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WQV9zlpt55Nr7v5RktMnP+Iz77X5WnMy/klGhX/OcHU=; b=UidM3zEDC3PFdDKiI55I7oV+wx
	WTz1vgTaQ+/I5Q8HAr8pFyr04RT8FtbpTBZ82Pe5EdyDfcxq5fOGS/YzhBL9neQLDN/kdDX52NQZp
	SPBlE8zjH7oSsEVriMxci4qzRDQLNrJLVaskwgnuaql4TQUPtizwvAuys8fW06Vi5M3CQ8AnDZbwi
	wpA3ijIR3tx6xGDnE0xqvcnoWFpDoTh6VhK7FfOpepaK+gohF6TzTqz42hPrw5P8uI1IbeLZWJzPW
	vUJgx8auOMmRS0I4j1YjCgbuJRbyCZtqinPUdwcQSpNS390be9hiM7uG/6iv/FG7TZeHRnkMWlSny
	hZDnrIJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5xAb-003NGl-2g;
	Thu, 23 Nov 2023 00:02:13 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5xAY-003NG5-35
	for linux-mediatek@lists.infradead.org;
	Thu, 23 Nov 2023 00:02:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 75372CE2612
	for <linux-mediatek@lists.infradead.org>; Thu, 23 Nov 2023 00:02:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B43AAC433C8
	for <linux-mediatek@lists.infradead.org>; Thu, 23 Nov 2023 00:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700697727;
	bh=o5GbEVHUU0U0QXOTArHF5+Dn6iBIxvrKU1BajDKL3zg=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=MCnodGUICDX8Xf6O+YdtdENlt8wDkOwD6VC3fR85h3/LO/ayZJOCojIucZHadmbJt
	 IoywE3s1UW74Oj46cywgs/tr118wfzSgtEDzwu9DDziHZ0qzllmmer7sQLfLMNOU2L
	 Oq96gfExGHKh+G/llIpsqsDOZKj8SUt4oaiTccqcNE9p53Pf7kV54zV+SXR75wGgk6
	 qs0dik8TLlQuhMCNqcvuyHHoAZ6WVbtFJBnhqaoCBgYvB3jtEkHmWlJ7Jduvr6/Fc5
	 zxRKvWLRyZ27qtI9dEpR6XKUgYkDACfb0eb/OPM+Af8kVs5NDu+Ip17HYwQK+g4ipu
	 zyzGqai9sIbFw==
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-5cc5988f85eso3471557b3.2
        for <linux-mediatek@lists.infradead.org>; Wed, 22 Nov 2023 16:02:07 -0800 (PST)
X-Gm-Message-State: AOJu0Yy0Kqmwty+0rjJ9wuHvRa1GS8NHRy/Vawl1zG7o7vViO7DqJatJ
	0L4kCvxqXO1YkEtKF6Yxx5h7UEKK0x3i3e057R0=
X-Google-Smtp-Source: AGHT+IGtfgN4C3PEPbflKLspfGtWB6WIZt/3pLq8b/u9uV0c3RHe6z1thJ+tvEyWgSOY+3jvD2EO5eJFhCw8d9QxT/Q=
X-Received: by 2002:a0d:f182:0:b0:5a7:b53f:c304 with SMTP id
 a124-20020a0df182000000b005a7b53fc304mr3884782ywf.37.1700697726885; Wed, 22
 Nov 2023 16:02:06 -0800 (PST)
MIME-Version: 1.0
References: <20231120084207.830-1-jason-ch.chen@mediatek.com>
In-Reply-To: <20231120084207.830-1-jason-ch.chen@mediatek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 22 Nov 2023 19:01:55 -0500
X-Gmail-Original-Message-ID: <CA+5PVA5mvb3g8FOP+ULWTBYu5-cxpk4UMZ0=PF+tbTqJjcCurQ@mail.gmail.com>
Message-ID: <CA+5PVA5mvb3g8FOP+ULWTBYu5-cxpk4UMZ0=PF+tbTqJjcCurQ@mail.gmail.com>
Subject: Re: pull-request: linux-firmware: Update MT8195 SCP firmware to
To: Jason-ch Chen <jason-ch.chen@mediatek.com>
Cc: linux-firmware@kernel.org, linux-mediatek@lists.infradead.org, 
	yunfei.dong@mediatek.com, menghui.lin@mediatek.com, shawnku@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_160211_241238_AAE8D03C 
X-CRM114-Status: GOOD (  13.27  )
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

On Mon, Nov 20, 2023 at 3:42=E2=80=AFAM Jason-ch Chen
<jason-ch.chen@mediatek.com> wrote:
>
> The following changes since commit 7124ce30ba82266e3972e99aacebeda712131d=
6f:
>
>   Merge branch 'mlimonci/encoding' into 'main' (2023-11-17 16:54:55 +0000=
)
>
> are available in the Git repository at:
>
>   https://github.com/jason-ch-chen/linux_fw_scp 8195-v2.0.23033
>
> for you to fetch changes up to a41fa7c5008809ae360ce0808e378b37b1d6c0f4:
>
>   mediatek: Sync shared memory structure changes (2023-11-20 16:18:04 +08=
00)
>
> ----------------------------------------------------------------
> Jason Chen (1):
>       mediatek: Sync shared memory structure changes
>
>  mediatek/mt8195/scp.img | Bin 635492 -> 635448 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)

Pulled and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/68

josh

