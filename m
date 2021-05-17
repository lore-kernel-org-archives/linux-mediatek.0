Return-Path: <SRS0=4pGO=KM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B50CAC433B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 May 2021 08:19:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CA02610A1
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 May 2021 08:19:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CA02610A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZmB5Ma7VWNgOgBvtrToOeoknfz5fnlVwbxE306TgGGA=; b=UDLBHs5iggfQ9CTwmiWFJDZ4M
	SvKTveArvZIuG/6MU6J699oGX9iV2UYwJXEjuwwM8tfisV4r8Wf3qWLpTj2k1DtIuAr3zoqHL8dLq
	UaM9NTLvWbcf6NFO8p5BRvS/swD6VxY8EbbLU/WIEtVxmN91qMEgFz380o/+ToRRu82iGE1DnEoEb
	fWME+Mu3E8zo11RdcSO+5CCXjFznhltTmLcPl5ueLUqnDbfsXZA+E5jF7Fj5sgYdfdYWyAcPyhYcj
	052dimu3iNLMpiCWybrAt0Ekqnj9N3Zy/MrT5t0ai5v+l/biKAOqz1NEQHWAOCCaW/ub4DewW9Ke7
	WlTL3mSFA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1liYT7-00ECg6-JD; Mon, 17 May 2021 08:19:17 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liYHN-00EAMu-Ve; Mon, 17 May 2021 08:07:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=zLyMCemFhgBqwL7usnjoYVnjjOx47JZAGAfTiTk0jK0=; b=W6VE8eAuwD4CvCdsa9Ig3iyb/6
 6zL21QgnnNovA2HtfpHSk+WXXcym/l1MiomOyErPH7o+yCEW4iGhWEgOHtNUCx3+36tV31AR8xFOz
 NSWNamCHKMfp77MX5YWcnxEPxcE+nXXUy2K2IVDKDF479Z221DVCK/rZ2AfoRnhLHBkEo1x1+YUU3
 LQ6UOay6eoUrVbdLXHydOl4sbKFVch54KTl6k9u4mO+FBfkbcZxPeKxTDIJGGpItK4bpeT6zfReR0
 2bjUvKznXv0sP1gEvA13iCH1pyJms7cwVxBW+KP4VO8s9Ef0LZUS+G4STB7zeSH3a3fyuhEPaFsdg
 3ZProfig==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liYHI-00DZr0-GO; Mon, 17 May 2021 08:07:08 +0000
X-UUID: 885cf9712d714dd3abe67dadca2e7a48-20210517
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=zLyMCemFhgBqwL7usnjoYVnjjOx47JZAGAfTiTk0jK0=; 
 b=psCxGPqpqOzkAfdtwOkYznbslWDrNMU7GUj+x0fm7PPH8QEoRYeBWFPQE2Fw3Zijxqbs6SojQLvKEAgMovxAxGz2SeotV6Njo5fZ5vN1ZUHNERvMYiYdOtTCr/tGc96vq2RdEU3+BUEsf1PY2cFbY+9HT3FVd6PcA6cfLplDUD8=;
X-UUID: 885cf9712d714dd3abe67dadca2e7a48-20210517
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <qii.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 896944106; Mon, 17 May 2021 01:06:59 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 17 May 2021 01:06:58 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs07n2.mediatek.inc
 (172.21.101.141) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 17 May 2021 16:06:56 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 17 May 2021 16:06:53 +0800
Message-ID: <1621238813.24305.5.camel@mhfsdcap03>
Subject: Re: [PATCH v21 3/5] i2c: mediatek: mt65xx: add optional vbus-supply
From: Qii Wang <qii.wang@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
CC: Wolfram Sang <wsa@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Bartosz Golaszewski
 <bgolaszewski@baylibre.com>, <linux-i2c@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, Mark Brown <broonie@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, Bibby Hsieh
 <bibby.hsieh@mediatek.com>, Arnd Bergmann <arnd@arndb.de>
Date: Mon, 17 May 2021 16:06:53 +0800
In-Reply-To: <20210507131406.2224177-4-hsinyi@chromium.org>
References: <20210507131406.2224177-1-hsinyi@chromium.org>
 <20210507131406.2224177-4-hsinyi@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_010704_572471_78E952E0 
X-CRM114-Status: GOOD (  16.58  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2021-05-07 at 21:14 +0800, Hsin-Yi Wang wrote:
> Add vbus-supply which provides power to SCL/SDA. Pass this regulator
> into core so it can be turned on/off for low power mode support.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>

Reviewed-by: Qii Wang <qii.wang@mediatek.com>

> ---
>  drivers/i2c/busses/i2c-mt65xx.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> index 5ddfa4e56ee2..22d1d14b5de5 100644
> --- a/drivers/i2c/busses/i2c-mt65xx.c
> +++ b/drivers/i2c/busses/i2c-mt65xx.c
> @@ -1220,6 +1220,13 @@ static int mtk_i2c_probe(struct platform_device *pdev)
>  	i2c->adap.quirks = i2c->dev_comp->quirks;
>  	i2c->adap.timeout = 2 * HZ;
>  	i2c->adap.retries = 1;
> +	i2c->adap.bus_regulator = devm_regulator_get_optional(&pdev->dev, "vbus");
> +	if (IS_ERR(i2c->adap.bus_regulator)) {
> +		if (PTR_ERR(i2c->adap.bus_regulator) == -ENODEV)
> +			i2c->adap.bus_regulator = NULL;
> +		else
> +			return PTR_ERR(i2c->adap.bus_regulator);
> +	}
>  
>  	ret = mtk_i2c_parse_dt(pdev->dev.of_node, i2c);
>  	if (ret)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
