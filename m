Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B1EC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 00:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ng9wT07fW2dihAMh3esCLV0rflLeqhgEdbWvnaFAAHI=; b=o02i57wecIrbjT
	5GmgVuWomTff4h4HOBT2XF7aC8ygQ3rTOh/aXqKV+8mDEqn1NDCUM4JRb8e5iIkk2iLKD0x5VumNz
	h9hhCC6cMKwZ0nBvWBywjUFi/jHeOUzgf21Ap6siVvI78U94+/g2zqtR1jqi+0FjSECQnkQsG6zAq
	yYDuWN6E5v8MW/K03zX8l7x7SXn2xZNEm49s3TXOiSZDCeKmNjrSai1niI2xA9fF1R12GAzFNOkuu
	53tsPwIaAwBFLIleEM4IN6TRqK3RyO6GPEcUj5at0odkvKjXI4jzGgiBSpO+ejp75quqFRZ6BCHEZ
	0JKfUSCK7FeXvSdD3o2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nj8p0-00BpBG-JN; Tue, 26 Apr 2022 00:12:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nj8oi-00Bp2y-Gl; Tue, 26 Apr 2022 00:12:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D687561674;
 Tue, 26 Apr 2022 00:12:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34238C385A7;
 Tue, 26 Apr 2022 00:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650931951;
 bh=vA73MI2Edm0kG6iJkmPOdF6VPS0x9Y+IxTI+Yo9VjM4=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=bwPbSANP9cowh4N8EReTEFDitYDIG9rsjEf42SE/pZ+bcA/fSre+3DaYDF6Rb7/t4
 NzmaQrmiQYvafA5GJTL3LNMx2D1aDPPteSz53OOwQiXWyJxfTG4a0A6vplLm6FSnMX
 fc/PC0n0iHq/lS6ZcqZuJ1ZEG0tvIaSFHMo2JHqeeswH7kS5tP6QpQgh8UrsDwgVYI
 /QjntaOPsO9mN1+SNenzJRUEhEekj7VWw1NnRbnB3Cof8OCNJgnIubHgi42x/VjTev
 ouZQ9+SiPXcLxfDcgsEewKXeEo8ECRrOAvM+y5UrmD5XMstzyr/h91FC6A8HA2vMIj
 tooFNEOSmJIWw==
MIME-Version: 1.0
In-Reply-To: <20220409132251.31725-5-chun-jie.chen@mediatek.com>
References: <20220409132251.31725-1-chun-jie.chen@mediatek.com>
 <20220409132251.31725-5-chun-jie.chen@mediatek.com>
Subject: Re: [PATCH v5 04/15] clk: mediatek: Add MT8186 infrastructure clock
 support
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Date: Mon, 25 Apr 2022 17:12:29 -0700
User-Agent: alot/0.10
Message-Id: <20220426001231.34238C385A7@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_171232_651915_2FDA7397 
X-CRM114-Status: UNSURE (   7.88  )
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

Quoting Chun-Jie Chen (2022-04-09 06:22:40)
> Add MT8186 infrastructure clock controller which provides
> clock gate control for basic IP like pwm, uart, spi and so on.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
