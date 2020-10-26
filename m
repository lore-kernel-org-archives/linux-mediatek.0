Return-Path: <SRS0=oVGr=EB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC997C388F9
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 06:29:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7020F22247
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 06:29:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aVKxBG9T";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="p529y4or"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7020F22247
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=k/wn+8RP/jfSZMIOb10xQRJpJ1ncUP6bW0noZYy2FOQ=; b=aVKxBG9TdayxtGUMcVWFSL5VV
	JYS5suzDhOxwcJdjn77ALe+bin+wWWc546dqcV3OBhU+jjKG0RV2G32bxkgeID3PPIyZ6eAZZWDB9
	VB5Rht7qDw8b5lZZGe/HzFtk1zkvHQGNFeu3H+EF5SSvJ8XLY5+VThZAtEoO0lKxMa8t3EFwKlsoq
	Ged+gAFQqT38W6G8xYYrgQflijPRBnyX/km/JkfIeIu89RFMW/mX3tSFYjiPaNqz1fhqafGJuJufm
	0TDznpu6tMayvCvbWfjl6CiZHdYywx3YTDZbpeLbrznyXE4EgJZWC16Y2PEaekQRu4LvtWbYmvktk
	87uVhkL0A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kWw05-0002Rg-Sa; Mon, 26 Oct 2020 06:29:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kWw01-0002Pt-1W; Mon, 26 Oct 2020 06:28:58 +0000
X-UUID: ac03eb72db1444258c4cda3adba647bc-20201025
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=XLrInF8GgdwjAwEAE1PEiTWBLKaCKIMlSZI9fSZKKDU=; 
 b=p529y4orBaNRzV74H1ibS+yvd74NHJCf4SR+eb/HGILQqwGEjnjyvFFsh/DlAw+UMas4ux4rxZQm4Vxus/ic+0H50cN2ugvzUbPM21uxaI4G7V7eMU+gstexBKX0WSB0moFc/N6ovdkyQwcaQ+gO1zrCi/tKxZhDdBdn4DqbCfU=;
X-UUID: ac03eb72db1444258c4cda3adba647bc-20201025
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <hector.yuan@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1252759746; Sun, 25 Oct 2020 22:28:54 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 25 Oct 2020 23:20:55 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 26 Oct 2020 14:20:34 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 26 Oct 2020 14:20:33 +0800
Message-ID: <1603693234.20535.9.camel@mtkswgap22>
Subject: Re: [PATCH v1] cpufreq: mediatek-hw: Add support for Mediatek
 cpufreq HW driver
From: Hector Yuan <hector.yuan@mediatek.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Date: Mon, 26 Oct 2020 14:20:34 +0800
In-Reply-To: <20201023092720.qpws5wivqb4u6fwl@vireshk-i7>
References: <1603441493-18554-1-git-send-email-hector.yuan@mediatek.com>
 <20201023082817.5vp4cvi2lmpaozcn@vireshk-i7>
 <1603444138.20224.19.camel@mtkswgap22>
 <20201023092720.qpws5wivqb4u6fwl@vireshk-i7>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_022857_327988_EDCA0724 
X-CRM114-Status: GOOD (  28.00  )
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

On Fri, 2020-10-23 at 14:57 +0530, Viresh Kumar wrote:
> On 23-10-20, 17:08, Hector Yuan wrote:
> > On Fri, 2020-10-23 at 13:58 +0530, Viresh Kumar wrote:
> > > On 23-10-20, 16:24, Hector Yuan wrote:
> > > > This patchset includes 6 patches and depends on the MT6779 DTS patch[1] submitted by Hanks Chen.
> > > > The first 3 patches are for CPUFREQ HW driver and device tree binding, which are already sent before separately [2][3]. For binding part, I add a new patch to add property in cpu schema.
> > > > Besides, we add three more patches including EM power table, SVS CPU initialize, and cooling device.
> > > 
> > > And even after so many versions of these you chose to name this V1. It
> > > is very difficult for reviewers to find time to review your stuff, and
> > > they expect some sort of summary from you on what exactly changed from
> > > last version and you also need to name the current version currently.
> > > 
> > > This should have been V8 and you should have added a "V7->V8 diff:"
> > > section here, naming all the changes you did. Please send that as
> > > reply to this email, so I can see what really changed.
> > > 
> > Hi, Viresh
> > 
> > Sorry for your inconvenience.
> > #1~#3 is for cpufreq driver we have reviewed and the bindings which
> > separate freq domain to CPU schema.There is no change for the driver
> > itself.
> >   1. cpufreq: mediatek-hw: Add support for CPUFREQ HW
> >   2. dt-bindings: arm: cpus: Document 'mtk,freq-domain' property
> >   3. dt-bindings: cpufreq: add bindings for MediaTek cpufreq HW
> > 
> > #4~#6 is for other CPU features, i.e. SVS [1]
> >   4. cpufreq: mediatek-hw: register EM power table
> >   5. cpufreq: mediatek-hw: Add SVS CPU initialization
> >   6. cpufreq: mediatek-hw: Add cooling dev flag
> > 
> > I supposed that it could be more clean to separate #4~#6 in another
> > patchset.May I know is it okay to you? Or I should merge all of changes
> > into v8 like you mentioned? Thank you.
> 
> Merge them all together and explain any special features (like SVS) in
> the commit log. It will also help in future when people want to
> understand your driver. Explain whatever is worth explaining there and
> is not straight forward.
> 
> Thanks for the details.
> 
OK, I will merge all changes in v8. And explain details in cover-letter.
Thank you. 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
