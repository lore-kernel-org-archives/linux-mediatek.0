Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA0C3D44D77
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Nov 2024 14:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hn6mOZawyTS5w2vB4l1JrcnPWfoSaQ4Gqhcbdm4fxdc=; b=jiWhpPINO3jdwF1qO65VG2GkTd
	gvX4/dLjF6VWOgFyX3vNVPy2OGvCawcd0C8h41IIvIWl9VvEGslREkLiD5aqKhuQGTfOctLTYzoYZ
	2Qiwf24tqV6N2bC2XCeCDsPxQX9bh7WvbCGa547GmstLOrN2fEq8asO7CRG2E7mFWOIK2VHlZTW1O
	KzTiEq9qzdSCrDwEI//LtB2gxxjgti6Vc9CPwosU5/Q8IahcEweZooEJk0cDCXnvmI/UKpCeT9eJe
	6pxs/Litbzt7P3VpcvjGr3LZJm4giYxb/usE0olJtWjX1hafMEUaAz0exUcN8fbo7Kh009tTTsVTN
	25RFeITA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8gkx-00000003YCU-3RAE;
	Wed, 06 Nov 2024 14:11:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8gV9-00000003VQq-1zN0
	for linux-mediatek@lists.infradead.org;
	Wed, 06 Nov 2024 13:55:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E475A5C57F8
	for <linux-mediatek@lists.infradead.org>; Wed,  6 Nov 2024 13:54:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5327DC4CECC
	for <linux-mediatek@lists.infradead.org>; Wed,  6 Nov 2024 13:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730901313;
	bh=d4EM6mtLal20B8LZsV+CPjK2lFL7YVutRh5DdPWqz3E=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=COaYLYjKCZ2TxU1jrUxSoLSNRhHYazbWfNRh/Pqp43xzsPbsoyokqwBtapUMj3VT2
	 yV1KtQcpw6iSHcZQh1+v9eTcaeT8YxbZj4YfLbcIqbHLJwEWMHIPksMIYW2BU25oBd
	 oyN0RElISciLd7ym2wKKSqF/zP1sFRoPTK1Ib5vKuTzWMn3xoKA0wjcDgAkO5Lg7mA
	 ArKe4oxZX8o06xnYJqw2lixfRY2LRg4t2Yn2O3541fg5U+c572ZCYuVWsZ/i8na6Y4
	 uxkMzEw7LxGE9ziMqfe3n4i3HTvcjpzuLPOoJzUhPNIhSF65zyeQfCCOyh40Z0l8pr
	 Vx6Fpr9j+irjg==
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6ea50585bf2so71568777b3.3
        for <linux-mediatek@lists.infradead.org>; Wed, 06 Nov 2024 05:55:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXAlkGjDGh+p/s438AMDaQFydDC1/hA2XtwJB9ouv8If3pM1fRqF0WU3IvVJxziIa2y/wH+4DPRcRB09c1LSw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywh10sB/zWCWEXA2/YJlVwTIR40WnSZqvTseF9uMKomByTIWw4O
	W4BW4JBJl6CNq+xhLfz5ZJjURyhrHUsd3Lhi2Qqtl4xzpo7+5+OXav4qV7xuURh3p/2sMcYQInO
	woAsALbR7cVFFFnjOmAkxE1TVKsU=
X-Google-Smtp-Source: AGHT+IGa1lUB9PdniSpywWNKpUKfY7p+4rKEVHMIImOb10PjezU0QCBOPyvYj8qIkNZ++d8S92SjkPw9Za3N63dwRxc=
X-Received: by 2002:a05:690c:6211:b0:6d5:90f:d497 with SMTP id
 00721157ae682-6ea64b18e26mr195025467b3.19.1730901312488; Wed, 06 Nov 2024
 05:55:12 -0800 (PST)
MIME-Version: 1.0
References: <20241106025439.25929-1-yr.yang@mediatek.com>
In-Reply-To: <20241106025439.25929-1-yr.yang@mediatek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 6 Nov 2024 08:55:01 -0500
X-Gmail-Original-Message-ID: <CA+5PVA4va=YSDFRygt856fJGGpHuBY0teaJgFg5pmxsXvuWpwA@mail.gmail.com>
Message-ID: <CA+5PVA4va=YSDFRygt856fJGGpHuBY0teaJgFg5pmxsXvuWpwA@mail.gmail.com>
Subject: Re: pull request: linux-firmware: Add sof-tplg for mt8195
To: "yr.yang" <yr.yang@mediatek.com>
Cc: linux-firmware@kernel.org, linux-mediatek@lists.infradead.org, 
	shawnku@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_055515_622196_C843F819 
X-CRM114-Status: GOOD (  12.64  )
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

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/354

josh

On Tue, Nov 5, 2024 at 9:55=E2=80=AFPM yr.yang <yr.yang@mediatek.com> wrote=
:
>
> The following changes since commit 8dbcf94bfc68bdb1c6df3a42762b2755570955=
58:
>
>   Merge branch 'robot/patch-0-1729102102' into 'main' (2024-10-17 15:40:0=
4 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/mtk13576/sof_tplg adspsof
>
> for you to fetch changes up to a142ad7250ffd9292e225780ba69c61bf11696d2:
>
>   WHENCE: Add sof-tolg for mt8195 (2024-11-06 10:14:38 +0800)
>
> ----------------------------------------------------------------
> YR Yang (2):
>       mediatek: Add sof-tolg for mt8195
>       WHENCE: Add sof-tolg for mt8195
>
>  WHENCE                                                   |   3 +++
>  mediatek/sof-tplg/sof-mt8195-mt6359-max98390-rt5682.tplg | Bin 0 -> 1619=
1 bytes
>  2 files changed, 3 insertions(+)
>  create mode 100644 mediatek/sof-tplg/sof-mt8195-mt6359-max98390-rt5682.t=
plg
>

