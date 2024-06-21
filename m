Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D09C27C4F
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jun 2024 15:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JYlNHWP11x6QNKTXlbmUex1BD8XP8iF4g+JbpwM+d2E=; b=xX226vIl0XgJjTb3MC96mI98Vl
	67efNFR7k/kF+aOARuX2aqqHcRC+jf5v1yx/KeqEkH47ofHAY1Ymyyq4CFpVgY7lcSXJWHT9ts8d6
	OSXahV/NZtm/RVrmfpbLfvrPS+ovDwrIszcHyobMouLwEDf8SXa/+rhUgU8xUkjkgbg+PLEz2S2om
	KmNZ86PNjCVrhBkS6w155WpHG9+AzdNVTB4nL2F8pguQbaguaui5l99/jKOIkw4eeWIwR+LXcAEtf
	s7lQNP5bE9JvjSzioOL47KJjzujR/bS6RA0wAJu2a6rAY1Tesj6jFGK+L/mvo+lS5KmHpnPqhaU8y
	c/PEla/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKg8r-00000009jsK-0zxY;
	Fri, 21 Jun 2024 15:25:33 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKg8n-00000009jps-1dBD
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Jun 2024 15:25:31 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1f9c2847618so18838745ad.1
        for <linux-mediatek@lists.infradead.org>; Fri, 21 Jun 2024 08:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20230601.gappssmtp.com; s=20230601; t=1718983528; x=1719588328; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JYlNHWP11x6QNKTXlbmUex1BD8XP8iF4g+JbpwM+d2E=;
        b=BEA3kX3iMHyJkh8MUAA5f4KxafD0vvIP+ycy2u+KJdQ7YL5XHlIRWakjbXGeeJq09/
         vvQV2rdUa+6sZWV3axvifC4mNIYTKrpiQshvvOAzjRJuNUf0S8t3j0zdRjOQrahOZisL
         AIYt7q8YOompjxJt8RNSN0FUt0pUxnLZAPq2a1s4KDa1JcXgVx9NEBTjKmU67ws5rE92
         FVpgtu6+PGMTXo5oe2Qty5286733hay42Ax138rvVTRUEyf0huXDYUR/hEEapwJUetUa
         +mDHNv9/R1lUPHbq9+4FHeXFsVpY+peV7EZ2B0o8NJJHQxRvKzApeYQI0XMnYhZThPFg
         Ushg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718983528; x=1719588328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JYlNHWP11x6QNKTXlbmUex1BD8XP8iF4g+JbpwM+d2E=;
        b=bKyUufAkb3d3XpHCxqD1uODwZUvD6k7HTTYIh7FdiSzoK1b1/mDQnVRqtXaULxGd/a
         9xPp+5BOZ8MI9r3fJhyBl3gdcAHUlTT1CB63REGUi4By8Xe/KnvL1YVDSsEv/NwQC6KM
         oB40Hm9KWcGRYI6YwplBzlg9TZNNuJBGigD5UeCcsZrK/vWbmXBaPH7/QnsRbhqAlYYK
         2B5dPTig1CHMxIP/xtw5LF/gl6FpFKRcTihV0vnXg+RD2l8D7+uWbLS+PfpjgN6310K7
         lhr29gGj88BC4DBEeXVgQ5NqGVW6IXGqpxklrnDtkGAR0PlD+/5Eb+RStO2898oSK65x
         W/2w==
X-Forwarded-Encrypted: i=1; AJvYcCU2y0si/9ug/YxPZrsEJvXd7a7SX6ybjVnERUu/vXLW5jky0DhXMqFq1d+dXhTC6fFsMOZpPcBOciyxV22NJGHVZFnx71lz5Z6YQ2lUJK2YP+A7
X-Gm-Message-State: AOJu0Yx1p8wW2+p0/g+GBk4iNuZ0gkHLiOaGQmQjYjsaInZoqvLABOiI
	ZxFZ2VRfw7BIvnqhGKPILx3c6yNqcaHooEivPf0wme+leECNTlYIChxDGDVYC50=
