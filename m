Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF55C5AC7A
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2026 17:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gg3oYVQYlXm6P2vtp12+vm5BasXw2QLtKk//NjWMotI=; b=ZttsSzvqUHCwDgZkrl++gkt3v/
	g3SgRFu6ogQaYALDwWZJbRmEu3JVxIeCkSFlrHyNiRvbKcPqchX29hY7A6xgj9iYhbePJI8ZOOfp6
	uX3AJe2jpRWtBRk2v3vc+/zxxWmcOjvZR4Rgbk1INMoA+gsfOjuFjGulg2t93acZ9O47f8kJhNtBg
	aD3gmXx9tfeB0ERV3jbeVZxWbJ89fpNCXSEeve9u8ZDh+YKVlFCkzXCXVMQ0yMtULslLmZPKqQgt9
	HlPpmfYESIvbaKmtJdkNEFnMRh8yATrEKKBd8kzfiyoNLZ/Z8Zf7ZRJecMFFZgZNBgYMnQMpXD/vW
	+/WqEFMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsOFJ-00000008Vz9-20Ji;
	Fri, 07 Aug 2026 17:20:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsOFI-00000008Vz2-2dOC
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Aug 2026 17:20:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6BF6F43D4A
	for <linux-mediatek@lists.infradead.org>; Fri,  7 Aug 2026 17:20:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 542931F00A3F
	for <linux-mediatek@lists.infradead.org>; Fri,  7 Aug 2026 17:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786123230;
	bh=Gg3oYVQYlXm6P2vtp12+vm5BasXw2QLtKk//NjWMotI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=GI849d+ENPlRt+jEfPUbSYHpsLYzTq20IlsqybWARiiUfl6kGQNclXPXL7pYFBTaQ
	 WYeu4cXuY2rPPYVA5qNLVQCiBs+sBy3ajsURnJkmYPe8RtanD+bIljsOL1hBDEsko+
	 M+OPbNP1y3tU8euCPePmPVKnxU3x0HdJ4eauuuoKKccK2twfIthwHphxBXjWjI/7rY
	 KT8wIHsOiTM0Mef1EvMzCeYqyInPdV76ZRmcJSw57iUDN3RrY/cS824MJwvKbLxpAK
	 5zo3eSpgcWhxi7PYb/z15YJ4kGrcG0pKoDgzDn+iNXaQy6Xzv2rVdOeCXimx+hy/EH
	 5SmNmM2vCJkXA==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5aeb2bc82ccso4406021e87.2
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Aug 2026 10:20:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqYj7MfQLsy+Bd/+sm0zGHKCvmn1Pa3LOMOBId4t7GZvNSyWkscfHfgQKWsIPYiel3na32KrJf74KJ1F3AaVg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyDuEFUADh2B94oKbq6werqOnRMNcdDX5qPpdP0y34C0J8D7c4n
	sdpWlOroMYcgPf0E5w1bTgc2tx004gF4I3rMVocCFvGpkl6QBNmCsuvsEIsI1d0UHoNzgYUVyyK
	MhbpUzePZbfrQ4Pvdsi+EbuJZPVkiXKI=
X-Received: by 2002:a05:6512:3784:10b0:5b0:12e1:486c with SMTP id
 2adb3069b0e04-5b30b740f96mr210413e87.24.1786123228943; Fri, 07 Aug 2026
 10:20:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260806220615.4078303-1-mikhail.kshevetskiy@iopsys.eu>
 <CAD++jLn8uL7NePnPK6SNcuKRjxm6c_98Piu4Y+urKko5eT-mhA@mail.gmail.com> <4c0f22af-6124-4118-8ebf-0725e8fc89bb@iopsys.eu>
In-Reply-To: <4c0f22af-6124-4118-8ebf-0725e8fc89bb@iopsys.eu>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 7 Aug 2026 19:20:16 +0200
X-Gmail-Original-Message-ID: <CAD++jL=8Ki5cM9buRVRNNorC00Lug=Zxyvco8jx7fQi-cqT8wA@mail.gmail.com>
X-Gm-Features: AUfX_mxQjz2qk4FtcquHlSD4s6HrtS5fu7UyLqTNePyQlrK7Tk9WIU-tS9v15jo
Message-ID: <CAD++jL=8Ki5cM9buRVRNNorC00Lug=Zxyvco8jx7fQi-cqT8wA@mail.gmail.com>
Subject: Re: [PATCH v11 00/37] pinctrl: airoha: split on shared and SoC
 drivers, add more SoCs
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Christian Marangi <ansuelsmth@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, Markus Gothe <markus.gothe@genexis.eu>, 
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>, Daniel Schwierzeck <daniel.schwierzeck@gmail.com>
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

On Fri, Aug 7, 2026 at 6:39=E2=80=AFPM Mikhail Kshevetskiy
<mikhail.kshevetskiy@iopsys.eu> wrote:

> > This patch set began with 11 patches and is now 37 patches.
> >
> > Is this becayse Sashiko is touting you to just fix more and more issues=
?
> >
> > I think at some point we have to draw a line and say "let's fix the res=
t
> > later".
> >
> > On the other hand I appreciate your efforts...
>
> following reasons:
> * move binding changes to separate patches (8 patches)
> * openwrt upstream changes (4 patches)
> * issues found by sashiko (5 patches)
> * new features (3 patches)
> * code cleanups (4 patches)
>
> so growing from 11 to 37 patches looks reasonable

Fair enough :D

Can I ignore the  new Sashiko moanings and just slam this all
into my tree for linux-next now? I.e. are we happy?

Yours,
Linus Walleij

