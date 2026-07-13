Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B79AEC44501
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2026 06:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F91gr6eE0JgbUG5KPP/YO2a6SdDu1YAaYwAdsLWaXGk=; b=Y5tWrKODuC7WgUNrIg11PpGkj4
	05frHNr/HmDNGARg/houVLyVmt1jSBgs80oZfRhMhk0Es6A0/pVIHHDFiW1MHT7Cd+8ae49U6Edsr
	Df9ewf4fCYnGIMwU4B8xIT1exE8spLI4gH/IaUHJKwPjqFUp7w9gNQAVsQtinZ+RsfzkEF5ludW3H
	3z0dtBn46P2qebVW41mpOq/CrLDb/WSDzzy2LyOS+u0cR9m2EzMjPJhsOAwNYV67KeKqgM2zmS3lq
	vYsuq9lp+jrRqCFQtbHt/7km9cFHYlRJxSZc8bLhE4ME2ULsbowMIHqBZveAESSs1gnHiWiRUW+U1
	wViyTrtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjAOu-00000008IRP-37me;
	Mon, 13 Jul 2026 06:44:24 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjAOs-00000008IQR-3J1U
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Jul 2026 06:44:24 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2cabc0a1ab6so36840205ad.0
        for <linux-mediatek@lists.infradead.org>; Sun, 12 Jul 2026 23:44:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783925062; cv=none;
        d=google.com; s=arc-20260327;
        b=eJM3QIbKzLV9eK/DRKZnrm7Trz4kUe5luKqx0p9px+R9ziV+F+es9MvEAr8d2+Ztr9
         gn/1tjugYcTR2XWQKRowBC2NTo7K/YAvCDr7xvQvwFXxaFb8obpBEO5RnmpB5w5xO2Tc
         icJ7LqsfHKjxSgPulU6g/Z5P1DJ6K+ssdx7nCxegOatX499F8RaqMmNkMmr9tRCmj+yE
         BQ0ZjCQAqluq8RpZaW8txcCk/L+mkOjBGzmhJsTp5w0rQ+kwDng6KDN/hqkI/bOj6CMG
         2K4lB2lXsDSCtL5pLOmq2bE9nRhipCttOddGl9PwHCJNscPHruViG5bs/TdWAAVUx5ip
         LSPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=F91gr6eE0JgbUG5KPP/YO2a6SdDu1YAaYwAdsLWaXGk=;
        fh=+bCUOc24tdFUnhWxHJC5ITaoQ4svMPh3uaEBrRsIjKs=;
        b=c2IBD+5wZVlphTPNTlCeNIuHBKVTBlDx+AKzoMfZ2kUszzM62iWnUS6er88bhvVEjw
         vqMC94p7AlwRH+XYUB60OG7uNnDhTVlZZ825qA1dSkCN4TXdFGk4jWqJKvseaXnnIR55
         ovlUcKO5GYdzmAYjfbF7MgJ799TsCMBadOw68wxOpXmhCi+ZhO5LRqNcinM3f75tNQv8
         q6llxlykGzFwLyFu+OWVVQSKim5fzH8pSHpFh9Mib9Npx+Z7QPwJJms7cn5kL4QVZvVU
         lw2nDyAIBklOheAmnjLRqOy+6w9u02qULJlIHAXWOcp88I2l6cgM9r+pSWmF9t8E524W
         2LQw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783925062; x=1784529862; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F91gr6eE0JgbUG5KPP/YO2a6SdDu1YAaYwAdsLWaXGk=;
        b=Fyh9U0iWGX9/EoHqMZDFgeyTAjKVd7MFrgVWlSl/WWOd41U/YUbG0JgZPU6ENUiUul
         Y69UoAquIOrgMqJ0QLbnK937h8NQpBAeP8odqo9NwQhO9OI55hZFcLuA6qaLfaQToNPY
         J9uZcXg68NgEzyUx9k4Alm8mGAo6VUq1+kY970gOWghSV3WVqTwV28/TojBBzoLfYI8I
         qb+9pdugH6/AFeMsvarQNJAohK5MCPOwjsC8fdHKUjXcsVX7OSftCk5Mo1uJbp/D029y
         CoadoGAfnikcY0HJ4IT1tkiQ2fp6UJjDKbRpNvFiUyP0nF9tjm/B9YM2e6ks7RTlICuA
         PNRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783925062; x=1784529862;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=F91gr6eE0JgbUG5KPP/YO2a6SdDu1YAaYwAdsLWaXGk=;
        b=kbsWft7T20i48pl9YrdIJfT1TdH4tNhzwOwQDKY7+5Wb4ice2vFxtLLenytwUNteYR
         V5BkvTAdO6ac+NrjAykxYd62/4iHeGjQ62Rrc7kc5AB0L0oJcxj+hK5jakv5/xhh4e2n
         jUn4iRozId7bBSzJEK5QRcZvob4DAnWfM+xyVnqkMvY2CBH0kS0wy1y0m2BPssXfMu1n
         P6IgWpQ6IZLyo5DdZFBhG2jw04ovAC8PRM5hDAW9xpsPIpJ8KvFOChLRSGAS63tkwhwE
         FSIEiXl5TtIrDHMeWWn8L09H/90z7wfqIkfg8go+jZd7m/XwFGeFOUZw3IHJ43131l/p
         moXw==
