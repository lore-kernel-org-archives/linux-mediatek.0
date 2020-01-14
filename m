Return-Path: <SRS0=z6AG=3D=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,TO_MALFORMED,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C858C33CB1
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jan 2020 08:23:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EEDC217BA
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jan 2020 08:23:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ebHVpHKP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="chYOECsh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EEDC217BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w866L1Mf2j0MfK6ICrYfp0TvX6R00AGqfs/mQ4TgbjM=; b=ebHVpHKPMxFVRT
	J85C9OYPgeYdeWICZBlUrLa0mK0aythPDnKSNMm/8FnC+dKhgUjvURhiF6cA4/T3YaxF2zcLd4rFY
	vWhC430vOGksePd0Z9/EJUYFQo+nn82+Hnjb3pN+aARwyfxa6fTb5/HNQXpk7x8JJjOSmY2XJupiq
	F1Z4oQ7V6EXW7aPtylp7eu+Jso1pgcWbscvez4uZePJyfAWvYkDJzrboamJ5naHm5t36TVF3d8FHi
	qHGgVN7nvp2xQBHCsHGHvoWbUgj7yRvVBZ4ndwK1UqinH+m+XiHZbknS11A+Xd2Puzb5u4eBvt0CJ
	8lhLZm22CcexDsaS6aAQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irHTe-0000qP-Hd; Tue, 14 Jan 2020 08:23:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irHTb-0000pS-Sm; Tue, 14 Jan 2020 08:23:05 +0000
X-UUID: 2887150b6aa44301a9de67b592fe3333-20200114
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=PSf/TrlUffkCTyRqTndCRzJKJpXu//HKIZ0YNx6bdFw=; 
 b=chYOECshBwzmZrReKl6nrMaK12VZosaCzK9yx74kTCHi8uBWtAmqLwjEnlMKZUtxJb+SNxYe2z5/FuqlVwF+yF6kLAUIqfSKhs9ylf3pCQ52l8Xc1ZD3l5aiSzDTxPPaqELJ+gJn5tYBcXw8bf1H3kaDX8c0PdpRMRTufXfDyJ4=;
X-UUID: 2887150b6aa44301a9de67b592fe3333-20200114
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1071186523; Tue, 14 Jan 2020 00:22:56 -0800
Received: from MTKMBS33DR.mediatek.inc (172.27.6.106) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 14 Jan 2020 00:22:54 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Tue, 14 Jan 2020 16:19:45 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 14 Jan 2020 16:23:04 +0800
Message-ID: <1578990166.21256.35.camel@mhfsdcap03>
Subject: Re: [RESEND PATCH v5 01/11] dt-bindings: phy-mtk-tphy: add two
 optional properties for u2phy
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Kishon Vijay Abraham I <kishon@a0393678ub>
Date: Tue, 14 Jan 2020 16:22:46 +0800
In-Reply-To: <20200110111006.GB2220@a0393678ub>
References: <1578448326-27455-1-git-send-email-chunfeng.yun@mediatek.com>
 <20200110111006.GB2220@a0393678ub>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 1AEB94C361A44643E233821C0E36D4AF5C4CF96D15DEF8217D3092ACDB6042B82000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200114_002303_935298_E262146E 
X-CRM114-Status: GOOD (  18.14  )
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
 linux-kernel@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Kishon,

On Fri, 2020-01-10 at 16:40 +0530, Kishon Vijay Abraham I wrote:
> Hi,
> 
> On Wed, Jan 08, 2020 at 09:51:56AM +0800, Chunfeng Yun wrote:
> > Add two optional properties, one for tuning J-K voltage by INTR,
> > another for disconnect threshold, both of them are related with
> > connect detection
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > Acked-by: Rob Herring <robh@kernel.org>
> 
> Patch does not apply. I get the following errors
> error: patch failed: Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt:52
> error: Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt: patch does not apply
> error: Did you hand edit your patch?
> 
> Can you send them again in the right format?
I download this patch from https://patchwork.kernel.org/patch/11322505/
and fetch kernel5.5-rc5, then

git am --reject
RESEND-v5-01-11-dt-bindings-phy-mtk-tphy-add-two-optional-properties-for-u2phy.patch
Applying: dt-bindings: phy-mtk-tphy: add two optional properties for
u2phy
Checking patch Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt...
Applied patch Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt
cleanly.

don't reproduce the error you encountered, can you tell me the steps you
apply the patch, thanks


> 
> Thanks
> Kishon
> > ---
> > v5: add acked-by Rob
> > 
> > v4: no changes
> > 
> > v3: change commit log
> > 
> > v2: change description
> > ---
> >  Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt b/Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt
> > index a5f7a4f0dbc1..ce6abfbdfbe1 100644
> > --- a/Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt
> > +++ b/Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt
> > @@ -52,6 +52,8 @@ Optional properties (PHY_TYPE_USB2 port (child) node):
> >  - mediatek,eye-vrt	: u32, the selection of VRT reference voltage
> >  - mediatek,eye-term	: u32, the selection of HS_TX TERM reference voltage
> >  - mediatek,bc12	: bool, enable BC12 of u2phy if support it
> > +- mediatek,discth	: u32, the selection of disconnect threshold
> > +- mediatek,intr	: u32, the selection of internal R (resistance)
> >  
> >  Example:
> >  
> > -- 
> > 2.24.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
