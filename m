Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D386C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Apr 2022 14:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xveV8J+Q64V3r0rmU7x+V7oFcY2913nula3IxApct3U=; b=O4Z6eYjwt624nO
	oOXn7DVCB0X3OBLseniMFQRd++0ipAOJA7S+Haw7B9zQRh6g378z4oZzoGE88YqN39S1IkBDTNIOe
	adGBfLF787lBexY42owGM+JA84PlaU2um/PU+H/AGtPPtX4Z9Gz5U0xtan+Od69ouvX+4pqlAiNOs
	MIOxN/dU0o5SkVNggG7cNIgXHocfUOo/BawdNeuTlQWpE9+vYy+EEAA2zV/rPunhz1DyGlDrOv+N9
	DqW8TaXCyNn4pod0q82qivaUF8vNHTyFInVOdM4HPxSJMU315uJrekOqnHk2WZVYBTozmpkNxt1Nq
	1rmJasiKaraHtke5uKmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndutt-009MhW-5g; Mon, 11 Apr 2022 14:20:17 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nduth-009Mcw-R4; Mon, 11 Apr 2022 14:20:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5C97CB815F3;
 Mon, 11 Apr 2022 14:20:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EBA6C385A3;
 Mon, 11 Apr 2022 14:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649686803;
 bh=sgP3P4ipZLRGUcgtNG2mIb2KbvJgeAxsPApan/y5dvA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V0LfJ2D6qJyps1l+0l78tiKcfNsNt0/XvGvuuxHfRpOY7il1xjf2ol/6G2UIVs5Ta
 5gEh79thPddUIaABVbbCf/Fawk86avgMHl24CDysUDzmP9m4iIwD5wb2kXAA3fANwr
 p6WmuLmOBQQyPjPouVE2uvcIaOWqfOwz05kySuL0Gpyq9jLq9LtnQPDlNKAtEwA54Q
 k85lu0kDzFcrhOMafUKC8TGrPj1un1MvnS7o0PtZCgJpYbN9U2oLZfB5oReueOJZoI
 zYzRBUQh2f6241Irkt4Bdb5oT56a32y8y8R+tRrGkm5zcsnCJZYtNI0bWE+QlaCQE9
 HvcxczhkCo9Yg==
Date: Mon, 11 Apr 2022 19:49:59 +0530
From: Vinod Koul <vkoul@kernel.org>
To: cgel.zte@gmail.com
Cc: sean.wang@mediatek.com, matthias.bgg@gmail.com,
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Minghao Chi <chi.minghao@zte.com.cn>
Subject: Re: [PATCH] dmaengine: mediatek: mtk-hsdma: Use platform_get_irq()
 to get the interrupt
Message-ID: <YlQ5D4XPksRHsXPB@matsya>
References: <20220309053436.2081066-1-chi.minghao@zte.com.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220309053436.2081066-1-chi.minghao@zte.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_072006_064318_AEAB4534 
X-CRM114-Status: GOOD (  11.11  )
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

On 09-03-22, 05:34, cgel.zte@gmail.com wrote:
> From: Minghao Chi <chi.minghao@zte.com.cn>
> 
> It is not recommened to use platform_get_resource(pdev, IORESOURCE_IRQ)
> for requesting IRQ's resources any more, as they can be not ready yet in
> case of DT-booting.
> 
> platform_get_irq() instead is a recommended way for getting IRQ even if
> it was not retrieved earlier.
> 
> It also makes code simpler because we're getting "int" value right away
> and no conversion from resource to int is required.

Applied, thanks

-- 
~Vinod

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
