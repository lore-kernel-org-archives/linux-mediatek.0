Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F0CC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 20:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HsDSBdK+EQf6ujgFyvuz5SZilDGHKE3Xvy6SKIKbxto=; b=EFbvZukivJ5g9u
	WjRm036c3XdxB5MljHtqxreX8yriiRphIybtNoWx9yyNfplZwiuiWCnsbz1PAaH0GvIdB+imQuovZ
	XJOAIV6vxOklK+bbHBCr+lYX2thqeJC2UvuVxi/7SQtPj6A3ze8mUT3+SQl4yietP9B76TQPVwSMZ
	VAkjBMzDsTPHPzV3FNm2p7KORD5mHmrO0OQ73sJ9RJjkxuHn8KATTvlbhg5xO/gX+v6GFGsrmyWp2
	JFwd14SMnAqm4UN6ACCIrtDcUdVaCwEiPm4sgL6/A/M8isTeW/IgF8hdnbpN+DQMCJgnJWVoYWmys
	PyoB16i4cgLzeRFmI6Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKnRL-00C6vU-Dt; Thu, 17 Feb 2022 20:31:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKnLo-00C4F7-Jq; Thu, 17 Feb 2022 20:26:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 274B661DA5;
 Thu, 17 Feb 2022 20:26:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75A87C340E8;
 Thu, 17 Feb 2022 20:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645129563;
 bh=yEBE2uVfmVwo6/fpt01rZYdn4V91x4Iew3YhkKRJNC8=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=sOf57vCGvyMj53fEZdYMdjEtBriS+FlihUaJ13KX/UBOwGkrNkClm18DnMRQIvLwB
 8DiaFQSZRPEvzvtR9rEbIe4I0qMQpblVGA52Z36cI1n9itDlKtj2sw7VDkRPMYvmKj
 h04d7/fPCb/0ZDrhnrW1H9Yc6iwk3oBMs6ge3+kW4vvHhFGa4A+mawJE5lFi7UZIsX
 2PEi6fsOANVcFnlsn/QWP8r6F9OGf9BE4fM0/AmoCawihIVcGIL725W9/n2O4MqRh0
 hV8JhnYFZE+La7Bzv89J5zJf56c8V+5uc5ae41n8DdZAtGFa3No1tj0SKggPYjET+I
 7CEUHYGZ5rRFw==
MIME-Version: 1.0
In-Reply-To: <20220208124034.414635-17-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
 <20220208124034.414635-17-wenst@chromium.org>
Subject: Re: [PATCH v3 16/31] clk: mediatek: Implement
 mtk_clk_unregister_factors() API
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
Date: Thu, 17 Feb 2022 12:26:01 -0800
User-Agent: alot/0.10
Message-Id: <20220217202603.75A87C340E8@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_122604_728413_B73724BF 
X-CRM114-Status: GOOD (  11.00  )
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

Quoting Chen-Yu Tsai (2022-02-08 04:40:19)
> mtk_clk_register_factors(), as the name suggests, is used to register
> a given list of fixed factor clks. However it is lacking a counterpart
> unregister API.
> 
> Implement said unregister API so that the various clock platform drivers
> can utilize it to do proper unregistration, cleanup and removal.
> 
> In the header file, the register function's declaration is also
> reformatted to fit code style guidelines.
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
