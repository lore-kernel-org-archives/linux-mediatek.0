Return-Path: <SRS0=vV1m=M2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09FA9C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 03:36:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DFE560FC4
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 03:36:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9DFE560FC4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SZ8A8GfgBn0IFCgETcAG1QteAXYLjjUPKYgV5yKQWYo=; b=Wdbfp9Ye2Wct97
	lkK9B1RGMDz3QaeOwPsA1pPH83ciwBGTQnIS0KVwOypZDrH/wQp1mUWr25KWziv3MAUZq0unmF6uj
	nV81mItmnlScUXhP1QfvpH2ZHjiH/eAz+tjfWE4GC+xk1foEsQELotiEO/RdLfos2cHXvtvdZfMBX
	S46bAu4RaTN8nka80kZWQzZBAROMVnklcGYZhhyw3KR1QEsD8R6luy7mlmaajHzje1lSFehSV4g4g
	mXMABs72VY+fPsMpceDhHjYPLkDE49kjRy8JtBYMF/LV2FFt1o7eY/mQBvKYA6WTsKytMAvku88YK
	qV018jCrVAqBiZ8UlfZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAlDd-000v9N-Fs; Tue, 03 Aug 2021 03:35:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAlDa-000v8d-LE; Tue, 03 Aug 2021 03:35:52 +0000
X-UUID: 640a934aa1934e0fb5fb4621a59747ca-20210802
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=aU3UvCi1IbFyB5KtaIThVBbat1eD0yrQK0PdCy+027E=; 
 b=PU73T0HuGn4C+6b9Vu3jwWvIIbgTnHaz8yuS9VpiO/X7iZSOcACPBMpfygcR/XMAHLcgjGzRBTLb/pT74vCIP7ZRsCj/7NJv50T6YzFaa4mnFb/FiZQ8AQkfAUXUap840Cld6d5GOslcvuc8pkMWRcsgVUiWEj8ip7P1+zIeOaE=;
X-UUID: 640a934aa1934e0fb5fb4621a59747ca-20210802
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <mason.zhang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1641707602; Mon, 02 Aug 2021 20:35:43 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 2 Aug 2021 20:31:16 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 3 Aug 2021 11:31:15 +0800
Received: from [10.15.20.246] (10.15.20.246) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 3 Aug 2021 11:31:14 +0800
Message-ID: <1627960488.7721.2.camel@mbjsdccf07>
Subject: Re: [PATCH 2/3] spi: modify set_cs_timing parameter
From: Mason Zhang <mason.zhang@mediatek.com>
To: Mark Brown <broonie@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, <linux-spi@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <leilk.liu@mediatek.com>,
 <wsd_upstream@mediatek.com>
Date: Tue, 3 Aug 2021 11:14:48 +0800
In-Reply-To: <20210802201614.GA39900@sirena.org.uk>
References: <20210719091642.24633-1-mason.zhang@mediatek.com>
 <20210802201614.GA39900@sirena.org.uk>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_203550_741364_0C6A028F 
X-CRM114-Status: GOOD (  11.00  )
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

On Mon, 2021-08-02 at 21:16 +0100, Mark Brown wrote:
> On Mon, Jul 19, 2021 at 05:16:43PM +0800, Mason Zhang wrote:
> > From: Mason Zhang <Mason.Zhang@mediatek.com>
> > 
> > No need pass in spi_delay to set_cs_timing callback.
> 
> This breaks the build:
> 
> /mnt/kernel/drivers/spi/spi-tegra114.c: In function 'tegra_spi_probe':
> /mnt/kernel/drivers/spi/spi-tegra114.c:1328:24: error: assignment to 'int (*)(struct spi_device *)' from incompatible pointer type 'int (*)(struct spi_device *, struct spi_delay *, struct spi_delay *, struct spi_delay *)' [-Werror=incompatible-pointer-types]
>   master->set_cs_timing = tegra_spi_set_hw_cs_timing;
>                         ^

Dear Mark:

	I have fixed this build err in this patch:

https://lore.kernel.org/linux-spi/20210803021328.28291-1-Mason.Zhang@mediatek.com/T/#u


Thanks
Mason
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
