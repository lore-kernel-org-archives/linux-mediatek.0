Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6917CA5FFC
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2026 11:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qWeQSA3iBk+D3X8mD2yjU++uYsFdGNeCCEs2kF1ghcU=; b=rjTxhfmWuP69QPQjL+QBqdNLBK
	tfltEzd+Q8k0PKTzSn5WV/E20I3aJ1RTjNeaU0jzZORKip6yrj0od2qBebLrWIS0nlcQMbv5QHX+V
	SQ7Dj6Z9Ky+H6vzRSvtWJWIlBUQF55ZVRJMyYZQk75lt0Xzkj39Xv9aEJdkiX3n40BhogaAu25oyW
	xWXdJYwP7bfKM5tv3NX3Qw8qXOo8Dd0h7+TKf8bTqb0FTx7FmYXUqVmPcovXURhCt7/G5urnofhlj
	29n/IeAla1eC99cUxLpwanaiegT0Ru5xyPlCJ3STvVms7LyGuFvD8dVtFY/kI+NrmFHd5cW+QEuyB
	dx8D8UOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE3Bz-00000000cVq-1qTS;
	Tue, 06 Oct 2026 11:18:43 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE3Bw-00000000cUv-25V9
	for linux-mediatek@lists.infradead.org;
	Tue, 06 Oct 2026 11:18:41 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-3a80d1c98f5so1377152a91.0
        for <linux-mediatek@lists.infradead.org>; Tue, 06 Oct 2026 04:18:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791285519; cv=none;
        d=google.com; s=arc-20260327;
        b=GIF0yFo8I6uN24JJw91v7pK5tWDRAF1QenXgseedYNtpMaqijSSVBX3cWGF1Pcpo0n
         cFI/BdDiMjo7jKlUgE3qIMAc4P8L7cqoz3SL6shBOTb6zS0PM0QfvesmM2avaywK5W0+
         71AslMWglPi9n7mi2sFS85CGAgxY7vaodeFFfHhqgStSRngCasRtR0h1FJ+dazAOg35W
         FpdmwvbgcBkWNJF955SEBvYKwIX+Rq035vpQ9AIyPl+QiGH8bQiuu+50oxUYCdq7eRsL
         Px347LDfzBnhLMaV6PelNosf34r00q8AGnN3OLyQ/g+DCE2+pzj+XFc5FpUBYMYHUnOl
         2tSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qWeQSA3iBk+D3X8mD2yjU++uYsFdGNeCCEs2kF1ghcU=;
        fh=ofSXnhSdlgK4ZMQrCjgqwvq8iTqnz1QsP27gANrhFHQ=;
        b=CGYBBmYMwAH/55EPpQGbNSQNXUpxlfVT0S1kP8t1zC9MD+CCmIf69ZuWb0gvcbLP9+
         gs3anHDi3le1C/2OGYDJt8BghZs7QdOp/bmePrQRipDXe6xTNM6BvQ8LwjMlQfPfBMfL
         ajo9TbAU8aCs8EDjfqH7QPW2UHiJeC/D9ei8zsPHNqFecLBZeDXL5tU4lWznzhgJdYoC
         0sp3+ytLAhwi9EM4Zws8eiC4CIhJ93WCDgUnydTZ1I2NyvqRtDLK5d5u0+hXe0+ukE+a
         w2My9s1nJb2VVOgZslAku4vvseMK+sNB+8cKNTi4rzLMAPnGKZ+9qzVEXS/iMc065M+S
         GgJA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791285519; x=1791890319; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qWeQSA3iBk+D3X8mD2yjU++uYsFdGNeCCEs2kF1ghcU=;
        b=RXr3/MOjPbYYaVuC+cTTsDeiqW/Jc8NvH1SKHBI8p/rHmYwmu/Lpl1KvqkhD17H/HK
         lP91B7C8boPk9yqeHzDGF6DDBrGlRt2Vxs6rXdiNYCBbx9t3qhilf4jk/yak5G0S36I/
         zXcFfF/wj0AUGM0B1cqbo20HemfcYgrFcngRBGRbe1RTEgnJGEUQUG4r2NB74EiPaynE
         9XZPxQSx3wk1+eN0eBSi4ewsUO+xpwCOpIFT2chb+F6RsJy3xVcloKjYgikI+c+/o1mq
         AaevHzf+1Ada6BsToGtIOJQE3P2oess8kjo4iyvP5CyMh2YXaCYdfD2XmpGrX6D/ogR2
         0+Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791285519; x=1791890319;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qWeQSA3iBk+D3X8mD2yjU++uYsFdGNeCCEs2kF1ghcU=;
        b=O0uZ2+GFgvkVmQTGIAqODCCR0hFmxQrmNsVovl6o6Ww+4Cm37YAZYgW3JkVVtHi2Nj
         Jm4me0d1W9aWbX3+v7HHlGA4jVnP5KCOJuJ5uf+42oLl864uYzHHMRfUalmkFoYbOJap
         3agGM7R08vkRGD0Ze1k4ISG4J9YQCWmK+X0M5oLqQ18vKBP1Yur5gJmoNrxgpQ6Hs1S9
         Y9gr7C4Qmxsm3y+4qVOID0RmqwD0QqikUn44C8VKeZGLNsBpBgOySZjaQG/0y7mWKXoA
         hCWwEZDdT9m9FeQIip/h9QNCXDSpOAN2ul0BHvMCcaPvhjpvnLaccoGXCOtEhaYzrMYe
         XupA==
