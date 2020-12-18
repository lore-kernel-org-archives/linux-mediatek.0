Return-Path: <SRS0=+cmX=FW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FE74C4361B
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Dec 2020 02:04:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADED923A3C
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Dec 2020 02:04:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADED923A3C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XpZyVnE7gd1LSHsagjMtky4m1FMEOs+1csdrQmIuVOE=; b=FbLahG+/HDbABrJn86EucblT4
	K3kggnVtgPm6/w/fel4HNrIo0RIvFopOkr/gOppKDFTel1L+A1nwhWj9M9o0/b43lDCL7cWyi4p32
	QSvMw6x3HIm4bPaBOBM3oIzQ0dzrSeP9WoVT4n7Py2ssuTyqhiZxqXlX6VWdrASAKZt4p1nXm3wH0
	d3oSX+tPqs1beCmzLyBqTw5ifsS9qvFfxY3H1WVFSOVK114i517ldEnFYjVNrCe31GEAlUkq83G4t
	JImIH5Jun153Qv1ZjuXqeUFLfnioXdHfakZkMdj8ouuxSQx36Q6xfNAedU9lowXuOfkOd5uLxYBQG
	SEmxKwYRQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kq58I-0005vN-PX; Fri, 18 Dec 2020 02:04:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kq58D-0005uP-Oh; Fri, 18 Dec 2020 02:04:35 +0000
X-UUID: a16983b5be044e90b9489737d9666e0b-20201217
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=btKOFCjUWo3s6zdtgsKjM1Zw8f6bJKkVDG52Ni7VSlY=; 
 b=IcOI3CH6wMVqwowfbyGqvYVv238fk8SZzbp8xs+taNso5JAwGomgQ6aQa6LxaWU/Sr1uaHj9nQr+h7Sq+qeJS8qWHZeqD9gZAlnAQi0mCbtixh8/F/V44r30ZKftbRDKDsNiFZUq5wVU0bXHtPC2pEJEbavZbcdMxX9dIDKctCg=;
X-UUID: a16983b5be044e90b9489737d9666e0b-20201217
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1059946650; Thu, 17 Dec 2020 18:04:28 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Dec 2020 18:04:25 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 18 Dec 2020 10:04:21 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 18 Dec 2020 10:04:24 +0800
Message-ID: <1608257065.9000.3.camel@mtksdaap41>
Subject: Re: [PATCH v4 3/9] dt-bindings: mfd: Add compatible for the
 MediaTek MT6359 PMIC
From: Hsin-hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Fri, 18 Dec 2020 10:04:25 +0800
In-Reply-To: <20201217192818.GA101889@robh.at.kernel.org>
References: <1608104827-7937-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1608104827-7937-4-git-send-email-hsin-hsiung.wang@mediatek.com>
 <20201217192818.GA101889@robh.at.kernel.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201217_210433_953222_A574ADCF 
X-CRM114-Status: GOOD (  17.01  )
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
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, srv_heupstream@mediatek.com,
 Alessandro Zummo <a.zummo@towertech.it>, Ran Bi <ran.bi@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Fei Shao <fshao@chromium.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Eddie Huang <eddie.huang@mediatek.com>, Lee Jones <lee.jones@linaro.org>,
 Yuchen Huang <yuchen.huang@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On Thu, 2020-12-17 at 13:28 -0600, Rob Herring wrote:
> On Wed, 16 Dec 2020 15:47:01 +0800, Hsin-Hsiung Wang wrote:
> > This adds compatible for the MediaTek MT6359 PMIC.
> > 
> > Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> > ---
> >  Documentation/devicetree/bindings/mfd/mt6397.txt | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> > 
> 
> 
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
> 
> If a tag was not added on purpose, please state why and what changed.
> 
Sorry, the tag disappeared because of the change of rtc compatible name.
I will list the change in the each patch for the next update.
Thanks for your review.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
