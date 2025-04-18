Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E0DC369CF
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Apr 2025 10:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IiDBnIbN2ErdrAZnJdVTPEl8ORr2jBX+0bJeY940wkA=; b=NI2EZZW/VdxCEXsl6oY6fbiTyn
	RfQn/vlrc2P1JINtZwB2cfUJ4u0qPvpSUr0rqh0NAQTF53KurMmbtg7b9OWmMZbpRR36yw7pSbZq0
	jnxwv5BhbNoKcWPg/yUuAQoIACNpuQvkwGqEo29nQotyXfk5mVvX6xJMIdyMy7PC3dAUm0Zwj1NEe
	ThiEam3box0j3I0gZ438U9o5ZHF5qjIXepw2r9Vxx7cAzDZg/s6NR6++0wDJHX0DgJ5751w+oaEtG
	NrX7cbhGWy+J8F4ZidUj4A9qqeqcWbpnPaZs3ufp7hdkc/dt8vu6PqV5RIgVwyhJ4uQ5vpokqqjfR
	K2zkqp/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5isJ-0000000Fqyg-2lco;
	Fri, 18 Apr 2025 10:23:11 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5irq-0000000FquL-21mS
	for linux-mediatek@lists.infradead.org;
	Fri, 18 Apr 2025 10:22:44 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5eb92df4fcbso3159676a12.0
        for <linux-mediatek@lists.infradead.org>; Fri, 18 Apr 2025 03:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744971761; x=1745576561; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IiDBnIbN2ErdrAZnJdVTPEl8ORr2jBX+0bJeY940wkA=;
        b=Lk43pGCiIqcETDOHw/EE+8lqpooM/mW1LgbvWD/Cpw9HTz9FEFNowaYS6v/zBZ9/2f
         /r8tVDbo1XdkngqUxUUmyk/PcAcMmmOfLp5GEGj2Da1/QQWh0a8aHz4No0qvoAXCCfv4
         oTNLfsKi2r8QTU/JpFE9jcWvLZAEhphIXp2rE2AOkdhkm9mM94KUga16BfTozmQzVm/0
         h2TcaUIE+FOiqbxppqF+3DidEGNaPXu26oF0cU5+S7/9mHW3zG2pRTLhWQ2K3HGQWQ4O
         ZnpeMFlcyXAqJfZPcB5/BStzUDuZR4n88e648Pk4GvDx68jooNofIpJ7FUT6CyjhUO+s
         S6sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744971761; x=1745576561;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IiDBnIbN2ErdrAZnJdVTPEl8ORr2jBX+0bJeY940wkA=;
        b=WpbUzWPYbRmGIsPGpgO15qbGTk38/77+3Wd4SlKx1Qj4DRyq11Epw0ucxieqh1U6pw
         6Z6teUJ+yy8in6SeRZVwwGW9qn/nZbHKvz5BzjR1v3h364UfP6PT09M0Gnh6wG51djI6
         rmS/yr1ZAeWycoTD8abl+krq7qg0lxCGl3/9M0m7uRbkINnT6oJmd9oqKcc4L5ySQlzu
         LYRlIkKFazEmgPX0tBGgjaLG7m54CNZPXs0NH3oT6sfTNlWNH6ZzcAyilrjKvzn5ycM7
         AIwlD/bTyTe8pnfXaX/9EPxs6aIoEHRSYco5Xiafk7NIZHgqto6uNKaLHoI0ePctrIL0
         zYTw==
X-Forwarded-Encrypted: i=1; AJvYcCVEtKBDUUuuQpLpg8yFbR2Taps3WvKtx/Eaw3nFDcHi2VOY/MUPdukkwv/cBWzenOsi6vo47vIx6GXZziQhbw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4inFwPTt3XTkKpcIapKfb+nQPdZEDyKWCOeFR7hNNFJcbk8jN
	lZWH7GA3ZuMStWaG/3/I0FlIEFUS+xltuamvtCeiTdE9YTwU75M13BlWY7u5HDN+ehPfbx3LbNg
	l/LM=
X-Gm-Gg: ASbGncuSVm3v+pbw0cBxSvr129iD/FjvV616NoXfIi/piuzJIOocQvYuttl1OMFFDss
	TNzt7ByjpScvOefZIsi5urA5jeM1mJ9CAbOqDKel4bdgY3dlR8quXLPw1xte482ggW4YXHzRLPN
	ze5dEC80LjRJJz1o9m5LeB6GWtHV92ys5kldmUItTt3YXKW1PZBh0ULBRujROXUShwAEd3Wz9gz
	Yjjs5DwKcmLI1brDVqsyJLDTZ8lc+ZgfTP/WzCiePI1/9ySuhqLin4hsylqrxfKwUC5GslCy7vc
	hvPu/zlGFKTRI9jVxLiIJEKDzTdZK6g8CcaVO52h6tN9okQmgDpDITLlKPVvfFHAj8lom0kcFgK
	Cgtk=
X-Google-Smtp-Source: AGHT+IEhVsv0Ij1c7fYpfyCnxhTynvdaKQ/MYv7KemDDNjedaaUCumCbBnsf/IltIZ7kk3yXig1l8w==
X-Received: by 2002:a05:6000:2489:b0:39c:11c0:eb95 with SMTP id ffacd0b85a97d-39efba460e6mr1527952f8f.17.1744971382884;
        Fri, 18 Apr 2025 03:16:22 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493377sm2340627f8f.62.2025.04.18.03.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 03:16:22 -0700 (PDT)
Date: Fri, 18 Apr 2025 12:16:20 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: rafael@kernel.org, rui.zhang@intel.com, lukasz.luba@arm.com,
	matthias.bgg@gmail.com, npitre@baylibre.com, jpanis@baylibre.com,
	nfraprado@collabora.com, wenst@chromium.org, bchihi@baylibre.com,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH] thermal/drivers/mediatek/lvts: Fix debugfs unregister on
 failure
Message-ID: <aAImdJFvfLTKe-TY@mai.linaro.org>
References: <20250402083852.20624-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402083852.20624-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_032242_523452_F0A08400 
X-CRM114-Status: GOOD (  11.51  )
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

On Wed, Apr 02, 2025 at 10:38:52AM +0200, AngeloGioacchino Del Regno wrote:
> When running the probe function for this driver, the function
> lvts_debugfs_init() gets called in lvts_domain_init() which, in
> turn, gets called in lvts_probe() before registering threaded
> interrupt handlers.
> 
> Even though it's unlikely, the last call may fail and, if it does,
> there's nothing removing the already created debugfs folder and
> files.
> 
> In order to fix that, instead of calling the lvts debugfs cleanup
> function upon failure, register a devm action that will take care
> of calling that upon failure or driver removal.
> 
> Since devm was used, also delete the call to lvts_debugfs_exit()
> in the lvts_remove() callback, as now that's done automatically.
> 
> Fixes: f5f633b18234 ("thermal/drivers/mediatek: Add the Low Voltage Thermal Sensor driver")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---

Applied, thanks

