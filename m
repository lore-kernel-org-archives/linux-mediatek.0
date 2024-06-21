Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D635C27C4F
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jun 2024 17:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dd59nbjK5mxx2t+S2o2mRnCCr+mXTEe9t7Rxfuo2GxU=; b=invBV/vdZZjPiLrZFGmiweLmCB
	eDMdXx/kTV8QEvUaHPoQu17F7LWecfiYI6WZ8tdc80al/OYlBafAaJOtIf4G4Giol3rmugHUMD/W2
	GKcf5wlxK5gLdj37MUSqzv/sZFHeN4iq30K9aJTtv7z57Oa2DZJqZkgPCjLoZ2VLBCNv/izh89ewl
	OyRipmCGrCyBGgYAp3UGuuXqFiKxBHzoSg67Ufaj8sptVkMX906ickRxBUgg6J7r2riZ37V8r0589
	CalPZFngufb2Hyvm/niIUywsrnz+zx4NUG9yp8yG2Q1dboXEiz+65eaEUpgMYLB1P6LaL8kzt/eiS
	plZJbYxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKiO9-0000000A8nw-1dYu;
	Fri, 21 Jun 2024 17:49:29 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKiO4-0000000A8mh-0glS;
	Fri, 21 Jun 2024 17:49:26 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a6e349c0f2bso280631966b.2;
        Fri, 21 Jun 2024 10:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718992162; x=1719596962; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Dd59nbjK5mxx2t+S2o2mRnCCr+mXTEe9t7Rxfuo2GxU=;
        b=G0hezZ3QTjA8Xg+YccChTjVsf+zRwul4QNIwFt3kBtuqV4//33SByUCznFSEkTyCMj
         WgwrBD43BrLnqcslBgNpqjzvk3O5vZzewL75g4DflTLY4FdnAI849ukwX6ikliqpglMu
         TXSRkFKn2yoUmXYC+EwVRMbSg6K/rOR59eLDY9SXYQEQMZrxuoTw3rkiF68l34CDBRbD
         7VlLm2eLqnHiCzZXVKPs7ws9bqtUREWx+o+MLzJINLKNleqXDpKSj53t3sTkUJurE8wV
         jU8ydlzBk1L+kG0CSaAlu23UNEb9r/AJxirz2jUDY7GV1YiGp+BC+ag/KuSxe0P4l+2e
         ksIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718992162; x=1719596962;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dd59nbjK5mxx2t+S2o2mRnCCr+mXTEe9t7Rxfuo2GxU=;
        b=vRe/X7CMTuXBqaoT4TaxTTT2kedDpmMyQEtGauAHJX/MVZWlfBqRv3fnR8g9EynaQn
         WuP4r7mkiVX4ElF18pwWWRTAN/w6BMknt6wDSEtSZglWAZ+bulpMYvcezraZqDSYM9vx
         uaYvGt9eO5UDGYoIzCwGxVELAn58IQXXmntnHN0X36bDju6ibr00d2FpADsul0HYI5nR
         U/V6yWc2F2u+kgunkrO82KL1GAa1GSOjFMkp/Aq3NQivfwbp9Le4FpJ52e9qwKgQXZFQ
         SxKUsKXF+ltEH4jWacfv8vyvQEQn+7uINTJvbAuogYGGtzMXB7GbX5ujmPsSyyCQEAKq
         hnSw==
X-Forwarded-Encrypted: i=1; AJvYcCXaiWgvWfrxnHRbQGbXQwR2I9UM0f7d/aT66a5pyYFjznevtZvTEzb+ayYvQUl+c4WQFdj1N1zVTbiFacTh2GPtnhMH/llhIjKdA6Amiv4InoSF7jdABMisHK+wwzQqdpLUH82PuVqCenVtEQTIIt9lCgMF92Ko+Ww=
X-Gm-Message-State: AOJu0YwGapgFQmbWGdxyBUxsSTm+4WgwnO7XWczleqNViaEOIfYRB4fq
	xV4WMwUxDCP5q7QjBxTO++7x7Sci/XL0u+AldyJ3JDk+oIIlr9eHhVhLHGvWrWCZLqhDmOeAFGA
	WGkFTnYK/0pj+Q6p567/QB1fY0Zc=
