Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C44ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Oct 2022 10:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Svfv6DB2HuWDYW0isZn+QSgpRwNNZ6Rt+ZreWXI15HU=; b=LSLjMCQPlo9DXLQMK0VOimL+4e
	SwaLrQNHiA70a+yy/9jIxqa2v1UtEeLiyUjdIa8l6kZ1K0Z542rczGHjLyY3tvxvVehXPZvIcPK/q
	ljrJ6+Z4JxTMtdPyHm8p5WLogwG4hTM7uNmzPsChbUgitNnd+qSMIwxO9BtHe0Oh+FhrceUGUuwab
	+/aGY7u4o5vY5p51guPp9w4B/rMwbOGNpy+POhbFAS0VXopN3F08rIfTlrSrEhYyNpQI31zeLE3T3
	MsAYcFmxOnYokeO5BK59sPBhQA6+nyVc7LVHOJ7xNM6XsyikuVmtI5oRlD+L9NoO6tSsJIFVqCB3Z
	NpWWbBvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooMhX-00Ggjl-Hf; Fri, 28 Oct 2022 10:34:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooMhB-00GgZ8-V9; Fri, 28 Oct 2022 10:34:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 847B36274A;
	Fri, 28 Oct 2022 10:34:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95CA4C433C1;
	Fri, 28 Oct 2022 10:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666953276;
	bh=vbUQh2sICA0O+YdVcFaCsEzhcEqIniAEZEJg7KH51XU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mb1mY1Puw7lmCdsg/07UkdocMqy3bUsrUDvYLt9WxHJqwHIZ9Rd8BsSDMKGw3Zfzh
	 RtiFDztnVGX15xC0sLiZvFoROWwZZIbE1BLNXkF4PdnG8mEGFwFEdEOaPpHlvx6baV
	 bohOEFZ//UJpXYnv8t8MU8V1UH8V683y/wpXgecs=
Date: Fri, 28 Oct 2022 12:34:34 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Anastasia Belova <abelova@astralinux.ru>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: Re: [PATCH 5.10 0/1] vdec_vp9_if: add check for NULL for
 vsi->frm_bufs[vsi->new_fb_idx].buf.fb in vp9_swap_frm_bufs
Message-ID: <Y1uwOsYjx7EbOyHX@kroah.com>
References: <20221028100539.30925-1-abelova@astralinux.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221028100539.30925-1-abelova@astralinux.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_033440_390373_CDBC404D 
X-CRM114-Status: GOOD (  11.29  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Oct 28, 2022 at 01:05:38PM +0300, Anastasia Belova wrote:
> Null-pointer dereference was found with static analysis tools 
> in version 5.10. Seems this file doesn't exist since 5.18.
> This file was moved to 
>     /drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_if.c.
> Maybe it is necessary to create another patch for these updates.

Fix this in Linus's tree first, and then worry about any potential need
for stable backports.

thanks,

greg k-h

