Return-Path: <SRS0=Fjxk=5P=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1209C43331
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Mar 2020 05:29:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 937F920658
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Mar 2020 05:29:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UhFeD1ON";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="H51wOSB4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 937F920658
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nK+XlgFXA+VO5u9AsQcC1vdoSUwfAsAumQfSUcPSNdk=; b=UhFeD1ONT+mAYO
	NG2CQ0TTeLcSUwTfS1siyRixlMN1jeM/VIVaVPH2hF0Xc+vFJh1f/K+c62Ej2+y85AkJUasd/secy
	bXACxMJ0gz8QixH5Ey1JJxfYBJf5+NKvto6VBdrBKRwu5knM0niOTUZIQJ1q43XWbxdCbGopJr0F2
	XsaDsBdNigRo1jgeGmiiZ121LnW98nCncogn83l5t+45WvTwjiexf1vrjfww+//mQdknV13vFOeSo
	waIRCT4mG3jdQJX51g6262mWeIW7ZdaCw1DbYNCQZWmXiaMD79vKTVEp+d9PZxPLTX1OU+65Ki9nI
	nHwBpEMglSHq5u4Z9zHg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jImzG-0005wO-5m; Mon, 30 Mar 2020 05:29:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jImzD-0005vK-Aj; Mon, 30 Mar 2020 05:29:24 +0000
X-UUID: f3a29c61eb084a12ab1b431c99f02901-20200329
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=PiWLw0TeG7GcgBMd5OgryJCpKyO8lgrXQHDKaqgPG58=; 
 b=H51wOSB4E8IfmA8XEkPuCE4rb6zVrbPrgRG7NerAS16eswoZuZgmsBARj6W8ThUSXXAKCZSRNlHf77IQsb1QfsjsVqVy/q4wIKsHIie6dIkpwrxtcPhdUfv/zkse4bpy1kBhyRdQzj5lKUEL6gxH2Rw8LIgDyt6AsteDnWyAONc=;
X-UUID: f3a29c61eb084a12ab1b431c99f02901-20200329
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <henryc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2131870764; Sun, 29 Mar 2020 21:29:18 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 29 Mar 2020 22:19:14 -0700
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 30 Mar 2020 13:19:12 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 30 Mar 2020 13:19:11 +0800
Message-ID: <1585545553.32635.10.camel@mtksdaap41>
Subject: Re: [PATCH V4 11/13] dt-bindings: regulator: add DVFSRC regulator
 dt-bindings
From: Henry Chen <henryc.chen@mediatek.com>
To: Mark Brown <broonie@kernel.org>
Date: Mon, 30 Mar 2020 13:19:13 +0800
In-Reply-To: <20200324203833.GL7039@sirena.org.uk>
References: <1584092066-24425-1-git-send-email-henryc.chen@mediatek.com>
 <1584092066-24425-12-git-send-email-henryc.chen@mediatek.com>
 <20200324203833.GL7039@sirena.org.uk>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200329_222923_384171_3291FA38 
X-CRM114-Status: GOOD (  12.76  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Nicolas
 Boichat <drinkcat@google.com>, Mike
 Turquette <mturquette@linaro.org>, srv_heupstream@mediatek.com,
 James Liao <jamesjj.liao@mediatek.com>, Viresh
 Kumar <vireshk@kernel.org>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 Fan Chen <fan.chen@mediatek.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Ryan Case <ryandcase@chromium.org>,
 Arvin Wang <arvin.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Georgi Djakov <georgi.djakov@linaro.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Mark,
On Tue, 2020-03-24 at 20:38 +0000, Mark Brown wrote:
> On Fri, Mar 13, 2020 at 05:34:24PM +0800, Henry Chen wrote:
> 
> > +- regulator : The DVFSRC regulator is modelled as a subdevice of the DVFSRC.
> > +	Because DVFSRC can request power directly via register read/write, likes
> > +	vcore which is a core power of mt8183. As such, the DVFSRC regulator
> > +	requires that DVFSRC nodes be present. shall contain only one of the
> > +	following: "mediatek,mt8183-dvfsrc-regulator"
> 
> Why do we even need a compatible here - it's not adding any new
> information to the parent mt8183 node, the compatible is mainly for the
> way Linux divides things up rather than a description of the hardware.
> We could just say that the regulator node always has a particular name
> instead.
Sorry, not quite sure what you mean, because I think DVFSRC is a
regulator provider that can provide vcore voltage control on mt8183, and
it can provide more power control in the next generation Mediatek SOC.
Here I add a sub-node to describe it. Or should I move this node to
regulator folder? 

> 
> It's also not quite true that it contains "only" the compatible - it
> also allows the regulator constraints to be defined.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
