Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC6A0C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Mar 2022 09:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mKzQlUOIkw2mqSLczlkofiJ0rjkZCU8amc3AEISTfbs=; b=agrz4tZX0nd4XM
	tQ97uA9iHMM6c0ihcJeGsQcCluRgXg1o3jUlyibwHhrWPICP/eUfTWmw4SfMMuwmFkw2y0ddNzCIf
	dPskU1LoLUDCJLK65AirKb6Srgr/ytuluKvhp8peBMVlFOqUJ+ex1ScIr5tcxJhC4ADZxfwHO9mCP
	g5Q2SdLT7cF2/vjpj8zaZidlCVAm2sQx1zuYpsxC4R+dMTb3ftW5DeV6RHJwwE5yU4S7OZXUt7QQU
	3rasm9+ILUGHDJO4qlAF+8N6rEWZYuFb2ZRyLn7p2HQgyvJ21/m3cN2pCJsRkIJW1AzHwI9Bk91Ew
	OsDKd9w0j/DbOzLUJ7Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXKFd-00GBBf-6g; Thu, 24 Mar 2022 09:59:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXKFR-00GBAK-Me; Thu, 24 Mar 2022 09:59:18 +0000
X-UUID: fb9a4577a6614ffeb1bbece132a3e4c2-20220324
X-UUID: fb9a4577a6614ffeb1bbece132a3e4c2-20220324
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jia-wei.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1335427334; Thu, 24 Mar 2022 02:59:11 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Mar 2022 02:49:08 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Mar 2022 17:49:07 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 24 Mar 2022 17:49:07 +0800
Message-ID: <076256c903e71137b4b4b2891388509ceb009dfa.camel@mediatek.com>
Subject: Re: [PATCH 4/4] cpufreq: mediatek: add platform data and clean up
 voltage tracking logic
From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, "Rafael J .
 Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, "Rob
 Herring" <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, "Mark
 Brown" <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <fan.chen@mediatek.com>,
 <louis.yu@mediatek.com>, <roger.lu@mediatek.com>,
 <Allen-yy.Lin@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <hsinyi@google.com>,
 Jia-Wei Chang <jia-wei.chang@mediatek.corp-partner.google.com>
Date: Thu, 24 Mar 2022 17:49:07 +0800
In-Reply-To: <a728aaa0-bde9-b9a9-971a-2e4b52f2b7bf@canonical.com>
References: <20220307122151.11666-1-jia-wei.chang@mediatek.com>
 <20220307122151.11666-5-jia-wei.chang@mediatek.com>
 <a728aaa0-bde9-b9a9-971a-2e4b52f2b7bf@canonical.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220324_025917_757183_5A41FACF 
X-CRM114-Status: GOOD (  17.07  )
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

On Mon, 2022-03-07 at 20:03 +0100, Krzysztof Kozlowski wrote:
> On 07/03/2022 13:21, Tim Chang wrote:
> > 1. add required header files and remove unnecessary header files.
> > 2. some soc needs different min/max voltage shift and voltage
> > tracking
> >    attributes. make these variables into platform data to support
> >    future soc.
> > 3. add need_voltage_tracking variable to platforma data. if true,
> > it
> >    indicates soc is required to realize the voltage tracking
> > between
> >    voltage of sram and voltage of cpu by software approach.
> > otherwise,
> >    the voltage tracking is realized by hardware approach.
> > 4. add opp frequency look-up function as mtk_cpufreq_get() and
> >    registered in cpufreq framework.
> > 5. update voltage_tracking() logic and drv_init(). in drv_init(),
> > it
> >    always sets highest opp voltage before return. it could prevent
> > from
> >    high-freqeuncy-low-voltage issue if two or more clients using
> > the
> >    same regulator.
> 
> One change at a time.

Sure, I will split the change and send one change in one commit.

> 
> > 
> > Signed-off-by: Jia-Wei Chang <
> > jia-wei.chang@mediatek.corp-partner.google.com>
> 
> Your SoB does not match from field.

I will update it for the whole series in next version.

> 
> Best regards,
> Krzysztof


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
