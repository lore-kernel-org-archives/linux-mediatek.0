Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A370C43458
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2026 18:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DPs2lHQRfpK+TsWOFRy9KnqkkNN7TxB0PRSoapXl1VE=; b=r4EeocgDtyKQ2g5AP+TgAmzFB1
	3AAxRmE0ZvQtMHpZ/rDv0a5sQoWhoVpvjFB7G1VxqOUFPKIYWkdu5ynTCw4DonFy46BYLJ88XusiL
	LAQCqSdswYlbhYn19XFoIGg0Y7oa/ItgV6wfna5vx8Odrp8MI4uPoHn3G39GTQtkMhKbbVxrQ8TgN
	+RZXYR9xlSCiTwiwBZtaCqtLIGXpRm3Vhc0eH3ml1kAQrQQ9GCb6EdMa4gi+O95mljwWuCo8Ckdxg
	oserHqE68Y/uIxbw2xvTqOWSFGqiO1Zf5mjk/lHJRCs4Da35vHoB6IXw36eMP01GgzCYnky7onJTG
	C2ml46kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjL1v-0000000AAjT-2rNh;
	Mon, 13 Jul 2026 18:05:23 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjL1t-0000000AAir-1b8n
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Jul 2026 18:05:22 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-47d6c634f45so1838738f8f.3
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Jul 2026 11:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783965918; x=1784570718; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DPs2lHQRfpK+TsWOFRy9KnqkkNN7TxB0PRSoapXl1VE=;
        b=SDRUwP7gKrj6SXSeVzOusqIyKO0Y9BJFPCUWbGZDayLddxWYfvrLCd6fIeWdwxfUq4
         yaAck9kndV5LKtkwxQ8i5HAKjqOr3vhKrPsmt/yWh8DMaWfcwsGl4YQlOlbuST6QWp/W
         yQ4f/XUsSi/4jnpSEg/J740aqXY4nCx2R0U7fSrwhODBticQ+BLlMCIepu8ep3tl1hfh
         8WDlwv2qFTQ3yqsNQNAXe4BsjIqrIHhmhSuaU8x97xkjz7EoZ7gt2ONKfKqX6HRvUxXt
         b3SN3TLLSbydabQHePePVcGJd+GqQ8ZSmv0I/8NNsKvpdT+Oti6VQuqjPFweeng2nH63
         yueQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783965918; x=1784570718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DPs2lHQRfpK+TsWOFRy9KnqkkNN7TxB0PRSoapXl1VE=;
        b=e2Brl3uIPSWLnXQbR/nvb/EBLN16Tt/mDtuGQM2Tl/ycBc5H2H2ig6J/cKd/m5xJRl
         wK9q3/OsvLmtKHtGfpVKZ5cQoRlAdn7sFz6xYF4sTZNa1WL5IOq/tHaPUamBjHgI69cy
         Cap5j0WXEQjJHUs0UZcPW52HygaubPVOsf6u5wuIG/0mtdaTS8JvUOVDVAudB6tWXLLu
         690zPdZVuUyuOyAKC9YUaHmB8Mo0+ocXTpKTEQR0dBUxFHK4sBzMAPXZn6HNxBYAJ4h8
         FVC6LKvfIyn57vGQcI0zbIJCV14MsT9OSZyc6moxztWdsLR0YNRaqTD8LrSTyIUZ/bE3
         dZ1A==
X-Forwarded-Encrypted: i=1; AHgh+RogFFN5GGQTlg4K6qXwn+mKCeIaf0dFnLl8xsREyAgZ9KLRDEK2X4ZE1pLOOoFQYj/Njb1mZ+x9Y8cVVG8x0Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx//6at4GGMnKXqAhZyMgF6hASW5m/PIKl2gJ4ji/p4qmEmShbr
	e3h4MzaVwp5HCK+VkD27HcvXrsJxJGCU2Hnws8J20E/QqX5wo2/WmQEYvtFNRvnZmmY=
