Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F897FF8867
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Apr 2026 20:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X2bI2UoaLvX4gCevaU7qNOHhhCPcAax0k/u3+iPwhos=; b=VaJJ1GFExCpG7s
	3w2zVwTeZxsNWlbTPOR38B+y6MYctQltCVL699YgIZgK97a1E1vkwKazKWF0qEMJShh+wUwdi9T/m
	lmYGZAz4ve93Nysccq1wD4sob9atsJpELZXnJYDiUU+9e+kuLKJOICT196UK8rT5QHFkbypE3gXY/
	CRNeydEgu5aHZxKGgKfcUpiYDkE3cRuCg/zg6U6zvgUijlxwcFUW2mRZtn7jRt/3ds04ate+FbVUu
	8ilch64Pwyu7qPz5ka/IVIDvAq5zKdtNzHCM5w+RmQxgZNnJL/0ijuEkOvf0bt9C3Xdr6CeIUKBQ9
	LAhr6lUJ1Xpb7QV/Ah5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHSRC-000000007Lv-0LlC;
	Mon, 27 Apr 2026 20:20:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHSRA-000000007Li-1xsR
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Apr 2026 20:20:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E462B60141
	for <linux-mediatek@lists.infradead.org>; Mon, 27 Apr 2026 20:20:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99596C2BCB7
	for <linux-mediatek@lists.infradead.org>; Mon, 27 Apr 2026 20:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777321211;
	bh=X2bI2UoaLvX4gCevaU7qNOHhhCPcAax0k/u3+iPwhos=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hy+7mITxsY3RF9VGJWL98ljKzomsIoVK2oIa2YDlwLMIUaCCYD4eNixLrsMYXtsmR
	 AIRHtSZWpFRDRDqp3k65eLE984AYxIAWHqla3UNhGY2HBXHCsii4MunlzQZPCD+elC
	 UF+zR0neDgrXsafnEilm7MpJOD9/wzaWVLXgIjK3UH5X14DlAqXYCK7EzfQ4en9htp
	 VPw+61liIAZGZATE2rXPbohATDSeqQGDdji0bgp+lHA3+mp4fPFKgb3uFPKrZfM9jm
	 4u2PmyhX+YD4cn5gmYBoeKpdICvenvNqPk0fnTJGpV1ex6n8wtThP313jPv1ECjBkJ
	 n0suIDTqNI5ZQ==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a402b2d102so11212588e87.3
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Apr 2026 13:20:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9qUPb5Pp0vDRmfGRA4khKr9w/u5pnPBhYmWxTUgEjVZ/3Cy91jwTw4GzpFtb7YWULryyeDK89LQM97b7TV3A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyXr2Yqqks37jL5mEpBvIH1AAx9WK+n2W7Qu7KZZbX7xqVmae3X
	6HyeDfuVA5mfWzg7+MDj/nLb1d6/Zsx0tLYpyGatZ/ShAtx6Ii5Ep5pGMX8uYTpY17N+IwuLJZV
	O/oaQzJHLRJp1l80VNxUtuehcahN9eog=
X-Received: by 2002:a05:6512:2203:b0:5a3:cc81:efdb with SMTP id
 2adb3069b0e04-5a7466234c2mr101158e87.21.1777321210358; Mon, 27 Apr 2026
 13:20:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260410070935.9540-1-bartosz.golaszewski@oss.qualcomm.com>
 <trinity-5e6f6a95-e576-4f97-9085-c6de21945eab-1775813076268@trinity-msg-rest-gmx-gmx-live-5cf7d7879b-qwfn5>
 <CAD++jLnjN-gUdCbmdmLaMYck=sP9wrhT2fFRB0TGCAVGvSsY1w@mail.gmail.com>
 <dc46f7d784281642aad6d47e79a3e91652eec667@linux.dev> <CAD++jLkz189qT1kJr34ratZT_n20oWEAQg8q0ttQ-VrsFchp7g@mail.gmail.com>
 <CAMRc=McRuH5Fi-5UQWLRe4+wXKH8qikaYqiqbGXrPOgaifEesw@mail.gmail.com>
In-Reply-To: <CAMRc=McRuH5Fi-5UQWLRe4+wXKH8qikaYqiqbGXrPOgaifEesw@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 27 Apr 2026 22:19:58 +0200
X-Gmail-Original-Message-ID: <CAD++jL=m6RGc8Lv0Cn2xsnn8kzV-paAMos4saYNFTpjUcxwcvg@mail.gmail.com>
X-Gm-Features: AVHnY4I-QfyRqRKRQSMK3sajFg1wZNjagZwtf7cBxvDJnumElCFBOdrk7T_ZX5A
Message-ID: <CAD++jL=m6RGc8Lv0Cn2xsnn8kzV-paAMos4saYNFTpjUcxwcvg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: moore: implement gpio_chip::get_direction()
To: Bartosz Golaszewski <brgl@kernel.org>
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
Cc: sean.wang@kernel.org, Frank Wunderlich <frank.wunderlich@linux.dev>, bartosz.golaszewski@oss.qualcomm.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, linux@fw-web.de, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Apr 27, 2026 at 12:33=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.o=
rg> wrote:

> > Fixed up and applied. Will be going in as fix for v7.1.
> >
> > Yours,
> > Linus Walleij
> >
>
> Hi Linus!
>
> It seems this one got lost somewhere along the way? I don't see it in
> mainline nor next.

I'm just slow at pushing out my tree, it's on its way!

Yours,
Linus Walleij

