Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF5DC38142
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Feb 2023 16:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+bVGPVtRtaa5cQIg+lKFGD+Z/X5+QbVI5uJEe3eujP4=; b=xjuOnhlcL85cJMaykeWOWXBXmL
	p63zuuFEO7vH4Zspa6VkWOAopp605x+N3tGYKVeFkvv/htQemZk2dFpT3L7C4GVj/cotu2zrSS1Ph
	fJT+q+F23ax/zhqtPD6ouWUW1C0zJiTlb2MeOq/Wgnp6pF3Str0M35F+uFY29HrKPm6ty/OGyAdl6
	WWEoro9SlU1PR5we+IuZ34QM6hDxfKPivQwfQ2aa1H/b3XHAKUH/imrFMdBslnCHxzixcRV50yqMa
	GueedhVqsDdGYUHXB/8OhMqz030jjqLiIwhv4AZsFvfTu2Zkra4DraW/Wdtt8tflYXfl1/QM1l1N9
	8vVbKOEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNFut-00CmX1-5e; Wed, 01 Feb 2023 16:24:59 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNFur-00CmV2-Ae
	for linux-mediatek@lists.infradead.org; Wed, 01 Feb 2023 16:24:58 +0000
Received: by mail-pj1-x1031.google.com with SMTP id cl23-20020a17090af69700b0022c745bfdc3so2512996pjb.3
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Feb 2023 08:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+bVGPVtRtaa5cQIg+lKFGD+Z/X5+QbVI5uJEe3eujP4=;
        b=krXuztVlIXt0OtPPMJZmLCA41bXjfJzXjRxvBo+64BCeUf+ehCEpaXLdLtkLiU9PSJ
         G5HCIuqSo69kvHGqI/YYsP1Oqxl5HWlOWt9Bzj0BEP1WibSipHhMSnxDEphW57Siu/FM
         H8esrioBBC3DYqxI1c1/2FrjXHXK7TaucvGRw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+bVGPVtRtaa5cQIg+lKFGD+Z/X5+QbVI5uJEe3eujP4=;
        b=mLrMc0sofO5NTxIwHkjDPpIqnNFkQBMBFzrXHsu5s5KqEv4+iazUtT8K3p77e3TPra
         pQQTd0M2HweiKvqNOxHJSA9tnlSjjaiEyn3N8+I/46pbEH+Ak/PPTF2fGbANPi2QXR3J
         IAnvRwXCUyyjf7N5impAyjmb4ISBQKWooPDX7RuiFETULZAnbyiSNQ5ExP98TvXAzi9Z
         oB4Af4Gdb2pC9PvAYp3eKaFM4i/R4ItGuB0rfOnNhFwLXDrZyv9zTwLpPKNqNydiuYLt
         61x9uiYRSISKsSHcTK8d1putjENM7x5ER6eE2K1UK5sD6CtYImrpu8ygkV4E1ogt2iUH
         wdFQ==
X-Gm-Message-State: AO0yUKXr45rKvoKepvEzyBSpQfygaVQiZdeu3XhoUzTw6KsgpT2DkopS
	HN6c2hD0W0pKx/j0Bjtb11+3IiqWD2HiLaA+nB6uhA==
X-Google-Smtp-Source: AK7set8Wwhu1xOqCRb/mbilJpN+pQMhbG++yae2UbeAtfZZwk3eBGl96jZkbdqjWlLzGiKgpC2KGq6qTNYPjEYPbhuw=
X-Received: by 2002:a17:90a:db08:b0:22c:a57f:a90f with SMTP id
 g8-20020a17090adb0800b0022ca57fa90fmr573274pjv.103.1675268694462; Wed, 01 Feb
 2023 08:24:54 -0800 (PST)
MIME-Version: 1.0
References: <20230131200842.341272-1-greenjustin@chromium.org>
 <20230131200842.341272-3-greenjustin@chromium.org> <CAAOTY__7o5SMyc8jXSkO27Kc8r5TXaFBnMApSiOG3Cjm5+hZaQ@mail.gmail.com>
In-Reply-To: <CAAOTY__7o5SMyc8jXSkO27Kc8r5TXaFBnMApSiOG3Cjm5+hZaQ@mail.gmail.com>
From: Justin Green <greenjustin@chromium.org>
Date: Wed, 1 Feb 2023 11:24:43 -0500
Message-ID: <CAHC42ReQbOdyx9buUK4jCbobUhp86Jyu9onYRxUGHE35=H9TwA@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/mediatek: Add support for AR30 and BA30 overlays
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	angelogioacchino.delregno@collabora.com, jason-jh.lin@mediatek.com, 
	justin.yeh@mediatek.com, wenst@chromium.org, p.zabel@pengutronix.de, 
	airlied@linux.ie, matthias.bgg@gmail.com, daniel@ffwll.ch, 
	daniel@fooishbar.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_082457_381062_810C5DB1 
X-CRM114-Status: UNSURE (   6.94  )
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

Hi Chun-Kuang,

> Does all SoC have this register? If no, you should write this register
> for the SoC have this register.

I can't confirm this from the documentation that I have, I can only
confirm this register exists on MT8195 and MT8186. I will send out
another patch.

Thanks,
Justin

