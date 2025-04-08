Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD87AC3600C
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Apr 2025 11:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Idg/AtNSdQ795MwBxTR+z9PF5G/0HQp6MoqSFPEL4UU=; b=cpMubsc/fIggXYBAnef+kV1p4y
	DcL1/04q7oLXkZyFxemeTDNzuSBx4E5Ej82Wt61U+AqxI4+5THjbc1mXUeW0zOiYm+8UilZAUTDme
	XlJBL1PQdc7r5fS7hZ5GmIhxUqwo/QRGW45oMY4mbzptoPU82WrZjB//zh140ZWY9FQZ0tau4EkgF
	Bi9o+EqAbPpN2yXyfKPbZDJoKpvHwzvG4LngVFwP7NXB3uIrHwmqjNI7U2w7vWFh4ntFn82BeMGSZ
	3Ws9OdCYFO11VL1VQYSk7R3hBxrt3s3lVdz1NY6Ru81Rzb+fSHPDdgBAPWZ1vnwtEfu1KJLH6P10k
	zvjaXJAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u26iB-00000003mV9-3wJU;
	Tue, 08 Apr 2025 11:01:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u26GC-00000003gMA-1Cf0
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Apr 2025 10:32:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D27D0614B4
	for <linux-mediatek@lists.infradead.org>; Tue,  8 Apr 2025 10:32:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61827C4CEE8
	for <linux-mediatek@lists.infradead.org>; Tue,  8 Apr 2025 10:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744108371;
	bh=i3aXzChtlKV3AcEvsA7bJSGrARzwSKe2Qg07dvWZRPA=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=EVjFnhkIsSJ6QWXIeaLCTJTeTNib4EpeHQxqCD0h7mnG3NbWwTyFvUp4KE5fyWdSI
	 35qJeH8xf4onMDPuAPD6de0Ea73qA1OVe0j8OCuQlelC92GSfdjGQ1xHJvD1YNGhXB
	 WiIUeskZ2bZDVgv7vSiEm+mNd+EmdaXigUxORo2S6jYgthLhRrboLTNzwvkI8XYCD3
	 ZzFcIlBQhIHZnM/neSwSGCJAGN74wcHBag5iWxXqm7IZzG0wM3UJsZbsjYX2h2lPN5
	 hvUCaKCt45Xj4CaBn84aTjPufTnlN98xvjCWVedL34xg1NWfvacur5o0F0uU6Yju/F
	 eucAjA1SuiG3A==
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e6a8aa771e8so4560333276.3
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Apr 2025 03:32:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWHmBdPdABjUVxb59syV2ZgKAXDDrsS701tO6QuTwbKafsbtCTj6qipb3hgC+BA4E+Yp/VVQ1huyBpVGWBm5Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxleG69eYzzRxvGPkgqi5hxLo22uLyTmo119tMkF2r6KI6NVkPH
	hTHSmzwixXpfBdgznQUvEZ8w1/YXSHJM0mIsa/8Xfmsn4TWSgkChoAl3lzHB6mySTQNJNa7Yivs
	A1nUg3tmHUi/wK1H8IQXGmu0LqYo=
X-Google-Smtp-Source: AGHT+IHzh9/+LcLDg4bQ+2neylxfbf1jz5c8w9h6ACyB21Pg4dIdfxBhIc+32C00IVXyABrjxsW7af3CcdIoplZLVHU=
X-Received: by 2002:a05:6902:220c:b0:e6b:7fca:c82e with SMTP id
 3f1490d57ef6-e6e1c29a310mr26950336276.16.1744108370619; Tue, 08 Apr 2025
 03:32:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250408081404.302196-1-zoran.zhan@mediatek.com>
In-Reply-To: <20250408081404.302196-1-zoran.zhan@mediatek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 8 Apr 2025 06:32:39 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7nKR4Dc6BgA417FmctBvO0BUsFADgRdU73xNpOXVJMhg@mail.gmail.com>
X-Gm-Features: ATxdqUF-GMNKQfWIYZJMuVzPtYmtiSiOcwysQGSpVRC75RvdHjBLqQU35YeBxtE
Message-ID: <CA+5PVA7nKR4Dc6BgA417FmctBvO0BUsFADgRdU73xNpOXVJMhg@mail.gmail.com>
Subject: Re: pull request: linux-firmware: Add MediaTek MT8188 and MT8195 SOF firmware
To: Zoran Zhan <zoran.zhan@mediatek.com>
Cc: linux-firmware <linux-firmware@kernel.org>, 
	linux-mediatek <linux-mediatek@lists.infradead.org>, shawnku@google.com, 
	Macpaul Lin <macpaul.lin@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Apr 8, 2025 at 4:14=E2=80=AFAM Zoran Zhan <zoran.zhan@mediatek.com>=
 wrote:
>
> The following changes since commit d864697fd38a94092b636c8030843343f265fe=
69:
>
>   Merge branch 'rtl-bt' into 'main' (2025-04-01 11:24:40 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/zoran055/linux_fw_sof zoran/soffw_0327

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/507

josh

>
> for you to fetch changes up to a7b3d211e8ef628ab84d955d1b13d2070388fd02:
>
>   mediatek: Add new mt8195 SOF firmware (2025-04-07 16:04:56 +0800)
>
> ----------------------------------------------------------------
> Zoran Zhan (2):
>       mediatek: Add new mt8188 SOF firmware
>       mediatek: Add new mt8195 SOF firmware
>
>  WHENCE                            |   8 ++++++++
>  mediatek/sof-tplg/sof-mt8188.tplg | Bin 0 -> 16191 bytes
>  mediatek/sof-tplg/sof-mt8195.tplg | Bin 0 -> 16191 bytes
>  mediatek/sof/sof-mt8188.ldc       | Bin 0 -> 53900 bytes
>  mediatek/sof/sof-mt8188.ri        | Bin 0 -> 112488 bytes
>  5 files changed, 8 insertions(+)
>  create mode 100644 mediatek/sof-tplg/sof-mt8188.tplg
>  create mode 100644 mediatek/sof-tplg/sof-mt8195.tplg
>  create mode 100644 mediatek/sof/sof-mt8188.ldc
>  create mode 100644 mediatek/sof/sof-mt8188.ri
>

