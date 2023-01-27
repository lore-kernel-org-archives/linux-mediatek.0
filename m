Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46FEDC38142
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Jan 2023 14:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HvNrME+MM8yn4e0AkTN+4TlH0dGTPBFUw82z5J9q42o=; b=uYf/b8U2UtWHERVpzPmdvKPsdC
	DSv7C8Mgp5aAQ7gwKZX11oHoWH7b6Uee+6zxGPZly7rLbv/cpz4oSUDCqlNKB4UMO7EKUkKJukvni
	ZAvlMJKDmuxQ1HOc02aX3lKMRpIQHvEZF1BB/Pd2Xr1QmXjlBk7ed5ecZVDzpgmrWZsZTl+JsVdWS
	NDaxr3RUZz1fz/aNfmGpkpBQPduXvkoYjN+gFl7c9efCZ09j0AkOLs479JTYYPpPHGm0ej7sJYe2v
	uSwqVwMmG6rKkTKoRyEcJfWmR+C414CW+zv4r7ui8JsRYxwL7sptbZn6TMmAgfnN+4fXgyT0jJ/1F
	/rca8qHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLQ8x-00FNGn-Vy; Fri, 27 Jan 2023 14:55:55 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLQ8l-00FNDv-8H; Fri, 27 Jan 2023 14:55:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C7F0FB81F95;
	Fri, 27 Jan 2023 14:55:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BAFDC433D2;
	Fri, 27 Jan 2023 14:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674831340;
	bh=HvNrME+MM8yn4e0AkTN+4TlH0dGTPBFUw82z5J9q42o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BdOJeA81z8ETj4H1loxExyGMkjmJU71jtbn48u+zJKPN3npJkLLrD1DTEzUDyITfh
	 HDqTrjXvFpiXuIEuPBw7xP+bQB9UR3OKcBZE0Wj/jO/o2DOm/GpsZdFzd+ezW+6aVY
	 f7vkv2VfyHsdtcELdVnqBZgKL0QiRw8bCP2POSD0+CpoJrqlBwp8PfKmahn0PF+jjF
	 HYYg55akVUd+tMg51h5/kAo8OV5jd8bVZJki/YUmBOxUtU7/k6Lgfiay4apwLTfT9S
	 0QvmA/4vc5njTRfs5fd7yf1UrbXlYNPr4ZVd1HvysynF6AuxpKgStRD4NXfSxBX4CW
	 6qEPoZsjkkPcg==
Received: by mail-lf1-f53.google.com with SMTP id o20so8553591lfk.5;
        Fri, 27 Jan 2023 06:55:40 -0800 (PST)
X-Gm-Message-State: AFqh2kovW3DWLRyS/ebG1YGVQEPzK5FaDjhkrVOeMgWzZxssH1exifeL
	SzmTJ83YN6d2Vp9n1W4OAIk7nZN7zj1iZe4mLQ==
X-Google-Smtp-Source: AMrXdXt+OmlRKcer++n7fCu4l2zdWFvwQbkW53r+2SZjCqH0XMEpiXMeFESigK5NF723T8csDUcyNE8hgDt/kcl9nxk=
X-Received: by 2002:a05:6512:1105:b0:4cb:f29:e2b0 with SMTP id
 l5-20020a056512110500b004cb0f29e2b0mr3003381lfg.404.1674831338572; Fri, 27
 Jan 2023 06:55:38 -0800 (PST)
MIME-Version: 1.0
References: <20221205095115.2905090-1-ruanjinjie@huawei.com> <378232f4-5c2e-ad56-c4ec-4d9f72f08755@collabora.com>
In-Reply-To: <378232f4-5c2e-ad56-c4ec-4d9f72f08755@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 27 Jan 2023 22:55:26 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9aQnkWvLjaoxRsHStpfeK5v72XkNd7aCw-MbCLVQewUA@mail.gmail.com>
Message-ID: <CAAOTY_9aQnkWvLjaoxRsHStpfeK5v72XkNd7aCw-MbCLVQewUA@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: mtk_drm_crtc: Add checks for devm_kcalloc
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: ruanjinjie <ruanjinjie@huawei.com>, chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
	airlied@gmail.com, daniel@ffwll.ch, matthias.bgg@gmail.com, 
	seanpaul@chromium.org, ck.hu@mediatek.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_065543_463962_8B5CD8C5 
X-CRM114-Status: UNSURE (   9.76  )
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

Hi, Ruanjinjie:

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> =E6=96=
=BC
2022=E5=B9=B412=E6=9C=885=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=887:5=
3=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Il 05/12/22 10:51, ruanjinjie ha scritto:
> > As the devm_kcalloc may return NULL, the return value needs to be check=
ed
> > to avoid NULL poineter dereference.
> >
> > Fixes: 31c5558dae05 ("drm/mediatek: Refactor plane init")
> > Signed-off-by: ruanjinjie <ruanjinjie@huawei.com>
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
>

