Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5225C88E75
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2026 06:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uRse6mTJ7wbDyqaPOhujScHoJmlYUjJddn11gxGD2Rw=; b=BzaLY6mWZupjv+L0HpjyhnpAbl
	Kr4Fey2jeK/9qE0FRWtd7Xt3kndHWEI0OC8R2V7X0BRyF/0sCciYCuYsKzNSB7yAX1ESHRuYReD0p
	bj4aGz0SjH8lCR9yfj/9/VBxyFwLC5cvFY37KXq9QHEdil5Mx4r2bTYJIeUINAo2S4WRO9AiCFP0a
	1fj7OyeYkaX1CzOxt7HZp40nM5irvmuynvj2JdlP9vvv4wo3WB4k8MuNSILNRx7uODG87iH+YiAx/
	xgN/FSJ4FuirEMHwoSaxEuAK7PFlZuZoK0JoAooyG1M1U4foVUBJxmFOpWT5byvTwMlcsZpwrQ4xt
	iYYurcUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6N4e-00000005OiV-3zcw;
	Tue, 15 Sep 2026 06:55:24 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6N4c-00000005OhW-1olx
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Sep 2026 06:55:24 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-39b31b4281eso2931099a91.2
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Sep 2026 23:55:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789455321; cv=none;
        d=google.com; s=arc-20260327;
        b=gj4coRZK1jjr0WzmzQYN9SRGjlcQntMnhHIiQwjDflqSMcWBhpgCXfzXb0Qtfj/4+V
         rfrhQBXZa6EVqAs2yJKtt7J3v395lTe+YQytflZNmM+jLV/FnwxQq83Z08zaSvmS8WbP
         4XEWPGHrfbE6z/iT/CELXmjZ8Pmhh5TCYtWtZNWx9AstVyuU2BrEgBvSuzbbKX3zoTVQ
         GW8diN//W336r+PU5DLROXR0Q52EPyUGnE0pu+5GVpQY2zyy82uPrrBvgknOnAGA4jMJ
         ulL8/679qwdosfLlDeiBlwiDw6SMH6LIS5Mq0Vr4owWU9CkEBScb4cy/F0wz3iSdTTeL
         5ggQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uRse6mTJ7wbDyqaPOhujScHoJmlYUjJddn11gxGD2Rw=;
        fh=nCzhQtbkgvBA8OHErQkuzxWYdbnDikvsjZsfqDM103I=;
        b=VBTjz+YUYXY5UnIcDKNVYg/AMNp9nEL0yizEO4/Yk2DHmoAVqwAkUDjpAUV8xy95Eu
         J0aRsbaVZGon9ukqON2RPo1L4QDIoBaHRZmtsjzNr/RTCQmPofZPPypnLnx/4OKT/bmb
         pICqLFz/ieNEZk+/1V0UZ9vcBOPBt3qFa6hrXZs4IJJ3AyK8qZKvTCeaOQ+Tq0cJcfyy
         4PIl0lkUhz/+FmdEkZiiLMLX6a4BRFNLvAEBX5xJ/c/zk+4D3/15gTo0EQXXLVy+hVS5
         BZJYvObloQvdh1r5mSbhTUzSkV9c4ICODds9Cvi4M20M8jzFKhAbopwVymYVI95y593b
         Hp6g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789455321; x=1790060121; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uRse6mTJ7wbDyqaPOhujScHoJmlYUjJddn11gxGD2Rw=;
        b=pcTbMpa37YN71C5B4OaCGxbO69lcIOBSvovhCN0a4GhMlH1Mp6bnb5KgJEdpoNAFoP
         RpgTewEm/r8XKXC2YZGqtbCXtxPbxIqfxveehAKtA1SS0wTl4f9ewbKLWSjivpoWszlF
         6m2TkcaxQ6XuRzo8/VVRGYPf6fkJZqkc/CkAVLG8/6WN7k2SjozIdlcJLT29tQeVGufq
         gKtU+sG3UrbueAIp9d2Fv9y1omeZwrfE9zvW4mCSqclQeiyXk2o+7FVauhmBeXHGowru
         H3ZOfcNxH6QlmNd9dF71K3Y1hkU6FwzwGKo9jtPqhtdGeKFjHu6/P/Ym3cdeu8oKUSPo
         basA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789455321; x=1790060121;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uRse6mTJ7wbDyqaPOhujScHoJmlYUjJddn11gxGD2Rw=;
        b=VcZ5FjhSZx++o5br2tYnzhhRJAx5Ah/YLJAxGK6Qw5O5/O/frOYKBjS+H6BuboQYYR
         qXUfqfpp57YzMAbR8Wl6wg70Is2jLaflVfJXAoEeeD23IoEEUl7TGkFNgFRzyShPep8i
         1P5pLV9riU3F8C6+y2ZzF8U1076t3HHWH6FUHSA8wpF1fU2n9uycEio+unKVRL2dKr3H
         42ynnDDVR/nAcpbShbWZV82ghvKlXF4HpOp3V/krM3hdZvg2EJOpvFGsI5h7NZ6n7hKg
         U9Fy2IFPWKFt6PEydemIbLf0ZOlo74HuOBqVz9vo8/IfaWvQ1vHzeuDM/P0B2SVaNKVr
         FBUQ==
