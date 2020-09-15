Return-Path: <SRS0=MDtk=CY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70305C43461
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 03:45:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB1E5206E6
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 03:45:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ghC8l+/n";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="A1upKMC3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB1E5206E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dkn95uPFNcYiV8KV+PHoBIsGOrpvpaDLbovRK6/dmxA=; b=ghC8l+/nqAH7NKk/43jvXpYKK
	hg51EmKoaKvuvBdj1goDgowFCKhauJV1NN2wUOJPuvapuD0jn3oD2ceqTNShuodIXihG9pp6NVO7S
	8aRLWNYDPqw05zd/4HY/VRD7ibiJP7zGXHALXjdBtP9QxdXOcSQM69OD1b9G+7ZZof8rZ9xLrtkHT
	L8Aqyb9kwVb1z+d1hfnSoOCkBmup3WAQXfoembpXCp8AaF0G9GdL9Nck013YyTMDWPDk5qaOEC8sQ
	baDBmX4jlXJiDdEzk2VgxqN29D4KiuY2tex/Bv8eFqDv+abfBK2TdZGApJOBQG/rCOLgpwX+VDgK2
	6MtaulKqA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kI1uA-0005Mx-1D; Tue, 15 Sep 2020 03:45:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kI1u5-0005Ly-L0; Tue, 15 Sep 2020 03:45:14 +0000
X-UUID: a7503cbf93ad4733b43bf99bf150c359-20200914
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=fjtaVNlKqWQZ+nDwPY/kGe7L/DsU5VQfgkfZJC8M/FI=; 
 b=A1upKMC3KCgfJrS5hyTQEz1+yh4EwYK5XFegorqzDWhZVH0R1Q4uwTyhyJmWZh6M57tc/S+iukDi0Hl9q3RQTz7NPf0cgth/OUJrgCAM7WZZDuKKWm49gBnxGOGvqBm7QlOtEd7Nlhl2lbtpvecDVM/4tuoaSB6/4z3PoNfjmZo=;
X-UUID: a7503cbf93ad4733b43bf99bf150c359-20200914
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <henryc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1926335980; Mon, 14 Sep 2020 19:45:10 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Sep 2020 20:45:07 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Sep 2020 11:44:55 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 15 Sep 2020 11:44:56 +0800
Message-ID: <1600141495.20512.5.camel@mtksdaap41>
Subject: Re: [PATCH V5 15/17] regulator: Regulator driver for the Mediatek
 DVFSRC
From: Henry Chen <henryc.chen@mediatek.com>
To: Mark Brown <broonie@kernel.org>
Date: Tue, 15 Sep 2020 11:44:55 +0800
In-Reply-To: <20200914123444.GE4821@sirena.org.uk>
References: <1600052684-21198-1-git-send-email-henryc.chen@mediatek.com>
 <1600052684-21198-16-git-send-email-henryc.chen@mediatek.com>
 <20200914123444.GE4821@sirena.org.uk>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_234513_877920_55AEF6A4 
X-CRM114-Status: GOOD (  17.45  )
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

Hi Mark,

Thank you for reviewing.

On Mon, 2020-09-14 at 13:34 +0100, Mark Brown wrote:
> On Mon, Sep 14, 2020 at 11:04:42AM +0800, Henry Chen wrote:
> 
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2019 MediaTek Inc.
> > + */
> 
> Please make the entire comment a C++ one so things look more
> intentional, and are you sure about that copyright date?
Ok, it will be modified on next version.
> 
> > +static int dvfsrc_set_voltage_sel(struct regulator_dev *rdev,
> > +				  unsigned int selector)
> > +{
> > +	struct device *dvfsrc_dev = to_dvfsrc_dev(rdev);
> > +	int id = rdev_get_id(rdev);
> > +
> > +	switch (id) {
> > +	case DVFSRC_ID_VCORE:
> > +		mtk_dvfsrc_send_request(dvfsrc_dev,
> > +					MTK_DVFSRC_CMD_VCORE_REQUEST,
> > +					selector);
> > +	break;
> > +	case DVFSRC_ID_VSCP:
> > +		mtk_dvfsrc_send_request(dvfsrc_dev,
> > +					MTK_DVFSRC_CMD_VSCP_REQUEST,
> > +					selector);
> > +	break;
> 
> Just have two separate operations rather than the switch statement, and
> where you do have switch statements please follow the kernel coding
> style.

Ok, it will be modified on next version.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
