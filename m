Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2700EC4707B
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jan 2024 19:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0imiBNAmxYdjFrN91N+Gr3Ke3cIJ1Iq7tWli0ojzx6g=; b=F/eqVqp2cJtPxYQ6KKyWUsMCb/
	twNNlJkKF6SSlbAEk/8+m8pIM1ewNlyfzxq86Xqr82zLG9qzSBjAGcnwqHtgHQYwswgQjod3jGRgM
	3uM54elLQSscHMFI9J8a7K9FlqfffLuhXAdlFYbP7slW9ZPAWwDSVhZJR2gjQkqYGNJ8B1GRugQpw
	E2oFxhrhelQBbJeXhWlXjN0x34efiObiwOhiCVd5P4EiA/Jj+Kp09jx6o8JpXDF+PSEFVx/L+Kw57
	KpIwDKdn3x+TukSpi3sZQdf+vyP8iJmHdC5INkfKx0i4BT8lLk9GOd35Hp2S79NjeF3vW7+IUoyIv
	UnWvtd2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNHQl-009Ebr-0Y;
	Tue, 09 Jan 2024 19:06:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNHQh-009EZS-2K;
	Tue, 09 Jan 2024 19:06:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8425061515;
	Tue,  9 Jan 2024 19:06:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B5E7C433C7;
	Tue,  9 Jan 2024 19:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704827179;
	bh=0imiBNAmxYdjFrN91N+Gr3Ke3cIJ1Iq7tWli0ojzx6g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MjZtUgOZvQGQl18Kb0i7Od4ej24M4wYIlxaH3LHBBFvTzGYNOw6xpBm4TpJdQoQtd
	 wLZdd1rRiOeaoJQeODjChVJsIFYNZaAXWN4WDynOjY3SXqXmk+KadiXhwOjDsb17OE
	 lM4J/qEf/5jJ73PruB6olUaSOe/d0bT7x9I1QCdL22G4nvlziD0r2mkzEB6HTdzNI1
	 VPQBPqg4Ef7Zyn8cLC/5PORvB0QsKep7Ux6AF6PEQX/1e77Eo/nY4Yuy2+9FtzXDE0
	 Bl2rn15DbWRbYZD5sx0lvPiS+/ouRgipB7YdjwWZX/Qz0XfFlhS/Y7z9FsY6rinf3a
	 QWLXkvSz2YvPA==
Received: (nullmailer pid 2960236 invoked by uid 1000);
	Tue, 09 Jan 2024 19:06:17 -0000
Date: Tue, 9 Jan 2024 13:06:17 -0600
From: Rob Herring <robh@kernel.org>
To: Eugen Hristev <eugen.hristev@collabora.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, bin.liu@mediatek.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, kernel@collabora.com, matthias.bgg@gmail.com
Subject: Re: [PATCH v2 1/2] dt-bindings: media: mediatek-jpeg-encoder: change
 max iommus count
Message-ID: <20240109190617.GA2958445-robh@kernel.org>
References: <20240102103801.268647-1-eugen.hristev@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240102103801.268647-1-eugen.hristev@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240109_110627_898531_1DA98FFE 
X-CRM114-Status: UNSURE (   9.70  )
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

On Tue, Jan 02, 2024 at 12:38:00PM +0200, Eugen Hristev wrote:
> MT8186 has 4 iommus in the list, to cope with this situation, adjust
> the maxItems to 4 (instead of previous 2).
> Add also minItems as 1 since iommus are mandatory, to avoid warning
> on the example.

maxItems alone means minItems is the same size. If IOMMU is required,
then 'required' is where that is defined. Is there a case where 1 IOMMU
is valid? If so, what h/w has this case.

Rob

