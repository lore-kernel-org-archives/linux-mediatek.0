Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49033C001E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jul 2023 06:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3y/22I2v93+TWa6s1CXf0qTViEqrmWtHnFQP2RiZStM=; b=v4+UhUsfA25f5BPc1CkqiSuSaz
	tLt47ocjsELoHUfwkEiZjBZiaTwI40ByUMkriDCm1B13cXbc8HA/JzU321hpGmWh3cejmViHYBpTO
	GwYqif/n8L6tK7BTOEdoP/Lkhlr3GFaOpon2AXFqjeRuU2U1ZGWHjOA7jl5z14Zcv/W0cKN2cYYaA
	5IQiqvTGptz+/BegFyMhQsetdCMifOtb0U5liW66YJvkoK3fiMbWxZVfhFVE+CZqYIutY8EHIALnl
	iPezVpg6JxhzdY5HoMyAadA/im4o7KXawmPEByUkC3S+7/ojNaM/EeIzprtN9n+RchKL0Zk2HrJOa
	WCZjfxpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOYDX-009IEn-0t;
	Wed, 26 Jul 2023 06:41:51 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOYDT-009IDA-34
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Jul 2023 06:41:49 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4fde022de07so8829179e87.1
        for <linux-mediatek@lists.infradead.org>; Tue, 25 Jul 2023 23:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690353705; x=1690958505;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3y/22I2v93+TWa6s1CXf0qTViEqrmWtHnFQP2RiZStM=;
        b=F03SUx2bWrNf/WDpUhqXyukSjU5FCI5ihDn/7rzZohIgM3+ICxFJ4nM7NmsfA/iT8S
         Rep8k9bXe8gXhw7P/Q8L4UYgOzBQ9YuGrNoHrTNfoJGwFpPYXbQx7GCbJl12m9Fc7wkp
         nDfJYhLNz/HqbwkF5DNJXOZop8Kkhz5DBh8CxCywtad+ZwkhFf8aA+M9RM1Rgcd+WOdP
         2F6D1KAwG4xuYVHiH9+MZfg7RKTSk9Dg2DwT7VR5IHMXEFJ8GdHfbhHzrWbg1mZOv1fn
         f38V43iuwVPWaYqHXQdaorL0A0TrDPr+AR1SnfyAadXGNs94XWeYYS+G93bvsyr5ILRs
         QPvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690353705; x=1690958505;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3y/22I2v93+TWa6s1CXf0qTViEqrmWtHnFQP2RiZStM=;
        b=I8aMvlwnywxpf+MfOjWWW3ZDR/8FdjF5KD3MWSiS/Xg/Dl/sno+/7zCnShFwqKpkv2
         5uYP6MZG0/tpNkjQ4ZlUY7vS4B/Uyk41fdbZVK+k7bQw3Ma49Tt8nC4Ax3s9B5ij5YoI
         0ghBdhJ4bLf1RE+mCjgCrm73JVLyMb166Dc5R/6UsnVNhdHZ2Bp7TM2blJ/PbEl0aSp4
         7Clp4O7nDCkJaI0Z2p+nf/UYqwlxYZaxf+uapxvEMCwtHwWyCdh3c2YRZfM5epGYGAOc
         PBQy/b+Z5pSXDhVZwWapdNo7FiAdfZkyti8zP3/S9+ZiQy79MJ12+7yznih9fpe0JQK/
         BAZQ==
X-Gm-Message-State: ABy/qLajFvTNYLxt0fYry+hQE/oe4XVC7fY4BThZAHYY8iSzR213+dru
	l2znX5mxjKGH4QasvXm+13hNWfzRvHWIZTEzKlNo5A==
X-Google-Smtp-Source: APBJJlGzOjHjb9aiiq9rLMjcCYZohEXYqsGAsfrlAhqhGFGRUC/tHxEDwJrVtT/8u5/kP1c1LDwhAL7CANzQ4WuVjzQ=
X-Received: by 2002:a2e:7a08:0:b0:2b6:d137:b61c with SMTP id
 v8-20020a2e7a08000000b002b6d137b61cmr730329ljc.39.1690353705569; Tue, 25 Jul
 2023 23:41:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230725131258.31306-1-linyunsheng@huawei.com>
 <ZL/fVF7WetuLgB0l@hera> <20230725141223.19c1c34c@kernel.org>
In-Reply-To: <20230725141223.19c1c34c@kernel.org>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Wed, 26 Jul 2023 09:41:09 +0300
Message-ID: <CAC_iWj+3kDccXSG2ADmu7KDDjN6MuitihwcEjYeyRLqrUbxBjg@mail.gmail.com>
Subject: Re: [PATCH net-next v2] page_pool: split types and declarations from page_pool.h
To: Jakub Kicinski <kuba@kernel.org>
Cc: Yunsheng Lin <linyunsheng@huawei.com>, davem@davemloft.net, pabeni@redhat.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Eric Dumazet <edumazet@google.com>, 
	Wei Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
	Clark Wang <xiaoning.wang@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Sunil Goutham <sgoutham@marvell.com>, Geetha sowjanya <gakula@marvell.com>, 
	Subbaraya Sundeep <sbhatta@marvell.com>, hariprasad <hkelam@marvell.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Felix Fietkau <nbd@nbd.name>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Kalle Valo <kvalo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-rdma@vger.kernel.org, 
	bpf@vger.kernel.org, linux-wireless@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_234147_989187_8CB4C889 
X-CRM114-Status: GOOD (  13.59  )
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

Hi Jakub,

On Wed, 26 Jul 2023 at 00:12, Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Tue, 25 Jul 2023 17:42:28 +0300 Ilias Apalodimas wrote:
> > Apologies for the very late replies, I was on long vacation with limited
> > internet access.
> > Yunsheng, since there's been a few mails and I lost track, this is instead of
> > [0] right? If so, I prefer this approach.  It looks ok on a first quick pass,
> > I'll have a closer look later.
> >
> > [0] https://lore.kernel.org/netdev/20230714170853.866018-2-aleksander.lobakin@intel.com/
>
>
> I prefer the more systematic approach of creating a separate types.h
> file, so I don't have to keep chasing people or cleaning up the include
> hell myself. I think it should be adopted more widely going forward,
> it's not just about the page pool.

Right, my bad. We share the same opinion.  What I meant by "this" is
the split proposed by Yunsheng, but reading my email again that wasn't
very clear ...

Cheers
/Ilias

