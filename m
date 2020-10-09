Return-Path: <SRS0=0dL+=DQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFE5DC433DF
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Oct 2020 03:42:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEA572064C
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Oct 2020 03:42:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1d8+xvFT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="IoCv8G/j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DEA572064C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zmhlCTDU0uPiCk7ZojEyQs/9Fj1KHL2tGhYT2rQgFTo=; b=1d8+xvFTBpO00uMr5ZCMfllgb
	xzSedRX/69NOWJnLSY7rKIbfcRMQ1+TkRQDg3E/mb1TECqmTN24hUsZRxE4AqnkfalpNvvKE5b9mS
	h/8UwLXZIEtpB4x9JbwNUWa+Znznk2ZfvdbOJ4Ef5Y56cnQDHvq0+NeVaU3Kh87gS12f4xpg9YSi7
	OqQBKsnbo1TP3+jPiRI6ETLnZJifeuZ3JefeP12EieeK24stFNCDDIjjUqXOJ6EWmCBdG7FNdgsco
	9gGjhO2FqGnz3uOC5XCg0ZQ0uPjyr8dT6V3VD3QaQjKpPF3wQth3EqY1CXjDU1X48/8MIi66zkmpp
	UfCk4+6eA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQjIO-0004SX-Be; Fri, 09 Oct 2020 03:42:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQjIL-0004S4-Fa; Fri, 09 Oct 2020 03:42:15 +0000
X-UUID: ecf71eaa787a4d0fbdee37ba2edea43c-20201008
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=1HaRwt9KZRuG82gLiMzWVii7cTKcFQ+KMRXeg2N/U/U=; 
 b=IoCv8G/jtIq6OJWcXSdQKwI6gNRtVFKOcU5Q6vwRUpHINNklfH5wPI3VWjGOmFfRFSSM8GQ6TcOkE1YUUACLI3fSxCtCvc+PDm4p15HexmJjldgHMHQHvD2VIrMkHmmdBx1frLG0+uc6vTdwqBchvqFraBf2XmMhiecknJQcGQs=;
X-UUID: ecf71eaa787a4d0fbdee37ba2edea43c-20201008
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <crystal.guo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1573013780; Thu, 08 Oct 2020 19:42:09 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 8 Oct 2020 20:32:07 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs07n2.mediatek.inc
 (172.21.101.141) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 9 Oct 2020 11:32:04 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 9 Oct 2020 11:32:03 +0800
Message-ID: <1602214325.14806.49.camel@mhfsdcap03>
Subject: Re: [v5,2/4] dt-binding: mediatek: mt8192: update mtk-wdt document
From: Crystal Guo <crystal.guo@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, "linux@roeck-us.net"
 <linux@roeck-us.net>, Wim Van Sebroeck <wim@linux-watchdog.org>
Date: Fri, 9 Oct 2020 11:32:05 +0800
In-Reply-To: <2199f623-ebfc-3585-2248-6698aef57d7b@gmail.com>
References: <20200929032005.15169-1-crystal.guo@mediatek.com>
 <20200929032005.15169-3-crystal.guo@mediatek.com>
 <2199f623-ebfc-3585-2248-6698aef57d7b@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201008_234213_955980_CB041266 
X-CRM114-Status: GOOD (  17.48  )
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
Cc: "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 Seiya Wang =?UTF-8?Q?=28=E7=8E=8B=E8=BF=BA=E5=90=9B=29?=
 <seiya.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-10-02 at 17:28 +0800, Matthias Brugger wrote:
> 
> On 29/09/2020 05:20, Crystal Guo wrote:
> > update mtk-wdt document for MT8192 platform
> > 
> > Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
> > Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> > Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> 
> You added Guenters Reviewed-by in v4 of this series, but I don't see that on 
> Guenter provided this tag. In the future please make sure that you don't add 
> tags to your patches that were not provided. This creates great confusion.
> 
> Regards,
> Matthias
> 

Hi Guenter,

Should I remove the "Reviewed-by:Guenter" tag, and re-submit this patch
for your review, or keeping the status quo and wait for Wim's comment?

Thanks
Crystal
> > ---
> >   Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> > index 45eedc2c3141..e36ba60de829 100644
> > --- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> > +++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> > @@ -12,6 +12,7 @@ Required properties:
> >   	"mediatek,mt7629-wdt", "mediatek,mt6589-wdt": for MT7629
> >   	"mediatek,mt8183-wdt": for MT8183
> >   	"mediatek,mt8516-wdt", "mediatek,mt6589-wdt": for MT8516
> > +	"mediatek,mt8192-wdt": for MT8192
> >   
> >   - reg : Specifies base physical address and size of the registers.
> >   
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
