Return-Path: <SRS0=BnLp=IJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E55B1C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Mar 2021 05:46:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87C8964E46
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Mar 2021 05:46:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87C8964E46
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:Message-Id:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VSFRcgLhV492XvhzlQnFf6RojOT9vwBQOR+fk+bYhCw=; b=c+vgO68XImyRQBz97Sg48DFCT
	yQXJTZsVD9VQUoh7tFLrWf/UglVojmyxHD41uF5TTplHHEBjdmIVdK55DZGbd7qHRbaIf4IDgbeWG
	8mBdjyWLjfRi6Zvv5rKi0jOobdIQkgEiOuwRvNRcsNhQmviIpGzwWqdn957cOw3nde0d5W/C+Q2EB
	BMA2W2NOKUpRcL9wg33wqaTA9uphEhQl1hcivRBTyhcv8KbdcLn96pZPfFjML6coQBIKRMcQh4dnx
	ifgvf+3UuLewutIOgi2vZZmOcorarvuzXkWw1kx5wFlUE/bJUfvqawA9RJlkhzVDA6/HiZvQyMN1r
	qcnw+2Bug==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKE9L-008Q6P-HJ; Thu, 11 Mar 2021 05:46:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKE8x-008Q1m-BK; Thu, 11 Mar 2021 05:45:59 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 36DB164E46;
 Thu, 11 Mar 2021 05:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1615441553;
 bh=gFsS+ZhcKhKH6qL5gTXskivdxZUxVLc/m9X2ZpgUe+Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OHIU/hI3nryGud2Pg/Db1a3HTIa7a/JS5yCaEueouoftYOkBFAOYSXC0KWPSu+6IY
 UPYRLsZBWqZxUgk9Wxrp9phIFNrgrFv9phUaIoiwANzRGv6YhL4ybYEoWAxNoC0iWe
 Uw3M+AKFMDXjT2gy+e7dqRLpdp5nSa/w75Os8qGc=
Date: Wed, 10 Mar 2021 21:45:52 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Walter Wu <walter-zh.wu@mediatek.com>
Cc: Alexander Potapenko <glider@google.com>, Dmitry Vyukov
 <dvyukov@google.com>, Nathan Chancellor <natechancellor@gmail.com>,
 "Arnd Bergmann" <arnd@arndb.de>, Andrey Konovalov <andreyknvl@google.com>,
 <kasan-dev@googlegroups.com>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 wsd_upstream <wsd_upstream@mediatek.com>,
 <linux-mediatek@lists.infradead.org>, Andrey Ryabinin
 <ryabinin.a.a@gmail.com>
Subject: Re: [PATCH v4] kasan: remove redundant config option
Message-Id: <20210310214552.6dcbcb224c0ba34f8e0a0a54@linux-foundation.org>
In-Reply-To: <1615426365.20483.4.camel@mtksdccf07>
References: <20210226012531.29231-1-walter-zh.wu@mediatek.com>
 <1614772099.26785.3.camel@mtksdccf07>
 <1615426365.20483.4.camel@mtksdccf07>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_054556_137339_E1922F88 
X-CRM114-Status: UNSURE (   9.56  )
X-CRM114-Notice: Please train this message.
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

On Thu, 11 Mar 2021 09:32:45 +0800 Walter Wu <walter-zh.wu@mediatek.com> wrote:

> 
> Hi Andrew,
> 
> I see my v4 patch is different in the next tree now. please see below
> information.
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=ebced5fb0ef969620ecdc4011f600f9e7c229a3c
> The different is in lib/Kconfig.kasan.
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/diff/lib/Kconfig.kasan?id=ebced5fb0ef969620ecdc4011f600f9e7c229a3c
> 

They look the same to me.  I did have `int' for KASAN_STACK due to a
merging mess, but I changed that to bool quite quickly.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
