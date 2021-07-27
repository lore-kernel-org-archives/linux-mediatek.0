Return-Path: <SRS0=KH1D=MT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2084CC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 18:08:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E498060F4F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 18:08:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E498060F4F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3MM1XajlglrIVlQJbtXAMjGmg5jSQ7utU8TaECEqqk8=; b=EYTT9b7/2p3T3N
	jSUbmm9laT07vhi9gy/gJlF5PK0WoMafd9LCgKRBp9qbHV05Z41j6TntltdsROMcg/sPCHSjdxNHz
	GSzJVvyByUCrPCIJh/6v8jWbmX1IvwMSsjfWxhmsLcnNEedBv4vEc6flyeYDBezYCm8mVOEjrz+5K
	NawprncgayCjJ7L884JcVe4qBb9miRMHiHLTBj2cgp9pZS14Vj4d9kRYlUle5z4wjbj1CGsPn3flH
	AqrHibMeV3ZQb9B36EN51wi5iwc3hACWdUolYe2UXSjHZROicErvgtw90P4HI3XJKmTWS4svLtESi
	OpxwUhJRjkAK1rcCFS+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8RVD-00FjEm-1c; Tue, 27 Jul 2021 18:08:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8RK5-00Fdxg-5U; Tue, 27 Jul 2021 17:56:58 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id ADB3360F11;
 Tue, 27 Jul 2021 17:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627408616;
 bh=/JE9CGQQa0Lu/VOUB7HHBRvNBpkPRzdpiUBTomM8n6w=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=WLJhHdJZlrIWqULlBQpWG1YVkqXimVm0F50DLRRlUSGZMrmTzPa055GP58qQ+HO7w
 e+Jr4+rtQ6muigxkbcGauujBU1neDVnwx/o0dGrYtZMAKcZH7slojomi7YtaD+4MUU
 It4FwyOQ1w5Ap0oHb9tvC+y9s0fjclJG6YQRahnytO01Y4s7whhtA+wrnjG4YozUX2
 WbTXrC9yUl8OryFlK8zY8UuDTB3q6A68vJI4OvBbIAduGg5Ve1XGadhwCXHqI1XKLt
 uObczhgpeo6psLkD6w1eWi6vJ92R5jqhVKWTJ5pvhXIswJ8wqT09EX7HLcs+yBd2y9
 h/Trr3KLLKZ3g==
MIME-Version: 1.0
In-Reply-To: <20210726105719.15793-17-chun-jie.chen@mediatek.com>
References: <20210726105719.15793-1-chun-jie.chen@mediatek.com>
 <20210726105719.15793-17-chun-jie.chen@mediatek.com>
Subject: Re: [v14 16/21] clk: mediatek: Add MT8192 mfgcfg clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Weiyi Lu <weiyi.lu@mediatek.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Date: Tue, 27 Jul 2021 10:56:54 -0700
Message-ID: <162740861465.2368309.8626055730410519223@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_105657_289001_461A4E1D 
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

Quoting Chun-Jie Chen (2021-07-26 03:57:14)
> Add MT8192 mfgcfg clock provider
> 
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
