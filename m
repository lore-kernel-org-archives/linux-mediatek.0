Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A3FC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Jan 2022 02:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AvMb8V1Jv38nNEh9l+EHR2Y78ItCPAf28BNRNiLQqDU=; b=U8Zo+1SI1ScQS+
	iTnK4IkWZ7ceobyJY09Jpbwqvy38uzBS1bGrxO0dA/2WAw8Wa0dYJVLgwMYUngo1MecPi1PpvH2Tk
	3vuL8rWHtICJkzhQfzJQS4hl0sBxxLtf7E6n1VqaidDa7VuMNuyJlu8i1lg7fjC0bbVDa9Us/3b/F
	570pZQiZzCcmUVV0tDydftwHvLF37l8PkbcfVANU16txeuWxbs3LWYghjPoUY3VL71M6mzdUcRT/H
	Ts/HE+S4lojNF+gn2MK5nltaKX5PGibWWm4ve/BjYg/lDr/vn75UsqndvsIlqYu23YFX6H76hPIWg
	BZxWSlIuK/g57W4NHfKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5f5u-001z3v-Kh; Fri, 07 Jan 2022 02:35:06 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5f5i-001z0R-7V; Fri, 07 Jan 2022 02:34:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D17D5B824A4;
 Fri,  7 Jan 2022 02:34:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C52CC36AEB;
 Fri,  7 Jan 2022 02:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641522891;
 bh=v/UysLRyR3ZSlYOfKYLwtg+YpmYmJmwLdARF6BhGaVY=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=LfXDDepduhcDgcZ7TXNP2BmPlFyOTDxDpJ5agIb2ONPXGQ0jBrC7FFhXa7ddDXQLT
 XxKIvKxLkPYR0mxTRNSC7FdgiEDvoLcArfcJmQ5crc/p+d33RaH/whKTW4Uj8Kg+Ql
 GOpIVeaL/+ufR9dHez029Bm65QIihOsDb8tMcirq7zY2YJiJHX4I3endUqNYze+ZJK
 6vQGD+54lZRXQO05QSP6BFG8yAW+OXxAbzJjoqR5uH8a8WBW7UlNZRO6Su5KDSKt/9
 0SNRf+kxtULLtaXruJSGWoP8f7MyL/hVhNTRhyBPyHg3It7edBq05hkKBJa49ZETIA
 P9GHYClRv+Onw==
MIME-Version: 1.0
In-Reply-To: <CAGXv+5G5vnOuW46q7b7m6BDS+R4vCLJehrofjfv95uOFbwyzEg@mail.gmail.com>
References: <20211110022258.2358-1-chun-jie.chen@mediatek.com>
 <CAGXv+5G5vnOuW46q7b7m6BDS+R4vCLJehrofjfv95uOFbwyzEg@mail.gmail.com>
Subject: Re: [v1] clk: mediatek: use en_mask as a pure div_en_mask
From: Stephen Boyd <sboyd@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
To: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>
Date: Thu, 06 Jan 2022 18:34:50 -0800
User-Agent: alot/0.9.1
Message-Id: <20220107023451.7C52CC36AEB@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_183454_435517_D4EF4A6B 
X-CRM114-Status: GOOD (  13.80  )
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

Quoting Chen-Yu Tsai (2021-11-09 22:59:37)
> Hi,
> 
> On Wed, Nov 10, 2021 at 10:23 AM Chun-Jie Chen
> <chun-jie.chen@mediatek.com> wrote:
> >
> > We no longer allow en_mask to be a combination of
> > pll_en_bit and div_en_mask, so remove pll_en_bit(bit0)
> > from en_mask to make en_mask a pure en_mask that only
> > used for pll dividers.
> 
> AFAICT this looks like it continues the work done in commit 7cc4e1bbe300
> ("clk: mediatek: Fix asymmetrical PLL enable and disable control") and
> commit f384c44754b7 ("clk: mediatek: Add configurable enable control to
> mtk_pll_data").
> 
> It would be nice if you could mention this in your commit log to provide
> more context.

Please resend.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
