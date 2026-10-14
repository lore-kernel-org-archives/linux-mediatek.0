Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F35CC6B1A
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2026 11:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xfoExJf5zT7NtUl6j7xed6XbyKrpOGVfx8PomIB2cRg=; b=NTuTAr7yBadHCclJKpdCfBXY/Q
	lN3eKhoomq/V09olBtj228MMLuoM6du1iGXU9qoyi9Y49hZDKn6d7P1VKMYG1xPrqlRSv4npgoMEx
	v6L1d2D9OAgqVLbp1LonubdfwzORbl+YK1RuZugHoRN0zyJESDdEI4eLkj377gYhmZRMtkuJKSo0m
	TRzWWcU0NDYwwZQ4a5GQB8vndXrnhNWzdQtxopn6eTNJh7E+NIMJQkSGA43Fdov5ylb6anH0rnF72
	soZBYscKIu4no/+FejOOhMC7qju+x6HFKwlDRoYU7Sc+wf3Ez5H1U4LWvW4lKK2QUg+8RbrkQS2hv
	HgIIbKBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxEI-0000000FM5c-1ZxD;
	Wed, 14 Oct 2026 11:33:06 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxEE-0000000FM4f-3kfl
	for linux-mediatek@lists.infradead.org;
	Wed, 14 Oct 2026 11:33:04 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2db80fcdf8bso22746055ad.2
        for <linux-mediatek@lists.infradead.org>; Wed, 14 Oct 2026 04:33:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791977582; cv=none;
        d=google.com; s=arc-20260327;
        b=aoGorOFrwNqEN9tdv0ACrOhZsrZPjOBM0Li+ONg6psjq10OYZaJD6qurDVFeoBGB5z
         voTPX2ugOB2y6qw9SCrUjxev3YfWQBle5Ul0Amucw7+r1ajm3W6X9G5UA63Q4d4zDkr/
         gpr94nDVmFHtMRL7A08I0lhr9Pm2MmMP/i5YyZYMAPrQVzpDbUxDo5HES5m52PEhT9XX
         2ntvHMZpDOBT+WKYbLD3FZtxomxMjNa5ab703DQeV5XODLrxMLmlZUuI48NZHc0VqGS+
         8Ah3Ky1sVnMc1rAlbVb/DMIxwMCZ4uyJRJHLwmc/k6yUuZMPwoaWY02GHQIfMnjHKFwq
         yfag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xfoExJf5zT7NtUl6j7xed6XbyKrpOGVfx8PomIB2cRg=;
        fh=uOX/EFnskVlD3Pa3qOnfXk0RSg9uGwP/NIdKCEHMadc=;
        b=atXuzj8Ifvu+j6FaoE7Xw/nOl+D3q7157rNhvkiwDp+4tIWUVyr8TLdd8NfBWpTVWD
         9GhYYr461N7f9qxlqRkzr4P/STpRIse+ajxQJiAo/rOJQ/iYluO/rklzj/3pmLmpXrDr
         JFmt5vZVsrk8qc6TJ6tGnfresdgeci/scSrXPuJMliCK6fbkddbLpox87DeuGMUOJioR
         CiKcb4Dn594GKD2dY/JMp3dhAKSreesO1tltckKbL19RjuSSDSRlVoZApUVN84r1Hhxt
         9oYz8m+y48fiIcKj7auJTnPzpH+KKe1nUAJKZi2xUTglSXNv0fOG2kCK07ZfJNPhtSN5
         yy4g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977582; x=1792582382; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xfoExJf5zT7NtUl6j7xed6XbyKrpOGVfx8PomIB2cRg=;
        b=KmeNsoqNah0C3Pc4Vv3WE+KtXpIyk9S4LwylTDeNptEudBa/uorhsxveWDvMIdjtqC
         DyXjz86jAyU40ocyIsTLDGJMjq1QloVeaBp1sFv56wgAUVqNUvWkgU/mg5hYt17CiuKH
         u/BIGTIq3JLqbq+K1zw7MCW6e4HM69lyxFB5u+fZ6qtCT4Om8HBT8ScWRkU+FzhgrZwz
         yCpr59T4TIFOoJkxo4iZ2uk21ZIP+CQA1e6EbX22+hqCbbo895pQfD+8J7I8K4pkkYva
         UD1Olkim5OtiBx2Y/B+UApL7xpdl1VCOPx32IU1vrk7gVdfUq+LTKUS40bkpVfknFy0b
         4/tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977582; x=1792582382;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xfoExJf5zT7NtUl6j7xed6XbyKrpOGVfx8PomIB2cRg=;
        b=1JlZowCIGxTOXC5PP9ZPy8Paukbb6sebwUZaEdKgqH9AL4DQ7pI5o9JwYQ4+Jzi05H
         YsL/7Nh5QrKlUPl0a+oPkYr5Bz4AZATNQfY1C7KwITkwraUqFixZT3xDXh2MSDacxMsw
         TnN12uCPxxBU6PKJTr6wCAmm7QMVlipso3JjVyJBV48OyLFsUCs3CxJhCyLCb/7ejgXA
         x1Tk/n5dxX+gvh+QbpoAWbER0I0U7G8LIKB6z/pWVJkWA0XqXJsCxGIgwNz4jI9fudEY
         7brFzsAfLOtttL19hwIscqu8ras60HTWHDY6SAEAKRYyvEw46ShjJqTnSrWE4Q38lx7E
         7E+Q==
