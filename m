Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E5EDC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Dec 2022 22:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:Date:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F3xXQ9lCYQUlSBdhMmL8tVWcZF1nta/Hqkq7klcjUGo=; b=ayKyd8mtaXe4k0RYDBQqynXV3h
	501ERO3yMyw5fluFEzpiIrUgcuM7K5wrOVEbyRrfkPzWIT/1+dBVpJ3WaDAgeN03AhgRxIQAP5qBO
	cyybC3+l0ez3XLzVNjxqB3JRHcngU06PxIxUfoIvWNxrYKNbvY9IulyavwLZVnJW+GDkkwyzCwTio
	lxuxbxRWy6UIZMXhV5SOujLGBd6LbBK1is24zoiYonRGliVqzh8hXVnYk/f+S+XT5hTp5dhftyxms
	EFjEAA02Funxhfqy2JCskkJ2TuOnrhFXHmsy0ond0bOc4Vpci+8pOpM4IgROQ6GcQ97NVR6VYG75/
	IzAWsMOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1ESW-001Vew-GB; Fri, 02 Dec 2022 22:24:40 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1ESQ-001VcK-CQ
	for linux-mediatek@lists.infradead.org; Fri, 02 Dec 2022 22:24:38 +0000
Received: by mail-pg1-x52e.google.com with SMTP id w37so5489114pga.5
        for <linux-mediatek@lists.infradead.org>; Fri, 02 Dec 2022 14:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F3xXQ9lCYQUlSBdhMmL8tVWcZF1nta/Hqkq7klcjUGo=;
        b=ANMtQZQ22M8vFa//m1q5Nmz5C5pG2EpSadk6l4a/nZGYH8n8ibP6Wt6LaUr0FtwdxZ
         8YJeutEDfbFawUjEe7XOl53hVibAOcUc5N7HvhA+E15qlobGxxJb5hICBtS23EoLD3Zq
         oyal/07g/8aHTI8NzzysmrvqI1hNFUbBl+PCw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F3xXQ9lCYQUlSBdhMmL8tVWcZF1nta/Hqkq7klcjUGo=;
        b=Z6jfMmFvfvQbdxVTcAQvqbZQcUXx10Gv/obsDlMmHPBqP/nfx1WJJG1UpiMdU+Zroz
         nQH8DD9FIUzcoT7XG7bZLSJ18B6Os6rJxjdqDPmdQPVIsRXkUFq+p1jGDG5gclGAihpn
         thWDxwYVAYBBSYUasfY4tFgoOKdx+Zm0u9s5phbTEODzbP15xaKLBvWNfDE/c9pM3ZqM
         hAirbfHDDTCu89HH+khlW1bBM27DQ3DdMoJB7BHqPTS8KvINS9oBr3KV+UNBX/crQkZ5
         hgpnDefbivnFe3lLZi4Vu2UqZNLsVYuye8uERqEvUBawVWsFYp5IRt+qlW63zLD7kGNq
         4DbA==
X-Gm-Message-State: ANoB5pnhcL7YBl3H119A35QW6k6itYJ2cLWPgLy0xjBO8vaGqkE9wUoB
	CadQQYHadre9ZM1+GCBPn/0idg==
X-Google-Smtp-Source: AA0mqf5E5D//TIG/aMQomKzNdz/FjOxFMupViZN74H7lfe+o54dMc5jppUGkpbgH+JGrhPhCHz28bg==
X-Received: by 2002:a63:2310:0:b0:457:a1a5:3ce with SMTP id j16-20020a632310000000b00457a1a503cemr47333634pgj.416.1670019872324;
        Fri, 02 Dec 2022 14:24:32 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id z2-20020a17090ab10200b0021885b05660sm5201731pjq.24.2022.12.02.14.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 14:24:31 -0800 (PST)
From: coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date: Fri, 2 Dec 2022 14:24:30 -0800
To: Bo Jiao <Bo.Jiao@mediatek.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, linux-wireless@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>, Kalle Valo <kvalo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Eric Dumazet <edumazet@google.com>,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org, Felix Fietkau <nbd@nbd.name>,
	"David S. Miller" <davem@davemloft.net>,
	linux-kernel@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
	Sean Wang <sean.wang@mediatek.com>,
	MeiChia Chiu <MeiChia.Chiu@mediatek.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Sujuan Chen <sujuan.chen@mediatek.com>,
	Bo Jiao <bo.jiao@mediatek.com>,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	linux-next@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Coverity: mt7915_mcu_get_chan_mib_info(): Memory - illegal accesses
Message-ID: <202212021424.34C0F695E4@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_142434_448945_8FEF2D0E 
X-CRM114-Status: UNSURE (   8.13  )
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

  Thu Feb 3 13:57:56 2022 +0100
    417a4534d223 ("mt76: mt7915: update mt7915_chan_mib_offs for mt7916")

Coverity reported the following:

*** CID 1527801:  Memory - illegal accesses  (OVERRUN)
drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:3005 in mt7915_mcu_get_chan_mib_info()
2999     		start = 5;
3000     		ofs = 0;
3001     	}
3002
3003     	for (i = 0; i < 5; i++) {
3004     		req[i].band = cpu_to_le32(phy->mt76->band_idx);
vvv     CID 1527801:  Memory - illegal accesses  (OVERRUN)
vvv     Overrunning array "offs" of 9 4-byte elements at element index 9 (byte offset 39) using index "i + start" (which evaluates to 9).
3005     		req[i].offs = cpu_to_le32(offs[i + start]);
3006
3007     		if (!is_mt7915(&dev->mt76) && i == 3)
3008     			break;
3009     	}
3010

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1527801 ("Memory - illegal accesses")
Fixes: 417a4534d223 ("mt76: mt7915: update mt7915_chan_mib_offs for mt7916")

Thanks for your attention!

-- 
Coverity-bot

