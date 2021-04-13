Return-Path: <SRS0=dZqu=JK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57694C433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Apr 2021 06:17:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAE38613AE
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Apr 2021 06:17:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CAE38613AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=q9qVH3j2TkJlAkqlvTX9OCYOEDICkoQcv9wziqfvkdg=; b=JeX9Dt7wWhOznHBv9kKxqlrXR
	BSbkubduyt7q4u3QAkl0PAizfard1ZtSiCVbabdun/hCOrHyyf5+pwa/rnBvxDqUO6kaO+SvK5DyW
	V24x6AdhsvxzEx6lhIrh6CHGFDfnjVtJw9Ke/XUcPGjBzHSdAkN+fBH3wc1e2msv0M8o8+TkWplyc
	we4dCkhxjGAXErga8Fjh919hRI7RdFZiRTQWSQqNQWDzs9sXiTHrLEG0h4LfYIHY7ndFwCiczRiG6
	Q+NolrmVNOEeJpuE+EPzSvFasIBw7ut3qqnRSZpPz15nsfQZWzRE+NzC2WRxeBAuOwDtwRkPBho0D
	0rRkIKvJA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWCMj-008Mov-0D; Tue, 13 Apr 2021 06:17:37 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWCK1-008MaX-Dh; Tue, 13 Apr 2021 06:15:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=qyFHjsBvTgUhsiff+Yj5ihfZwRWIm8QTGcXQbNJZ5Ao=; b=GJuck7EcezjySm+EuduxQEd7a/
 ie92PyEzEiJWCoAWeRZtZN4Hk/+0iGB7jdNdaApv4Fsxra3gdFbK9Uwn5C1BgUcqqf1lYYsXXgU8w
 9w02bsXkYn9BrSN2rRREk1NkfEn/XGyM81CmqHSxztceW+9e0vKimGHQ/wgSJF26+uQyj6F3djjui
 epsIDYsPagYrCo04hBQZuokmqT2kEDDkS98T94xod4yolbOA++dSM7Lh1p2biW9F8NUdEgAu52ABY
 CEJyChq7qooYpVEWRFWOjQD5/9JfUJhNuxgokoPG3bzzSXT8g5pOgq416LM2Q8rDAwmmx1ymrtXeG
 0PFTN5Lw==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWCJy-006lPJ-5e; Tue, 13 Apr 2021 06:14:47 +0000
X-UUID: 3fc751ea4e1e4c03920cc4760c452c35-20210412
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=qyFHjsBvTgUhsiff+Yj5ihfZwRWIm8QTGcXQbNJZ5Ao=; 
 b=SPsH+3aIGFKq4mSqlcBG8i3V7aGn7cT/gjX02vCrEyhztotDg/joRS6ml3zwzWW92d8zzrFjzCSHQL3WG8raz8dODIOxuQxIMz0joUexZyCue282CdYbXcKEnhscwTPICbYmwe7mPEAe+ZTzGV4Hd/LlcYOBNF6Ah2ZxufrL7zc=;
X-UUID: 3fc751ea4e1e4c03920cc4760c452c35-20210412
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1208665482; Mon, 12 Apr 2021 23:14:43 -0700
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Apr 2021 23:04:42 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 13 Apr 2021 14:04:37 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 13 Apr 2021 14:04:36 +0800
Message-ID: <1618293876.20053.19.camel@mhfsdcap03>
Subject: Re: [PATCH v5 04/16] memory: mtk-smi: Add device-link between
 smi-larb and smi-common
From: Yong Wu <yong.wu@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>, 
 Rob Herring <robh+dt@kernel.org>, Evan Green <evgreen@chromium.org>, "Robin
 Murphy" <robin.murphy@arm.com>, Tomasz Figa <tfiga@chromium.org>,
 Will Deacon <will.deacon@arm.com>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <iommu@lists.linux-foundation.org>, <youlin.pei@mediatek.com>, "Nicolas
 Boichat" <drinkcat@chromium.org>, Matthias Kaehlcke <mka@chromium.org>,
 <anan.sun@mediatek.com>, <chao.hao@mediatek.com>,
 <ming-fan.chen@mediatek.com>, <yi.kuo@mediatek.com>, <eizan@chromium.org>,
 <acourbot@chromium.org>
Date: Tue, 13 Apr 2021 14:04:36 +0800
In-Reply-To: <ea7ed30f-050d-2d38-7c61-1e0c192f6ded@canonical.com>
References: <20210410091128.31823-1-yong.wu@mediatek.com>
 <20210410091128.31823-5-yong.wu@mediatek.com>
 <ea7ed30f-050d-2d38-7c61-1e0c192f6ded@canonical.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 8B8658583EC320938B6F639F945357FBB1223F0F73CE1216BBDAB02EA2DDC8D52000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_231446_237530_0D862D7C 
X-CRM114-Status: GOOD (  22.72  )
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

On Sat, 2021-04-10 at 14:40 +0200, Krzysztof Kozlowski wrote:
> On 10/04/2021 11:11, Yong Wu wrote:
> > Normally, If the smi-larb HW need work, we should enable the smi-common
> > HW power and clock firstly.
> > This patch adds device-link between the smi-larb dev and the smi-common
> > dev. then If pm_runtime_get_sync(smi-larb-dev), the pm_runtime_get_sync
> > (smi-common-dev) will be called automatically.
> > 
> > Also, Add DL_FLAG_STATELESS to avoid the smi-common clocks be gated when
> > probe.
> > 
> > CC: Matthias Brugger <matthias.bgg@gmail.com>
> > Suggested-by: Tomasz Figa <tfiga@chromium.org>
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---
> >  drivers/memory/mtk-smi.c | 19 ++++++++++---------
> >  1 file changed, 10 insertions(+), 9 deletions(-)
> 
> I understood this is a dependency for other patches, so:
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> 
> If I am wrong and I can take it via memory tree, let me know.

Hi Krzysztof,

Thanks very much for your quickly review.

I think it is ok if it go through memory tree. In the original patch, we
pm_runtime_get(smi-common-dev) in the smi-larb's pm resume callback.
This patch only use device-link do this. thus, this patch have no
function change. it only adjusts the SMI internal code flow.

In addition, [14/16] expects your Acked-by. and that one should be
merged with the others.

About the others patches, I'm not sure which tree they should go
through. they cross several trees, dt-binding/iommu/media/drm/dts.

Not sure if Matthias could have time to review and give some suggestion.

> 
> Best regards,
> Krzysztof
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
