Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22267C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jun 2022 22:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8/weqrWLdTCxYp+xRg9dVyfKZZLo+VyTWNnyjrQ9VzQ=; b=EtA+3w8Tzn804Z9jUT5yANybUY
	iC1CryF9XfdjHMdO9XT73XneHcUVqxWPyTnItbNWmrEIQZz+zs9Ji9TrTKwU0ws1x8VVEKM4m1A6a
	BgMpO0OOW5rrCWYeSf4vl/hbeiEJrZaKbuKjUuAnWJNZU9isAk/HyXRKSTSOvi4TJMLUhNyTA2/zf
	3wkEE4oQhJ9bd+K4gn+22KoSBrg/1CDMEyFDIury7Vk44wevL/0luK2jtu5AN/IrR3OeRJB0Sq3iE
	Uyguyjicr/GeBpMJr2Zym5FnHhKoVIMGIBoBauuyTjZ8GsmEcdnZbNIoydpYyCjufLg0HpyV7tjZe
	i02h0/fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1bVH-00GgdG-Px; Wed, 15 Jun 2022 22:28:47 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1bV6-00GgaT-RV
	for linux-mediatek@lists.infradead.org; Wed, 15 Jun 2022 22:28:38 +0000
Received: by mail-pg1-x534.google.com with SMTP id 31so11002943pgv.11
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Jun 2022 15:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=8/weqrWLdTCxYp+xRg9dVyfKZZLo+VyTWNnyjrQ9VzQ=;
        b=DNfSC2OQC20pNMiFXxu7jTPTLrLEPeQrh+SAy/0Q1mA77E3PnvWxQmtQP8/jvU5Py2
         Gi/3Tx0sxP6kVTRl38ygQTvgij8+U23PmlJFqmCUJJHrq9Hz1dib1PFqsPxebZU+YYOv
         3AaV84lbm1RzqTxtGuBNS93KelCn0Kd3xlXw43QrL+6P3tcwCaKstH6FYrmP5IY/jVVw
         KaXxmqm1qExb+ivFCF8ewVJsGJXEeQ+SDcZcqfABuGojOZGy0kEBFUDtp7fucIWSLdQj
         2LIIgjzAPAgH2vgoygfHlk1Zb3CHnOd2jY97tjT9wfqj+mCfX1Gh/qM/TfhH3Q+bcn+K
         2lmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=8/weqrWLdTCxYp+xRg9dVyfKZZLo+VyTWNnyjrQ9VzQ=;
        b=FAkP6yW9nnw6gNO+3QW/ECMuHuOMrwQqzumy8UkVFMqdGTeQQYTxgfXz7vtEnIVdmr
         61Q/MLqZCJ6lSk5/SJMuWh7LA/24Pj08wRwXSCNZ6fwvQvlpVbzZ4t/IIbDHWIntyiEh
         CLtRCaxm5bNQZ8QPD7GhcDUSp15AQVwhCiexMEUJ50u3t0OhrahqowwVmX3ycjBqx3p4
         AbixvezVYP+nWZY8GdKlOSNwsBgFqhWeiGZaQKMJW4+MCStLP1EQ5ztjAUTEQdVOhrce
         TW4oLeqzW20wHwWA2FlMqsVCNZJxPoWVr7iZP0R847FtS3Iiafxv5yRNf6HAMpNAinLg
         Z9ZA==
X-Gm-Message-State: AJIora/Q6P58lS2dEmvs3Iw2omyT4F1T8rHF67Vhp6DqsJNAwjtHyhBe
	DKLB4DgSVup1HFLodSKQ3ehBZQ==
X-Google-Smtp-Source: AGRyM1sOMaKdIw9hmLLTrY/C7UCLm3+pdaat8cUZjTXdT1K47ax0eQQnPwBc9fefe8un8iuDBsUjhg==
X-Received: by 2002:a05:6a00:4504:b0:51b:f04e:a130 with SMTP id cw4-20020a056a00450400b0051bf04ea130mr1806302pfb.52.1655332113127;
        Wed, 15 Jun 2022 15:28:33 -0700 (PDT)
Received: from google.com ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id g18-20020a170902d1d200b0016782c55790sm117330plb.232.2022.06.15.15.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 15:28:32 -0700 (PDT)
Date: Wed, 15 Jun 2022 23:28:29 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Daisuke Nojiri <dnojiri@chromium.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	"Dustin L. Howett" <dustin@howett.net>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Prashant Malani <pmalani@chromium.org>,
	Enric Balletbo i Serra <enric.balletbo@collabora.com>,
	Brian Norris <briannorris@chromium.org>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	weishunc@google.com
Subject: Re: [PATCH v1 15/15] mfd: cros_ec: Add SCP core 1 as a new CrOS EC
 MCU
Message-ID: <YqpdDeD5DA5byI0B@google.com>
References: <20220601112201.15510-1-tinghan.shen@mediatek.com>
 <20220601112201.15510-16-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220601112201.15510-16-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_152836_955960_9C07DA88 
X-CRM114-Status: GOOD (  10.51  )
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

On Wed, 01 Jun 2022, Tinghan Shen wrote:

> MT8195 System Companion Processors(SCP) is a dual-core RISC-V MCU.
> Add a new cros feature id to represent the SCP 2nd core.
> 
> The 1st core is referred to as 'core 0', and the 2nd core is referred
> to as 'core 1'.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  drivers/mfd/cros_ec_dev.c                      | 5 +++++
>  include/linux/platform_data/cros_ec_commands.h | 2 ++
>  include/linux/platform_data/cros_ec_proto.h    | 1 +
>  3 files changed, 8 insertions(+)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog

