Return-Path: <SRS0=Nu0C=6Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90729C54E8D
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 06:12:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65A86207DD
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 06:12:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cEbzlFnS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="XgEvgHZH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65A86207DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0r+74UpbrLAts9vz7Jx42/jnw8Znc12QKLX/bz/PULQ=; b=cEbzlFnSl/4L7d
	VRsXZujMfiGx1dQDjUkWYGSgAKqvg8fA5waRviMpZA9ECSDt/1iVuIeSYOuygGFgNVPf2CwQVgsbt
	bD3yxV3JJ1KphuGHefxpTRdfnarbaD28MnYNI82OYikMY5lZAfN2EgFQQtSDE5EFN+CKbGzm2XzNP
	RcAv2z0SKl6S3lgNQtsUCMP6StYMl/0eMDe3Vcbk3qM3pi3NdEzT1lC3rSVyx+5EDbACO3KobeWsX
	t55ztOjr5nEsGBBLuTEqyjrNVRWKB7oo4HFBLu5YEIHqlzmFUeNK6pyEr4lCge1bFxe3fNk/Gdtk3
	U1dPD6LAjvCAyJaymWXA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jY1gB-0005Q1-Ju; Mon, 11 May 2020 06:12:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jY1g1-0005G7-Q1; Mon, 11 May 2020 06:12:35 +0000
X-UUID: a9211fb86025405f98e2290d35939a80-20200510
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=KXbgKqeV1jVjM680D36sEteF5YwDhnYQQbhiljtwUfA=; 
 b=XgEvgHZHesGhebPzMCYukgw1TLEmPm8Yjvynb3rikJ0PItXUNPlk/p0YMex37B/wfkJveNcwB0e3Wh9ek5WElssz4/qNkvLQ443NiDlGE2srSZ7IvdGKpeHomWdAtWSEjJlCS1R6S7WKwCZUHHdli2PfIbZnczFh1iUtLrr4rcs=;
X-UUID: a9211fb86025405f98e2290d35939a80-20200510
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 125597628; Sun, 10 May 2020 22:12:27 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 10 May 2020 23:02:25 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 May 2020 14:00:50 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 11 May 2020 14:00:50 +0800
Message-ID: <1589176850.21832.7.camel@mtksdaap41>
Subject: Re: [PATCH v14 01/11] dt-bindings: mediatek: Add property to mt8183
 smi-common
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Date: Mon, 11 May 2020 14:00:50 +0800
In-Reply-To: <7165ec9f-03ca-3020-2c34-246465094c46@collabora.com>
References: <1588752963-19934-1-git-send-email-weiyi.lu@mediatek.com>
 <1588752963-19934-2-git-send-email-weiyi.lu@mediatek.com>
 <7165ec9f-03ca-3020-2c34-246465094c46@collabora.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: E8D7064CEC30C202B634F9239908F66108878567A329A3426389968E2E92D1EB2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200510_231233_851249_50ACE121 
X-CRM114-Status: GOOD (  13.46  )
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
Cc: James Liao <jamesjj.liao@mediatek.com>,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com, Rob
 Herring <robh@kernel.org>, Enric Balletbo Serra <eballetbo@gmail.com>,
 linux-kernel@vger.kernel.org, Fan Chen <fan.chen@mediatek.com>,
 devicetree <devicetree@vger.kernel.org>, linux-mediatek@lists.infradead.org,
 Sascha Hauer <kernel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Wed, 2020-05-06 at 22:59 +0200, Enric Balletbo i Serra wrote:
> Hi Weiyi,
> 
> Thank you for your patch. Don't forget to cc <devicetree@vger.kernel.org>,
> otherwise this patch could be silently ignored.
> 

Thank you for reminding!

> On 6/5/20 10:15, Weiyi Lu wrote:
> > For scpsys driver using regmap based syscon driver API.
> > 
> > Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> > ---
> >  .../devicetree/bindings/memory-controllers/mediatek,smi-common.txt      | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.txt b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.txt
> > index b478ade..01744ec 100644
> > --- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.txt
> > +++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.txt
> > @@ -20,7 +20,7 @@ Required properties:
> >  	"mediatek,mt2712-smi-common"
> >  	"mediatek,mt7623-smi-common", "mediatek,mt2701-smi-common"
> >  	"mediatek,mt8173-smi-common"
> > -	"mediatek,mt8183-smi-common"
> > +	"mediatek,mt8183-smi-common", "syscon"
> >  - reg : the register and size of the SMI block.
> >  - power-domains : a phandle to the power domain of this local arbiter.
> >  - clocks : Must contain an entry for each entry in clock-names.
> > 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