X-Forwarded-Encrypted: i=1; AKwUvBz4Z+nnczHFMMT/dATSgCcrfZB+xN8aSpISNlCEYgPOqeuMgnI7WhaTU0M29Vjq+IFhwhZesgIybqnnG/Nf3A==@lists.infradead.org
X-Gm-Message-State: AFq9FYJAYXa7wWOT41plymUNRgrADz0Vz/lI/XVxH/HcxIIZrfswZIx5
	PoK2ca05OhNsJNPqZ2gzOjBCxcX/WI3/rPwmuszM+xAKkqtCtwraCQVfAPFYF41knl7eO1fr9P8
	ESaiQ+98SrUJwJbbnNl4u7NvOBJ5ji5I=
X-Gm-Gg: AYBFou1u4kKUobARP0fM7DeBlBgBMm0kBOUWPI2b8lp0uEmQ5Joxe6raNDxBFKSyHpo
	wLdVI9cWy3FOc3/i8BP2TvdUca0fNj29DHGkGUW0fevAWjIxJNB5djHHj8AZby/lw2DqIhmZfnm
	5L+YpSyCg30Ah33l9mb51jY1lIXcQIK61TXrZ+0VQ7OQhk302hI8Z4lbW8mHByuD9lBwm6SLSfa
	T/bN1xr/MGGXY6pfo2OGLUkwF+XqZ4ypSj/02fbvkOVF5vEw8hGlbkcf6st8Y8pP62QKjHfWiFU
	FTnPt1UIkWbegWB2C0PwaMwVUBAnM7zGTlXDyfibfvbY5Xden+m4vNPcVFzLvu9YZQZWpUPThk4
	/ySH2jJJ2WFyD+s3ysaMC/pLuNZJswJq6uyrf8X+ANTJfgZ57jPpiKbj48BIqNmwJX7g=
X-Received: by 2002:a17:903:1b63:b0:2e7:ff72:203f with SMTP id
 d9443c01a7336-2e842bd0f74mr119079465ad.61.1791977581942; Wed, 14 Oct 2026
 04:33:01 -0700 (PDT)
MIME-Version: 1.0
References: <20261006101606.54079-1-phucduc.bui@gmail.com> <179192410143.1606900.17860222773161459120.b4-ty@b4>
In-Reply-To: <179192410143.1606900.17860222773161459120.b4-ty@b4>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 14 Oct 2026 18:32:50 +0700
X-Gm-Features: AclHuK_s2zGX3VihBvP-h606hGOl6LIyL74TJwbiVFCd2fpUtb4C574mAt5YBhc
Message-ID: <CAABR9nHZ2+AD=-SoAbXSuCMD4UU3VVEQJNEF4w57Z_c6Q1a5vA@mail.gmail.com>
Subject: Re: [PATCH 0/4] ASoC: mediatek: Return 0 from FE startup on success
To: Mark Brown <broonie@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Trevor Wu <trevor.wu@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, cassiogabrielcontato@gmail.com, 
	Haotian Zhang <vulab@iscas.ac.cn>, Christian Marangi <ansuelsmth@gmail.com>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Cyril Chao <Cyril.Chao@mediatek.com>, 
	Tuo Li <islituo@gmail.com>, Rosen Penev <rosenp@gmail.com>, 
	Garlic Tseng <garlic.tseng@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>, 
	Dan Carpenter <error27@gmail.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_043302_955152_93E66176 
X-CRM114-Status: UNSURE (   7.15  )
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

Hi Mark,

>
> Applied to
>
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4
>

it looks like v2 has already been applied, hasn't it?

https://lore.kernel.org/all/179138999054.2423942.10212092263791353501.b4-ty@b4/

Best regards,
Phuc

