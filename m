Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC249CCA47F
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jul 2022 12:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B6HnDEYYywUZXn9Y1ExF72Dw+OjIUYTBXlE+mFRixig=; b=ce4YSmhX5kDsZGv49pFCWQEA6B
	CJ0/aL0hhhG2JxRsf0W1Pqfw92Gr3DhPv669Oz5RhMKwe+FXT05/WBJtK32Okb+yHL1zFZfSJtaNc
	df00UazKWmg0nUhDAFCeQPkATJkvCNbPGPt6C2IrzhQV7Q3iOWfaOUzy2NxCyOT7H8ERstg8epuHr
	5B2SKqFf+AFbM2aqncN4xUuKSREEjCLzKEnwSqppAaYQCId4VqmMQt1rnGDa9mskKahDfMwwHnYIV
	EWOtmEIBq6FORrmni/QbyzNcz6lqqKpEAMBFdUEE2ijlQYg9Uc1eXTxbksyskIkFDAKYJnd7iF6u8
	/QwGxH+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDm4i-008ZQo-Pt; Tue, 19 Jul 2022 12:11:40 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDm4N-008ZGu-Pe; Tue, 19 Jul 2022 12:11:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 987D3B81B37;
	Tue, 19 Jul 2022 12:11:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A939DC341C6;
	Tue, 19 Jul 2022 12:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658232676;
	bh=V2z6pp8MGIZMODkGoJeoLyOFQM76mCY2XwDpKMqsZz4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nisjwxsRQq4kJLxDHtBhIHYnOnKlDbfhPEcXSuOwWyov46tC5CZuk6WXTK0sWfSco
	 FaTIGYz5GNDvexZQCarZfVKZJM7AbOiKOZXLxbQoLOgMgApuQhWlKyM5pRk66PiGrj
	 5u37zsMU/HyAAPJSOKTrpb3BFQVdvk8dRYUnyVWQWaDD0yHQB53P8U4iadVHwjDiiB
	 k5f6g3QSDw//oLNIwTGQN0PjM22freaaXT8Rl1xojUueQt5UDbYJTAeosRX3L7gMB3
	 u6yLTk+NsOIodwHH63qw+5T+UShSQTUfPv1jiIMzWYmIr7uGzluWXGAqFg0CG1/OZK
	 WcCyctOvB/e8w==
Date: Tue, 19 Jul 2022 13:21:11 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Hui Liu <hui.liu@mediatek.com>, lars@metafoo.de, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 srv_heupstream@mediatek.com, zhiyong.tao@mediatek.com,
 guodong.liu@mediatek.com, johnson.wang@mediatek.com,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 1/1] dt-bindings: iio: adc: Add compatible for MT8188
Message-ID: <20220719132111.624af06e@jic23-huawei>
In-Reply-To: <c764d5c1-2d4d-e829-a728-eed253a66701@collabora.com>
References: <20220719014657.28714-1-hui.liu@mediatek.com>
	<20220719014657.28714-2-hui.liu@mediatek.com>
	<c764d5c1-2d4d-e829-a728-eed253a66701@collabora.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_051120_036575_3F319AE1 
X-CRM114-Status: GOOD (  10.17  )
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

On Tue, 19 Jul 2022 11:44:44 +0200
AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> wrote:

> Il 19/07/22 03:46, Hui Liu ha scritto:
> > From: "Hui.Liu" <hui.liu@mediatek.com>
> > 
> > Add dt-binding documentation of auxadc for MediaTek MT8188 SoC platform.
> > 
> > Signed-off-by: Hui.Liu <hui.liu@mediatek.com>  
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
Applied to the togreg branch of iio.git.

Thanks,

Jonathan


