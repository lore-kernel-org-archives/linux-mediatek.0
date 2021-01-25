Return-Path: <SRS0=y96F=G4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5580EC433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jan 2021 10:11:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD6AB2251D
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jan 2021 10:11:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD6AB2251D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nSLct0BXdLSoAxUD/9UtWPqaAQrmrF1yTwgDgSx+OUU=; b=zyrKqstL05yr5Sm8oxILlDWV2
	Xn9+u7iQoSW1FI+Dr6brzboCxz1XprUr1y0Eazq+O83b36skrg0GHXf7Uv9tj1We/Fw2CIwAuATy9
	NwezdyJ1qTLWqRZmtb34nnAvD/5epi/bM1YKAdwaWdlvUFQUU5ztKaxQ+e4OkHikKQpsxMQXoYno8
	FnmNYWlN4BL8KU7Y5tpNCFeRhYtA11i6uenZNizwaS4zt+YcUQcpCp23JkZ77ihgNudkk0oIWknTm
	kq1X/Jo1U0dKhJV6b37vZq7F4ksq9mHbJSy1QKGqNLDJDWqN4k+uKmudPkteFEZh12ROv/Qm7SLYB
	2pVdfVd6w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3yq5-0005Sm-Df; Mon, 25 Jan 2021 10:11:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3yq1-0005Rs-FA; Mon, 25 Jan 2021 10:11:15 +0000
X-UUID: 7e81d18e5513463b8c62713e1d6d697f-20210125
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=y2RDQNIxeBbr5oP9MQDxQ2RnX+SiaVSuN0aKLK4cDXM=; 
 b=HKy/z3QRR0Wjcufb5w99kxxWx6fSz7r7S8LzPd8xoHDtMxHEj7q6AGwPvLdnPooKz38EeEQsbe0Auyp5hQmtGBHEifBjMG3HUqKdraktAZfyUdGkT57/9IGLrebMC0uoxW5C8SScnb922cyaEXWxg6z9upMJq76+GNpsz/rM33o=;
X-UUID: 7e81d18e5513463b8c62713e1d6d697f-20210125
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1200495664; Mon, 25 Jan 2021 02:11:08 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 25 Jan 2021 02:11:06 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 25 Jan 2021 18:11:00 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 25 Jan 2021 18:11:00 +0800
Message-ID: <1611569460.5302.7.camel@mhfsdcap03>
Subject: Re: [PATCH 3/3] memory: mtk-smi: Switch MTK_SMI to tristate
From: Yong Wu <yong.wu@mediatek.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Date: Mon, 25 Jan 2021 18:11:00 +0800
In-Reply-To: <20210125084450.wurwhi2hbbuueapy@kozik-lap>
References: <20210121062429.26504-1-yong.wu@mediatek.com>
 <20210121062429.26504-4-yong.wu@mediatek.com>
 <20210122213558.qnboqc4obdmipxs4@kozik-lap>
 <1611557384.3184.22.camel@mhfsdcap03>
 <20210125084450.wurwhi2hbbuueapy@kozik-lap>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: C65905790A739B480B6FC175A3CD459FDCB438FD07C4250FE662618E0D5C5FF12000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_051114_250336_B42995B7 
X-CRM114-Status: GOOD (  26.78  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: youlin.pei@mediatek.com, anan.sun@mediatek.com,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 linux-kernel@vger.kernel.org, yi.kuo@mediatek.com, Tomasz
 Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2021-01-25 at 09:44 +0100, Krzysztof Kozlowski wrote:
> On Mon, Jan 25, 2021 at 02:49:44PM +0800, Yong Wu wrote:
> > On Fri, 2021-01-22 at 22:35 +0100, Krzysztof Kozlowski wrote:
> > > On Thu, Jan 21, 2021 at 02:24:29PM +0800, Yong Wu wrote:
> > > > This patch switches MTK_SMI to tristate. Support it could be 'm'.
> > > > 
> > > > Meanwhile, Fix a build issue while MTK_SMI is built as module.
> > > 
> > > s/Fix/fix.
> > > 
> > > What error is being fixed here? How can I reproduce it? Aren't you just
> > > adjusting it to being buildable by module?
> > 
> > Sorry, I didn't copy the fail log here. This is the build log:
> > 
> > In file included from .../drivers/iommu/mtk_iommu.c:34:0:
> > .../drivers/iommu/mtk_iommu.h:84:28: error: array type has incomplete
> > element type 'struct mtk_smi_larb_iommu'
> >   struct mtk_smi_larb_iommu larb_imu[MTK_LARB_NR_MAX];
> > 
> > Our iommu driver will use this structure. but it was contained by
> > "#ifdef CONFIG_MTK_SMI". thus I change it to "#if
> > IS_ENABLED(CONFIG_MTK_SMI)"
> > 
> > If reproducing it, we should change mtk-iommu to module_init[1]. and
> > switch kconfig MTK_IOMMU to tristate, then change the CONFIG_MTK_IOMMU
> > to m. we could get the fail log.
> > 
> > In this case, Should I squash this change into this patch? I though this
> > is a preparing patch and the fail is caused by MTK_SMI. thus I squash
> > that into this patch. or change it as a independent patch and send when
> > I change MTK_IOMMU to tristate?
> 
> If I understand correctly, there is no error before this patch. In such
> case just don't mention the error to fix, because it is simply part of
> making things modular.

Yes. No error before this patch.

Appreciate for your help. I will remove this in the comment message in
the next version.

> 
> Best regards,
> Krzysztof
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
