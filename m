Return-Path: <SRS0=LW2f=OE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08656C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 22:21:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA76761164
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 22:21:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CA76761164
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fCKv69uk89pt+6H1J7dKJBbGJELPb1xENT0ujU1F6uw=; b=Dw8iHsScTlsSYD
	Cdill+NtKWM4JLjou8qtkglCPojuQb4LlLoiPoyW9ex3UHu1uZtBy/6UXmZDkvkqHKXoER1+0o1i8
	vEvnv+wbu+Evv1Wvs/Qj1q9vSUgiKvNSfNDN9ex6/TEHqz8ZQ0bHn8C+Ih1vO2Jr5ksGZf4RETig8
	F1NwxIxiNMCtir2YjhAbPXyWBxzJ+zNNxkZB93ZrBQB2tUYR4kBQcoX7a4KVQpmygj6z6M/HCRyEr
	4dbGsj1KGuW84OlKKVmR4rdQZ0jyN/vmbcnixiupAwwvtmryKwW8Q0GEHnJJfqPZ9IyXab2QVAopd
	0xKhXlZj54yUIWmbrZBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQGnp-007KX2-2n; Tue, 14 Sep 2021 22:21:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQGl5-007J10-La; Tue, 14 Sep 2021 22:18:32 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 47A7C61166;
 Tue, 14 Sep 2021 22:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631657911;
 bh=SXy0ezH2GYZgyIlW+eAYQ7JeS5J8qw+HhFson7cURyw=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=QSHn/+0WnQkhF78liCpPlaWkrIUksDFaIoq5T83yqmQour1tys42jquXs7TSZx3br
 AW7rcamkyShjf6h28ETeBxvh9sAHZfT8OoizGZ5somvp3Bq/0hL/1sZInIvdJY7bbU
 2zpwsOzdrqYXO5vQy5DUN21lFKIAEfKf4T3y0YWJCqfJXqN6Yp9fXSU+xLV3eQKiFu
 pxMuGswF2i/Wk7zCIucnGD+mrGcCCH5EkVG0nICzJz45w5K3JVVjNEPgFIL+ORWEH0
 FI7nfrYypM8uLAayEjIlRpnC3styQ8yABtn+21McHFxGMBngtm+GBeFBAG9Sp5q8mn
 JJu9DVbKUGsVg==
MIME-Version: 1.0
In-Reply-To: <20210914021633.26377-8-chun-jie.chen@mediatek.com>
References: <20210914021633.26377-1-chun-jie.chen@mediatek.com>
 <20210914021633.26377-8-chun-jie.chen@mediatek.com>
Subject: Re: [v3 07/24] clk: mediatek: Add MT8195 topckgen clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Date: Tue, 14 Sep 2021 15:18:29 -0700
Message-ID: <163165790962.763609.6256601941616166474@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_151831_762176_B12AC02D 
X-CRM114-Status: UNSURE (   5.17  )
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

Quoting Chun-Jie Chen (2021-09-13 19:16:16)
> Add MT8195 topckgen clock controller which provides muxes, dividers
> to handle variety clock selection in other IP blocks.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