X-Forwarded-Encrypted: i=1; AHgh+Rq/IXWhzdiwHmv+pMeY2d5MHdSpZ5Iqa6XS02lAtvOzLzCfQw7GhhVqK8QQr9HOSTPSSchixLPVubmiNjKRqA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxRdf8DghxAQu29wntpKzAEDoQZ62wtcd3WANysHWnEf79FR/Jr
	6V7fgovW6WVXbvAOMCL/xmXag0wxs16XOD7bq2xzl1LgyC4HhnNTkG+OJkMGHJeHFVWQKskU6po
	l9dTlvrGhLey3ukn+U139EkQSzfJa+ws=
X-Gm-Gg: AfdE7clxpEdJQ/+JE+YHSwuI45lT7C2bPCQ+tLzvl3Cfn0zBS2zni2VY/pLbXAziWy6
	W9zgpfNdiMrYWP94TSYJk9H6M0PX4Tn+pNGrqeD21zUoJpjmE1yXiKaPEE1FjJ6trNDLLen7ivJ
	E0l/RvMp3wEvjSv4SaFyqTlRDeDcS9Q+mQYVFyOa+YJqArE1ClRFrTwpMLvO4adiQTPQkCMyUqu
	/98SZXC1StcXDbTiMngUV+a+KwiAijfgzqtVjKUG7TbAhOOn1PSBe5EXRQpvWUIeIO+rIB9MvPX
	6oRZT6yPMtMYIfoaE6eLsI59TxY=
X-Received: by 2002:a17:903:2983:b0:2ca:d666:df72 with SMTP id
 d9443c01a7336-2ce9ead1556mr77128045ad.21.1783925061877; Sun, 12 Jul 2026
 23:44:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260709045902.498848-1-phucduc.bui@gmail.com>
 <20260710050511.14439-1-phucduc.bui@gmail.com> <20260710050511.14439-23-phucduc.bui@gmail.com>
 <95f5d6ec-ecc5-4090-ac04-27cdcdc21b8a@sirena.org.uk> <CAABR9nHUc3KvC4t=hJ9osyw93aXa+kEL07G1posnYJdLvjHEkA@mail.gmail.com>
 <CAABR9nEQWYzvxDduP=+9qYEJNzXVbu587Aq9eGR7Tyo-K-u1GQ@mail.gmail.com>
 <CAABR9nHKCYvev=owQVw2sisGRiQPc5gFcW8d2O3RvhsRn_Sr+w@mail.gmail.com> <CAABR9nFwGjed9SOUZwuPNu58KPQD-aWnCKj7YTTM8LdF9dig-Q@mail.gmail.com>
In-Reply-To: <CAABR9nFwGjed9SOUZwuPNu58KPQD-aWnCKj7YTTM8LdF9dig-Q@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 13 Jul 2026 13:44:09 +0700
X-Gm-Features: AVVi8CeGlggaa6vmgFhAFOdY55QEWtxhqiyXAaixKicXSNM4i0jdxY8z3i5uafQ
Message-ID: <CAABR9nHvhufH-+2qg9DDa+2PsU5T_qn9EV25pNwirKdPeSdX0A@mail.gmail.com>
Subject: Re: [PATCH v3 25/27] ASoC: codecs: rt712: Use guard() for mutex locks
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.com>, Nick Li <nick.li@foursemi.com>, 
	Herve Codina <herve.codina@bootlin.com>, 
	Support Opensource <support.opensource@diasemi.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Srinivas Kandagatla <srini@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>, Oder Chiou <oder_chiou@realtek.com>, Linus Walleij <linusw@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, u.kleine-koenig@baylibre.com, 
	Zhang Yi <zhangyi@everest-semi.com>, Marco Crivellari <marco.crivellari@suse.com>, 
	Kees Cook <kees@kernel.org>, HyeongJun An <sammiee5311@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Qianfeng Rong <rongqianfeng@vivo.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_234422_855413_53256024 
X-CRM114-Status: UNSURE (   8.78  )
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

I'd like to confirm one more point.

As I understand it, cache_only must be disabled before
re-writing the paging selector registers. Otherwise, _regmap_write()
would update only the cache and return without calling
map->reg_write(), so the hardware state would not actually
be restored.
If my understanding is correct, I'm planning to submit a follow-up
patch like the one below.

---------------------------------

bool cache_only ;
cache_only = map->cache_only;

map->cache_only = false;

for_each_selector_register() {
        if (regcache_read(map, selector_reg, &selector_val))
                continue;
        paging_ret = _regmap_write(map, selector_reg, selector_val);
}


map->cache_only = cache_only;
-----------------------------------

I'd appreciate any feedback.

Best regards,
Phuc

