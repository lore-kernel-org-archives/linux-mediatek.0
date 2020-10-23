Return-Path: <SRS0=bV6b=D6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6891C388F9
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 11:22:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21FE72084C
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 11:22:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E/8NE5Ry";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yb+qgd3f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21FE72084C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2aQnBwt4DxrMq86cTfa0bV7s29gscL+BBKcFyV+UpUM=; b=E/8NE5Ry/2jt+wh/5aReu/gDC
	bRqv7/UYKBgHbTXaez496mDiA9uLWShStSMIIW1UXQKIZpChVjzyM903MX9TX4LrRSpqBAtFZaChT
	WxQzuHMmaiHPWgB2d1bPLLhozJLr7/+lgr2BBFoBKPfvjRlZbPAjUK/mj7OktzltdN4RnizX5y+SL
	EnQls7bCTbGELkAA/0c/ilz9Op6NXBVC3Ca3kNR/pKtnwI3c+JtXhO9TT8PkNCwhz6tQ4i6yGjteq
	IcpN4XNNR8ei3PeKst0Vlpvyqivx7VQUq9oEkIOlrp8EtzuqlXe+GMri1DRv+YgfC++M//xN7rFBs
	U5uBCqzUA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVv90-0000sw-78; Fri, 23 Oct 2020 11:22:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVv8v-0000rI-Cu; Fri, 23 Oct 2020 11:21:58 +0000
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B2AAC207BB;
 Fri, 23 Oct 2020 11:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603452116;
 bh=Q6EJmyqOf5tfjZLlhH9Oj+yDC1RmgGtXR6z9A920tEg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Yb+qgd3fCLrqV+aHUHGJYDg7C+r0yjseSv5PVATRi+wMwUB+1hSavsi7MbzibCDq5
 tPJJRtCDQITBgw8ZrYT3Ci85G2m8k3Mf8golIIWK1mnoHp9BLfgHYgzO1PWCkYj49/
 WwBTs0VMggQ92LKsSkWQ9nivsF8U3CeHVgZQ/EQ8=
Date: Fri, 23 Oct 2020 12:21:49 +0100
From: Will Deacon <will@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v3 11/24] iommu/io-pgtable-arm-v7s: Quad lvl1 pgtable for
 MediaTek
Message-ID: <20201023112148.GB20933@willie-the-truck>
References: <20200930070647.10188-1-yong.wu@mediatek.com>
 <20200930070647.10188-12-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200930070647.10188-12-yong.wu@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201023_072157_518234_987F08DE 
X-CRM114-Status: GOOD (  17.01  )
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
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, kernel-team@android.com, Joerg Roedel <joro@8bytes.org>,
 Greg Kroah-Hartman <gregkh@google.com>, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, ming-fan.chen@mediatek.com,
 anan.sun@mediatek.com, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Sep 30, 2020 at 03:06:34PM +0800, Yong Wu wrote:
> The standard input iova bits is 32. MediaTek quad the lvl1 pagetable
> (4 * lvl1). No change for lvl2 pagetable. Then the iova bits can reach
> 34bit.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/iommu/io-pgtable-arm-v7s.c | 13 ++++++++++---
>  drivers/iommu/mtk_iommu.c          |  2 +-
>  2 files changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iommu/io-pgtable-arm-v7s.c b/drivers/iommu/io-pgtable-arm-v7s.c
> index 8362fdf76657..306bae2755ed 100644
> --- a/drivers/iommu/io-pgtable-arm-v7s.c
> +++ b/drivers/iommu/io-pgtable-arm-v7s.c
> @@ -50,10 +50,17 @@
>   */
>  #define ARM_V7S_ADDR_BITS		32

If we rename this to _ARM_V7S_ADDR_BITS can we then have ARM_V7S_ADDR_BITS
take a cfg parameter and move the arm_v7s_is_mtk_enabled() check in there?
Same for _ARM_V7S_LVL_BITS.

That would avoid scattering arm_v7s_is_mtk_enabled() into all the users.

Will

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
