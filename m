Return-Path: <SRS0=d5Ie=MG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBDADC11F66
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 11:18:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AF70613B2
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 11:18:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7AF70613B2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0j9wHYs/rJT5hCkTkwWZ+hjyzEKZ1ivEDQk6+cm9ZJk=; b=01Qkuqhh0zj/3o
	ROxxNfayywNSFQtrDTboY88ncla2C6L1Mvo11R0I8JKOE8g//QeBiyIloj49jkzH3gL/UsS1y3+zr
	qzj6XIKHRyL82jLTSdINbXLKfItRq9bJCjl/eIpjk1nqjz43zw4VGUVdz2DdrdHyjLiLaEPcl7dS5
	nHGyUPjgEjS3BYKpUpA3rUd3eGAydMkzR+N5AGcY9iz0JQgHUrPWHCHcep7odr/yTRS28vdqPydPY
	73tEYfpVIMUyj9WlFT6uy2iiusKR6a8iuJT3lVo+PPX/vwPImC/TjgmRcir9nE/HFiwTXzk7QWlxU
	t615cmV0bf6QAP3yj2uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3cuV-00DJeW-TQ; Wed, 14 Jul 2021 11:18:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3cuH-00DJZv-PE; Wed, 14 Jul 2021 11:18:27 +0000
X-UUID: c75b70fcec234698950155d274c792f3-20210714
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=jGb3Fw2ghMBhqRR5HNnLI1fFNCmMhlcMRemz5Ei6vYI=; 
 b=OuuarGVzautq6MZIe98pmaV/rxCXwQlCCyD6jxF8b64mFD1MAm/HLO4cSa1BpTbhkqD0HRaR07Jf4dsdtvXjaTb60mpCPd4N7MgmSmvDq6sR5ya0tNY9Nx7FdTMjvrmHC8VryQ4LMgqNR8H/qvm1GLYNwCCNBq09L0DeWaxboVY=;
X-UUID: c75b70fcec234698950155d274c792f3-20210714
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 705771284; Wed, 14 Jul 2021 04:18:23 -0700
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Jul 2021 04:18:22 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 14 Jul 2021 19:18:17 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 14 Jul 2021 19:18:16 +0800
Message-ID: <1626261496.14352.16.camel@mhfsdcap03>
Subject: Re: Aw: [PATCH v6 00/11] Clean up "mediatek,larb"
From: Yong Wu <yong.wu@mediatek.com>
To: Frank Wunderlich <frank-w@public-files.de>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, David Airlie <airlied@linux.ie>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, Evan Green <evgreen@chromium.org>,
 Robin Murphy <robin.murphy@arm.com>, Tomasz Figa <tfiga@chromium.org>, "Will
 Deacon" <will.deacon@arm.com>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <iommu@lists.linux-foundation.org>, <youlin.pei@mediatek.com>, "Nicolas
 Boichat" <drinkcat@chromium.org>, Matthias Kaehlcke <mka@chromium.org>,
 <anan.sun@mediatek.com>, <ming-fan.chen@mediatek.com>, <yi.kuo@mediatek.com>, 
 <acourbot@chromium.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Xia Jiang <xia.jiang@mediatek.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Dafna Hirschfeld
 <dafna.hirschfeld@collabora.com>, Hsin-Yi Wang <hsinyi@chromium.org>, "Eizan
 Miyamoto" <eizan@chromium.org>, <anthony.huang@mediatek.com>
Date: Wed, 14 Jul 2021 19:18:16 +0800
In-Reply-To: <trinity-7d9ebdc9-4849-4d93-bfb5-429dcb4ee449-1626253158870@3c-app-gmx-bs01>
References: <20210714025626.5528-1-yong.wu@mediatek.com>
 <trinity-7d9ebdc9-4849-4d93-bfb5-429dcb4ee449-1626253158870@3c-app-gmx-bs01>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 194C4630574F716762D04534E2ED131E926154033AFA8FFE4228D830E0E139F02000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_041825_850940_D7EB0DB1 
X-CRM114-Status: GOOD (  14.08  )
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

On Wed, 2021-07-14 at 10:59 +0200, Frank Wunderlich wrote:
> Hi,
> 
> sorry this (or the 2 depency-series) cause a NULL Pointer deref in iommu_group_remove_device on mt7623/bpi-r2

