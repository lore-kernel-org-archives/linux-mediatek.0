Return-Path: <SRS0=Gkfw=YL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60550CA9EA1
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Oct 2019 09:04:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0975B2064B
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Oct 2019 09:04:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RUK2MJ23"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0975B2064B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lkDwDsFAFAHwgP/+H1u8W1hg/KwMC8rPqqia07tpp6I=; b=RUK2MJ23jZVSYw
	JhMJt6HkYnS4o7HVnd4Ns/svw1epSHMBkccPyE0T2qMM42sLeRQq5xrSZRO7AoQWuHjpvFQvUnQE7
	vNqD1WkXdUHa52Z/CGWFkZ34Z2IF5AhYTnsjxk4a5kbP/LJw0T3d67zp4z7g4e4t50OVFQOBSj7j8
	MsrZi0dWM5hEbp8fGxt/A1IoySF6oGufxFdQAdqAUC+e9uOKPzEUwNJZC/euEnpN8e4ylKyh5q17U
	GiUey/2oQjGN5FXlctlgxun+f1OwLsuhUT6kLoYHbnooNjxebzx0ZvsZQz3qNXJdlyfQLbwEmFrIH
	67JW2PnVYRnUxTJCcSpw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iLOBM-0004TS-Ss; Fri, 18 Oct 2019 09:04:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iLOBK-0004Sw-5F; Fri, 18 Oct 2019 09:04:23 +0000
X-UUID: 49d88b99c4974acbb4cb4873a1345165-20191018
X-UUID: 49d88b99c4974acbb4cb4873a1345165-20191018
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <andrew-sh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 403607067; Fri, 18 Oct 2019 01:03:36 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 18 Oct 2019 02:03:50 -0700
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 18 Oct 2019 17:03:49 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 18 Oct 2019 17:03:50 +0800
Message-ID: <1571389431.27207.4.camel@mtksdaap41>
Subject: Re: [v4, 7/8] cpufreq: mediatek: add opp notification for SVS support
From: andrew-sh.cheng <andrew-sh.cheng@mediatek.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Date: Fri, 18 Oct 2019 17:03:51 +0800
In-Reply-To: <20191017063102.4jirlphdxdydl2bm@vireshk-i7>
References: <1565703113-31479-1-git-send-email-andrew-sh.cheng@mediatek.com>
 <1565703113-31479-8-git-send-email-andrew-sh.cheng@mediatek.com>
 <20190820033927.72muldasu4xd6wb7@vireshk-i7>
 <1571193828.22071.5.camel@mtksdaap41>
 <20191017063102.4jirlphdxdydl2bm@vireshk-i7>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191018_020422_203232_AED68D74 
X-CRM114-Status: GOOD (  12.38  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Nishanth Menon <nm@ti.com>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Fan Chen =?UTF-8?Q?=28=E9=99=B3=E5=87=A1=29?= <fan.chen@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2019-10-17 at 12:01 +0530, Viresh Kumar wrote:
> On 16-10-19, 10:43, andrew-sh.cheng wrote:
> > This is due to SVS feature need to fix Vproc for calibration.
> > When SVS calibration, it want to disable all opp items, except one with
> > voltae 1.0V. (SVS will change the voltage field of that opp item, if the
> > corresponding voltage is not 1.0V)
> > In this way, SVS can make sure there is no other module, include
> > thermal, will change Vproc by DVFS driver.
> > After SVS calibration done, SVS will enable those disabled opp items
> > back.
> 
> But why is this required to be done this way ? Why can't we just update the
> voltages without doing this disable/enable dance ?
> 
This is because some opp items need voltage larger than 1.0V.
We cannot update the voltage to 1.0V.

If we don't disable these opp items, and DVFS policy want to set these
high frequencies, dvfs driver will set higher voltage to Vproc and SVS
calibration will be fail.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
