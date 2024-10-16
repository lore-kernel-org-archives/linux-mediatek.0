Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D93D206AC
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Oct 2024 07:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FZskOy09UAjygGb98+6VbP3tWaiG5VJrZLZzzfhcugM=; b=n8zYeGnWoAaDD+JHHiFufJexCS
	2kjDoEc57qFYDNyRfzNShLuC9JqcgVBN+bZ7q5ot3ODR9TQ4AaddXpI1SU7NFMP7E2cEaKAfInFrq
	MI+kIdsR9WsgAPDuVuUUrWkBg83Z0TPxn4wZ+4i+sV4b6WDaemGcXEQpRF+lcLxFWFcSQaAS1B2tt
	DfZsWEwjcH0Pq1PQ8Hd/9x41vE++H9s4kQB5ewXD2/AEOjgjDOTV+YJHAcIbViRT6sySTtzdE7A9c
	OPKhGSxASswBgSeN1xqFdVKZoPecxlcCoMEbeDzS74Y+OumqSFIvcQ4Hctf1SmsE2OFdSCB6kVgGN
	2Yj88f1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0ytN-0000000Aubn-460c;
	Wed, 16 Oct 2024 07:56:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0yqI-0000000Atmu-2uGF;
	Wed, 16 Oct 2024 07:53:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C12DB5C5A63;
	Wed, 16 Oct 2024 07:53:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 316B0C4CEC5;
	Wed, 16 Oct 2024 07:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729065193;
	bh=CdR8EE//SOPyuvKFZrlrubTDwzoKKu3oOsW6BoIRT24=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rQOZyXIfzz2lA1I0B3vM5sYcykRSJla3uMsKGR3du0xOeKnKDf+6wUcX12ZNnWrar
	 dUk1bicChzZH/BA6FHgyRvQbhFvGgqDX1Hey9pZ/qFDky27iffuKDd5xEKfgVebpJb
	 GdJzSYVM8rI8VZlCp1/oHJXQksqXI29WVQBPg0bfa4zl96/BUs1Qh274rSGxI0yquE
	 dBHZh5YGOLebIyGCqairav3qIbETpaXv0jqOjOKyQG+/DPOExPmWumjpw5cqY1BK8C
	 VXnkJmjW0Thfo4fhnO6dnIhwUS5W74uAzKZ796dHnO6cF98ibmD8F5SPvqqBBV2eBT
	 ZBFMaefss7ivg==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, Suraj Sonawane <surajsonawane0215@gmail.com>
Cc: angelogioacchino.delregno@collabora.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-leds@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 matthias.bgg@gmail.com, pavel@ucw.cz
In-Reply-To: <20241016042142.8088-1-surajsonawane0215@gmail.com>
References: <20241015085842.GC8348@google.com>
 <20241016042142.8088-1-surajsonawane0215@gmail.com>
Subject: Re: (subset) [PATCH v2] leds: Fix uninitialized variable 'ret' in
 mt6370_mc_pattern_clear
Message-Id: <172906519188.1139310.1418498131501157586.b4-ty@kernel.org>
Date: Wed, 16 Oct 2024 08:53:11 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_005314_797891_5307B7B3 
X-CRM114-Status: UNSURE (   6.26  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 16 Oct 2024 09:51:42 +0530, Suraj Sonawane wrote:
> Fix the uninitialized symbol 'ret' in the function mt6370_mc_pattern_clear
> to resolve the following warning:
> drivers/leds/rgb/leds-mt6370-rgb.c:604 mt6370_mc_pattern_clear()
> error: uninitialized symbol 'ret'.
> Initialize 'ret' to 0 to prevent undefined behavior from uninitialized
> access.
> 
> [...]

Applied, thanks!

[1/1] leds: Fix uninitialized variable 'ret' in mt6370_mc_pattern_clear
      commit: 6cbf5c99541ac681cf5c6155b582dfbcd879eae3

--
Lee Jones [李琼斯]


