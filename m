Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC82C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Mar 2022 10:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=POYqNUb0RKV1lATFxe6/bxh0thyjRZIxttID0bx7iTk=; b=zC3AsqnGJ72zf+
	RK1az40X8eoDk2tk66skI+2enzIeI6cuAnpUb/xfgwmg4L9L2b+1v3+zu/HFtuGevZwL8xGPe5MPq
	NyQoTTKJqJ+xG6FGKSSAbI3pmo7pqq+6srJ5VL5DD0OW600dZj64yZkQwXf+sgmi3tvRW++/2EaJf
	UCs78kj9FdpAqn7xVNlqPqYhR0t9T5oV2Fuge5oCgQeNUGDKqymzbCSjPZsZpdQr8agSg7XaYo5XA
	cDiSM0bIfB6KdeZXOxa5Q4/a8UUJNdngrSe/9s1Uh4AwAeookRKjplBQmu8MF/CBBhpFmhHF9Pf75
	Z/QwtDKnbbM4AWCFY5Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nScEg-00FvK5-FV; Fri, 11 Mar 2022 10:11:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nScEU-00FvIZ-K0; Fri, 11 Mar 2022 10:10:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 31EE8616BA;
 Fri, 11 Mar 2022 10:10:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5049C340E9;
 Fri, 11 Mar 2022 10:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646993449;
 bh=UNlxB0sw9S9WZBqxDtAPWSv0x1gln2Vs3cHIWadssgw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UDYZc04wj/c0Kax1fEmtDjejaj4I+twYkDHtY+5SYh4DXl60FjL2y09lEpRh7L4ul
 UPwy0cmTS2K+U7jXuOcFL6qCPiaZsncs2aaBLZ5opOZ78DhEFyt9Bv2mISuRixvmhN
 YecnqCRTkmkj8QXtv0bbT3HCGsV5Axxo/pbwSxeuFuxD2SfwMeR2b/xUDHA0hpzTlk
 ov4ICGfaNaOJ+LFtIk45dLot6GPB5n8W5g/MUm5ZMLBK+HoEz/f0yidG0LcSyzlr8C
 sbp7+WMpBt+vWWz7A4ObowUr7eS1HQJmHb/S+zIAXN4Om/9VIBuHIcTaJfzU5e5gF0
 7P5v9UkOur6cA==
Date: Fri, 11 Mar 2022 15:40:45 +0530
From: Vinod Koul <vkoul@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: krzysztof.kozlowski@canonical.com, robh+dt@kernel.org,
 sean.wang@mediatek.com, matthias.bgg@gmail.com,
 long.cheng@mediatek.com, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3] dt-bindings: dma: Convert mtk-uart-apdma to DT schema
Message-ID: <YisgJYOUfCVVhP9p@matsya>
References: <20220217095242.13761-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220217095242.13761-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220311_021050_713295_17F080B4 
X-CRM114-Status: UNSURE (   7.29  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 17-02-22, 10:52, AngeloGioacchino Del Regno wrote:
> Convert the MediaTek UART APDMA Controller binding to DT schema.

Applied, thanks

-- 
~Vinod

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