Hi Frank,

Thanks for your report. mt7623 use mtk_iommu_v1.c.

I will try to reproduce this locally.

> 
> i wonder why on bootup a cleanup is run, but have no hint about this.
> 
> since "dts: mtk-mdp: remove mediatek, vpu property from primary MDP device" all is good, i guess problem comes up while removing larb with DT
> 
> this is backtrace
> 
> [    6.274465] PC is at iommu_group_remove_device+0x28/0x148
> [    6.279877] LR is at iommu_release_device+0x4c/0x70
> 
> [    6.674347] Backtrace:
> [    6.676797] [<c0c9c37c>] (iommu_group_remove_device) from [<c06bf028>] (iomm)
> [    6.686221]  r7:00000000 r6:c06bf04c r5:c0d7a1ac r4:c21fc010
> [    6.691883] [<c06befdc>] (iommu_release_device) from [<c06bf064>] (remove_io)
> [    6.700689]  r5:00000000 r4:00000000
> [    6.704265] [<c06bf04c>] (remove_iommu_group) from [<c0733434>] (bus_for_eac)
> [    6.712725] [<c07333ac>] (bus_for_each_dev) from [<c06bf658>] (bus_set_iommu)
> [    6.720753]  r6:c331f440 r5:c1406f58 r4:ffffffea
> [    6.725370] [<c06bf5a0>] (bus_set_iommu) from [<c06c1e88>] (mtk_iommu_probe+)
> [    6.733484]  r7:c32db0b8 r6:c21f9c00 r5:c331f1c0 r4:00000000
> [    6.739145] [<c06c1bfc>] (mtk_iommu_probe) from [<c0738c14>] (platform_probe)
> [    6.747176]  r10:c21f9c10 r9:c2496f54 r8:c14623b8 r7:c14623b8 r6:c1405b90 r50
> [    6.755012]  r4:00000000
> [    6.757544] [<c0738ba8>] (platform_probe) from [<c0735968>] (really_probe.pa)
> [    6.766006]  r7:c14623b8 r6:c1405b90 r5:00000000 r4:c21f9c10
> [    6.771667] [<c07358a0>] (really_probe.part.0) from [<c0735cec>] (really_pro)
> [    6.779866]  r7:c21f9c10 r6:c2549e74 r5:c1405b90 r4:c21f9c10
> [    6.785527] [<c0735ca4>] (really_probe) from [<c0735de0>] (__driver_probe_de)
> [    6.793984]  r5:c1405b90 r4:c21f9c10
> [    6.797560] [<c0735d30>] (__driver_probe_device) from [<c0735fa0>] (driver_p)
> [    6.806543]  r9:c2496f54 r8:00000008 r7:c21f9c10 r6:c2549e74 r5:c14c6ec8 r4:4
> [    6.814291] [<c0735f5c>] (driver_probe_device) from [<c0736410>] (__device_a)
> [    6.823448]  r9:c2496f54 r8:00000000 r7:c21f9c10 r6:c2549e74 r5:c1405b90 r4:1
> [    6.831196] [<c073635c>] (__device_attach_driver) from [<c0733540>] (bus_for)
> [    6.840007]  r7:c14623b8 r6:c073635c r5:c2549e74 r4:00000000
> [    6.845669] [<c07334ac>] (bus_for_each_drv) from [<c07357e8>] (__device_atta)
> [    6.854044]  r6:00000001 r5:c21f9c54 r4:c21f9c10
> [    6.858662] [<c07356e4>] (__device_attach) from [<c073662c>] (device_initial)
> [    6.867207]  r6:c21f9c10 r5:c1406f58 r4:c1406ca0
> [    6.871825] [<c0736610>] (device_initial_probe) from [<c07346dc>] (bus_probe)
> [    6.880454] [<c0734648>] (bus_probe_device) from [<c0734cc8>] (deferred_prob)
> 
> 
> bisect shows this commit as breaking:
> 
> Author: Yong Wu <yong.wu@mediatek.com>
> Date:   Wed Jul 14 10:56:17 2021 +0800
> 
>     iommu/mediatek: Add probe_defer for smi-larb
> 
>     Prepare for adding device_link.
> 
> regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
