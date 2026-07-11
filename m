Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F215C44501
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Jul 2026 00:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H5WuB63RbKuGXGsDIh2uCohEIF6sWSpalpafrYB0BRA=; b=2mxzhrE0K7eRHURGoLQptU853l
	YljuLG4NHper0tCIVKSnQu7md6/AL3yPEErys4RT/EoXF4Y2cTozNnDBe3zfeVq7vCZPBZuDp3mdx
	yqJmRQvjRmLhvsWMlQ9qrBTk5QzS5D/Ku0kHxxWIgeSdif81xLbLquo7FlHLDi6gKlbZmEZPzSsup
	FSrlMJBN+upaUh9Q5EC1TJn5zQ6N5AqtofR6Dw/SvLQOHsfLWGIYTt+S84TKDgvx4+ecCvOE+nd/+
	1l+IhMwG3TZB6krej3H+hBrWPhcODMilRGpyKn9zFrJLiaELZMX51XbfqFiQ2CwpobYM7NAopHFaE
	UCMi1eSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiLGs-00000006297-3nIc;
	Sat, 11 Jul 2026 00:08:42 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiLGq-0000000628O-2kBP
	for linux-mediatek@lists.infradead.org;
	Sat, 11 Jul 2026 00:08:42 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-848643382fcso1475954b3a.1
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Jul 2026 17:08:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783728520; cv=none;
        d=google.com; s=arc-20260327;
        b=pUUBJGn3u2emOpIOQn+15QSCUrO+QN5ryXs3C3iM1V9NenCD07Ic4p6skj4sXiIt+y
         /d/53T1D1JHko71n1W///FlhuEJkcAMnxl3AFSgEH5KApoJLOa+fRwdIoMNEntxW22wI
         STXvn4+Y/6fN1G6u+b5N0JoR/Ma8YgKj5ARkZIFMDAc2axweIIq+/Itu19I8AozjeJtg
         vNIhHTBduWs4XTVNzaTTpTfqA/GEPqd9zhRK+R6fmM1emOE1JMUSlT6D67smMdVJ4t8S
         y01ox5tx2Adv0q/sVEuEPYFr8J9dc2U/3ohGyDA10envt/7avFr+g510XUfIRfFzdpj2
         rqhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=H5WuB63RbKuGXGsDIh2uCohEIF6sWSpalpafrYB0BRA=;
        fh=VdU5gFM07Cs8y99HGSsLmhYI/5cZ9qdaTaHpuicGlzw=;
        b=n5648ugVnMw9KGX/KZUCbFIMizbaUjxhjVhFrWaB3N+f7Oz1tvyyr71gD+ndmQW2xx
         caoKtDYzjteNL0PA+XPYUsox9HH1lG9tdoFR/SlZ0ffrNFUL7RHAxzzqvledY+dqnlmy
         vK1+pmjYg1yXF1H/296AUCfMUSXCaBpQj4EGdVeHYp+rB106IC66ASemuKJgbMg7E16Y
         Y5uIuBCayjApOvIln+yVcZ/i0e9TgjBbxWyh7HYNsO/2ECktlSUXwoXJOqnSwyX8UQOr
         xmJ6XX44J255wWkM8wqqxWH3KkA2YI6ECFeEbBSJ/2316cb15/O0+QOiieD5XEqjOQOO
         EWKg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783728520; x=1784333320; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H5WuB63RbKuGXGsDIh2uCohEIF6sWSpalpafrYB0BRA=;
        b=qFwslczf58/ip59yfPexdPUR3JEnR4p4NTTGuzDU/YbIgVZF/CKM0NXvQngCviAOh+
         lNOW1XzobOk5NQMdp39b3Vn7JOAw9UzTjpD3NiIjOBH+hxST2LmhjUq+XudmxL1QEK+m
         +toMyhQsx9y3OfBdr8FkX008JHaFfsgMLa4w7LfFkNrnn1MJSPWG6PVNnNnvQPhEedqO
         rOOSTiRy58Dzr6tm1gS+05P8Q9/IDdRwDpx2PblarNqmUcKdvAYUg8/sd/sSTISSyuSh
         l7tX6IRYOVBSMRyZIcFutm9gjp6v1U7e0puHLp+uVxxSijYwSkBEDuq89pnMEbEh3dHs
         4xpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783728520; x=1784333320;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=H5WuB63RbKuGXGsDIh2uCohEIF6sWSpalpafrYB0BRA=;
        b=dhnP4zURBhngH/VRlhpaCstYRsFU+Ls78Pgp3hwxe5OtIdGbKdrnamegR+O7hK++cy
         Bu3VMuS5PY7C86Lc+MfFWjWGAN/MJ8BtxN5bwXFBRBw0WjAnrMHiqUnvPUaMdD1aO9B+
         bbgOg0eL2tfiI089vpAflvJGicqf+8XE6iVpBbpgiML0Zitjm49PsFFNhDsI83QJ2L5I
         xtHOWwmf2JbGhZYa3XSSrmzx3EtW6kXqmMick0zipdpZx7T9aOnF49mipYe2VUiIq8aL
         pNP6wHUUo9Ty/SAUzWyWiAC4uN7Hzitedp0xzOcfgjDsyiGcOkHww3nT17uNSs4q/uuK
         yNfQ==
