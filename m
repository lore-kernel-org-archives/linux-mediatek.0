Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DEA5C636CC
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Feb 2023 13:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=klEHywzBnxVVUQAxOzIU/F/i+rPecpVvjCm8iDoCucA=; b=fmt/EvH2zu8zRZIfOAMEJ1PvmM
	MrOV6IcAFr7GuCqdWLMRwxyUq5gmYGm3DkPB71CZ57s6dCC7/5kTtGG8/iOKXF5brJY7scMHW/h2N
	lmsWKPRowOQkfyXLNdqKg8pE4E3/dDFOJEj1nV16Uc7QdeJMmQOIzLpcu3nat21z1fgoxIegsr9zu
	ql0Czi9ED09aFNj3TFqQowz68f9Gfki4AtcgH3eUVaYft/zXaqWj1Ir/awdzwUQ50sV/b5/g5fRHx
	wmBjkTzc0vRNpigkvoClVFlKROvXRj+5Okql3hNHbqEcYipsPpSXAO6OWfGTspVJI4BiE7B23UAhP
	Ho6dK+1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPkFW-00Fho7-9F; Wed, 08 Feb 2023 13:12:34 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPkFI-00FhiW-3Q; Wed, 08 Feb 2023 13:12:23 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 670BB660209D;
	Wed,  8 Feb 2023 13:12:12 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675861933;
	bh=UOCZJc3cdFQz7WthuBqxrwG8dtBB60ZKl7NVR8Pqvfo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kyU+9mQdEod0ItgZqYe2WGyoUkGROJ+uKVETSfQgPaNxgTuPD9jNVuf+b/4DU+Xbg
	 isKqJj80vNFveMnyV74RA48dg2zUazykij7yww34rdUwhpTwvuboAzhVdUEaPHa8HM
	 K+se12Gcx4BL5Pebq6kHLh+hBvacCeGvLfnfXZ4hNEk442X/gFWBeLK+nw8Re/PliP
	 /ncMNzw7q9IlUQrFaWIYlrg+3lp8d54W8XbwIDI+ZEo8myUvxDTcIqq8Tt9n0OrcG7
	 1sXaFrD0dy1RHdbgcj8M6bGGAwUJYRhXg9WYCkxSkEKF21c9o/xxxh42ON70sHnkVe
	 9kO9odKEySRkQ==
Message-ID: <3b421ab5-9b97-4f50-f65e-471a6d09f568@collabora.com>
Date: Wed, 8 Feb 2023 14:12:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] cpufreq: Make cpufreq_unregister_driver() return void
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 iresh Kumar <viresh.kumar@linaro.org>
Cc: Markus Mayer <mmayer@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Kevin Hilman <khilman@kernel.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 kernel@pengutronix.de
References: <20230207195909.474953-1-u.kleine-koenig@pengutronix.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230207195909.474953-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_051220_311464_EC34FE12 
X-CRM114-Status: GOOD (  12.17  )
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

Il 07/02/23 20:59, Uwe Kleine-König ha scritto:
> All but a few drivers ignore the return value of
> cpufreq_unregister_driver(). Those few that don't only call it after
> cpufreq_register_driver() succeeded, in which case the call doesn't
> fail.
> 
> Make the function return no value and add a WARN_ON for the case that
> the function is called in an invalid situation (i.e. without a previous
> successful call to cpufreq_register_driver()).
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

For MTK and generic part:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



