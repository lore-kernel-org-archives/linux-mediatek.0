Return-Path: <SRS0=x1vn=CR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92ABCC43461
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 05:52:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30D292137B
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 05:52:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ob+e3T+t";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="RtY0yWVr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30D292137B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Eqz5M4vtVvUW3D8PZtxUQOW42FR+wNK+q5dwDnXQk1E=; b=Ob+e3T+tokxjC7RLMJBBGVTGh
	Zhu4yssVjyTOBoFBInbfJhFJ7wKsXyrD1JF0lzrpWWcx1O4fl/aDBx7You1OxuqYuv2xS+JNJGA2G
	DjVj54kwlkXQLtQIqqt2SiKQp78u7FMhoTQTnEolLYJgLnHK7RCiY0dy5bGqHErhxDron6dMzaMQA
	7Bbv5LZswFqIFtKST3QJ+LaPr9ClQ9DJbMjFK1MlDwSqyB4X3e5Y0Zvgo8MCdzTXJu4sV1kWG/Sbn
	UbYhQt4hBhdAHndPNBYR/r8WYcqykUVRtq1GPo+WxhYA9OGRjvF8O8kRyAg0+C5uT8GAH7X9n+utk
	H1Z++OHFQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFWYV-0007hj-EE; Tue, 08 Sep 2020 05:52:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFWYQ-0007gq-2d; Tue, 08 Sep 2020 05:52:31 +0000
X-UUID: 27212379ad8f4a709b57c650c49b9d03-20200907
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=zrrwNcnMPIRlU5Qw4X9J4deUAZZqqjlSu2mS7e67eO4=; 
 b=RtY0yWVrwUzjJg10Cb21GFHewHWBECdQfDstxSFLlq8NR9QxZvOKr+x1uDDpSk3LuWj135bWOMLnRQhPFGlpf/TNFhUbzKVtDh7ilOomp2C8TaFbxfr01xQrD17l/Iozv+7V886ShVZAErx+ylY2mA7mQ5xXIGhG/Dmt7/jz5VY=;
X-UUID: 27212379ad8f4a709b57c650c49b9d03-20200907
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <hector.yuan@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2036512919; Mon, 07 Sep 2020 21:52:27 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Sep 2020 22:52:26 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Sep 2020 13:52:23 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 8 Sep 2020 13:52:24 +0800
Message-ID: <1599544344.17800.2.camel@mtkswgap22>
Subject: Re: [PATCH v3] cpufreq: mediatek-hw: Add support for Mediatek
 cpufreq HW driver
From: Hector Yuan <hector.yuan@mediatek.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Date: Tue, 8 Sep 2020 13:52:24 +0800
In-Reply-To: <20200908051416.na567g3mr7zbyr6h@vireshk-i7>
References: <1598446913-24325-1-git-send-email-hector.yuan@mediatek.com>
 <1599532510.17707.4.camel@mtkswgap22>
 <20200908051416.na567g3mr7zbyr6h@vireshk-i7>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 267856DCEFB91F9263896297BDB66F042192EFBF9467B861CC1DC02360CBEFF02000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200908_015230_396677_12DE342C 
X-CRM114-Status: GOOD (  13.32  )
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
Cc: devicetree@vger.kernel.org, Anson Huang <Anson.Huang@nxp.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, wsd_upstream@mediatek.com,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Olof
 Johansson <olof@lixom.net>, Vinod Koul <vkoul@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Li Yang <leoyang.li@nxp.com>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-09-08 at 10:44 +0530, Viresh Kumar wrote:
> On 08-09-20, 10:35, Hector Yuan wrote:
> > Hi, Sirs:
> > 
> > Please kindly let me know your review thoughts of this patch.
> > Appreciated.
> 
> Please don't send new patchsets in hurry, it isn't going to help any
> of us. V3 doesn't address all the review comments you received in V2
> and so there is no point reviewing it.
> 
> Please send a new version which addresses all the comments you got.
> 
OK, I will send V4 which addresses all the comments.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
