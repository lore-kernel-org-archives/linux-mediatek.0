Return-Path: <SRS0=dHEP=CZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4448CC43461
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2020 11:39:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AED4B22208
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2020 11:39:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zY+CBWN9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="tREe3azI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AED4B22208
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1Zh1GrJiJmRyb3nod7v0Uy8nO8oQNJERIMaEkPGGq1c=; b=zY+CBWN9pa0+fWA9h9uN9H8eL
	PCZVE30pKkmw/NVsmpZDcWWlUQ1GuUmlDEslwVIgMkUnbJZKnAwuDpltZSfG48geydaGHf2Ak/Lwg
	EI3V/8rEhhk4O+TA+AWdbHSUkJ9aiFriv/IXFh/ROdHDJAz/9ISvBuHiGvqWFCMoswGIocYGM0dsa
	gMq0Byq6e1/RGdZ1ZbsSKXS33fZLLDoiNAqvJ31EWO1C2Y/0mgTunqOXvBpKtV5DpqO6lsE6yDRKY
	PtXxAtJl/9PTIBuY92de1KqGszFCDwZiNcysI33jsxugB5drhUxNQBYZR98VcWyyZzoin7R7+5LQj
	gZ6sgNORQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIVma-000771-17; Wed, 16 Sep 2020 11:39:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIVmV-00076I-Db; Wed, 16 Sep 2020 11:39:26 +0000
X-UUID: e5dd9c33bc57487193d2d6f635189a1f-20200916
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=W4f0Gv7pUKvtQ+PgBn2oCT/tUuwNvMVT9QsIDFwdjg0=; 
 b=tREe3azI1u0MEgbt5H0hr3f29KZke4ZBJZj5JaGT+v3kP/QolKolAIg7L442D2z4O5/TEm5vMiIENcUohNUmNxaQtWj5mua/rr7vMjf074+uKEwuyYMsGmkICbqnosYdvebnaz/s6JiaLkh8ewzIM4osRYKpNY+XdBgfWqAAxHg=;
X-UUID: e5dd9c33bc57487193d2d6f635189a1f-20200916
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <hector.yuan@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 562569066; Wed, 16 Sep 2020 03:39:17 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Sep 2020 04:39:15 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Sep 2020 19:39:12 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 16 Sep 2020 19:39:11 +0800
Message-ID: <1600256353.7042.13.camel@mtkswgap22>
Subject: Re: [PATCH v7] cpufreq: mediatek-hw: Add support for Mediatek
 cpufreq HW driver
From: Hector Yuan <hector.yuan@mediatek.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Date: Wed, 16 Sep 2020 19:39:13 +0800
In-Reply-To: <20200910053406.t37rgioykzvk3oem@vireshk-i7>
References: <1599712262-8819-1-git-send-email-hector.yuan@mediatek.com>
 <20200910050341.pgyieq3q7ijitosn@vireshk-i7>
 <1599715851.7042.9.camel@mtkswgap22>
 <20200910053406.t37rgioykzvk3oem@vireshk-i7>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: D31B7E4528DDBB4A6FAA5C2B85C8B1EDF1AF3454225063A0AD4497AD9E8527D22000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200916_073923_655078_F110A4B1 
X-CRM114-Status: GOOD (  20.95  )
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
 linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, Rob
 Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Rob sir:

Sorry to bother you, may I have your review comment for the binding
part?
Appreciated.

On Thu, 2020-09-10 at 11:04 +0530, Viresh Kumar wrote:
> On 10-09-20, 13:30, Hector Yuan wrote:
> > On Thu, 2020-09-10 at 10:33 +0530, Viresh Kumar wrote:
> > > On 10-09-20, 12:31, Hector Yuan wrote:
> > > > The CPUfreq HW present in some Mediatek chipsets offloads the steps necessary for changing the frequency of CPUs. 
> > > > The driver implements the cpufreq driver interface for this hardware engine. 
> > > > 
> > > > This patch depends on the MT6779 DTS patch submitted by Hanks Chen
> > > >  https://lkml.org/lkml/2020/8/4/1094
> > > 
> > > Thanks for hanging there. Looks good to me. I will apply it once Rob
> > > Ack's the binding patch.
> > > 
> > 
> > Many thanks for your help. May I know if you can add Reviewed-by tag to
> > this patch set.
> 
> Since this patchset is going to get merged via my tree (ARM cpufreq
> tree), a reviewed-by isn't required here. I will queue it up for
> 5.10-rc1 after I receive an Ack from Rob.
> 
> > I would like to prepare some patches for more features
> > based on this. Is that okay to you? Thanks again.
> 
> That should be fine.
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
