Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C74AC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 20:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4tbPzhrDztLbTD6pF1LWxFCk8oWqJ/s7HoBt1AnH4z4=; b=tS6lAwwhfir6c6
	Ju/TYFCNw2GTdSD7TqOc+FNSQ4iM6iIL8y9zrvKsanX4+GZgCXzadGUyVWYl5sitM2tCEVBDIM9MP
	NlW97SYykAuwAsdCGrGxz4U3yHbpezD8RJrCbODSRjW6F6pwddjKTY7zoUJdaLaZYYS5KrUrwNCO4
	NO6ggeejmMNvl8Lp+yIBqyj2XyoOgSkFA80eZB/Vj3xXO201UYspDzPgwNEvnftnMon2mLISxRswo
	N4QE8Pr8JViFy1YakQKEET8kJ72WweDaESIzhDLxF5IMMcTngXe9eOPrliYs7mW67n3LBD0SsYwle
	vCbgseuNRYnTp3JsL4Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKnPl-00C6An-Bb; Thu, 17 Feb 2022 20:30:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKnLR-00C43m-Pb; Thu, 17 Feb 2022 20:25:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3980061DA5;
 Thu, 17 Feb 2022 20:25:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9511AC340E8;
 Thu, 17 Feb 2022 20:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645129540;
 bh=4MMRT1XbREvNZztA+k8zvD/DvbOWWudkLm6qW0zGRF8=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=SH9RnZWwyQSxReGAgEHbln8lulKa3fTFjWTliXxOUuV5EK30Id8RUwPguZwW0SQ40
 RE4gUWFcg3ALMWL3fOgm6YZf5XzCcmPKBacTW3kZFARYcZrqImahLj3EPfmEl3ZA29
 q+ZxlTj+WXbVvOEsGIef5tnV0Nbj7w1j6Br363UR7ACYXuoCil5ijCjduD01BLq2pc
 lhWC/ZcnOt7GGz42NIJlwterUyQm4MVRRnBJS0+bcl0UQDFt5F1/tetb3hWqM3DzJK
 UInkNQ/a5u3NV/1ndmp6MHEI5o+XDmyTPrHjYE5kqU/6/JpiQ/6fhY5slqYBZcvHsU
 w3ASojK2g7z5g==
MIME-Version: 1.0
In-Reply-To: <20220208124034.414635-15-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
 <20220208124034.414635-15-wenst@chromium.org>
Subject: Re: [PATCH v3 14/31] clk: mediatek: pll: Clean up included headers
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
Date: Thu, 17 Feb 2022 12:25:38 -0800
User-Agent: alot/0.10
Message-Id: <20220217202540.9511AC340E8@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_122541_933947_FE945A03 
X-CRM114-Status: GOOD (  10.18  )
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

Quoting Chen-Yu Tsai (2022-02-08 04:40:17)
> Some included headers aren't actually used anywhere, while other headers
> with the declaration of functions and structures aren't directly
> included.
> 
> Get rid of the unused ones, and add the ones that should be included
> directly.
> 
> Also, copy the MHZ macro from clk-mtk.h, and drop clk-mtk.h from the
> included headers.
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
