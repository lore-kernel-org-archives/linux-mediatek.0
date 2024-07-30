Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA813C3DA70
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jul 2024 18:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2Fp9sY+KsYLEoL++6nfL7qEAWDNCH4f1pH2g10lY6LQ=; b=1BQjX2aRzHfJ1pDU8LGTB62/xo
	sNDaSJJzmC8YUSGG0jaec4W6y7natwfTf+qdMNIe9ETaNiHkemQJiTzc1GNjNpgGSnAR6NEYcHAXi
	uloxLpGz+dfNANLXrlRptPKNzMcvs8HG3MYKpcorYUA7TtqyhomnY4qTXNzymFm46wvOjecEzbIXU
	TX/fJzTjnZFgk8bY5Dn1PY/MtdaiKKBA2WPZ8C+ItOAX3goNIBD8lYCnq+T8EgRwlgaax7N5rU4pO
	GSkdEc/V6/f4asNvVCM86gvDtLjFJvr+6xucPXYI5q2/J4CxkBCelJ4wU3JzkK2j4QTDiPgUm+T9G
	QYm/06GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYrgP-0000000G9Oq-1ydG;
	Tue, 30 Jul 2024 18:34:49 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYrfn-0000000G9HN-0XDi;
	Tue, 30 Jul 2024 18:34:22 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-70b703eda27so3007157b3a.3;
        Tue, 30 Jul 2024 11:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722364450; x=1722969250; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2Fp9sY+KsYLEoL++6nfL7qEAWDNCH4f1pH2g10lY6LQ=;
        b=l+QisNlqpOnylBFwsfuxLCRn1WM4/4B76g4Z1vcojyje8dloYmh8TthTj5zxlKJkm/
         p8w0+L0jFymfgltDD4AAW658fsSWWe0hj6bXobkdyx+mndjYgMQfJOQvG0vdN3jLi6wX
         HTmkaSuxBwAegh9W2FOLpr14I1bTYDFc6Fu4GqEohER+CwLD3t4uoSQVc1OMzkRRzfEG
         YolNVrwF3rOY9WP5pCKSRmRcmv4EdWKvFqrp7uC5VPpaCQgnm/CE8PvQzO8003xbS2O1
         puJJseo91P8IrP1igCwxOWuN+RH8IoxEj+riIb6QfWqc5qP1z1uKIkr528egwkKgmrWF
         dQiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722364450; x=1722969250;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Fp9sY+KsYLEoL++6nfL7qEAWDNCH4f1pH2g10lY6LQ=;
        b=PngGDFP0k77CxSbCA7TE2u8XRfOV4xy4AmvtxKyyCliT2yChjQpev5LC8E9KwUBlLh
         86bqexvGTe0GT+38LPftFmhiDo4V+EiR058dkprfFaPCnZ3bQ+v1pGpfEY5+PTX69XPk
         znmmfsd2CLj+e0+wqErOlRXoAJAeGMwmA7W95TFo6fVl2iTNW8qF4mUDYoD9n5+RrcFx
         glRTf5Hdz5FheR75A8tc4nKezdwUhCvZ3Whk+hsoiYrKGQsGzNVe7V01HCqi6Sc4/YBR
         kVs5b/FlFcGc8pvecQ9YmuoUuJldkgOvTJ1v6909+R/PlOjHyiV1eZewutdEZ+iER0lc
         Ms/g==
X-Forwarded-Encrypted: i=1; AJvYcCV09AX5Q5DDyIcOeskGXVEYwLsrqorka4Xzo+jXadF1UoPJxZiGtv48DiUbbws3Bk5hFgn7sO9SEUBMA1Nrqg2EX0LoQU78STuHI5TQy3Qu0KxQDXoNSPdcS3Iuq8i62ywr+cT5Vwmgf8FrX5Cfvtt7CKTCQHCrOM8=
X-Gm-Message-State: AOJu0YyNnaUmqdLf5fILex/NuVsj5Qg3EHJt3hC1gZPoVH39lr/ycdVm
	kbytmAFyyS1mZosrFWhlS6OaTO0yhWbblPKJycfxdBh+TP7BWdzfgCSwpw==
X-Google-Smtp-Source: AGHT+IEwvW3IZW0hcDRfGFY4bnSHj92tWdAy2P6O4KTjmH4xJdoIfxE1/aHVwTk9k0ym5kG1irSowA==
X-Received: by 2002:a05:6a00:b45:b0:70d:26f3:e5cb with SMTP id d2e1a72fcca58-70ece9fae78mr12592731b3a.3.1722364449528;
        Tue, 30 Jul 2024 11:34:09 -0700 (PDT)
