Return-Path: <SRS0=QnWu=IY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D3A4C433C1
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Mar 2021 01:31:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A602061A43
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Mar 2021 01:31:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A602061A43
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IIPOfh5aXXGlEpKNpYmkCaX2LKRs+uE1+7jALBV1oJ4=; b=jxG2WJDqwXkQHKiXx4sIWhBpz
	k86MufEmPbAUMn63pIQ9WyzRYgz39klnBGvDTTD9STPRl5L/1Dfskxw7I9H02UIK3hf0mmUsmOLQz
	pVTnccJ8IUVkpKZUumbPDSP4chnTmVCg1eGWUNrIF+021GIof15oPCpm8kh71LtBsxn0giZ6cIda3
	X4LAC+2cMGZk1hKpQMFZgUHDT49IV/VCq8fs02u+ElVYxsI1DL1WUyg3zXMQSa+JPMjdalTzH75zu
	J09xFc4O3tUyED3z9P8uZNI2BFB9hiQpNFs2lsuWdIMvB0gr+0GiMklvKZQLhMVGn8XgiU1zAChgx
	mIEUdB6SA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPbJv-002U94-6a; Fri, 26 Mar 2021 01:31:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPbJg-002U7P-Cr; Fri, 26 Mar 2021 01:31:17 +0000
X-UUID: 7bbe9e7e578c479da5f6228668d09e3d-20210325
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=VxpyOMauSLivU/LqjpxZ6z4fpqwX1nMTv/ksMPXytSA=; 
 b=ZWdWdwsB/IhhQw3ttqF6V6eQRlOtE+hfPfb8KRes2do13CIAow7ftAZAtDaIMQo1W31mY5zH91nJGaM16Crl3OsK7uMawzYxJ2q8Vft7Houd2pkFge11WIGDD+pjeyJX+6T+XskZ29BnIhAkzzzmNjdLAWYxQkXg9jwDJ3RFSYs=;
X-UUID: 7bbe9e7e578c479da5f6228668d09e3d-20210325
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <qii.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1778906912; Thu, 25 Mar 2021 17:31:02 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 25 Mar 2021 18:31:00 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 26 Mar 2021 09:30:53 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 26 Mar 2021 09:30:52 +0800
Message-ID: <1616722252.22957.3.camel@mhfsdcap03>
Subject: Re: [PATCH] dt-bindings: i2c: Add device clock-stretch time via dts
From: Qii Wang <qii.wang@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: <matthias.bgg@gmail.com>, <wsa@the-dreams.de>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>
Date: Fri, 26 Mar 2021 09:30:52 +0800
In-Reply-To: <20210324171217.GA3262580@robh.at.kernel.org>
References: <1615622829-15167-1-git-send-email-qii.wang@mediatek.com>
 <20210324171217.GA3262580@robh.at.kernel.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9A452831894ABC2ECCDFFDB024427EA9781CA86A0FDAE166AA0BE5DD9588A5432000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210326_013114_286581_35433F26 
X-CRM114-Status: GOOD (  18.75  )
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

On Wed, 2021-03-24 at 11:12 -0600, Rob Herring wrote:
> On Sat, Mar 13, 2021 at 04:07:09PM +0800, qii.wang@mediatek.com wrote:
> > From: Qii Wang <qii.wang@mediatek.com>
> > 
> > tSU,STA/tHD,STA/tSU,STOP maybe out of spec due to device
> > clock-stretching or circuit loss, we could get device
> > clock-stretch time from dts to adjust these parameters
> > to meet the spec via EXT_CONF register.
> > 
> > Signed-off-by: Qii Wang <qii.wang@mediatek.com>
> > ---
> >  Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
> > index 7f0194f..97f66f0 100644
> > --- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
> > +++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
> > @@ -32,6 +32,7 @@ Optional properties:
> >    - mediatek,have-pmic: platform can control i2c form special pmic side.
> >      Only mt6589 and mt8135 support this feature.
> >    - mediatek,use-push-pull: IO config use push-pull mode.
> > +  - clock-stretch-ns: Slave device clock-stretch time.
> 
> Should be a common I2C property?
> 

Wolfram Sang will look at this next and think about it. I hope it would
be a common I2C property.

> >  
> >  Example:
> >  
> > -- 
> > 1.9.1
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