X-Google-Smtp-Source: AGHT+IEC/+dU28AaumAmbjdJPumvT/Gnd4v11fgIaQOE3Q5JRhFPBwxb0aR0CmD13L3R1bpzIYHY8w==
X-Received: by 2002:a17:903:244d:b0:1f9:f021:f2ea with SMTP id d9443c01a7336-1f9f021f686mr22307065ad.63.1718983528046;
        Fri, 21 Jun 2024 08:25:28 -0700 (PDT)
Received: from hermes.local (204-195-96-226.wavecable.com. [204.195.96.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb8c8960sm15313065ad.227.2024.06.21.08.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 08:25:27 -0700 (PDT)
Date: Fri, 21 Jun 2024 08:25:25 -0700
From: Stephen Hemminger <stephen@networkplumber.org>
To: Allen Pais <allen.lkml@gmail.com>
Cc: kuba@kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 jes@trained-monkey.org, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, kda@linux-powerpc.org, cai.huoqing@linux.dev,
 dougmill@linux.ibm.com, npiggin@gmail.com, christophe.leroy@csgroup.eu,
 aneesh.kumar@kernel.org, naveen.n.rao@linux.ibm.com, nnac123@linux.ibm.com,
 tlfalcon@linux.ibm.com, cooldavid@cooldavid.org, marcin.s.wojtas@gmail.com,
 mlindner@marvell.com, nbd@nbd.name, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, lorenzo@kernel.org, borisp@nvidia.com,
 bryan.whitehead@microchip.com, UNGLinuxDriver@microchip.com,
 louis.peens@corigine.com, richardcochran@gmail.com,
 linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-acenic@sunsite.dk, linux-net-drivers@amd.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 00/15] ethernet: Convert from tasklet to BH workqueue
Message-ID: <20240621082525.0def003b@hermes.local>
In-Reply-To: <20240621050525.3720069-1-allen.lkml@gmail.com>
References: <20240621050525.3720069-1-allen.lkml@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_082529_473174_5C0FBCC4 
X-CRM114-Status: GOOD (  15.08  )
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

On Thu, 20 Jun 2024 22:05:10 -0700
Allen Pais <allen.lkml@gmail.com> wrote:

> The only generic interface to execute asynchronously in the BH context is
> tasklet; however, it's marked deprecated and has some design flaws. To
> replace tasklets, BH workqueue support was recently added. A BH workqueue
> behaves similarly to regular workqueues except that the queued work items
> are executed in the BH context.
> 
> This patch converts a few drivers in drivers/ethernet/* from tasklet
> to BH workqueue. The next set will be sent out after the next -rc is
> out.
> 
> This series is based on 
> commit a6ec08beec9e ("Merge git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net")
> 
> First version converting all the drivers can be found at:
> https://lore.kernel.org/all/20240507190111.16710
> -2-apais@linux.microsoft.com/
> 
> 
> Allen Pais (15):
>   net: alteon: Convert tasklet API to new bottom half workqueue
>     mechanism
>   net: xgbe: Convert tasklet API to new bottom half workqueue mechanism
>   net: cnic: Convert tasklet API to new bottom half workqueue mechanism
>   net: macb: Convert tasklet API to new bottom half workqueue mechanism
>   net: cavium/liquidio: Convert tasklet API to new bottom half workqueue
>     mechanism
>   net: octeon: Convert tasklet API to new bottom half workqueue
>     mechanism
>   net: thunderx: Convert tasklet API to new bottom half workqueue
>     mechanism
>   net: chelsio: Convert tasklet API to new bottom half workqueue
>     mechanism
>   net: sundance: Convert tasklet API to new bottom half workqueue
>     mechanism
>   net: hinic: Convert tasklet API to new bottom half workqueue mechanism
>   net: ehea: Convert tasklet API to new bottom half workqueue mechanism
>   net: ibmvnic: Convert tasklet API to new bottom half workqueue
>     mechanism
>   net: jme: Convert tasklet API to new bottom half workqueue mechanism
>   net: marvell: Convert tasklet API to new bottom half workqueue
>     mechanism
>   net: mtk-wed: Convert tasklet API to new bottom half workqueue
>     mechanism
> 
>  drivers/net/ethernet/alteon/acenic.c          | 26 +++----
>  drivers/net/ethernet/alteon/acenic.h          |  8 +--
>  drivers/net/ethernet/amd/xgbe/xgbe-drv.c      | 30 ++++----
>  drivers/net/ethernet/amd/xgbe/xgbe-i2c.c      | 16 ++---
>  drivers/net/ethernet/amd/xgbe/xgbe-mdio.c     | 16 ++---
>  drivers/net/ethernet/amd/xgbe/xgbe-pci.c      |  4 +-
>  drivers/net/ethernet/amd/xgbe/xgbe.h          | 10 +--
>  drivers/net/ethernet/broadcom/cnic.c          | 19 ++---
>  drivers/net/ethernet/broadcom/cnic.h          |  2 +-
>  drivers/net/ethernet/cadence/macb.h           |  3 +-
>  drivers/net/ethernet/cadence/macb_main.c      | 10 +--
>  .../net/ethernet/cavium/liquidio/lio_core.c   |  4 +-
>  .../net/ethernet/cavium/liquidio/lio_main.c   | 24 +++----
>  .../ethernet/cavium/liquidio/lio_vf_main.c    | 10 +--
>  .../ethernet/cavium/liquidio/octeon_droq.c    |  4 +-
>  .../ethernet/cavium/liquidio/octeon_main.h    |  4 +-
>  .../net/ethernet/cavium/octeon/octeon_mgmt.c  | 13 ++--
>  drivers/net/ethernet/cavium/thunder/nic.h     |  5 +-
>  .../net/ethernet/cavium/thunder/nicvf_main.c  | 24 +++----
>  .../ethernet/cavium/thunder/nicvf_queues.c    |  4 +-
>  .../ethernet/cavium/thunder/nicvf_queues.h    |  2 +-
>  drivers/net/ethernet/chelsio/cxgb/sge.c       | 19 ++---
>  drivers/net/ethernet/chelsio/cxgb4/cxgb4.h    |  9 +--
>  .../net/ethernet/chelsio/cxgb4/cxgb4_main.c   |  2 +-
>  .../ethernet/chelsio/cxgb4/cxgb4_tc_mqprio.c  |  4 +-
>  .../net/ethernet/chelsio/cxgb4/cxgb4_uld.c    |  2 +-
>  drivers/net/ethernet/chelsio/cxgb4/sge.c      | 40 +++++------
>  drivers/net/ethernet/chelsio/cxgb4vf/sge.c    |  6 +-
>  drivers/net/ethernet/dlink/sundance.c         | 41 +++++------
>  .../net/ethernet/huawei/hinic/hinic_hw_cmdq.c |  2 +-
>  .../net/ethernet/huawei/hinic/hinic_hw_eqs.c  | 17 +++--
>  .../net/ethernet/huawei/hinic/hinic_hw_eqs.h  |  2 +-
>  drivers/net/ethernet/ibm/ehea/ehea.h          |  3 +-
>  drivers/net/ethernet/ibm/ehea/ehea_main.c     | 14 ++--
>  drivers/net/ethernet/ibm/ibmvnic.c            | 24 +++----
>  drivers/net/ethernet/ibm/ibmvnic.h            |  2 +-
>  drivers/net/ethernet/jme.c                    | 72 +++++++++----------
>  drivers/net/ethernet/jme.h                    |  8 +--
>  .../net/ethernet/marvell/mvpp2/mvpp2_main.c   |  4 +-
>  drivers/net/ethernet/marvell/skge.c           | 12 ++--
>  drivers/net/ethernet/marvell/skge.h           |  3 +-
>  drivers/net/ethernet/mediatek/mtk_wed_wo.c    | 12 ++--
>  drivers/net/ethernet/mediatek/mtk_wed_wo.h    |  3 +-
>  43 files changed, 273 insertions(+), 266 deletions(-)
> 

This should also go to netdev@vger.kernel.org

