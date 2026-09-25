Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0958CC9830D
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2026 13:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4/+dZ2Z79f3TnZjAcbASKi5bWyGm2AchTT4KVZyto8o=; b=g/iWH8C0AvSATPbRctfS/BayOy
	wB41Ebxqxn7//RToYS2L3CFXM9euUl2TznPb+Wh4vI/RsGAHeD9WUpyCVy7xwhUNQtMCpYDDwEg9F
	AozHRr3hS2Mp2KLEC37guXn0MN/ZhLdDUX8kksRX/dLDOGAXCe79LWGVpSupyyeEjQmYHhRqFv4Ax
	eOjCwWZhVS9VWzw0vIkGPBpUbbBbmvxC6uT50FHYSTZR7oGUG4QvVUCX+S1OeJ4rsxHUdHx72cTBh
	6jesu+/GDPmeFeDtaCTFFv3QCm1vx1TeB4qf5Hd6s27XUMKFUi6kWZ65bXvtQXnbkqj5PczXZXDRi
	SNXBj/Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA5jv-0000000DPMw-2xF2;
	Fri, 25 Sep 2026 13:13:23 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA5js-0000000DPLr-074w
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Sep 2026 13:13:22 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e7d2bb404so3189975e9.1
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Sep 2026 06:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790341998; x=1790946798; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4/+dZ2Z79f3TnZjAcbASKi5bWyGm2AchTT4KVZyto8o=;
        b=CQ+ECNjGB9PvBwXKluZRtwYAscX+EIoogcKn5S7501ND1wueZH4fgmMaHE/HpWeCmT
         c+NK8Ce4TG7tuFZZbe6LrDcvxb8lmYbO6xPwq6ivBAcnRI7CpMk7HaYACZt4LB3txr8n
         D8cNZ/T3Ma+15QHKarvTnybidKtzZpzLPBFIpdC1gOv+BVeU4QqAzXenxVeOwlAS0yz+
         B/4/M1ztpu0JfpA8tSKioI7lMFVmqp8SvMxsnjWXOlIdu8plvNnXrujcgQNnXyuCRmte
         8chaNNd4k4fc2Fin6XiAIxusEt21P80U5V4iPC+QnV1i3NSnWST1Ed0mllHvux+XXksK
         SXHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790341998; x=1790946798;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4/+dZ2Z79f3TnZjAcbASKi5bWyGm2AchTT4KVZyto8o=;
        b=AZq0XlyHvHZvdPtaeupiXFKCcQ3TSsoEzUSeyA1UaHpPTvrSLhScQBhkiXd+rpPR9K
         ocEexkhRtgrYPcqVEcFsMUvF3y1DFiGGH3TBBc401x9xEpMStxy7GrLGzmxmu3NtKoNi
         zETW2b3gocLa5d0vnwIkCN5digNc1qVbsiqxmxS3n5yjQF7eLhdipggbUjBedzEFUNP7
         9K1PoaxEDVuuCZZPYP5ga+MmxHawXyZSkDqLiVWUgkZnpjf5I9JlUizizb1wduquxTPW
         DmUdqjMJ7dNE5M+ZyxQi3egTw6/dHDNxKQ8iLSKPKSAXB0DRYjT9fnmufTcgAwH1j+dA
         Xj8Q==
X-Forwarded-Encrypted: i=1; AKwUvBy1rzjfIlL5nsb18VkJ6Kj6kFlj0KB9csEBFFia77uWc7OMNfMY582moFtU7ccZb1dftK3Rjf2VTgoU03qUkg==@lists.infradead.org
X-Gm-Message-State: AFuF++kKYky2ap6YzCh+habMQQ0mdd8neQaHwSJHgaia1Y8hjeT9E5b9
	9qAaEB0Y4l25JTJwSCjHe61KsHwnTAbeRR3jQlmD8n7HacuVu+r+CxFJzpbHF2CFHU8=
