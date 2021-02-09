Return-Path: <SRS0=ZAsA=HL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 861E1C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Feb 2021 08:02:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 334D264E25
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Feb 2021 08:02:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 334D264E25
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oB0YzWbNp4vRhm0Cnqf8/fuSnulIIvBl2uwaqnv0IBs=; b=U3c4Ip5mgHGjIRY2zKYVK8bnI
	hXhxE9kdOsX2L5b0QbSvax+5oefNj6bectvkDpH9zVez+ULTna1qY53o6U0cBIje67mPc9k3KPigg
	qhh56VDGYQXeabCzob7aCuob1uNBe3p/2M3jk6knSMkwu/YaB+it5RXL3IM3+02jly4f4nejsLqqs
	2ng3m6mrJuMOUYic6CMaO5nSrJ0JsBFkH8a+WHMtthZvYDD03vqJ6Ho0IhYo1tX6F2lgoxSIgPP4K
	2AmwDy2YmMqOfnNV8RG663QqAVghulEMWe2qLVxCRlScHul1VS9VSPovG1rhyKEX3B/3Ji3gm/S7M
	MJsqUSF9g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9Nyd-0007RO-FY; Tue, 09 Feb 2021 08:02:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9Nyb-0007Qm-Bz
 for linux-mediatek@lists.infradead.org; Tue, 09 Feb 2021 08:02:26 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 22AA064E50;
 Tue,  9 Feb 2021 08:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612857744;
 bh=p0z6FPgvjAs+ABkvFB/FTOpUTXoVh2JiB8TV564mbtk=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=sqwUkGuZDDVc8s8WcmUL/VTwemTYa8QExSJ1xpHYmPAqkNAvcMoOJvr6hIVejYCS9
 OJgD7lbLQKMo1pYB/DaV8YxRwPWSVEJPJOsyxyAOjLMJbP0ijSpcbeHlRBFz4CjjvG
 Rl/KQiaY9kT29RzontKTh/JK5MZAHvwlnBKfWl962KfVzMfffWQoyiBhV+EkJf0omE
 fm+kH9P3X2S1tjsSaqwKTslwa+XmBsAUvxQW5Hox6+99BeyYsEL7pGxXzXVVp6XnKE
 9CktxDjYrAPtIgvtfFwj4vlpo4Ztqa54EDP0QTrGwa1hRs8G4JPlvwhbTT+L3vVrr6
 Lmt+9b41gFT3A==
MIME-Version: 1.0
In-Reply-To: <20210125170819.26130-2-laurent.pinchart@ideasonboard.com>
References: <20210125170819.26130-1-laurent.pinchart@ideasonboard.com>
 <20210125170819.26130-2-laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 1/2] clk: mediatek: mux: Drop unused clock ops
From: Stephen Boyd <sboyd@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-clk@vger.kernel.org
Date: Tue, 09 Feb 2021 00:02:22 -0800
Message-ID: <161285774277.418021.4963625642816224543@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_030225_544030_570AB3E2 
X-CRM114-Status: UNSURE (   4.96  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Phi-Bang Nguyen <pnguyen@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-mediatek@lists.infradead.org, Weiyi Lu <weiyi.lu@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting Laurent Pinchart (2021-01-25 09:08:18)
> Three out of the four defined clock ops are unused. Drop them.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
