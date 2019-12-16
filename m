Return-Path: <SRS0=XFYx=2G=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83075C2D0CE
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Dec 2019 02:43:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 505BB24687
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Dec 2019 02:43:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Qfjob8l0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kiQS2Tqr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 505BB24687
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L0xXb/h9eq9wC3hxhaVtvB3vZpaEEDRy37xVyoU95R4=; b=Qfjob8l0US1VE0
	ZML4PIuIcdh9IVuhiQECxdAnyuIhPfXtyKovUU1gfbrTmq0VuuE0IT2mFDviYd+5Fce+dTyd8LwTp
	VsHyN5lFOO3O/ZraZV2Hg1nwEZ3Dq8KDbZOsTpfgohA+PJPLeR0HW/gkJTMo/PAju23C2S4qkMBHt
	mV3fle+j9pwBpuqyH2nNlsr7vX0vngIV+hcmTCSmDo3/mNzD5KEvxQymjPA0OAdzU3mchKiCGaOyW
	0ENK3Hq7x3M9lXMBMnr/fbmvieGVXzoDj8rQpH/JO7ciym2rjnXEzUcJDGtXhNYLtHwbnJh2mJrqe
	pkvgEiEi2jHwdX8ACKkw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iggLW-000222-W6; Mon, 16 Dec 2019 02:42:54 +0000
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iggLU-00021e-3W
 for linux-mediatek@lists.infradead.org; Mon, 16 Dec 2019 02:42:53 +0000
Received: by mail-il1-x144.google.com with SMTP id b15so4206338ila.7
 for <linux-mediatek@lists.infradead.org>; Sun, 15 Dec 2019 18:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9aCQDna0JdNgAijPNYO66CG/8UAC3gxJw6W+92Szu1s=;
 b=kiQS2TqrzYfZYPU/1gnhQNwf7BaK3yuKuPbUIr9uvHPiSCVvyG2e2bbRtCemQsxl+w
 ZI9NXg2Uw8JfEi4PJI9oCU3NwggR0UzFqsjdiF3tKXpqqx2Oy97r41md083YYxvbFqlw
 lHfY5VBlJ7w1kDKrjCWmEaKZBPgUNS6IoHRpo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9aCQDna0JdNgAijPNYO66CG/8UAC3gxJw6W+92Szu1s=;
 b=SNu/y0zVLC9dW/ZGFGMiiGXOGkOJ1b+2vsWMKsCVjHRS6/UiacWL9jbibT//SC9HO7
 FEHZu6cYJBWhAqhfNKVS5DT6/84VdUKSjzEIboZsoZHHu5v///JmAtq8db3yy57Vkpz0
 MJ6bONvNI/Xj1Nu2Lp2Gzb3Nw9qGJO4crThDjlewgVcj1wjc4whFYDqkyBGhNNxF2IJl
 ABDKpnCbAPeiJ9WeetqugwA6ofVM/DTIavS8dbbi6Co1PveUmgGqjkaYwRnsgOmreJlg
 qzUiau9AcYQPRFEKs3wEXdflybG3pDxRtZZEczk7t5fG9nTIqgXW9NBXoafWZcpwDEux
 3ZJA==
X-Gm-Message-State: APjAAAV/1jY9HiveOhSnRdCzJkxJ/4EBb+Yi8iDSmdpyLlujAnTTrMqi
 063LPoa7og5UFjz6+ggk5UrEzSLNgSD/lEvDQBmqhw==
X-Google-Smtp-Source: APXvYqzbg32oU48Vmt3h27I+7GAVGf3W+sKHDO/Z56LHLEB+l1l4zmiyGkYXciJP3Lxka1EKNGXP3lMjw3WC7PBmK/Q=
X-Received: by 2002:a92:af8e:: with SMTP id v14mr10077850ill.150.1576464170096; 
 Sun, 15 Dec 2019 18:42:50 -0800 (PST)
MIME-Version: 1.0
References: <20191213095215.17068-1-jitao.shi@mediatek.com>
In-Reply-To: <20191213095215.17068-1-jitao.shi@mediatek.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 16 Dec 2019 10:42:24 +0800
Message-ID: <CAJMQK-iZq0SRR7Q1cyh033xDXwD+MY-utO05+KqFR=ZRuaVUDg@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: reduce the hbp and hfp for phy timing
To: Jitao Shi <jitao.shi@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191215_184252_171963_065C76EE 
X-CRM114-Status: UNSURE (   6.82  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Bibby Hsieh <bibby.hsieh@mediatek.com>, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, stonea168@163.com, cawa.cheng@mediatek.com,
 dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>,
 sj.huang@mediatek.com, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>, eddie.huang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Dec 13, 2019 at 9:52 AM Jitao Shi <jitao.shi@mediatek.com> wrote:
>
> There are some extra data transfer in dsi.
> ex. LPX, hs_prepare, hs_zero, hs_exit and the sof/eof of dsi packet.
> This signal will enlarge the line time. So the real frame on dsi bus
> will be lower than calc by video timing.
>
> So dsi driver reduces the hbp and hfp to keep the line time.
>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
Tested-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---

Tested on mt8183 and mt8173

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
