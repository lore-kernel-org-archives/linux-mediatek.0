Return-Path: <SRS0=puoQ=LF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACE43C48BD1
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Jun 2021 10:46:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B298610A5
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Jun 2021 10:46:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B298610A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=8bytes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pj6w5+eWsyvEyo7yTtwKmrs3URHqvkUjTxf0NEA26B8=; b=JKzbOMGg3jdv61
	tdKFcK+SV0IujF766gqrOGMHgDQlgDyK9PBsKToNMq7P29uJDFNS3uPjbrd194BMRLl8mQ33nPvdP
	FHF3rP3OyI0o1RCVDWF7wD9w6DeKIHzQzNiDUBppqRH5gwgdZ/c21yKI1N3oV0GnBzR1zy4FHk1zp
	hqslS35znmIPrdKAOFl1Z3PuVpLcJPCxGllGou2SPO+cfcvPra4GgJpYEaDtmU/TxtyR97xGW8FDH
	Kadq2W0zEkLgyqygdVWSQf3yAflzzdcIFKNWpSJwhhI62QPj1jEC+X6DpuyHxcvuikxPUgTVOSgJH
	WC9iEZ8zdRTbaH1CtH8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lregS-004nIM-CW; Fri, 11 Jun 2021 10:46:40 +0000
Received: from 8bytes.org ([81.169.241.247] helo=theia.8bytes.org)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lregE-004nFQ-9s; Fri, 11 Jun 2021 10:46:27 +0000
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 376EC2FB; Fri, 11 Jun 2021 12:46:21 +0200 (CEST)
Date: Fri, 11 Jun 2021 12:46:19 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Yong Wu <yong.wu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Evan Green <evgreen@chromium.org>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>, Will Deacon <will.deacon@arm.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 srv_heupstream@mediatek.com, Devicetree List <devicetree@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 iommu@lists.linux-foundation.org, youlin.pei@mediatek.com,
 Nicolas Boichat <drinkcat@chromium.org>,
 Matthias Kaehlcke <mka@chromium.org>, anan.sun@mediatek.com,
 chao.hao@mediatek.com, ming-fan.chen@mediatek.com,
 yi.kuo@mediatek.com, eizan@chromium.org,
 Alexandre Courbot <acourbot@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Irui Wang <irui.wang@mediatek.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH v5 13/16] media: mtk-vcodec: Get rid of
 mtk_smi_larb_get/put
Message-ID: <YMM++ySKo38OUMXQ@8bytes.org>
References: <20210410091128.31823-1-yong.wu@mediatek.com>
 <20210410091128.31823-14-yong.wu@mediatek.com>
 <CAJMQK-iTrQRDDm_=LNqSpvXFd431LYRxXMasJHUpN+K8rJ=Qpg@mail.gmail.com>
 <1620822547.2983.8.camel@mhfsdcap03>
 <c1422242-8d8c-9592-c22d-288c503cd8b1@gmail.com>
 <1623326528.23717.20.camel@mhfsdcap03>
 <e7269c80-5437-6ab9-c1db-df0b94eb97d8@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e7269c80-5437-6ab9-c1db-df0b94eb97d8@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_034626_515833_30E5C3B5 
X-CRM114-Status: GOOD (  10.61  )
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

On Fri, Jun 11, 2021 at 12:07:24PM +0200, Matthias Brugger wrote:
> That's a good question. I think the media tree would be a good
> candidate, as it has the biggest bunch of patches. But that would mean
> that Joerg is fine that.  The DTS part could still go through my tree.

IOMMU changes are only a minor part of this, so it should not go through
the IOMMU tree. When Matthias has reviewed the IOMMU changes, feel free
to add my

	Acked-by: Joerg Roedel <jroedel@suse.de>

to them.

Regards,

	Joerg

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
