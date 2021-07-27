Return-Path: <SRS0=KH1D=MT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF957C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 18:12:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76CA960F58
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 18:12:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 76CA960F58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WxltEL5rG4febdwlHP8aKSGj4GalvXfCjcfgDZ75kHE=; b=EGFDYZti0jkqOW
	oH5h7G9RU2DDt1W9u+/sPqJ8Q3g/tnwvv9AKZ2yOcS+c0DkR2kUS0ohTFVTjF/JChZ6b/s3bKlwTS
	w1VSlBWSdHvhiX56ATgp9G+guhSoXa8KeGf/v5AVUtCt4OLtvCD4TrYbF6vPI9szyIe0aYGf5uOYn
	6Z3xpZhOjxvdFfx0CP3Bms2UAMu2/pbTHypfBmf4h1a1gDkYOxmzDi+arhvyUwU9WD0mS3hpcb+Hd
	nuqB+dDZ19BOqkvmFcHciWEMCDqoD5/YrdybcLyYI3oOaFYMjAGAONViRLeQe6C2ASebcn3ORbbPd
	1OuVgavcGqA4y+QbzK+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8RZN-00FlE9-3z; Tue, 27 Jul 2021 18:12:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8RKr-00FeNt-Cq; Tue, 27 Jul 2021 17:57:46 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id F217660F11;
 Tue, 27 Jul 2021 17:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627408665;
 bh=5cUItSKNY7My1Xb2E1xIqPoOyGo+qDqMej4tCbwu+W8=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=giIJpAYE1XdQedoK+o7DsDyxVBTYSYra1WB0MzRJ3CtcXDbUjDKlS9riFpMZV9Fob
 v1NmoJMlHWjtxH9mZEGJNSiI8AsuWRGi8WiWBdwPxJ6pQkWy/V5w26aIF5ijTR2PM3
 G8HBRXKV49VMBwWb7xxlcycYQUWFWSC2PxaM/wqnBuqLcw/dC8JUUGV22U2FW1qsWL
 wrS6FZrXhD7gt3BXe4aDB8FKyQFdPFKXJzfdhl7YZ9uINE8iUd2++TOo2A+B/ARYpm
 WvU8/8ZbFOndYNWEsyGs8gKbyASpj6heKD5pPqQiHhm5AzrNp4tYoCtURmcIiLlwfa
 sQRor+EuoIUFw==
MIME-Version: 1.0
In-Reply-To: <20210726105719.15793-21-chun-jie.chen@mediatek.com>
References: <20210726105719.15793-1-chun-jie.chen@mediatek.com>
 <20210726105719.15793-21-chun-jie.chen@mediatek.com>
Subject: Re: [v14 20/21] clk: mediatek: Add MT8192 vdecsys clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Weiyi Lu <weiyi.lu@mediatek.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Date: Tue, 27 Jul 2021 10:57:42 -0700
Message-ID: <162740866297.2368309.11459298909476761003@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_105745_485207_4FF0EF2B 
X-CRM114-Status: UNSURE (   5.13  )
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

Quoting Chun-Jie Chen (2021-07-26 03:57:18)
> Add MT8192 vdecsys and vdecsys soc clock providers
> 
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
