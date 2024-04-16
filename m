Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF62AC4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Apr 2024 02:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jdhfOsUByq8rUAvMMWe9XMEbUc95e1ogkd9aQZm1obo=; b=qsfUuk7x0k9OQVSJfy9O3xq/FQ
	bepMaRRzCEU9uKAC4aIZ9bS/CCxuDJV94quj171nXEQto5MnOIK0vYg2gVaAVswvBw1A8yHV/r1Mv
	+5sWYDqviX4KEMb5lcCw5gX7wfrMeH2w/ip5tS/TinpeOyV4imH7NaOoroDrR3Y8QDcjNXaZwCtBA
	byVgjpwoB5JXWQ9WJnOeK0PAER0RDmk4qxouXEfShT+iOTwaJvHLm7AsXLldi8bNX2b3luH0Djse3
	qgM5eCjuy0SK1txWh7VHqPHmQuGBziYDi+vVoe8M2DiX8jr8p6ubgszfpQzAIu0WplAFyCfUQHCV6
	pEGei03A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwYAv-0000000AUeD-32tY;
	Tue, 16 Apr 2024 02:03:57 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwYAq-0000000AUcP-0fY5;
	Tue, 16 Apr 2024 02:03:54 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 029581C0003;
	Tue, 16 Apr 2024 02:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713233025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jdhfOsUByq8rUAvMMWe9XMEbUc95e1ogkd9aQZm1obo=;
	b=IFNxCzpKpOnKB5fD2zdxHmr4+x/odprRgDb1rV44iTZF88RaqG4RxMU+ttqzXq8OrutgfO
	VAmz+TbMrq/IY69cjJIP0da5VNZ7cKiBkq1UnoOmzgOrxs2gTErWowdwuCzROabUtkwOsS
	ZxDJnk31eyhyeF9s34aBwWGX+UOQfnnLyXXCMrTuD6A+J7WvE/gdZYnmhqZ4H+io4spEuz
	SsxErIMnd13MRzCr1PCtxoET2JUPs7qWnI/3IxPjFHvh5XrCHLCjwwvZlUVdA+6IazbD8v
	/mgR8byu4c7wptGosm3glSCwJcJHIDkiErIHWN8fCCWJHdd59bPXayxzBYieug==
Date: Tue, 16 Apr 2024 04:03:29 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Martin Tuma <martin.tuma@digiteqautomotive.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Hugues Fruchet
 <hugues.fruchet@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Paul Kocialkowski
 <paul.kocialkowski@bootlin.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Sakari
 Ailus <sakari.ailus@linux.intel.com>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Hans Verkuil
 <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>, Abylay Ospan
 <aospan@netup.ru>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Dmitry
 Osipenko <digetx@gmail.com>, Stanimir Varbanov
 <stanimir.k.varbanov@gmail.com>, Vikash Garodia
 <quic_vgarodia@quicinc.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konrad.dybcio@linaro.org>, Benjamin Mugnier
 <benjamin.mugnier@foss.st.com>, Sylvain Petinot
 <sylvain.petinot@foss.st.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Laurent Pinchart
 <laurent.pinchart+renesas@ideasonboard.com>, Niklas =?UTF-8?Q?S=C3=B6derl?=
 =?UTF-8?Q?und?= <niklas.soderlund+renesas@ragnatech.se>, Pavel Machek
 <pavel@ucw.cz>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 10/35] staging: media: tegra-video: Use swap macro
Message-ID: <20240416040329.31547d8f@booty>
In-Reply-To: <20240415-fix-cocci-v1-10-477afb23728b@chromium.org>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
	<20240415-fix-cocci-v1-10-477afb23728b@chromium.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_190352_522360_84D89735 
X-CRM114-Status: UNSURE (   8.59  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello Ricardo,

On Mon, 15 Apr 2024 19:34:27 +0000
Ricardo Ribalda <ribalda@chromium.org> wrote:

> Makes the code simpler and cocci happier:
> 
> drivers/staging/media/tegra-video/tegra20.c:324:44-45: WARNING opportunity for swap()
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

