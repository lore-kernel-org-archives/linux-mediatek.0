Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 999C1C79FB7
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2026 21:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sjwFGcVPSNWfje2QsRXKLC8B+AQNq5tvQ8diIKCovEc=; b=3xW3UnUV8J9JAd/LcgBsSY+ztd
	qZNLyRr2c9ZdFq4Yrakd0P6D1f/5+nFSDENw4kKfzyhkKMKPYglhFgpMLi8aAXa44GkBIBh2samxo
	ax08IptXzJPVhxDO5PwgBO9fxilsD3R4kgT+GaTzwV9/a+Jppf0K3z1ka3IhByRupVj1YNzncGa7d
	X0ZA6iW79zhLAGz909126gcITx3GnPZ1RxthbyZsDZd9cazf4iVpYDEsqq6q5TQRWNuFPMHAfu9CK
	hZSeItqa92sqXzktt340foLx9VMUsvWyuuluDuPvOyQ6Pb7Ny1HdQuWvN6qcAuZWPM9A2KFXrit1A
	dHlrXt4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Pmv-0000000Csj1-1cxc;
	Wed, 09 Sep 2026 21:25:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Pmu-0000000CsiT-1wQV
	for linux-mediatek@bombadil.infradead.org;
	Wed, 09 Sep 2026 21:25:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=sjwFGcVPSNWfje2QsRXKLC8B+AQNq5tvQ8diIKCovEc=; b=ZL4yULiZXmALg1ocob4IHac+d3
	Tx2z82nfwQjkFwlpAEjwCuYTzoQFN0wj45UHEBCdVhJ+I6Ukhk5uKffyUIjoP5ZbRhs01HbHTjSag
	yAeTcW+IQOVuqiNXfihNJyv3JtKHu/9RHrY59lznaCG4wYl/DlTO4F69rfz4z6pq8YT5J6pApodk8
	r19c5X5mldDbza3Oa6u8gi6AR0cU1Lo0+g8VyrSWv9mbU3HkGwsRzlmeYMB7fcO6FAMtgbF2Cc6yR
	MYKtWoFhHHDqoV6irxCD3Apm82UToPlc2LH4NHZcl9r5UaWv2pauBbMESY1uDa9pBcRBRKZEKuLk9
	5Lqn5ruw==;
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4Pmp-00000001hKJ-2zCu
	for linux-mediatek@lists.infradead.org;
	Wed, 09 Sep 2026 21:24:59 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso56732435ad.3
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Sep 2026 14:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788989093; x=1789593893; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sjwFGcVPSNWfje2QsRXKLC8B+AQNq5tvQ8diIKCovEc=;
        b=sWfQUpJyv2knzTfAsVQzGs+Zk1nEiLXKUhhfW0PYd36F9b8p5ydPojeLAiW6jQP1i4
         t686UKQ+z7YGwIWVmMMEgSVeffGaZyu0Onk3+28qX726La6po4vym50NHAuscX72yNAY
         rmYOoBtlfZ7o9u28EfJu896OjxNjPhBaf0px09i3y7xE65nVgZpc78i43+PPk7n9Ta/O
         2rSaBYpXzdyvQXoqPFCNH2LzcJoUACzOsk94ryLYCCxlHSOGMX+ROEKtbwsvQt3NFnYS
         EdbNtCVi/4piuCqYjp4s9VR3RyoIUmYkOfwEvldvw8GHor/pIzLpkpR7sCWxvm9V1/2i
         jbPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788989093; x=1789593893;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sjwFGcVPSNWfje2QsRXKLC8B+AQNq5tvQ8diIKCovEc=;
        b=PZHJpnq7AWh08Cm9rco8B2hds3dSLug4H6pZCRKQG7AtzPK8DYTbEI/vf3Wwef3MOx
         uSwrvbCYm0TexRfeJJICSHl5C7F8zZHQdFDee/KdHD3pzK2tlPjDet8uuwS2MTjmjaQf
         L5WfKhAbhnuJckFKU2RssMumxPzEV1xjut0cyM98ePAUsV74nHdrkdn/RsDu8+8Sh5vh
         hLFb5oGoUjYjisqEp+1e2fDscWDT8eLxn/W7sZveIbQ+te2/uAH8VHLgOFU0Lr8cV+yM
         twhfKEmS/j4GkAOghQ2D8SjbWXdlU+1qGtucPl28NAB3ITVF/xCO9R4h7xXy24B7aCn9
         +GeQ==
X-Gm-Message-State: AFuF++ms/qT6jP57Tv0Rv7Bwc7f3pF1qxjZ1iE09c8muWRreqwhpefjx
	OWogibaC8rD823imwg/Yn5UDNAmtlm9XzoRpTpYwyyr+m01noRdv2lwh
X-Gm-Gg: AYBFou2U44u/WrN//oiZJvH/29bsKhMz3vB2gH97swuClOTGL4KUVW8tKkDd+bEwqDs
	QAHIav8hTaxkAF+PPqu0USoU8IfiUKmpVCCLmjvbpVXaa6Y6VOJPHYqcB8PoUdoikUhP2FkCn9T
	Uf/IsChyw+1eTxzSTmC2vtaPFQY8XP0PQYISry6SXEmbTYFZvWPn9yGrp/Ljt/dSoZsA2SZxUbF
	8zRECtHktCcCERKNbpv6ajFpceXf/hqEIuzqKL4UNpeHa1CdNJszmamCAZhx8Nlo/jStyK7CJRL
	Xva+B2N8JIegzfvkqNazQmWRdBi6ViSZnl3WUQGP8jOf/tl8Lf5BlsvdPOFMFrZgeYRkE4M0xjc
	J99yIt+kK+fetbmEYoAf/O8caJuw3ySdYbBUAcgcAUPL+LZZfyGDUY69UW0kzRqfDHKs9ktQEkW
	cb+rN25+KoRYJstK8mgc7OYZsXngt0z/ziii5wIky56QW4ph16ll+HpopkTzJroCOsjWv6uH6UZ
	cRNiBKLD6Wf
X-Received: by 2002:a17:90b:1c0a:b0:396:41d1:cbc7 with SMTP id 98e67ed59e1d1-39b2614e099mr53418423a91.3.1788989093027;
        Wed, 09 Sep 2026 14:24:53 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e9014cbsm6506a91.16.2026.09.09.14.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 14:24:52 -0700 (PDT)
Date: Wed, 9 Sep 2026 14:24:51 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 1/8] watchdog: mediatek: Add wdt/toprgu resets for
 mt6589
Message-ID: <b01b65d3-9ff5-4bfb-9917-5ab287535078@roeck-us.net>
References: <20260908174259.9009-1-l.scorcia@gmail.com>
 <20260908174259.9009-2-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908174259.9009-2-l.scorcia@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_222456_920828_AF8972A4 
X-CRM114-Status: UNSURE (   8.99  )
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

On Tue, Sep 08, 2026 at 07:38:28PM +0200, Luca Leonardo Scorcia wrote:
> According to Android sources, mt6589 has 12 reset bits in the
> WDT_SWSYSRST register. Populate toprgu_sw_rst_num to allow toprgu resets
> in device trees of the many compatible devices.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>

Applied.

Thanks,
Guenter

