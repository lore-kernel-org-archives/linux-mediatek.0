Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3655CA6012
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Oct 2026 07:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u/66UyK1G/RrLnhVcSi5x21gKzF8iMZFM8iJW73420s=; b=etPcfaas+1XWZJRAxptK16Wjb0
	kIyrrkAAZO7AnLygze1a+Y7N0wlMBR7CpecX/1B4gyDV9uI8iqIwpleI1Cv24OfU86lrF+A8hb/Kg
	qUr+L5/Gjg2Tc52fjWfEgyd8QhKWnUxsDv8/5MZbMyZ2UHXJASZ84F+XPciuaNDOeGe3n3nEqS2zJ
	LmxBvqrWsnJsMMlhJj3cQs4MsGExtz+TgElsz+/IEIJoe9ZcghHOtvl5Kq0FmepjL+Sxhxj0505f8
	vZE6oiWl1nxU5kYQSX0Ib6dKSjxd+7Rj7O27lnrwxVxobkSZcMW+cYkvKaR192/l9EGClWiPYz6GY
	iR7kVQfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF4da-00000005gMH-436X;
	Fri, 09 Oct 2026 07:03:26 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF4dY-00000005gLY-3GE3
	for linux-mediatek@lists.infradead.org;
	Fri, 09 Oct 2026 07:03:25 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-88bc25fcd0eso4961775b3a.2
        for <linux-mediatek@lists.infradead.org>; Fri, 09 Oct 2026 00:03:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791529403; cv=none;
        d=google.com; s=arc-20260327;
        b=Mu1amBioeI0q0Clt2Um4msvsf5GNlQSKddCuNsYENIBoMwW0BNG2bx8x8gvS4Y9d/a
         qyx29/vmScR1bNAh4mslgwO54oZQImN5+N2gkJ84ulRPmQZwD6/drqm0NIwcwY0zj7to
         CS8rh7DU8Dls5G1K2QKkI4UlIjkrklXAyKaNpkyhjZ6sTOS11gLkIAqkS4YU+f7rjCbC
         FruQBSB3eb7qwZxJw/HpzllS6Tgt2IMe38imsdUr1OgYmkvGHC4OjDbCDDg1OeL9lCq7
         HJY5WIh+Ce2cpe8/ytgN4Bc0xjJjN47+jK/hzTwqqLWpKwttoGCmxFtic8HrtBvjgqjy
         T6Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=u/66UyK1G/RrLnhVcSi5x21gKzF8iMZFM8iJW73420s=;
        fh=TU/9frnyuNIzCbRObiYoxyV3K9hdPp4HFeRPfTyxiFs=;
        b=QP4kN2xB2HTcw22XNdTPB0PF0f5kFWAXSAeWbCM4dYdoTZ491h8r+zayIp+x60G43e
         CLE+IrG7Wu++7x1pDHL06gDYGQ69HCmqWZDMNjeFrpEZcTprtem6RMXL19TmKvnF2rEc
         A7gc71p0jYl5PhcbDVQemyIqgvgsO41Dmg8Dyrl/LgxQF4JeqnaBb3Q0sjxHdoRRvqmA
         2Iqlje7dvmr4Xc+vlCQWP6EWAGY7mVSjmVzfiC0XTPRSq3cgIKOWURvafhX1CyUdGGjX
         y22lFTWH+2QHHFFYj4YnVcbpmsnsn8uzZz9e3Hg2Xhq6CzknCdqmGWMfvZHVOjBjGXEo
         PHeA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791529403; x=1792134203; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u/66UyK1G/RrLnhVcSi5x21gKzF8iMZFM8iJW73420s=;
        b=Tgk6rdSrvpPhHrBW03koFMAvROmi4a7wAqNKu0cKlwVWpd7OCv9nW/qOxCGA4H0dvu
         7YlxIt2zNVXhxCUt5ROOfMN+1nxfwi12/i7pSBre/vw7V8jNSDgQgIV2qyQhdjU+Ajvg
         xuXCNYOyPQlOozz2KHHpqoZ/P4Lj9FYbAizo6yYUbrHU+xOiu9uCHkpyS+cUUEY5EIjT
         kMQI4iS9Mwe69pGGCQsinKVBOLbuL8r6h8u0yX8bfznuqOZdhboMEIi2okUAcxnxGjiL
         gfG10DsNhq9fLL1IUNE50/1tz9miwzyMupxqcyfdPokSrmha3u5Va4100C5TwA45a9K6
         Jddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791529403; x=1792134203;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u/66UyK1G/RrLnhVcSi5x21gKzF8iMZFM8iJW73420s=;
        b=e/uUXzgsD4VWZr9jVrnWifbki/eeTmO883nSPfYjBgbCgWbOt1uYOwT6V7G9KmWN9V
         QWke+/Q2tpjCZ+BBANDSgn2ncqNJ5hgxEgPS1t8WibS2orecEnvzgQtz4SE0ZPOB+fxo
         ePo2Qw2HdnT1XjfAAhvEGlZutmTax87jdANczIHczRsGk+3ILQ2omHKYvzK9Q0uKpYA3
         Dv3c9GIQ9CGLCCwdGrzrkl4G1mJSQhGRbbbe8Rst9vZKyKmn9SnwCxbTHmQFM1fA5oJ5
         8E48EQvmlYusvjYQNy6fdJLVCCqjTresVgdySyt3nREOYSDdcUpYJN3fK2I9W3TvjWym
         OxEA==
