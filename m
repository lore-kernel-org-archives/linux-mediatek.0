Return-Path: <SRS0=UhTi=5X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46909C2BB1D
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Apr 2020 09:19:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDF89206C0
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Apr 2020 09:19:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dp9yYGaw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Khyo5OWX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDF89206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0GZHaEH6BYvCrHNUAfPau8wSnENCns4/FOqbdlDEMFc=; b=dp9yYGawpOAo2Y
	xxFwPW8cHCn+sFOyDv0SI1ifRUyxl62gnwHJRGZD62Bycrd05KOwMewzeDxHHO5pM4eEybDw6RYVv
	AnK2rZZph+wmLZdOk4Jygp6JtWTzSm44goiNpGCffb9W84yTSLIEnOsYTxMR7Mh/8sm08JoV0WdDm
	XlXOm0BYojxRdFEP6J+WluZwrAPvyZHgtzBcho66RIlhf2eazS7gMpt91KO77s+iGqUvwDm43Eegx
	BIcIBaA0iUMZB9cU6Sl1ZfvbR2A//UFd/TIXcKtaH+c8doTHsoCJ3N3P2GYWbmE7e3ICswjq81G+Y
	PdorNAh6GeBVLPX0c/2w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jLkOG-0005cB-4U; Tue, 07 Apr 2020 09:19:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLkOD-0005bU-CC; Tue, 07 Apr 2020 09:19:26 +0000
X-UUID: 6030013d42314166b8bc8ee08787f770-20200407
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=2XlIC9weoUWQYEuZNk6neeBDRRnApsl6mHSA7GFGYNM=; 
 b=Khyo5OWXEW+ICvC8i9ko0O5ZKhbFSm7BMHaqrc8brLpxRqQa0j1LjE3FmSqd4p+2xzsT93Wgu5dvfWDcLKVkPv92+aDloQ8DrNg1PfhBZ7Dzw5wYOSpuFsAGKkWkU7WSaRyfsImjmDrqI164YKfW8SF8CexHSWvfl4ow8+GSQXc=;
X-UUID: 6030013d42314166b8bc8ee08787f770-20200407
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <andrew-sh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 697841715; Tue, 07 Apr 2020 01:19:23 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Apr 2020 02:09:17 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Apr 2020 17:09:15 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 7 Apr 2020 17:09:14 +0800
Message-ID: <1586250557.3187.0.camel@mtksdaap41>
Subject: Re: [v5, PATCH 4/5] cpufreq: mediatek: add opp notification for SVS
 support
From: andrew-sh.cheng <andrew-sh.cheng@mediatek.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Date: Tue, 7 Apr 2020 17:09:17 +0800
In-Reply-To: <20200407082928.lancywbqts5yg4ks@vireshk-i7>
References: <20191127083619.etocnhpyyut3hzwq@vireshk-i7>
 <1575874588.13494.4.camel@mtksdaap41>
 <20191210064319.f4ksrxozp3gv4xry@vireshk-i7>
 <1583827865.4840.1.camel@mtksdaap41>
 <20200311060616.62nh7sfwtjwvrjfr@vireshk-i7>
 <1584084154.7753.3.camel@mtksdaap41>
 <20200313091038.q7q7exiowoah4nk4@vireshk-i7>
 <1586164366.5015.6.camel@mtksdaap41>
 <20200406092945.d5thcd2h3bo7mn45@vireshk-i7>
 <1586242489.10019.1.camel@mtksdaap41>
 <20200407082928.lancywbqts5yg4ks@vireshk-i7>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200407_021925_421731_EDFA1E74 
X-CRM114-Status: GOOD (  11.60  )
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
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chanwoo
 Choi <cw00.choi@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Rob Herring <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Fan Chen =?UTF-8?Q?=28=E9=99=B3=E5=87=A1=29?= <fan.chen@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-04-07 at 13:59 +0530, Viresh Kumar wrote:
> On 07-04-20, 14:54, andrew-sh.cheng wrote:
> > On Mon, 2020-04-06 at 14:59 +0530, Viresh Kumar wrote:
> > > On 06-04-20, 17:12, andrew-sh.cheng wrote:
> > > > I will use regulator in the locked region.
> > > > And regulator will use mutex_lock.
> > > 
> > > Yeah, you can't use spinlock here, use a mutex.
> > > 
> > Hi Viresh,
> > 
> > I am not familiar with read/write lock.
> > Do you mean there is another read/write function, which is not
> > read_lock()/write_lock(), using mutex but not spinlock?
> 
> Heh, I am asking you to use simple mutex here, leave the read/write
> lock thing completely as it won't work here.
> 
Got it.
Thank you for your patient~
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
