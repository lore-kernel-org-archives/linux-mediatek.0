Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B73D8C4708D
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Jan 2023 16:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bvv0wIbNtCiGn+iqYLphgYeyinreINxvRAbN060SZ3Y=; b=t0TRCGutfPqJGrvOpIg+oP8k6Z
	Wj/3V0mlNH3ZuhlMu7e13ggviRw91tSuDYTUVh+eB7yKf0I4poA0l8IiGIQh0UkYcRNNpbv72XCv+
	KkSzAtTw0ZOMX2luSn9w1meb9xd4Cr0Ixc/tsXrHhG2MRJ4evm1UJzLV/FfcNCkvOCsC7OqETcmpq
	Y5gOd3OMJ2AqFUdiWCQ3yhhkmY8nBudJWq7Bt/6xBUoH6bzqmcTAvHrVH04D1nfZ5+hcmpPO0hteg
	t0PN+V3Hi6ZoujYpYTxrd2bonOxqihppg56dkTul+bbgJgZvWI4s/QSiCJjqNqEHl3I+kW1RGMMAO
	6lpUkjLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCNTM-00Cf5g-9s; Mon, 02 Jan 2023 16:15:36 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCNOa-00CcnC-DO
	for linux-mediatek@lists.infradead.org; Mon, 02 Jan 2023 16:10:42 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-45c11d1bfc8so404112967b3.9
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Jan 2023 08:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bvv0wIbNtCiGn+iqYLphgYeyinreINxvRAbN060SZ3Y=;
        b=iP1gzyrVsDS1IKTAeqTr+7uO4W7fU3lQ6MZFdC2vu7/3hHkjMj1To5Wwgrx2qEAHyg
         vzArTd2WrgZIhwJwdIxDO7wJC3eDdD3ncDEGHpAgVQVUa08V/BpMJI4QCEd8M9hwXCIK
         TBqbtpAQaK5wJREcqahn2CvXHUKhJC4MHPOxYBYS5BRL5ytj9NUFD7p2Z09IlIZyMvgM
         8Uct/TNCd8av5MVD+6qNgKTisqIfaidaNPTW0YKt6eQJlV1kPuhqXT7lqh8Q9L7kG1/V
         ITn5u95Jfaoojh+Ydv6+zAXyGEbmkevEAo+18kKqp1OiJWpZ2BsSE1cUbuFSITyYlqOV
         bexA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bvv0wIbNtCiGn+iqYLphgYeyinreINxvRAbN060SZ3Y=;
        b=TjZLqQRUDVGsmrgalBSysS4oLA2QFYPoaYRHMeS3RZf9UsqFbhVagGTxdHiokxCq83
         s5VGwCNR9sdno93fwpK8VNqz+EmrO54W94ymqSqfsZcTw7Uu2ExoM4Se5+t67/WlZrxM
         8Q/Ptfrq4ydviCCXnofjKQOiDUaUSN4uDIgSKg+5dl+q0fxCIbhP3VeuJ1C0x3mEN6+p
         MLOUZmCUq0zfAMzPSrF2Y2hwepsVesQR1jMTaY+U9GQ8HRHk7y8I8Fs9r+VM7gfJB0Bz
         b1+qwbg4u95d6kxXGs7y8p6nxYaiq0cWYuPeA0MUaNA920TVG+MCqeIgR58BMwvvEFfL
         gzjQ==
X-Gm-Message-State: AFqh2kqkK72VaZBpjm04BcsU5e6ojtmwXyD6AqPHtlcmv5OfvjKa+6sj
	AfEeOTPzybPmweJ9c91vFApfvWex5DzKcrHJ09yxuA==
X-Google-Smtp-Source: AMrXdXu+OIItaQft1LqXq3zKwzkIEonX8EHxKg9gNj8jqifsZEugW4apEpuFnr7GyLF2aKsieT66zLV86sMbxCHSFSw=
X-Received: by 2002:a0d:d981:0:b0:369:69:e72f with SMTP id b123-20020a0dd981000000b003690069e72fmr5290134ywe.103.1672675833856;
 Mon, 02 Jan 2023 08:10:33 -0800 (PST)
MIME-Version: 1.0
References: <20221005-mt6357-support-v7-0-477e60126749@baylibre.com>
 <7hr0xe56uf.fsf@baylibre.com> <0fc0217e-f1dd-d64c-d43c-cd47a8acbfd4@gmail.com>
In-Reply-To: <0fc0217e-f1dd-d64c-d43c-cd47a8acbfd4@gmail.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 2 Jan 2023 17:10:22 +0100
Message-ID: <CAFGrd9qZzpxPWpiEOJacc9m2WDFB8Mgr5U5too89mZmqqFir_Q@mail.gmail.com>
Subject: Re: [PATCH v7 0/8] Add MediaTek MT6357 PMIC support
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Kevin Hilman <khilman@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Alessandro Zummo <a.zummo@towertech.it>, 
	Rob Herring <robh+dt@kernel.org>, Fabien Parent <fabien.parent@linaro.org>, 
	Tianping Fang <tianping.fang@mediatek.com>, Flora Fu <flora.fu@mediatek.com>, 
	Chen Zhong <chen.zhong@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mediatek@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Mattijs Korpershoek <mkorpershoek@baylibre.com>, linux-rtc@vger.kernel.org, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Fabien Parent <fparent@baylibre.com>, 
	linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_081040_603699_171389FD 
X-CRM114-Status: GOOD (  13.70  )
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

> >> This patch series adds MFD, PMIC keys, and regulator support for MT6357.
> >> MT6357 is a MediaTek PMIC very similar to MT6358.
> >
> > The regulator driver (and bindings) were merged by Mark.  Could you take
> > the rest of this series via your mediatek tree?  The input driver (and
> > bindings) are ack'd by Dmitry.
> >
>
> Yes I can do that but 3/8 does not apply cleanly. Could you please rebase on top
> of v6.2-tmp/soc?

Hi Matthias,

I've pushed the V8 rebased on top of v6.2-tmp/soc.
https://lore.kernel.org/r/20221005-mt6357-support-v8-0-560caaafee53@baylibre.com

Thanks,
Alex

