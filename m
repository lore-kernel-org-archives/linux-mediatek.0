Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84D05C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 20:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7gzM0RGkyFON+diQpJn03Egz/cBh5SB/WxJ752Lc7ps=; b=L361tcA3faWH24
	yaiAxRuejF+dXfleysNoUxpcIQa/Hw67IOws7WfASpP50mPtZJBR7tIi26LV3tcjqF1yMTPOpyFJP
	86ZS7hDbizdbPvHADGTKSMM2g3aY7GGLNYiiBoIhPSEEj/2SiX7lN6pj6QTMkT3QtNU034wgUqXXc
	csmYSLZGN5ok0OOHJK6rsv2aXW59X2lkCqzob5yBNizZjop0+EpksVMpsGLAiqcT3MNlH9tNwjysa
	X1U2qLYsXahClWj0L2Lj14xAmLE5tpzFgyurjoXN56m00ZCjMMR7j47e1herxmihD8lsNexaNcS1x
	KjLFL62YxCTPQbxQKQDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKnOd-00C5ap-14; Thu, 17 Feb 2022 20:28:59 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKnLI-00C40F-Ks; Thu, 17 Feb 2022 20:25:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 11CEEB821B1;
 Thu, 17 Feb 2022 20:25:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE7D1C340E8;
 Thu, 17 Feb 2022 20:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645129529;
 bh=5GCoE9LSgyVtdfoY5AYvI9+Rwt6pV+Ejt4MpLecQ8sc=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=uh5X0a5GPM7I4pW1/PwV0z0L7XdhkW9X5C2O4Bqxj6I1AEHE+T/prN4evQEzaiDbP
 IYyoeLXjGbNZyaVhDK0vBgYY7/IluySi98IhgNpR5XYrL/Q+1+oBOfeyRvesaGKTnD
 BaaR/yNvRCSYRWpI4U+qCvs0Ycdbh+LOptgT7sHV3Z+SoXi+91kdndl7PdTrVDvH4v
 Vaw4hMyi3vHxjzPUmEH9KITmKD/vQ41lVzzLG9i5nwx8a9vRjMSGP7PbKVQyhAKzZq
 tcKtjQPEPxkKDOyGpztDyu4AyLuX/Kf4arepO5DQSWZttkOsZWTwJ3oUdEX/LlXMS5
 f8BbBpoE/cWug==
MIME-Version: 1.0
In-Reply-To: <20220208124034.414635-14-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
 <20220208124034.414635-14-wenst@chromium.org>
Subject: Re: [PATCH v3 13/31] clk: mediatek: pll: Implement unregister API
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
Date: Thu, 17 Feb 2022 12:25:28 -0800
User-Agent: alot/0.10
Message-Id: <20220217202529.AE7D1C340E8@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_122532_893142_2AB7C5B1 
X-CRM114-Status: UNSURE (   9.82  )
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

Quoting Chen-Yu Tsai (2022-02-08 04:40:16)
> The PLL clk type within the MediaTek clk driver library only has a
> register function, and no corresponding unregister function. This
> means there is no way for its users to properly implement cleanup
> and removal.
> 
> Add a matching unregister function for the PLL type clk.
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
