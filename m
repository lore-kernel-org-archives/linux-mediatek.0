Return-Path: <SRS0=fB7w=DM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2506BC4363C
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2020 02:38:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DED832078E
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2020 02:38:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vvZWbzdi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="nvyOw5xu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DED832078E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8ZKEJYIGsK4wt880YfB0USz0CB2Q/RQBMKjk4NdpftM=; b=vvZWbzdiWoahRlsP9+eHjx0ok
	3w4EmZLq50iS+Bn4DrkmLW4Lb3Wh/MSwfTQ0STwhb90BmaCOrzafK6KwKAloxPJZc7CXr62PcIVoB
	4umX6IBToSOj8pF8dS7Z03/3rnwdqVzjWd6vwn4JToaqRg9aQXiroc/0kxVBnIdYhxHgwhKMFJF32
	wqT5mKeTwynp7yClm9oHHytDz7xZt1qN/zW4MY6ojcGQAZ+P1xY0K75zl1bdxSLg6LGlCv6qwmjRi
	oyQA478wltTXtJzLJ+J8dVxziSDXsjfNV+OZEX9uH2y4K51Aw6rJvFBwBI4NaPDwmsbM9NaynLqSH
	Y2CT7rtUA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPGO0-0000CT-HV; Mon, 05 Oct 2020 02:38:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPGNw-0000Bu-Bs; Mon, 05 Oct 2020 02:37:58 +0000
X-UUID: 1bb8918de7164a0b962fafcf52e0c96c-20201004
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=zfIoFOO7M2zzmk/gLUFI1nPpZvnU+1hf0KYlAmBzynM=; 
 b=nvyOw5xuwQfMsLWDm49sXKIRbVZ7Zxle5+RQR9b3rO5QczMUY0RjujUheDKTkqKHyBN9qWo603dG8ilJ2Ud7GQif6V3wt/DBAVIwXv/uZm/zVAYY+pvGGjW/Do48x1cZHCwezqlsAwEzawun3kIEO90Rpn5SxWPOYsP14tSrHjM=;
X-UUID: 1bb8918de7164a0b962fafcf52e0c96c-20201004
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <hector.yuan@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1989995538; Sun, 04 Oct 2020 18:37:43 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 4 Oct 2020 19:29:46 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 5 Oct 2020 10:29:36 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 5 Oct 2020 10:29:36 +0800
Message-ID: <1601864976.21446.46.camel@mtkswgap22>
Subject: Re: [PATCH v7 2/2] dt-bindings: cpufreq: add bindings for MediaTek
 cpufreq HW
From: Hector Yuan <hector.yuan@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Mon, 5 Oct 2020 10:29:36 +0800
In-Reply-To: <1601018748.21446.43.camel@mtkswgap22>
References: <1599712262-8819-1-git-send-email-hector.yuan@mediatek.com>
 <1599712262-8819-3-git-send-email-hector.yuan@mediatek.com>
 <20200922202852.GA3134161@bogus> <1600866614.21446.18.camel@mtkswgap22>
 <1601000847.21446.34.camel@mtkswgap22>
 <20200925061543.5hxs3ija2y53gzea@vireshk-i7>
 <1601018748.21446.43.camel@mtkswgap22>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: ABEF21196E9B582F58E3DE8582B85091A8ED4ECED688690E8E2408ECBC9D27172000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201004_223756_843205_0338C9B2 
X-CRM114-Status: GOOD (  18.92  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 linux-pm@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-09-25 at 15:25 +0800, Hector Yuan wrote:
> Hi, Rob sir:
> 
> Yes, my patch follows
> Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.txt way to
> define frequency domain.
> Is it OK to you if I use the same way to do?
> And if there exist any schema problem, please kindly let me know how to
> fix it.
> 
> My patch reference
> Documentation/devicetree/bindings/thermal/thermal-cooling-devices.yaml
> to use the cpu node.
> https://elixir.bootlin.com/linux/v5.9-rc6/source/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.yaml
> 
> Thanks a lot.
> 
Hi, Rob sir:

Sorry to bother you, may we know your comment for this.
Thanks so much. 

> On Fri, 2020-09-25 at 11:45 +0530, Viresh Kumar wrote:
> > On 25-09-20, 10:27, Hector Yuan wrote:
> > > Hi, Viresh & Rob Sir:
> > > 
> > > I will change frequency domain to below and define it in cpufreq_hw
> > > schema rather than cpu node.
> > > 
> > > mediatek,freq-domain-0 = <&cpu0>, <&cpu1>;
> > 
> > I think it would be better to do it the standard way we have done it elsewhere.
> > i.e. follow Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.txt, that
> > is similar to what you did earlier.
> > 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
