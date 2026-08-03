Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D97DCC55184
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2026 14:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9iDCDZV2asWOBXoCVGWr+sD7YN8hRKRT86USyIoiPOU=; b=ro8gEn9/yMh4fdcNR//5diCIQP
	eMUTZBd1wK12SIHplyOkwJQNRhfo9IbkpBVd6DrKsCZdOY36dtCsZvWe4MeoL7cWMV+WOIcrWJj3X
	1GvrI6YdcO0tzUC77JSVRpnjXTAtBLGQiDNuD1V70gXih2PhgrHKlDxMQADke0O73rOMQnFIzIHL0
	MwlbhJhWOcRq6MIEOg11Olg7D5ktNnM7xzk8UdaQh3++AuDvgG58j6zSTI1vRzEki4CHsvm/ItIBb
	v+IhimntdaFChmxxSNyjwxPbj/dfBPt+tbc2nerhDbbZLkgbAXgsLOE2Nnn3cOeKw/PpYSoWR6C4W
	/J2V5oiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtuu-0000000HQ9z-48gj;
	Mon, 03 Aug 2026 14:45:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtut-0000000HQ9Q-3CKN
	for linux-mediatek@bombadil.infradead.org;
	Mon, 03 Aug 2026 14:45:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9iDCDZV2asWOBXoCVGWr+sD7YN8hRKRT86USyIoiPOU=; b=Lk6Mv+Lyb4ty6k+GCxeVJ+MTUs
	JqRaoOHBNcMu5OxLNU52RMXDbyUPtpf3l95L3ASTLneMqhqxQF7jarrxsv2L4S2vHY5fWdDANiCSA
	L2Nw/iQwPA2gl19E4C5gsoB9wWAiltUMOkS4BjVbT7RwrvASwKjpP+ICLuTzAgZ/b7qyFCpp5fHqB
	M7VEm5rCXS8KJqVJ/mT+61QeoI6c8yfXftlrot/kHd2O1JtM9yZkZnfZfUEU9HMT3sCy7d7ncMoQT
	179mRE3ZU2TUWle+oBAVA2IJTU1qKHGze65vuyTa7ItbBbaVXXj3iNoWBIuO2veO968aLdGMWCDT9
	BEvct1nw==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wqtuq-000000093Zn-1Wf0
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Aug 2026 14:45:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785768317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9iDCDZV2asWOBXoCVGWr+sD7YN8hRKRT86USyIoiPOU=;
	b=eZXzOZCqLrc2IW/PLpRD5TryoJmVsoxjM9Vxn22Xo+LVZ4jVJip96zxSX9HLj6LfAiB8no
	JZHnBWxoF281/MnQauE7KuFbsAFssCtz5r7vMyat4+qibZ2bSqQPX9knQ7JO2XIDRisivZ
	batErAL/hAFSnjDY8nvN3ofeBgbr4O8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785768317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9iDCDZV2asWOBXoCVGWr+sD7YN8hRKRT86USyIoiPOU=;
	b=eZXzOZCqLrc2IW/PLpRD5TryoJmVsoxjM9Vxn22Xo+LVZ4jVJip96zxSX9HLj6LfAiB8no
	JZHnBWxoF281/MnQauE7KuFbsAFssCtz5r7vMyat4+qibZ2bSqQPX9knQ7JO2XIDRisivZ
	batErAL/hAFSnjDY8nvN3ofeBgbr4O8=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-mQ1t_V3oOqev3ok2Zy90qA-1; Mon, 03 Aug 2026 10:45:16 -0400
X-MC-Unique: mQ1t_V3oOqev3ok2Zy90qA-1
X-Mimecast-MFC-AGG-ID: mQ1t_V3oOqev3ok2Zy90qA_1785768315
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-7f5b54da461so57572717b3.3
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Aug 2026 07:45:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785768315; x=1786373115;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9iDCDZV2asWOBXoCVGWr+sD7YN8hRKRT86USyIoiPOU=;
        b=aYSvOwrlKkJx2+R81MXbDlidP+2Ha7SevuHIvxlcsWk+dXwJyQ9XrPa9BOHswfBdmM
         zr9eWQNG9KJ6zSZtKO1UiTS/3u51XsiDJLWeXin8hiwr9injZkC8NCXK/q5WlHSc3t8x
         36rpVq/T2IIVIc3o3EPozyxiWOlDCRd5bffkqMX8q/9Wle62IhEdPz/zQ/JCQoceqpUv
         2ZdrvyLNnqsRIGL+tXe/ykmzNv4QrjZD7gb6g5zPHytpWdD8UzQPtTAM66NBCk8Pozrt
         LQ75r8HOfIvzGDtUTR3yFBKQjdkfAGQvjR+iR4M4p+xPiJ9zhNDGH46e/f/e5tSzsTfk
         5WSA==
