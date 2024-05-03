Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3FA8C4345F
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 May 2024 10:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l//WfaOHzkVwuTsY4klY1yumIrJkkUaIyUTI7phJHxM=; b=tEYsuSEP+QfHtzMzlJKYLUzfbl
	qxKoiJQehrKssik/oz8kDSiZsNeHyd60unXF1X1HCblRqEF9FdSCQjxE7Uha9EJgBqZ+Ltxfcn9nr
	n9mVyKtPIZQ2AB0DNki3nXcstHXCbNM3AYn+/TkuhFxKPVFZRnOg7ozuFeqXhdM1TSXzyjzbZE2jH
	8jF+C9Iz01nrM45KFp99eAmJ4jvBqFS2c23LXqm656zBg83hIG2PQdV62ZBpqG6zHhLYuaOiW7WZ/
	CI5DMyBRAIEyWHjZFghf6GLbK3hv/NO42u+//YS2cjxsLp40Jb/Mlm/x2zbAYOXu4zrjVlmDGkBB6
	tLxZTHDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2q9N-0000000G2ot-3q9d;
	Fri, 03 May 2024 10:28:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2q9K-0000000G2nW-20x9;
	Fri, 03 May 2024 10:28:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 542A760A69;
	Fri,  3 May 2024 10:28:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86C52C116B1;
	Fri,  3 May 2024 10:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714732094;
	bh=OntdBaerXi3AJ/zLXyZcNtMvP/PzL6ZafwOb4BeMmI8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CVexwY3lU9pEyrjVDtImt5My3VLqjq0O6pu4tXHAYXra+R/yyivA0NvhfTLZ09e0A
	 cxbBIdKBwsREn30DGoNQVdBGNnjfuk75/VpipXdN/6ZvWZCfIKVtqVsOxiXD66T88L
	 3sCcvCfpeYvNOoP9K2/otFr5CSejsUV24l3x7xiLmlJ2OYwtrX4t6Z6ZRbVrQ+yG7x
	 8TpvvQD0STMgj41jXX4MiXNiccAK0MNa6GSxqKlDQTZ05zw2Bzltst6RLpU6SK1jGx
	 3MalcpgYNan36bYB7hjf438rPRn0mK7fZRYgacV4KlzCbym7pY6M6KQ7QdGTsVih8M
	 SjyAg0MIerKAg==
Date: Fri, 3 May 2024 11:27:58 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Martin Tuma <martin.tuma@digiteqautomotive.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Hugues Fruchet
 <hugues.fruchet@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Paul Kocialkowski
 <paul.kocialkowski@bootlin.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Sakari
 Ailus <sakari.ailus@linux.intel.com>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hans
 Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>, Abylay Ospan
 <aospan@netup.ru>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Dmitry
 Osipenko <digetx@gmail.com>, Benjamin Mugnier
 <benjamin.mugnier@foss.st.com>, Sylvain Petinot
 <sylvain.petinot@foss.st.com>, Stanimir Varbanov
 <stanimir.k.varbanov@gmail.com>, Vikash Garodia
 <quic_vgarodia@quicinc.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konrad.dybcio@linaro.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 26/26] media: dvb-frontends: tda10048: Make the range
 of z explicit.
Message-ID: <20240503112758.763d8d31@sal.lan>
In-Reply-To: <20240429-fix-cocci-v3-26-3c4865f5a4b0@chromium.org>
References: <20240429-fix-cocci-v3-0-3c4865f5a4b0@chromium.org>
	<20240429-fix-cocci-v3-26-3c4865f5a4b0@chromium.org>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_032818_635856_D1BA5FF3 
X-CRM114-Status: GOOD (  18.19  )
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

Em Mon, 29 Apr 2024 15:05:05 +0000
Ricardo Ribalda <ribalda@chromium.org> escreveu:

> We do not expect the sample_freq to be over 613MHz.
> 
> Found by cocci:
> drivers/media/dvb-frontends/tda10048.c:345:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/dvb-frontends/tda10048.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/dvb-frontends/tda10048.c b/drivers/media/dvb-frontends/tda10048.c
> index 3e725cdcc66b..1886f733dbbf 100644
> --- a/drivers/media/dvb-frontends/tda10048.c
> +++ b/drivers/media/dvb-frontends/tda10048.c
> @@ -328,7 +328,8 @@ static int tda10048_set_wref(struct dvb_frontend *fe, u32 sample_freq_hz,
>  			     u32 bw)
>  {
>  	struct tda10048_state *state = fe->demodulator_priv;
> -	u64 t, z;
> +	u32 z;
> +	u64 t;
>  
>  	dprintk(1, "%s()\n", __func__);
>  
> @@ -341,6 +342,7 @@ static int tda10048_set_wref(struct dvb_frontend *fe, u32 sample_freq_hz,
>  	/* t *= 2147483648 on 32bit platforms */
>  	t *= (2048 * 1024);
>  	t *= 1024;
> +	/* Sample frequency is under 613MHz */

Are you sure about that? Some DVB devices have very high frequency 
clocks, specially if they're also used for satellite, so I can't
be sure by just looking at the driver's code.

Also, we had already a bunch of regressions with "fixes" like this
that actually broke frontend drivers.

If you're sure, please add a note at the description mentioning 
on what part of the datasheet you got it.

Otherwise, let's stick with the current code and address cocci
warning on a different way.

Regards,
Mauro

PS.: I partially applied this patch series. I left a few
patches out of the merge to let other people review/comment
(and/or for me to take a deeper look later on).

Regards,
Mauro

