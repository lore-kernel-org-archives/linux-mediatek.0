Return-Path: <SRS0=LW2f=OE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB375C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 22:34:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72BC16113B
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 22:34:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 72BC16113B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x+ofjyPHMkRyrmKJXZ3egGHQEiUqjP+4LEoVg/J5yzk=; b=TpQA5pxuumtOcc
	yCDECNBiVsvePFV4VrjxJbSRXLlTPNUYqhTQD9VxDZLty7KeyezTpnOt2A8FSuneEs2psRXC/3T2c
	ccQh6A16P/Utse+gp1pG9Kg8u3wPD3egY/mDuXNbMaSF3EGV/sAXfTptQcSU9zTxZ5xcoXdVB7kt1
	0Lb6Dy9z2U6w0AyH/rs3NMq8Tc0CyVly6K5FBZd/AZPMin2NXub9BgAViSxZpN+gHtEn+AwcgEA1T
	AQKuUUaSpKpmQzIgU/OQ8HIYpe7nd2uy+jYFm/kdRmdMC0MVIaplkrO9EFxOaXN5nre4DZWrt48NN
	pmBDDqFPvRmF4vk9zhYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQH0l-007QTq-B5; Tue, 14 Sep 2021 22:34:43 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQGmW-007JlQ-Ie; Tue, 14 Sep 2021 22:20:01 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BC34A61164;
 Tue, 14 Sep 2021 22:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631657999;
 bh=+tQ+HUcpjUALQ26qn4AL0nD2qjypWGNXAPFyVWvuJmA=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=Nrmk/aPRCbrQf8cDc2HSTuqlPDLnG1dqaopSNXjKQOUO4xYxmaQtTpig46QnUz9jU
 445E9Stk4aZL7mcN8j4nk3c4v0Wcdsq3M+ZdlTMGfIJyrtsYEIUDhlrBHQvJ541tSi
 MHTLelNkq2IRQOGAll7qvaQzJg8XoOCYQlZ096TXPBPrs7bVNopOrUjPzWqS34ZYxR
 Xvz2nyyLoiaIH7Ml9vbJXO61p29j5o0LOiiFuHmW54vMkOBBWVsIzQqUlty86Kk+5e
 riXs7p6MyKyplCRIU09qkDrZI5SSchsWSDJF3SBWiHVX19o1KefAPB2M+NKgd6GoaP
 wZ7XECiul60fQ==
MIME-Version: 1.0
In-Reply-To: <20210914021633.26377-22-chun-jie.chen@mediatek.com>
References: <20210914021633.26377-1-chun-jie.chen@mediatek.com>
 <20210914021633.26377-22-chun-jie.chen@mediatek.com>
Subject: Re: [v3 21/24] clk: mediatek: Add MT8195 vppsys1 clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Date: Tue, 14 Sep 2021 15:19:58 -0700
Message-ID: <163165799856.763609.9052177212330824045@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_152000_728716_56476767 
X-CRM114-Status: UNSURE (   5.12  )
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

Quoting Chun-Jie Chen (2021-09-13 19:16:30)
> Add MT8195 vppsys1 clock controller which provides clock gate
> controller for Video Processor Pipe.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
