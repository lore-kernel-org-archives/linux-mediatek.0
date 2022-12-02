Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D0B2C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Dec 2022 22:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:Date:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yt6U61saWMCsM6WunZD+lQTQ9rMom+0MKUGAGbXh2To=; b=GX/fgAPPUAv8MjmKcqUqGiAWIp
	pUOA78DOOpAC228jmWlopNHejUHg7LHyeIBlk7GPrqjWUmItHe3sq5N/bOKAG79prd/qfefXlzhZj
	OkYtRv8Cw3jfc9AqD1An2KRTvWJdTqcuqarXV+GKybnswnyawnqmYBpKTkB2THnqKrURZug/VtOiw
	m7AoZEMm9c7IfbgC6hKhThxKM2AgwLA+ymqbIxHURPqPoCqGw1PuH8R/wiHVaYmSnLYwRgo1R4Ohk
	BdWkuSLj1hlG9AiNlpuXFRHC6EpASD8LIqj/8vvLH9Mm6v9x0zbyuc1vZIkDycGEMXT/MrSJFoEz9
	wpf7LiFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1EUF-001W49-6s; Fri, 02 Dec 2022 22:26:27 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1EU5-001W11-7D
	for linux-mediatek@lists.infradead.org; Fri, 02 Dec 2022 22:26:18 +0000
Received: by mail-pj1-x102e.google.com with SMTP id e7-20020a17090a77c700b00216928a3917so9558666pjs.4
        for <linux-mediatek@lists.infradead.org>; Fri, 02 Dec 2022 14:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yt6U61saWMCsM6WunZD+lQTQ9rMom+0MKUGAGbXh2To=;
        b=JpkNSnUTQREjjU9X/9QyMGlgjT/ma/hBiV5HrI0DcxE2Idct0EzQS0SPud8jNOc4+y
         fXMXZoENWijXmad/5W89LY3KmeTspX126DxZCyiKxuGu7IPFcGkSTw/ysnfS7+GLRNUc
         hpzjNdf+6K6vfsBpzuGOOMwwpfTw94FefHU4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yt6U61saWMCsM6WunZD+lQTQ9rMom+0MKUGAGbXh2To=;
        b=71B0wseYlI4BoNh780KiFPizflMpkTsYGV4machvWkB1wRf6OFyCQ1QkuGHrWCOY3U
         4kkR9ll0Jp1epImZW2tfwJNbmOQ697rHs7nOpEqBRnyq6CBTUmwBnvjca8fcw6yFI/ra
         3WcI17dCWeRtI4Z9ftX0QEJHSB6T5iYNawRlYUMrV4FMLsTYCYakJUGMNCgkV1bCzlzA
         2FvaqWjufeAdgYpXJ4oew08JwQuUsbxUQ4aztmRZJsIquWtabLrhesl3tFRbir0kBHcZ
         rhwnCq7iTtkdB47vLK8T2mUkDK9bfZO6FDxlsbjWwpZfAFVbbbCjzLSGtJolsea9Rt9F
         0hRg==
X-Gm-Message-State: ANoB5pn3C37Xy7heBPQgOhSatdII6xIyO1390Qy2sOGDChoHtYOnQXSm
	aKEgUQDibsDXuUnLX67dgUPqtw==
X-Google-Smtp-Source: AA0mqf5hBB6FtCKudJpUxOEaTUIc1ooouR7B5mUlnUXJWd9jB2xbI+K89flhWre2qJUd9p1XkrgzFw==
X-Received: by 2002:a17:90b:4b89:b0:213:d2c:1923 with SMTP id lr9-20020a17090b4b8900b002130d2c1923mr20326111pjb.234.1670019974390;
        Fri, 02 Dec 2022 14:26:14 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id w81-20020a627b54000000b0057255b7c8easm5570259pfc.33.2022.12.02.14.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 14:26:13 -0800 (PST)
From: coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date: Fri, 2 Dec 2022 14:26:12 -0800
To: Ryder Lee <ryder.lee@mediatek.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, linux-wireless@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>, Kalle Valo <kvalo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Eric Dumazet <edumazet@google.com>,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org, Felix Fietkau <nbd@nbd.name>,
	"David S. Miller" <davem@davemloft.net>,
	linux-kernel@vger.kernel.org,
	MeiChia Chiu <meichia.chiu@mediatek.com>,
	Paolo Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>,
	Bo Jiao <Bo.Jiao@mediatek.com>,
	Sujuan Chen <sujuan.chen@mediatek.com>,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	linux-next@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Coverity: mt7915_rate_txpower_get(): Resource leaks
Message-ID: <202212021426.BE8F5215@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_142617_269452_4F02DB71 
X-CRM114-Status: UNSURE (   6.46  )
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

Hello!

This is an experimental semi-automated report about issues detected by
Coverity from a scan of next-20221202 as part of the linux-next scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  Thu Dec 1 17:29:14 2022 +0100
    bd2404d42821 ("wifi: mt76: mt7915: add basedband Txpower info into debugfs")

Coverity reported the following:

*** CID 1527799:  Resource leaks  (RESOURCE_LEAK)
drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c:999 in mt7915_rate_txpower_get()
993     	buf = kzalloc(sz, GFP_KERNEL);
994     	if (!buf)
995     		return -ENOMEM;
996
997     	ret = mt7915_mcu_get_txpower_sku(phy, txpwr, sizeof(txpwr));
998     	if (ret)
vvv     CID 1527799:  Resource leaks  (RESOURCE_LEAK)
vvv     Variable "buf" going out of scope leaks the storage it points to.
999     		return ret;
1000
1001     	/* Txpower propagation path: TMAC -> TXV -> BBP */
1002     	len += scnprintf(buf + len, sz - len,
1003     			 "\nPhy%d Tx power table (channel %d)\n",
1004     			 phy != &dev->phy, phy->mt76->chandef.chan->hw_value);

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1527799 ("Resource leaks")
Fixes: bd2404d42821 ("wifi: mt76: mt7915: add basedband Txpower info into debugfs")

Thanks for your attention!

-- 
Coverity-bot

