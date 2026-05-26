Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D90CECD5BC8
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 May 2026 17:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kbKjzg9bSmm9vRJLbDtl4q72jw2NHj5tbX6e2y5JU5I=; b=VV1D1wTLvM2vYTA0QArIH9jH9D
	PnWdTjK3Dc43x6mPDxFAu7Qh49LTub+AOYxGYDmDVZ08slJKYG2jLatWW2j+Db2GAyM2i00SGutSA
	C+yuZGBDXP44lMUsvy4398Xc0s4Bv/62MH1DI+F9C7/SO3vD+0k49Qvr8ZoL6KT2oGKLTRrBG5BQq
	M0bczVOwXt7ShPjaTRNL4aVIUc64iBGRPh19xxGXVXRgI322TdQUGCAct9jtSGTDF6pn6UmWv+ndT
	qT/wVL0/NMqBi4XiwQVm1/GPcf4GNyX9u4Mb+xJuEjYFQF4ROFGJ74IrJR8Jd4az/uy7HLemfs4Af
	XEH0lwZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRvPK-00000002h6Y-2wUg;
	Tue, 26 May 2026 17:17:34 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRvPH-00000002h4r-2yYz
	for linux-mediatek@lists.infradead.org;
	Tue, 26 May 2026 17:17:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779815849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kbKjzg9bSmm9vRJLbDtl4q72jw2NHj5tbX6e2y5JU5I=;
	b=R6AVUtDrOHvciJ3n+l1MO3qtVn6V6ekeJI80E+Q1j6JUi+itNH5zMzBQLr8RCfRfr4wITo
	dYZmW4c+RDuXdQm0WhsDeutOYPnxQ0ULgP/dPKZfXz4UbB+0J8/AwGO9ZScOVJBUSzo/d9
	WUvLL41yQTi++/bnhfsTJSg1zaXx/oA=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-324-KqIhPjhVOtSF9XHn_YBucw-1; Tue, 26 May 2026 13:16:03 -0400
X-MC-Unique: KqIhPjhVOtSF9XHn_YBucw-1
X-Mimecast-MFC-AGG-ID: KqIhPjhVOtSF9XHn_YBucw_1779815762
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-43b02fbdd68so11406816fac.2
        for <linux-mediatek@lists.infradead.org>; Tue, 26 May 2026 10:16:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779815762; x=1780420562;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kbKjzg9bSmm9vRJLbDtl4q72jw2NHj5tbX6e2y5JU5I=;
        b=F6K34edBt2YDDGMLl5QTSydmEddUE/ha7R8u6F+6tnFmFm80y09X94LZU9MywpYKQA
         4muvy4mqDbyNIXXmJWGm67ZW0BS4zQTR1dBDvc9NTLMayExOejVSBiEPwtNnxDjuB+KO
         vXQK8Xobewb90nKi6nVu4RwbsfoX2iUxxIX2TmfRs36zFi+yqWX0hA2n4006yOB7n8u3
         bQKx15VESzipNIDZPW96XOqhVTAqygrhg9p9TIyQCxUudJPaZVp+CXE42wCk9IQ2FYkL
         SKj36enA0Zavxb4ixkzm7au9aIrt+0Oj/+ODeXWJhvC5OJxLLyYYU737xTHB/29vGFmL
         lZeg==
X-Forwarded-Encrypted: i=1; AFNElJ8BivuztmmCrV4D/uzMwakgToG0OpEu+jNdo+1lFV7vAwxd7DaPF//RcFQmRy1N1emLC1+7rC6xqtc23hzdOw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9sOAj0DKj873a/FZ0Pm+/VgBSs86+r1uLnQ2b6Zw+NRv1hLyF
	VFjV6q/vlZXc0ahL68f+nTPyfyKUMl55orLnx+/39NjtZpeVPawuIYTDk8AhF6NH798ZX7xM7hD
	YRCgOV55eCfAFN6PqHGjbJ1xnsmNCpbjK9SjGywaqhNv9xwEASLmhaWDUol5qHNXAw/jJCg8yLw
	==
X-Gm-Gg: Acq92OEyntfchL2qTS+Ew3ex6U3zW9HRJ9VeP+KFtm97B0UkAJmXZmf46SkNhT+w1+W
	T2rsP9+WXpSusnRm+Y0o5yocT6gatjDOq4/Mz1F+I5wpvlIyLLd5hRjyMO1CslXFTjecGGjjALx
	JzT5JXzGgT0YNljImMRck5+0UBVC7a84iY5FlaXPJKpgPGJhxa5XWeEoKdqnoPOPHY2txglvbv+
	pMEslb8v+QyV5dUu6S7MV9E1BCGqWMqCTNDWbz7ozvzB9QQOgY7vdO4eAo2R+A40lZRZBliVGIJ
	v115a3UFklvCJ3WEgLjPUhRKE+ru0kWQe2NpM0XIYU5j/Hn7Cd4R9h5ZxtjfX/z/0jWnL30U/lf
	zABcOnqArPko6m+faXPiE0hVn6wVQxEso9DD5BygOabqRS9SdjQQJNI2AcB3yGyCIaaA=
X-Received: by 2002:a05:6820:4b14:b0:69d:d9c5:9308 with SMTP id 006d021491bc7-69dd9c5938emr1142398eaf.16.1779815762477;
        Tue, 26 May 2026 10:16:02 -0700 (PDT)
X-Received: by 2002:a05:6820:4b14:b0:69d:d9c5:9308 with SMTP id 006d021491bc7-69dd9c5938emr1142352eaf.16.1779815761931;
        Tue, 26 May 2026 10:16:01 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cc812e2018sm148514636d6.28.2026.05.26.10.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 10:16:00 -0700 (PDT)
Date: Tue, 26 May 2026 13:15:59 -0400
From: Brian Masney <bmasney@redhat.com>
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, wenst@chromium.org,
	laura.nao@collabora.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH] clk: mediatek: mt8196: Select REGMAP_MMIO for vlpckgen
Message-ID: <ahXVT62JUZmliXfy@redhat.com>
References: <20260522133023.355404-1-akkun11.open@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260522133023.355404-1-akkun11.open@gmail.com>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _w2PZ7LjPT62lypo4eMjyfPsbTcCtaqbqzn_ymEOMYk_1779815762
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_101731_812553_194B45B5 
X-CRM114-Status: GOOD (  10.45  )
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

On Fri, May 22, 2026 at 10:30:23PM +0900, Akari Tsuyukusa wrote:
> The MediaTek MT8196 vlpckgen clock driver uses
> __devm_regmap_init_mmio_clk() by devm_regmap_init_mmio(),
> which is defined in drivers/base/regmap/regmap-mmio.c.
> However, the driver's Kconfig entry does not select REGMAP_MMIO.
> This causes a linker error when REGMAP_MMIO is not enabled.
> 
> Fix this by selecting REGMAP_MMIO in the Kconfig entry.
> 
> Fixes: 2f8b3ae6f0cb ("clk: mediatek: Add MT8196 vlpckgen clock support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


