Return-Path: <SRS0=LW2f=OE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D2A3C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 22:32:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C9A46115B
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 22:32:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0C9A46115B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y3RyWXQOl5AoF4Qc0TqZOvHzx1xCm5Y2CSFKgvwe6g8=; b=ozoOhAifpDZrgo
	tNFXqAjpoUksmzl/CV+XPpNQt+dg94WrxC6O4XhcyoQHaV4gMQ11gvC9fbBU52vDXWWDGATMlFrPd
	gNTknPArDFVVOLcIzMYaX4LpjSn7jvWwbTEbB1o7qFxqflVeLkR4RoQ/AQNRBgfxpRhxxBuR5ln07
	VuU8BfxjEX1c14Kg/sdgM/AgrnOdxxFiUheYK4IT3KGfsTEWcSHNAJqb8i/IkyD58Bfpw+PFiXDeI
	3hvSVpj67Ozi/Adzc5MC3RcLdJkfNvLGhuhTkehrzorxKg3sNQ5JxGqjxIFUQN/dZ6p7UYoe0eX8J
	2F3Acr4MZ1rO+u5Awq/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQGyr-007PgS-P6; Tue, 14 Sep 2021 22:32:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQGmL-007JfT-3H; Tue, 14 Sep 2021 22:19:50 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9923D61164;
 Tue, 14 Sep 2021 22:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631657988;
 bh=RR6owkjzqfzaYjUSBCJsCZ4wzMipMq56ZneU/JSBVK4=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=ItEWaWireo9M3pR5RqDNIyv7udtH0zGCkVktgobeeXQAoqX0KN5YkNtbAmYoE6/1Z
 UP6rCZHNC0L8kr0LDBq9DF0Wki3iH/FCnaMcdCsJl418wO0IqMglQorxuSopSyrIgh
 wu4Ljutsr+2PwqklYRDzhpHNBt9xORritGrrl0zOWvcuUP4R/fqXGj6F0E5DkTTtJU
 ua+kGan9ZoDsskEVTSNUYvgIDIulKa6sOI7YXwQkVUwrOXNeEvjYXaiDwFMK2yQJF5
 wlli5m3wREeA7sWKbQYwYHt0hYyKzhOq0TpuRXeNA9DljVyDSG6rD3THkMdrTEZHNW
 LzYJh/xV1J/Vg==
MIME-Version: 1.0
In-Reply-To: <20210914021633.26377-20-chun-jie.chen@mediatek.com>
References: <20210914021633.26377-1-chun-jie.chen@mediatek.com>
 <20210914021633.26377-20-chun-jie.chen@mediatek.com>
Subject: Re: [v3 19/24] clk: mediatek: Add MT8195 vencsys clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Date: Tue, 14 Sep 2021 15:19:47 -0700
Message-ID: <163165798747.763609.1936057627703630875@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_151949_211302_614CC71C 
X-CRM114-Status: UNSURE (   5.02  )
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

Quoting Chun-Jie Chen (2021-09-13 19:16:28)
> Add MT8195 vencsys clock controllers which provide clock gate
> control for video encoder.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
