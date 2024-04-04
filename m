Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55964CD1292
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Apr 2024 13:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mM0VRkY4R/s+2RZMIGBjXivRb+LhyFR0UNjBp7WG/2w=; b=TSnT2W1fMOMBIcHT0eV7gsMj+X
	/aszQuoNDjN7OAVsi5PYRTaj5ZcwIBLchGBaQtd4ZsOgtdWL/zEmQyRK0MmxI60xD1iWdl70eG3gc
	uXbpKQHo7/7uTh0TpzxGrv3aX/AxToOihR92CdVdIo2FGW4FBkR7kPucooJ6LMU+9UvArfKy/UuNE
	9Gxy95KHloQR+qTEIQIushr8k378w7lgEO2eqKLqkJXyy/4OAwY/AtBNufe57h/HLbegwaO5sZMBj
	bRWbg452aBC8kR0J7HutCg7j6XPRw0vvVcIPqk3eUxSOvhQR+JfWFoZX3jqbySPr7db+EO/ruvZY8
	Dlk5ajGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsMlh-00000002kqJ-1E3a;
	Thu, 04 Apr 2024 13:04:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsLbP-00000002RKI-0dZE;
	Thu, 04 Apr 2024 11:49:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=mM0VRkY4R/s+2RZMIGBjXivRb+LhyFR0UNjBp7WG/2w=; b=OhknEfQi/ERLt0ooc6j2p+3qr1
	EUkMNoV7sqGQb8nUlKujQRm/9uk4NRU88hWFasL66ERE8yDcAIjzkwnOrjxCY/Au22bNkKxOiJ7R1
	aH45YGRgwaEu47Jo/MfM6t/sogXAncXG/Di25/hI7Lr7GFfgh4xvDw0ps9i8f+AIWou7zF8g2Mnh4
	I2HhG7jFGcj0VKAFqr1fAWzlWqJOjsmlQtFQL1c1tmJzrKJcYk/jKwwW4GEMLVZM4qHMTJBF8h629
	QiskUJyVlyWBZ5wFV4jCTmRqoPxnE4QxMxfCQWnVyJbghf+MYvidkhizgmnw4AfbHka4w6nLSbUAF
	Q4NFSBbA==;
Received: from mail-ej1-f41.google.com ([209.85.218.41])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsLbL-00000005031-0TBC;
	Thu, 04 Apr 2024 11:49:53 +0000
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a4e34d138f9so128447666b.2;
        Thu, 04 Apr 2024 04:49:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712231389; x=1712836189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mM0VRkY4R/s+2RZMIGBjXivRb+LhyFR0UNjBp7WG/2w=;
        b=xP08dLp8BzNZRaIgQR2kMHw63MaGUBJyypdDKkIsN337CGN5jO7yj3ifSrwTLa23mQ
         Fzd0k0hGXajIH3HmxAVtRXmF2p15w9c1IAuAzyGxNli7Q4WZNoPXyb1n4I2RgHB6l41l
         J/RPtcbkOIsH5EaxsAu6CaOJrBe06TlyLiatBMYne3p7cGaqZGhIgByyq9Fyheq/l5W/
         eISP5XCx4jGDWN7wGaPOZYaslBSel7O8+n11AgAdycLsm8ynjVGYcYqiDur9EUf7LdHd
         ez1RO89T8Iy5yM67fzGbMxQfzQ/DoBo8IN+LB2EUxxS0OB35M3rqDkTA0y7OT685B1sQ
         ZJuA==
X-Forwarded-Encrypted: i=1; AJvYcCW1WdBVuzrUPkskD2+Gs2uDDz1SKW147OdCFakspTfngYSFWzNBf9Rxw/gEJ1n4TN9paqRv3WivdDExMbfeAjzQMNkzsps11UpWkuJ3D5WnhrBOwo/r6RA/aapO6ftD3matsPGuvlB6zqViJZ4f6rNRKSnlybD0g9Y=
X-Gm-Message-State: AOJu0YzTfsSCTBoB6KvKlQaUNauyp/pbr3TeZqTVdfgvsuA03OnG8w+c
	qRz7NQJC5M3VwfOJOP6G/OE0aCCoptyhbyAalAU+nRKsnh0fa9bT
X-Google-Smtp-Source: AGHT+IFDNnBaWKjKBUScMyD1XxsRGzjVdkpYifMEFEBvLKEwHf4ElIsvpdnvFDl4eaA7HXmhAU+ciQ==
X-Received: by 2002:a17:907:9807:b0:a4e:539d:2183 with SMTP id ji7-20020a170907980700b00a4e539d2183mr1768927ejc.73.1712231388672;
        Thu, 04 Apr 2024 04:49:48 -0700 (PDT)
Received: from localhost (fwdproxy-lla-118.fbsv.net. [2a03:2880:30ff:76::face:b00c])
        by smtp.gmail.com with ESMTPSA id xj7-20020a170906db0700b00a4e379ac57fsm7640946ejb.30.2024.04.04.04.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 04:49:48 -0700 (PDT)
From: Breno Leitao <leitao@debian.org>
To: aleksander.lobakin@intel.com,
	kuba@kernel.org,
	davem@davemloft.net,
	pabeni@redhat.com,
	edumazet@google.com,
	elder@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	nbd@nbd.name,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	lorenzo@kernel.org,
	taras.chornyi@plvision.eu,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: quic_jjohnson@quicinc.com,
	kvalo@kernel.org,
	leon@kernel.org,
	dennis.dalessandro@cornelisnetworks.com,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org
Subject: [PATCH net-next v3 0/5] allocate dummy device dynamically
Date: Thu,  4 Apr 2024 04:48:40 -0700
Message-ID: <20240404114854.2498663-1-leitao@debian.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_124951_410562_2013B2CC 
X-CRM114-Status: GOOD (  10.16  )
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
v3:
	* Use free_netdev() instead of kfree() as suggested by Jakub.
	* Change the free_netdev() place in ipa driver, as suggested by
	  Alex Elder.
	* Set err in the error path in the Marvell driver, as suggested
	  by Simon Horman.

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