X-Forwarded-Encrypted: i=1; AHgh+RrmYgTFp/9HpddAuNlG2KkJoduNHs2vAzUzuVnO0ZlRDmmOZyqZvgNnkjEyoxY6NkFP4Y9zxsAkOCCQyRjA4A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyO3pgRR7Q2sW5MQ+I07+yFByRBAY9XvErTTgUU5LOs3X4pQ8uq
	6uagccFT8YpFfaBzsEQItmmLXKAgPLfBxt0nK32OA1VtTLPgOBXMZXXZsL6iTDs98G7wPXed/E/
	XI3OQrRcUC1w5AL45Son3rGsLW0lYI+SxGJaXpE0DY7n6Mi5cDYL3CbjY9rugytSVRx4Rjeza3A
	==
X-Gm-Gg: AR+sD13++hbCX8f3xKqe0FTm/NRhe9xvSyJ6Gq663IME43ppAFwdnee6anrUDuzfJwJ
	aqBvhvWNrKvVX3DU1oDCocVX1lHTkAQWtN5vY4RuIlClFP/3JMEc9jjk7ihdatzJI3zADtwslRu
	4j1yeWTeFk7IpK4vR+aOeb2Lq7vmBzxHKlmAJcsOXCfojVAH5brQdpuJgRbi1nNMAHM+cVmaKym
	Z51/WgZm8vwk90HYETMXU0yoEymAnc91I9ScqBMGSfDjpGnk59pr+sRq5Jnf5eLU0dMV/c2c2ki
	XLxl1dcxOwE4CurxtUlhl7mFUlnFd8cvt9Z120xErN+FNGpXsdf8FUDtPvtZbkkQcGGV8lhgB17
	IofI5F9YTnrhWXTTtZNhz4wz92YW+lBQGn3M=
X-Received: by 2002:a05:690c:338c:b0:81e:d23b:f8d1 with SMTP id 00721157ae682-81fd4bf5dbemr122417997b3.35.1785768315470;
        Mon, 03 Aug 2026 07:45:15 -0700 (PDT)
X-Received: by 2002:a05:690c:338c:b0:81e:d23b:f8d1 with SMTP id 00721157ae682-81fd4bf5dbemr122417297b3.35.1785768314956;
        Mon, 03 Aug 2026 07:45:14 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fccf841e1sm56661767b3.18.2026.08.03.07.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:45:14 -0700 (PDT)
Date: Mon, 3 Aug 2026 10:45:12 -0400
From: Brian Masney <bmasney@redhat.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH v5 14/25] clk: mediatek: pllfh: Add configurable clock
 ops to mtk_pllfh_data
Message-ID: <anCpeNMp6XQPLU4R@redhat.com>
References: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
 <20260801-mt8189-clocks-system-base-v5-14-ac4410697cc2@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20260801-mt8189-clocks-system-base-v5-14-ac4410697cc2@collabora.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: O7wa1ROfTzC8Cqtr055ujR22cuOfF_RBB9fr6fa1LKI_1785768315
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_154520_591816_DF2DA643 
X-CRM114-Status: GOOD (  12.90  )
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

On Sat, Aug 01, 2026 at 01:21:00PM +0200, Louis-Alexis Eyraud wrote:
> Currently, the mtk_clk_register_pllfh functions always registers the
> default PLL clock operation set (mtk_pllfh_ops). This does not allow
> use a custom one, for SoC such as MT8189, that needs different
> set with support for set/clr enable.
> 
> Add a new field for the ops to register in mtk_pllfh_data structure
> and use this new field to either register it when not null or the
> default ops otherwise.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