X-Forwarded-Encrypted: i=1; AKwUvBxzXwOP0wsXqskSnvYqOPQbdFsnG1/CqYOIOUjDfOI5KrwbH1JRDyoxo22kHk+PJFIjNPG9IrYCfzeHsRT4Gg==@lists.infradead.org
X-Gm-Message-State: AFq9FYLc0GL+VVkoD3u9PENlARDeQ9yaVCCOlmnE9CbR14VG5191vmXF
	gymLiZ+4h49dEzaeZEQaw9g/Xe9QrtTlFXR4GlruQsAYgkXFrVvATqlprQLXJQeA5IVV4E7cXhT
	ipQH7BAiGwv1Zwm3z3ros/qAQpqN3xYw=
X-Gm-Gg: AYBFou1Ly/kSltgpLidOukU3F/uVYlZ3/mkPcU54H82WvumEHSah4UHrtUIVdjagAa3
	UllU9FCpSXu8hngwDjJ0jZSycXjRH/oDxl/fW/j8gm7ucHOZWwVpEZDKW40071K9U0el9XiNuor
	FI3uqPDhs/M0igrxnuDks0RkdIlAtc1EMFZBwUh24aof2yybtJkyUJu4mFKNcC+g1l4LxYvBGNm
	LMTmnvX2hrF4BSpPSg9aPFKKI98kosxSMRoF53/zfSDBYPr68htIueIO7+Hmkdh46pXYiD6wOWS
	Q8KZXHPrWicCedQhYFX9m/Vf6ELMchiGskSglju2FG6s8w8i3OiFjPa3YIlQSMzINr2roUw5ubt
	jtFDaKx+KcNiT2drzRlI0iee0i/43ui4YosJZ+wNMACaDKVJAB4gPq6f3xqhd+2Q2DU4=
X-Received: by 2002:a17:90b:2f05:b0:3a0:b312:1fbe with SMTP id
 98e67ed59e1d1-3a873517948mr721042a91.23.1791285519572; Tue, 06 Oct 2026
 04:18:39 -0700 (PDT)
MIME-Version: 1.0
References: <20261006101606.54079-1-phucduc.bui@gmail.com> <20261006101606.54079-4-phucduc.bui@gmail.com>
 <fa9642c4-7117-4d34-928b-f0937becc593@intel.com>
In-Reply-To: <fa9642c4-7117-4d34-928b-f0937becc593@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 6 Oct 2026 18:18:27 +0700
X-Gm-Features: AclHuK8llUKr61cpB9foKw2h-ehaYs9R91uCOJ-HEm_z8nUdGQwIllDsJU3R1JY
Message-ID: <CAABR9nGYB6vyR4AraotegkQzt3Xd1s+uFMF12GQdjY69nJiZEg@mail.gmail.com>
Subject: Re: [PATCH 3/4] ASoC: mediatek: mt8189:return 0 from
 mt8189_fe_startup() on success
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, cassiogabrielcontato@gmail.com, 
	Haotian Zhang <vulab@iscas.ac.cn>, Christian Marangi <ansuelsmth@gmail.com>, 
	Cyril Chao <Cyril.Chao@mediatek.com>, Tuo Li <islituo@gmail.com>, 
	Rosen Penev <rosenp@gmail.com>, Alexandre Mergnat <amergnat@baylibre.com>, 
	Dan Carpenter <error27@gmail.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Trevor Wu <trevor.wu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_041840_531975_09FB4FDA 
X-CRM114-Status: UNSURE (   9.27  )
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

Hi Cezary,

> Nothing major here, just the missing space between 'mt8189:return' in
> the title.
>
> IMHO the title could be made more explicit as you're in fact fixing how
> the snd_pcm_hw_constraint_xxx() is handled by the driver. "Return 0 from
> (...)" misses the point.

Thanks. I'll fix the missing space and update the title to:

ASoC: mediatek: mt8189: Handle constraint return value in FE startup

in v2.

Best regards,
Phuc

