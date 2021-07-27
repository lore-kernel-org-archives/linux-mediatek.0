Return-Path: <SRS0=KH1D=MT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ECB1C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 18:00:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3645604DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 18:00:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E3645604DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YmVODmZZ74oLg+uPy6RdwthAtL187/OC3+gYKzd4qOc=; b=o22dyW2nHb/rOe
	GJ5HqJ8ggfsLUoBbA0r9SnWCdKeBoYSyT1We9xYzYifqv297GDLq9R3GWgbwWSfdgPx0kewieW+eZ
	hwQkjCBw8nU6uQeZRfp8EqGoEGXM5SPwpBobiq4EDM1jBLb2KcXEJRNqA8KcTx+h0499A7GO1c/Tw
	urwGEJ23zdkaG0UIrayfAZR0dCXBWhlf17nUFays4OM8KMeZr5qLqj42Jv40xVpFX2wZoZGPxO9LM
	RB+preRl62WMTroIUGBj7T0miSyfPSwaTPO+vj2MCQ173FxQ+PTLY0nUGGKEuDIwl+dJC6V5cOV4H
	RqqVZVxCtPyFA3w2p7Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8RNm-00Ffrn-UK; Tue, 27 Jul 2021 18:00:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8RIr-00FdK6-7v; Tue, 27 Jul 2021 17:55:42 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D1D0E60F91;
 Tue, 27 Jul 2021 17:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627408540;
 bh=lZaHrsUCW+QSpVB/SQf81Sa0l+Hq1V/N8djHgykDVhw=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=FeqM7eoicuCmAOCIfftrSj8+MRbW+t/oZqYn5otnUTqfdzyDF1rvw1aS141aveJoU
 ASwNbpD01N/vWiTCDlOcFqhxRAgFIMHLDdX9ad4C5FnWr97+POffSfvVMPPA55fRLJ
 8XJBHkHBBpvxfpnFicCEEl+iX3miF4VsprZkFx5ZYwYXBswt9bbtNhXcofOnSw8MvG
 9vzrUepoCgBqPLXmMITnjfWe35Yfj5emlmhbyadu/iGmkBSmP7xq+gQXw0W+3f/Slh
 0JLMsaZC60qs7cs/NPln7BP4hC+jJunUkOg9MEDHcU5pkBl276V7W0BoURrwra8F9H
 C66TLHfvlQxOQ==
MIME-Version: 1.0
In-Reply-To: <20210726105719.15793-11-chun-jie.chen@mediatek.com>
References: <20210726105719.15793-1-chun-jie.chen@mediatek.com>
 <20210726105719.15793-11-chun-jie.chen@mediatek.com>
Subject: Re: [v14 10/21] clk: mediatek: Add MT8192 audio clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Weiyi Lu <weiyi.lu@mediatek.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Date: Tue, 27 Jul 2021 10:55:38 -0700
Message-ID: <162740853879.2368309.18089975265432822576@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_105541_356554_33F24B19 
X-CRM114-Status: UNSURE (   4.94  )
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

Quoting Chun-Jie Chen (2021-07-26 03:57:08)
> Add MT8192 audio clock provider
> 
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
