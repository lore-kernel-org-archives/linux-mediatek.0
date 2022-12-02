Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6026C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Dec 2022 22:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:Date:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2jTCIikbeptzJXD47+EMyi5YDiLQQfJyhpLRVU8dNm0=; b=dt7M0t3gX1XQEb5vN++FyR7WHS
	184mlCWT/xgSxF7ZpU2iQXq0fTvP2Qm0w27kXCy62wam8PAu1yXmOBh6nO5z/89rt9xoyXXsjIzeL
	CeC4sZsRLK/yeDA9lafqTNQw2OwLFhZA9GGJ818yVx0mHAdPX6ROfC9jAXMNHpMYYR8kmuNdAe4Fk
	LIp/pm5mUML/ycP3X4IBKAzooHwmO7+Nbdg2ncqr32JmwKoN8lfsomx26egxfHMrUu0GQKVSEgHwA
	4NLObl70xm59Zo3wmOOqmWOHkbbY181W9+KVLc2hpRiNFSKe/WQP1i/H5g5faXtBGFMMAGY+UbX3a
	oogusrWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1ERj-001VU7-Hr; Fri, 02 Dec 2022 22:23:51 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1ERg-001VTN-Ts
	for linux-mediatek@lists.infradead.org; Fri, 02 Dec 2022 22:23:50 +0000
Received: by mail-pf1-x435.google.com with SMTP id h28so6141597pfq.9
        for <linux-mediatek@lists.infradead.org>; Fri, 02 Dec 2022 14:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2jTCIikbeptzJXD47+EMyi5YDiLQQfJyhpLRVU8dNm0=;
        b=ToGWGrmjiT0lMJNU69+4IxRqSU2UDAoa5JWa/ImgVTqrDAPvBqFY71W+U+knKfDsLp
         6Gp/nSFOHt5+m0Q8yU1d8m1dfHrWQXxgZNXt9VC72vFrlEPN84l0JJ90OquEZXSkYb2a
         KYELpNU7HZ5x23pyFU+/OVsWhbIWwGK6BLjjY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2jTCIikbeptzJXD47+EMyi5YDiLQQfJyhpLRVU8dNm0=;
        b=1ATgftWayZ8o7XAS2CGzPLuGxhFNyW5vUCbFqdcOIBnn6Nm5noD7KMrbmAsrySKbCL
         4aE01+6LX7KTtn5p1IbZYTpUA2f7eyaoTHwweouw9QNb/WupU4mJwlwcS0mbSJJGDGJe
         ZHlff93+on+mPrlvNRzXB8AhVQAwf60rUHQapF3n+TjhGIlRUp6w4cB/FZiAA+HVD0d+
         2yVpf4wpa+o/wGDENIAmWCEZybjdGQOF6JlNNwYZiqgmaWz+T9x0rUrsJ6sVRNlK1LDS
         M9p4MT95aDoRxDK9T85LTx6nmD2WWRvGXlYyYyXhghKEuY5Kgw4KpaWv9m74rbHtwpeD
         mQSA==
X-Gm-Message-State: ANoB5pmTt+jGmJAga2BEAQUPGq5xA1LPnoG5wz9jjR2RBAJyhVef6PW0
	lfaPC4ihzT8eN1Vcil8tnyqQfQ==
X-Google-Smtp-Source: AA0mqf5GQF0f6fi1jAPdLnQFOWtH9RQ4f6566bGOi++EJw411Ux5M2z0l8uDW3zkf0KDGJveJ54bGQ==
X-Received: by 2002:a63:d117:0:b0:476:c781:d3ae with SMTP id k23-20020a63d117000000b00476c781d3aemr47136160pgg.183.1670019828150;
        Fri, 02 Dec 2022 14:23:48 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id b6-20020a170903228600b00186a437f4d7sm5926117plh.147.2022.12.02.14.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 14:23:47 -0800 (PST)
From: coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date: Fri, 2 Dec 2022 14:23:47 -0800
To: Felix Fietkau <nbd@nbd.name>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, linux-wireless@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>, Kalle Valo <kvalo@kernel.org>,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	linux-kernel@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
	Sean Wang <sean.wang@mediatek.com>,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	Ryder Lee <ryder.lee@mediatek.com>,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	linux-next@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Coverity: mt76x0_phy_get_target_power(): Memory - illegal accesses
Message-ID: <202212021423.5D5F1FD@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_142348_982009_1A4449F8 
X-CRM114-Status: UNSURE (   7.18  )
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

  Thu Dec 1 17:29:12 2022 +0100
    b376d96362d8 ("wifi: mt76: move mt76_rate_power from core to mt76x02 driver code")

Coverity reported the following:

*** CID 1527804:  Memory - illegal accesses  (OVERRUN)
drivers/net/wireless/mediatek/mt76/mt76x0/phy.c:645 in mt76x0_phy_get_target_power()
639     	case 4:
640     		/* vht rates */
641     		tx_rate = info[1] & 0xf;
642     		if (tx_rate > 9)
643     			return -EINVAL;
644
vvv     CID 1527804:  Memory - illegal accesses  (OVERRUN)
vvv     Overrunning array "dev->rate_power.vht" of 2 bytes at byte offset 9 using index "tx_rate" (which evaluates to 9).
645     		*target_power = cur_power + dev->rate_power.vht[tx_rate];
646     		*target_pa_power = mt76x0_phy_get_rf_pa_mode(dev, 1, tx_rate);
647     		break;
648     	default:
649     		/* ht rates */
650     		tx_rate = info[1] & 0x7f;

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1527804 ("Memory - illegal accesses")
Fixes: b376d96362d8 ("wifi: mt76: move mt76_rate_power from core to mt76x02 driver code")

Thanks for your attention!

-- 
Coverity-bot

