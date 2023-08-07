Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E273BEB64DD
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Aug 2023 12:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MoMY1SFtkbtEUBwIL7en7e2435l5MQq5o7TXLrJFqPY=; b=ZQdBCR4R1mHwqUnnAoFI5FkncV
	Sh6IwuU6b5CJN2YV4Z4SJ7aSWN3h+OcDpc0gpn21s4LQy4SvbkPJEjgLuox3AFGzlDAxM6esxipdO
	WWtmyCaB4KZARYHM2gCPRwCtnPlJVC0Fq5yNa1lI9ZpWZvp5di8+B6bQDigXVXMZFsIeW2BOJr3rB
	ODBQdDaxREuigWaolaUVGCA3VuTnXtR/gUOlw99H2Jp1baPrDSmiojjiuZstgCExwRMkk/xdYgwjy
	TB1rEXIIaymZtjuI7KT21ISnRvhkzOOd03W9HOz54mASfk3Kf4ywijH7Br8Mth1dZTqJGlAvK+c3a
	IvFuWzMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSzAo-00HAvR-0M;
	Mon, 07 Aug 2023 12:17:22 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSzAk-00HAuI-0U;
	Mon, 07 Aug 2023 12:17:19 +0000
Received: from 8bytes.org (pd9fe94eb.dip0.t-ipconnect.de [217.254.148.235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id B3EA92802BA;
	Mon,  7 Aug 2023 14:17:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1691410629;
	bh=MoMY1SFtkbtEUBwIL7en7e2435l5MQq5o7TXLrJFqPY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OtkTggzs+tvxWYj2I7pXxg2LkseYu2TNyjMFfy6jbmuoFD/4TxvnrV1Kt4aVTxL32
	 cC/4eKMOWdCCo2Iw7i3FzN+S3jxQWacSeYK4c6mVsQd9Y4/q6crstdMUrN6Yg6OZ+9
	 JXDt/2cUJ4CKcgeTBYU3YsWzevTJiT2GyXJDWaN8neg3f5KEMOSoIVqM/zX7V24Jc+
	 Qj8EeW3tgNzumUI8T1C8nZZdR+L3YZ22hxGfOtKNF2cE0+GWJbR6N+v4RyKspefl39
	 xjo77kXV5IOfkRuvPCfOM6wDCMa+BpwJB1mWLzVq9Vy4St7xyNT38PyWsG3ZrYYpNo
	 eUjK2JRU/qPHA==
Date: Mon, 7 Aug 2023 14:17:06 +0200
From: "joro@8bytes.org" <joro@8bytes.org>
To: Yong Wu =?utf-8?B?KOWQtOWLhyk=?= <Yong.Wu@mediatek.com>
Subject: Re: [PATCH v12 0/7] MT8188 IOMMU SUPPORT
Message-ID: <ZNDgwh2r02SXZEG4@8bytes.org>
References: <20230602090227.7264-1-yong.wu@mediatek.com>
 <CAC=S1nhgkj5zh-Oa+OJjZKmkNMfG63+WjSefB2swybm29KxDXA@mail.gmail.com>
 <cc910b5c3ec130f092a37049d71bb35c20b278a6.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cc910b5c3ec130f092a37049d71bb35c20b278a6.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_051718_430047_591980CE 
X-CRM114-Status: UNSURE (   5.84  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Chengci Xu =?utf-8?B?KOiuuOaJv+i1kCk=?= <Chengci.Xu@mediatek.com>, "will@kernel.org" <will@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, YF Wang =?utf-8?B?KOeOi+S6kemjnik=?= <YF.Wang@mediatek.com>, "iommu@lists.linux.dev" <iommu@lists.linux.dev>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "robin.murphy@arm.com" <robin.murphy@arm.com>, Mingyuan Ma =?utf-8?B?KOmprOm4o+i/nCk=?= <Mingyuan.Ma@mediatek.com>, Jianjiao Zeng =?utf-8?B?KOabvuWBpeWnoyk=?= <Jianjiao.Zeng@mediatek.com>, "angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Aug 01, 2023 at 12:53:29PM +0000, Yong Wu (吴勇) wrote:
> Your A-b always is expected before Joerg applies.

It is time to make some progress on the MTK driver patch flow. I just
applied this series, thanks.

