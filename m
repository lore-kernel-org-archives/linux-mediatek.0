Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10CEBE909C7
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Feb 2026 15:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Nsb9d4cdh3TIN7gk7P/dLzs//wsu5O2NugIegk+Dvg=; b=TzljF7o5Kc6XznF5LT48Ze1MBW
	ewArhlTDtvZqvm5aB80KCpktxLJLxLZeBUrNEPPYIpnqaiTn4sRbDMo1F63MvEdoXFpIXAQ1tspcf
	/i7DqpXqgL/LgH5jMpFXlXiUdqlhbqlXXGObdFUiGlv8mjQpwS/bWFOPKdqKD0L6HDjIytxlc3SvY
	rE4XgyLMQpq1gyon+m8XP2W3TlnGvgrNgn+GIsNoclVtHDAjjSSjG1dQi3V5TESLFN0kh0RCXSwmF
	bl1kraHyd5efXRPsY9YdhSE1QA1dwVnff8GUhAwSsBH7vxPpxMIMywJf/5nDmh+Iu0TaKgNwES3Cy
	p90PBUZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsNLV-00000008WTU-0de9;
	Tue, 17 Feb 2026 15:50:42 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsNLO-00000008WT0-1uAy
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Feb 2026 15:50:37 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-65b9db5e4c1so332873a12.2
        for <linux-mediatek@lists.infradead.org>; Tue, 17 Feb 2026 07:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771343432; x=1771948232; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/Nsb9d4cdh3TIN7gk7P/dLzs//wsu5O2NugIegk+Dvg=;
        b=l/aH6lpM5XqfTYdg7RjLi7YfiPzgn9yPBq6c+Uls0lWU5pgGd60LCf05t68TFVeJCS
         RiNAsX9ynYKx/v16SUEIuFJE6f/J4LyKn9cf5fKmbUcgJQ58FmSJcq+q3lcr8PYx0Yo+
         VpsVNQEsXciXbFgRyIVxLTDpUhYIJzetM3auP4sDvT++i5+97Y0YabEpjxRQC9AML5pR
         kFTV2BFCzm1KtXKWFSTdS6OmLKFzmRrfan2BaH2AE0JNVjJ9WESXv2f+bWXbls3ub1Y6
         qOPTwRTxFXN9C2pWt/KHqm8fSl0sy6TbEqOVzSxcXc+qFmCehPCcG64T182P6s7qZ8ZX
         Qn8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771343432; x=1771948232;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Nsb9d4cdh3TIN7gk7P/dLzs//wsu5O2NugIegk+Dvg=;
        b=M9/rc7DMMgR1+QQpeUTAk7U1Jht/VdbpeR7vwXAPrETX/ybqDE7pyY/G6U408LWdWG
         F5y5I3FTAPv8HSmCb/JEITyq+n/hCt74uhPPAYRwhYqv2p6a+nHywzBuVCJcD0oGH7ld
         3/TwOgCXhIsdhaBsJkhb4aLikdU4h/3ZsE28PbXYcS/ygMV6yy5UpquNvqiE6xid3eWH
         S/TD5gLULTZQskgqX4quB79tt7Zh44Vk7M+r6hs4E+NWT/fFhyT0O0yfRFMxIP0Nn6JN
         FtjOyBS9asem0SW8oAthr7Rjsp8MAOD6BfP/0n8nL7HB00kTwd2QJXFWGuHAt4m/Nq5Y
         xYpQ==
X-Gm-Message-State: AOJu0YzkBQKr0p6EXy3eH53+lUnVUEy+IoE9SJzJYIhM6WqBuPi8lYW7
	sz/xICv908B5/MvVu+JjUHzQtEgkLTvaRsrz8uUEmP2mlhTG5+h5fzw9qjc4uS5u
X-Gm-Gg: AZuq6aKoaC9cCqF6cyGAPFhfKklu0bXwbm1W1Nbt5hxMwUeJKPpqBSKi35+rq4luVJ4
	3BH4vOqUb2JuXJdtOfI/2ETFGmE7tpBgAWIbruNqzwLV9I0tIhRaor8PquPC4ebkkEYmOJ756t1
	cMMjbLWKM/7NFNhSZizu6x55cemYrjULuhQB8SMtWNR0mu+TFe9cdw4RLK1a6QiKH7UH3rJwtqt
	RYx5QXaApj984PIagBS73i7vcvpbPOBL2uNK1W3zfo4mpWtObLdH/eQ2wefGxMazFCNEHlAQ8xv
	yw7RpjYV414w1PZtnlKd84zfjU30MVGY2WFgJmmL6/oaDA2HqcpYytGSFLkMwMi3XbTh14oqAT3
	Xdzaeiig7CpsFWgmoy+a0J72cDvYYLziliyhqYsoFUla/6SPrq7CGnXK0r7eD7t8UQe0Ro6Zmal
	9KJhKwixMe8b6rbW5knNBwRdKYtg==
X-Received: by 2002:a05:600c:b93:b0:47a:94fc:d063 with SMTP id 5b1f17b1804b1-48370e38ba0mr147624125e9.1.1771336712310;
        Tue, 17 Feb 2026 05:58:32 -0800 (PST)
Received: from skbuf ([2a02:2f04:d501:d900:ac3e:d4d0:5059:7047])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48378b5196esm129721775e9.8.2026.02.17.05.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 05:58:31 -0800 (PST)
Date: Tue, 17 Feb 2026 15:58:28 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jitao Shi <jitao.shi@mediatek.com>,
	Fabien Parent <fparent@baylibre.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v2 3/6] dt-bindings: display: mediatek: Correct
 compatibility for mt8167-dsi
Message-ID: <20260217135828.4hgbyhnz5nuzm6p7@skbuf>
References: <cover.1771258407.git.l.scorcia@gmail.com>
 <ff920a7cc94f2b0c03d4bb55142030fded30d07c.1771258407.git.l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff920a7cc94f2b0c03d4bb55142030fded30d07c.1771258407.git.l.scorcia@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_075035_672146_F901A338 
X-CRM114-Status: GOOD (  18.49  )
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

Hi Luca,

On Mon, Feb 16, 2026 at 04:22:14PM +0000, Luca Leonardo Scorcia wrote:
> Remove the dedicated "mediatek,mt8167-dsi" compatible from the device list and
> describe it as compatible with mt2701 instead. It is safe to do so because:
> 
> - Bootloader doesn't rely on this single compatible; and
> - There was never any upstreamed devicetree using this single compatible; and
> - The MT8167 DSI Controller is fully compatible with the one found in MT2701.
> 
> Fixes: 8867c4b39361 ("dt-bindings: display: mediatek: dsi: add documentation for MT8167 SoC")

Not sure which direction this patch will go in the next revision, but
(if this patch remains in this form, and intended as a bug fix) please
do not mix fixes for the current (and stable) kernel with new development
for the next kernel in the same series. They are supposed to be applied
to
https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git/log/?h=next
and
https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git/log/?h=fixes
respectively.

(also see Documentation/process/stable-kernel-rules.rst for what is
generally considered to be a bug fix. We don't use the word "fix" very
lightly, there needs to be a user-visible impact.)

To help the build test automation select the proper base branch, you can
use the "phy-next" or "phy-fixes" git subject prefixes when generating
your patches.

You can send fixes at any time, but please send new development for the
next kernel only when the merge window isn't open (unless it is marked
as RFC, then it can also be sent any time).

