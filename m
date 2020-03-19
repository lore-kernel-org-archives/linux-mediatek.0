Return-Path: <SRS0=inF0=5E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB666C4332D
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Mar 2020 08:25:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BF4920714
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Mar 2020 08:25:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MlBYVFvD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="tZDNpEGq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BF4920714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Aq9JQ3CtxqcYdQj5AvJ8aHUdPX+HuL0iJF+JfouHdHE=; b=MlBYVFvDdX1+p0
	1XcsioZe3H82eOIivOz/qNDX5qCRcyowpgapD1n+sviYiMoPthuF7lxTphsy51T6A8fqlw+VM1x3I
	5qPB3DXdmTIz0Lolivrdr6AeRnoZNYmjNJ3RMOK/JuSg+CxIewu3OQi7CGcPaTc1iik9tItSfzcbz
	hTyvS2P5PBeJ/Kj8gw9PHn1mEtkplEQxZPIlk7ltb8oiHB/z2uNVDYzV4a0dipXkHPJ22n9+z0a0X
	ZjkUQniDyT5IJ29MbTCKa8aAyxV32VHuxj+qc1e6fc3AzqinM76X2Bws0EiwQI3If+CD33vFm0ziC
	zHzGjAQ5uAV2T4NjH7mg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEqUh-0007AR-EN; Thu, 19 Mar 2020 08:25:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEqUf-00079q-3q
 for linux-mediatek@lists.infradead.org; Thu, 19 Mar 2020 08:25:34 +0000
X-UUID: aee97f8f2f3d450d97b8871b5ab748fb-20200319
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=iRLB6NyH9Dw1QuDRyGg/3cbLaE61cSAcOzKDspWyGNs=; 
 b=tZDNpEGqVCYzt4s6Ta8FMslDEjhsfLKenpIpG0WqmM+iy/ZJqOSXANY4Wax7178gpFgjOw+bBbjgFeXEXEOiG20Rdz1Fx9bEpqWxiRpEeEeLltgbTBG4gUZcfYFRR4vjAcCec0grVhnDO3DXzv3k6nDGiz71Iy9gnHxkSGf7Q24=;
X-UUID: aee97f8f2f3d450d97b8871b5ab748fb-20200319
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <hanks.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1823255719; Thu, 19 Mar 2020 00:25:26 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 19 Mar 2020 01:25:26 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 19 Mar 2020 16:24:01 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 19 Mar 2020 16:25:36 +0800
Message-ID: <1584606301.29104.2.camel@mtkswgap22>
Subject: Re: [PATCH v3 1/6] dt-bindings: pinctrl: add bindings for MediaTek
 MT6779 SoC
From: Hanks Chen <hanks.chen@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Thu, 19 Mar 2020 16:25:01 +0800
In-Reply-To: <20200318223842.GA31707@bogus>
References: <1584454007-2115-1-git-send-email-hanks.chen@mediatek.com>
 <1584454007-2115-2-git-send-email-hanks.chen@mediatek.com>
 <20200318223842.GA31707@bogus>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200319_012533_163548_9939EC7F 
X-CRM114-Status: GOOD (  13.43  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 wsd_upstream@mediatek.com, Andy Teng <andy.teng@mediatek.com>, Linus
 Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-03-18 at 16:38 -0600, Rob Herring wrote:
> On Tue, 17 Mar 2020 22:06:42 +0800, Hanks Chen wrote:
> > From: Andy Teng <andy.teng@mediatek.com>
> > 
> > Add devicetree bindings for MediaTek MT6779 pinctrl driver.
> > 
> > Change-Id: I92586369564948f2628f70421bcd70668f132c4f
> > Signed-off-by: Andy Teng <andy.teng@mediatek.com>
> > ---
> >  .../bindings/pinctrl/mediatek,mt6779-pinctrl.yaml  |  208 ++++++++++++++++++++
> >  1 file changed, 208 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> warning: no schema found in file: Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml: ignoring, error parsing file
> Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml:  while parsing a block collection
>   in "<unicode string>", line 28, column 5
> did not find expected '-' indicator
>   in "<unicode string>", line 29, column 5
> Documentation/devicetree/bindings/Makefile:12: recipe for target 'Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.example.dts' failed
> make[1]: *** [Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.example.dts] Error 1
> Makefile:1262: recipe for target 'dt_binding_check' failed
> make: *** [dt_binding_check] Error 2
> 
> See https://patchwork.ozlabs.org/patch/1256429
> Please check and re-submit.
> 

My bad, should update the format. will do in v4.

Thanks for reviewing.


> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
