Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E23C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jan 2022 02:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k0zrp5Je3JjygMWzGhp8OrQjR4IY/vdsaMI7adf7HxU=; b=qkbgG07tgngFwM
	c/E+AhtBocbCV0XFVl5iVkgTESQKXl7N/vctgCHWdpc4p3lEHfXXBg0R7hxfWxOFCuRPo+WC7FvXv
	R3/diVj6EehyjsbQYlMBYzLxejAj8ZOMruv1CfTzn4VscQCyH6TnWaxnqgJSCFNPk1rkGdgFHWgMt
	/2LE7Y6AVG260hHz/qortw7F1uJ4H+qznNcbWNpxPJ7DXGnZglCBIF0qlp1z+cHFlGAu3RItckEuB
	8BAmLcvIf2QpK7JvDlWORoa2rBSR5u0pF/Bx+/vBlBJYpfVO5pycAH5SWohreXgJDAggpi59VfvwJ
	2qVxefvoKE4QxUDcnwJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8C4k-007TOc-O0; Fri, 14 Jan 2022 02:12:22 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8C4W-007TJy-Sv; Fri, 14 Jan 2022 02:12:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9D554B82358;
 Fri, 14 Jan 2022 02:12:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43FB7C36AEA;
 Fri, 14 Jan 2022 02:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642126326;
 bh=zYNUnqgjvKHifNaU8URoS+KmBKOiGhrukpCA2hRznfs=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=VZfyyTLDOlgNpU1Eih3rLZG8eeAEzTgT0NJ9YufQqQRhYJDRwjGUkPqmp75+f8asu
 pZ/Ji4e5mjlda+mUcdKoLvByt5jyHOgwTk0A0HQNQQmTrt6HxUjF7wfUnsjt3rmYjY
 r+jA6Pka4KNVxJUeD1xItq9K1mOY+caO4oiABsvKepADxapp45ID6dRZn58MbMtoGZ
 udR5trefwfiegM+WeWY91SdQi0C7iHixepFO3cAt3ajLnVuFpuibEn6pXsKEa/jqD4
 S9bmwn+MXXHTmv6izLKlycFWEOfsLFz7pPKpswC/tH7ZLaHs5SWA24U+ZHYgHSnfs9
 yH4OBKPpIMPvw==
MIME-Version: 1.0
In-Reply-To: <20220110171000.24316-2-miles.chen@mediatek.com>
References: <20220110171000.24316-1-miles.chen@mediatek.com>
 <20220110171000.24316-2-miles.chen@mediatek.com>
Subject: Re: [PATCH 1/3] clk: mediatek: export mtk_clk_simple_probe
From: Stephen Boyd <sboyd@kernel.org>
Cc: Miles Chen <miles.chen@mediatek.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Miles Chen <miles.chen@mediatek.com>
Date: Thu, 13 Jan 2022 18:12:05 -0800
User-Agent: alot/0.9.1
Message-Id: <20220114021206.43FB7C36AEA@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_181209_095917_9FCC7C53 
X-CRM114-Status: UNSURE (   7.41  )
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

Quoting Miles Chen (2022-01-10 09:09:57)
> Export mtk_clk_simple_probe() to support mt8192 module build.
> 
> Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> Cc: Chen-Yu Tsai <wenst@chromium.org>
> Signed-off-by: Miles Chen <miles.chen@mediatek.com>
> ---

Please send a cover letter for multi-patch series.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
