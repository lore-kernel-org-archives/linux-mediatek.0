Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E163606A31E
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2026 00:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lRfaQ31D;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DKK/f/pb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=x6zdHjHGVwvVlbnZegdR/xLT/lgEN20BGxlK4KRKp5E=; b=lRfaQ31DJThlPL
	/5Hf8K8ZJYJeOYDSlH6FXl3YnnLym11NQyQpNYSyteUWr715wjn3u/7Iki71Eb/xcjCgljHrkYFGM
	n1zegvM0wBePgZTV9RN21EUfR9QfAApWQcXGjAzVrcUa9i2rCdPa6/qVulvnNYdFuKLyw9MVTR1NQ
	cKfbq8VE+U2LL9VbL1MpYh4ze7VtBqdo+qk7ZsnrXS6NOSgrLSaN5Hw8jp1hXTHSDaiF+dKmSIDdY
	1Mo8DqO/rUtq7UAWx51Z0jXAhkqwca9ILaujGpQPM17564N/QWLzG47Fk520j+mhnsdsme53nj173
	A2m33erJw3DdHDuPx2xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVeRl-00000005GVR-1cjp;
	Tue, 24 Nov 2026 00:31:45 +0000
Received: from mail-oo2-x02.google.com ([2607:f8b0:4864:31::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVeRh-00000005GUD-1xIx
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Nov 2026 00:31:43 +0000
Received: by mail-oo2-x02.google.com with SMTP id 46e09a7af769-849c2965b9eso650291a34.1
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Nov 2026 16:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795480300; x=1796085100; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x6zdHjHGVwvVlbnZegdR/xLT/lgEN20BGxlK4KRKp5E=;
        b=DKK/f/pbFbiQPV3bACGyl8jev0lDGavf2G7lcp8g9ua8Io3TfT6YKdIAm96d0ZrsHH
         GqhM4JxpHZAEjiQYWipjYPobjB7GhyL7SE/iIs/6NtWI4Lgx4Lx0nHVqaUn97B+7dMhn
         9LbJkrrpfwsUou/xu7ym4sgzmZ97eQ6G6kgoDCoCs2yuzXdx8cWFGSJouiG9vdzBHVWX
         pAq3BHb1yqH2AYSczzEIbcKWbA00CRGbthyucPa5LHaZmpy3g1txYiOkGvMioKTocp/g
         9hsX/tYhMe/0xV7cOj6IcMmcq1Aql6ob4h+n+57H52urVC9uEILkllfBf7wUBFv9q5Dd
         /FCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795480300; x=1796085100;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x6zdHjHGVwvVlbnZegdR/xLT/lgEN20BGxlK4KRKp5E=;
        b=eoU5KvG3I4zZN6Oah3HJSqjk2xpBsvgmg7XVLh6pJfxh4P3GjKqzBDmrRQl3Vc6Z66
         fuNzdxN5pfvBpcxuhpQZF1vX1P7SwC100qC8N4+1y0IQbp7tLJxQEVIkiD4O8Az0E5X4
         A1MrnwJgCAQ6S0wXoHbYt+li4SvUuJC0w2qYH08PdydBAI3wexhP7/TtX0yERRpk20zj
         a5ZLl9oyQCLqJzk2CgE+QxMluu2GELU0YQkpJH+reW+Eu6mjq7fZbs/MueH0XnPGl3mY
         VmlwSzW4lGxKu1VVlNxp8bxu+l54mm9GBO4ENye/Ug6VJAO+7EgtR2YVY5TrkmGy4aPr
         /EBw==
X-Forwarded-Encrypted: i=1; AL+hErHvvEZLgUlpoBrfu2sYY0q77dePa0Pa1x0xtcD+sPFn2auH0icg51dHnde4INJ+ZbvKit8XMM7Ezritaz2cPg==@lists.infradead.org
X-Gm-Message-State: APuU4Z9CvqVmVx+Nh34Y35s+SAk0RVk1DAcSkBJJntJE1cKoRakdMFAd
	NBBOWVnRolgiATyo6XSrrY/Ln0LJEycKJETuMx9fmVGuYYMqVEfQdJNWuwijnmpSYqLBhw==
X-Gm-Gg: AZFdTZc1XoRxSu5ZakFhzwYbv5pH613/npmRtCYfJSL5urVWQKwx7IKXvQVLvjjB00V
	nCX9yHgLU4fPo/6WAJf+WL8ghlnaGtJbFZfWRizZdRlgGgEgHsQsD+F0y3CUn+LDGE83X6Ekx5r
	hH1wvBCGn5xsuNqULZEA/Qdk9PlWASx8ghME9KxRP8KDPMGx2Ibo7Vuijd75bF+3qroOOtCVx4J
	tE61KukN/IPJ/kGb8UtPKCIVzBS6hHzoq4Bsk0gqk1HnY/VfT+TTFOrSkiDNcf5p1LMEEMObp8a
	xNZyt9Uz3fmwJgpV0MZeJlePoQVFZRuKxBNwEgT6z8v6TKfVwGFV2g90G3x40ZsOHtdjGYSYUH3
	tiOPxnMmtAA+TQazXb1w8h5sp8RQWxtxQJSJF8FzUsX7dSms415ASdATS9yaoPKV4C/d88LJJsS
	cDIghYQ2j9FTQSQsqFDd0zyXYZrVTc6+6nw1u7H4gq4eWBEt3HK+bPCY5z1dtloHmEuuAT7tof8
	u+H20qPLk6y2jiSg/ja5RFxwZBFUgkrXwil5fA8dJoSBq51FbDRvlQPeOwdHGbsqRsDYB8x6UzB
	J4D0jqXaYrkAyjj01EZgbAy5T98YoskSqdTFCFReN7QOOQ==
X-Received: by 2002:a05:6830:43a0:b0:81c:a6c8:8a65 with SMTP id 46e09a7af769-8631593740fmr14730091a34.25.1795480300341;
        Mon, 23 Nov 2026 16:31:40 -0800 (PST)
Received: from ?IPV6:2600:8804:5716:d800::d500? ([2600:8804:5716:d800::d500])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8631670c44dsm9477750a34.0.2026.11.23.16.31.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 16:31:39 -0800 (PST)
Message-ID: <fe208c0c-cea4-4e56-8283-e242ac1cd2ae@gmail.com>
Date: Mon, 23 Nov 2026 18:31:36 -0600
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: zi-hao.huang@mediatek.com
Cc: airlied@gmail.com, angelogioacchino.delregno@collabora.com,
 chunkuang.hu@kernel.org, ck.hu@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, p.zabel@pengutronix.de, shaoming.chen@mediatek.com,
 simona@ffwll.ch
References: <20261119033634.1844084-1-zi-hao.huang@mediatek.com>
Subject: Re: [PATCH v2] drm/mediatek: dsi: Don't let a signal cut the IRQ wait
 short
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20261119033634.1844084-1-zi-hao.huang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_163141_513075_4F090C6E 
X-CRM114-Status: UNSURE (   8.75  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 19, 2026 at 11:36:34AM +0800, Zi-Hao Huang wrote:
 > I'm not sure the trigger is specific to our downstream driver.

I hit the same lockup on MT8173 (Amazon Fire HD 10 2017) with the 
upstream driver. v7.4-rc4, whose only DSI change is "drm/mediatek: dsi: 
force command mode in mtk_dsi_poweron()" from the mediatek tree, and the 
mainline NT51021 panel driver, which also sets prepare_prev_first and 
sends display off and enter sleep from .unprepare.

The trigger for me was suspend under Plasma. logind's PrepareForSleep 
makes KWin turn the display off, and the session is frozen while KWin's 
commit is still in the panel's unprepare. The freezer's fake signal ends 
the interruptible wait with -ERESTARTSYS, mtk_dsi_host_send_cmd() takes 
that for success, and the late CMD_DONE lands in mtk_dsi_irq()'s 
DSI_BUSY loop. After the watchdog reset, MT8173's last-PC latch showed 
CPU0 at mtk_dsi_irq+0x84, the DSI_INTSTA read in that loop.

With only mediatek-drm.ko changed, suspending through logind with a GPU 
benchmark running: without the patch 5 of 6 suspends reset the board 
(about one in three without the load); with this v2, 0 of 10, with no 
DSI IRQ or vblank timeouts, and the panel's power-down still takes 270ms.

The wake_up() hunk matters. With only the wait changed, every command 
waited out its 2s timeout and the panel's power-down took 10.4s.

Tested-by: Ryan Brue <ryanbrue.dev@gmail.com> # MT8173, NT51021

I actually had a similar fix ready to go, and found your patch, so thank 
you :)

Best regards,
Ryan Brue

