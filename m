Return-Path: <SRS0=z6AG=3D=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DFD8C33CB1
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jan 2020 08:53:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 500842075B
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jan 2020 08:53:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E0eL00ok";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="kPk55WYD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 500842075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j5KXFT+CQC6lMlDf3eQ/inWTQiLDINOuOIPK0ADyqLk=; b=E0eL00okSl4PoH
	4tjEJ3xrpUrUPE4EXkXeWwPLcVBeJYfLhsQ/ODZ9BNEJUzv72tN9xbmkEituXqBm97tkhIqoJeM6t
	g37hk5lqCTvYAX0Ibxz6SGKGnJ4opeIfN2U45BhXiHrGwLc1PRASE8+VMoOufDLBaemCrvmb2f0j+
	LRMx8MwbmFSi7Stk9JBubuVMdWB7Cb1LW/gO5UY0VxmdL8/Gzwh5RnO8rie/lhGifWp7fHgkaiY7s
	WfCHA0Z4ss/I+iWf9c25wBz/xw3y4l1YKEr9kAKyCysQsopuQ3B6LYpvGvmhtimqLl5X8VqViW3Jg
	AFHUM8HGiju7WLyfksiQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irHx3-0004OT-5q; Tue, 14 Jan 2020 08:53:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irHx0-0004Nw-Qa; Tue, 14 Jan 2020 08:53:28 +0000
X-UUID: bb32172a98e44d63bc820f2c50adc678-20200114
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Dost+0dFRh/iyChepfPjiNF1opJPrShWqwDKLyfccxU=; 
 b=kPk55WYD7CVetq4NyivfOK5nRYcuZQUUzAeXOfgFDz3OOfxGTDOwqW6XOa5wysHDdP0/DuSgBe23f9nvLi4uTazpmSdFmB/v0pj2p8IwnrOyZL+3kMJvfhx/H6KSC4Pqb8Z1dlqg9bMLCBAo7sUWnAFIq1rp8xndPvCEf/vd2GY=;
X-UUID: bb32172a98e44d63bc820f2c50adc678-20200114
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2041577777; Tue, 14 Jan 2020 00:53:20 -0800
Received: from MTKMBS33N2.mediatek.inc (172.27.4.76) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 14 Jan 2020 00:43:17 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Tue, 14 Jan 2020 16:43:39 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 14 Jan 2020 16:42:27 +0800
Message-ID: <1578991386.21256.36.camel@mhfsdcap03>
Subject: Re: [RESEND PATCH v5 01/11] dt-bindings: phy-mtk-tphy: add two
 optional properties for u2phy
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Kishon Vijay Abraham I <kishon@ti.com>
Date: Tue, 14 Jan 2020 16:43:06 +0800
In-Reply-To: <970b7cce-40ed-9ab7-5e04-9e3d609eadf7@ti.com>
References: <1578448326-27455-1-git-send-email-chunfeng.yun@mediatek.com>
 <20200110111006.GB2220@a0393678ub> <1578990166.21256.35.camel@mhfsdcap03>
 <970b7cce-40ed-9ab7-5e04-9e3d609eadf7@ti.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: D582942802D1883A0CC1327A8F6B5666E8F2723D1A7B198DCC432FD73969D2B32000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200114_005326_868747_B9B20E20 
X-CRM114-Status: GOOD (  20.37  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Kishon Vijay Abraham I <kishon@a0393678ub>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-01-14 at 14:01 +0530, Kishon Vijay Abraham I wrote:
> Hi Chunfeng,
> 
> On 14/01/20 1:52 PM, Chunfeng Yun wrote:
> > Hi Kishon,
> > 
> > On Fri, 2020-01-10 at 16:40 +0530, Kishon Vijay Abraham I wrote:
> >> Hi,
> >>
> >> On Wed, Jan 08, 2020 at 09:51:56AM +0800, Chunfeng Yun wrote:
> >>> Add two optional properties, one for tuning J-K voltage by INTR,
> >>> another for disconnect threshold, both of them are related with
> >>> connect detection
> >>>
> >>> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> >>> Acked-by: Rob Herring <robh@kernel.org>
> >>
> >> Patch does not apply. I get the following errors
> >> error: patch failed: Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt:52
> >> error: Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt: patch does not apply
> >> error: Did you hand edit your patch?
> >>
> >> Can you send them again in the right format?
> > I download this patch from https://patchwork.kernel.org/patch/11322505/
> > and fetch kernel5.5-rc5, then
> 
> Please try applying to
> git://git.kernel.org/pub/scm/linux/kernel/git/kishon/linux-phy.git next

Got it, will test again, thanks a lot

> > 
> > git am --reject
> > RESEND-v5-01-11-dt-bindings-phy-mtk-tphy-add-two-optional-properties-for-u2phy.patch
> > Applying: dt-bindings: phy-mtk-tphy: add two optional properties for
> > u2phy
> > Checking patch Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt...
> > Applied patch Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt
> > cleanly.
> > 
> > don't reproduce the error you encountered, can you tell me the steps you
> > apply the patch, thanks
> 
> git am chunfeng.yun.patch --reject
> Applying: dt-bindings: phy-mtk-tphy: add two optional properties for u2phy
> Checking patch Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt...
> error: while searching for:
> - mediatek,eye-vrt	: u32, the selection of VRT reference voltage?
> - mediatek,eye-term	: u32, the selection of HS_TX TERM reference voltage?
> - mediatek,bc12	: bool, enable BC12 of u2phy if support it?
> ?
> Example:?
> ?
> 
> error: patch failed:
> Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt:52
> Applying patch Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt
> with 1 reject...
> Rejected hunk #1.
> Patch failed at 0001 dt-bindings: phy-mtk-tphy: add two optional
> properties for u2phy
> Use 'git am --show-current-patch' to see the failed patch
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".
> 
> Thanks
> Kishon

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
