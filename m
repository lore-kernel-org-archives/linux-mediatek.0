Return-Path: <SRS0=UyV0=DN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B7CAC46466
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2020 04:27:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD5A020757
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2020 04:27:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oHLBPnJO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="lLIAFKgQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD5A020757
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yABLfU5YkzOKRr7CL4YEdCkVolBgisY/VmAwLWz5cMs=; b=oHLBPnJO/LV4dhzbnY2QryBmg
	oVbtIWbSxupDOo7xW4WkmOXAKzIuGUbi+t+1FuY2gca9QyY13YkqbKVjJ2YgwzsJMG8FtRx0rHrvW
	mBBJn+oJCJwQoTZoIK1jeOT0Fwcg9eI5yarYEaGfEke46uwe9xvai82rN2mxIeslYan9dgxbmlnZO
	FuNZf2f2UU+c6HOrjfD+tcyr4eLAyfGxa8EzVHugvmargcZvYJpOUFPxT0QS7XB8mp+ThkHNd3ud1
	tIfnNgBtB3POMEv3kuBRQ7H48+QzE+PJpqY5t5VQQN4rAbWoFo78oE2mdWWWzhXahRGQKnmZRo/7u
	IrL77l2wQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPeZE-0006B3-18; Tue, 06 Oct 2020 04:27:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPeZ9-00068g-PX; Tue, 06 Oct 2020 04:27:10 +0000
X-UUID: f261b20da234401abf064a51942de642-20201005
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=F3q8g07MfBf3wWRXqT3A3dyLSwe2uEIEqVCHGrlInMs=; 
 b=lLIAFKgQoo+6HnXLuqjM2qCjIhqw/mFDZy4/NirCjHBqs3ztP7kf9yhaxnwoNL70+1ep1bfzo+PUviDBUPbkgEB+G5Qty0m0NjfewWJTgUfGn6uNQx2ZFUlkonENCA3Dle4Ich5Ewu7gZM1w/6T5OsYnw79K9SinF15tPrATbyY=;
X-UUID: f261b20da234401abf064a51942de642-20201005
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 119322546; Mon, 05 Oct 2020 20:26:50 -0800
Received: from MTKMBS32N2.mediatek.inc (172.27.4.72) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 5 Oct 2020 21:26:49 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS32N2.mediatek.inc
 (172.27.4.72) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 6 Oct 2020 12:26:46 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 6 Oct 2020 12:26:44 +0800
Message-ID: <1601958405.26323.24.camel@mhfsdcap03>
Subject: Re: [PATCH v3 06/24] dt-bindings: mediatek: Add binding for mt8192
 IOMMU
From: Yong Wu <yong.wu@mediatek.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Date: Tue, 6 Oct 2020 12:26:45 +0800
In-Reply-To: <20201002111014.GE6888@pi3>
References: <20200930070647.10188-1-yong.wu@mediatek.com>
 <20200930070647.10188-7-yong.wu@mediatek.com> <20201002111014.GE6888@pi3>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 1485479E20C5DFD0AF7462D3F5BFACAB78FE123516FD431872321E09329134412000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_002708_507181_3297108D 
X-CRM114-Status: GOOD (  24.38  )
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
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 kernel-team@android.com, Nicolas
 Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Greg Kroah-Hartman <gregkh@google.com>,
 linux-kernel@vger.kernel.org, Evan Green <evgreen@chromium.org>,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, ming-fan.chen@mediatek.com,
 anan.sun@mediatek.com, Will
 Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Krzysztof,

On Fri, 2020-10-02 at 13:10 +0200, Krzysztof Kozlowski wrote:
> On Wed, Sep 30, 2020 at 03:06:29PM +0800, Yong Wu wrote:
> > This patch adds decriptions for mt8192 IOMMU and SMI.
> > 
> > mt8192 also is MTK IOMMU gen2 which uses ARM Short-Descriptor translation
> > table format. The M4U-SMI HW diagram is as below:
> > 
> >                           EMI
> >                            |
> >                           M4U
> >                            |
> >                       ------------
> >                        SMI Common
> >                       ------------
> >                            |
> >   +-------+------+------+----------------------+-------+
> >   |       |      |      |       ......         |       |
> >   |       |      |      |                      |       |
> > larb0   larb1  larb2  larb4     ......      larb19   larb20
> > disp0   disp1   mdp    vdec                   IPE      IPE
> > 
> > All the connections are HW fixed, SW can NOT adjust it.
> > 
> > mt8192 M4U support 0~16GB iova range. we preassign different engines
> > into different iova ranges:
> > 
> > domain-id  module     iova-range                  larbs
> >    0       disp        0 ~ 4G                      larb0/1
> >    1       vcodec      4G ~ 8G                     larb4/5/7
> >    2       cam/mdp     8G ~ 12G             larb2/9/11/13/14/16/17/18/19/20
> >    3       CCU0    0x4000_0000 ~ 0x43ff_ffff     larb13: port 9/10
> >    4       CCU1    0x4400_0000 ~ 0x47ff_ffff     larb14: port 4/5
> > 
> > The iova range for CCU0/1(camera control unit) is HW requirement.
> > 
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > ---
> >  .../bindings/iommu/mediatek,iommu.yaml        |   9 +-
> >  .../mediatek,smi-common.yaml                  |   5 +-
> >  .../memory-controllers/mediatek,smi-larb.yaml |   3 +-
> >  include/dt-bindings/memory/mt8192-larb-port.h | 239 ++++++++++++++++++
> >  4 files changed, 251 insertions(+), 5 deletions(-)
> >  create mode 100644 include/dt-bindings/memory/mt8192-larb-port.h
> 
> I see it depends on previous patches but does it have to be within one
> commit? Is it not bisectable? The memory changes/bindings could go via
> memory tree if this is split.

Thanks for the view.

I can split this into two patchset in next version, one is for iommu and
the other is for smi.

Only the patch [18/24] change both the code(iommu and smi). I don't plan
to split it, and the smi patch[24/24] don't depend on it(won't
conflict).

since 18/24 also touch the smi code, I expect it could get Acked-by from
you or Matthias, then Joerg could take it.

Thanks.

> 
> Best regards,
> Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
