Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 874E2C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Dec 2022 22:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:Date:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/kWu3ykUp6jy2oE1ZRRlRshB8WYV422H/n94yGeyIhw=; b=JYtR9h/DfyWYjm96RbElOQTbkA
	PHl/1jKBGcT3J6lvICVyOI0okKeVbLo75ppQ3xqJMP91ktSv6WRoTB+aW1sqWKBcrnPEuEAQkXxQ1
	53zAGpG6jACwSJAeCVhWAAVjjEeBTOkPmPs5c0l40c8em+I6Fm+Pbf7EKBsMzcZOHCEp3LN/0LETa
	2wrxrmHQiJFvzmQXhIS9hSLO7sPTiIV3f2YgBOOLDkydZHkvez8L8EecTOUmwkkYW0hYCRyA/pARF
	kawgR3ipvqGR6/sy33E3m+25w4yaJTlrDGttzAg07TSV07lqJlx9f7K7AdcK9yc9++ubJMvdg0DNu
	lo5skpdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1EHU-001USb-0T; Fri, 02 Dec 2022 22:13:16 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1EHJ-001UPy-P4
	for linux-mediatek@lists.infradead.org; Fri, 02 Dec 2022 22:13:07 +0000
Received: by mail-pf1-x435.google.com with SMTP id 21so6146471pfw.4
        for <linux-mediatek@lists.infradead.org>; Fri, 02 Dec 2022 14:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/kWu3ykUp6jy2oE1ZRRlRshB8WYV422H/n94yGeyIhw=;
        b=GAXzEoo+S14lTK4cD0oXTEUsG2k/16arWIJHGYDGGoAITzPptHOYra+4PIZqAMKrAp
         0tB61+aGUNfbM+CwM2yGVn+YfT1RARaHjexCaAWA6Kq22roouKhqhimPBUwevE+wG2Sg
         ZdiVdxiW6gDD6Q9OAe7rXSCASwOhwS+nWPyfQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/kWu3ykUp6jy2oE1ZRRlRshB8WYV422H/n94yGeyIhw=;
        b=vhK+QqdfTngYhO6rp8Jt1cRrEiql3BP6lh54DqB+z7Gy1l8oE8HXxpIu3YrMRETcdQ
         B1Zn6dapOLs7SCBHcVyCasn2aKbbaVp/36O7ytl/sY9xV+wllkrtTv5CY70u9STkIEgh
         ERY7ub8bnrDk9e5Hg8S445JHYCjjMhtFo/dJlHKyduCZ7zpw1Ia9yYztF9TerKAbKbKi
         tWFZ1xHf67R8iNHTNUoa09IAwAFLfVgxd9/qyS2CcpLXXr7HXdiXwQIV99n9VLeWXTsG
         Mb6rk+ofqKAxT9zDCB52bjk2f3sOPIFBmd+g9NRRtTRZu66Kik5hgpVvNxSY8zHxw1U3
         vbbA==
X-Gm-Message-State: ANoB5plAErwXCdrUtnH8L9MCBhIHlwImUMxeYg/ddwvrtqSRIxTN7Fqs
	j8FtY0E5YKC+AUkZ0dC7bopipA==
X-Google-Smtp-Source: AA0mqf4yMGLxJ4yzBzgABiEyiOC9Cw7v89H4Mg51yU3dIagFC0iIYu5hjOGUJWotx3YNlubWgYaiJQ==
X-Received: by 2002:a63:dd16:0:b0:476:d2d9:5151 with SMTP id t22-20020a63dd16000000b00476d2d95151mr45023874pgg.487.1670019184321;
        Fri, 02 Dec 2022 14:13:04 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id f205-20020a6238d6000000b00574679561b4sm5563234pfa.134.2022.12.02.14.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 14:13:03 -0800 (PST)
From: coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date: Fri, 2 Dec 2022 14:13:02 -0800
To: Shayne Chen <shayne.chen@mediatek.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, linux-wireless@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>, Kalle Valo <kvalo@kernel.org>,
	StanleyYP Wang <StanleyYP.Wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Peter Chiu <chui-hao.chiu@mediatek.com>,
	Eric Dumazet <edumazet@google.com>,
	Money Wang <Money.Wang@mediatek.com>,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	Howard Hsu <howard-yh.hsu@mediatek.com>,
	linux-mediatek@lists.infradead.org, Felix Fietkau <nbd@nbd.name>,
	"David S. Miller" <davem@davemloft.net>,
	Evelyn Tsai <evelyn.tsai@mediatek.com>,
	linux-kernel@vger.kernel.org,
	MeiChia Chiu <meichia.chiu@mediatek.com>,
	Paolo Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>,
	Bo Jiao <Bo.Jiao@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
	Sujuan Chen <sujuan.chen@mediatek.com>,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	linux-next@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Coverity: mt7996_mcu_rx_radar_detected(): Insecure data handling
Message-ID: <202212021413.392BADAF@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_141305_856465_055A60B6 
X-CRM114-Status: UNSURE (   7.28  )
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
    98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")

Coverity reported the following:

*** CID 1527812:  Insecure data handling  (TAINTED_SCALAR)
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:338 in mt7996_mcu_rx_radar_detected()
332     {
333     	struct mt76_phy *mphy = &dev->mt76.phy;
334     	struct mt7996_mcu_rdd_report *r;
335
336     	r = (struct mt7996_mcu_rdd_report *)skb->data;
337
vvv     CID 1527812:  Insecure data handling  (TAINTED_SCALAR)
vvv     Using tainted variable "r->band_idx" as an index into an array "(*dev).mt76.phys".
338     	mphy = dev->mt76.phys[r->band_idx];
339     	if (!mphy)
340     		return;
341
342     	if (r->band_idx == MT_RX_SEL2)
343     		cfg80211_background_radar_event(mphy->hw->wiphy,

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1527812 ("Insecure data handling")
Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")

Thanks for your attention!

-- 
Coverity-bot

