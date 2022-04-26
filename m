Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC11C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 00:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DvehJ2EsTM9Si57qvgnQcttr/x0DPN4v11ENd3omMsw=; b=KmdaRzPAE8uop2
	413d71LjdfO5DVxyxeZqfekKGXVpuJbRnRmrUUs9ccxUQpMOc10v99kzlJYx3sIh3Q7tEM3Ar3JC7
	RmwrgQv3DVbVQvYXNDoXxm171nG1C9kFtFMDUIOz4rSKJgynL+bEpx5Itai934S5c/mzDqEpJu2+g
	y3hmEp74vd86AaQybExDoHouAv4JhHKOdSp6sPpOXZo0uGCJ1D+5FD5p/Gsy9ZCt6GsVxC0RY8Xu4
	/XPHLG5lFT3+7DroLuMhn20QXHVYDhMfS7xwijOAdjH/ddHyjjio362GA4ZpDf908DJ/DSxBh7HXJ
	UnPQRNI0co9LdjpqlD3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nj8oy-00BpAN-Lm; Tue, 26 Apr 2022 00:12:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nj8oZ-00Bp0F-6r; Tue, 26 Apr 2022 00:12:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C1F216166E;
 Tue, 26 Apr 2022 00:12:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26B92C385A4;
 Tue, 26 Apr 2022 00:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650931942;
 bh=Bo5zJ3zXwTqRYkYXc9dDCe9L1DEOgmLA6YoQiISiA9U=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=F4iQprc9jc8RUojThiZcVwyo/fxucVF1aVy7f9iS8IGF4wJp8pnkbwL0jWy5RCoE4
 MpmIpDtRqv278yl2591G/QzYLhqeXx8hjFlFiOFEAxCsPZwH8llVtl0B4dc40pV33I
 zQNAogmSafn9pdsw7kjoLncpEc2WhbeSwLu3TFyl7R3BKxBEIMQ8wozPS56BH14VBS
 uvB19Cjyakije1Mx9sHso8p+KSOTP52Vch/cATEfv5WJhzzkqd+b13GKAQM/lYR0CL
 mJ6QIRoxhfqRnVW9rTkDOvpghQ5unMPAdn8aywHVvGuYRVfWfRoVFLDpVcoOTcSA2b
 5PiF/S4/+/LPQ==
MIME-Version: 1.0
In-Reply-To: <20220409132251.31725-4-chun-jie.chen@mediatek.com>
References: <20220409132251.31725-1-chun-jie.chen@mediatek.com>
 <20220409132251.31725-4-chun-jie.chen@mediatek.com>
Subject: Re: [PATCH v5 03/15] clk: mediatek: Add MT8186 topckgen clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Date: Mon, 25 Apr 2022 17:12:20 -0700
User-Agent: alot/0.10
Message-Id: <20220426001222.26B92C385A4@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_171223_343476_B7915465 
X-CRM114-Status: UNSURE (   7.60  )
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

Quoting Chun-Jie Chen (2022-04-09 06:22:39)
> Add MT8186 topckgen clock controller which provides muxes, dividers
> to handle variety clock selection in other IP blocks.
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
