Return-Path: <SRS0=uG8S=M4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D85AC4338F
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Aug 2021 05:40:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF2CB6052B
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Aug 2021 05:40:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CF2CB6052B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5dogDDOnT87XiyADXXrGKIkbi5cejrN+dhq4Tbm1g8c=; b=yVaxvzlcC0E6Fu
	s+rl0i1YTXzOnpwONdHp9KLyBFzvUZEkpid1uslQF4kOvS7tp4kwqYOuv6d4xiVaT0pmipyricobM
	/BXoUfFE63yFdCrunfW6csqjP3lqU1M+xBh07qQNcVcA9Doc8GCSQ4udUtqnXyWKtWHcxIFqQqEP+
	FhRHiqz5+mzunqGGSS/sOvEGuPWIlVZuaFfysNOsN9xg+SWxnDBeSAIA3no6ZRVvTGWaIvhE4XuAK
	UfLIefz8FVbolNexsthWfhZ2jYhVtCjFO38uOu3yL9mW+qK03XrjEF5PrFqJokJwqnh6PHtCzIYZ4
	fYKFQBlHpWLqZvV6HIpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBW73-0089ck-W9; Thu, 05 Aug 2021 05:40:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBW6q-0089ZL-NP; Thu, 05 Aug 2021 05:40:02 +0000
X-UUID: d7bb04d73bb54f2295aad3acb4100e2a-20210804
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=iysGRkBA3I1DDFi54oZ4OInQV+8ljw933mvUY9ZHSjA=; 
 b=rEuPM1rXzgqeYNRkc9KC5gHv+tEjH1uLvB5IUVR4YUxNvSJFzCWuTsxe/2sU/FqsNv9pyjBgWtBvkmXAQKKNdwo95pp/uDn4JRKNok0eTjKz/oq71JRoEUeBcgYONvUluX89C6zJLbx6Cfms6nXBgO5LipUG4pF/9GPKv3zK2eE=;
X-UUID: d7bb04d73bb54f2295aad3acb4100e2a-20210804
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <mason.zhang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 935225056; Wed, 04 Aug 2021 22:39:55 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 4 Aug 2021 22:39:53 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 5 Aug 2021 13:39:52 +0800
Received: from [10.15.20.246] (10.15.20.246) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 5 Aug 2021 13:39:51 +0800
Message-ID: <1628140993.20108.4.camel@mbjsdccf07>
Subject: Re: [PATCH v2 4/4] spi: tegra114: Fix set_cs_timing param
From: Mason Zhang <mason.zhang@mediatek.com>
To: Mark Brown <broonie@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Laxman Dewangan
 <ldewangan@nvidia.com>, <linux-spi@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <wsd_upstream@mediatek.com>,
 <mason.zhang@mediatek.com>
Date: Thu, 5 Aug 2021 13:23:13 +0800
In-Reply-To: <20210803141045.GN4668@sirena.org.uk>
References: <20210803102517.20944-1-Mason.Zhang@mediatek.com>
 <20210803141045.GN4668@sirena.org.uk>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_224000_971422_66C51A6D 
X-CRM114-Status: GOOD (  18.14  )
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

On Tue, 2021-08-03 at 15:10 +0100, Mark Brown wrote:
> On Tue, Aug 03, 2021 at 06:25:18PM +0800, Mason Zhang wrote:
> > This patch fixed set_cs_timing param, because cs timing delay has
> > been moved to spi_device.
> > 
> > Signed-off-by: Mason Zhang <Mason.Zhang@mediatek.com>
> > ---
> >  drivers/spi/spi-tegra114.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> Each individual patch in the series needs to be buildable by itself, if
> an earlier commit in the series causes things to fail to build then that
> commit needs to be improved so that this doesn't happen.  This supports
> things like bisection.
> 
> Please also look into how you're sending serieses, these patches aren't
> threaded together as normal and there's a weird "***" in the subject of
> the first patch.


Dear Mark:

	Thanks for your suggestions, I have merged patch 2/3/4 in one patch to
ensure it can be built by itself.
	And I have updated the patch v3, and removed the *** int the first
patch.


Thanks
Mason
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