X-Forwarded-Encrypted: i=1; AKwUvBzU8EgCdp8kis48vCCFKWsnWiBu3RYUGQYQyf33a8aWeLLefNUPKigHrXAJbKl4iu1Vf3yjlVxlCq+NOYmvOQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYJPAHs1ovcO85hFoLpnfrMirZQ+SUPxPpEqSBWxsHy899rFhOw9
	1KWj5CbUSjGLZB1a8/bEeoXKP5hBNsAmpq4tgbkHz2R1l0WJyuPVCpf5MxsxHssS8Gw13Gw/YpK
	p4WqKyXiDRK/SMz4hB1r+wJt/LEOw1w0=
X-Gm-Gg: AYBFou0dIY9I1CnLGLneKTaSnbGQwl/abeevGoJ6radHOjzcXX1mo/TBY9l0L4UlK49
	u/4PJ9rcmNT9k7yujvYmUW15wnuEqqtFHx/xxsghjWWfIMvCC/ZAZ1T3HldoZ6CMipLqcLAo/jD
	HdYEwnHVYdgkcm/G2yGIryeZ13mr7k46S0XIfP4qtABbd7baqhZ8yVb/fX01SmlN4iYqyPMxvTd
	B6/3pObpjuRz0rO5QYEbWMUTbKFcVY0wgLY0Ehu7SGxUYx3CSehnx280DZ/NrmmkdKe1zCcR4E3
	wlH+vvVpL678BEOyVIiA+Pu2Q2ttKa7UT83V3A25U0P3iBEItUdCEcVmn9bsWu8TMhdBkNQpU9c
	oUTfnzbitDAyHgp9tMEC8ZNyfN7ijPT360IQ5QXsadhxl7t3MxyTqFdLvnfW4fU4UAp3q+jqiyV
	omLA==
X-Received: by 2002:a05:6a00:aa04:b0:885:fcc1:d55c with SMTP id
 d2e1a72fcca58-897c7ec5a0amr846999b3a.43.1791529403528; Fri, 09 Oct 2026
 00:03:23 -0700 (PDT)
MIME-Version: 1.0
References: <20261005110257.50145-1-phucduc.bui@gmail.com> <20261005110257.50145-2-phucduc.bui@gmail.com>
 <56ca274e-5b56-413a-9fcd-9ccf1631d8b9@oss.qualcomm.com>
In-Reply-To: <56ca274e-5b56-413a-9fcd-9ccf1631d8b9@oss.qualcomm.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 9 Oct 2026 14:03:11 +0700
X-Gm-Features: AclHuK9K_mTmShroHQ2NxfLYvmjGvCBUVZdlzaaqulcpuz6FtNuEKnD6JjCP8qA
Message-ID: <CAABR9nG6RyjjmGhYKgMJrjbO+E5+UxBq5JBfeoG1qj1VxOZn1Q@mail.gmail.com>
Subject: Re: [PATCH v2 01/14] ASoC: mediatek: mt8195: Fix tuner clock error handling
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Trevor Wu <trevor.wu@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, cassiogabrielcontato@gmail.com, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Haotian Zhang <vulab@iscas.ac.cn>, HariKrishna Sagala <hariconscious@gmail.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_000324_880821_EA523E73 
X-CRM114-Status: UNSURE (   9.86  )
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

Hi Ajay,

Thank you for your review.

>
> Should mt8195_afe_enable_main_clock() also check these return values,
> and unwind APLL1 if enabling the APLL2 tuner fails?
>

Yes, I think it should.

However, since I don't have MT8195 hardware to test with, I'd like
to wait for feedback from the MediaTek side before sending the next
version of this patch series.

Best regards,
Phuc

