Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03270C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Jan 2022 02:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FFnE0dVsjCw/mz8EF4aUdK51Ee31k21BFXXZdz2vJA8=; b=COI0mGxOlF2yMw
	+IUR0+ENa4QwMBrUUJ3/uBEkZcG4yqnr+qlYQPTw6oDlAd+zKnbvrQo5oHbd4I97Pm4oExdnrr0IA
	A6dnHmYvjSZAMosl7E2jMIKZCb3JxRd3YImwtb4a4bmvIpM7yio5DXzB8gUXfCj4tYQM2Q2iOXcO+
	pS+ocHY61MXzF8vOns8AK6jyimYbFG0Hk7DvPLgGTBXZkT/DfqojnoY7oGYHMTXLKjo17R3WFkULg
	TqLURHtL2lNDiNKoYAKbHfjOkV4Na+m4ZWrJPp5U7WQ94JihovQGPd73RH1clL3nWBfSExmw7NHc6
	uMwvtJVGrb7Sfgvbr9Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5f3a-001yEt-7i; Fri, 07 Jan 2022 02:32:42 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5f3C-001y3W-PY; Fri, 07 Jan 2022 02:32:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 76779B824BB;
 Fri,  7 Jan 2022 02:32:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64EC7C36AE3;
 Fri,  7 Jan 2022 02:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641522736;
 bh=GZT+2y9W/LYKIckQ7nhu2pQ5tWSH9XoDLshaOtLjGNc=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=pyfq7/1O89rNncSYEcXLRgjsE/P/68+/hCrrvqC+nqxqdtLZJllHj2T0mz+U+O7or
 h7b/6iABs3FE+867qfKAV4m5sQfMRgahCdqqSrKEr5lrCCz7dE2MlF9fq7nYyIZ8xO
 AreYkjov9GhNlknMXzU7c3K5g0tLgdvKfRcb3xpf+WKyxaj2nSvyxFFjCrEMJ1aZi1
 qA16l7RmMwnA3pSxsPpPgSI6xf+3cEV3MurBkAiv1xjouFmEXPNrBaya7YfyBQws4j
 W/q1eS9jGwguUAqbs592JXbp10KphiMGz/v8mnSYpoBnsaUKCv8osgH2fKNhBsP01s
 SzungOWx4FyDw==
MIME-Version: 1.0
In-Reply-To: <20211217121148.6753-4-sam.shih@mediatek.com>
References: <20211217121148.6753-1-sam.shih@mediatek.com>
 <20211217121148.6753-4-sam.shih@mediatek.com>
Subject: Re: [PATCH v7 3/3] clk: mediatek: add mt7986 clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: John Crispin <john@phrozen.org>, Ryder Lee <Ryder.Lee@mediatek.com>,
 YH Chen <yh.chen@mediatek.com>, Sam Shih <sam.shih@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Ikjoon Jang <ikjn@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Miles Chen <miles.chen@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Sam Shih <sam.shih@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Date: Thu, 06 Jan 2022 18:32:15 -0800
User-Agent: alot/0.9.1
Message-Id: <20220107023216.64EC7C36AE3@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_183218_993502_83282223 
X-CRM114-Status: UNSURE (   7.32  )
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

Quoting Sam Shih (2021-12-17 04:11:48)
> Add MT7986 clock support, include topckgen, apmixedsys,
> infracfg, and ethernet subsystem clocks.
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
