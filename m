Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 929A5CD1288
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Mar 2024 23:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vHFTjzwMlLxYTV/uWUOWTAxMr5DnJvs9Xihd1iUFzOo=; b=Ts+WTSlHWG2QmKlFm8wieLzuRP
	1C/LWMWNEghTL1hI13JcS/n8Tn3KekfFQyhHtUvioEAJlpqS5eJ+GC4qfe4CAj8IaZfcvVjQhrS5H
	gJsjWqE+nRsd98WMpWFzXspKDSWYE4CyuN4uHqtWHlc8w28ICkY95GCCbHz4oV39ixXpf8hMjDTR/
	rnrtOYU8DsMYrIH46BGoMKLV2NiHyQsf1a4kB7lJCeo81h5iao1EwpWa9aFvU+27jH4Y+tIiTNnLk
	7VLNOCrTKce5Y+B6UxDD3DVx6CjEpuyZgUOlincZJ3Zt9sfh7gj2KLSva/gijp4GogiV0hra2oMjO
	Ru/vMQ/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpzXx-0000000G7hh-0Vse;
	Thu, 28 Mar 2024 23:52:37 +0000
Received: from mail-lf1-f48.google.com ([209.85.167.48])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpzXs-0000000G7gS-2V0L;
	Thu, 28 Mar 2024 23:52:34 +0000
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-513e89d0816so1713824e87.0;
        Thu, 28 Mar 2024 16:52:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711669948; x=1712274748;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vHFTjzwMlLxYTV/uWUOWTAxMr5DnJvs9Xihd1iUFzOo=;
        b=lWzgJll+gZKRo/B0fqMtk/j99IZcfwTDg7t49bzVak2ilarTbN5JtTvwIyXvpf7KpL
         SAoF6j3wXGJFhvprmTuMG/mEw1A8pye4a5muls9Zso5IlKwSjJ7VOS6SXStmMIkHV5b5
         d18TmmBTr4m1pN6hqjFT9aefG1yYsM5X/MrY1EuabyHIyYAfo4sxqSkuItbEWBSBTd8I
         0taebb6NNkyzh4IoHUVifYyB4EmYTf5EqzD2xQDqQJUMbDm9U7FqY0uWlca44xz8WDjs
         7SVAxjONQ4XeIatl6fkP9tsBqrUiNSiNGG1wYjgR3MTCaxWdJdpK6OnrSZPjymXVs4ef
         8X+g==
X-Forwarded-Encrypted: i=1; AJvYcCX1XnUPzfarVfFci2MpiGy14JAexnRUqlH4cQgZYybjMmTi7rnyuohclB/HafA7JPh59cPHGl6D5M625ex7i894jtyYtKgG5VW++iCkJy1jVF0WOyo8jBPS/U3KoUuD47ksSuKcqtaXbFsel53vVwlyZ+tVMkWQl2k=
X-Gm-Message-State: AOJu0YwdkGB4m3xpsAATmObX752MOqw/kGR6jXfngmzw1Fh1fPaq31D/
	DC+fe7eTxQ0fi3Muutzt5SRW2Dmn/7s+mJvhFQ+ea2tCSFWV7JHd
X-Google-Smtp-Source: AGHT+IHea/mcKEQJBsf8M8lvi9cuVZSl0/vHdWVNfuVQJNDNJYOeBBlVBsaa33wxKnH58C+HDbRR6w==
X-Received: by 2002:a19:a408:0:b0:515:ad80:566e with SMTP id q8-20020a19a408000000b00515ad80566emr545396lfc.27.1711669947652;
        Thu, 28 Mar 2024 16:52:27 -0700 (PDT)
Received: from localhost (fwdproxy-lla-004.fbsv.net. [2a03:2880:30ff:4::face:b00c])
        by smtp.gmail.com with ESMTPSA id qa31-20020a170907869f00b00a466fccbe96sm1263865ejc.122.2024.03.28.16.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 16:52:27 -0700 (PDT)
From: Breno Leitao <leitao@debian.org>
To: aleksander.lobakin@intel.com,
	kuba@kernel.org,
	davem@davemloft.net,
	pabeni@redhat.com,
	edumazet@google.com,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: quic_jjohnson@quicinc.com,
	kvalo@kernel.org,
	leon@kernel.org,
	dennis.dalessandro@cornelisnetworks.com,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support:Keyword:mediatek),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support:Keyword:mediatek)
Subject: [PATCH net-next v2 0/5] allocate dummy device dynamically
Date: Thu, 28 Mar 2024 16:52:00 -0700
Message-ID: <20240328235214.4079063-1-leitao@debian.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_165232_665409_D6725F14 
X-CRM114-Status: UNSURE (   9.78  )
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

struct net_device shouldn't be embedded into any structure, instead,
the owner should use the private space to embed their state into
net_device.

But, in some cases the net_device is embedded inside the private
structure, which blocks the usage of zero-length arrays inside
net_device.

Create a helper to allocate a dummy device at dynamically runtime, and
move the Ethernet devices to use it, instead of embedding the dummy
device inside the private structure.

This fixes all the network cases except for wireless drivers.

PS: Due to lack of hardware, unfortunately all these patches are
compiled tested only.

---
Changelog:

v1:
	* https://lore.kernel.org/all/20240327200809.512867-1-leitao@debian.org/

v2:
	* Patch 1: Use a pre-defined name ("dummy#") for the dummy
	  net_devices.
	* Patch 2-5: Added users for the new helper.

Breno Leitao (5):
  net: create a dummy net_device allocator
  net: marvell: prestera: allocate dummy net_device dynamically
  net: mediatek: mtk_eth_sock: allocate dummy net_device dynamically
  net: ipa: allocate dummy net_device dynamically
  net: ibm/emac: allocate dummy net_device dynamically

 drivers/net/ethernet/ibm/emac/mal.c           | 13 +++--
 drivers/net/ethernet/ibm/emac/mal.h           |  2 +-
 .../ethernet/marvell/prestera/prestera_rxtx.c | 15 ++++--
 drivers/net/ethernet/mediatek/mtk_eth_soc.c   | 17 ++++--
 drivers/net/ethernet/mediatek/mtk_eth_soc.h   |  2 +-
 drivers/net/ipa/gsi.c                         | 12 +++--
 drivers/net/ipa/gsi.h                         |  2 +-
 include/linux/netdevice.h                     |  3 ++
 net/core/dev.c                                | 54 ++++++++++++-------
 9 files changed, 85 insertions(+), 35 deletions(-)

-- 
2.43.0


