Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D7EFF8860
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Apr 2026 11:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oczoMnPReZaIdQXexoCfPQETvMC08e4WB9/AECl0kH0=; b=j00b3jHN/09FLylsFelLWuEUWw
	tVqg941BM+HORMs614jf46ApNxk5jz19gXBpeAe5iaUSj3jWHiLq7ReIuhc3ym0J1UAKgW4UOVbO5
	LTunqkA8SfsuBEI98dse6braUf36UC+Ji+fftKv1BthIgWXLJ30eMndSsdpcK4XezIONjcOhZ0YeY
	17+OWJNznr6s6HdNpwjRxdvUHq3dLunX3fUH4ZxdE/NQl5i1GDZ7j6t1B1lYE5DMkykSRoq8FU8w9
	hDbSctU2R4J0/d3415WHRpM0fTU+EsaixeYi/fXtbb4DTpB+UiSzOG1u4diDV+qSOwFD/KBr6xuxa
	KIj2lq2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHKBj-0000000Gnq3-3aUv;
	Mon, 27 Apr 2026 11:31:43 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHKBh-0000000GnoS-0UvL
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Apr 2026 11:31:42 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-488ba840146so91822905e9.1
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Apr 2026 04:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777289499; x=1777894299; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oczoMnPReZaIdQXexoCfPQETvMC08e4WB9/AECl0kH0=;
        b=LodDXEkCAyP6uzan+Rt1xbHXkvY8g8wmluuprKXSBPVztQRYAQjCwm7PQQs+LtSPiz
         TKpKrrue4yGv4DnyEJOMEIHPspA8/ZDoo13cx1KxnuawqHdFfbYLdX1u0w0e6YvsHIGB
         lI4JzenJsRnZiByPhYM6hPO0Z6lwBnl1iPpQAJ25s4gslQQIGE96hV5/UdDlMuBVbRW+
         clJo5aaHXCMkBHYGyJFVmn98QVKoS5zhpAUT6ob+XLEPZFFOsBai36NFZ5kJAqLn0pPf
         3TX1N6RQ4BjvkiCnzNwhqgAXtwSORxVax1DmtfdAncTXfDWV57+dNApf3VErPCYli4+3
         4YzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777289499; x=1777894299;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oczoMnPReZaIdQXexoCfPQETvMC08e4WB9/AECl0kH0=;
        b=kqUPQgDivG/3D2KfK3ZAUtZ+qQO25+ggihZmSWItIZs96jdWSZ9dhtdA9NoS3oUQQE
         hgNSvjsBIyuscnCFg72ee3JgXnZBtRaNAjtbIhS3WylQAdSpsjot42uSxOoF2B+fr5+K
         HmtH79fEWur7ooCmZLqdsTnipvHltw7ZNCDtX6y7xVUfv5h/H5f/kQVU7NwBC2h/bj3v
         LCu6jsUjkxG/hdG/fH9Fby5LK2dfZVeRg2/4j7To8ysJ/oPbjSrpWAeg5Y1QNA7L091r
         dDyg3AIHStgOh6ynKONpEfGqRdG4zR4STGRzSUbvYx4UGzRcbh+eP1lJuhfqY/wEpmUq
         trUw==
X-Forwarded-Encrypted: i=1; AFNElJ80nRX1YgXRQLKKAXCHtWkjBNksIutJj12yiM40/Z6m6lNNd1oeQjhUEdhl3C1t4NI4HyIqDZy7GhL2LNLvWw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/Izou2tPB+nPEmCiJnOq5BcU9kvRv9+wgMGUblYDk5ucca8mR
	W0sUwrLmtWo8oD7W8/I3SgYg74EvKuCT7P0yA78gxOtN8DQmiymRftoF
X-Gm-Gg: AeBDieutXcTKnmpnONLwwTfXohBahjQ0w1vscGtUsIhZRt8VzJpWiwi0jbwUnqEIhNB
	m6wEy8NJu34oSES8/+t4MoOZYcWKEsPcZRdRogmEld6qHlmeYa6vS5R6PHCaBd7Uq0tG3jYtCX+
	OoQ8I3RwRS5eqJD7FNKZ6ZCrdZ2rZiC0TyY24hw+W5ZpZVCbH1pQVI38lBe/PVPOuocrfHuFZmj
	XTpV7hTLiR4SykCE3c1wfsvaE+NDHtY/3CLzrEKutr1IxFwVtWKA/YLLt8ouK48P8CwiaFEP0A1
	wcmBRGwe+z7YZp56Rb9U016zIe5bvq85VMKrjQ4LG27txy2RgC5X7ogS787zHMMA/KdNM86daaI
	6BF1gEQAr6O0jDMJDYJXB+Df3e6UT2QRYRJ0jLYa+chABiC47cynwKiwe25+x1KsWLwfA2ZD3kr
	GPfdRFZ3TrSzAxpQeshmwW5Ph3766liRw4jw==
X-Received: by 2002:a05:600c:a31a:b0:488:b241:2c5f with SMTP id 5b1f17b1804b1-488fb785b7emr456261975e9.26.1777289498891;
        Mon, 27 Apr 2026 04:31:38 -0700 (PDT)
Received: from pc ([196.235.239.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a59816b71sm221145305e9.1.2026.04.27.04.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 04:31:38 -0700 (PDT)
Date: Mon, 27 Apr 2026 12:31:34 +0100
From: Salah Triki <salah.triki@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] iio: adc: mt6359: fix unchecked return value in
 mt6358_read_imp
Message-ID: <ae9JFucpXBPwwGzr@pc>
References: <20260427085458.38546-1-salah.triki@gmail.com>
 <ae8pAGBGGOvsURka@ashevche-desk.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae8pAGBGGOvsURka@ashevche-desk.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_043141_187822_17AABDCB 
X-CRM114-Status: GOOD (  20.23  )
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

On Mon, Apr 27, 2026 at 12:14:40PM +0300, Andy Shevchenko wrote:
> On Mon, Apr 27, 2026 at 09:54:57AM +0100, Salah Triki wrote:
> > In mt6358_read_imp(), the return value of regmap_read() is currently
> > ignored. This is problematic because if the bus read fails the variable
> > val_v remains uninitialized.
> > 
> > The function subsequently assigns this uninitialized stack value to
> > *vbat, leading to incorrect measurement results being reported to
> > the IIO subsystem without any error indication.
> > 
> > Update the function to check the return value of regmap_read(). Ensure
> > that mt6358_stop_imp_conv() is still called to clean up the hardware
> > state before returning the error code.
> 
> Sounds like this deserves a Fixes tag, but the problem is that the whole driver
> is written like this. Why does having this fixed make it special?
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

You are right, Andy. I noticed that several other functions in this driver
share the same issue. I will send a V2 that addresses all unchecked
regmap_read() calls in this file and I will include the Fixes tag. Thanks
for the feedback.

Best Regards
Salah Triki

