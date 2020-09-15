Return-Path: <SRS0=MDtk=CY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 039E5C433E2
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 05:52:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FD55206C9
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 05:52:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rOPCpu9G";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Sss+KVf6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FD55206C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=E4lDI+i9zzUWO4MbeDoYLZbffugvPPpEhK4d7qTXgdI=; b=rOPCpu9G+HuHran0SJZNIitQ1
	EK9wkyVbfK7bKJgphhYEXAFsCASnNPLZhvqEMThnMbHmU6U33Dqd0H6WWFrvlhVwdQ4u6cSMhRpRW
	CLwIP1LCD2PLcPogw8OycBQK0ux1GpDAD0OK+fwTocld+i6O+yO/I+/pQd/wOFvNPg8ehe7nG3xVQ
	bAhmurLXO9EonvUOaZHKo0bJc9m2XdniCx49BVCX3BVrR2QSgJ3j6GCpepIh4ATSQzL0l00KW7X3h
	y318Qus6L1BnzlV7UQ5mBzKKlE1hjGnkvFPVnTmaT4OUxDp14obPJUQFicVBUius+QoPVkUXpKEgu
	BPQsCv+AQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kI3sp-0003mo-OS; Tue, 15 Sep 2020 05:52:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kI3si-0003kI-S0; Tue, 15 Sep 2020 05:51:58 +0000
X-UUID: 2549e2fc85044cb9adc20f8206703d81-20200914
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=nJ8djf+4aZ5rpE1RVUZAt4X6QQ07QZXLCPjNDV2nP0c=; 
 b=Sss+KVf6oeQrvbfS3lM401Yt4k2GTidP1VXDTJOKEdnGgWXmWfHVKTstSV7euo4yk+Iii6ZQ+b011VO3uMl0TBMut1BdJHstv9YhQeqiwe72KHYUp8wtp9ZfMWVrsMLAisFc+MQmH8Q4qXeoT6a59fl40JIWdKHQAhkuzDO3iTY=;
X-UUID: 2549e2fc85044cb9adc20f8206703d81-20200914
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 64471439; Mon, 14 Sep 2020 21:51:50 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Sep 2020 22:51:47 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 15 Sep 2020 13:51:45 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 15 Sep 2020 13:51:45 +0800
Message-ID: <1600148980.25043.11.camel@mhfsdcap03>
Subject: Re: [PATCH v2 01/23] dt-bindings: iommu: mediatek: Convert IOMMU to
 DT schema
From: Yong Wu <yong.wu@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Tue, 15 Sep 2020 13:49:40 +0800
In-Reply-To: <20200914232204.GA457962@bogus>
References: <20200905080920.13396-1-yong.wu@mediatek.com>
 <20200905080920.13396-2-yong.wu@mediatek.com>
 <20200914232204.GA457962@bogus>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 111B958147B5710F8EC8EE31D6C3E1F8F83B044953526CC951ED6485D3399B752000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_015157_097189_14D0FA1C 
X-CRM114-Status: GOOD (  12.28  )
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
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Evan
 Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, ming-fan.chen@mediatek.com,
 anan.sun@mediatek.com, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-09-14 at 17:22 -0600, Rob Herring wrote:
> On Sat, Sep 05, 2020 at 04:08:58PM +0800, Yong Wu wrote:
> > Convert MediaTek IOMMU to DT schema.
> > 
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---

[...]

> > +properties:
> > +  compatible:
> > +    enum:
> > +      - mediatek,mt2701-m4u #mt2701 generation one HW
> > +      - mediatek,mt2712-m4u #mt2712 generation two HW
> > +      - mediatek,mt6779-m4u #mt6779 generation two HW
> > +      - mediatek,mt7623-m4u, mediatek,mt2701-m4u #mt7623 generation one HW
> 
> This is not right.
> 
> items:
>   - const: mediatek,mt7623-m4u
>   - const: mediatek,mt2701-m4u
> 
> And that has to be under a 'oneOf' with the rest of this.

Thanks for the review. Is this OK?

  compatible:
    oneOf:
      - const: mediatek,mt2701-m4u # mt2701 generation one HW
      - const: mediatek,mt2712-m4u # mt2712 generation two HW
      - const: mediatek,mt6779-m4u # mt6779 generation two HW
      - const: mediatek,mt8173-m4u # mt8173 generation two HW
      - const: mediatek,mt8183-m4u # mt8183 generation two HW
      - const: mediatek,mt8192-m4u # mt8192 generation two HW
            
      - description: mt7623 generation one HW
        items:
          - const: mediatek,mt7623-m4u
          - const: mediatek,mt2701-m4u

> 
> > +      - mediatek,mt8173-m4u #mt8173 generation two HW
> > +      - mediatek,mt8183-m4u #mt8183 generation two HW
> > +
> > +  reg:
> > +    maxItems: 1

[snip]
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
