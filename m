Return-Path: <SRS0=AAZc=AL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44FC6C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 03:57:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0ABFE206BE
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 03:57:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="y/C1Ca+A";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="PGUP9isY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0ABFE206BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AMPfqXH7zdytAfllMh7YG8ddcN0gROS4gI2uKRZgpTw=; b=y/C1Ca+A66el4LXvjwox+xxc2
	hBsIXi+f+Qai4+4FKTFJsGhupE6vBADZ2TkBgMeHdI4hHI/ddN73BLFLioHES/gdlZzbcKk5kQacW
	1oe23plZjD4YB2jedCEo2BAdNs+A8fkO9rnitMqPNv2uKLGYPg/OwcM84sA5rwhV6ySQLVsP+3L07
	Uda1xjeiINrrrttXc1u1h08J/SG08QNpkbPsX8qVPzcEC6JPXMFUQe09h4+elCsZoX8YLpwebszDw
	5+iwAiJapMqmwK5mbxqilshN/WIFuoPBAEKkfb2lzku2Q91alikCtP3YEHaq+3EtwOmihedtef472
	oGFncnemw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jq7OR-00006O-Fa; Tue, 30 Jun 2020 03:57:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jq7ON-000058-BE; Tue, 30 Jun 2020 03:57:08 +0000
X-UUID: 9dc31f8e462843389da1ac8418ec5481-20200629
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=4lUxsw7V57/rtfRfCgvAn7FcvMGUUtdcRvghF/iSYBM=; 
 b=PGUP9isYSLXgVE94dGfV09wr2suqppJLTq5ls9fhkpFM5nD8P4AgWooGath4CBESIm81MFRE+RKHwF1A/AXde7a2ISp1RBN6ljJwN4aAyWbAOQk0zdvVuk/+tsXZtboDihm/S3Mi2NBmjiwC4MZzvbVdbPJuUYTI4Ho6gsLk3Rc=;
X-UUID: 9dc31f8e462843389da1ac8418ec5481-20200629
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <hanks.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1449131258; Mon, 29 Jun 2020 19:56:56 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 29 Jun 2020 20:56:55 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 30 Jun 2020 11:56:46 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 30 Jun 2020 11:56:47 +0800
Message-ID: <1593489406.20357.3.camel@mtkswgap22>
Subject: Re: [PATCH v6 1/7] dt-bindings: pinctrl: add bindings for MediaTek
 MT6779 SoC
From: Hanks Chen <hanks.chen@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Tue, 30 Jun 2020 11:56:46 +0800
In-Reply-To: <20200629215331.GA2991039@bogus>
References: <1592480018-3340-1-git-send-email-hanks.chen@mediatek.com>
 <1592480018-3340-2-git-send-email-hanks.chen@mediatek.com>
 <20200629215331.GA2991039@bogus>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: ADC1B506D8928896ABE48FDF843DCAE64088D056FDD7FFEC2981FE32960985E62000:8
X-MTK: N
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
Cc: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 CC Hwang <cc.hwang@mediatek.com>, wsd_upstream@mediatek.com,
 Stephen Boyd <sboyd@kernel.org>, Andy Teng <andy.teng@mediatek.com>, Michael
 Turquette <mturquette@baylibre.com>, Sean Wang <sean.wang@kernel.org>, Loda
 Chou <loda.chou@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 mtk01761 <wendell.lin@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-06-29 at 15:53 -0600, Rob Herring wrote:
> On Thu, 18 Jun 2020 19:33:32 +0800, Hanks Chen wrote:
> > From: Andy Teng <andy.teng@mediatek.com>
> > 
> > Add devicetree bindings for MediaTek MT6779 pinctrl driver.
> > 
> > Signed-off-by: Andy Teng <andy.teng@mediatek.com>
> > ---
> >  .../bindings/pinctrl/mediatek,mt6779-pinctrl.yaml  |  210 ++++++++++++++++++++
> >  1 file changed, 210 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
> > 
> 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.example.dts:21:18: fatal error: dt-bindings/pinctrl/mt6779-pinfunc.h: No such file or directory
>          #include <dt-bindings/pinctrl/mt6779-pinfunc.h>
>                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> scripts/Makefile.lib:315: recipe for target 'Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.example.dt.yaml' failed
> make[1]: *** [Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.example.dt.yaml] Error 1
> make[1]: *** Waiting for unfinished jobs....
> Makefile:1347: recipe for target 'dt_binding_check' failed
> make: *** [dt_binding_check] Error 2
> 
> 
> See https://patchwork.ozlabs.org/patch/1312018
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure dt-schema is up to date:
> 
> pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade
> 
> Please check and re-submit.
> 
I already ran the dt_binding_check and it looks good.

> 
> 
> Here, you need patch 2 to come first or merge it into this patch as it 
> is part of the binding.
> 
I'll merge it into this patch in next version.
Thank you for your comment.

Hanks

> Rob
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
