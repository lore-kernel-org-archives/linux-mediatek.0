Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3067F606A321
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2026 18:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=H+7Ydkf+;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MKwKUi1f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=prrX32fJ5wksd3jSdKGTMIlOF4TSPJHLdr5EwTLREDg=; b=H+7Ydkf+pgA+K8
	uYG7vDd2Vnqnacwp4CQSl3e6ZOvUeoWRbEh+aIs8JwCUYx/VQ7StN7gU8MO9lQDVN0GCTsOr4yX+1
	J2B9v643fPzD2Tzg7zPuSSc0wBxZvxLP9DQ8mUBy8XnG5gDiYjwSPNRGYS2Nq8HuZ/cmjLXKRHVBa
	aL3dyhnBXwNHy/hEVokDCFmysI9lZ0FEwhytGnSXqP5yKZ2ltZu/x+zj6fluQkRtbKOpqqWQgGE3R
	Q5y6SJo9MjNEvxwOQIqkJoN4kmBA1EmCBIJtOwGLCf8paeb6jSvifslH0ie9e5YtKqWYXW4bnFa34
	ptXYBXXAoiedLTZhQNwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHqi-0000000B1Yf-3iJK;
	Wed, 25 Nov 2026 18:36:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHqg-0000000B1YI-33nu
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Nov 2026 18:36:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 38BF0447DC
	for <linux-mediatek@lists.infradead.org>; Wed, 25 Nov 2026 18:36:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D1201F000D0
	for <linux-mediatek@lists.infradead.org>; Wed, 25 Nov 2026 18:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795631766;
	bh=prrX32fJ5wksd3jSdKGTMIlOF4TSPJHLdr5EwTLREDg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=MKwKUi1fJJvcCPVdLLxu8p50q0lnzCJf9bfKw3VLUaOnYBTQeZVi70M9Q58NAnrgN
	 Q579fHlrscQ8TCiJBKkDa1/WHtu40DMUvC01Rud71CSQqnqo/hMXAJxqJtF64KqOlT
	 33cT/TxT0+HgAA6PnIfL0jMWqkVu/aQeb391FcsZUts2JlnFYJF2VSdrg7tx+gdI/h
	 8Jyb6qA5oYxFxfTtbxHBWl7dhKSC5Hw3Y2qoMMHAoupwu9/d0AdzteuIwZFsYm5888
	 Ym5VngmyEn9Ipj8Y8UhpLvSOQFRw1PBJ8O923JC1LbqbKNxwArgV6CR/wtKnTYTHPX
	 rpQUJHgZi3uxg==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5c1a947b4adso5102540e87.2
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Nov 2026 10:36:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHi4xdbeTmdLEh6CsZVPtMHTyFIT0aNrhe0usn8tNHwVEKtKoBZA5DVirzq+tOf44H6PQpP/MMRVJ/YWLypGQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z/ZZmfiGd4SoUr9NFyFRoC6jo8QuLCIgqfycL8uxX7bXMyGRFLd
	EOv4rT2lcGxoLrzDFWdoXaqL5iYTeJJ/WrsQc4Zu45YJGej8Fg0yl2JILlzMtrDSG0HLwKirSNU
	jxeJ9Rg8vyO25T98H3/C1V6UXq9xaoeg=
X-Received: by 2002:a05:6512:1585:b0:5c1:4cd0:16d6 with SMTP id
 2adb3069b0e04-5c1bc9055eemr5174503e87.65.1795631764829; Wed, 25 Nov 2026
 10:36:04 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261119204748.2558209-1-lee@kernel.org> <20261119204748.2558209-7-lee@kernel.org>
In-Reply-To: <20261119204748.2558209-7-lee@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 25 Nov 2026 19:35:52 +0100
X-Gmail-Original-Message-ID: <CAD++jLmAsPibiNju4HzAYztN96fwdErzZa2DS1tyThiUAtgzXw@mail.gmail.com>
X-Gm-Features: Aa3M54qVG3vyGiBbOuH0mxEC3oK27vU7UJnEn5z_uqUEslE_IpB0bR_gdzrAv9A
Message-ID: <CAD++jLmAsPibiNju4HzAYztN96fwdErzZa2DS1tyThiUAtgzXw@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] pinctrl: mediatek: Prevent divide-by-zero for pins
 with fixed drive strength
To: Lee Jones <lee@kernel.org>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"Ryder.Lee" <ryder.lee@mediatek.com>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
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

> mtk_drive[] only defines entries for DRV_GRP0 (1) through DRV_GRP4 (5),
> leaving mtk_drive[DRV_FIXED] (0) zero-initialised with min =3D 0, max =3D=
 0,
> step =3D 0, and scal =3D 0.  If mtk_pinconf_drive_set() or
> mtk_pinconf_drive_set_rev1() is called with arg =3D 0 on a pin with
> drv_n =3D=3D DRV_FIXED, the range check (0 >=3D 0 && 0 <=3D 0) succeeds a=
nd
> !(arg % tb->step) divides by zero.  Similarly, mtk_pinconf_drive_get()
> and mtk_pinconf_drive_get_rev1() divide by tb->scal (0) if the pin has
> drive register fields defined.
>
> Return -ENOTSUPP immediately when desc->drv_n =3D=3D DRV_FIXED.
>
> Fixes: c28321979ba8 ("pinctrl: mediatek: add driving strength related sup=
port to pinctrl-mtk-common-v2.c")
> Closes: https://sashiko.dev/#/bug/linux-d3852d37-6806-4c41-a493-f249dd59d=
0c6
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Patch applied!

Yours,
Linus Walleij

