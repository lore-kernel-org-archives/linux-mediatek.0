Return-Path: <SRS0=oSKo=II=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED209C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Mar 2021 08:55:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5994964FEF
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Mar 2021 08:55:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5994964FEF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JYRA+da1mdOg8WBQjiBS23cBys8rBVM5CstgCF7YnZk=; b=Jpu/ubgXsXJJBfUqw8VHw5stq
	iYgZt2T3KHCTiHTJ9K1xbkHVeoU7kO0kARB3FIUqauMggaIsgEIeVQv0JZ+Ce3ODJZ38lS9n+gfkI
	Dq1fh2mgn0zc8dQ/i5k2VJu6+ckKVfM2sdx3FZFXhITd2h1AIeDsJWNC2S7DewCEcTuHNRitDPcxl
	mcImtIOG/46unYalmwAnuJwKBkyjZHHj+x0CSxP8epT/5FenOZRHqP5t88oI2LmMPftgzFG/LkvfO
	KU9AZ55OoAHbNir5wIwHjaeo/eDrdIGhfLG0dF0Vbbd8BV9E8BwXmY5KezFhgNLgPeaT9BX86UNQp
	xkE7hAqTQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJucR-006NAu-Pr; Wed, 10 Mar 2021 08:55:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJuc4-006N6U-Hb; Wed, 10 Mar 2021 08:54:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8A1AF64FE2;
 Wed, 10 Mar 2021 08:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1615366478;
 bh=/Pb3Pqj6xPlhaw9BQdMhiUyimBZOyzlbK5I639vLzAQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bvggVSiT/dNDyvL3kRyqa64L7i2oAjrj9x1bkCQf1cRXrLUp2DbT2SFgntQYjtTyk
 imB9pRQgKuPPOBPGguh4c0WEMkKwVe5s/bexNtBdEMU1klw/LVjsbjhCu8wNQuXZMX
 fGnp8WAImU6LcaF52WkpGo5r2HYLk93EQBcF8SAY=
Date: Wed, 10 Mar 2021 09:54:35 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v4 01/12] dt-bindings: usb: fix yamllint check warning
Message-ID: <YEiJS0fPCOPOdlIq@kroah.com>
References: <20210308053745.25697-1-chunfeng.yun@mediatek.com>
 <20210310022811.GA1612587@robh.at.kernel.org>
 <1615346469.26498.1.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1615346469.26498.1.camel@mhfsdcap03>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_085440_951533_222245C4 
X-CRM114-Status: GOOD (  10.44  )
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

On Wed, Mar 10, 2021 at 11:21:09AM +0800, Chunfeng Yun wrote:
> On Tue, 2021-03-09 at 19:28 -0700, Rob Herring wrote:
> > On Mon, Mar 08, 2021 at 01:37:34PM +0800, Chunfeng Yun wrote:
> > > Fix warning: "missing starting space in comment"
> > 
> > What tree is this in because I don't see it.
> The patch is based kernel 5.12-rc1, also happens on
> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next

My branches are now rebased to not be on 5.12-rc1 because of the
problems with it, so please refresh and provide a "Fixes: " tag in your
updated patch.

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
