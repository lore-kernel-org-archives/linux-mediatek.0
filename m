Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EE5CC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 May 2022 05:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o4dHsUDLx96Xd5/xE6X4L1s/OFUJUZEGVD5Oq1WodNE=; b=nVOJ+yCjfgCw+e
	rU5ldhR5g5xtVUDHApcFYucNJq3xj+Wu/whIjolzARPw70ftP4e5N+jBL742IRuoM/IwfeHQ6TBnm
	r/i66mXaNmSlVPfn5wg8GUBFqJRSy5WIgDIyBnO990RLOoeyGsu//+xajnEdCTWv1DZFNNIQ2EKwM
	UKIQsxkFoaVPfeOgHgmdY4v1Z1DDidSPKUKyiJapsVkY76Nuujo13J60kJeB5Kz3OU70hGi5C0nQG
	rv4ZYvIKjtRoNG9GSJMWPPYzY2Xe1s3x2/fgx+PanonN8FE0e9vC3DRoxLO9qxAMv/AiOR+xKnEDp
	1s/Roch8P2Ytvn9sUlaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmqeU-001Spe-Gy; Fri, 06 May 2022 05:37:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmqeI-001Skj-7c; Fri, 06 May 2022 05:37:09 +0000
X-UUID: d0724971c51c42058aa55529dd4b98c4-20220505
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Q2vvrk/L8QL/zFZ2AAjQTRKDS6qkjarHkq6yWitaB+M=; 
 b=lsKpQjJVxfEQjvllH3ClFcDDcHW6HChanz/SmfT8nRgdIY/RCZgsFM0qEhfsvA8JoeEX4vW84ZkkmbQdY5cUyvX2beAbq9NywfRmG5rZQP7igINrwN0WG/dLLddiKB6BVwzU5Y83T+MFuFDjXKBbKPIgZmu2r5I3XE2m2qfmb/o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:0e8b9960-3f99-4c7b-859c-99018e4db423, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:6a1a6916-2e53-443e-b81a-655c13977218,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: d0724971c51c42058aa55529dd4b98c4-20220505
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1143961999; Thu, 05 May 2022 22:36:57 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 5 May 2022 22:36:55 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 6 May 2022 13:36:54 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 6 May 2022 13:36:53 +0800
Message-ID: <59df49f47ecf000ef40e432d82bd96338f4da69a.camel@mediatek.com>
Subject: Re: [PATCH v3] iommu/mediatek: Fix NULL pointer dereference when
 printing dev_name
From: Yong Wu <yong.wu@mediatek.com>
To: Miles Chen <miles.chen@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 "Will Deacon" <will@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>
CC: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <jroedel@suse.de>,
 <iommu@lists.linux-foundation.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Fri, 6 May 2022 13:36:53 +0800
In-Reply-To: <20220505132731.21628-1-miles.chen@mediatek.com>
References: <20220505132731.21628-1-miles.chen@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_223706_330107_71C22001 
X-CRM114-Status: GOOD (  13.97  )
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

On Thu, 2022-05-05 at 21:27 +0800, Miles Chen wrote:
> When larbdev is NULL (in the case I hit, the node is incorrectly set
> iommus = <&iommu NUM>), it will cause device_link_add() fail and
> kernel crashes when we try to print dev_name(larbdev).
> 
> Let's fail the probe if a larbdev is NULL to avoid invalid inputs
> from
> dts.
> 
> It should work for normal correct setting and avoid the crash caused
> by my incorrect setting.
> 
> Error log:
> [   18.189042][  T301] Unable to handle kernel NULL pointer
> dereference at virtual address 0000000000000050
> ...
> [   18.344519][  T301] pstate: a0400005 (NzCv daif +PAN -UAO)
> [   18.345213][  T301] pc : mtk_iommu_probe_device+0xf8/0x118
> [mtk_iommu]
> [   18.346050][  T301] lr : mtk_iommu_probe_device+0xd0/0x118
> [mtk_iommu]
> [   18.346884][  T301] sp : ffffffc00a5635e0
> [   18.347392][  T301] x29: ffffffc00a5635e0 x28: ffffffd44a46c1d8
> [   18.348156][  T301] x27: ffffff80c39a8000 x26: ffffffd44a80cc38
> [   18.348917][  T301] x25: 0000000000000000 x24: ffffffd44a80cc38
> [   18.349677][  T301] x23: ffffffd44e4da4c6 x22: ffffffd44a80cc38
> [   18.350438][  T301] x21: ffffff80cecd1880 x20: 0000000000000000
> [   18.351198][  T301] x19: ffffff80c439f010 x18: ffffffc00a50d0c0
> [   18.351959][  T301] x17: ffffffffffffffff x16: 0000000000000004
> [   18.352719][  T301] x15: 0000000000000004 x14: ffffffd44eb5d420
> [   18.353480][  T301] x13: 0000000000000ad2 x12: 0000000000000003
> [   18.354241][  T301] x11: 00000000fffffad2 x10: c0000000fffffad2
> [   18.355003][  T301] x9 : a0d288d8d7142d00 x8 : a0d288d8d7142d00
> [   18.355763][  T301] x7 : ffffffd44c2bc640 x6 : 0000000000000000
> [   18.356524][  T301] x5 : 0000000000000080 x4 : 0000000000000001
> [   18.357284][  T301] x3 : 0000000000000000 x2 : 0000000000000005
> [   18.358045][  T301] x1 : 0000000000000000 x0 : 0000000000000000
> [   18.360208][  T301] Hardware name: MT6873 (DT)
> [   18.360771][  T301] Call trace:
> [   18.361168][  T301]  dump_backtrace+0xf8/0x1f0
> [   18.361737][  T301]  dump_stack_lvl+0xa8/0x11c
> [   18.362305][  T301]  dump_stack+0x1c/0x2c
> [   18.362816][  T301]  mrdump_common_die+0x184/0x40c [mrdump]
> [   18.363575][  T301]  ipanic_die+0x24/0x38 [mrdump]
> [   18.364230][  T301]  atomic_notifier_call_chain+0x128/0x2b8
> [   18.364937][  T301]  die+0x16c/0x568
> [   18.365394][  T301]  __do_kernel_fault+0x1e8/0x214
> [   18.365402][  T301]  do_page_fault+0xb8/0x678
> [   18.366934][  T301]  do_translation_fault+0x48/0x64
> [   18.368645][  T301]  do_mem_abort+0x68/0x148
> [   18.368652][  T301]  el1_abort+0x40/0x64
> [   18.368660][  T301]  el1h_64_sync_handler+0x54/0x88
> [   18.368668][  T301]  el1h_64_sync+0x68/0x6c
> [   18.368673][  T301]  mtk_iommu_probe_device+0xf8/0x118 [mtk_iommu]
> ...
> 
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Yong Wu <yong.wu@mediatek.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: 635319a4a744 ("media: iommu/mediatek: Add device_link between
> the consumer and the larb devices")
> Signed-off-by: Miles Chen <miles.chen@mediatek.com>

Reviewed-by: Yong Wu <yong.wu@mediatek.com>

And this doesn't conflict with the MT8195 patchset.

Thanks.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
