Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D950FCD1284
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Apr 2024 11:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jAFRLXZ9U/FNGFbepdKwa+Vm0lQjWltk+pR/FkrWDUg=; b=UVWZVadt7oSG4CyEgoQwRCw/vz
	ZDj1x7ETv/YTcxRmnUMZfb2Y8Hy+3sr+JdfdGHt3Bx9wfWmbpSMLYLePEnd3tXtJR0RSiC0kyGD+O
	TUaf0nen8UjLj8K+Ihfy/9N1gSVZsvrdn1i1b6pj/gXrjA1gaJA3teC6m60K+VFkgBbJW7kxLmcHp
	YUA0Tkq1PffiZn31IAl0oFEBPDkNbQ2Sko7cAPGg+JfA4Do8ZFJmsy0NTeheyodVxYJTJJ+aT8hka
	CVc5mDNo5R6mG0z91XkFmrbzHCQJW1Ug7zb8kJIDmJ21XtDD+zZyx8likf4KYbS0Sl1hOkcOVsyf2
	oMss1beQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrc9i-0000000AqIP-1tdR;
	Tue, 02 Apr 2024 11:18:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrb36-0000000AZUp-1lr7;
	Tue, 02 Apr 2024 10:07:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=jAFRLXZ9U/FNGFbepdKwa+Vm0lQjWltk+pR/FkrWDUg=; b=BEBLutIZHVp+5QlfNxu0H/10MS
	0Iq1C66XHQLXpw5r4X3goe7LX1+W5yiS1zkYPweTCIATG8I1Ol5t1rOWxm4Kckxz5d8z+uwG1wqpY
	csTVUT0OQqWkGrKPN9A1r2/gePDflG/Bf8JZK2a/Dqrd2uoCsJgexhTho0lfXAO1lEm+ytNk8dxui
	jl6ai3O/0rvEfOCSL5qxII8nuua2A+wSb/op660Qk1hVxhsqRqMJ7oOnAPbjTepvPrFI9jEO/7E59
	8n0kFl8rApLXAeQUu4ZZMCJ12pXzk1f5HeM0Ejy4W3oQ2eteoxzLGX9haP/ByBe9OL8rTjEYo13gv
	0v69VEUw==;
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrb2w-00000003Xzy-42Wo;
	Tue, 02 Apr 2024 10:07:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712052429;
	bh=k7uSL7rD78kbpZ93B360CvxyeepNDwKB6sm5+q46zMQ=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=fGRRghoqSOpQK/+xrlyxkH/kM1jDxzL7k7wClqL2MjXLGF274xgbCPBesHeXAosO5
	 LKkEyvrhEUS4eQmUqljuDSBssqFfPvsWErgLPnWPWLUSy9u1eoxwEc4DL+pmpRo7ID
	 ia5X8vO2ywsjwwBr/y/5fEiDq8QwEmcXjrrb11fArXTy2XKwfFrjhO2+q9ZDLHdAb0
	 Y+g0uxW8qe0+5AgiOlu7h3j42GOfGfsD78/k1JFTN3mxZ4Z6GFymlbnNexxokWZARW
	 aBuUJ3EqqbDUElPE5D7hfDynueLgpxhy31x++AVpd4yLiVVS4WFJX0MyNC5jUzAfza
	 6PQqWKnblowWg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2B13737820EF;
	Tue,  2 Apr 2024 10:07:09 +0000 (UTC)
Message-ID: <ccf74cbb-a487-4392-9b2e-35c0d007ba79@collabora.com>
Date: Tue, 2 Apr 2024 12:07:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pmdomain: mediatek: scpsys: drop driver owner assignment
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240330211036.100956-1-krzysztof.kozlowski@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240330211036.100956-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_110715_415127_ED53087D 
X-CRM114-Status: UNSURE (   5.75  )
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

Il 30/03/24 22:10, Krzysztof Kozlowski ha scritto:
> Core in platform_driver_register() already sets the .owner, so driver
> does not need to.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



