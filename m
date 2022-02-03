Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A400C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Feb 2022 09:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GwO6F4dhJ5lpdTlsXoFdVYGLlVlwwwlXyp3MEHRPrnY=; b=GgjJyzld4HGrBl
	uTSLaTq3siIMEqhQlfoxFbGMpvAb+xgyhst53P9Khg1bo/nvO3UR3iahVEhdC86wQnEhAryhWPb84
	dtH6xAGZLzodf1Xh1rWpYQJuhUrvzbXcxtPxjKap78GWBbOf/5EQunAAceqvEGw780ZQlcLIXaJZw
	02VOHN8MnG1/AMSgYv2Omn1wf1BJgRNDYC9z6DYlJwQLr/2VbIzejLhn82+IGZdOcvV0gWMIbXIZs
	puSn9ID5SyEBKRw6Xdl7cqOfr0xxA5rgEfw2kHQdmr17KBv/3QVuNPMm5ItE3030O74lHEBBCW5DA
	tXOo8N/BKzgkjVLqlxTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFYii-000YTr-4N; Thu, 03 Feb 2022 09:48:04 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFYiD-000YEe-Vx; Thu, 03 Feb 2022 09:47:35 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 50FA41F45305
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643881652;
 bh=WU4eeRXiAs8mjWnJEvdQ0ANmvSO20F6MjLLjrC9HNT4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=lyc8+SPSya/hclAoLe1Xrzec84Owqqht/YNf/eWDfmXpkp5CVdBwo0uifi325zuDL
 q2zLcHnUZrafd3YlJoGqJCo6eeGKgssaEfy+qj6awD8DzNxo80TPdKqNbrBHDq4t7r
 KD3l4H5CAcavag8SEns6GU6/jEztquSCvUR4Ax14IXNnPIqTbPwBned8ro07oMeyYB
 vJ75+r/DqWefvyl8zKwH4yGkRIGvXVq0Xn8mpuitBSFIJGo0YBPm3QooCDxeGu420S
 e2KgSdHcAfcRd7sVf562mzPJN2daSA2q9kfrvP5ev0fVnsx5/zG+fgaTSwPiJxYgoO
 aNYCooc5ujodA==
Message-ID: <34a65278-7842-823a-8ea4-f64da62adb6a@collabora.com>
Date: Thu, 3 Feb 2022 10:47:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2 31/31] clk: mediatek: Warn if clk IDs are duplicated
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220202134834.690675-1-wenst@chromium.org>
 <20220202134834.690675-32-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220202134834.690675-32-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220203_014734_210971_05A1513D 
X-CRM114-Status: UNSURE (   8.64  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 02/02/22 14:48, Chen-Yu Tsai ha scritto:
> The Mediatek clk driver library handles duplicate clock IDs in two
> different ways: either ignoring the duplicate entry, or overwriting
> the old clk. Either way may cause unexpected behavior, and the latter
> also causes an orphan clk that cannot be cleaned up.
> 
> Align the behavior so that later duplicate entries are ignored, and
> a warning printed. The warning will also aid in making the issue
> noticeable.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
