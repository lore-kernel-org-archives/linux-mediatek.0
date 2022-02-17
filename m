Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51CC5C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 20:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ev5XlywOt/EX3T1QQiC31AOlQ/yJ8zA5c6FqgRMtE8M=; b=h5LbsllBvf4kM/
	DqBlIQr3MJMV/P+fgasWOT1z/vM+2LiNCuubAwbG00SWHRM2cS6dXO2YDfU9CiOGUnDDCYWvLI78X
	CXFRS/xe0topO16v7coc3231YCDi+ICzXCuFq56dM4jnDTL41eSIXpjYJdf81uZ5doR4Ybw6pUhxF
	TqS+a4DJYXqnLSI85VrQC35JSZdKuihCgKCQaT1tvez5yaUW/Rb/uAYl9I+zM7/6OQuVNYE+Pgm82
	uQZYuLDzLYo1eFd6bfMk08ZUfuYGAR/07HE2Z1NCWp9qQKA8vV+Ad7wa3Ks/B602xMoywfXTZVvOv
	7xj4sun74CZXeGJ9YyLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKnGY-00C1Xo-W6; Thu, 17 Feb 2022 20:20:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKnGN-00C1Wi-Dj; Thu, 17 Feb 2022 20:20:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 07A8961D7D;
 Thu, 17 Feb 2022 20:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64FBEC340E8;
 Thu, 17 Feb 2022 20:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645129225;
 bh=eEM1/BgSWPu8vdPRMcvM/JdUZ5HQzfFvVqozYQ+s2MY=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=qQxB2c94GHuo8oXJXFS5I7yvT0yW1XRctPNYrv5uxmV3SPceJtUJR5giQw+hryOif
 JSWiSThPabDlY+u4g9gchqcw5dm3pKYcPPOJaaBoxKVhawM9255SelPs8+nQ5My6o/
 TaX93cedd/sYnIZtiUIJgcytOwGRKEGDG5GxCJCYQ8p+KYAX4cxeqL9j+nWaOyCYAR
 mvolesE0BfwomhuGiuZnNh4hi7jCRrwhCfsrpCODKQTQ9fsX4ZzUmUblF775W5OFWU
 cL6jqOqfPrheH1pMZ+eRW69/4n1DOtPWQgclxvcYYneqbrYJXr7V3+W3Dnb28BMJl+
 BhknjDjvXKXYQ==
MIME-Version: 1.0
In-Reply-To: <20220208124034.414635-2-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
 <20220208124034.414635-2-wenst@chromium.org>
Subject: Re: [PATCH v3 01/31] clk: mediatek: Use %pe to print errors
From: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>
Date: Thu, 17 Feb 2022 12:20:23 -0800
User-Agent: alot/0.10
Message-Id: <20220217202025.64FBEC340E8@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_122027_544541_2D22AEBD 
X-CRM114-Status: GOOD (  10.02  )
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

Quoting Chen-Yu Tsai (2022-02-08 04:40:04)
> If %pe is used to print errors, a string representation of the error
> would be printed instead of a number as with %ld. Also, all the sites
> printing errors are deriving the error code from a pointer. Using %pe
> is more straightforward.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
