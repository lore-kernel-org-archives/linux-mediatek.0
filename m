Return-Path: <SRS0=Gsgc=KQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A37D9C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 01:50:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69A4F61246
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 01:50:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69A4F61246
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fCW6Bn3d4+tKs5C+ZJEy7D9KONVjSOhrkUiMj0/lGjg=; b=pFTuO1Fl00C1vRWoNnw+g/WzaQ
	V0cdoCOMGx6159LvcSU/xdbkhbvZN7Sw85lil0PN5QLCj41eCH2hEu/KMJgVOKI0nmWQ27DoAipcn
	0jkBYbDu0CNVxywTPaka4ozDfY/9YRvEQ9d6zh1cA0bGdoGZPj+C1HmtIcF+pL7cOIJxJEiZpH1hl
	1ChS0qcifqnqQS+hTfq9qdjuPD7/0n/QNZVRgxDIsaIM/XxHszKT8Pu97RZdVexdwCjnM/ju29Bd1
	QGezw92w5vJ3iv/2VZrmL1/4794cAVvrgjHb6WWAudvUP3HTZ/VZA6e+Nufh5pj2H51znLPX8w21G
	lG3Z6e2Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljuJG-003M8X-Ub; Fri, 21 May 2021 01:50:43 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljuIm-003M0p-3x; Fri, 21 May 2021 01:50:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=gkirK3Anzo1+S+hO3+Q5XJ8qhdVJmLmV+yOOMFc5euI=; b=mclmf+JXPJnabfA3moqK4LA8VH
 rzQs2MDukzuYloGY10e9m23APw89klh2Azs3K/923zVB0jSU1Pu/lHzU/o9teAIC0wGPNMGUhxQAb
 QtWP8Dkc0U9/4GALjfKDf1I9p0oO9dLR30SwBwEb5U57HiQ79I6UhO2v02jUuk2fhyCnyF3duPXtW
 vcGUM+fy9vCMc4ZiO2Uh+HwiuYbFywiwtGrQZWipBgeLTl/35e6bBOM0EfX14E8dUHBmsvqCKQhX9
 IGS8+A4Il2kmVU1Iz8poGTYEqBVojVuNKPogcCZB7fEX5hZicVJHnu38ryamCT89qclmBzjN40XZO
 2N8LaF2A==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljuIj-00GkxO-KV; Fri, 21 May 2021 01:50:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DDDAE610CC;
 Fri, 21 May 2021 01:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621561808;
 bh=S7/3ff93Mj7sM1z6GZwcsvA1idQokUB7jGPPhwZLJBA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=G/KXauU52TYA4HxENirxJuGXo8MgQI8QIF+C1PL0s+rd2Fh7xiVeMixAlwk9503oP
 2ytvSAkJdBOadITWFLN1EBi970UCgynkB1MSQUg612WbCglj+W1NiLaC84QLEON1aa
 U6dNKPWnZR262YAdgjAPDwA83swrSQfL5rZlRC2PxmE0H2tXIAMfzXI5V2GeluD6xY
 PGffkHS0WIosbGC5uOKWbcrTmk05pL/Z2EKKY478fnjdneN5NuqEV6sxZPmLUPSw8p
 Ald7xKougASVjGmwtWNhpocfbD1G3eXBRVr7eZeMZF+/ebE5kUtCLOztUVKH/Womx+
 f8epUhwLbed4g==
Received: by mail-ed1-f52.google.com with SMTP id g7so9379308edm.4;
 Thu, 20 May 2021 18:50:08 -0700 (PDT)
X-Gm-Message-State: AOAM530BNII5qJY8SxFqVlk9qZ/eni9ul099kQrVaS30llMkMpBVE7aL
 yyLUcTz88Vuy/AkMziDZzgv9cb5hEZBN51kkiA==
X-Google-Smtp-Source: ABdhPJyKCSeOAVSGMjIYxJSecYUm/pYxze27Ok54E4R02URqRmpRfqNw7bo+yG8CEi2WwQh8Saw5JM/Y2gnTWv0YUPs=
X-Received: by 2002:aa7:cd83:: with SMTP id x3mr7909049edv.373.1621561807474; 
 Thu, 20 May 2021 18:50:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210519161847.3747352-1-fparent@baylibre.com>
 <20210521014815.GA2476751@robh.at.kernel.org>
In-Reply-To: <20210521014815.GA2476751@robh.at.kernel.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 20 May 2021 20:49:56 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+HWxQwFuKM==g-PBROxGN_xoWCc060U0pDpsDdfWJWPg@mail.gmail.com>
Message-ID: <CAL_Jsq+HWxQwFuKM==g-PBROxGN_xoWCc060U0pDpsDdfWJWPg@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: arm: mediatek: mmsys: convert to YAML
 format
To: Fabien Parent <fparent@baylibre.com>
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 Mattijs Korpershoek <mkorpershoek@baylibre.com>, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_185009_709372_A0C577D5 
X-CRM114-Status: GOOD (  11.45  )
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

On Thu, May 20, 2021 at 8:48 PM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, 19 May 2021 18:18:44 +0200, Fabien Parent wrote:
> > Convert the mmsys bindings to the YAML format.
> >
> > Signed-off-by: Fabien Parent <fparent@baylibre.com>
> > ---
> >  .../bindings/arm/mediatek/mediatek,mmsys.txt  | 31 ----------
> >  .../bindings/arm/mediatek/mediatek,mmsys.yaml | 57 +++++++++++++++++++
> >  2 files changed, 57 insertions(+), 31 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
> >  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> >
>
> Applied, thanks!

Actually, should go with patch 3. So dropped and:

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
