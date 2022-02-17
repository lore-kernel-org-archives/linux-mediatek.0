Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA1EC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 20:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a5l+7jvK86dV20/gmlcCN+Rdt4/pK6y6CeJracggC3c=; b=TbyX8CAJWDmtDP
	wXT2dUvZsWwF9wDztJe0O3n1sYPPf0hLIQxcMLCAOW0MArQ7zxRmWzGGLE0Pc/UqgFFMzZ0XSR9+l
	LG1BP03NZTVLxJyUBcOi8Qa1x82p6wSBkZeLXin1aGV61NCKrfiTO+TeujqiL/JMPZ6pWaKPzkY4r
	yewgcY7XGpbR4OqBilS3hEJtsPfKL3/2XVUfldd527NS4Bm6VMHVaKYeNaQqAk+R8/hi2Bcg08nhb
	vv4Gn1nsWghi3apf7Fll+Q84tVhhxhiFWyhaooAS3yAo74mebAqGP/Tchzx53MrjnRle/yqHU0CJR
	Ek6vUxLcQWVASxXAz2Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKneB-00CDIT-9w; Thu, 17 Feb 2022 20:45:03 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKnPf-00C689-SF; Thu, 17 Feb 2022 20:30:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id DA328CE303C;
 Thu, 17 Feb 2022 20:30:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D419C340EC;
 Thu, 17 Feb 2022 20:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645129800;
 bh=SSsBZlXzBFeoEU5lw4r/D18/9Ff6qo5+77w6dEp8nyA=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=d7Dt9lvXsqeoUyL1ISqNJDAqcUutI+/E/7+ZTu+75S2mfvQ4Ti31+UELUzGSSESeG
 6tqIYbssvR7mXH5yAoo1u8VYIvjXoYBIjqoyH0iRHf/tnuaChbRWdUwyu+LWknPdZt
 MbzS6bPy25wxSa2/y3tuKRigDPeEFNDhCiesNVaRWZ28p2KIYPJ60XoVko8HWwHF/K
 y6iZN5I507RgHIFzU1iV6gIhH6ajfpJ2b/o9pxDGrW1OnJ1D8zJrJgxWFo5b2W29nm
 b9nEc50yHfFqw6HASUn/E+bSfMFHapyCua9m8YjN7fODNi6XEqx66Pr/U42XTejAoH
 c/NaHmvrUGt1Q==
MIME-Version: 1.0
In-Reply-To: <20220208124034.414635-32-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
 <20220208124034.414635-32-wenst@chromium.org>
Subject: Re: [PATCH v3 31/31] clk: mediatek: Warn if clk IDs are duplicated
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
Date: Thu, 17 Feb 2022 12:29:58 -0800
User-Agent: alot/0.10
Message-Id: <20220217203000.3D419C340EC@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_123004_143983_156F622B 
X-CRM114-Status: UNSURE (   9.52  )
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

Quoting Chen-Yu Tsai (2022-02-08 04:40:34)
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
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
