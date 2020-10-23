Return-Path: <SRS0=bV6b=D6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 805EFC55178
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 09:11:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F102F241A4
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 09:11:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rAbKD+Ay";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="i2nz1LEA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F102F241A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/fARfRZKodKYNSgjucX4lG1+KiiRmQRbKeSWG+Xr/eo=; b=rAbKD+AyjxFEkF8a2BRYAloSY
	BteMIOXXL+QICSp41U1sxErs25VAV771DeY3K/EnZkG8lKtwsgyWVGF4vU5VQcG5fmjNvff+r+vdz
	J7rq1ph4Ub+RVLmgkndgFVT6WO35kZVaG5LPlAxDctoGax+bojxS38NDjnGjbmI+RxcAlh2JPp2TJ
	H8twOt7cn4e9GcFW/BhMTQSev7+AF8D+ceL3hxrIXhItOpQDNTikBRhcEPtdNsKWC2hMd7uyoljv5
	yfk1gU3PsTltaVbP27vAu22WLowo3ZE1Rrw2t4zHV1T2BlgV4ZhRkfd1afaLcypTOGH3kEpkuLrUm
	8FoKEC0nw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVt63-0007BW-Qo; Fri, 23 Oct 2020 09:10:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVt5z-00079g-2q; Fri, 23 Oct 2020 09:10:48 +0000
X-UUID: 99ebd16bd5cf4b388b4474dd5525dfd1-20201023
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=3WEtnopcYNnyU+ht9FURWd9kEIt+fKwHVmbbqq2fROE=; 
 b=i2nz1LEA0MNm9ApNNX98aju1Linvha5pguHXukNeEbqG194O1QKvJlRPeyx12g0CQ1qSpO7Qw6j6VaiCAcVEnZItUuwK4OXCCagwCMsypeOBPlgv8SVFYe83TPjGl2/pOZrIow1HlNqgat4uSQkUTuWRfOlkSApY+ZeoW/7EQVI=;
X-UUID: 99ebd16bd5cf4b388b4474dd5525dfd1-20201023
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <hector.yuan@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 408425944; Fri, 23 Oct 2020 01:10:43 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 23 Oct 2020 02:09:09 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 23 Oct 2020 17:09:00 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 23 Oct 2020 17:09:00 +0800
Message-ID: <1603444138.20224.19.camel@mtkswgap22>
Subject: Re: [PATCH v1] cpufreq: mediatek-hw: Add support for Mediatek
 cpufreq HW driver
From: Hector Yuan <hector.yuan@mediatek.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Date: Fri, 23 Oct 2020 17:08:58 +0800
In-Reply-To: <20201023082817.5vp4cvi2lmpaozcn@vireshk-i7>
References: <1603441493-18554-1-git-send-email-hector.yuan@mediatek.com>
 <20201023082817.5vp4cvi2lmpaozcn@vireshk-i7>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: BFAEE2C64C5F4F78B9D894AC69314D171E959363740E77E7C149C17B814AB9BB2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201023_051047_340475_C8606735 
X-CRM114-Status: GOOD (  19.55  )
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
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>, wsd_upstream@mediatek.com,
 linux-pm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Dave Gerlach <d-gerlach@ti.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Amit Kucheria <amit.kucheria@linaro.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-10-23 at 13:58 +0530, Viresh Kumar wrote:
> On 23-10-20, 16:24, Hector Yuan wrote:
> > This patchset includes 6 patches and depends on the MT6779 DTS patch[1] submitted by Hanks Chen.
> > The first 3 patches are for CPUFREQ HW driver and device tree binding, which are already sent before separately [2][3]. For binding part, I add a new patch to add property in cpu schema.
> > Besides, we add three more patches including EM power table, SVS CPU initialize, and cooling device.
> 
> And even after so many versions of these you chose to name this V1. It
> is very difficult for reviewers to find time to review your stuff, and
> they expect some sort of summary from you on what exactly changed from
> last version and you also need to name the current version currently.
> 
> This should have been V8 and you should have added a "V7->V8 diff:"
> section here, naming all the changes you did. Please send that as
> reply to this email, so I can see what really changed.
> 
Hi, Viresh

Sorry for your inconvenience.
#1~#3 is for cpufreq driver we have reviewed and the bindings which
separate freq domain to CPU schema.There is no change for the driver
itself.
  1. cpufreq: mediatek-hw: Add support for CPUFREQ HW
  2. dt-bindings: arm: cpus: Document 'mtk,freq-domain' property
  3. dt-bindings: cpufreq: add bindings for MediaTek cpufreq HW

#4~#6 is for other CPU features, i.e. SVS [1]
  4. cpufreq: mediatek-hw: register EM power table
  5. cpufreq: mediatek-hw: Add SVS CPU initialization
  6. cpufreq: mediatek-hw: Add cooling dev flag

I supposed that it could be more clean to separate #4~#6 in another
patchset.May I know is it okay to you? Or I should merge all of changes
into v8 like you mentioned? Thank you.

[1]
https://patchwork.kernel.org/project/linux-mediatek/patch/20190906100514.30803-4-roger.lu%40mediatek.com/
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
