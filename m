Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54274C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 20:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uWBcveH7rpEisMcSRxssxoAo2B8SvnKuQm9cnsTxsF4=; b=gR3Us0KO6y3a2J
	XmEJlxqk99Ng7zNisip3Jxn6Kv2WmPlKJswszm+wY9IkL6mzH3tzvfBrYwySS4eHkBegG2iUaS9jI
	eomDcqPjnSBoqYifXBf7J/xMZjW3hzDtzwOoB5kHnVjb3q6fyPkVkoRJGYb4xyUB05RbSRjmN77U7
	92qXIv/59Hfjdt+DcyzB7W1giVgA0EQHBox5soDZt68mgmKc8b1H1YXvPMYk2OxjvoXAJEE3ArlO1
	IdGF5ZHgzVL/Pv+OuzmlGQ9PDnWZaR3Nrg7UqHIAsuVGG5pSCmMs/JDPXLmuBggC15cPcesULIZSz
	PVb5wMcl10LHdP7GAygQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKnMk-00C4hZ-8Y; Thu, 17 Feb 2022 20:27:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKnKu-00C3p7-Dm; Thu, 17 Feb 2022 20:25:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D867261DBB;
 Thu, 17 Feb 2022 20:25:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38090C340EB;
 Thu, 17 Feb 2022 20:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645129507;
 bh=NANMiRe1Q5XOTTcz0YIeCUPmQ981TsyztedonQAOvmQ=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=DJm6iMkhGVhAcJ0ub02k5NGo8Pni6cKHVZTrkagbuTr+K0ogowi4IJDCb+fmOaas2
 PE60C5KXgjyqNwzvpwY88s/Xvgj9zWeEM/TPFG+eLeAKcVxgj8SDymReZZt29x5oiK
 JSrOCeqSuuCX73fWo2mxWoP1KBAFtLUhFfgtJhigAvsqUPpx6zH6VmVOonzvG6NKb0
 MhvFI4vfelSkfIwAecQ8PTD2fMXYaG3uI9GnY35SkbSuNzWTcAZ/1Kx1qFZFJIGrei
 FBSdlayBytAf47jVx/beKYiPhIygzA7rwbVfPkK74RCCk1U8sXJclKSbUHYDUeF3DX
 z3ejsxF4/b0xA==
MIME-Version: 1.0
In-Reply-To: <20220208124034.414635-12-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
 <20220208124034.414635-12-wenst@chromium.org>
Subject: Re: [PATCH v3 11/31] clk: mediatek: mux: Clean up included headers
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
Date: Thu, 17 Feb 2022 12:25:05 -0800
User-Agent: alot/0.10
Message-Id: <20220217202507.38090C340EB@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_122508_559190_96F6D908 
X-CRM114-Status: GOOD (  10.21  )
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

Quoting Chen-Yu Tsai (2022-02-08 04:40:14)
> Some included headers aren't actually used anywhere, while other headers
> with the declaration of functions and structures aren't directly
> included.
> 
> Get rid of the unused ones, and add the ones that should be included
> directly.
> 
> On the header side, replace headers that are included purely for data
> structure definitions with forward declarations. This decreases the
> amount of preprocessing and compilation effort required for each
> inclusion.
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
