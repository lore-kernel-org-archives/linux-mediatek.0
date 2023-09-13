Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2530ACA550A
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Sep 2023 08:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mkYAbSu2k+Vyp/8YqOuefbDzyjNnzvWYzTU2vfrUlK0=; b=LIwmhkBsvTOnkuVLxNvtMpvPO3
	4oldy/liar/1JkLesIEkNRFAj0csoWAEntlGmnfy3Lg/hr6A/lGbjxb89EZN82GfcK109xrmomkLA
	ee0PBarQINBAO1ZVFL9+RCZrEmmkjYzkD1yj36ue1HxvS4vXVv6wTYccccis7kZQRvMmx9B48uMnG
	G3TaHXgTb6CPDSFY273zd3uIx2cIdqomyy1aJXl7bYb+p8Wv7nnug273zsNkKlUWnKeEiZ3pNIxhS
	q1tQirdICuxGaOVr1eG37GMkywN9naOlO9Ro2RpsItqP0v9Yx3sJaOV9xLb3STqLaUK6ZdMkukCEX
	ElDXjvbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgLfp-005D7n-0Z;
	Wed, 13 Sep 2023 08:56:37 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgLfl-005D5q-1I;
	Wed, 13 Sep 2023 08:56:34 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 19615660732D;
	Wed, 13 Sep 2023 09:56:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694595391;
	bh=4WEW4sE4W55SdLAsrbeCF5RvjuVtlRYZ91ql16VShi8=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=PHHZQAkWynt0GuhQR/x2vdlGHd7neJc1IRDfypD29guIPvvU/CsXWLCjQ0GWtTpmI
	 Ot6U+FgTGDSWuLhtJmh2TQWovVJQrbV252FvmHigtvJjv3yHaJyHVrgtX+T7aekVVb
	 NxU/CZG5gh8tlyhvcffZXES/T0xieLW3vok+JOXT8vdFKzvHtvqObxlDu7ILJnjXah
	 ID6AnlqzFTFxK2Gkb7E6hsdAQhD4HRscuYpkmK55p+JoRM8ZLm7sp+CwLnvpOHZoes
	 EqjszUx1Bo8f42H/7/8hw3SqK4wTDRyjYm6BpITeUhifA99fcXkQ5d9K/9rqv3lclM
	 dK/izhwwcWIdA==
Message-ID: <85f67bf0-469f-b379-7611-ab52c2a07778@collabora.com>
Date: Wed, 13 Sep 2023 10:56:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH -next 1/2] iio: adc: mt6577_auxadc: Simplify with
 dev_err_probe()
Content-Language: en-US
To: Jinjie Ruan <ruanjinjie@huawei.com>, jic23@kernel.org, lars@metafoo.de,
 matthias.bgg@gmail.com, linux-iio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230826035402.3512033-1-ruanjinjie@huawei.com>
 <20230826035402.3512033-2-ruanjinjie@huawei.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230826035402.3512033-2-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_015633_593674_8E1B1C4E 
X-CRM114-Status: UNSURE (   7.55  )
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

Il 26/08/23 05:54, Jinjie Ruan ha scritto:
> Use the dev_err_probe() helper to simplify error handling during probe.
> This also handle scenario, when EDEFER is returned and useless error
> is printed.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Suggested-by: Jonathan Cameron <jic23@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



