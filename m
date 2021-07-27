Return-Path: <SRS0=KH1D=MT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ED64C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 18:06:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE2A860F4F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 18:06:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EE2A860F4F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K3RCisoq8HiyOBsDmRrB3kYyjxrpl5ZdLshmNqUO1N8=; b=XbsiQXaDsELX4o
	yBimVrRwavcfJBIKPORfhvGstzU6ULp3xtpaQBvrbgBe0pJlUtF0oTReKQBEXYFE+/ntk/irgHJdH
	snvr1uwI1aCyooEI6ZSm3X6/tc36rKVmEaGUe1LwzKx25e3NuHCTOvyXsyo0zY3rkhgonbLlI1NhI
	gzf5fTVugu14Evau75jAs0f8CGj/i0WU+n318RjkM9LaE8ljelsDhPTPUMMgYb1OgozXmF2kFfQh/
	J3nGQV4x098KX44c4nqrmCPb6tKavGAiREYyAoY5yLqndARi+l1LBabH9zz3Fp5JUY1n+cok9FMUg
	na+bI/TlCllUKEi4rxAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8RTH-00FiP1-MR; Tue, 27 Jul 2021 18:06:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8RJg-00FdkT-HR; Tue, 27 Jul 2021 17:56:33 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0FB6860F4F;
 Tue, 27 Jul 2021 17:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627408592;
 bh=FHnAsqCd1mWH0cw4MowmdfppXrL9K/hZdfz1Y32vnOQ=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=m0CW5jPU+meg+iTcDL8c1g0XpdyzLSap14SYriLlR3uuKiFlUnFjpXdv8n3rQD7nC
 tYSqEGTGM17vVpBp+oAtyD5vYuglSlSaJzGB56MzPD+dZeX6x2h9SGJBUkHd3HKq5K
 KT9FgK9UiVnjjQz3VHjMAqD+5EmH9/y30QKqjGoNnKHAj3b6TQQ+Iz6JYOFgHDn4fx
 4LKwr/6cxBEmb90gKrsNZwAebjFeD/AZtFKJE6HrmRyoIwLzntU+SDaEo0eI+3u75w
 mac8SJKfBfvGUE37XGgyGyL5iGyE77gdDtPsYtrJ5sdxtSN8hvw1oMqdi8/hZZsgP7
 LbHLtkHBFfLTA==
MIME-Version: 1.0
In-Reply-To: <20210726105719.15793-15-chun-jie.chen@mediatek.com>
References: <20210726105719.15793-1-chun-jie.chen@mediatek.com>
 <20210726105719.15793-15-chun-jie.chen@mediatek.com>
Subject: Re: [v14 14/21] clk: mediatek: Add MT8192 ipesys clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Weiyi Lu <weiyi.lu@mediatek.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Date: Tue, 27 Jul 2021 10:56:29 -0700
Message-ID: <162740858987.2368309.16592701545993198310@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_105632_648145_871E1AC3 
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

Quoting Chun-Jie Chen (2021-07-26 03:57:12)
> Add MT8192 ipesys clock provider
> 
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
