Return-Path: <SRS0=s7tg=JT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64D4FC433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 04:10:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C562A6142B
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 04:10:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C562A6142B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9rxYY3/EIyrR2RmWBSoB62/kmVyfO6giP15Hbw1jPxQ=; b=qllu6Geh7j3zSkElrdtgzmn2t5
	qd6pEMYebYKDGxZPydleLbq8tCP0Jws0rRGzzSeQfI02gjPISsRXRNOgNfHi6LV8RXjhSVhEjUc+p
	aMWM9q7sDSqjiC2PIWTFUkB0AYubIuEjz4sBT7x3JHDCLEYz60CDG1+Fm/upmLBBbwlqt1hKF3XEL
	nujqFLr2HS1I7q+e83iQzJnUDEEkYXuU0JSaHoQZznyfQRMwq1LQKg5xNkveSz2CdMdCnhqo0tsfr
	H9uqDfsHnp1ugZnwFiQv6QbHKFAeI4Wi4rNGr+GqRfK7OpotvM+K+HjB49KJ7IF56RQeHgUPwIqJ6
	MPcTWd7w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZQf8-00FlU1-Aw; Thu, 22 Apr 2021 04:09:58 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZQer-00FlPx-7B; Thu, 22 Apr 2021 04:09:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=U9ndYHHujvr1zav297RhllK1op/Od2oHV/TZTHj5aJs=; b=vmjVKSZLaZGY99YyDwk4Db+pHO
 T+TBkv1bgXwDp1pc8avQqiJhcUfvtCzrDZokZY88UcWKiFr0hGITESxaYWIpZcZhk2hWQJsG7YH9c
 kmI2oBjw7DLMuww2TQy1hM1LmDL5dmsAK/J74SpYuRRdfaOwjbJVNYk8vPJT9TKWuWrAjdZzm/A/0
 OLyVsKq+71k4/2G9l1THTAkgcZZy6lDoIDO2eht8W+bFfbL42qTFfe6u6Y2sc35D5pR/UPQ/AiBdL
 1UmoDBswyoezntJzjzNiONjBUZgJc+JN5LQZvaN8u85IFrH+51R5uVc3JOeYei39uPE94o7Rxnjtx
 hy8XK3Ag==;
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZQeo-00DLcV-9h; Thu, 22 Apr 2021 04:09:39 +0000
Received: by mail-pj1-x102f.google.com with SMTP id
 f6-20020a17090a6546b029015088cf4a1eso240156pjs.2; 
 Wed, 21 Apr 2021 21:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U9ndYHHujvr1zav297RhllK1op/Od2oHV/TZTHj5aJs=;
 b=sl0iLZcInFVAtLnDOFrIXPW2KwmX5CPRzW7Wl29+gSD1dN/KP7OeEsfr7anUJpf7IH
 vtF0SDUkffma2cQ7e5s2QjBXQ4ifU/pbb51BFC4jWaXFMJkFJ8SFDpzSFOrM8m3W+MsP
 j6T7bed+GaTDS0aytX66+omjj6BTQhy0/BY3ls4tnt7OuMzuI0df8TgVpEtaleixw9wA
 h1OV++0OVlBnDSRj+QutLb1f5QbZrIP2ZCbTgPb2bZt3Wp+pk47elXdyEPvGq3R36Lzd
 wQHsI2J/sSgR4V5edR+waJDZnYUinPfbTLA/ZOe4UNohr43LEI8rNzfOzL2aV/lZtSdV
 etrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U9ndYHHujvr1zav297RhllK1op/Od2oHV/TZTHj5aJs=;
 b=BBUcoKRiO1Y9fT2do/UYj9NgtETokBR3wPc9MMgA41wBMNXBk4hvc65/tx7uooV+8F
 jgZtFZcrO8TDQpjGBY0LmLBnGp8m9XXvLRbkG6Iw8kBK/LmsyX73XMIA8OvH2e/FtLec
 R5PhY1Gy9QOOjSU73+d8POYYR5lfbKUoSLGSAE7txUfEtEOVbk3AkOyh/wGfhKfeWky/
 gJNRbePFewaKFzzJ7O+sNGXm0WmLm47sHLOz/tz1McN7VxSuj8caTSSFmaOT3rPbFUTS
 yJLy4ZjZWVoOR40k/qJCFd0/LZlrofnTfUxVawaIpl+DHtmfmc/tbSuP/CWzpcmoCUfq
 MTDA==
X-Gm-Message-State: AOAM531vB9+IEPfHoxPQ7v+UC1zAsW5T55fICBRBAWFD2+izjf0VzRBJ
 MVD5ocEVbc+eTzNwkTZ+VfU=
X-Google-Smtp-Source: ABdhPJzBiSiO1OFTfb8ncPAgubknwm6a4rAa1zMYzUajGilaHKacgpxpKY5LA35Y1+AhtpGLBgKYnw==
X-Received: by 2002:a17:90a:7d02:: with SMTP id
 g2mr7902256pjl.153.1619064577536; 
 Wed, 21 Apr 2021 21:09:37 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
 by smtp.gmail.com with ESMTPSA id i17sm635354pfd.84.2021.04.21.21.09.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 21:09:36 -0700 (PDT)
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: [PATCH net-next 00/14] mtk_eth_soc: fixes and performance improvements
Date: Wed, 21 Apr 2021 21:09:00 -0700
Message-Id: <20210422040914.47788-1-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_210938_359745_6C51BBDB 
X-CRM114-Status: UNSURE (   9.75  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Most of these changes come from OpenWrt where they have been present and
tested for months.

First three patches are bug fixes. The rest are performance
improvements. The last patch is a cleanup to use the iopoll.h macro for
busy-waiting instead of a custom loop.

Source: 770-*.patch at https://git.openwrt.org/?p=openwrt/openwrt.git;a=tree;f=target/linux/generic/pending-5.10;hb=HEAD

Felix Fietkau (12):
  net: ethernet: mtk_eth_soc: fix RX VLAN offload
  net: ethernet: mtk_eth_soc: unmap RX data before calling build_skb
  net: ethernet: mtk_eth_soc: use napi_consume_skb
  net: ethernet: mtk_eth_soc: reduce MDIO bus access latency
  net: ethernet: mtk_eth_soc: remove unnecessary TX queue stops
  net: ethernet: mtk_eth_soc: use larger burst size for QDMA TX
  net: ethernet: mtk_eth_soc: increase DMA ring sizes
  net: ethernet: mtk_eth_soc: implement dynamic interrupt moderation
  net: ethernet: mtk_eth_soc: cache HW pointer of last freed TX
    descriptor
  net: ethernet: mtk_eth_soc: only read the full RX descriptor if DMA is
    done
  net: ethernet: mtk_eth_soc: reduce unnecessary interrupts
  net: ethernet: mtk_eth_soc: set PPE flow hash as skb hash if present

Ilya Lipnitskiy (2):
  net: ethernet: mtk_eth_soc: fix build_skb cleanup
  net: ethernet: mtk_eth_soc: use iopoll.h macro for DMA init

 drivers/net/ethernet/mediatek/Kconfig       |   1 +
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 228 ++++++++++++++------
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  52 ++++-
 3 files changed, 199 insertions(+), 82 deletions(-)

-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
