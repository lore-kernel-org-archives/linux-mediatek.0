Return-Path: <SRS0=hSNv=LK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82A16C48BE5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Jun 2021 16:03:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F93661246
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Jun 2021 16:03:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F93661246
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/VyKz+Hf6Y+BcSVbTQpvqKPV31rcGmIXxAIBZcVN46o=; b=zb015dLEuQ1DmP
	qx+8spYyDcV5wGEyFBUkIKOcpbW/13/xjhdxhmvIz1ZZp7gUxUDvg+m4LuRT03PTocOrfD51baruR
	EQ+XDJ4yHYMuaXw6C7CQVLv2V6CBOjxMucSF4Uz8nOSK9fprYowjSamj/TXm0q/28xHfDbYrVVo7k
	aZAOOJVXqPRckTro75ILJmEOF+9ILiQ2H7IAMvNm/v4cAJ1E8WKrypyAKxXtd5QQuYF3LQQqqo/+T
	379mSORwI5TcR1xaBZn0D8hdPEA2JxO7OTyeTEQpZqd2ERdWHK91cww0pMOA0pDVRa9BiKnBQQVmJ
	NhH0osHynNB7NRih9b2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltY0G-007312-Cg; Wed, 16 Jun 2021 16:02:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltXzq-0072qw-9P; Wed, 16 Jun 2021 16:02:31 +0000
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 17CC561159;
 Wed, 16 Jun 2021 16:02:29 +0000 (UTC)
Date: Wed, 16 Jun 2021 12:02:27 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Cc: <peterz@infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <matthias.bgg@gmail.com>, <mhelsley@vmware.com>, <samitolvanen@google.com>,
 <yj.chiang@mediatek.com>
Subject: Re: [PATCH v4] recordmcount: Correct st_shndx handling
Message-ID: <20210616120227.6fc005c3@gandalf.local.home>
In-Reply-To: <20210616154126.2794-1-mark-pk.tsai@mediatek.com>
References: <20210616154126.2794-1-mark-pk.tsai@mediatek.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_090230_419432_C446F289 
X-CRM114-Status: GOOD (  11.71  )
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

On Wed, 16 Jun 2021 23:41:26 +0800
Mark-PK Tsai <mark-pk.tsai@mediatek.com> wrote:

> From: Peter Zijlstra <peterz@infradead.org>
> 
> One should only use st_shndx when >SHN_UNDEF and <SHN_LORESERVE. When
> SHN_XINDEX, then use .symtab_shndx. Otherwise use 0.
> 
> This handles the case: st_shndx >= SHN_LORESERVE && st_shndx != SHN_XINDEX.
> 
> Reported-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Tested-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> [handle endianness of sym->st_shndx]
> Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> ---

Thanks, I pulled this in and started the testing.

-- Steve

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