X-Forwarded-Encrypted: i=1; AHgh+RpiP4pOHC8CsSsgn52xWmqfczzWR810Pddg7PX4+Rgko6yQ5slWf58ec7ufao7breTlm50VcI1sfWOMtRR8fw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyKUUhacuykzikbI21+PCjoTmKlO6yDy03tdq6wJYtWmGBUNBAw
	bpZhZquK5O9rphwdsZScfL07mwS/vOxWmv8SE+Aum7k1II2giEenE+QMUWc2OJDjBX72Axr58tT
	Xn902QueAK4jK0ooWC7F3DACv9qLJkSE=
X-Gm-Gg: AfdE7cmZDfzTA5f8mDHBM0VFm+Y7b8zrhT32EnVvjcGv13kzncFKPsq7B/IcdOAHb+V
	96O5vV44WhcbJz6/MgzVLt1DtYYFWm66JfYKz00D2wmDx75KsyiQoFwOzAkBF+FqpQzgLqzOEW5
	b37dJzdcMwC4Q4VYIDvpjpUsSwSFQVqWYRA5ODJDFIadyWEhx5yWCB1LHPhrkX/SRoyjL6jq4fK
	IzOtaEfdPZ5yW66XV4ldOp8riOgYQVET+19Ukb4PPhotFkRjCbiYUdKwCfxkkAs8qtpWBBxtgTj
	RkstTuYxpRnH7jnjevZ5PEtXUAgoLLNKqT55ORPvJczh/dgfntSmXwXjRs4WbXL8KcX5ME3f
X-Received: by 2002:a05:6a00:cc1:b0:847:9e62:24b with SMTP id
 d2e1a72fcca58-8488961c11emr1089390b3a.9.1783728519714; Fri, 10 Jul 2026
 17:08:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260709045902.498848-1-phucduc.bui@gmail.com>
 <20260710050511.14439-1-phucduc.bui@gmail.com> <20260710050511.14439-23-phucduc.bui@gmail.com>
 <95f5d6ec-ecc5-4090-ac04-27cdcdc21b8a@sirena.org.uk> <CAABR9nHUc3KvC4t=hJ9osyw93aXa+kEL07G1posnYJdLvjHEkA@mail.gmail.com>
In-Reply-To: <CAABR9nHUc3KvC4t=hJ9osyw93aXa+kEL07G1posnYJdLvjHEkA@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 11 Jul 2026 07:08:28 +0700
X-Gm-Features: AVVi8Cfyiwxnu7eGIzA6KyPzlQ6PObhKgfr4WFgILFEbEKhBTf8y3pJA57dwTdg
Message-ID: <CAABR9nEQWYzvxDduP=+9qYEJNzXVbu587Aq9eGR7Tyo-K-u1GQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260710_170840_748011_4234612D 
X-CRM114-Status: GOOD (  12.81  )
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

Hi Mark,

One more note on this:

> It seems this goto block was added recently, and I missed it after rebasing.
> Sorry for the inconvenience.
> However, looking at the goto path, it seems we might need to unwind the
> states more completely. What do you think about rewriting it like this?
>
> ------------------
> regcache_cache_only(rt712->regmap, false);
>     ret = regcache_sync(rt712->regmap);
>     if (ret) {
>         regcache_cache_only(rt712->regmap, true);
>         regcache_mark_dirty(rt712->regmap);
>         return ret;
>     }
>
>     regcache_cache_only(rt712->mbq_regmap, false);
>     ret = regcache_sync(rt712->mbq_regmap);
>     if (ret) {
>         regcache_cache_only(rt712->regmap, true);
>         regcache_cache_only(rt712->mbq_regmap, true);
>         regcache_mark_dirty(rt712->mbq_regmap);
>         return ret;
>     }
>
>     return 0;
> --------------------
>

Since regmap was already synced successfully, marking it dirty again
would be redundant and could cause the next regcache_sync() to
needlessly rewrite cached registers that are already known to be in sync.

Also, in my understanding, any register write that happens afterwards
while cache_only=true should automatically set cache_dirty=true again
(see _regmap_write(), _regmap_raw_write_impl(),
regmap_noinc_readwrite(), and _regmap_multi_reg_write() in regmap.c),
so there may be no need to defensively mark it dirty here in case of
a later write. Reads aren't a concern here, since a read never
changes any state - it's only writes that can make the cache diverge
from the hardware while cache_only is set.
 Please correct me if I'm missing something here.
Best regards,
Phuc

