Return-Path: <SRS0=JD7o=KX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA1BFC47087
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 May 2021 07:28:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 958D361005
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 May 2021 07:28:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 958D361005
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I8/gljeP/Xo/TVCYoZRKlx+F2UeVsLRuWm/UYMhRwCg=; b=eb7lqhXrZK8vn0
	GqwkrFul6GVMOPHMsqYxE/vTTFyNxyF/PfQqSA4WepYUoKPcg97rnA6F+eRrNat+WGUNVSpetP97y
	WNN3X5TMAQ+BKJFL9IAIhwJHHp7tTSskFJV5c+3I7dhQCvaYuvYVPVTx/+IE4M79SZuzLRRbba1xq
	MmuHJONEYyEhkqXc6aSBb+nvOmhiUvdJcMkmbe4n3gz4/W8vW609bfRZRWObXbNnwhwq08ejGJEt0
	D3ks0rGRX1NbYq9AAFNspmNn2XF5kUSv3NmKHH0zb4IufVGmH81fqRmFj2a+wrJDqSKpHC7jxzOwQ
	uit6zbG36QjKBvJG9jLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmWui-00D01b-Ug; Fri, 28 May 2021 07:28:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmWuf-00CzwE-Ot; Fri, 28 May 2021 07:28:11 +0000
X-UUID: 0d6bb0632e694265b8760922845b0b45-20210528
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=hJ6JezNIvj6ABl5W9WM2O4yJyn7QGyEyRh0VxX9iS/8=; 
 b=g1IcgBnmu1v01thJMJw3AyaDS0owuq7AH8HdyhNMA8/r0sgSTdDWPMidFpqfU7AzJJ3LQNB+inw9UX0A9m/JwinVn+h1VptvMTUXi7HxYaCd3RDk6p5ahbuvY24zzNn7fSSKmqEx+9GekVspTVUd4PdP7wBvIHz8FZJi0ooMBI8=;
X-UUID: 0d6bb0632e694265b8760922845b0b45-20210528
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <hector.yuan@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 184436019; Fri, 28 May 2021 00:28:04 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 28 May 2021 00:28:02 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 28 May 2021 15:27:49 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 28 May 2021 15:27:49 +0800
Message-ID: <1622186869.1958.0.camel@mtkswgap22>
Subject: Re: [PATCH v10] cpufreq: mediatek-hw: Add support for Mediatek
 cpufreq HW driver
From: Hector Yuan <hector.yuan@mediatek.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
CC: <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>, "Rafael
 J. Wysocki" <rjw@rjwysocki.net>, Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <wsd_upstream@mediatek.com>
Date: Fri, 28 May 2021 15:27:49 +0800
In-Reply-To: <20210524091845.wlikxun3x2qou7zs@vireshk-i7>
References: <1609222629-2979-1-git-send-email-hector.yuan@mediatek.com>
 <20210524091845.wlikxun3x2qou7zs@vireshk-i7>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_002809_857376_1CDC3B0D 
X-CRM114-Status: GOOD (  15.59  )
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

On Mon, 2021-05-24 at 14:48 +0530, Viresh Kumar wrote:
> On 29-12-20, 14:17, Hector Yuan wrote:
> > The CPUfreq HW present in some Mediatek chipsets offloads the steps necessary for changing the frequency of CPUs. 
> > The driver implements the cpufreq driver interface for this hardware engine. 
> > This patch depends on MT6779 DTS patchset[1] submitted by Hanks Chen.
> > 
> > >From v8 to v9, there are three more modifications.
> > 1. Based on patchset[2], align binding with scmi for performance domain.
> > 2. Add the CPUFREQ fast switch function support and define DVFS latency.
> > 3. Based on patchser[3], add energy model API parameter for mW.
> 
> Hi Hector,
> 
> You can refresh this series based on the patch from Sudeep:
> 
> https://lore.kernel.org/linux-devicetree/20210517155458.1016707-1-sudeep.holla@arm.com/
> 
OK, will based on latest kernel and resend patches in these days.
Thanks!
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
