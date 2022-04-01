Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D06C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Apr 2022 13:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gDCLWcWb1aU5M0eNkqueJ3L2acI2EeJ59lj7oU9Bj+o=; b=wAldMB8UUi+CKk
	KYP50oN81T10yKcX6Rect8dMFI0VFIKrRDhf/yWvNWBOkGsoroAr87NbJ9GXHTvgxaU2mLA/mcht3
	5DmMbbYt6w+uEFz9YaWiCeuzuTTDiBekPiQ3IXBQaMqvFExUEaweN5RSlLoAsXt5iLk1sgQ/k6oZk
	SPSdvt7JaEMChJqGaqFxH7jIxiymbxc5syB8gw/bLQQqOv6ic7HF5zFV8tZ+Y9wURUcwq5scSMewO
	eizV/gRmHZcYUIvBSsDVJR1GFSJZi269mIFELqS566GrpQV0EEmCA4LC3f5MmiVW+EuAU1OwyBJWL
	2/tIGqkUgSurXoySr2yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naHOW-005ntO-95; Fri, 01 Apr 2022 13:32:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naHOL-005nr6-UA; Fri, 01 Apr 2022 13:32:43 +0000
X-UUID: 80e69b096cf24d5db61c962048c33f7c-20220401
X-UUID: 80e69b096cf24d5db61c962048c33f7c-20220401
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jia-wei.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1379957114; Fri, 01 Apr 2022 06:32:35 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 1 Apr 2022 06:32:34 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 1 Apr 2022 21:32:32 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 1 Apr 2022 21:32:32 +0800
Message-ID: <14bfabd88ecbe8cc4ec359f8249f180128a6572e.camel@mediatek.com>
Subject: Re: [PATCH 2/4] dt-bindings: cpufreq: mediatek: add mt8186 cpufreq
 dt-bindings
From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "Rafael J . Wysocki"
 <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <fan.chen@mediatek.com>,
 <louis.yu@mediatek.com>, <roger.lu@mediatek.com>,
 <Allen-yy.Lin@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <hsinyi@google.com>,
 Jia-Wei Chang <jia-wei.chang@mediatek.corp-partner.google.com>
Date: Fri, 1 Apr 2022 21:32:32 +0800
In-Reply-To: <18c791ce-059a-87a5-eaf4-057f8e232fe7@kernel.org>
References: <20220307122151.11666-1-jia-wei.chang@mediatek.com>
 <20220307122151.11666-3-jia-wei.chang@mediatek.com>
 <d5c5e3f7-7f50-6c57-f82a-41d5494ea514@canonical.com>
 <c150e9ed7faa4c06f55f7d7623655b65c8575121.camel@mediatek.com>
 <18c791ce-059a-87a5-eaf4-057f8e232fe7@kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_063242_022152_6601739A 
X-CRM114-Status: GOOD (  18.13  )
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

On Thu, 2022-03-24 at 11:35 +0100, Krzysztof Kozlowski wrote:
> On 24/03/2022 10:42, Jia-Wei Chang wrote:
> > On Mon, 2022-03-07 at 19:59 +0100, Krzysztof Kozlowski wrote:
> > > On 07/03/2022 13:21, Tim Chang wrote:
> > > > 1. add cci property.
> > > > 2. add example of MT8186.
> > > 
> > > One logical change at a time. Are these related? Why entirely new
> > > example just for "cci" node? Maybe this should be part of
> > > existing
> > > example?
> > 
> > Yes, the cci property is required in some SoC, e.g. mt8183 and
> > mt8186,
> > because cpu and cci share the same power supplies.
> 
> I asked why this cannot be part of existing example.

I misunderstood that.
I will update the complete example in the next version.

> 
> > I will update the commit message and add an example of mt8186 to
> > present usage of cci.
> 
> You added the example here, didn't you?

Yes, I did add it here.

> 
> Best regards,
> Krzysztof


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
