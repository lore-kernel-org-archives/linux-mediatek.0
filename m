Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 993FCC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Dec 2022 22:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:Date:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ALZWGLHwa13YfXZGkxW0FB63ANWeHG5fPT+X9QnIXNE=; b=s0QqnYq8XBsfyxNzrV6w/bGDQ3
	ZxFXkIq5WyyGnvB5Beo5CrhL587bfh276+41Z07pTuYw9YwHNBbhYpLx3E9BNJ8Y5DRxQ93ZGdfA5
	2TI416vh3svWRBL2GwgV0il7qLT35uFI8ZBWd3GJH0xowILe2r/NtX/rZzPCGcxyfA0mFt24x8KQj
	T0WL5u5xWgV4CxgBzMcD+yHDPwecpCvlT4u88FPOMHPf6nBh5SZCR8545Qi+rscjWLJepGvzq8avR
	srkgZSLfDhypchnKbGVQsql/NOJFapl3ReCNvb/ey0mOR0iH6HJVOCaPLvIQAMbEzr+nbttfYLLf7
	VKxv70aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1EVw-001WS2-Ih; Fri, 02 Dec 2022 22:28:12 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1EVl-001WOd-Bz
	for linux-mediatek@lists.infradead.org; Fri, 02 Dec 2022 22:28:04 +0000
Received: by mail-pl1-x632.google.com with SMTP id c7so1666906pls.4
        for <linux-mediatek@lists.infradead.org>; Fri, 02 Dec 2022 14:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ALZWGLHwa13YfXZGkxW0FB63ANWeHG5fPT+X9QnIXNE=;
        b=X3/Ygkl9QthpO86CXg54X6whNZrFQqYUC0a1gJ7z1caR4J8jEDl6DfVlTLaBNivhcY
         NiphJrlOXZlUsJ+SpV9Zi/OaCqZQmF+w8BKtnwGuplrgBPudjQNAGaFRELzlURBACYjN
         fvskVx3RWz/t+JrUbcEZFBXzzW/hbUS1lG/vc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ALZWGLHwa13YfXZGkxW0FB63ANWeHG5fPT+X9QnIXNE=;
        b=4sSbmyJllxqH2NZXDahxo4noqZ34/H/exRzWGAWdH90tqmH4VfdMWKGjEYxaF70Ged
         9GyiYGGLoepbdRvzCTNsruMnXjiuhYDi5QWqT+0VQgbDxT+MVXCfT9wHYVH+TnfVPBV7
         u4IqRwW+QeoP6IcLd0guJSBjKUHgCVrO2o2azZhFvC4/r9JlcTNKlomcjnAZ9/oc/LF6
         KrV15cYb7kl1E+L5DO1LXnc3mY/lJDxZ+E8SWVyUCFcmyOcuJ/aOnhXI/u4djyinknoA
         9ey+/iTDdkIhISJrl7ezuK/NgODVaxm7ynp6Ha5GtO9nh/shNcx2SUwZGB96VxNCxZLo
         ouug==
X-Gm-Message-State: ANoB5pn1yZTRkaS9dwi2vN0u/6+eX4lon6Ireaf74o4mh7an6CO3Yof0
	jEZiYo9tUSa82DbNH6fH8i6Dng==
X-Google-Smtp-Source: AA0mqf5jLuXI/3izYGoUxy610VM/+FmgD12XJpKjAnMQ9yTLUWnTyNdgZ4kJJE+Exwk0YwLhcYT/sQ==
X-Received: by 2002:a17:90b:3608:b0:219:6b1b:63d8 with SMTP id ml8-20020a17090b360800b002196b1b63d8mr14207707pjb.143.1670020078378;
        Fri, 02 Dec 2022 14:27:58 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id x22-20020a170902821600b00189ac5a2340sm5734186pln.124.2022.12.02.14.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 14:27:57 -0800 (PST)
From: coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date: Fri, 2 Dec 2022 14:27:57 -0800
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
Subject: Coverity: mt7996_mcu_ie_countdown(): Insecure data handling
Message-ID: <202212021427.3A86EE0@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_142801_462583_73288345 
X-CRM114-Status: UNSURE (   7.38  )
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

*** CID 1527797:  Insecure data handling  (TAINTED_SCALAR)
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:415 in mt7996_mcu_ie_countdown()
409     	struct mt76_phy *mphy = &dev->mt76.phy;
410     	struct mt7996_mcu_rxd *rxd = (struct mt7996_mcu_rxd *)skb->data;
411     	const char *data = (char *)&rxd[1], *tail;
412     	struct header *hdr = (struct header *)data;
413     	struct tlv *tlv = (struct tlv *)(data + 4);
414
vvv     CID 1527797:  Insecure data handling  (TAINTED_SCALAR)
vvv     Using tainted variable "hdr->band" as an index into an array "(*dev).mt76.phys".
415     	if (hdr->band && dev->mt76.phys[hdr->band])
416     		mphy = dev->mt76.phys[hdr->band];
417
418     	tail = skb->data + le16_to_cpu(rxd->len);
419     	while (data + sizeof(struct tlv) < tail && le16_to_cpu(tlv->len)) {
420     		switch (le16_to_cpu(tlv->tag)) {

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1527797 ("Insecure data handling")
Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")

Thanks for your attention!

-- 
Coverity-bot

