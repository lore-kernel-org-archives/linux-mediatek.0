Return-Path: <SRS0=1z9j=NJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A837C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Aug 2021 06:37:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F1C860EFE
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Aug 2021 06:37:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4F1C860EFE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sNRPg2Vw4E/sMRvQ9uO1XP10za5WQBM+Vb2SKeX/rtw=; b=icGUXqfmPjMW/S
	XMuTmMLWcDEpoYULh6pZRbb559zvvdhwXYJuQRZgaIeH2BaYVSNUzdwI/mbyKvOPGoPAqAXzwNyI3
	XycojI2cQzjyM7T+CCGn18uhdrlwGRo1HoYLl1JcSr5TjGaqfjGq0xCdm9YKqvWUluMg+5YOFQUPP
	oX6wziFNVDR8bn8/sVd1lTg4Tw7TjIJVLk7XCj0Hb4/86adYd48iLjTHaYNkDoBhtcFkBAItnszWP
	xMdG/fgkRCFJ8uImL+cmFZoZjzvZIpSneVNoQn8KV+vXox3z/KMdfz0Kvq5/fJa/OfUb46Ku9IJHs
	BJ5Ux5z8YEH3yNAEqbEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGFCU-004Oo0-1c; Wed, 18 Aug 2021 06:37:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGFCN-004OnD-EO; Wed, 18 Aug 2021 06:37:20 +0000
X-UUID: 995407064449418bb35e8c9f979253d7-20210817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=eeawtNJoOTb/6/2Ic+zvEiw0QcaRQqssYptnS8RDIjE=; 
 b=pOzBIOQ2Mf59UJy9p/TtFjYl62dGJOSk2YDpRMtvmEOl7SgzjRZZgJPRFUFP5guGRZZvq3Ebgsl/MCOwaQRYc9UAIZhjGDjAodEZjT7oc9KVBJ/Xa5V4s0nqgH0F0OuQ778px8wiPRvTrmlCS7nGocz0t3ksgjvqQCkUJClJ9qw=;
X-UUID: 995407064449418bb35e8c9f979253d7-20210817
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <kewei.xu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 973667446; Tue, 17 Aug 2021 23:37:12 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 17 Aug 2021 23:37:10 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 Aug 2021 14:37:08 +0800
Received: from mhfsdcap04 (10.17.3.154) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 18 Aug 2021 14:37:08 +0800
Message-ID: <d89aa91a5231219b5da9940d659d4acfff3ded66.camel@mediatek.com>
Subject: Re: [PATCH v4 5/8] dt-bindings: i2c: add attribute
 default-timing-adjust
From: Kewei Xu <kewei.xu@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: <wsa@the-dreams.de>, <matthias.bgg@gmail.com>,
 <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <leilk.liu@mediatek.com>, <qii.wang@mediatek.com>, <yuhan.wei@mediatek.com>,
 <ot_daolong.zhu@mediatek.com>, <liguo.zhang@mediatek.com>
Date: Wed, 18 Aug 2021 14:37:08 +0800
In-Reply-To: <20210722031016.GA3228241@robh.at.kernel.org>
References: <1626517079-9057-1-git-send-email-kewei.xu@mediatek.com>
 <1626517079-9057-6-git-send-email-kewei.xu@mediatek.com>
 <20210722031016.GA3228241@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_233716_932674_968172C3 
X-CRM114-Status: GOOD (  18.28  )
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

On Wed, 2021-07-21 at 21:10 -0600, Rob Herring wrote:
> On Sat, Jul 17, 2021 at 06:17:56PM +0800, Kewei Xu wrote:
> > Add attribute default-timing-adjust for DT-binding document.
> > 
> > Fixes: be5ce0e97cc7 ("i2c: mediatek: Add i2c ac-timing adjust
> > support")
> > Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
> > ---
> >  Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
> > b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
> > index 7c4915bc4439..7b80a11d4d4c 100644
> > --- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
> > +++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
> > @@ -33,6 +33,8 @@ Optional properties:
> >    - mediatek,have-pmic: platform can control i2c form special pmic
> > side.
> >      Only mt6589 and mt8135 support this feature.
> >    - mediatek,use-push-pull: IO config use push-pull mode.
> > +  - mediatek,default-timing-adjust: use default timing
> > calculation, no timing
> > +    adjustment.
> 
> 'mediatek,use-default-timing' perhaps as it means don't adjust
> anything.
> 
> >  
> >  Example:
> >  
> > -- 
> > 2.18.0
> > 
Hi Rob,

Thanks for your suggestion. We will use "mediatek,use-default-timing"
instead of "mediatek,default-timing-adjust" in the next version of
patch.

Thanks
kewei
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
