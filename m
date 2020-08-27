Return-Path: <SRS0=xkEi=CF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 510F9C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 08:59:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16B2C2177B
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 08:59:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HuqWa8Ls";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="gnl17B6Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16B2C2177B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ALYaors714ZKonPod/rnYMPBo+2wrzdLIy1Ykx0WGoc=; b=HuqWa8LsvnNo5OTBjtJ33Bggu
	nv+5xKrvVxCld2iCfnwT1O8vuYefa5GSGHLjhme5OKk1Do2NnLr0e9wrQ1TP/15a83CeUr+X8wbhD
	y1nf3kTTn7hYl109AhKLqEbFaNqFnwntBD8E+D2yieyWABQTOrQmGubuWxm7zLFoH1gUtr/HlExDg
	XJsz2gNXCZi4HMaTwDRY3/xUNwiegV3kZzQNS4FRCxYpr7EovSBLnqlQRgse9Q+hDUGXgdBilT2tv
	FPOeY5BrPJWuW+ELjfqcDCI+BQKFI9I8kjh/ah4XkbaV4asbObUTXxzzso7gLfQ+e/sOv8NKnZ2lT
	QMORbcjVg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBDkI-0000fW-Ti; Thu, 27 Aug 2020 08:58:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBDjd-0000K0-Pk; Thu, 27 Aug 2020 08:58:20 +0000
X-UUID: fc6564bd04a64bc196bc29946fba49f2-20200827
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=z4HtARY63qecmM+UTuwL38oHkQEk8xUNbn1/BUzTchw=; 
 b=gnl17B6QIji7Vk8I0qsLqDwLBR+kzjndRD6X2fZvthnuA0e3y6d3sYZmQLv0O6HvAcFkZzjaLlbZP56WErBUbdZ4IjfNtGGyXKtYTFTUOgGlmWblo/uPsv+80K3u2DC2AGSQJRN+yjXMQ8ayDgYqRCe9SsoHJVRrQQjRaGXAU+A=;
X-UUID: fc6564bd04a64bc196bc29946fba49f2-20200827
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <hector.yuan@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 182739440; Thu, 27 Aug 2020 00:58:09 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 27 Aug 2020 01:58:07 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 27 Aug 2020 16:58:04 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 27 Aug 2020 16:58:05 +0800
Message-ID: <1598518685.4204.8.camel@mtkswgap22>
Subject: Re: [PATCH v2 1/2] cpufreq: mediatek-hw: Add support for Mediatek
 cpufreq HW driver
From: Hector Yuan <hector.yuan@mediatek.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Date: Thu, 27 Aug 2020 16:58:05 +0800
In-Reply-To: <20200827042653.5ttsxnjjhpslmrcv@vireshk-i7>
References: <1597302475-15484-1-git-send-email-hector.yuan@mediatek.com>
 <1597302475-15484-2-git-send-email-hector.yuan@mediatek.com>
 <20200824100619.o6uwnlsaxdgc3l7r@vireshk-i7>
 <1598446624.24220.10.camel@mtkswgap22>
 <20200827042653.5ttsxnjjhpslmrcv@vireshk-i7>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: BD4260F00D8F1BF7AF40A81B24370BFC97A30A7B409831315CBF6869CF9669432000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_045818_078847_CD15A7F5 
X-CRM114-Status: GOOD (  25.89  )
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
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 wsd_upstream@mediatek.com, Bjorn Andersson <bjorn.andersson@linaro.org>, Olof
 Johansson <olof@lixom.net>, Vinod Koul <vkoul@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Li Yang <leoyang.li@nxp.com>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-08-27 at 09:56 +0530, Viresh Kumar wrote:
> On 26-08-20, 20:57, Hector Yuan wrote:
> > On Mon, 2020-08-24 at 15:36 +0530, Viresh Kumar wrote:
> > > On 13-08-20, 15:07, Hector Yuan wrote:
> > > >  CONFIG_ARM_ALLWINNER_SUN50I_CPUFREQ_NVMEM=m
> > > >  CONFIG_ARM_ARMADA_37XX_CPUFREQ=y
> > > > +CONFIG_ARM_MEDIATEK_CPUFREQ_HW=m
> > > 
> > > What about a 'default m' in Kconfig itself ?
> > > OK, will update in V3.
> 
> Hector, you need to remove (or not add) the right bracket (>) before the
> beginning of your lines. This makes it incredibly difficult to read.

OK, I get it. Sorry for the inconvenience.
> > > > +	for (i = 0; i < LUT_MAX_ENTRIES; i++) {
> > > > +		data = readl_relaxed(base + (i * LUT_ROW_SIZE));
> > > > +		freq = FIELD_GET(LUT_FREQ, data) * 1000;
> > > > +		volt = FIELD_GET(LUT_VOLT, data);
> > > > +		if (freq != prev_freq) {
> > > > +			table[i].frequency = freq;
> > > > +			dev_pm_opp_add(cpu_dev, freq * 1000, volt);
> > > 
> > > Why are you adding OPPs here and rather why using OPP specific stuff
> > > at all in the driver ?
> > > yes, the opp information is read from CPU HW engine.Then add it to the CPU dev OPP one by one.  
> 
> I asked a different question, why are you adding OPPs ? You don't need the OPPs
> at all in my opinion. You can just create the frequency table and that's it.

I just add OPP info to OPP framework so that others modules can get it
from OPP framework.
But like you said, I don't need it in this driver. I will remove this
code segment in V4.
I already send V3 yesterday but not including this modification.

> > > > +	for_each_possible_cpu(cpu) {
> > > > +		cpu_np = of_cpu_device_node_get(cpu);
> > > > +		if (!cpu_np)
> > > > +			continue;
> > > > +
> > > > +		ret = of_parse_phandle_with_args(cpu_np, "mtk,freq-domain",
> > > 
> > > Where are bindings of this node and how does this look ?
> > > Can refer to the same patch series, I split it to another patch.Each cpu will be group into one frequency domain for the CPU DVFS. 
> 
> That binding only defines "mediatek,cpufreq-hw" and not "mtk,freq-domain".

Please refer to the dt binding in V3, thank you.  (lkml not show up yet,
so I post the below link instead)
https://www.spinics.net/lists/arm-kernel/msg832592.html
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
