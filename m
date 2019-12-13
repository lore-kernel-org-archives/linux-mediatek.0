Return-Path: <SRS0=P2Dl=2D=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB5C8C43603
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Dec 2019 22:26:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91E55214D8
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Dec 2019 22:26:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bFgiTXVD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91E55214D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YMn9nZQVy5SPijg6sGpE3gMqAuSWtuumR1FJpya/EJY=; b=bFgiTXVDGD1CM2
	c+fvwt+KlIFdLKpe2LAiFl3pp2EOFftO/UZJhcMxJhHNZ63PRrX9+B9n1TxofX6kF/zpf0MmudvuL
	5ScZz4KcKq3GRkfKPvRuqW+zavtDHhJCcLoiAK6Z1QHZxx0VuIi6l3gRR1jUVL163BE0krNpIxrpm
	x/GeY++Uv5af/CdC+4mV3AGEjK9NOspmXt09yyemuwkh51HrEZruwoN4F0ETuDphwgl55MXjrQ6A6
	jghWW16QFLMZ3IF2bPUldL4tItGDXSDdk2xwpyMMPN0xfF4uPwODWJ/+YUPw1gSQLAqZmNKyTFLwj
	PWZWoF3s2Lvd357xq/1w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ifqL5-0004Qa-4R; Fri, 13 Dec 2019 19:10:59 +0000
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifqKs-0004Fn-6R; Fri, 13 Dec 2019 19:10:47 +0000
Received: by mail-ot1-f68.google.com with SMTP id h20so324982otn.5;
 Fri, 13 Dec 2019 11:10:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qHsUIESi47GUujK3ymDIbUW6G62I8FASealFyFb2qxM=;
 b=q+qEpUGcYL4Ok1EaXdNTVYHa8popEyOmJP8hCMTVQneB2EWM5FQufY5kuy2ZRnpSaC
 UkBlNtZfEk01D1zg0OP/LByQPoIXPeLbAJAUr5KaRMxrLWki7jXVaCqy9HgChdeC6LiQ
 ErAo8vBeKkZUbV9wHBrS9vsTwqLXwfBRN2Xnqs26tIUhZ3LSps4+vQ6mKJRzcvd/AGSC
 zPQw8Vn5TJK0g9+fbr04jmbNYmYQlbUrTkVt1Rkh7Ssw08pO7B77UyvpYmbRQ/6Q23rQ
 XnE3B/B7gTGFEbWVCBZsGeYftSBeo1DtpaMRWZQQUUchtJYSpupbVJLab2cjGB0eY8GZ
 9mbg==
X-Gm-Message-State: APjAAAVLglFTKO3AbJRmgi4kvQ2PwJAof0vUqHvYMnYJJeh1H+GC4hLw
 gCgzxS9lIofmB21/iIBtmQ==
X-Google-Smtp-Source: APXvYqzHxWniZ5J9xfopYjECrU07WUzV4L9U6fU6FRGgt1nEiyBXlgj3TRlcGj+V/4Fj0x84/KDZiQ==
X-Received: by 2002:a9d:53cb:: with SMTP id i11mr16760478oth.158.1576264244638; 
 Fri, 13 Dec 2019 11:10:44 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id b3sm3550697oie.25.2019.12.13.11.10.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 11:10:44 -0800 (PST)
Date: Fri, 13 Dec 2019 13:10:43 -0600
From: Rob Herring <robh@kernel.org>
To: Ming-Fan Chen <ming-fan.chen@mediatek.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: mediatek: Add binding for MT6779 SMI
Message-ID: <20191213191043.GB28558@bogus>
References: <1575872371-671-1-git-send-email-ming-fan.chen@mediatek.com>
 <1575872371-671-3-git-send-email-ming-fan.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1575872371-671-3-git-send-email-ming-fan.chen@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191213_111046_239122_6E07301D 
X-CRM114-Status: GOOD (  10.71  )
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
Cc: devicetree@vger.kernel.org, Joerg Roedel <jroedel@suse.de>,
 wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Ming-Fan Chen <ming-fan.chen@mediatek.com>, Yong Wu <yong.wu@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 9 Dec 2019 14:19:30 +0800, Ming-Fan Chen wrote:
> This patch add description for MT6779 SMI.
> 
> Signed-off-by: Ming-Fan Chen <ming-fan.chen@mediatek.com>
> ---
>  .../memory-controllers/mediatek,smi-common.txt     |    5 +++--
>  .../memory-controllers/mediatek,smi-larb.txt       |    3 ++-
>  2 files changed, 5 insertions(+), 3 deletions(-)
> 

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
