Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B278C4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Apr 2024 04:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zlvfKPvFfqMVTjgmkdQ2dgHupdBvuhJAjVeekD23sMY=; b=B4NeaK5ZJgFsEDK+cb/aJshZnY
	O+Wpt+w7oA9EgYnqNRPEijXovlYK97gHlfhnSuBuPKHj0Xh5PXCSyyKUvFiJLZU8/kgJpYDKxdKeY
	DKQHgeZob5IuUoGglId3XYkzDG08Vc69PA89PV0AOLaNvbGHDKlUApHdR0nCiATEmCXbeDUBVO94p
	QXWpWD6fgWtKhBY9bHdU8jYPTS6PuC/Hca5kPreYSUl2nkQLFcRV9sfX+wcWNgHU7L+9I0YpIxp3g
	20yL5ruaGv2vGBtitOTDe7NmQaz6s9ivqDM4ieiFET9EICRpkVDCmWPi08I/Iu7aF2NQx96patzhM
	VvWxLBVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwadS-0000000AqfK-2JU8;
	Tue, 16 Apr 2024 04:41:34 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwadP-0000000AqeG-2q91
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Apr 2024 04:41:33 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-2348116ceb0so1155319fac.0
        for <linux-mediatek@lists.infradead.org>; Mon, 15 Apr 2024 21:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713242490; x=1713847290; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zlvfKPvFfqMVTjgmkdQ2dgHupdBvuhJAjVeekD23sMY=;
        b=JhJY7w2oL4mBNW5VxtE6nozJsAmd/0VMPASmNkZSqGd9MRQQAEyXHQxI3tG7kUFErR
         9V4bDIKF+rlVP3Kw2fT+m39fhetfMmhJ/9W0Js9J8i4PLEDSFrN/05bmBuFLBb7vo4QI
         3ss81EyrKx906ephBdq6f9inAJmEr/0ZCJV3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713242490; x=1713847290;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zlvfKPvFfqMVTjgmkdQ2dgHupdBvuhJAjVeekD23sMY=;
        b=LoPhQgtXoJ0BCPlqW3V0CUt5X9i2iuAtkUiNjVP0gu+wUnsBVaeRpizjYXYkiAbpR5
         uL84ORmVKCzMcfLLDvYbiTKQdWeI9W03jphuD3VKwrlxIKLGgzZFu9M3Qt9Ek9WaNNVw
         RwKMiDpL+xkuBuYmVnqXcMPYTNQjn1hD8Om5GD/rbVVx+0XBpLeOySyeLsKXLjcKRMyT
         HtsLQvdidnuzJpuBGRYDJpcOi7uZbGL9aRaWM6AGdexdzhI5MT35pX8ttl8wsE1ewDzQ
         vlHW+QJjmGf3dwRm5RabuCU3EdQwIKEzolU6W+MUw/jhccqteosEwN9Pda5GHvG5nsS9
         e5Ww==
X-Forwarded-Encrypted: i=1; AJvYcCULTnZtCSLXek2axU+kpCO/m02gLI175jt90WTO0A5s664VGGM8iNzhxDRi1T9VY2F2LcZzFin4w2HHvhiKlif61//8tCpqvaBLWEh58VoL565V
X-Gm-Message-State: AOJu0YxJCutZXig+otdlZR0EAZW6RQrK7iW5+i59pC/lQkVl3o/c2Yna
	OF9cJnNJCUPTHq8KIj15uOiT1HFVmoOrDaQxUzbcPMwcpTTg7dQ7U7TeokW2zQ==
X-Google-Smtp-Source: AGHT+IFGNPBipDIE0AiNQc/Cqlxd5431Vef5ObfevA6hF44fnzurKBxD1B4lS2oVTJREu9b1YFAdCg==
X-Received: by 2002:a05:6870:89a4:b0:22d:fcf9:bd97 with SMTP id f36-20020a05687089a400b0022dfcf9bd97mr15408827oaq.26.1713242490147;
        Mon, 15 Apr 2024 21:41:30 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:1137:d3d7:a09d:5379])
        by smtp.gmail.com with ESMTPSA id r4-20020a056a00216400b006edd05e3751sm8284703pff.176.2024.04.15.21.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 21:41:29 -0700 (PDT)
Date: Tue, 16 Apr 2024 13:41:19 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
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
Subject: Re: [PATCH 04/35] media: uvcvideo: Use max() macro
Message-ID: <20240416044119.GB14947@google.com>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-4-477afb23728b@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240415-fix-cocci-v1-4-477afb23728b@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_214131_790505_0CA17AB9 
X-CRM114-Status: UNSURE (   7.94  )
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

On (24/04/15 19:34), Ricardo Ribalda wrote:
> It makes the code slightly more clear and makes cocci incredibly happy:
> 
> drivers/media/usb/uvc/uvc_ctrl.c:839:22-23: WARNING opportunity for max()
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>

