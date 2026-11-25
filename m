Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C527606A321
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2026 18:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WwlJMfJi;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Se44L7Q4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9xVD7bdz9+WmMAUxY10TyWuzNNqlkKipL2zUO5K9vKY=; b=WwlJMfJiJaliVL
	c0SAxePK+oIfOO1o6mTJ53ujP3SvWi99dL3SHB1SUAvV2sUQTZNUPgzvP3itvowmE2Kry+GNh59L1
	lbBAZZ59CS0VKBezQEaGdRlNQEYYocYBMLjuURzHpDVqETa0auGlj6gMJ9sfrwq3FTwiRJ8cfjfBL
	LFakrohYRkOS5iOz0g1yg3iASdK4N3TtGnSHYnx+8umcrxShcGVeo7R3ZJ1XHxPoeUr+7f8r1koX7
	KYyW6dDlz2riIREPU/3GtFPVEpwfetQgk2xcPQybxWb4eoi/1Ml3umm5LCmKAZGlhtAxX9tAnS2MV
	TvZs35Yb2fDz27r4uzdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHq8-0000000B1LY-37Lt;
	Wed, 25 Nov 2026 18:35:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHq6-0000000B1KV-06aq
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Nov 2026 18:35:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C6F45460D4
	for <linux-mediatek@lists.infradead.org>; Wed, 25 Nov 2026 18:35:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B5231F000D0
	for <linux-mediatek@lists.infradead.org>; Wed, 25 Nov 2026 18:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795631729;
	bh=9xVD7bdz9+WmMAUxY10TyWuzNNqlkKipL2zUO5K9vKY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Se44L7Q4cJUXGUkTEzWkUfaYZtmSE6mglSqozkwjpXGe25j0WfPbfVDEuR+zdqMSo
	 +o2GmmVafalPbZPHZPxBFUmdC3o/h2ruPQT2dDO3Zv1pg28lG0J5weslKOmg+EwG+Z
	 NNRKA16MLuY2hkb/A7a4lIJzuioAVut7n9LtTYVzU7H4zOY66qVzTsyyJ1wp+nHVqm
	 PzW6MG9aopLXb/fzYrO924LnIfnCOlSdXmhm7j3qXS5BDdLN30oJsQJhI5GiyM+2dz
	 nGQc8G9kJew6QqIDQPjbb43XIFb6PzaB1cS2Hp51up7jhxHOBGEhY/qP6Gv9WiigSj
	 SYQ1O3gm/GHMA==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5c14470729eso5666673e87.2
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Nov 2026 10:35:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFE5OvuxW5q324KBFyQuqxcOiRQzUJVrie8Ie+xZWv257cbX4XUCjnM1MelpKafbYHUxdjjG5qFxofoLfXj7w==@lists.infradead.org
X-Gm-Message-State: APuU4Z857Bkj2FUNtqODFbrz20JPZdWGfmJ+DaLalyTbgqj8lDJxq5Fv
	8l+z74u8illLqWzfHLbiLtoi178YDGdrip1X+9zT7ggW2DeulFkGl59UHtJixZCLJAZHMuOUofh
	DuawPyJ+T9XNdafWyS2g2dJ6ptgI0UE8=
X-Received: by 2002:a05:6512:3ca7:b0:5c1:57c1:bc89 with SMTP id
 2adb3069b0e04-5c1bc8c6d32mr5057176e87.65.1795631728358; Wed, 25 Nov 2026
 10:35:28 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261119204748.2558209-1-lee@kernel.org> <20261119204748.2558209-5-lee@kernel.org>
In-Reply-To: <20261119204748.2558209-5-lee@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 25 Nov 2026 19:35:15 +0100
X-Gmail-Original-Message-ID: <CAD++jLmPs3MxaRvk3+csA5wwx04ccaYF=DqC61Twb+b+Q5Ys+A@mail.gmail.com>
X-Gm-Features: Aa3M54pSiUm-Sabn52M6gTOmNq3pyFFBJdM-jwrYQTrlBs-ynEpBtUVfQzaBT0w
Message-ID: <CAD++jLmPs3MxaRvk3+csA5wwx04ccaYF=DqC61Twb+b+Q5Ys+A@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] pinctrl: mediatek: Guard against NULL eint in
 mtk_eint_do_suspend() and mtk_eint_do_resume()
To: Lee Jones <lee@kernel.org>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Maoguang Meng <maoguang.meng@mediatek.com>, Hao Chang <ot_chhao.chang@mediatek.com>, 
	Qingliang Li <qingliang.li@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 19, 2026 at 9:48=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:

> mtk_paris_pinctrl_probe() treats mtk_build_eint() failure as non-fatal,
> logging a warning and completing probe with hw->eint left as NULL
> whenever EINT initialisation is skipped or fails.  However, the system
> sleep callbacks pass pctl->eint unconditionally to
> mtk_eint_do_suspend() and mtk_eint_do_resume(), both of which
> dereference eint without checking for NULL.
>
> Return 0 early from mtk_eint_do_suspend() and mtk_eint_do_resume() when
> eint is NULL.
>
> Fixes: 5c0904488a20 ("pinctrl: mediatek: Add pm_ops to pinctrl-paris")
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Patch applied!

Yours,
Linus Walleij

