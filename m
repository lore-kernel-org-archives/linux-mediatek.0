Return-Path: <SRS0=MDtk=CY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 627E0C433E2
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 03:44:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2ACD206E6
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 03:44:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="z+Jx/V57";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="lfMy1gQD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2ACD206E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wZAiXvOXzvK4HbamYPE+P6Wwb90xGIX85LWjhuZsrCQ=; b=z+Jx/V57B8m8bepWOnAb68L6R
	h212P/6lCohV9gFFK3+uTuvuWWjeaAAVNeaxlfX5zH3kDUgxi8ab7Pf+GHuzWauOWcLT5nvCLBKRY
	hF1TbKKg21cJA30Pgc5lihUykSo+ZyOgrSQ0DFDvCTscmRTLwuaYflTWwk0ngvy2N3Iu7affbFbS/
	57yC6WJFuAQoJblu9J8FCnJTxtnQjuBLAXuCaCVHMigiJLzOW4xy0ZyNPPuyZduh3DbI1Nnw4uzUK
	bh1xrMkAjTXyRQs/kCxGKWN6OhRffpdj35za6m16IXwKtf5TzOjl3PN3O1Wn96hbEFabc1QZS9Xe8
	Ap02s0zDg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kI1t8-0005FZ-Ku; Tue, 15 Sep 2020 03:44:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kI1t0-0005Ed-PH; Tue, 15 Sep 2020 03:44:10 +0000
X-UUID: 63ee2a5f73b74932b818db07dd2f1fb5-20200914
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=e7VCiFQWW+PR2PnxBr/7WIVRIQLNMrXTM4xDesaHqu4=; 
 b=lfMy1gQD+FiyMkCQKDGUa8FYWJImtIMww65tFt7hGEYGggFTcpGbxIkoyPUxWt0v8vK9lCYeyFMiI1WtcpaNHhrCTjNaaECZocJjTvHK4L/dhhUQDaA9d5EQ7DA5WiautwPblPRJ79Srk+4TWZHbUZ7IPd4QFxj2X/9uAV7pIhg=;
X-UUID: 63ee2a5f73b74932b818db07dd2f1fb5-20200914
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <henryc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1888952130; Mon, 14 Sep 2020 19:39:53 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Sep 2020 20:39:51 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Sep 2020 11:39:43 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 15 Sep 2020 11:39:45 +0800
Message-ID: <1600141184.20512.1.camel@mtksdaap41>
Subject: Re: [PATCH V5 14/17] dt-bindings: regulator: add DVFSRC regulator
 dt-bindings
From: Henry Chen <henryc.chen@mediatek.com>
To: Mark Brown <broonie@kernel.org>
Date: Tue, 15 Sep 2020 11:39:44 +0800
In-Reply-To: <20200914123202.GD4821@sirena.org.uk>
References: <1600052684-21198-1-git-send-email-henryc.chen@mediatek.com>
 <1600052684-21198-15-git-send-email-henryc.chen@mediatek.com>
 <20200914123202.GD4821@sirena.org.uk>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 503A49E5AA385D9FB5B504DB958E963F5563C911A4C3A6801E155064FBF267932000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_234407_062840_EDB5246D 
X-CRM114-Status: GOOD (  11.86  )
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
 Turquette <mturquette@linaro.org>, James Liao <jamesjj.liao@mediatek.com>,
 Viresh Kumar <vireshk@kernel.org>, linux-pm@vger.kernel.org,
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

On Mon, 2020-09-14 at 13:32 +0100, Mark Brown wrote:
> On Mon, Sep 14, 2020 at 11:04:41AM +0800, Henry Chen wrote:
> 
> >  		clocks = <&infracfg CLK_INFRA_DVFSRC>;
> >  		clock-names = "dvfsrc";
> >  		#interconnect-cells = <1>;
> > +		dvfsrc-regulator {
> > +			compatible = "mediatek,mt8183-dvfsrc-regulator";
> 
> This device has only one possible parent, why does it need a compatible
> string?

Sorry, that was a mistake, it will be removed on next version.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