X-Gm-Gg: AfdE7cmdZXo4tHKyUYkr/gy16M+wi4zKN9BBU5RsuqNAOhkCas973SiR0BC4wiJRsSf
	PpQ8V1sJ+33EbH8zL6TKXuee+qsBwCZR5apOI9HV2vMCvDpAzkwUCqcwL7EYo4vruQGxpSjHO5V
	Im3Px7Eb2B41JG6z9NAkOdIROXTA92hubAxuzRM0xkzPWqcwwIdeaJv0s9FA5e4NLQg/Qmli7Yv
	J0zLgIqYRLwJwYUC+XVSH1OaQlDGEbMYdwuvIDFwYnOgUjqWsYpvn48rbY5YYoF+hulwaEkInDf
	lQX5nb68JS97h3XkIoNAXj3czoIab0KhXrPC74GCJCwoKrB31H3QBd/hc7BcsitQAR0trptk/wC
	url09OzVx6Fi5H+E7djN2tNxVx1idnv8XATlTu/gWCydDO4V8Mi8qMASaH5c74Gt2b95EWdD1ij
	71bLVvZzLjH6kH6rRpVF8MVB+8FcCKfvpw7Q==
X-Received: by 2002:a5d:64c4:0:b0:462:e086:35f with SMTP id ffacd0b85a97d-47f2dc88af5mr12536623f8f.21.1783965918210;
        Mon, 13 Jul 2026 11:05:18 -0700 (PDT)
Received: from archlinux.tailbe3ea7.ts.net ([46.1.111.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4635aa34sm1230690f8f.15.2026.07.13.11.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 11:05:17 -0700 (PDT)
From: Ismail Tarim <ismailtarim7@gmail.com>
To: stable@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [stable backport request] wifi: mt76: mt7921/mt7925: fix NULL dereference in CSA beacon
Date: Mon, 13 Jul 2026 21:01:37 +0300
Message-ID: <20260713180433.52394-1-ismailtarim7@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_110521_438482_51F0BC5F 
X-CRM114-Status: UNSURE (   7.91  )
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

Hi,

Please consider backporting the following mainline commit to the stable
trees:

  commit 351dd7d2c80d ("wifi: mt76: mt7921/mt7925: fix NULL dereference in CSA beacon")

The commit carries a Fixes: tag but was not marked Cc: stable, so it has
not been picked up for the stable trees automatically. The tip of
linux-7.1.y still lacks it.

Why it should be applied:

It fixes a NULL pointer dereference in mt7921_channel_switch_rx_beacon()
(and the identical mt7925 path). When an AP sends a Channel Switch
Announcement (CSA) beacon, cfg80211 queues a wiphy work item that later
calls the driver's channel_switch_rx_beacon(); if the station
disconnects or the channel context is torn down in between,
dev->new_ctx has already been cleared to NULL and is then dereferenced
unconditionally. This is triggered by ordinary AP behaviour (channel
switch / DFS), so it is easy to hit in the field, and it hangs the
machine: the crash happens in a workqueue worker that exits with IRQs
disabled, wedging the cfg80211 workqueue and progressively locking up
userspace until a hard reboot. It affects the very common MT7921 /
MT7922 / MT7902 chipsets.

Reproduced on linux-7.1.y (Arch Linux 7.1.3-arch1-1), MT7902
[14c3:7902] driven by mt7921e:

  BUG: kernel NULL pointer dereference, address: 0000000000000000
  RIP: 0010:mt7921_channel_switch_rx_beacon+0x18/0xa0 [mt7921_common]
  Call Trace:
   ieee80211_sta_process_chanswitch+0x682/0xc30 [mac80211]
   ieee80211_rx_mgmt_beacon+0x7ec/0x19c0 [mac80211]
   ieee80211_iface_work+0x4c4/0x630 [mac80211]
   cfg80211_wiphy_work+0x13f/0x1e0 [cfg80211]
   process_one_work+0x19f/0x390
   worker_thread+0x1b1/0x310
   kthread+0xe4/0x120
  note: kworker/u64:15 exited with irqs disabled

The offending code was introduced by
  8aa2f59260eb ("wifi: mt76: mt7921: introduce CSA support")

Please apply 351dd7d2c80d to linux-7.1.y and any other supported stable
tree that contains 8aa2f59260eb.

Thanks,
Ismail Tarim

