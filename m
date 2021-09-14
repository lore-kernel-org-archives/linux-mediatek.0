Return-Path: <SRS0=LW2f=OE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D386C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 22:18:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D29C61166
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 22:18:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4D29C61166
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=So02mcIcXxIZEnFG2xOTW9m8anfCrZi+c5PHMh0Qw2g=; b=OtAKsR1k/y/QEJ
	xWBLdtCE0VdMWGu7cQ3UyX5+rTaBTsqvkQtC4mP7235pGdGrq9Xkm3rC4QF50ESadTUUgYf+xz6jx
	z4EfLhgWzEwBaXBPjUKJoy/T9FkyLlYyNrSA0TEVR6syiOknPfW0ePUCc5vapd3AJ3Emooz7C1Rzl
	+mjL8pGHAvExUXagv/n9J2afk9iUpWlOyXvNrGAkEHzMV5M/8zd8OqjT5ULxWr8sxxTUozxaXoXtA
	KZkThBBcdri/yCR+Rfw7do02npxrX8JFS/2UG+lDr5sZ6Z9vgPP+DgOwc9HsHcGCOONu1LIFHwTSe
	eCA+83VRPY0jb52DiOeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQGlI-007J7A-Jw; Tue, 14 Sep 2021 22:18:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQGkc-007Iqt-NL; Tue, 14 Sep 2021 22:18:04 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4ED116115B;
 Tue, 14 Sep 2021 22:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631657882;
 bh=Hr9cKqBBHwOk/0NXW4zjh3+K/+9PPCpQdoKHJf6XeZs=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=Ej69gGw8jeXiptvPKmWyB5qouz35oA7AekdnmIT/74BoflpWylhp/Rmvy3MXBm3gG
 vYduypA82OaY5I8sftwHuFslF+LldERTR5GfHbC7dBxy3DBsqB5ruIaIsTTGNhZp2x
 X3vBpKuU0q/u7FaaJ0g4WlZIiVWUH5/VPSbJWkmAZci7VbBHye3715+UKXwv5/zmOJ
 27t2ccKBwE8MNpUbC+dojUHBH+FRhOIjAoZuAIUB+XuX9/3Tj+QLVJppU/XdZBQL7B
 2qN5UsaQveTprM6hxKuobuUyspIAnnrod30T/bbViVzktRQ7sGrq9wZWHLTBS+wJ0o
 AT2ESoN2Nh65w==
MIME-Version: 1.0
In-Reply-To: <20210914021633.26377-4-chun-jie.chen@mediatek.com>
References: <20210914021633.26377-1-chun-jie.chen@mediatek.com>
 <20210914021633.26377-4-chun-jie.chen@mediatek.com>
Subject: Re: [v3 03/24] clk: mediatek: Fix corner case of tuner_en_reg
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Date: Tue, 14 Sep 2021 15:18:01 -0700
Message-ID: <163165788118.763609.9804318993707120972@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_151802_869903_DCD0DF37 
X-CRM114-Status: UNSURE (   7.21  )
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

Quoting Chun-Jie Chen (2021-09-13 19:16:12)
> On MT8195, tuner_en_reg is moved to register offest 0x0.
> If we only judge by tuner_en_reg, it may lead to wrong address.
> Add tuner_en_bit to the check condition. And it has been confirmed,
> on all the MediaTek SoCs, bit0 of offset 0x0 is always occupied by
> clock square control.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
