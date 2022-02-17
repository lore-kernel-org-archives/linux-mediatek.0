Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01BF3C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 20:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZS0zbNp3AkPNGdCvt+cXBMTEGH055tq/JO7pHg5Y2Mc=; b=253sQ3I+C/sC8y
	YxlfBvB9Kti3HoouDuBzswPSsOSIG13XTMHDbmPxtT3Ra2UkIxjvbOmw115p4OBtgzeBl/UO3ijWJ
	KInh7wQ9/ni1Iz2Tyb6uSV4DYfAGoadJC6N6Yp3WeFSH0kDI+yIzdS9zHRln08chQIzOhbciEhjGN
	BQXPYi3ti78wcoTmMtppaEJCifg04ILUkgmOOCOJY0TSrosWDhIaCpVfYI3BvE6VWIX7LsAI/XhIB
	ch0idwQQw8hBBEcxHEL025IMFHJJonMoSTbVsq9Fao1+tdIxyKen0qIgDsa8dhZNoE2N9GXchdT3P
	xNGiCZ2t4BStOXdUj0dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKnLt-00C4HP-05; Thu, 17 Feb 2022 20:26:09 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKnKl-00C3ky-LV; Thu, 17 Feb 2022 20:25:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3DBDDB82486;
 Thu, 17 Feb 2022 20:24:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB756C340EB;
 Thu, 17 Feb 2022 20:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645129496;
 bh=DnKAXPQhLMpQ6fPVXGirHN4IFHlLR677G67d6iGe+Rc=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=Ng++DHIpj7piXKi5aaQQlALz367dz4xf2frYRfBImQbFytNL/oIjfEkvm0fQLZl4R
 Hh/0j4/s3ZkOfUKi16FbCKJRaUuYW0KMYuaVBBrSuyvjbNjHqO2yc7Bd6Hh5UsZ+R8
 Su500G3lY/sA2OK9xPp3SDNpCBe16xslgkkRXj8AE0JrGEjnHEAi1FsMciMXl9sImP
 SKkJlabVP/rycLa46bnY61vhJZ31q47+HAOcYTCp1dOi4buARVhXNoojl6OE/OAarI
 milaEB6lQEAi7V8xxuVjsCDzSPH3ieaLB7QxWBcNMu4vHCoilMYhr+SGnonhHiLMlr
 b+7pl2ykwkxpw==
MIME-Version: 1.0
In-Reply-To: <20220208124034.414635-11-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
 <20220208124034.414635-11-wenst@chromium.org>
Subject: Re: [PATCH v3 10/31] clk: mediatek: mux: Internalize struct
 mtk_clk_mux
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
Date: Thu, 17 Feb 2022 12:24:55 -0800
User-Agent: alot/0.10
Message-Id: <20220217202456.AB756C340EB@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_122459_902254_7710F35D 
X-CRM114-Status: UNSURE (   9.85  )
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

Quoting Chen-Yu Tsai (2022-02-08 04:40:13)
> struct mtk_clk_mux is an implementation detail of the mux clk type,
> and is not used outside of the implementation.
> 
> Internalize the definition to minimize leakage of details and shrink
> the header file.
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
