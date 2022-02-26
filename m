Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 519C0C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 26 Feb 2022 09:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/QozSVhU8TnyRrkUuvpGur7oDMpDn9Mr1xdIaE+bFZk=; b=COglG7YQE+TvH2
	MCBVxYESRlL21o6tqi57Cd9SOHM9X9BWB41jcwdgaJgYJ+zbHH6AkMCjvIIP2RfQz6yZfOj0o6JFH
	n1SYPwKsPCrnFVoWgewwfZ0DRfDDWX1eyur4MILUYhjdFfkpth0valk+QU1d7s5eQCSp8lmJQICY0
	5cHsNbVQrnbUhnICZX5gQx4yx7CuHPwxNbY8ZYxR/JXedlexV3AbMzpg3P7myGYN7mraS0ItZHaLV
	RFGDq+zznFmwVtDxxailSd/9nKnQiWnK2wZ+NbRneHtz3YzsMEHjUNHTr302EoIc5Cvfpw71tHexA
	7jNPdgwAsaADSawuMqlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNtl7-007pie-HL; Sat, 26 Feb 2022 09:53:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNtkr-007pfx-In; Sat, 26 Feb 2022 09:52:48 +0000
X-UUID: 0a04290171ca4851a1912e7c300c0c84-20220226
X-UUID: 0a04290171ca4851a1912e7c300c0c84-20220226
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <lecopzer.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1564484666; Sat, 26 Feb 2022 02:52:39 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 26 Feb 2022 01:52:37 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 26 Feb 2022 17:52:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 26 Feb 2022 17:52:23 +0800
From: Lecopzer Chen <lecopzer.chen@mediatek.com>
To: <pmladek@suse.com>
CC: <acme@kernel.org>, <akpm@linux-foundation.org>,
 <alexander.shishkin@linux.intel.com>, <catalin.marinas@arm.com>,
 <davem@davemloft.net>, <jolsa@redhat.com>, <jthierry@redhat.com>,
 <keescook@chromium.org>, <kernelfans@gmail.com>,
 <lecopzer.chen@mediatek.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-perf-users@vger.kernel.org>, <mark.rutland@arm.com>,
 <masahiroy@kernel.org>, <matthias.bgg@gmail.com>, <maz@kernel.org>,
 <mcgrof@kernel.org>, <mingo@redhat.com>, <namhyung@kernel.org>,
 <nixiaoming@huawei.com>, <peterz@infradead.org>,
 <sparclinux@vger.kernel.org>, <sumit.garg@linaro.org>, <wangqing@vivo.com>,
 <will@kernel.org>, <yj.chiang@mediatek.com>
Subject: Re: [PATCH 1/5] kernel/watchdog: remove WATCHDOG_DEFAULT
Date: Sat, 26 Feb 2022 17:52:23 +0800
Message-ID: <20220226095223.15585-1-lecopzer.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <YhjPyCl7Rjh6acQN@alley>
References: <YhjPyCl7Rjh6acQN@alley>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220226_015245_652611_33E76433 
X-CRM114-Status: GOOD (  10.12  )
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

> On Sat 2022-02-12 18:43:45, Lecopzer Chen wrote:
> > No reference to WATCHDOG_DEFAULT, remove it.
> 
> It would be enough to mention the link to the previous
> version in the cover letter.

Thanks, I'll tweak the commit message in next version patch.

> 
> > this commit reworks from [1].
> > 
> > [1] https://lore.kernel.org/lkml/20211014024155.15253-2-kernelfans@gmail.com/
> > Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
> > Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
> 
> Reviewed-by: Petr Mladek <pmladek@suse.com>


BRs,
Lecopzer

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
