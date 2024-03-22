Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE33C47DD9
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Mar 2024 13:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0cR7pF5HX2GHPONoKQ+9dp9O0BQdTc6dwMQmpbSLDCc=; b=DoKWOF0Lp4zu/IzXw/DSgdAfKf
	SbrLayN4G2Fjhp+lGjICqIjTt42Ias320sVpdUL2wSlDsu6aWx/S2W1gPolDHbOBbeFAif4rrAJX3
	LTOvkZQGKRRIg30eG7HmYq8EkYHU11Gm4AIVEycnlzDFBpXcq6R8tXNDAW6WLdjfd4PVpgZ+8o15o
	xCjNB4nKqxeyWmKbSlC1TJgoMQHGjiPxZ7l/PnwdLD1/k0YTTvfMeqsjc40+JcfNN745l4c5w8S+h
	UQ7fA+9AXsEleO//xb6uFpXCEaselTQ4vrcQCFi8IEgElNAfPMwPtNT9QSQdZFDtPByScF8qOinKp
	ZzGdrOvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnf7g-00000007NCw-0XB1;
	Fri, 22 Mar 2024 13:39:52 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnf7c-00000007NAE-21Ef
	for linux-mediatek@lists.infradead.org;
	Fri, 22 Mar 2024 13:39:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7FAE4CE194D
	for <linux-mediatek@lists.infradead.org>; Fri, 22 Mar 2024 13:39:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5BD1C43390
	for <linux-mediatek@lists.infradead.org>; Fri, 22 Mar 2024 13:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711114785;
	bh=5TgSuCauS8GT6QQBaZPrZ5FUn7IoDZ6oyTws1noJ3dU=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=jCRSWwtgI1VTREEpxVvdKrcnVV4Xc0WSWjDLuG5ZqA/F1eO8PPKIh9NB91vX1TSBC
	 DbopIxSssShPK9LF3zZOuLct9A1mM6COnudYcucWsY6pcNRpTG8YiDvD8bLUQk1qkN
	 RQLMrRj2Ugrn5tfHbpOHyvVtD7MUdzrhvUL3cadp5fRmuTFo63qrS4EE3M/GJIfpQ0
	 tqZfkB1bQMwcfP+rn+wKTNVUDUqKWHFkCxS30MWXVC2hfEHDGIrnFqbg3DnaiGMgm8
	 mXe8mqZQX/X90bp5E4oPXtVTyajuGL7H7FhGYCIm1XglDPS61yJasivi4vdwLO/9Ti
	 OuJ5b3uMaIgaw==
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-db3a09e96daso1908447276.3
        for <linux-mediatek@lists.infradead.org>; Fri, 22 Mar 2024 06:39:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXyLzJRgGNh8FmJ/dZa1bq4NqWzn+heq9JcGYjz/hEXen2B7QcHLpR+nT4aRQWDibTj3o4UHOhEumqSl06JXU+ovtjZi/FnFLBaV+1dQIs1R1DP
X-Gm-Message-State: AOJu0YyXWFSL4861GAsSMxZRPbhaEBH4liY7H9aSdim8MB/TiTzSlgHK
	eDj5RjtgjAm/0a/PfNTSUK9OeLDF4O2NIMp6+hgeqnftK2lkUBCyzcIik/aYyXTvIVdz3qTRWsl
	XtBeul8VOLBYO9b2qMghT1IWu1hY=
X-Google-Smtp-Source: AGHT+IG9QOnlmA925r/URlwN8TWyLSJ8cidRQ/KYULhpPmwaQG5KAQuoRS5+qmd5tlP2wVw70KmwZLmMHc3/VbuXD4A=
X-Received: by 2002:a25:2f0c:0:b0:dcc:f5d4:8b43 with SMTP id
 v12-20020a252f0c000000b00dccf5d48b43mr2071317ybv.9.1711114784961; Fri, 22 Mar
 2024 06:39:44 -0700 (PDT)
MIME-Version: 1.0
References: <30f41011495fb0b11a11eef9c7a536268306edb2.camel@mediatek.com>
In-Reply-To: <30f41011495fb0b11a11eef9c7a536268306edb2.camel@mediatek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 22 Mar 2024 09:39:33 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5unmBTXbiksB=N5x16RinxnYGgevPYZ0Hd2j7owLGRsQ@mail.gmail.com>
Message-ID: <CA+5PVA5unmBTXbiksB=N5x16RinxnYGgevPYZ0Hd2j7owLGRsQ@mail.gmail.com>
Subject: Re: [PULL] mediatek: Update mt8186 SOF firmware to v2.0.1
To: =?UTF-8?B?SGFpbG9uZyBGYW4gKOiMg+a1t+m+mSk=?= <Hailong.Fan@mediatek.com>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_063948_917626_3A12915E 
X-CRM114-Status: GOOD (  16.94  )
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

On Fri, Mar 22, 2024 at 5:32=E2=80=AFAM Hailong Fan (=E8=8C=83=E6=B5=B7=E9=
=BE=99)
<Hailong.Fan@mediatek.com> wrote:
>
> Hi maintainers,
>
> This pull request updates MT8186 SOF firmware.
>
> If there is any problem, please let me know.
> Thank you.
>
> Best regards,
> Hailong
>
> --
>
> The following changes since commit
> 22ee1d8ca6663ca7c28477581993d6ed5cc54323:
>
>   Merge branch 'robot/pr-0-1710861164' into 'main' (2024-03-19 19:07:14
> +0000)
>
> are available in the Git repository at:
>
>   https://github.com/hailongfan-mtk/linux_fw_sof v2.0.1

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/183

josh

>
> for you to fetch changes up to
> 9a6a0cc195c108c677165075c55cbc0e417a1e64:
>
>   mekdiatek: Update mt8186 SOF firmware to v2.0.1 (2024-03-22 17:04:27
> +0800)
>
> ----------------------------------------------------------------
> Hailong Fan (1):
>       mekdiatek: Update mt8186 SOF firmware to v2.0.1
>
>  mediatek/sof-tplg/sof-mt8186.tplg | Bin 16191 -> 16191 bytes
>  mediatek/sof/sof-mt8186.ldc       | Bin 48436 -> 48564 bytes
>  mediatek/sof/sof-mt8186.ri        | Bin 128712 -> 129304 bytes
>  3 files changed, 0 insertions(+), 0 deletions(-)

