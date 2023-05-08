Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B119EC77B75
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 May 2023 16:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Subject:Cc:To:
	From:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8QMhc552UlUsj7kYvZWtMUMNf+gVyj2eysVQyi2xaKM=; b=ua8eo9x8C4dp6yzkwaM5UPZUg/
	lCs4qV19Kz+ISvsIEe6Xw5S5XL1jQsbvAFJYHATHGBjMJ/Wo0S/4p/gYc422esCP7KgOZmVJWDFF/
	MpFlL4ftg9sMdiWe4ttMZnbxL6sFE+ftBX7nNv509GHq/fOTDzyZ6BjBVRpgShtOdu4bCONCDAmBp
	ROW/XfvHRNBd/a4i0pPll2BZtMwN6dKDpgoMjyT8v7QodwR9pxTLYYCW05uOpIuDrUdtByWLrxS3i
	apvcMUgalLh9B1mierTAAmpqHLPF5jCdslp+EWrhBJ3l2loRDMXbD9tzfIgIpsJjg1ozqPRNFRAGq
	NKJdC0qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pw3KC-000v9j-0j;
	Mon, 08 May 2023 16:02:56 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pw3K8-000v8W-3B;
	Mon, 08 May 2023 16:02:54 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3f315712406so176414535e9.0;
        Mon, 08 May 2023 09:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683561769; x=1686153769;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8QMhc552UlUsj7kYvZWtMUMNf+gVyj2eysVQyi2xaKM=;
        b=HlBZP9zPGcvY5f1n0Z0Uf8lOdCdbUV5xpjGQS4G389s8eIBv01rai4p4cryDNgB+j9
         3qaIMo3beQUAjsH2QS1gNZi94/Wr6yV7ZVuQzW3MkWKKAk9VlWyniZqTKB317aIq93Ls
         AgM/iO383zjxC9eLglL1a2xJxlTqJRutlnCml/ApPRnUSAws2ctrbcsfhlCtXHLJIDIv
         kGbcTrMA5bE/zjCBzx+EXLS+UZrH+N2j5biSigIzNcZIXTeG12ZGAWDpolwh7tZTKdnt
         ozBrgxQW7UkkCukatEzjJnex8KgE7hdnIOor2cB5r4NXhryw6JI5QCx7gBi54WImVVB8
         7v6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683561769; x=1686153769;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8QMhc552UlUsj7kYvZWtMUMNf+gVyj2eysVQyi2xaKM=;
        b=M15/4xpw07tWmLvU5ivn+m7I1cZl+S/EV7FWoMzKccOF/4NKNVNiCPqiQHbM+Dwmf5
         ftPLAmc/r85mg+uWSzyGMtLsifuKaMExu7sR7NOQo8OWbK+6/I2oQ4X555DkohVWw7yj
         9O/9gwblGphBzZr5WFyI13oClT/2NJWohugxHnS+z/QwdrFrX9GRwbu6ptizsVHvnGNz
         TIsbNXwlTVqv5WJ5JDhuF5Cx//FEGGzIRNwq7oFylI2gxIIXWWOFn7NCglcmWahWUXEQ
         8F1ZeXYEhKx6gLMfgLsaY7FHs1sATHgV3nTGpovg9pLxtM77QW9RPPt2r0ja3TS7cg5e
         USNw==
X-Gm-Message-State: AC+VfDx2bs40VuBp6jfpphTMDeKffSgH/3wDAAngzYO3QkL8woRhvFKs
	Hm2T5FgRauFNsQe18olM/tM=
X-Google-Smtp-Source: ACHHUZ5gut9Av3LAVbmrxULeIcOJYi74sqsnH/+A0yslUft1sWoiypVuYj5H2hMqmRzhO5GwVeo11Q==
X-Received: by 2002:adf:f785:0:b0:2f2:79aa:c8b9 with SMTP id q5-20020adff785000000b002f279aac8b9mr6830879wrp.35.1683561767917;
        Mon, 08 May 2023 09:02:47 -0700 (PDT)
Received: from Ansuel-xps. (93-34-93-173.ip49.fastwebnet.it. [93.34.93.173])
        by smtp.gmail.com with ESMTPSA id g14-20020adff3ce000000b00300aee6c9cesm11744439wrp.20.2023.05.08.09.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 09:02:47 -0700 (PDT)
Message-ID: <64591d27.df0a0220.d1f7b.ca4a@mx.google.com>
X-Google-Original-Message-ID: <ZFkdJNHT2ARUKFic@Ansuel-xps.>
Date: Mon, 8 May 2023 18:02:44 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Kalle Valo <kvalo@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH] dt-bindings: mt76: support pointing to EEPROM using
 NVMEM cell
References: <20230508155820.9963-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230508155820.9963-1-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_090253_049502_98D72840 
X-CRM114-Status: GOOD (  16.22  )
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

On Mon, May 08, 2023 at 05:58:20PM +0200, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> All kind of calibration data should be described as NVMEM cells of NVMEM
> devices. That is more generic solution than "mediatek,mtd-eeprom" which
> is MTD specific.
> 
> Add support for EEPROM NVMEM cells and deprecate existing MTD-based
> property.
> 
> Cc: Christian Marangi <ansuelsmth@gmail.com>
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
> Ansuel is working on mt76 driver support for NVMEM based EEPROM access:
> https://github.com/openwrt/mt76/pull/765
> 
> I took the liberty to propose this binding patch.
> 
> One important difference: my binding uses "eeprom" while Ansuel went
> with "precal". I found a lot of "eeprom" references and only one
> "precal". If you think however "precal" fits better please comment.

The name is totally "to decide". I feel eeprom might be also way too
much generic...
I was thinking to something like cal or precal following ath10k or
ath11k pattern.

Also in the code itself I notice there can be different calibration
hence the idea of precal and cal... (currently we define the entire mtd
partition and call it eeprom but on some card different data are
referenced with an offset... that will be dropped since nvmem cell will
reference directly the data without using offset, which seems an hack to
me)

-- 
	Ansuel

