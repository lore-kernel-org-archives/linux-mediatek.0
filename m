Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 454E0C38A2D
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Oct 2022 22:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=stUhgmxHOajI9uqfx7NpPsmu7P60GiPKRF/7gBID+dg=; b=DV7PtnwHM9ZNW/WHAdpTsz/6AQ
	KucOSnyJuzs8DCDN0kvNnYOk+lE2aqj4IlCBfVRO7/31HNYva1qqb1MdgSHnpEm261YKnWKEvFIoU
	EINwklpJx60ZZmx0X0BP/BuKPitkdlhUTcb+fB0wt27sf7kUhzR5rinGgCeUfIWmRGyPzUBj0zoq2
	pIrqxhy3d+9ii562NbHxBnxBROU1nV3UecU9LWHytiEbVSvEGs84hjDHipJuIZyPK/+okxBZGzgsU
	PkCZZS60qwX9ti1ineUO1kdLrkigPMPgbN/qqPQvv2kyXkoXbIVAwXZMGxKGbMoeU3IPD1QmkNZ5R
	gd5GykbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on5ex-003EQZ-Hs; Mon, 24 Oct 2022 22:11:03 +0000
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on5ev-003EOo-2H
	for linux-mediatek@lists.infradead.org; Mon, 24 Oct 2022 22:11:02 +0000
Received: by mail-vs1-xe2f.google.com with SMTP id h3so9228430vsa.4
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Oct 2022 15:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=stUhgmxHOajI9uqfx7NpPsmu7P60GiPKRF/7gBID+dg=;
        b=bEFddOpdoZI+TExGmAdpUfmJNoo8dPBXr0GJGSgul5kqwh++/sgfJQl8+oGEvFD2ne
         kpz6K8eWDmAVOCEWOuk3k3vaLpcYn1giG0Y4laOx4hW3kM36CeJfyuYRXRoygTCeOInv
         vgzrStxX8eomyhmjrg03uh7HfE8n1gEyEMRiw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=stUhgmxHOajI9uqfx7NpPsmu7P60GiPKRF/7gBID+dg=;
        b=kfnFNPualoT3ABsaVANeX+CJbcismChRxfFv4wzYVXkk3hMurYs45AQG2Ho83PLR2e
         2xAygV3Tfdt/P2PwGBB+BxZmJWtHG9H71PO6hDMhYsdFPIA1ONRw7vuz7tBOgZLTzR8g
         Cx9ROGD2YBw6co/0bOk9zizvQi2TiPx9mDPqhaFErIzPFuuVYXm51Ygsy6nQE9ATpKz7
         jCJZvTsGI8TKzMM5VCtJjfWJyS8jHTAbHT4giO3xZ6LbuZSlePfp80UObSO44t42UL9a
         RQxjnHDhmfrJGBjh3916P/1h1N9Ju4WJuwLWme183hgnYpBIuKQnX0q4bS4MgZ8WlkT9
         W5mg==
X-Gm-Message-State: ACrzQf32fo51j9Uq3HDDUjeXsFuKkK5sqgRkWjJKFw5Q8EUA6nnuuQH7
	mE6lRa7IK9U6/SdFl4kCsZPU0NwELjNbfNXbsUYPxQ==
X-Google-Smtp-Source: AMsMyM4Efc9ufDsXBeEA5wir0gCDCtXUofm53iFeyXJEoyskf089urS75VK07NTr4nbtrLk6Bk5gGbtapSYnxvi7JQg=
X-Received: by 2002:a67:f106:0:b0:3aa:efc:8610 with SMTP id
 n6-20020a67f106000000b003aa0efc8610mr6032143vsk.65.1666649460086; Mon, 24 Oct
 2022 15:11:00 -0700 (PDT)
MIME-Version: 1.0
References: <20221024102307.33722-1-angelogioacchino.delregno@collabora.com> <20221024102307.33722-9-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221024102307.33722-9-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 24 Oct 2022 15:10:48 -0700
Message-ID: <CAGXv+5EG0TwE6pEyEb3sK3bU8DWzbtQqPgtWcudJ0KpbR3XrCg@mail.gmail.com>
Subject: Re: [PATCH 08/10] clk: mediatek: mt8195-topckgen: Drop flags for
 main/univpll fixed factors
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: sboyd@kernel.org, mturquette@baylibre.com, matthias.bgg@gmail.com, 
	miles.chen@mediatek.com, nfraprado@collabora.com, rex-bc.chen@mediatek.com, 
	chun-jie.chen@mediatek.com, jose.exposito89@gmail.com, 
	yangyingliang@huawei.com, msp@baylibre.com, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_151101_128948_BC01A45D 
X-CRM114-Status: GOOD (  11.08  )
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

On Mon, Oct 24, 2022 at 3:23 AM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The main/univpll clocks are used as clock sources for multiple
> peripherals of different kind, some of which are critical (like AXIs);
> a rate change on any of these two will produce a rate change on many
> devices and that's likely to produce system instability if not done
> correctly: this is the reason why we have (a lot of) "fixed factor"
> main/univpll divider clocks, used by MUX clocks to provide different
> rates based on PLL output dividers.
>
> Following what was done on clk-mt8186-topckgen and also preventing the
> same GPU DVFS issue, drop CLK_SET_RATE_PARENT from the aforementioned
> clocks.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

