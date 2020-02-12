Return-Path: <SRS0=vX0G=4A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8401C3B186
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Feb 2020 06:09:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CBA2206ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Feb 2020 06:09:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nyTwpVKw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="QqKpIGph"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CBA2206ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gelu27GLuV2zjg3qai/Nx7HcHQbMJkcSHqGmpiCE338=; b=nyTwpVKwZ19Gc1
	VHaQR3xxLmEE+6q2oQpMrXE2UNm+2xrFQy8LpHsU1ics4nOcFS08jH8ccAPHycs8QrdwpP6aGKHzk
	oE7EKQ+qbsvOWCbROEPkdLrSJFVR2WNm65IbuQ6gfngW0SgR+NgaDU5ELa6fFbOH/4hTug78Z/0KU
	oYCb3FxzW02z1DFsLmphVxgo6YTXEhGK5fBtunfHc6L+QS+vbSxCuX7H0WBLxy2nC/i72TGdhqvSD
	YnAyyg33Tm1W0sv8XPzLIyWtfmAgB0IIiYjBWteAbuXOTpvexvqonbF6kJAVwluutvyHntw/IioK3
	+RUaRxkoz02289o/EIUw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1lCc-0008Ik-75; Wed, 12 Feb 2020 06:08:50 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1lCZ-0008Hg-GJ; Wed, 12 Feb 2020 06:08:48 +0000
X-UUID: 02cfdfdb75fd443d980a362fbdc763d7-20200211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=SWD5TohyT5cMPrdmmo17mXTsqaC7XRDeHZDf6wxl7cY=; 
 b=QqKpIGphIjGohnCyD8IAS+Rvhp6QiGtoKfw21hkpiSgyk0/ISqf3VfrZaZ0I6USNo/u1GDfCNekz+hx3EDXSorL0F2XISXUewfRUb/mRQ2mdNoeFC+kjaX+gkfWQVISej/+WmlJL94L75bGKmyFJ+VvlCm/JQ42qz88verQ3d2c=;
X-UUID: 02cfdfdb75fd443d980a362fbdc763d7-20200211
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <wen.su@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1518914913; Tue, 11 Feb 2020 22:08:43 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 11 Feb 2020 22:08:51 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 12 Feb 2020 14:07:53 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 12 Feb 2020 14:08:49 +0800
Message-ID: <1581487721.16783.9.camel@mtkswgap22>
Subject: Re: [PATCH v2 1/4] dt-bindings: regulator: Add document for MT6359
 regulator
From: Wen Su <Wen.Su@mediatek.com>
To: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Date: Wed, 12 Feb 2020 14:08:41 +0800
In-Reply-To: <8398188f-820a-5abf-f52e-b79c0c583704@gmail.com>
References: <1580958411-2478-1-git-send-email-Wen.Su@mediatek.com>
 <1580958411-2478-2-git-send-email-Wen.Su@mediatek.com>
 <20200206114927.GN3897@sirena.org.uk> <1581335854.16783.1.camel@mtkswgap22>
 <8398188f-820a-5abf-f52e-b79c0c583704@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200211_220847_551677_B8904F32 
X-CRM114-Status: GOOD (  15.19  )
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
 wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, 

On Tue, 2020-02-11 at 17:06 +0100, Matthias Brugger wrote:
> 
> On 10/02/2020 12:57, Wen Su wrote:
> > Hi, 
> > 
> > On Thu, 2020-02-06 at 11:49 +0000, Mark Brown wrote:
> >> On Thu, Feb 06, 2020 at 11:06:48AM +0800, Wen Su wrote:
> >>
> >>> +Required properties:
> >>> +- compatible: "mediatek,mt6359-regulator"
> >>
> >> Why does this need a compatible string - it looks like it's just
> >> encoding the way Linux splits devices up into the DT, not
> >> providing some reusable IP block.
> > 
> > Thanks for your comments.
> > I will remove it in the next patch.
> > 
> 
> If this the way to go, then please fix all the other MediaTek binding
> description for regulators (+ the dts) as this is then wrong.
> Thanks!
> Matthias

The mt6359-regulator driver is still a reusable IP block.It could be
adding more other MediaTek pmic mt6359 similar compatible device. But
currently this patch only testing on pmic mt6359.
Is it allowable to keep compatible string in binding description ?

Thanks

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
