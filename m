Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B8E0C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jan 2022 11:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BSUKPhZHzKrT4u0gzwPEv+zWu6gvCM8z9v+RGGRDGCo=; b=XszZ1zRBpvViWqMwIfMvk55EwI
	deMjnYAO1relOE4bGYWG2kkziF7ozHNa4wj9+vdV4lT9rW9ju6vlBjPTLvcUGV1LAhXwI4hUZ/L1o
	r6Kh8L6obnfxg6ar+dUzaROHV03gXX+njmDMXXwyjcCwUS5iyYEYrmxk9RUy0ksh4+3Dr3dyNb8Fx
	rG+LH6Nkp6Z5ME85U+rxBQkxAilK3W39WdhFqPi7mqohUM6VG/CMfsxNhvwv+TgjUlhir0C3yJmZP
	dl64GlhcsxElJfP9b+kemm17UJgeYpil6fxBjlRJPMPUHEn1cDkliSqFUXZJR4Fjp6oWSODlbeKVe
	gzm0/wGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4hYY-00BEfs-W0; Tue, 04 Jan 2022 11:00:43 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4hYN-00BEdl-Ch; Tue, 04 Jan 2022 11:00:32 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 243C11F42FCC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641294029;
 bh=juylbfZmAjF6gpbipCeMx9kVpup2ivKUb1IhlYABCOQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ccrTjfAv6ZJuQeCwHm5IXXzz0Ew5v4e0mHY+mIX6jx6G+AufJvcz5kdjH2xQRyJbs
 ah82SvukeNZGrjE3doovW6i38jQLuBdTQRXlmK8Jqo2q6uobpI2Q99L0VbPd9pj3mr
 g2bkogmOgRcwDkmyyeoj0Lof7EkY4Ia3sjA+O9UG2kM9t5X9V0irLHll0K72tWBADk
 kPDwHAeRJlU12b1v206JTsRSeWK3/JVdaWiEe/siMbJ+9GCY3KXVKhaipSp56ypy5i
 hw8fpIe4i8tPEc3TfOIp0tpdERbSygM6OoCt7P4iCuvzZgDAinr9NZ07qZxOkRCEFG
 Ay/6TVByKjhMQ==
Subject: Re: [PATCH RFC 03/13] mmc: mtk-sd: fix deferred probing
To: Sergey Shtylyov <s.shtylyov@omp.ru>, Ulf Hansson
 <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org
Cc: Chaotian Jing <chaotian.jing@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20211223171202.8224-1-s.shtylyov@omp.ru>
 <20211223171202.8224-4-s.shtylyov@omp.ru>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <669ea14c-d6e7-ebaa-891d-ad30b82dae49@collabora.com>
Date: Tue, 4 Jan 2022 12:00:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211223171202.8224-4-s.shtylyov@omp.ru>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_030031_637213_C94DE487 
X-CRM114-Status: GOOD (  19.68  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 23/12/21 18:11, Sergey Shtylyov ha scritto:
> The driver overrides the error codes returned by platform_get_irq() to
> -EINVAL, so if it returns -EPROBE_DEFER, the driver will fail the probe
> permanently instead of the deferred probing. Switch to propagating the
> error codes upstream.
> 
> Fixes: 208489032bdd ("mmc: mediatek: Add Mediatek MMC driver")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/mmc/host/mtk-sd.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 632775217d35..4bd070a458e9 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -2590,7 +2590,7 @@ static int msdc_drv_probe(struct platform_device *pdev)
>   
>   	host->irq = platform_get_irq(pdev, 0);
>   	if (host->irq < 0) {
> -		ret = -EINVAL;
> +		ret = host->irq;
>   		goto host_free;
>   	}
>   
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
