Return-Path: <SRS0=LW2f=OE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2AF7C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 22:20:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3BCB6115B
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 22:20:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B3BCB6115B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y1ZtehkhA3zF9hL6eWWaAyfgfSPHQ2PAShgkK3o+8/w=; b=dyFkUoZzdAHCnY
	K3jAsA3AIyNmSCudp18j6zW2OxuMIx70BQAEJwZuX7Y6OKQyq54q0dETzk2eGFzNuJRD6IYh9dteJ
	EvAOAKUfnAoChjJCqIYJ8Rc3cmCeW5/iIaDtgB86Hz4PscZ+lWjpIu49GHZgKlj7XgZ1PJLIBwz7M
	X0DGb13jDeeZq/daNq51vYUI9sXDMCk/47EPZF2Cqv3ouQpu/bnLbJD5G9/NNNQv2YbLKmkOgnxZC
	ZAcMjOap2DLZ+mhQzYQlKqE6Hh+uXgALtOjRdOToCTmErB0cVV57I4tdzLOIfeUs7f/fC8HhrZFeG
	RKFL+F3TgvIgBmay2Dsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQGnE-007KAO-7k; Tue, 14 Sep 2021 22:20:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQGkw-007Ix9-0C; Tue, 14 Sep 2021 22:18:23 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9141261175;
 Tue, 14 Sep 2021 22:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631657901;
 bh=8UYOgxQ/y4fca9kfPI88qemxf6oklkdQ917WplPmLjM=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=SuFOgXc6G1WhoCY/Rt4N2Yo1Dri08ELhIlb5jXFBfcBZ8npNrLlxZGqkD3BXZ0IQu
 eXGq/uzbZzI3npBCEy8A6M0tskXRi+nD1sqLakkwVtYcHpgOgOC6YTBkAuOwr89LwS
 aIYFeyJus8kZLLcs0Ig6PQvwUEjcwMwmHLz9BRGw3KSx59tI6s/RSLpmxTamKkIgJD
 /OIngRwPryp6RcM7idZ+SnmXias6nX1Fj92vyznJz/DnzulMx2OpCCxr3qBp5qGa9s
 DcYygKwJWzw5AY0F1v//+bpJp6adH1Lu3U4PJ/VG6HaWLnITNDNNUWrffW8XueUNBJ
 gINRi/cQPuhGA==
MIME-Version: 1.0
In-Reply-To: <20210914021633.26377-7-chun-jie.chen@mediatek.com>
References: <20210914021633.26377-1-chun-jie.chen@mediatek.com>
 <20210914021633.26377-7-chun-jie.chen@mediatek.com>
Subject: Re: [v3 06/24] clk: mediatek: Add MT8195 apmixedsys clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Date: Tue, 14 Sep 2021 15:18:20 -0700
Message-ID: <163165790018.763609.10824046513029639929@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_151822_092964_5F4D3612 
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

Quoting Chun-Jie Chen (2021-09-13 19:16:15)
> Add MT8195 apmixedsys clock controller which provides Plls
> generated from SoC 26m and ssusb clock gate control.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
