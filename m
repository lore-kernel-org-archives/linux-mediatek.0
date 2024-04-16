Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3860AC4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Apr 2024 07:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4HIZb2nKPjLTTz62XK4VK6Iwqa3YIDFbrj0IrJZaoNI=; b=rJ+nk2h24jesKScStg7hjoKuyH
	adi6Zh53UhK0vHZ8SRmr1EoN3T4dG8gTnM3SXoHcMJx6K5PIITaT2Qi6kJvWovEZvH7J8cZeoYY48
	sB9yRU0aSipGVP3BydV07BgIZMyuQN6d3y/GSy4mDknFe68CWayIjds+9gJ2qLNo8aG7xAoyy1uQP
	HBa9ZN2ioFGTDpZP2vRJhgdDfrFdtmpvSwZ8IMScBYnDZa/tYeiGowJ/+5W5nczP88rV3/OQSrq6B
	aeOiUp7/JdJcVjxDlRnKDaNp7W6/a2F6zYyx+oC7lIGUHnBs95Zvr8w9WjI6bHPzYrDjekcmOI5kO
	tisYjHnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwdgu-0000000BLyD-3gvr;
	Tue, 16 Apr 2024 07:57:20 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwdgr-0000000BLwv-2Jzl
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Apr 2024 07:57:19 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a5544fd07easo35315766b.0
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Apr 2024 00:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713254235; x=1713859035; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4HIZb2nKPjLTTz62XK4VK6Iwqa3YIDFbrj0IrJZaoNI=;
        b=dKQ1spO/kiVpCbYN4S7btIA3Wr4uxBAxWrwRCopHyopooUqmPFkA184+2AUdeuhZ27
         hmm2nANV4i8G1MjvkD42nefVI/1G9jJjqGfr3MqMqhErrim0L/wdSKgdcEccnHA9bbxG
         RnYJZ+d0JOPDzwuWsBQ7QfIJv/zR5RdLttWlYuaSdfL8JtiKMYeX89tR7yAZE6Ci9p0I
         88sxQOFQDsxQbSsZIgwEIfTh4vs0r8caJDgNRzYvCZK6SvgdkPNrUdVlpetNbaiDngH/
         JYK49tdFgsKudO+A3uT509LSaiI3ZTvr7CezIz0hmFskdarmEr8AflkKCep3kq9M+YIE
         1W8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713254235; x=1713859035;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4HIZb2nKPjLTTz62XK4VK6Iwqa3YIDFbrj0IrJZaoNI=;
        b=HsUivPc0UZYul+5hhHKMRQM+9VmBH+7oVGKiK1l5WbDuf++5PnXroa+eKZaQ5iUmMD
         kfWG+mhRJb6X3VMslQIgk18DAw6VCBdO0FeYbq6QRCcshOvC9XjXEMhmV/XqMUB5dM+P
         5dLYbpWCOGv8l4Odj5sk8NfBgEOY/hqTqg+sXbEzeXHQomaxvboMLEfat/Nv/Gfm8nQb
         1lhZbdDcRsOFiTp1hEkNWlYr3OoWbZ80klBgWbIUKoCBHPwI3aBft58Te7WOJ6veXYWS
         4QEpL4s8PNSsWlvPtOkf3jjS63mgA7Gpzx0xBfycqfjU62RoA9WZr5X6WQJb1Jglgo50
         ZBIw==
X-Forwarded-Encrypted: i=1; AJvYcCUYlQQXYr4Ve0pIVXqrIybOiKitK3Apzzuep9NDKxEVlHmEv/WMhjkPHBmqnzY6hZlqWaWFoewBLlAmG9dPYykxiiiq0IgbfIU7ciZZiAWc2ndC
X-Gm-Message-State: AOJu0YzIPsO2xlPLYiZAgtZPHH9X4T32x6Qz/SmUDQOPxSs3xdHSPqVe
	wKnjcl+tHtfgfrcrytJKSU+F2bN0CZaZJptx4GFRlO14bmEqAa2GEnQN64SHDCg=
X-Google-Smtp-Source: AGHT+IFmYom8ca5REWXBouKNnF3JyRoh/X3BZipPWdBTLAjIHlxGuqZNeTPobNF+ISHRPd4L/JQwdg==
X-Received: by 2002:a17:907:764c:b0:a52:57ad:63d0 with SMTP id kj12-20020a170907764c00b00a5257ad63d0mr4228551ejc.20.1713254234712;
        Tue, 16 Apr 2024 00:57:14 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id kf20-20020a17090776d400b00a51e9b299b9sm6444928ejc.55.2024.04.16.00.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 00:57:14 -0700 (PDT)
Date: Tue, 16 Apr 2024 10:57:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Martin Tuma <martin.tuma@digiteqautomotive.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>,
	Abylay Ospan <aospan@netup.ru>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Dmitry Osipenko <digetx@gmail.com>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Pavel Machek <pavel@ucw.cz>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 21/35] media: venus: Use div64_u64
Message-ID: <99b220ad-79e4-4920-9e90-6cd6a3349bb3@moroto.mountain>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-21-477afb23728b@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240415-fix-cocci-v1-21-477afb23728b@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_005717_747855_ED07D5C2 
X-CRM114-Status: UNSURE (   7.81  )
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

On Mon, Apr 15, 2024 at 07:34:38PM +0000, Ricardo Ribalda wrote:
> us_per_frame does not fit in 32 bits. Use the appropriate div function.
> 

Really?  It's less than one frame per second?

regards,
dan carpenter



