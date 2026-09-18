Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52410C982D8
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2026 18:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xkCUHEW8BaYz+mvJmpvhPzJPz+lQKTKEiJB6NksDW9o=; b=qSOdLJ2uGaM0xbYaPAnr9ivpBr
	zGHHQuyE+WFheRTkGPJI5S4b58ecoI/TtwdGfZ5y+MIrmL3BRxjeuUTrHKh4Rcs1Yeti7iiaR5q/d
	iKILdO1D3meb0fsRa6yWQky4vLyEF6RAlzwCgMnKLlKtpPjD1jpw9uIF9oqOiTUJsIAJAyXUCOoMp
	ToYdqOoODk0kEx4ktDViNyJLWEHk3Aola5UHgoB9iTERrBSYnzO9fqLsiBcugXfHD9Qn2Jek/um0d
	RP4G5pijihPnSjwHfyD8PG1oEU8LbYl4Gw2jlMg/SvLLPRCQ4A7VcG+wn7UlrPysdaU1hmWbLiCXC
	wdPkL4qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7dLB-0000000FJVs-1aCF;
	Fri, 18 Sep 2026 18:29:41 +0000
Received: from mail-ej2-x10.google.com ([2a00:1450:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7dL8-0000000FJUl-1k9s
	for linux-mediatek@lists.infradead.org;
	Fri, 18 Sep 2026 18:29:40 +0000
Received: by mail-ej2-x10.google.com with SMTP id a640c23a62f3a-c254f55efe5so177726866b.2
        for <linux-mediatek@lists.infradead.org>; Fri, 18 Sep 2026 11:29:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789756176; cv=none;
        d=google.com; s=arc-20260327;
        b=cK1NpD/+MldhZ2E32LapmyaWzTbJ7/YDhkFi+itMmrr8xcaidQNCDXry0Oie8A/+DW
         tuMy5pNbVTr+15jIe0V7Jg1ayImmidn20diKGvXyrs5d9dysmwBi2sVfAxVGkLnXe6pi
         8pigdwIURwQLDoQCuguexSSplPVIL4A/2q+e96xzrb48Y8Cl10UmhREBrF1pM31yxNxQ
         E1/wuBgOq0Rh407Szvv2UNQWnvJ/iEp+owru+ae3kf/OkN+IzALCEUBecpx7LRTiFEyZ
         6EcJgs0xSuFk7m+nL/XkHgmeikji8f1RqOE1CI3nXNo8QHeHhVoYsN5VXnSO3iIezCjN
         Arew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xkCUHEW8BaYz+mvJmpvhPzJPz+lQKTKEiJB6NksDW9o=;
        fh=dz90ymxu1/mSb5aMiRJPFWlQDjZuirngBhYnK/oreCU=;
        b=Ut8Um6ThMNxB1C04JPkGfn2k7IRl+2VrpAs4eo/6xpyUg3zAqcc4QPsoudxFUhlZUK
         ge6aM5M9PbflkCne4Y3VPoOsYb8zQV+9rixkEbf1VdNUiS/p5go7rGhqvcL7tLRIDDJq
         4pznr9hb0tmJ93cYZA+vx2oztGVTFPAd3jfAL4WDmfzko3ZjMum/RFqs0BpiizLtSI7S
         QHWmQzxGnZ/GEjFQ4uv9GCjkFiVSzeFVe8DnIM6ulQMslrDOIfKbUGtCZ80qb7pxRIzx
         7PmcVdvsg0l4+pL/AHvcWZmAXsBRSU81ws4VUkOAioFJv0ulESZVsqsCE048KVinRdg4
         TmEA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789756176; x=1790360976; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xkCUHEW8BaYz+mvJmpvhPzJPz+lQKTKEiJB6NksDW9o=;
        b=hGjufEcws53yCxlSYLE5lffmiYEJVMuCofc3uqIAlKKcun3mV13OcdbdeMGmptBNUn
         8ZrlPDYyCNy3mBT8AY/Uf+tiCOiwp2r9HxDpdoiTgfGKT9ox5FQgq0A0cUshliYqbQ3n
         /Tkb/rZjOY71jJbOin/jZyGFn+g5QiY6p8KBuJ2w2oE+Kl5yVgb2gkckkqiiZaA6eVbe
         lEAijhOPXZ8d1VoQlnyYSRQGeq/mzoMWQ29cB25GGqmZgIWBy0KkPYTUUi32ZOWgwHB3
         nmrDgAcKJENsl94AlJgfJlsNhO3kKV64T+uNawY7f1sSN/z2JXsG/rmaccCf2uIQuvoP
         2E2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789756176; x=1790360976;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xkCUHEW8BaYz+mvJmpvhPzJPz+lQKTKEiJB6NksDW9o=;
        b=BwYr7kIJPevepwe/QhLF8JqC4U7S+Si7IHUSy2ytKsMwGSNZ9Ble+1ZUR0MUWC/kll
         eLNdBtrPZidAfh1dCDJ+Nw8FVrjDi5KEOGFsPkUPTBTB2zBHyurcVnpMe0qUS3NJlc6U
         e1rlbhQEiHT/ljMMd0w9bj6PxOnCWIAcG2nl+yBzHPXgVEbBzgcCnUdJS+E+wWHYvOFo
         41I/5ZnURXvB7QkdyZb+0yoelSh/7PIzUe+F+pWt5VjUqgROUWlVj1A92+2BiAJ/Wx4G
         oI5JFP0CWmBvi/KvrpcxwxWD3O/FoWK8cliEj5bImsiWXn5dHBP66Zg3iMbzpGePMbdK
         whWQ==
X-Gm-Message-State: AFuF++lpi4t5CIz19F+DnWQV5Bi+RLJEqsA8mUNndvHSSKwfPiK/+D33
	3rooMFzRexV5z67Kfi8Rzhov4lB1z8EZF3EJoKblwtdST0YykwkwWsYhC2GIxdGOAR9dVDSV2bn
	0s+gN6TnDl0XXcMoDzXOrwwj7U3SBxvHvQQOu/S4=
X-Gm-Gg: AYBFou13AHycvYY7SaF7+afdQpqdE0e4pvP/Sqv75A+PAWSavPJAThu+5tPz4hLDmSj
	U3upna1Gmi7hMB1IQr8TFF85cHPtNrJuUG0+fp2cT4s1c/iwNhf/ehKzjzdNZ4FzG5TSSyGd0vB
	ToYeXuJC/HUZLek3FJUNUqdppPu96sTq4Vk4ui2+p2YnT2ikvAa6m9+qH6FIcqRFtvAbnnHLKyo
	ycvYJdfgDDEIhLBB5qVB8mW9G3sBT9yM8enjLnnGqjoY/XeA4izvq7yIj62nqKtDZVrIzWmidz+
	n4+5BsQk/ALKSb4drbd0lSYfEvMeH5/8t/cijIS0KOBCCdrFQdON0DmQjaTJ74AO
X-Received: by 2002:a17:907:1c0f:b0:c29:d62b:fcfa with SMTP id
 a640c23a62f3a-c2a156590b7mr346464966b.2.1789756176118; Fri, 18 Sep 2026
 11:29:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260918175736.355305-1-l.scorcia@gmail.com> <20260918175736.355305-4-l.scorcia@gmail.com>
In-Reply-To: <20260918175736.355305-4-l.scorcia@gmail.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Fri, 18 Sep 2026 20:29:24 +0200
X-Gm-Features: AcwNN1UQFOY_vCJJJdBRj6O6gZ3zFhbPbxWCZbiFNcjPHyL_aMs2Ld1pz8hUFJk
Message-ID: <CAORyz2KEfzcJ_2AphkPU6o-YhLAqudCXVdY+LDoynUx_FsTMJg@mail.gmail.com>
Subject: Re: [PATCH 3/4] soc: mediatek: mt8167-mmsys: add routes for all
 display paths
To: linux-mediatek@lists.infradead.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, CK Hu <ck.hu@mediatek.com>, 
	Jitao shi <jitao.shi@mediatek.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_112938_466476_76A6E33A 
X-CRM114-Status: UNSURE (   6.69  )
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

Sashiko found [1] some copy-and-paste errors in this patch that are
worth correcting. I must have checked it a hundred times but they
still slipped in.
I will send a revised v2 after waiting a few days for additional reviews.
Thank you

[1] https://sashiko.dev/#/message/20260918175736.355305-4-l.scorcia%40gmail.com
-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com

