Return-Path: <SRS0=zPgu=IK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73161C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Mar 2021 11:58:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E42364FEA
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Mar 2021 11:58:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E42364FEA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0zrgJpYTbwZdYvptIqQM5zEZvW/M8T+VJd+5VoZnpA8=; b=TWPVap2c2SvvgBwkEuCRUeGxs
	GfRfRfJzCRECE0umDEXsrA2TmXTTc9wW8sLDGDeODzepleoyacvBhKnl4JqlyOoHtpxpXf6Q5RG7k
	fHjndGiwjeznNl9YiJzteEo9hvrDh229loKY/3kiDVxbQSxEbwAfwMJO9LFPJ0ASH8V45t+Z+FASL
	kjQb6X9oGVdYyRuIxX+BoIS35N6saD36c78RXA3iHUVUcs96MxcFX7jkJLVD7cHQHDzmkYZ0f5mth
	8ZTlan3ea4KSLau7s1k6TD+s8IQOZHLamNC5BoiRWxGbYHfSM8eXsMqgeZ/qbNW+gY/9fn8gGHRf6
	qSh1PI3IQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKgRK-00BLtE-Qy; Fri, 12 Mar 2021 11:58:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKgRD-00BLs7-Pl; Fri, 12 Mar 2021 11:58:44 +0000
X-UUID: ff9d5231862749d5bcd4e355df084e4e-20210312
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=m18qKLN2eIVN7m92F2V4LCu7cdJzsE5sgxfQGieING0=; 
 b=S9LUjU8PqjaK1ex3e0xZ3tZJLCyTgDv/g54TWXASg0Fqnt8nTYLCGhz1TnKzewR0JnIQTSZ36ROCh7ZGgXhBZEAC+g1NXIre+55kULuGh4pEXBS1fB5JIHTIhbqtgCpQZnrSwxWKdtVFgBTjwdEHby+drkUx/jwHX0Nrxu54dp8=;
X-UUID: ff9d5231862749d5bcd4e355df084e4e-20210312
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <hector.yuan@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1153643133; Fri, 12 Mar 2021 03:58:35 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 12 Mar 2021 03:58:00 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 12 Mar 2021 19:57:52 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 12 Mar 2021 19:57:52 +0800
Message-ID: <1615550272.25310.2.camel@mtkswgap22>
Subject: Re: [PATCH v10] cpufreq: mediatek-hw: Add support for Mediatek
 cpufreq HW driver
From: Hector Yuan <hector.yuan@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
CC: <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>, "Rafael
 J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, "Rob
 Herring" <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <wsd_upstream@mediatek.com>
Date: Fri, 12 Mar 2021 19:57:52 +0800
In-Reply-To: <49f4400f-c803-f044-4974-f4e8703876e7@gmail.com>
References: <1609222629-2979-1-git-send-email-hector.yuan@mediatek.com>
 <49f4400f-c803-f044-4974-f4e8703876e7@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 40CEC1518245D1AF1D1701B429592852A3B6BD905C97EAC10220746F7E7A5FFB2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_115841_097219_E17AB294 
X-CRM114-Status: GOOD (  24.77  )
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

On Sun, 2021-01-31 at 11:34 +0100, Matthias Brugger wrote:
> 
> On 29/12/2020 07:17, Hector Yuan wrote:
> > The CPUfreq HW present in some Mediatek chipsets offloads the steps necessary for changing the frequency of CPUs. 
> > The driver implements the cpufreq driver interface for this hardware engine. 
> > This patch depends on MT6779 DTS patchset[1] submitted by Hanks Chen.
> 
> This dependency got resolved, the patch is mainline since v5.11. Please delete
> it in further revisions of the patch set to minimize confusion.
> 
> Thanks!
> 
Thanks, I will remove this dependency in the next version. 
> > 
> > From v8 to v9, there are three more modifications.
> > 1. Based on patchset[2], align binding with scmi for performance domain.
> > 2. Add the CPUFREQ fast switch function support and define DVFS latency.
> > 3. Based on patchser[3], add energy model API parameter for mW.
> > 
> > From v7 to v8, there are three more patches based on patchset v8[4].
> > This patchset is about to register power table to Energy model for EAS and thermal usage.
> > 1. EM CPU power table
> > - Register energy model table for EAS and thermal cooling device usage.
> > - Read the coresponding LUT for power table.
> > 2. SVS initialization
> > - The SVS(Smart Voltage Scaling) engine is a hardware which is
> >   used to calculate optimized voltage values for CPU power domain.
> >   DVFS driver could apply those optimized voltage values to reduce power consumption.
> > - Driver will polling if HW engine is done for SVS initialization.
> >   After that, driver will read power table and register it to EAS.
> > - CPUs must be in power on state when doing SVS. Use pm_qos to block cpu-idle state for SVS initializing.
> > 3. Cooling device flag
> > - Add cooling device flag for thermal
> > 
> > [1]  https://lkml.org/lkml/2020/8/4/1094
> > [2]  https://lore.kernel.org/lkml/20201116181356.804590-1-sudeep.holla@arm.com/
> > [3]  https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git/commit/?h=linux-next&id=c250d50fe2ce627ca9805d9c8ac11cbbf922a4a6
> > [4]  https://lkml.org/lkml/2020/9/23/384
> > 
> > 
> > Hector.Yuan (2):
> >   cpufreq: mediatek-hw: Add support for CPUFREQ HW
> >   dt-bindings: cpufreq: add bindings for MediaTek cpufreq HW
> > 
> >  .../bindings/cpufreq/cpufreq-mediatek-hw.yaml      |  116 ++++++
> >  drivers/cpufreq/Kconfig.arm                        |   12 +
> >  drivers/cpufreq/Makefile                           |    1 +
> >  drivers/cpufreq/mediatek-cpufreq-hw.c              |  370 ++++++++++++++++++++
> >  4 files changed, 499 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
> >  create mode 100644 drivers/cpufreq/mediatek-cpufreq-hw.c
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
