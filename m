Return-Path: <SRS0=ivGG=LP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A8B6C48BE5
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jun 2021 09:58:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C70FB60FD8
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jun 2021 09:58:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C70FB60FD8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oP2taUtoaduo4ze3JkV7PtvUdZEPKf6r/Ng9eq1v2+M=; b=vVOMXW3cgeeD6p
	6m8ruEqJeG21dp5alfF7TJZUJB1YDn6Opl9JK8G3WWzceJujOqNHIhfO7PBnqnUU0WMfA+r/IescP
	zJkv7O6742mIIzGjX8ZIGNwNJmF4n+KZCaYVnjZwJjWx9SExb+UoIYjjy28epskPiAoOkEZtxy/xG
	UuSJhFF5pVGokplrLlnwh61mvrkWJZKAFK+MnGrYDhyZR9WFrOACQzK9I7oyeIMOCQx3ZiwKUXwOb
	ZQ/QzsTy5vwbxpnhkRLIJpljOJwfwJh+gvzZIOG94TB2OyZqANZSsy9//zA5rpyVMAsDYOkK54ELD
	GfNq+vX/FCNHEhRA430A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvGh9-003226-17; Mon, 21 Jun 2021 09:58:19 +0000
Received: from elvis.franken.de ([193.175.24.41])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvGh5-003205-Vn; Mon, 21 Jun 2021 09:58:17 +0000
Received: from uucp (helo=alpha)
 by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
 id 1lvGd7-000490-01; Mon, 21 Jun 2021 11:54:09 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
 id 7E0F4C071C; Mon, 21 Jun 2021 11:46:02 +0200 (CEST)
Date: Mon, 21 Jun 2021 11:46:02 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: trix@redhat.com
Cc: robh+dt@kernel.org, jic23@kernel.org, lars@metafoo.de,
 tomas.winkler@intel.com, arnd@arndb.de, gregkh@linuxfoundation.org,
 nbd@nbd.name, lorenzo.bianconi83@gmail.com, ryder.lee@mediatek.com,
 kvalo@codeaurora.org, davem@davemloft.net, kuba@kernel.org,
 matthias.bgg@gmail.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, apw@canonical.com, joe@perches.com,
 dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com,
 chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
 zhangqing@loongson.cn, jbhayana@google.com, sean.wang@mediatek.com,
 shayne.chen@mediatek.com, Soul.Huang@mediatek.com, shorne@gmail.com,
 gsomlo@gmail.com, pczarnecki@internships.antmicro.com,
 mholenko@antmicro.com, davidgow@google.com,
 devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 4/7] MIPS: Loongson64: fix spelling of SPDX tag
Message-ID: <20210621094602.GB4425@alpha.franken.de>
References: <20210610214438.3161140-1-trix@redhat.com>
 <20210610214438.3161140-6-trix@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210610214438.3161140-6-trix@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210621_025816_221010_87D92C5E 
X-CRM114-Status: GOOD (  11.93  )
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

On Thu, Jun 10, 2021 at 02:44:35PM -0700, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> checkpatch looks for SPDX-License-Identifier.
> So change the '_' to '-'
> 
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  arch/mips/boot/dts/loongson/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