X-Google-Smtp-Source: AGHT+IHuxXRp9oMpOcE6TOMJCZu9K/BXWS3ZbVFC9+KQ7nQaPPN+hSsVK1nMG8Wok8Lm7VJZ1yfqKBzvbhRANY/cPkA=
X-Received: by 2002:a17:906:4092:b0:a6f:6d98:d4d4 with SMTP id
 a640c23a62f3a-a6fab60bad6mr524907266b.11.1718992161614; Fri, 21 Jun 2024
 10:49:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240621050525.3720069-1-allen.lkml@gmail.com> <20240621082525.0def003b@hermes.local>
In-Reply-To: <20240621082525.0def003b@hermes.local>
From: Allen <allen.lkml@gmail.com>
Date: Fri, 21 Jun 2024 10:49:09 -0700
Message-ID: <CAOMdWS+Z_vvcrJE9ug3dYe033te-EW7eBdygJ9hbe6R6e37yzQ@mail.gmail.com>
Subject: Re: [PATCH 00/15] ethernet: Convert from tasklet to BH workqueue
To: Stephen Hemminger <stephen@networkplumber.org>
Cc: kuba@kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, jes@trained-monkey.org, 
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com, 
	kda@linux-powerpc.org, cai.huoqing@linux.dev, dougmill@linux.ibm.com, 
	npiggin@gmail.com, christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org, 
	naveen.n.rao@linux.ibm.com, nnac123@linux.ibm.com, tlfalcon@linux.ibm.com, 
	cooldavid@cooldavid.org, marcin.s.wojtas@gmail.com, mlindner@marvell.com, 
	nbd@nbd.name, sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, 
	lorenzo@kernel.org, borisp@nvidia.com, bryan.whitehead@microchip.com, 
	UNGLinuxDriver@microchip.com, louis.peens@corigine.com, 
	richardcochran@gmail.com, linux-rdma@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-acenic@sunsite.dk, 
	linux-net-drivers@amd.com, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_104924_231314_D0D020EF 
X-CRM114-Status: GOOD (  17.48  )
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

