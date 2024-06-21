Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B30E8C27C4F
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jun 2024 05:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3/GH/FDXuyfNhUERuFE3PVy696MmJwbOJjjtZC6JyQ0=; b=MBBx148U0RGzWXMBMBjjutlIqV
	jwfVETvMkN58CgVqs78HXs/WHGTffZXSh8hXHIDEq4/7aW14MwsGVxJqfr1fbEH+IMtjVLR8aWXH2
	CRxPkdZNlCfmNkdLIolSgja9Su/Cvq6yNQFq8+Nq33kfiVwadj13jCKjjsQGELkPmTcZEOjjEs5it
	XrYxNe2flxNNMQPWIDsFnr1a/9pxkDKLIE+bQ7lmjaz2hC3HbtR/sBIMApOPFR5G6OeUMpP9DE/5N
	TVGam360nRYi168W54nZ6OXpErnmqMDCU+638qmCKovjqqpXDdgRjA3ctRQ0oAlUo/xsNR7kICx0R
	cs2W/Wog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKWT4-00000007iJi-0ef6;
	Fri, 21 Jun 2024 05:05:46 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKWSz-00000007iIp-2C3J;
	Fri, 21 Jun 2024 05:05:43 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-5bad217c51aso877184eaf.1;
        Thu, 20 Jun 2024 22:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718946339; x=1719551139; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3/GH/FDXuyfNhUERuFE3PVy696MmJwbOJjjtZC6JyQ0=;
        b=D7VXZncLEnKsKt0WClPOcKrgJwK+8ImgAZWYuYafTO/SjlAJxvbOBBeR5nAaChmfBu
         RrLW63jRZPiq1tSCpYR4CnRG+wdpkiI02QrwXjNw2HBM9DvMu64cgP50g9M2c0EfKe1h
         wMQXJZsFYugv92Oyd8/cS3A+JT1XQ9vdTAtn46ZOQYhUrp74DvSetXZrCsO4F8cXCAiU
         0qvF4LYBr4GmMVpif2NTKaXxJ41w0pbw1BtLXMKSt7+twb5Ros1L5y7FOAAb/k3pVYoa
         NfIjcUYwBLzSh2bIBRZG7HFHSAQ/ODLA9xlrKGBKf7OMCd22fsaS6IaKxy2lyzpRFU/k
         z46Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718946339; x=1719551139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3/GH/FDXuyfNhUERuFE3PVy696MmJwbOJjjtZC6JyQ0=;
        b=FqOqEgIpVUbLFTqPPW0zGumrtZP2z/TZebmQjH+K1DYOMkWqjf18kMpCa/fCkBrPUi
         /VOt+MDj4vKpyCyWGXKIoqqQoJFg8tcS2D/Uo/+q8Wioo6/5Lela4/w432G/VCK4uYI9
         JoyUXUYRwwTKG8jjKP331O8OKTHULHxL4gX9H4C54Un0KTlxEPPt2KnneEGJ5tgOyiHb
         F62F5ymKuncjbOld6miRqNOCpfKm9c/0Obx9DWLBbzQvh7TnYn5i2vG5I9Oyr+YhXF7F
         umGkkTR8xsoUVnqADoJvjB8ECErj2KnZwa8ym1eAdndNSubrlZReXXbu7qHfDUz9I7Ro
         Bn9w==
X-Forwarded-Encrypted: i=1; AJvYcCWmkNCQBWXrw8PUHFbnRvdR6A/7bVLn/1LHFXWXWZ/yLBeA98gLPG44Cm7NCp7wXLKEWywZmqIhVfDlcsWY0v9/4jahhSgUtehgKxmBwKlQqFESK4R+4BhOSNPrD9Ue5A+nRYnYe5fojhmv5nGQgEoDJdDHLQmgGzg=
X-Gm-Message-State: AOJu0YxnfkIZvgh8ZX4jrWVWHt4gAZgzToppuelBasAnNrgzxcJgcjrE
	HceQrLs+66KFDZJe4fkLEutRtnW5LZVq72B0LopmEqcaQz0+EqDg
X-Google-Smtp-Source: AGHT+IGMY6E0I5Lt8Z85le6hJOlyVtMszZFqEfk0DT9XTrMxx1GhYOasQGgVO71VoHPbCv7kOB5J6g==
X-Received: by 2002:a05:6358:3127:b0:19f:2c7e:a226 with SMTP id e5c5f4694b2df-1a1fd3d9559mr891749455d.5.1718946339443;
        Thu, 20 Jun 2024 22:05:39 -0700 (PDT)
Received: from apais-devbox.. ([2001:569:766d:6500:fb4e:6cf3:3ec6:9292])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-716c950d71asm371308a12.62.2024.06.20.22.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 22:05:39 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: kuba@kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: jes@trained-monkey.org,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	kda@linux-powerpc.org,
	cai.huoqing@linux.dev,
	dougmill@linux.ibm.com,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	aneesh.kumar@kernel.org,
	naveen.n.rao@linux.ibm.com,
	nnac123@linux.ibm.com,
	tlfalcon@linux.ibm.com,
	cooldavid@cooldavid.org,
	marcin.s.wojtas@gmail.com,
	mlindner@marvell.com,
	stephen@networkplumber.org,
	nbd@nbd.name,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	lorenzo@kernel.org,
	borisp@nvidia.com,
	bryan.whitehead@microchip.com,
	UNGLinuxDriver@microchip.com,
	louis.peens@corigine.com,
	richardcochran@gmail.com,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-acenic@sunsite.dk,
	linux-net-drivers@amd.com,
	Allen Pais <allen.lkml@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 00/15] ethernet: Convert from tasklet to BH workqueue
