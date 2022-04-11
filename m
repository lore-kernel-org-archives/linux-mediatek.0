Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE5DAC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Apr 2022 06:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1EyOgdI77M7eLZKaPE6s0tnKs3by/QQJDFSsppDr1nQ=; b=enuiS4gKnhuG1E
	IL+KQentya/WEaqVxzBMVt+JOlE47463/3Ej3RJtMt36H4dRZGbg6b3EoPYTCncFnjR34hiaZ3mYH
	T9judZfU3cAHoKbG2SeW5PpFK97R4EU7VVhPQMBs3HbeW0suUobl1c469gB1w8BNi3UVnFR71RCP8
	hE9fwLCcpSHdsor4MUllcqBWI+kgxFoH6WjwRE6HmzHXqitIhIHqQ4T7xsiIFFgeFFEZqnHMWpA8s
	hEHxYBQN1r0mLTp6jouDqSJqpnnM1c3wSN8ZNCmDUSC4DZtve5ivwoE8V22M4cUH0KDMj/XFKjKH7
	qiCF81XEqaUgrdurTi/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndnuI-006zyt-D8; Mon, 11 Apr 2022 06:52:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndnuE-006zyN-EV; Mon, 11 Apr 2022 06:52:13 +0000
X-UUID: deccd7f9fb424209a9cab6af32af6042-20220410
X-UUID: deccd7f9fb424209a9cab6af32af6042-20220410
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1312660502; Sun, 10 Apr 2022 23:52:06 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 10 Apr 2022 23:49:01 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Apr 2022 14:48:59 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 11 Apr 2022 14:48:59 +0800
Message-ID: <292e5b8df8a011fdbb9c271e39ba927c6076484a.camel@mediatek.com>
Subject: Re: [PATCH V2 01/15] dt-bindings: cpufreq: mediatek: Add MediaTek
 CCI property
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, <rafael@kernel.org>, 
 <viresh.kumar@linaro.org>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>
CC: <matthias.bgg@gmail.com>, <jia-wei.chang@mediatek.com>,
 <roger.lu@mediatek.com>, <hsinyi@google.com>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 11 Apr 2022 14:48:59 +0800
In-Reply-To: <0ef8f2c3-fd16-041b-3304-b167a2a36ff9@linaro.org>
References: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
 <20220408045908.21671-2-rex-bc.chen@mediatek.com>
 <a171f33c-cda1-8602-ac67-93076b676578@linaro.org>
 <8d466903d42dbc823f4d0a245378d983ab904435.camel@mediatek.com>
 <0ef8f2c3-fd16-041b-3304-b167a2a36ff9@linaro.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220410_235210_523901_4FB15E06 
X-CRM114-Status: GOOD (  20.76  )
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

On Fri, 2022-04-08 at 13:49 +0200, Krzysztof Kozlowski wrote:
> On 08/04/2022 12:24, Rex-BC Chen wrote:
> > > 
> > > You need to describe the type. I am a bit confused whether this
> > > is a
> > > cci
> > > (so cci-control-port property?) or an interconnect (so
> > > interconnect
> > > property)... It does not look like a generic property, so you
> > > need
> > > vendor prefix.
> > 
> > Hello Krzysztof,
> > 
> > Thanks for your review.
> > 
> > Yes, this cci is not arm's cci (cci-control-port property), and
> > it's
> > mediatek's cci. I will revise this name to "mtk-cci" in next
> > version.
> 
> Vendor is "mediatek" and comma comes after it. See devicetree spec
> paragraph 2.3.1.
> 

Hello Krzysztof,

OK, I will revise as "mediatek,cci" in next version.

> > 
> > > 
> > > > +       For details, please refer to
> > > > +       Documentation/devicetree/bindings/devfreq/mtk-cci.yaml
> > > 
> > > Such file does not exist.
> > 
> > This mediatek cci is still upstreaming in this patch:
> > message-id:20220408052150.22536-2-johnson.wang@mediatek.com
> > 
> > Do you have suggestion that I should put this reference?
> > Or I just remove it and describe the mediatek cci in detail?
> 
> It's ok, but you need to keep path/filename updated.
> 
> 
> Best regards,
> Krzysztof

From your comment of cci series.
I will write is to be
"Documentation/devicetree/bindings/devfreq/mediatek,cci.yaml"

Thanks!

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
