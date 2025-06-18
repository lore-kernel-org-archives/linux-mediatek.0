Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D027EC7115B
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jun 2025 08:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S4Ihet8knuNiCyfOjWoaf4P9Dpu8KTRVsFATpVPeHNc=; b=QuoRHQQkK7jLXW7YJKEvTnmQI0
	sv1yShhcy6SLzqVFsP79Vl90BubB/geJvA7RmaAZbgiHucSc2H9udh69E36N72pmkN62C6WVKE2jW
	CLzsUUGQyPTO5CmTGxsDQpUyLU1t2FnIZuXI2B6tMd4cN30NoToLIAdANpi0FU8/e30vZDU3zgpe1
	aPUYYc8dDC59IxqYeIJtIZunGNd6jF/akl/b7OMh+Yp9h5Hf9zfzmfI8diVgpKqoCG1ic07yxMkOO
	YsfP9ux6zMYg4MkWzZVKNzOPZ79yzMria83ll+x5ogG+3kcZSQFagJbdaPJnlTGU35IaAXgiV2DUs
	GdXmLz6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRoLW-00000009RPV-1miS;
	Wed, 18 Jun 2025 08:40:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRoHY-00000009QkJ-3gVd;
	Wed, 18 Jun 2025 08:36:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 834165C63D0;
	Wed, 18 Jun 2025 08:34:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82042C4CEE7;
	Wed, 18 Jun 2025 08:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750235790;
	bh=nahXIBYo1sCV4ReXtP1+gdc5KP6p3q+h/ETOVZK3jA0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NWR0Y2chSoauafo/D020vd9PcFIQk2KPUhySCWzzrY0qqFJzMJNb0S22sUCd6Dn2D
	 xlxoEI4SQVjMjdoynxjv/bhEzmGHwXdEsOtVBRtvCwTBq3xBosBSDd6yN+eiyLV/NQ
	 yirZ/mho+2/amSFCwPHi+8ZiWdBGZ4mNWOCOP0bzIFLtA1YdJ+KBuBP0GV9QkmL3wL
	 rZ/2cSTNR8F7TNoWFAmL8zKufh08OrZgZDavg+8qTOtT1tCsXzaAw1rJMFRr6A+X1/
	 IQMkWf1pSbSbdmnnkWZ5GeYHtY0cf00ebU8xbtpioTd8K4BSa44MnnY3ZzduSnjU0N
	 giRG0v0vCb4MQ==
Date: Wed, 18 Jun 2025 09:36:23 +0100
From: Simon Horman <horms@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [net-next v4 2/3] net: ethernet: mtk_eth_soc: add consts for irq
 index
Message-ID: <20250618083623.GF2545@horms.kernel.org>
References: <20250616080738.117993-1-linux@fw-web.de>
 <20250616080738.117993-3-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616080738.117993-3-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_013632_953928_DE2839A5 
X-CRM114-Status: UNSURE (   8.99  )
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
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>, arinc.unal@arinc9.com, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jun 16, 2025 at 10:07:35AM +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Use consts instead of fixed integers for accessing IRQ array.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> v4:
> - calculate max from last (rx) irq index and use it for array size too

Reviewed-by: Simon Horman <horms@kernel.org>