>
> > The only generic interface to execute asynchronously in the BH context is
> > tasklet; however, it's marked deprecated and has some design flaws. To
> > replace tasklets, BH workqueue support was recently added. A BH workqueue
> > behaves similarly to regular workqueues except that the queued work items
> > are executed in the BH context.
> >
> > This patch converts a few drivers in drivers/ethernet/* from tasklet
> > to BH workqueue. The next set will be sent out after the next -rc is
> > out.
> >
> > This series is based on
> > commit a6ec08beec9e ("Merge git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net")
> >
> > First version converting all the drivers can be found at:
> > https://lore.kernel.org/all/20240507190111.16710
> > -2-apais@linux.microsoft.com/
> >
> >
> > Allen Pais (15):
> >   net: alteon: Convert tasklet API to new bottom half workqueue
> >     mechanism
> >   net: xgbe: Convert tasklet API to new bottom half workqueue mechanism
> >   net: cnic: Convert tasklet API to new bottom half workqueue mechanism
> >   net: macb: Convert tasklet API to new bottom half workqueue mechanism
> >   net: cavium/liquidio: Convert tasklet API to new bottom half workqueue
> >     mechanism
> >   net: octeon: Convert tasklet API to new bottom half workqueue
> >     mechanism
> >   net: thunderx: Convert tasklet API to new bottom half workqueue
> >     mechanism
> >   net: chelsio: Convert tasklet API to new bottom half workqueue
> >     mechanism
> >   net: sundance: Convert tasklet API to new bottom half workqueue
> >     mechanism
> >   net: hinic: Convert tasklet API to new bottom half workqueue mechanism
> >   net: ehea: Convert tasklet API to new bottom half workqueue mechanism
> >   net: ibmvnic: Convert tasklet API to new bottom half workqueue
> >     mechanism
> >   net: jme: Convert tasklet API to new bottom half workqueue mechanism
> >   net: marvell: Convert tasklet API to new bottom half workqueue
> >     mechanism
> >   net: mtk-wed: Convert tasklet API to new bottom half workqueue
> >     mechanism
> >
> >  drivers/net/ethernet/alteon/acenic.c          | 26 +++----
> >  drivers/net/ethernet/alteon/acenic.h          |  8 +--
> >  drivers/net/ethernet/amd/xgbe/xgbe-drv.c      | 30 ++++----
> >  drivers/net/ethernet/amd/xgbe/xgbe-i2c.c      | 16 ++---
> >  drivers/net/ethernet/amd/xgbe/xgbe-mdio.c     | 16 ++---
> >  drivers/net/ethernet/amd/xgbe/xgbe-pci.c      |  4 +-
> >  drivers/net/ethernet/amd/xgbe/xgbe.h          | 10 +--
> >  drivers/net/ethernet/broadcom/cnic.c          | 19 ++---
> >  drivers/net/ethernet/broadcom/cnic.h          |  2 +-
> >  drivers/net/ethernet/cadence/macb.h           |  3 +-
> >  drivers/net/ethernet/cadence/macb_main.c      | 10 +--
> >  .../net/ethernet/cavium/liquidio/lio_core.c   |  4 +-
> >  .../net/ethernet/cavium/liquidio/lio_main.c   | 24 +++----
> >  .../ethernet/cavium/liquidio/lio_vf_main.c    | 10 +--
> >  .../ethernet/cavium/liquidio/octeon_droq.c    |  4 +-
> >  .../ethernet/cavium/liquidio/octeon_main.h    |  4 +-
> >  .../net/ethernet/cavium/octeon/octeon_mgmt.c  | 13 ++--
> >  drivers/net/ethernet/cavium/thunder/nic.h     |  5 +-
> >  .../net/ethernet/cavium/thunder/nicvf_main.c  | 24 +++----
> >  .../ethernet/cavium/thunder/nicvf_queues.c    |  4 +-
> >  .../ethernet/cavium/thunder/nicvf_queues.h    |  2 +-
> >  drivers/net/ethernet/chelsio/cxgb/sge.c       | 19 ++---
> >  drivers/net/ethernet/chelsio/cxgb4/cxgb4.h    |  9 +--
> >  .../net/ethernet/chelsio/cxgb4/cxgb4_main.c   |  2 +-
> >  .../ethernet/chelsio/cxgb4/cxgb4_tc_mqprio.c  |  4 +-
> >  .../net/ethernet/chelsio/cxgb4/cxgb4_uld.c    |  2 +-
> >  drivers/net/ethernet/chelsio/cxgb4/sge.c      | 40 +++++------
> >  drivers/net/ethernet/chelsio/cxgb4vf/sge.c    |  6 +-
> >  drivers/net/ethernet/dlink/sundance.c         | 41 +++++------
> >  .../net/ethernet/huawei/hinic/hinic_hw_cmdq.c |  2 +-
> >  .../net/ethernet/huawei/hinic/hinic_hw_eqs.c  | 17 +++--
> >  .../net/ethernet/huawei/hinic/hinic_hw_eqs.h  |  2 +-
> >  drivers/net/ethernet/ibm/ehea/ehea.h          |  3 +-
> >  drivers/net/ethernet/ibm/ehea/ehea_main.c     | 14 ++--
> >  drivers/net/ethernet/ibm/ibmvnic.c            | 24 +++----
> >  drivers/net/ethernet/ibm/ibmvnic.h            |  2 +-
> >  drivers/net/ethernet/jme.c                    | 72 +++++++++----------
> >  drivers/net/ethernet/jme.h                    |  8 +--
> >  .../net/ethernet/marvell/mvpp2/mvpp2_main.c   |  4 +-
> >  drivers/net/ethernet/marvell/skge.c           | 12 ++--
> >  drivers/net/ethernet/marvell/skge.h           |  3 +-
> >  drivers/net/ethernet/mediatek/mtk_wed_wo.c    | 12 ++--
> >  drivers/net/ethernet/mediatek/mtk_wed_wo.h    |  3 +-
> >  43 files changed, 273 insertions(+), 266 deletions(-)
> >
>
> This should also go to netdev@vger.kernel.org

My Bad, I thought I had it marked. Thanks for pointing it out.

       - Allen

