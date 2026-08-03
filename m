Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87855C55179
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2026 14:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VF0Hp4wXirEtYNRHmmEHQLkJjRzPvWFm3EoPuJFZJNc=; b=Sh7bBtw+P9ArKESdoBhR+sj5IC
	dRFscxLXF+qzKwSkkDgLP2jCetMdIUTvr1ICT8xVFtBNACylU1RQlLrUIVBLpD/79YdkvTPmBKJbl
	QdoLaQLvwl24s0xBMVlicSDwF7Maz/X1OqvzUivAnXN4/LWt0pSJqP1LW9KxLmgwHbIDPaZyVUHPe
	jlpYqKsMsKlyojyiD17YNYUkM7hOt++5KQgvkTNkkRvSk0iJapzqKj+scOr2gjU3DvLDYsljfsBo6
	xeZl6rJLFzkp590MB8xVFIUadZ1KC2D557aULrBYL824Ou91e6ftVcI97kGurAg+bAp8vHDCSgoPb
	o2SFGyAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtvy-0000000HQO2-2MlT;
	Mon, 03 Aug 2026 14:46:30 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtvw-0000000HQMz-0kGj
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Aug 2026 14:46:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785768387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VF0Hp4wXirEtYNRHmmEHQLkJjRzPvWFm3EoPuJFZJNc=;
	b=ip26US/zZsv9DGP2rxdXWhy1LlS+gGaWgm9n0tkDocKBU6LGCQKjEfqdOezcai3bvBhRv4
	D1s+Jizp0a9vhP0yGcQsH54PXGMNURr3/sLSs9caRAEsVwIJ8HuN2vQUeawltVyFIvfT4p
	aRxjUjDtNSDRfEKCPY6SregIGiAgnTM=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-20-jkiS5CRyMQWKLB4fNqIMoQ-1; Mon, 03 Aug 2026 10:46:25 -0400
X-MC-Unique: jkiS5CRyMQWKLB4fNqIMoQ-1
X-Mimecast-MFC-AGG-ID: jkiS5CRyMQWKLB4fNqIMoQ_1785768385
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-81ec0eb032aso114649657b3.1
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Aug 2026 07:46:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785768385; x=1786373185;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VF0Hp4wXirEtYNRHmmEHQLkJjRzPvWFm3EoPuJFZJNc=;
        b=rC9Lez8TUu06tOSgIsL558/FA/x3aaJOBCJPkG4apoT+JPKRtB/peQGP9aaTVZ0mL4
         Vt3slaf7IP5e+Sy7HGH9MVUHMR1HGvgphPm03ipilEk5JpGacULvMl9yoFbxfwOaiFfY
         n3UCOqbuRiQbIuA8RDtRy8k+lwHC6w+NmcuzoX6H6pIohrdgTn+pY/qNL/FoT7m2W8/p
         ufz6NtgA/fzI25o7F2paWcW7sEn8sRJOR8KOMIfx7jWlhnFObWdwp/kyN9tU7Y0EiVZ6
         Sl53rl3A+ybMmhR6ZHKZ8yUC1UyAB+Ghxdfeo6FzXwAn59D8H6fYJ9KBVj1K2CjRKJYz
         6sHg==
X-Forwarded-Encrypted: i=1; AHgh+RrzJPE7X5weX8xiBk6N6dVJHWnciebBI3ydbImxvucgWfsSLgKTHDVOhJzpZV26bEH333wei2xdJX9BYzefKQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0+JIDLSq4YkcZBLCdeU9FA9RLKurHVXAu9VwhrQKPEAXY/M7l
	FV/VT287L/fmcKGvUHQHK+UDBs4P2WPaWJsitbt8rK9hb5Yync1lD8AxHbN0/TNyicShfCv4Zso
	SYOHhI2ILDL1rcdKteDWpZ1DuMQg/OoBSokuVOFzI7lvuKErrCwptnND6cGnjHNQIDjg+UoCalg
	==
X-Gm-Gg: AR+sD11NhFz7WnCKcFRBIfRM2NGmH4aUJ9zS5l1J1ZXEucgpDgw8QmUIzx7yDA0HwnK
	I/gsyZxHHVWRzZeCJ68s2OI4NY0mQL7DtD3S1g3tkhBARPhL1rcmMvTPzw3RQ/TZLnoMLRDITF7
	H/vLWEljer3QojE6eNKDUcWB4BPfFpSN52foo/sHYIdsK+gCOsQrA9DfhHbOtEeI7eSmDf7Kutk
	fmUUcDHmh7bbweMnw+lM78uOgiaBlaNBD0RC+imBgRiiblyMN4ClRZzmQUuhBN10lU/TalPA5Vc
	3A7ixE2miBSOf6G7GgqaRrjpEKhdlWqF+gR4mDZlldx5PJIg67vYhecO0L1S3z1qsWpDXlYBcMA
	q5ivNXTHPYVNv/7fOVl/ad1oSQ2qMq5C+868=
X-Received: by 2002:a05:690c:a9a:b0:80b:9114:3b7e with SMTP id 00721157ae682-81fd4a2d85amr133508507b3.12.1785768384981;
        Mon, 03 Aug 2026 07:46:24 -0700 (PDT)
X-Received: by 2002:a05:690c:a9a:b0:80b:9114:3b7e with SMTP id 00721157ae682-81fd4a2d85amr133507827b3.12.1785768384377;
        Mon, 03 Aug 2026 07:46:24 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fccf2e2bbsm55709907b3.9.2026.08.03.07.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:46:23 -0700 (PDT)
Date: Mon, 3 Aug 2026 10:46:21 -0400
From: Brian Masney <bmasney@redhat.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH v5 15/25] clk: mediatek: pllfh: Add ops for PLLs using
 set/clr regs
Message-ID: <anCpvYJJf2FChBHE@redhat.com>
References: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
 <20260801-mt8189-clocks-system-base-v5-15-ac4410697cc2@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20260801-mt8189-clocks-system-base-v5-15-ac4410697cc2@collabora.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YbogKtFCwyFKBraDvwJ1wXznf93mLHy76GK_wmJ9be8_1785768385
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_074628_283998_2939EEF7 
X-CRM114-Status: GOOD (  10.51  )
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

On Sat, Aug 01, 2026 at 01:21:01PM +0200, Louis-Alexis Eyraud wrote:
> Add new set of PLL FHCTL clock operations, that uses the new prepare
> and unprepare methods, added in PLL for MT8189 SoC to support this
> logic.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