Received: from apais-devbox.. ([2001:569:766d:6500:f2df:af9:e1f6:390e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7a9f817f5a2sm7837763a12.24.2024.07.30.11.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 11:34:08 -0700 (PDT)
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
	netdev@vger.kernel.org,
	Allen Pais <allen.lkml@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [net-next v3 00/15] ethernet: Convert from tasklet to BH workqueue
Date: Tue, 30 Jul 2024 11:33:48 -0700
Message-Id: <20240730183403.4176544-1-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_113411_191828_896089EE 
X-CRM114-Status: GOOD (  13.87  )
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
1722389b0d86 (Merge tag 'net-6.11-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net)

[v3]:
  - Include Reviewed-by signature
  - hinic: can show work_pending() as a partial replacement for the tasklet state.
  - mvpp2: retain and re-word comment.
  - fix rxempty_bh_work() which will emit 'RX Queue Full!'
     message, so the change should be visibile to the user.


[v2]:
https://lore.kernel.org/all/20240621183947.4105278-1-allen.lkml@gmail.com/

[v1]:
First version converting all the drivers can be found at:
https://lore.kernel.org/all/20240507190111.16710-2-apais@linux.microsoft.com/


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

 drivers/net/ethernet/alteon/acenic.c          | 26 +++---
 drivers/net/ethernet/alteon/acenic.h          |  8 +-
 drivers/net/ethernet/amd/xgbe/xgbe-drv.c      | 30 +++----
 drivers/net/ethernet/amd/xgbe/xgbe-i2c.c      | 16 ++--
 drivers/net/ethernet/amd/xgbe/xgbe-mdio.c     | 16 ++--
 drivers/net/ethernet/amd/xgbe/xgbe-pci.c      |  4 +-
 drivers/net/ethernet/amd/xgbe/xgbe.h          | 10 +--
 drivers/net/ethernet/broadcom/cnic.c          | 19 ++---
 drivers/net/ethernet/broadcom/cnic.h          |  2 +-
 drivers/net/ethernet/cadence/macb.h           |  3 +-
 drivers/net/ethernet/cadence/macb_main.c      | 10 +--
 .../net/ethernet/cavium/liquidio/lio_core.c   |  4 +-
 .../net/ethernet/cavium/liquidio/lio_main.c   | 24 +++---
 .../ethernet/cavium/liquidio/lio_vf_main.c    | 10 +--
 .../ethernet/cavium/liquidio/octeon_droq.c    |  4 +-
 .../ethernet/cavium/liquidio/octeon_main.h    |  4 +-
 .../net/ethernet/cavium/octeon/octeon_mgmt.c  | 13 +--
 drivers/net/ethernet/cavium/thunder/nic.h     |  5 +-
 .../net/ethernet/cavium/thunder/nicvf_main.c  | 24 +++---
 .../ethernet/cavium/thunder/nicvf_queues.c    |  4 +-
 .../ethernet/cavium/thunder/nicvf_queues.h    |  2 +-
 drivers/net/ethernet/chelsio/cxgb/sge.c       | 19 ++---
 drivers/net/ethernet/chelsio/cxgb4/cxgb4.h    |  9 ++-
 .../net/ethernet/chelsio/cxgb4/cxgb4_main.c   |  2 +-
 .../ethernet/chelsio/cxgb4/cxgb4_tc_mqprio.c  |  4 +-
 .../net/ethernet/chelsio/cxgb4/cxgb4_uld.c    |  2 +-
 drivers/net/ethernet/chelsio/cxgb4/sge.c      | 40 +++++-----
 drivers/net/ethernet/chelsio/cxgb4vf/sge.c    |  6 +-
 drivers/net/ethernet/dlink/sundance.c         | 41 +++++-----
 .../net/ethernet/huawei/hinic/hinic_hw_cmdq.c |  2 +-
 .../net/ethernet/huawei/hinic/hinic_hw_eqs.c  | 18 ++---
 .../net/ethernet/huawei/hinic/hinic_hw_eqs.h  |  2 +-
 drivers/net/ethernet/ibm/ehea/ehea.h          |  3 +-
 drivers/net/ethernet/ibm/ehea/ehea_main.c     | 14 ++--
 drivers/net/ethernet/ibm/ibmvnic.c            | 24 +++---
 drivers/net/ethernet/ibm/ibmvnic.h            |  2 +-
 drivers/net/ethernet/jme.c                    | 80 ++++++++++---------
 drivers/net/ethernet/jme.h                    |  9 ++-
 .../net/ethernet/marvell/mvpp2/mvpp2_main.c   |  9 ++-
 drivers/net/ethernet/marvell/skge.c           | 12 +--
 drivers/net/ethernet/marvell/skge.h           |  3 +-
 drivers/net/ethernet/mediatek/mtk_wed_wo.c    | 12 +--
 drivers/net/ethernet/mediatek/mtk_wed_wo.h    |  3 +-
 43 files changed, 288 insertions(+), 266 deletions(-)

-- 
2.34.1


