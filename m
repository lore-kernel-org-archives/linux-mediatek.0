Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D60C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 20:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bERCECpMNm3HxCJgyv6slXKPzxpi4ZrcfCFBkukKR00=; b=qYcOusnH/h/8Gh
	ZjnFY++uJyytNuobrRldzLBgyZfgOCp2XxfUdDLL5HHTEnlBB6GVyIc1uVFfQ58DMSww0cSGrSgEI
	uw1oeZtT21j7vrj8RjEK0z4kDJPKU6TRq3c0kuWgY1tdvS4Z2nMK+K6Ykm2UV6DJxLDrk71FSFb1j
	GjovuBGUzgmI9tYcRVQsNDIh5IYym/do/Nuqrvp+FR8mqz7ofAyc/kUyAYRZcFagXT7QfRrPZyKtQ
	wrguz7GvZhbbOn2nBvRWoee9BxvtT9mIjR9jhMW+ztgjDej2gRZlv9JEFBA9OvZSZPYc5TY4gJ7JZ
	8lsEnHQyChrF7p02obGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKnJ0-00C2wg-BF; Thu, 17 Feb 2022 20:23:10 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKnHj-00C26x-KF; Thu, 17 Feb 2022 20:21:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B6A1FB82486;
 Thu, 17 Feb 2022 20:21:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C02EC340E8;
 Thu, 17 Feb 2022 20:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645129308;
 bh=lV41Ql6v90WlWkOZB0AEvluua+kEpsEci3M5c+iLfh0=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=ikFqhNp6DXtNKNuz1BMmUG0ZdJNE17hntPEENMq0k6j5mEVzAIYEv8qgdirasiIsk
 1yKMXK5DVY+SGCvwFjezhM9Be3WwZ6wEin99Uyf98xjET/MaH09pFJ49b1Rswpf4oz
 H8SXzTLr0h/Y5noIqC7b2jhAHZfInYlIAilwkFYRdX2Nh1cUGF6dhOw2LyWUh1gJZe
 ZVRWl2n2o+lGGkHttFcLIWygzS0dJ3X83Fd4WnZ1+hUPlL3J3hwGWMZdl2CzSxmJTz
 qSRwYNJvfcQB3XT8lswESB9v07iF5sjx43Zutkdv0nLZV7immqCFmyTBmSqCRC78j7
 1oF0fqxvozcgA==
MIME-Version: 1.0
In-Reply-To: <20220208124034.414635-9-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
 <20220208124034.414635-9-wenst@chromium.org>
Subject: Re: [PATCH v3 08/31] clk: mediatek: cpumux: Clean up included headers
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
Date: Thu, 17 Feb 2022 12:21:46 -0800
User-Agent: alot/0.10
Message-Id: <20220217202148.3C02EC340E8@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_122151_881142_8C0F9F35 
X-CRM114-Status: GOOD (  10.09  )
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

Quoting Chen-Yu Tsai (2022-02-08 04:40:11)
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
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
