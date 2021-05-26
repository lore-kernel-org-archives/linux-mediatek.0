Return-Path: <SRS0=P9v4=KV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A47FC4707F
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 May 2021 01:45:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AC8D61429
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 May 2021 01:45:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8AC8D61429
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9nVbtDUz1ASkv42tFnA+t6lQHJufmo9yUOlmwF0chPg=; b=SnA1l3vN8XriUe
	koKfucT2BTz1ZNOPtQCr3pnRRzjXgkjEf1UpbnDak6Peg56cT/RsLQRrwNuKH79J+KuTlpABW5Kah
	9S9yecuWvYT6c4iorAvWGvotneIQwV8m8FNo5/FF422tyMNHHfJ+dhPbpdnaxdS+PWpGft2P6YROg
	vYtkj5lOKHyzJO0ROf7NT3GWDDWvVXHInb4kcIpZH0BbazYEqS+QWXyBTdiHJQ6Ya69OwdVbykudB
	Emv9MtTrCtesK8DtDxZ/HkqHAfU8ZRXqgZCO/1sYzUaiq9zvu67AibAk2IDNgp6LKhrmIKRI+0HAN
	Qosy+7Zu56ADI38ldZEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llibg-009sjq-9q; Wed, 26 May 2021 01:45:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llibV-009sdw-TA; Wed, 26 May 2021 01:45:10 +0000
X-UUID: 8cb6f537cdd840a7a51f5f423da3fa9f-20210525
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=NmtG8PtbQGS64/5D4XTWx2C/g8jAAgXP164fQIUW45A=; 
 b=Q9E5cXo9aXD6XSawc5MLK/h9cgswAyrIzSrBuUsr4SankYVwMq1p+7WuVU1GvZm00DyvwIEF1i6ugCuAzbftnG6yZKK4fpWiLM2e/i4V0Qw/OXTWriT9AGaSthd04nOCEAc7r/H731G93Uy5y/ObPWQKCrtAO4j4j8aE/BQBe5Q=;
X-UUID: 8cb6f537cdd840a7a51f5f423da3fa9f-20210525
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 552885127; Tue, 25 May 2021 18:44:58 -0700
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 May 2021 18:44:56 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 26 May 2021 09:44:48 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 26 May 2021 09:44:48 +0800
Message-ID: <1621993487.26501.19.camel@mhfsdcap03>
Subject: Re: [PATCH v2 3/3] Revert "usb: common: usb-conn-gpio: Make VBUS
 supply optional"
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Thierry Reding <treding@nvidia.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Paul Cercueil <paul@crapouillou.net>, Lee Jones
 <lee.jones@linaro.org>, <linux-usb@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Date: Wed, 26 May 2021 09:44:47 +0800
In-Reply-To: <YKzhPnMU3PXx+tXK@orome.fritz.box>
References: <1621406386-18838-1-git-send-email-chunfeng.yun@mediatek.com>
 <1621406386-18838-3-git-send-email-chunfeng.yun@mediatek.com>
 <YKezl0nlWFQhLyf/@orome.fritz.box> <1621835511.26501.14.camel@mhfsdcap03>
 <YKzhPnMU3PXx+tXK@orome.fritz.box>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: DBEF9475E366CD9EE010AAD1B760E5197873115102002DEC0FB5709042E1CFEF2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_184508_298564_9B0CD7DD 
X-CRM114-Status: GOOD (  35.33  )
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

On Tue, 2021-05-25 at 13:36 +0200, Thierry Reding wrote:
> On Mon, May 24, 2021 at 01:51:51PM +0800, Chunfeng Yun wrote:
> > On Fri, 2021-05-21 at 15:20 +0200, Thierry Reding wrote:
> > > On Wed, May 19, 2021 at 02:39:46PM +0800, Chunfeng Yun wrote:
> > > > Vbus is already an optional supply, if the vbus-supply is not
> > > > provided in DTS, will use a dummy regulator,
> > > 
> > > That statement is not entirely correct. The dummy regulator is
> > > substituted only if the supply is in fact not optional. The idea behind
> > > that is to allow DTS files that don't specify all required regulators to
> > > get away with it, based on the assumption that the supply is one of
> > > those always-on supplies that are often not described in DTS.
> > Yes, you are right.
> > But from the point of result, it indeed can help to handle the absent
> > regulator.
> > > 
> > > > the warning log is as below:
> > > > "supply vbus not found, using dummy regulator"
> > > 
> > > And the reason why we get that warning is to point out that the DTS has
> > > a bug and that it should be fixed (by adding a proper regulator to take
> > > the place of the dummy).
> > > 
> > > > This reverts commit 4ddf1ac79e5f082451cd549283d2eb7559ab6ca9.
> > > 
> > > But if you read the description of that commit, the purpose of that
> > > patch was in fact to make the supply completely optional in the case
> > > where we already have the VBUS supply specified for the USB port that
> > > the connector is parented to.
> > Could you please give an example you mentioned?
> 
> You can find examples of this in these:
> 
> 	arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
> 	arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
> 	arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
> 
> > It seems prefer to provide vbus supply in connector instead of port
> > according to dt-binding
> 
> My recollection is that the above (or at least some of them) predate USB
> connectors.
> 
> It's possible that we could convert the above to have the VBUS supply
> listed in the connector instead of the port. However, since we have to
> preserve backwards compatibility with older device trees, we can't
> revert the commit anyway.
Got it, thanks a lot

> 
> Thierry

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
