Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ADF6C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 20:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vXX6yegiMaTp+ytimqO1VJERfnDw815BKYostMLB1To=; b=05hAtbKXwnFeL4
	xTPkfhtVbulmT9AQYxZEx7S4PjMDLsEWeIO9N+yFW5SrHCvtrEMtcqSU8RZsWNOkbaaTO6hjSxfBm
	fpaQBmTQ2lbhI/AA2V1RsrBn0A22+i4UeSDm2fPl0G0CtUg9wUHtIKz8+S8WQaORy0ME4P3vTIE0g
	+O+jRipmjh/UP5f3kPobjLPkUV2QCz7cdHs6Ijyugm3IFUeXj8/oN6U4hbXm9txE6O0NuMVOgWRlO
	eSb05Spc98zv3ym/FsNVdtHLzegKe8uFtJ0+hgOqohKXRDZBbZzpg+JzOqaED/yU1AveUAMg3lTBN
	8HphHXy5WuLn9xz4aEcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKnaP-00CBVD-B2; Thu, 17 Feb 2022 20:41:09 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKnOy-00C5mg-2i; Thu, 17 Feb 2022 20:29:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 0E73BCE303C;
 Thu, 17 Feb 2022 20:29:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42BA2C340E8;
 Thu, 17 Feb 2022 20:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645129755;
 bh=MBVB/V4HtFGVcnuF8jusIP3cu1MRbIMiN9GJFCtixlg=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=TmhzH2I+N4ljfo2SVnhoeFHVVt8QPUMXw8I5hTMQ6OC3gayYY1eqiMPpWxrTcDzTR
 +gOWQZXu9lNoFJfY4y6T9DNCFr+rQml7/+S5VMw4GA/jgVSdP1lnpuM8MdJ3fNqTkW
 GzJXbIzSX0R4ISIUeeUIqt4Zk3mX3ln1SNmuinaDKuVNnOdgo+uDegXxccCM74286Z
 SfEVxM0t+nSJ5QtEmEnzePJUh+JY+v70DDlJkG9HyFVHhJhDxjTligB+immW5z1gsK
 gx9oqiXXXo3WGmQdVSBxoosIkaP74VIwqWBF4Ipy41nA/1nSc1gcPExgPWb783rntK
 X402nlvGfuatA==
MIME-Version: 1.0
In-Reply-To: <20220208124034.414635-28-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
 <20220208124034.414635-28-wenst@chromium.org>
Subject: Re: [PATCH v3 27/31] clk: mediatek: Unregister clks in
 mtk_clk_simple_probe() error path
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
Date: Thu, 17 Feb 2022 12:29:13 -0800
User-Agent: alot/0.10
Message-Id: <20220217202915.42BA2C340E8@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_122920_352489_762308C3 
X-CRM114-Status: UNSURE (   9.80  )
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

Quoting Chen-Yu Tsai (2022-02-08 04:40:30)
> Until now the mediatek clk driver library did not have any way to
> unregister clks, and so all drivers did not do proper cleanup in
> their error paths.
> 
> Now that the library does have APIs to unregister clks, use them
> in the error path of mtk_clk_simple_probe() to do proper cleanup.
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