X-Forwarded-Encrypted: i=1; AKwUvBwmLZR95GmPF/XUTQi++Z1Rhlfews/olF6YLPzObNF35ZIFTmQal2dgTLAyHvf3HT5IuFROqmndfIQ+0X3dJg==@lists.infradead.org
X-Gm-Message-State: AFuF++mYWFRf7O36QhLCJ4fspSGHCdVlw9PqWtmNXvn1DufUv018blAy
	l6ipXuze8XaDeY+UD3cvmy8guBUHErCKb3VXJv3mWdIPpVh2hwNr7ZJd7zfSJyNC3n9175Kg0mK
	NO7rewXec2z83xEM3LJmcUGDgwcyySqA=
X-Gm-Gg: AYBFou24fiaBzxLmlVL/jygIJ2xFosbyiSm5VweCVkTto+1EsQ03FrSzXqPum39kFNi
	rER8gIwijwUspBDeFwBjcWBxBJwPRrJtgyYlon2F6ZLs63KvWAN6096x8w9Drs7UIGFL2mjXvzG
	EZFY8vnAQDLkVQvih0mscQa+QMWwP0+7JPxE3uM2yNpWWzPxtoBhwoJsUqC1bscQLjaIVAw2HA4
	B2vQi1JGlt5Jztvpk5L6VIlzEgG1aiy4eKWPFNknmvjbJEv1FyxNuCi+m+/tzNMWsHAQPLi20py
	CshBnZNuaVP95NY+GSdGSfSETjbDLQYnVnDKBsZcNp0wtoH3Qt7xy7ubEp5tayiXIJsIrGu/Yv+
	5extozKIfbaex430csfiD6qG5sZzIDxhAYAKxnAuaNJqiCZb3asHCSpDka1hBU1BRpG0=
X-Received: by 2002:a17:90b:564d:b0:39e:53a:c8d4 with SMTP id
 98e67ed59e1d1-39e053ace02mr2555146a91.12.1789455321539; Mon, 14 Sep 2026
 23:55:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260914072842.24420-1-phucduc.bui@gmail.com> <20260914072842.24420-3-phucduc.bui@gmail.com>
 <07add31d-5622-40eb-9bcf-f7cb2396fee3@collabora.com> <aqf7B_E7_Gv5iK2A@sirena.co.uk>
 <8f1ea5c4-d85a-43eb-8b10-3f80f8343b27@collabora.com> <aqf-pqvBNQ21EQZx@sirena.co.uk>
In-Reply-To: <aqf-pqvBNQ21EQZx@sirena.co.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 15 Sep 2026 13:55:09 +0700
X-Gm-Features: AcwNN1UCqK6sMPrqlCVGrE3bLZ2b-s0RCmlO_dC6IX4VPS5lJPfQdNqJWmpr8_U
Message-ID: <CAABR9nEB16gANTVf-B+sud0+11XhjCjqiCRY3hP_rnaFstB0tw@mail.gmail.com>
Subject: Re: [PATCH v2 02/13] ASoC: mediatek: mt8189: Propagate APLL enable errors
To: Mark Brown <broonie@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Cyril Chao <Cyril.Chao@mediatek.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Dan Carpenter <error27@gmail.com>, 
	cassiogabrielcontato@gmail.com, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_235522_498111_41AE83A5 
X-CRM114-Status: GOOD (  19.01  )
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

Hi Mark , Angelo

Thanks both for the review.

>
> > >  Though practically speaking the error
> > > handling ends up being the same as if they couldn't fail since if
> > > something goes wrong it's generally catastrophic stuff like locking the
> > > core up completely so the end result is the same.
>
> > That was also an implicit point (that should've been explicit from me): if anything
> > goes horribly wrong here, it means that it already went horribly wrong "some
> > function calls ago", and the platform likely already locked up as you suggested.
>
> > In any case, I'm not against doing error checking, it's just about not doing it
> > when it's really useless (I'm sure you understand my reasons), and I believe this
> > specific case is one of those.
>
> > That said, should you prefer having error checks in such places... it's not a
> > performance path, so I don't really have strong opinions really.
>
> Yeah, I think it's fine and sensible to skip the error checks in cases
> where we can't really do anything constructive about the error.

As far as I understand it, regmap_update_bits() doesn't go straight to MMIO.
It first passes through the regmap core, which has checks independent of
the underlying bus:

https://elixir.bootlin.com/linux/v7.3-rc2/source/drivers/base/regmap/regmap.c#L2834

----------------------------------------------
if (map->cache_only)
        return -EBUSY;

if (!regmap_readable(map, reg))
        return -EIO;
----------------------------------------------

So, in my understanding, checking ret here isn't just unnecessary
defensive programming
for an MMIO write, it guards an assumption about PM/cache ordering, namely that
the regmap is already out of cache_only mode by the time this runs.
If that assumption were ever violated by a bug elsewhere (a PM race,
wrong resume ordering,
a register missing from readable_reg, etc.), this is where it would
get caught and reported,
rather than the driver silently assuming the enable succeeded when it didn't.

Best regards,
Phuc

