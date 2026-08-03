Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC52C55179
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2026 14:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=76NPEec58Tb1M0PywXo7lghUl4mVI11dXUa8hA9GYgI=; b=D2/h533kFT/F4vNx/0c7AmlyQ0
	fr+4XW23slpUyY9wNNQHxRRcbFhZjc6EH/s/Snf4dk7t0jOMou6PfTwX5nkZtkz15p/GmWeBCHMtw
	cOp3zh/uI8e62t3zevHu4lSbtUb8OAAGLHA8IeK9v8SZTgl8MgVpzgThpyWv1CUFiOqen5kMnEUmr
	zBVlTRTMcCgWaIfhqVKK3bFbY56AObKuMSZHkhFqJ1adheAEb/S7QP31/KM+412A9seF4/sqLObWq
	bhJ/JOtP4dhtxkh1+BhqCxwiIHDW2qmWy6grq1/o3BJcrmFu3vafayXWEk2yanu0ZgjqjOcDRw5co
	gjDhRiPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtj6-0000000HOkB-0vEh;
	Mon, 03 Aug 2026 14:33:12 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtj3-0000000HOjP-1pIW
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Aug 2026 14:33:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785767588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=76NPEec58Tb1M0PywXo7lghUl4mVI11dXUa8hA9GYgI=;
	b=ciqkMT7mqo7c2nbW8brcgnCK9b13fKhlHLdZKzK76qIQuGlsdspp+kKLtjOxboPyS+Fe8J
	H3hX7EJcsYx3re3B3x1fPNU+ha5VkBsErsBRmccgfuRntNYQTxr5p3GYaVPtURXU5Jijr7
	aWmy/za90JCAfX51CYwmM0LUm7YWSHE=
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com
 [74.125.224.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-167-mxdDn7GvNNmF9-7Ry8ar2A-1; Mon, 03 Aug 2026 10:32:51 -0400
X-MC-Unique: mxdDn7GvNNmF9-7Ry8ar2A-1
X-Mimecast-MFC-AGG-ID: mxdDn7GvNNmF9-7Ry8ar2A_1785767571
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-66964c24996so5161666d50.3
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Aug 2026 07:32:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785767570; x=1786372370;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=76NPEec58Tb1M0PywXo7lghUl4mVI11dXUa8hA9GYgI=;
        b=fseE8CqlSpc9e3tFCqhzx13Br+ILcvrKTVuFino/4rv1gIilqtS+Ok7LIxwoi7UQ2M
         nuBdfdtq9E1GqC08bRLmKVpCR2kPpjM9EtQ3uULLoYUf7zCVTPKcvu7EwGjmUiyf20g/
         l67kN5xPqkGwhxsQjX3emUUJF4F62prlq1WdEnaGCeeosFQjeluOcgcMJD51RswrUaFf
         QUfXozP8IAr61IxaV9uZsxxfipTHkEC+cWAM/pc3AxxpSqr4j6lBAWLVI28FpUTYnLMn
         N8nftTDNVT6f6J8pnO+xYk9e15s0m66lBt988/pI3RUSH59iNhe5RnLuSRYGakJKSDP0
         uPNQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr2IgPu11PAOzTJJbn1kbvbLvF4mEhcw5Xqw9aa9gI59q0Q8JUN9Whqp3ON/R/FcOhAK3oDYhrVtUj+ZeDSqw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8p53BI8tEZD1hZmrD9RoG37qoJx/XvHerl2lSOcscwh15JZ1t
	wLd+8ETnsF+pREM7lNVCmClcnKuJCspPONNpyb2qje4VlXkhIUgjT4N9LKSbKdTAOT1h8RPooV/
	iy59x7nSDaM0sJc+XTb4lBgz2pSasJ3zhT40NK9wfodBLmxvZSNkmZH/FM3wtqKK7kBJIWKpH0w
	==
X-Gm-Gg: AR+sD11rj+1jOgTVrM78bp5r5aMhp7sOl8GvcC/vkAreHojdEWBSmRMUyVPTLudVesP
	26WD13jRSqytqtLdEfuQpKLbSCRWD3gZ+mD8UJ1oVfuRRjTo3yCedTMsvqox6d1WpUqoIOkq4y+
	gBLz57ckRr1zR0AH8GtzVRxg+lH9nabjszQbVJGGY5wGn2d+yf+jYS7de9DiR792J/d7woJytf2
	rPHxNxOgZFpLmjxKLZeZsf9x31n9Y6YQB7ZBZ00rFZrMszqBEL+QOKUqqZ9csTIhK3IIIa3Dtri
	qpvkeIdZcHoLPOJAgXKwr4UgGPg8lQLDMho7/QC0JNhaoQAle4Cupn4qbc2Kg0U2B3vETAognJz
	KHDgnS1JrI4FbzyToR4ikJ8Rey0LliqsuVDM=
X-Received: by 2002:a05:690e:43c2:b0:666:2274:f9f5 with SMTP id 956f58d0204a3-6694f1d38e2mr8779913d50.37.1785767570617;
        Mon, 03 Aug 2026 07:32:50 -0700 (PDT)
X-Received: by 2002:a05:690e:43c2:b0:666:2274:f9f5 with SMTP id 956f58d0204a3-6694f1d38e2mr8779869d50.37.1785767570090;
        Mon, 03 Aug 2026 07:32:50 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66948ffb54bsm5747947d50.17.2026.08.03.07.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:32:49 -0700 (PDT)
Date: Mon, 3 Aug 2026 10:32:46 -0400
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
Subject: Re: [PATCH v5 09/25] clk: mediatek: Harmonize mtk_pll_fenc related
 symbol names
Message-ID: <anCmjnAVH1MRkNUS@redhat.com>
References: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
 <20260801-mt8189-clocks-system-base-v5-9-ac4410697cc2@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20260801-mt8189-clocks-system-base-v5-9-ac4410697cc2@collabora.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9b6aM94v2N-u0E6I0aF1EOtWAz-sEWqi_-EwNmBGsfk_1785767571
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_073309_567471_62EDC0FE 
X-CRM114-Status: GOOD (  10.37  )
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

On Sat, Aug 01, 2026 at 01:20:55PM +0200, Louis-Alexis Eyraud wrote:
> To prepare for the new clock ops set addition, with support for set/clr
> enable logic only, rename mtk_pll_fenc_setclr_ops and its callback names
> to harmonize the naming with the same suffix.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


