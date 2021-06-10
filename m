Return-Path: <SRS0=J0kT=LE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0B82C48BDF
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Jun 2021 22:23:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C73A613DE
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Jun 2021 22:23:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C73A613DE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xAIAmnxGIEGXKjWVXSd5x8tWaAwXCjVmqEiig+DCta8=; b=WXF8zZPY9W7pzw
	Eha68KnsGYfLBxhGiFAbyUl+TKwy9GLbpG04upEM6yhuP6CqNzhlLwP6nIHJGarYpR797G1AxkA8x
	dV60lnZm646iDEO6Wc9Q3h+mftUvlEZEAM8gcnrHe2Zx1CCC0INk5Q8i+Q+9F472Lv6A8O6PaxqSZ
	HldpJ7KJnca0VKlrlniEEiqspjhziuitBed0o+lusT3KVJiBBOt/45HlAqgwDELF5IslFGt5K2zq1
	khKM9LNm3hS0vX9g30AFwzXMp3Hw6gfbLV5r5HkvR+dVCZKIqjhdoFMF6IItsM23W3AXobYseaj/U
	9HcJVXy0hwTXSECQ2HCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrT58-002l9a-3F; Thu, 10 Jun 2021 22:23:22 +0000
Received: from smtprelay0114.hostedemail.com ([216.40.44.114]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrT4v-002l7l-DI; Thu, 10 Jun 2021 22:23:10 +0000
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave01.hostedemail.com (Postfix) with ESMTP id 1549F18116248;
 Thu, 10 Jun 2021 22:16:04 +0000 (UTC)
Received: from omf16.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
 by smtprelay03.hostedemail.com (Postfix) with ESMTP id F1676837F24C;
 Thu, 10 Jun 2021 22:15:16 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf16.hostedemail.com (Postfix) with ESMTPA id 2C534255104; 
 Thu, 10 Jun 2021 22:15:04 +0000 (UTC)
Message-ID: <fa180c7093b946f2bd86d26d5875db28f80957de.camel@perches.com>
Subject: Re: [PATCH 1/7] checkpatch: check Makefiles and Kconfigs for SPDX tag
From: Joe Perches <joe@perches.com>
To: trix@redhat.com, robh+dt@kernel.org, tsbogend@alpha.franken.de, 
 jic23@kernel.org, lars@metafoo.de, tomas.winkler@intel.com, arnd@arndb.de, 
 gregkh@linuxfoundation.org, nbd@nbd.name, lorenzo.bianconi83@gmail.com, 
 ryder.lee@mediatek.com, kvalo@codeaurora.org, davem@davemloft.net,
 kuba@kernel.org,  matthias.bgg@gmail.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com,  apw@canonical.com, dwaipayanray1@gmail.com,
 lukas.bulwahn@gmail.com,  chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
 zhangqing@loongson.cn,  jbhayana@google.com, sean.wang@mediatek.com,
 shayne.chen@mediatek.com,  Soul.Huang@mediatek.com, shorne@gmail.com,
 gsomlo@gmail.com,  pczarnecki@internships.antmicro.com,
 mholenko@antmicro.com, davidgow@google.com
Cc: devicetree@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com
Date: Thu, 10 Jun 2021 15:15:02 -0700
In-Reply-To: <20210610214438.3161140-3-trix@redhat.com>
References: <20210610214438.3161140-1-trix@redhat.com>
 <20210610214438.3161140-3-trix@redhat.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 2C534255104
X-Stat-Signature: hbs5edjb7ssp137oygbp83agndwobmm6
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX188Q7ACCxeE8e0t3mWcK2DFYS2XGLRcOCk=
X-HE-Tag: 1623363304-278120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_152309_528388_EE572862 
X-CRM114-Status: GOOD (  10.94  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2021-06-10 at 14:44 -0700, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> =

> Both Makefiles and Kconfigs should carry an SPDX tag.
> Something like
> =A0# SPDX-License-Identifier: GPL-2.0-only
> =

> Add a matcher to existing check
> =

> Signed-off-by: Tom Rix <trix@redhat.com>

Seems fine, thanks.

There's a Makefile with two tags that could be updated too.
---
 drivers/staging/media/atomisp/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/Makefile b/drivers/staging/media=
/atomisp/Makefile
index 51498b2e85b8f..cee03e31f420d 100644
--- a/drivers/staging/media/atomisp/Makefile
+++ b/drivers/staging/media/atomisp/Makefile
@@ -11,7 +11,6 @@ DEFINES +=3D -DDEBUG
 =

 atomisp =3D $(srctree)/drivers/staging/media/atomisp/
 =

-# SPDX-License-Identifier: GPL-2.0
 atomisp-objs +=3D \
 	pci/atomisp_acc.o \
 	pci/atomisp_cmd.o \



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
