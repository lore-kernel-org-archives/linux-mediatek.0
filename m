Return-Path: <SRS0=8MWw=JJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C22C9C433B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 15:30:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D96761206
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 15:30:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D96761206
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kif9+qZD2zGHrFdB//zUK8ZmeOwMNE3RcRXs2UM5n+Y=; b=XINWeJR9qEGAoA0N0gHD7HEVY
	uAojT2tuAGTEISVNdCETSa0gSqNqgXNHqTvynKqXyNm0VoDIz7bVlPXCqTFrFhsJaW9W1RP1rjRN4
	PwpPeVvZW2jCxSSiUz3MXCFMm5waNNlxX6UMbNWP62sVxqu6pxz+Divy5bYaj0kE+hBq9Kpi+w2fI
	YrDyStx3EBWkNE7deC+fQCHuwjikJGj03FU1pAEjqsjnsFJVE9n6X2n1vxzxJiq2wBx2hhrxL61m/
	WUhF+sGnT+9Z4Pt9vqGVqCv/i1jG7AkZpiGYrRgOB353AshPR6V8B1fJmvEJBg4a0uhI4z9tk5ACU
	DWReet/6Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVyVl-0075Xi-TU; Mon, 12 Apr 2021 15:30:01 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVyVQ-0075TZ-6S; Mon, 12 Apr 2021 15:29:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=AC9X+1/OhI3zv50JSM+L1kZ63zcScSi3KwtHVFoeDOw=; b=Qge52rpyp/wvzv9VEaHeQ1dKYw
 mmz5BxjCunNxUAnJkl3119DljLaS4EjuQLmn1gylO25KwBTPAW7gNbN5ygYuf0tZJRTZD+iOlMudN
 uSGC/+ltsxXX99YFas3yermtI46DOOY+grOrkIII1r9fI3zJrdaxhJFGRNxVRwFMInqeITmJ4udl7
 zAcoR/cXUTzj1ejsFSV65E8ezhP88G2PxBfUkvivFoGj+vJouI+TYjYNpURLJ/GVZC5E7d39SNhb4
 DBPZ5oIz7/JCkZpgZU687KsemenkN7m8q8WlU2HGmpdZXVWLUnCnEzY6UnnTBEqz8KCsyJosDA3kq
 8paoR3SA==;
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVyVN-006LNT-KO; Mon, 12 Apr 2021 15:29:38 +0000
Received: by mail-pl1-x632.google.com with SMTP id d17so1266233plg.0;
 Mon, 12 Apr 2021 08:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AC9X+1/OhI3zv50JSM+L1kZ63zcScSi3KwtHVFoeDOw=;
 b=Tz5vMcW2J8n8llIRRxrQEz1Uz4jGuraPfFMjgZhJWfIuHZeZjdN5wwsXeIKHeei3HN
 jl7dgwnU90QfctY/oLsUfelxm7ZQVd4lmn5Ky3n+eAa9YrsaFOeo7mASNKc7KaNoBK0O
 CEL3i+WunqLR+KfhQhlmZv6sBfn94Kj+xj4+96sSKInzAHw1SyLRwu4bpukdQ9V9NKmJ
 XRgy27ylt+yK5lDRJCTP1Tfs1wrLFGZtuQ/pdYmDZXqAgZ4EsJfPQ6r32cCEeUu6os7t
 KWAwMWr4A0DNPqjsacjKXQgQ/vbqSw3HQtrWloZH5hO6sKd7i4QMUuKeFb6p/wrQuYIL
 +2vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AC9X+1/OhI3zv50JSM+L1kZ63zcScSi3KwtHVFoeDOw=;
 b=Wrt/7BGmBiVNDF0fEUi7P8aS/JtUh1n9XK+JsN8jH7W90fUw7cQ+SeZvGEShADncmP
 MY7RBrAAuHJRQxZw7si4UV3jP+6RLzucUspp5Cz3+puyeRB2P2vrlmnix4/g1PgmT7v5
 LbW8YZyzK8NTZrLyKGoyqITpus3cdxu9MJgNLryGx/sd5IabqrRuQDJWOEk8EdELTUQt
 LnWQV5Essyw1DWA3GExkc8rDMbn/eFRBY6eiiIZnltYuCuudYZDhSjxTatnK79qirJXK
 /3O0FUs1wUwRNMeoyOMHES0v8PAmf+1uiPG1iFzilyvhsg+DVGL2ao4EqtPvtg+Pa+sg
 Gk8w==
X-Gm-Message-State: AOAM530PfM1BAYW4kiFHyUl4v6cfFNDoJboZ2Gq3F5YqEwB9b3qfk3bQ
 U8lNwMEk47ngI0VY6P7ktOgRXwPDztt3Uj1FhZM=
X-Google-Smtp-Source: ABdhPJyhWxFPHubJiQzEWlBZGAcD5U+iSEhomsoE4VkHQdHlcHgEjMjOuHIPkqW6eOaFi+abQ8fizEazhnbBJm7PSIg=
X-Received: by 2002:a17:902:bf92:b029:e6:bc0:25ac with SMTP id
 v18-20020a170902bf92b02900e60bc025acmr27750319pls.49.1618241376112; Mon, 12
 Apr 2021 08:29:36 -0700 (PDT)
MIME-Version: 1.0
References: <1618226325-31927-1-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1618226325-31927-1-git-send-email-yongqiang.niu@mediatek.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Mon, 12 Apr 2021 10:29:25 -0500
Message-ID: <CABb+yY1b9wD0hoBx=aYzpLcF-=EEG4QTrV68sZj8+rtf5J1aJQ@mail.gmail.com>
Subject: Re: [PATCH v2, 0/5] Revert "mailbox: mediatek: remove implementation
 related to atomic_exec"
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Fabien Parent <fparent@baylibre.com>, 
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Devicetree List <devicetree@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-mediatek@lists.infradead.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_082937_704096_C916E1FB 
X-CRM114-Status: GOOD (  14.33  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Apr 12, 2021 at 6:18 AM Yongqiang Niu
<yongqiang.niu@mediatek.com> wrote:
>
> This series base linux 5.12-rc2
> these patches will cause home ui flick when cursor moved,
> there is no fix solution yet, revert these patches first.
>
> change since v1:
> add mtk-gce.txt and dts modification
>
> Yongqiang Niu (5):
>   Revert "drm/mediatek: Make sure previous message done or be aborted
>     before send"
>   Revert "mailbox: mediatek: remove implementation related to
>     atomic_exec"
>   Revert "dt-bindings: mailbox: mtk-gce: fix incorrect mbox-cells value"
>   Revert "arm64: dts: mediatek: mt8183: fix gce incorrect mbox-cells
>     value"
>   arm64: dts: mediatek: mt8183: add gce information for mmsys
>
>  .../devicetree/bindings/mailbox/mtk-gce.txt        |  2 +-
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi           |  5 +-
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c            |  1 -
>  drivers/mailbox/mtk-cmdq-mailbox.c                 | 80 +++++++++++++++++++---
>  4 files changed, 76 insertions(+), 12 deletions(-)
>
Please break the patchsets (this and the other 3) into mailbox only
and platform specific ones.
Also, it would help if there are some acked/reviewed by some mtk folks
especially when reverting patches.

thanks

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
