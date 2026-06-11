Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3423CCD98D2
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jun 2026 11:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C5eCQ2m+9ZnT9BEwMkn6XIzbcen83Vtx+Hp/s3prw9U=; b=fcW/LyNtEB8/dENCLtHLpuu7uu
	X6dK0V79vCxlTDg5Xm77qGmoTQlhQ8XHeSgfv6ejlUEIuhh71MosYneBiGmb73TKAAcWPeGqeIoQH
	YDq1kwnwGrIfKeE1nCMDHALf/11fHTqaZaCNuVZWNv0go640PCBsqzOrQiE5zmEasalPsHVpKmp1y
	1XHEEcuvt+1xhC3VBCq+rNwvfLndaG++WpBBCG+D9aD7zF2kYMkgph8lE2kqNpLFP5Rfj2b03E3Lz
	8JwTxvocW9spa8nRoVpUY1m9n06i0jaDzoMxLMsCFGTrIC+YPqFmVOFSs/uFrQDtTas4Bmw2PDsuQ
	3nmjbmUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXe3Q-00000009M1i-4BQi;
	Thu, 11 Jun 2026 11:58:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXe3Q-00000009M14-1sMW
	for linux-mediatek@lists.infradead.org;
	Thu, 11 Jun 2026 11:58:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B06A46008A
	for <linux-mediatek@lists.infradead.org>; Thu, 11 Jun 2026 11:58:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6737A1F008A1
	for <linux-mediatek@lists.infradead.org>; Thu, 11 Jun 2026 11:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781179115;
	bh=C5eCQ2m+9ZnT9BEwMkn6XIzbcen83Vtx+Hp/s3prw9U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=doeezvb2/5zokwyIlK+Tpp+JQbgxLLB8ubmaGu2t4ula10p9XR+AXSK7qrfa8YFrt
	 Ar+eN6O0mlGTAciR3AAV72pjHLeRr3hzWTd3pF6fkzADeepwFMitmBeLk5D9iLC/C0
	 qiTX8r4VbvrvIrZ4LgYKwd7Of6gUD038Y+3+y12uDxguF4tPO258SqJzjqKt+ZoisR
	 Eo1O3rHYLz1sRuWg7Twbsd/+KCFbCcEIh1JqyvoS+8JqwkmYJPucbURlrRq6rUGi3l
	 AEifYXahqRCENJxgHuwbqmHl1DAIKi5R0krcLHWL4jvESg+VA5Qi4NIlu1VU8Yg2ey
	 u+XHNQzAP+ebA==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-39677aed4d3so70991751fa.2
        for <linux-mediatek@lists.infradead.org>; Thu, 11 Jun 2026 04:58:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ93HTJTn5D8rh+oOQ1akJTGmxAMGHKSod3i0gf3LSL7kFLDKWrMl1F9svwnyXj931mJba778ShOV06GpaRYcw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxTPXdwlvOQX8IM1vqPSzJ0c2v349qa8bETU+jXd1fSW3puaC5W
	YBge2v0NYm2n7zWZLUkf+ya/72H4JNRpYge9AUxrF04Efs8rNpt5979LmxuuTd8MvUZn3kze7wH
	qd/Yj7itFizIJe6PAmr4hzRv0Zs3NzQ0=
X-Received: by 2002:a05:6512:110d:b0:5aa:6c89:72d8 with SMTP id
 2adb3069b0e04-5ad27ac49c5mr780915e87.19.1781179114160; Thu, 11 Jun 2026
 04:58:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260607001654.1439480-1-mikhail.kshevetskiy@iopsys.eu>
In-Reply-To: <20260607001654.1439480-1-mikhail.kshevetskiy@iopsys.eu>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 11 Jun 2026 13:58:21 +0200
X-Gmail-Original-Message-ID: <CAD++jLmzfnOaz1h-e2CP7++AYi0CW6cDF9dTO0aU2m3tRfWfBA@mail.gmail.com>
X-Gm-Features: AVVi8CfHelBjMWn0SWXQfsRaUfTwlnx7-cxwN6bRp62FY340cXBs5nRmH5Xbr2Q
Message-ID: <CAD++jLmzfnOaz1h-e2CP7++AYi0CW6cDF9dTO0aU2m3tRfWfBA@mail.gmail.com>
Subject: Re: [PATCH 00/18] pinctrl: airoha: split driver on shared code and
 SoC specific drivers, add supporf of en7523
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Sean Wang <sean.wang@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Christian Marangi <ansuelsmth@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, 
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>, Markus Gothe <markus.gothe@genexis.eu>
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

On Sun, Jun 7, 2026 at 2:17=E2=80=AFAM Mikhail Kshevetskiy
<mikhail.kshevetskiy@iopsys.eu> wrote:

> This patchset
>  * fixes a series of issues
>  * split combined driver on common code and several SoC specific drivers
>  * adds support of en7523 SoC

This seems to be a collection of previously posted, reviewed and now
also applied patches. I don't know what to apply and what not to apply
now.

Please rebase the remaining patches on to of my pinctrl "devel" branch
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/lo=
g/?h=3Ddevel
and repost as v2.

Yours,
Linus Walleij