X-Gm-Gg: AYBFou3bdCSDQfd2SyzGqhk40Mop7elnUeuLMJjdg2iFI3bKsmQUNIkY2Fyh9caXerM
	wEL8VGaC2bBiGV+cMf9yPE8jiuBgHegrpaAhpXM0lDYyuXlxezATfFRmGDl/3Oksitm8cbawqUE
	soQ+gb3nFKcMykYdqNAEC78R2N9wDk3DU4TqqfWAqTSf24aNslJ/tMslBO0fkiAwEw6iH1X8VLz
	5gg663EJqqL7/H2rBG3O/zS2ZKdHHo/EpszkJT+sIx5/iX0flX/opL/wnO3Jnfmaqfjg5Cjvz1h
	rGSAUB/QoCOF2vjYRSFoDzC0GKn2+z6afo9aqk52+6sW2d9uQ6LJzJr6HDGTl1wUEKtWVhSJo4B
	CYrA7kwBOUwk3Cb0FU2fNkRUxdoCj8bYpNHkjv0dAwY2xS1hLM7/14+dvSZhpUN2xwhcRtpj0h8
	1ps4KMo39xxryNFnRG/AUoQ/5heYZQ3espUhNt+doC7orcdR9Jg9UOUQcwK9ihEzh80Jsxxu7It
	v4zKSMEYJb7oGPwqQ==
X-Received: by 2002:a05:600c:4e53:b0:49c:e37e:4389 with SMTP id 5b1f17b1804b1-49fe66c8288mr99559755e9.4.1790341998059;
        Fri, 25 Sep 2026 06:13:18 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fedec53c4sm86924765e9.4.2026.09.25.06.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 06:13:11 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ryan Brue <ryanbrue.dev@gmail.com>, Stephen Boyd <sboyd@kernel.org>, Brian
 Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chen-Yu Tsai
 <wenst@chromium.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/2] clk: mediatek: mt6795: fix the FHCTL DDS mask width
In-Reply-To: <88272aca-2a9e-4a75-b7f2-4f7aac8b6d18@collabora.com>
References: <20260912-mt8173-fix-dds-mask-width-v1-0-3d0c0292c85c@gmail.com>
 <20260912-mt8173-fix-dds-mask-width-v1-2-3d0c0292c85c@gmail.com>
 <88272aca-2a9e-4a75-b7f2-4f7aac8b6d18@collabora.com>
Date: Fri, 25 Sep 2026 15:13:00 +0200
Message-ID: <1j33ux8of7.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_061320_409142_BEB3B3FE 
X-CRM114-Status: GOOD (  10.32  )
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

On lun. 14 sept. 2026 at 10:16, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> wrote:

> On 9/12/26 08:40, Ryan Brue wrote:
>> All eight PLLs in mt6795's pllfhs[] have pcwbits = 21, so the FHCTL DDS
>> field is bits 20:0, but _FH() declares .dds_mask = GENMASK(21, 0). As on
>> MT8173, new_dds from mtk_pll_calc_values() is always 21-bit, so admitting
>> bit 21 of FHCTL_MON into the poll in hopping_hw_flow() can only make it
>> time out. The same mask feeds the CON1 write-back and fhctl_set_ssc_regs().
>> 
>> Unlike MT8173 this path has a user: mt6795-sony-xperia-m5.dts switches
>> FHCTL on for mainpll, mpll and msdcpll, with SSC.
>> 
>> Found by inspection while fixing MT8173. I have no MT6795 hardware, so
>> this one is untested.
>> 
>> Fixes: f222a1baec5f ("clk: mediatek: mt6795: Add support for frequency hopping through FHCTL")
>> Assisted-by: LLM
>> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Hey Angelo,

Will you collect the MTK changes yourself and send us a PR or should
we collect the changes you've reviewed for this cycle ?

Cheers

>

-- 
Jerome

