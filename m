Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E13C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Apr 2022 02:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P1YNXScvpTLp9gyMFh9+iAcHFiR45kR1H1msWnl0OiA=; b=1zWmIR5j8JhVMo
	KBusdmwIw8JOjpnEN477ZGdAhk+h3yJ+OaiWJN0bAbaLz4f6SEdM3z1wD9+lJ5SN6vp+RNxwKGKJ2
	TIhBTTvhePd0Jw1sTySFmkGZbgUTHv1v/SsVBb5uYWHD+btmIcPyjJqMJRWwNQ6ONmBEHNT8VBJNz
	5T5yTD7rRKfzpLSXlLPyHhFq3J078RtPcehF38yS3fHXtJWDw3q74nvJNX+Q3pCKw7QuhkXnhf+SS
	+kdyhXG0w+gwoRSdK94DLRitk2cMzmPanRk9JQeIf9VxLDkM1QEjRd3AMsu69U3KuKL2iHz+OOta5
	a7m64+MkNfG/TmB2mo8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njXG6-00H2Ez-TN; Wed, 27 Apr 2022 02:18:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njXFv-00H2Cm-5H; Wed, 27 Apr 2022 02:18:16 +0000
X-UUID: 01cf416a41ea4690aa4333e98440164c-20220426
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:3eaa70b4-add1-487d-b832-ffb2e81ad869, OB:0,
 LO
 B:0,IP:0,URL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:25
X-CID-META: VersionHash:faefae9, CLOUDID:b877d12e-6199-437e-8ab4-9920b4bc5b76,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 01cf416a41ea4690aa4333e98440164c-20220426
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1731564478; Tue, 26 Apr 2022 19:18:06 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Apr 2022 19:13:24 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 27 Apr 2022 10:13:22 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 27 Apr 2022 10:13:21 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <yong.wu@mediatek.com>
CC: <angelogioacchino.delregno@collabora.com>, <hverkuil-cisco@xs4all.nl>,
 <iommu@lists.linux-foundation.org>, <joro@8bytes.org>, <jroedel@suse.de>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <mchehab@kernel.org>, <miles.chen@mediatek.com>, <robin.murphy@arm.com>,
 <will@kernel.org>
Subject: Re: [PATCH v2] iommu/mediatek: fix NULL pointer dereference when
 printing dev_name
Date: Wed, 27 Apr 2022 10:13:21 +0800
Message-ID: <20220427021321.22899-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <4ff4246cd5d567a3fa8124800f5d75be0034621c.camel@mediatek.com>
References: <4ff4246cd5d567a3fa8124800f5d75be0034621c.camel@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_191815_256300_A22B79C1 
X-CRM114-Status: GOOD (  17.62  )
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

Hi Yong,

>On Mon, 2022-04-25 at 11:03 +0100, Robin Murphy wrote:
>> On 2022-04-25 09:24, Miles Chen via iommu wrote:
>> > When larbdev is NULL (in the case I hit, the node is incorrectly
>> > set
>> > iommus = <&iommu NUM>), it will cause device_link_add() fail and
>> 
>> Until the MT8195 infra MMU support lands, is there ever a case where 
>> it's actually valid for larbdev to be NULL? If not, I think it would
>> be 
>> a lot clearer to explicitly fail the probe here, rather than
>> silently 
>> continue and risk fatal errors, hangs, or other weird behaviour if 
>> there's no guarantee that the correct LARB is powered up (plus then
>> the 
>> release callbacks wouldn't need to worry about it either).
>
>Yes. It should return fail for this case. This issue only happens when
>the dts parameters doesn't respect the definition from the binding[1].
>
>Locally Miles tested with a internal definition that have not send
>upstream to get this KE. In this case, I'm not sure if we should
>request the user use the right ID in dts. Anyway I have no objection to
>modifying this, then something like this: (Avoid invalid input from
>dtb)
>
>@@ -790,6 +790,8 @@ static struct iommu_device
>*mtk_iommu_probe_device(struct device *dev)
> 	 * All the ports in each a device should be in the same larbs.
> 	 */
> 	larbid = MTK_M4U_TO_LARB(fwspec->ids[0]);
>+	if (larbid >= MTK_LARB_NR_MAX)
>+		return ERR_PTR(-EINVAL);
> 	for (i = 1; i < fwspec->num_ids; i++) {
> 		larbidx = MTK_M4U_TO_LARB(fwspec->ids[i]);
> 		if (larbid != larbidx) {
>@@ -799,6 +801,8 @@ static struct iommu_device
>*mtk_iommu_probe_device(struct device *dev)
> 		}
> 	}
> 	larbdev = data->larb_imu[larbid].dev;
>+	if (!larbdev)
>+		return ERR_PTR(-EINVAL);
> 	link = device_link_add(dev, larbdev,
> 			       DL_FLAG_PM_RUNTIME | DL_FLAG_STATELESS);
> 	if (!link)

Thanks for guilding me, I will put this in patch v2.

Thanks,
Miles

>
>
>[1] 
>https://elixir.bootlin.com/linux/v5.18-rc1/source/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml#L116


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