Date: Thu, 20 Jun 2024 22:05:10 -0700
Message-Id: <20240621050525.3720069-1-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_220541_592810_8A4A4075 
X-CRM114-Status: GOOD (  11.87  )
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

The only generic interface to execute asynchronously in the BH context is
tasklet; however, it's marked deprecated and has some design flaws. To
replace tasklets, BH workqueue support was recently added. A BH workqueue
behaves similarly to regular workqueues except that the queued work items
are executed in the BH context.

This patch converts a few drivers in drivers/ethernet/* from tasklet
to BH workqueue. The next set will be sent out after the next -rc is
out.

This series is based on 
commit a6ec08beec9e ("Merge git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net")

First version converting all the drivers can be found at:
https://lore.kernel.org/all/20240507190111.16710
-2-apais@linux.microsoft.com/


Allen Pais (15):
  net: alteon: Convert tasklet API to new bottom half workqueue
    mechanism
  net: xgbe: Convert tasklet API to new bottom half workqueue mechanism
  net: cnic: Convert tasklet API to new bottom half workqueue mechanism
  net: macb: Convert tasklet API to new bottom half workqueue mechanism
  net: cavium/liquidio: Convert tasklet API to new bottom half workqueue
    mechanism
  net: octeon: Convert tasklet API to new bottom half workqueue
    mechanism
  net: thunderx: Convert tasklet API to new bottom half workqueue
    mechanism
  net: chelsio: Convert tasklet API to new bottom half workqueue
    mechanism
  net: sundance: Convert tasklet API to new bottom half workqueue
    mechanism
  net: hinic: Convert tasklet API to new bottom half workqueue mechanism
  net: ehea: Convert tasklet API to new bottom half workqueue mechanism
  net: ibmvnic: Convert tasklet API to new bottom half workqueue
    mechanism
  net: jme: Convert tasklet API to new bottom half workqueue mechanism
  net: marvell: Convert tasklet API to new bottom half workqueue
    mechanism
  net: mtk-wed: Convert tasklet API to new bottom half workqueue
    mechanism

 drivers/net/ethernet/alteon/acenic.c          | 26 +++----
 drivers/net/ethernet/alteon/acenic.h          |  8 +--
 drivers/net/ethernet/amd/xgbe/xgbe-drv.c      | 30 ++++----
 drivers/net/ethernet/amd/xgbe/xgbe-i2c.c      | 16 ++---
 drivers/net/ethernet/amd/xgbe/xgbe-mdio.c     | 16 ++---
 drivers/net/ethernet/amd/xgbe/xgbe-pci.c      |  4 +-
 drivers/net/ethernet/amd/xgbe/xgbe.h          | 10 +--
 drivers/net/ethernet/broadcom/cnic.c          | 19 ++---
 drivers/net/ethernet/broadcom/cnic.h          |  2 +-
 drivers/net/ethernet/cadence/macb.h           |  3 +-
 drivers/net/ethernet/cadence/macb_main.c      | 10 +--
 .../net/ethernet/cavium/liquidio/lio_core.c   |  4 +-
 .../net/ethernet/cavium/liquidio/lio_main.c   | 24 +++----
 .../ethernet/cavium/liquidio/lio_vf_main.c    | 10 +--
 .../ethernet/cavium/liquidio/octeon_droq.c    |  4 +-
 .../ethernet/cavium/liquidio/octeon_main.h    |  4 +-
 .../net/ethernet/cavium/octeon/octeon_mgmt.c  | 13 ++--
 drivers/net/ethernet/cavium/thunder/nic.h     |  5 +-
 .../net/ethernet/cavium/thunder/nicvf_main.c  | 24 +++----
 .../ethernet/cavium/thunder/nicvf_queues.c    |  4 +-
 .../ethernet/cavium/thunder/nicvf_queues.h    |  2 +-
 drivers/net/ethernet/chelsio/cxgb/sge.c       | 19 ++---
 drivers/net/ethernet/chelsio/cxgb4/cxgb4.h    |  9 +--
 .../net/ethernet/chelsio/cxgb4/cxgb4_main.c   |  2 +-
 .../ethernet/chelsio/cxgb4/cxgb4_tc_mqprio.c  |  4 +-
 .../net/ethernet/chelsio/cxgb4/cxgb4_uld.c    |  2 +-
 drivers/net/ethernet/chelsio/cxgb4/sge.c      | 40 +++++------
 drivers/net/ethernet/chelsio/cxgb4vf/sge.c    |  6 +-
 drivers/net/ethernet/dlink/sundance.c         | 41 +++++------
 .../net/ethernet/huawei/hinic/hinic_hw_cmdq.c |  2 +-
 .../net/ethernet/huawei/hinic/hinic_hw_eqs.c  | 17 +++--
 .../net/ethernet/huawei/hinic/hinic_hw_eqs.h  |  2 +-
 drivers/net/ethernet/ibm/ehea/ehea.h          |  3 +-
 drivers/net/ethernet/ibm/ehea/ehea_main.c     | 14 ++--
 drivers/net/ethernet/ibm/ibmvnic.c            | 24 +++----
 drivers/net/ethernet/ibm/ibmvnic.h            |  2 +-
 drivers/net/ethernet/jme.c                    | 72 +++++++++----------
 drivers/net/ethernet/jme.h                    |  8 +--
 .../net/ethernet/marvell/mvpp2/mvpp2_main.c   |  4 +-
 drivers/net/ethernet/marvell/skge.c           | 12 ++--
 drivers/net/ethernet/marvell/skge.h           |  3 +-
 drivers/net/ethernet/mediatek/mtk_wed_wo.c    | 12 ++--
 drivers/net/ethernet/mediatek/mtk_wed_wo.h    |  3 +-
 43 files changed, 273 insertions(+), 266 deletions(-)

-- 
2.34.1


