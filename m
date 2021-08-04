Return-Path: <SRS0=9YCi=M3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CF55C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 17:41:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E182A60187
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 17:41:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E182A60187
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=smjsI1z408Rb7XwsjA/HlqO8sgt/1xMtrnOwNNHCr2k=; b=tDhaLyoBgeUnfmT78eOrE3qv0B
	nBGqw9QR7ad78DRF7MX7FB58g4aSPFTljinsCIgoPGx+xfpXUNDFV5iIprx5/+IFBw5FJ4czJtDwg
	zmkwSzeWvuBHQKNEUni/8COjtCh4zAK1SPqHr7pWTxM6OBKAN4NJaM+7roY5Gd6dFQ5d5LqnieAeu
	h4ImT07+XaeQnHoJnKZlg0GUNL1E3nW2EK1CF+x05SUzuEoXZAEzl6LCCyjPaBaqI8r9rKoNQJ38r
	d+DEo1kIehbXMShOwga2DKqG2CV7FCRTI3qcOj2+YF2q6n+t30mtO1R/h4RBQbCApvL7RFbks40gB
	SAuAF1IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBKti-00750J-FL; Wed, 04 Aug 2021 17:41:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBKtT-0074vY-BK; Wed, 04 Aug 2021 17:41:28 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 61ABE60F58;
 Wed,  4 Aug 2021 17:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628098886;
 bh=U3KRI9kii54Qtwjzrk1Npm0+r70GBdSKFuG2YWpj8Zs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pU63zVaxR7SVGjYaZ1Q4pfjg/faIfFdI++PoYbJcFl0jXLivXvRnyuviYLVqhYNEf
 xmxIwneFk+eYH0haBMUh47iwR+39xEg7Og+0wO7w+iP9eEZO0508e2Arbq/NqueZKg
 ZblbMpOSYb1P7JOKysDIJ8qBzlXj4KyyFHN3KnYkLp0XiExa4zlxFLthOgeuWh42/c
 B3FALwvf0AxKKnAtyjXGq/ZMDZQlMWHwJ0DVmC7HtLnTmZUZmThfSOCXHep99djY1l
 E/vxECJucdUs1bzZxLzKZyDFH42bAuAV6mB9LO2g1rVvygsmy3omQHtECRJK24SDBB
 /8QkbPQqdgmcQ==
Date: Wed, 4 Aug 2021 13:41:25 -0400
From: Sasha Levin <sashal@kernel.org>
To: Eric Woudstra <ericwouds@gmail.com>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH AUTOSEL 4.19 5/6] mt7530 fix mt7530_fdb_write vid missing
 ivl bit
Message-ID: <YQrRRar2TymxP2WP@sashalap>
References: <20210727132015.835651-1-sashal@kernel.org>
 <20210727132015.835651-5-sashal@kernel.org>
 <e1508978-8f0e-40a6-baa8-3d3bc4c82811@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e1508978-8f0e-40a6-baa8-3d3bc4c82811@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_104127_447747_9A7911C2 
X-CRM114-Status: UNSURE (   7.73  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Jul 31, 2021 at 03:27:04PM +0200, Eric Woudstra wrote:
>
>A few days after this patch, I send in another as it needs a fix. If you apply this patch, please also apply the other: set ivl bit only for vid larger than 1.

Looks like the fix didn't make it yet, so I'll drop this one for now.

-- 
Thanks,
Sasha

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
