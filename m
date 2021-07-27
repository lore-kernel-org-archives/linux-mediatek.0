Return-Path: <SRS0=KH1D=MT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DF56C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 18:05:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 296A160EB2
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 18:05:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 296A160EB2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9hOZJkDRsTWo1Q8NjZmCbAs28IXkGhjESMhVvj9Toek=; b=NxWLugAsZqAiFL
	GjkQh6L+ChWFyNrb6/tCaIA9IsaqSO0w6mS+YEDK7M87XLwB7lsNLzig7NyzaSvCPIX+yOUnSiaBe
	KVclUWIoaAEu39PcsgOuKxsKBU5bWFjmYdqlo7sL+My+iD8NmGgl+yiroiaBLIJlLgius2519ZdKH
	2b9YulJizp3odcJeV82pQyajkYn34prTfhdYgtynfaEyVkOhGBPc6aIA0pLHr/3JX0b/GFxescehO
	Q2vSnDPoKGMtLLqbVa4ZhKonjGpQay/k1KZMQ/rWt6hskY2s2gyKUUOdmzbkiQbbNTUIB+RwwXU/w
	zkhNddvv4tGMbGNeN3jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8RS2-00FhqN-1N; Tue, 27 Jul 2021 18:05:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8RJT-00Fde4-Q7; Tue, 27 Jul 2021 17:56:21 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5731C6056B;
 Tue, 27 Jul 2021 17:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627408579;
 bh=RLJ9B+ZMQPTAQawfisUEkdnjM42ljoeCVyMcRwPTXbI=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=jHwQX+EdhqRGjwvha+7pTWs8/ZA5ycszBcfVDtJ4m2KjnPZRWVNb9IvlgGoBKkEFv
 E4qxq0+Bm34U2E1ryvZwFVSGVm91nqdUTQoRyg3GiRPawdt30B0Dk7yZ5MhSCk3YAe
 58Gt9AFv7vpDfZuM6+pEVImlVjShMeM5ZVMGFRhHg4tZ6BB1Tbd40UdJ6AEqAVeiHE
 32QcA27F7O4oLBoi5pNjt0tagKa9Ju2bFHSpSqGbbhQ/DiESbLz8TSS+bXJcSvV9sK
 cpN1MsRh4+WCsDBy4p/8pQXyxUO3Vx2egTY6xgeKXY9pJS5wbF+Zq8tNTwCO8pK/Oh
 jO4cNblMWiYHg==
MIME-Version: 1.0
In-Reply-To: <20210726105719.15793-14-chun-jie.chen@mediatek.com>
References: <20210726105719.15793-1-chun-jie.chen@mediatek.com>
 <20210726105719.15793-14-chun-jie.chen@mediatek.com>
Subject: Re: [v14 13/21] clk: mediatek: Add MT8192 imp i2c wrapper clock
 support
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Weiyi Lu <weiyi.lu@mediatek.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Date: Tue, 27 Jul 2021 10:56:17 -0700
Message-ID: <162740857718.2368309.6770707590477284935@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_105619_913015_B3078D4A 
X-CRM114-Status: UNSURE (   4.84  )
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

Quoting Chun-Jie Chen (2021-07-26 03:57:11)
> Add MT8192 imp i2c wrapper clock provider
> 
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
