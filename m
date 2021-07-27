Return-Path: <SRS0=KH1D=MT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5A9FC432BE
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 17:58:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BCDD60F11
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 17:58:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7BCDD60F11
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rzCAVFuMlJoMin+ra99VYWAgzAshsRAHFzRWC1n0+ZQ=; b=hXaj6NgoxXFP0H
	0cWo/X/14X+3CBHcUFUNLm7lIBPNNUr+Tv3rMCoxaDItMCqDJWR/tN4bBuwxz0hm09bqNb/yoUe4C
	FN6Pc/2eCXxTR0elxo8IJXlo8dV8E8tG/Y3BrOHI3ONY0LeQv9bYu8d476PXQC0UIHzAe0XFVzCo0
	SNjh/m7sAUX7c7nRIS3trdt8RDxRfFz4g/cECz3WmN13bVf7ZaizONCdt0mgdnYeaP8KIhec6d+Xx
	pK74XxCY0pgFY5OqvJ+lFqy3v5WgQOamlLiagiBtzYddBm4271EsVrXwRJHlHRgUnNdjoSjrpXSuC
	kQMuKXC6zhTQiFDXm3FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8RKu-00FePq-By; Tue, 27 Jul 2021 17:57:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8RIF-00Fczd-BN; Tue, 27 Jul 2021 17:55:04 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BAE4660F4F;
 Tue, 27 Jul 2021 17:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627408502;
 bh=7YITf+6vCWg/2TcduJ15J7mKtAeA2eCG6DFSJLScR9A=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=pokUSmq2ZatQHOM7uTUWqlnIk6ssmOQLkInhd4gsg1+tem2n/aJUnUNK+v8a2ldWs
 +lKh3Q6Lvt/SAVBgBLQ6IKsySTPNZ/sY+TE+u67g9teoIB4rgOOujzdJvvxIMnPDqc
 0TCTsE9xwpBLmj8mLITZ/UauyqTT9CLTBjGke8+gHljsda58MRoT39WmZZdKtFrAeL
 GztK5R8e+BMHIAwJ3KMy2ov8aXCdFVdN233jqVQ7AR/sttZOF66wduJHsgcJ+8hYv4
 nElbyrQ20+Wiwoh6rqN4+Zxwrb7CCtu4/epQMesQZ6qpxkCWS5SIAk0qHygGMgp5d5
 0OL0Q2vqBSyMw==
MIME-Version: 1.0
In-Reply-To: <20210726105719.15793-8-chun-jie.chen@mediatek.com>
References: <20210726105719.15793-1-chun-jie.chen@mediatek.com>
 <20210726105719.15793-8-chun-jie.chen@mediatek.com>
Subject: Re: [v14 07/21] clk: mediatek: Add configurable enable control to
 mtk_pll_data
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Weiyi Lu <weiyi.lu@mediatek.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Date: Tue, 27 Jul 2021 10:55:00 -0700
Message-ID: <162740850059.2368309.10593418620932998201@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_105503_496369_9FED8F0B 
X-CRM114-Status: UNSURE (   9.94  )
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

Quoting Chun-Jie Chen (2021-07-26 03:57:05)
> In all MediaTek PLL design, bit0 of CON0 register is always
> the enable bit.
> However, there's a special case of usbpll on MT8192.
> The enable bit of usbpll is moved to bit2 of other register.
> Add configurable en_reg and pll_en_bit for enable control or
> default 0 where pll data are static variables.
> Hence, CON0_BASE_EN could also be removed.
> And there might have another special case on other chips,
> the enable bit is still on CON0 register but not at bit0.
> 
> Reviewed-by: Ikjoon Jang <ikjn@chromium.org>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
