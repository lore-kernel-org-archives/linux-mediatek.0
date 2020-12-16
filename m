Return-Path: <SRS0=oKwZ=FU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E829EC4361B
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Dec 2020 04:34:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FF5F2311F
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Dec 2020 04:34:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FF5F2311F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=euqOEXypW44uIJy1h7/pGPYQFebqXvJ3jNkMAodU41Q=; b=cn0kAi2Vcb7aF6RZFjKHl3hCS
	pSve4ewFVrAGkq2FstmJFKkVmeXGaXSyr/2B7D/Lxkj/hoBGRag8eiqbHv+AOogNhl8yBR7AwEoQP
	49pWpOD1BLu02VJgMESKTH9LtwfcHot5ZNyRS8N0yBUszvWkM2Ym4sPvqwGDj3+Ndou7HRkHl4kWr
	pLh4cFpxMppI9opohXK72ihFb6g7oexZjlJFIl/taum92fWl8MXjzauvYO0g+BWRnVHKZNnb+xzLE
	we4HIHyToOhWC4yKSVATwhhcLECFYHin3dFJ7iYj8cuMZm7DogbAOyHiJ8yaEsNqPWAyvs46Ck2+I
	HN9qatnXw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpOWH-0002rw-Au; Wed, 16 Dec 2020 04:34:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpOWB-0002rA-6r; Wed, 16 Dec 2020 04:34:29 +0000
X-UUID: cfced85f068f47e4a3c7c38115415118-20201215
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=MbWUyAPZzTNL6x8OSUcYZnRyRZFOEMoj2KWEeYv8KIQ=; 
 b=AzYllHLMi1rCNajcsGKOTIXAnIZYGnGy+mU+iC8t6CMiET0llRMYX3rmKyc75Xt2Nk3yklqczVItpKDQt/eN3HDTUUSdxG09g9IE7bCB9l4eAUgJVsShqaX2XxYXyZ+XDxR7s2OoFb7DGva3gPgIke/9fUmL1Yx1mCBZKDaj75c=;
X-UUID: cfced85f068f47e4a3c7c38115415118-20201215
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1606259904; Tue, 15 Dec 2020 20:34:23 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Dec 2020 20:34:21 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Dec 2020 12:34:20 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 16 Dec 2020 12:34:19 +0800
Message-ID: <1608093259.2412.1.camel@mtksdaap41>
Subject: Re: [PATCH v2 3/8] dt-bindings: regulator: Add document for MT6359
 regulator
From: Hsin-hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Mark Brown <broonie@kernel.org>
Date: Wed, 16 Dec 2020 12:34:19 +0800
In-Reply-To: <20200923162458.GE5707@sirena.org.uk>
References: <1600688895-9238-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1600688895-9238-4-git-send-email-hsin-hsiung.wang@mediatek.com>
 <20200923162458.GE5707@sirena.org.uk>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201215_233427_465073_52A6A11B 
X-CRM114-Status: GOOD (  13.00  )
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
Cc: devicetree@vger.kernel.org, Wen Su <wen.su@mediatek.com>,
 srv_heupstream@mediatek.com, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On Wed, 2020-09-23 at 17:24 +0100, Mark Brown wrote:
> On Mon, Sep 21, 2020 at 07:48:10PM +0800, Hsin-Hsiung Wang wrote:
> 
> > +Required properties:
> > +- compatible: "mediatek,mt6359-regulator"
> 
> The compatible isn't used by the driver (which is good!) so should be
> dropped from the binding document.
Thanks for your comments, but I have a question about it.
When I remove the compatible name in the dts, there will be some error
message:
[    0.437562] mt6359-regulator: Failed to locate of_node [id: -1]
[    0.440612] mt6359-sound: Failed to locate of_node [id: -1]

Do you mean that we don't need any compatible name in dts, mfd and
regulator driver?
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
