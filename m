Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A70C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Feb 2022 10:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WFjRdbQtf012ueFyp4MAZwE10f0H/WuCpVm4vI1lJmA=; b=zIhwlfzZb6GpLj
	Q+B6o7O+Ui3qNZG3biGFU8kCCCa1PAiD1EhHpwxALMgc+okQuGJa98x5pkAdxWlCtbUHw/+MRpXpq
	hYxYy4SjhzE+w6qsXBSTcgDT9Gj+bfBlyUCqezyF+kOabSZTZeozkzGvRjSZuljNLMVBsWDunHZRJ
	AYLfZrzFcGCQ5YiELFLojv9OGSxDLsbCVenoE9J21s1Ba4RXBWG/7oUrsugTIMc8rHsEfAVaym8rf
	M1uqqFtIwbpXXEJEdVfPX/ltEiG6Ad3lInUbLHDufCpE578n9urBI4U8tomTZQkIsMVsd9nXHewlG
	od3A6bK8HcA/hlOmBo7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFYw0-000fM0-P7; Thu, 03 Feb 2022 10:01:48 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFYlQ-000aEb-B3; Thu, 03 Feb 2022 09:50:56 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 3B78B1F45312
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643881851;
 bh=UslgxD+QUohWXG2QM5oeqgf7yzlI6Zmso8kNly/Sz/w=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mraiHQjxioYAQh7GhNkuMx01FlcRjUM5f3UhMbDIKfm2YSjRAgarnPNhJBlw8obXi
 Jl/fu2mFPYGzi8KAQIC9eEcUKPLEEq2I3y+tWLN7i8O9GGUTLmA5oauDbfFZaOHxPH
 o3NE69eAqrbrm1YYT9Qcj1LWiGwj2zttX205tRN8P0ymPHjXHVNpwkG/HW//L2vIeU
 oZwcAH+4OE/EQbUAfBbSq9Xw2pva0M3u5JLMYCsMmkG8DJrJ4Lgewlx5YX+9EYftms
 lM7mDBhdNKcdgtcfYvB3+tYAiM/gT1mc3VjfRI81d4X/dUM4do4z9JOdfw2ZT61XAo
 haFC+qtr8LmVQ==
Message-ID: <4587cdf3-a906-38cf-cedc-82b6795fc14f@collabora.com>
Date: Thu, 3 Feb 2022 10:50:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2 08/31] clk: mediatek: cpumux: Clean up included headers
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220202134834.690675-1-wenst@chromium.org>
 <20220202134834.690675-9-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220202134834.690675-9-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220203_015052_597154_BD598B43 
X-CRM114-Status: UNSURE (   9.41  )
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
> Some headers with the declaration of functions and structures aren't
> directly included. Explicitly include them so that future changes to
> other headers would not result in an unexpected build break.
> 
> On the header side, add forward declarations for any data structures
> whose pointers are used in function signatures. No headers are
> required.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
