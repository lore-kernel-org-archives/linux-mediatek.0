Return-Path: <SRS0=bzTf=AF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49D01C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jun 2020 03:51:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1590A2077D
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jun 2020 03:51:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gQtqEtlX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="LHkJg7Yg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1590A2077D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mMHquQQKgvODlkfpzspVgwxVWRYP308lKLHBQyHH5P8=; b=gQtqEtlX0h/8odhonkEDEDav5
	lc1RgVVfcbGnnkmQjzipGMVO/O2l6rNgETvq7FL9aVSt4AVT5kMtIk94SYFIjX67NjrkRI/ptwwDP
	Nz3h3C+HhLLiQ1LqMRk6GxoNplYLXw/bLFpqR7cuiibGTbDG8YaGQ+fkrACqzF0wbraPB20Og7/yb
	Gl8/aw5fUakdVKyDvqoTU4E2B3ly9vbFDCeepzjdwZKG3RIGtrhhqqWo6pRHestVYy3Rr8Ju6ExnF
	Bl5OUDd+VascXcP/lrZNrl0DO39hwNe0FASNNhLPdzzQ0ZH20NoqaaUFKJ5e6R5e4SYkvW+utQRx+
	LybcdvK4A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jnwRq-0008V7-VI; Wed, 24 Jun 2020 03:51:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jnwRl-0008Qq-9o; Wed, 24 Jun 2020 03:51:38 +0000
X-UUID: a2ec4f73cc754175aaa566409a22fcf3-20200623
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=2Dog3+Nae8JVLbPa7qMUki8StCUSkZ7vDzgUmgL8nCI=; 
 b=LHkJg7YgjU04Nt6u/wwESrQfe1U61/PUIjrTRHJUv06I7DJZjtziIHvpHoLxkWhAx9lvbfpTF4Keg1+3VJdyWy6SBG469XasDS1heAPhFAWVwlxSqWZa06uP/h/DawRL9PPvA4KV2jmqmvNuLtO8kUBkKLyvWcG3M1jVwF7zGgw=;
X-UUID: a2ec4f73cc754175aaa566409a22fcf3-20200623
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <neal.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 873973364; Tue, 23 Jun 2020 19:51:32 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 23 Jun 2020 20:51:28 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 24 Jun 2020 11:51:20 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 24 Jun 2020 11:51:20 +0800
Message-ID: <1592970682.14160.6.camel@mtkswgap22>
Subject: Re: Add MediaTek MT6873 devapc driver
From: Neal Liu <neal.liu@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Wed, 24 Jun 2020 11:51:22 +0800
In-Reply-To: <20200609173204.GB1107294@bogus>
References: <1591698261-22639-1-git-send-email-neal.liu@mediatek.com>
 <20200609173204.GB1107294@bogus>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 94B690576371ABB4BE2991BDACDFB8DE814464701461FFE7D00C600E775A57D32000:8
X-MTK: N
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
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Neal Liu <neal.liu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-06-09 at 11:32 -0600, Rob Herring wrote:
> On Tue, Jun 09, 2020 at 06:24:19PM +0800, Neal Liu wrote:
> > These patch series introduce a MediaTek MT6873 devapc driver.
> > 
> > MT6873 bus frabric provides TrustZone security support and data
> > protection to prevent slaves from being accessed by unexpected
> > masters.
> > The security violations are logged and sent to the processor for
> > further analysis or countermeasures.
> > 
> > Any occurrence of security violation would raise an interrupt, and
> > it will be handled by devapc-mt6873 driver. The violation
> > information is printed in order to find the murderer.
> 
> There's also a proposed driver with similar functionality[1]. Come up 
> with a common solution.
> 
> Rob
> 
> [1] https://lore.kernel.org/linux-arm-kernel/20200128153806.7780-1-benjamin.gaignard@st.com/

Actually, Mediatek devapc HW do the similar things. But the real
"firewall" functionality is implemented in TrustZone instread of REE.
This devapc-mt6873 driver is mainly handled the violation.

Bus firewall framework seems not cover this parts.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
