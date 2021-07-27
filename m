Return-Path: <SRS0=KH1D=MT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68186C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 17:58:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39AB460F4F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 17:58:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 39AB460F4F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XOV5KAg4x54Xie8CmGQ1JG92a0vrlaEXJAIDpwbwofs=; b=f4FOY3zWWrnbLO
	xjnAI+NImTyG2qNH3C6+IyjGnCXS3xfpVFZi9NT7wTs4W0XShzmgbslf4rDBpuj2ztveeB5js3227
	WOOUVC7YkYDWFHmuXN0YefvxwyQOlR+6+kOudHIi4p/YyNekoqe1f8qBNmSq2EnT3Sl16mP/q6FGQ
	Adie4wskikpb1DfgO9MKAoaIZ1+2Ja6P2CuDbSkxA4qrioLqHwrKDQThumeNTfLkUiEt4ZXH32ESf
	U5RegH9MDsIJPg5u2S0tfrAc6u8bMLIZT9PQfYahvFLOAEXnDK8IRpaZaOHN7wm29huohDR35rSMM
	0sSxFp3WRQ44+LVVogow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8RLd-00Fem1-LP; Tue, 27 Jul 2021 17:58:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8RIP-00Fd5L-Sz; Tue, 27 Jul 2021 17:55:15 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7DD0960F4F;
 Tue, 27 Jul 2021 17:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627408513;
 bh=V0sWi07F3L3vTmxYYuqVjtOrQs5lT/nKvgb4IxFEKOk=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=YR1CPnRFY1EIFAtu4cXf6BnDkmCiOn+Q8ZQSuwcMdkQcbr30iPmFuI+0QwixbcBv9
 htcZvZYOoMD4vAb+0vxmzQMaaf6SzqJ+51kNh/6lbYjfjKDfHerj/RicoEIgoL/QqO
 AGqWFfr77Y1SSy1qX3aA8UJpFPfMUmcUU0Lm6QKo7gDza6L2Lwf8qGGx+tiAM0ivxb
 ftJYCRuefzbZ4N+UIj/TszJQVzlYaqMqffelZkJ2Ugin4f6fU+2lF43HKDH5W9e9RQ
 N8qqtYQxfK7XbIC6rqYnSj2nMHORNzC67thY2rjRMzvozSaSw8zlzTCdbWccczHBQK
 rFVPDkCYOLunw==
MIME-Version: 1.0
In-Reply-To: <20210726105719.15793-9-chun-jie.chen@mediatek.com>
References: <20210726105719.15793-1-chun-jie.chen@mediatek.com>
 <20210726105719.15793-9-chun-jie.chen@mediatek.com>
Subject: Re: [v14 08/21] clk: mediatek: Add mtk_clk_simple_probe() to simplify
 clock providers
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Weiyi Lu <weiyi.lu@mediatek.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Date: Tue, 27 Jul 2021 10:55:11 -0700
Message-ID: <162740851136.2368309.3574784042718719986@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_105514_021900_17DD663F 
X-CRM114-Status: UNSURE (   6.49  )
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

Quoting Chun-Jie Chen (2021-07-26 03:57:06)
> Most of subsystem clock providers only need to register clock gates
> in their probe() function.
> To reduce the duplicated code by add a generic function.
> 
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
