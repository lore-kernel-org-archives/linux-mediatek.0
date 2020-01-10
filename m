Return-Path: <SRS0=J4iI=27=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A0ADC32771
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jan 2020 01:16:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD9172075D
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jan 2020 01:16:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rU9y2HB4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dqv1bN75"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD9172075D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wnHaOdzjnfKMEvnL2NSGBC8xzJtjV/89B70X2pHckkc=; b=rU9y2HB4DUpoa6
	Wgevha4qQZItSMy/vYt5qmhd3XFiBodVH/26TsU3nN4ZHuqUti3nq9qEcvR6T55xuqF7xRil15l8J
	USpCYGhfmeV8Yvqh9a/hysTPznjQfDDaBp9w98z+23MInB8tR3ZQIlsP69N7h//qV5CQ9G5fkEuwq
	ydPL4ln5m6bOTQftN7LcfEZvd6tL289UZGDKFhNHqMicBc8P6e6svEg/5LIYTyD0bJFxDxKuwQWG1
	1xt+BKrgn1pM1KYc/vqNYn9ShQrsVQthNlw/sdDIM0I0SZNbjDpttswdRl0uZRhejMqssKwFLme+X
	Qpg/0S2K2o34aZlZFNyw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipiua-0006PO-3V; Fri, 10 Jan 2020 01:16:28 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipiuR-0006J5-Sc; Fri, 10 Jan 2020 01:16:21 +0000
Received: by mail-pf1-x442.google.com with SMTP id n9so259345pff.13;
 Thu, 09 Jan 2020 17:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=K1fUKQoqVrc2gBuC0Xa6OebKj/ndQDIk9auPZlDrjlA=;
 b=dqv1bN75FVMKWG07B++J/QTdSBppwKw1hY4c/cZXVVN2OtLW/PC9af9AeSVMm3VPef
 mM91Si/Lmkq0jktGdfJwxcHbWKeDMWzMKZls1fBayxZfmywr0UZlTcd08+zUpWqdrY56
 MiBmHEhP0Ey7mksJEN3Jgj3oJ1VkG8KAt+4hjo8up1H2USH3a/YY5+lQ1HvBqsN6YLVn
 6M0Y2oSeqHlcX33+oemISnHJ2u7C5lbYrvd1NwYQwdghvjmMKskTnd7Cm83fMBRSk6m6
 BthPBiYmAqsAtBWRICNir1naG6QJSKI1k0DKGjoNXDytIi9Hdd82XuIj8fiR1w6yBcM/
 bgPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=K1fUKQoqVrc2gBuC0Xa6OebKj/ndQDIk9auPZlDrjlA=;
 b=dhXY6IK3JQbJasVEadJCoNXYZIRU1CysNmGWdvV1FaPNYmReL8tctmheF11cdcUWCV
 qgriGD+96qDowYv+9addhDSmZzmBhMtIydL++q5eWAx/PlzC9wAk1sjHAe28mKhrKcgc
 lD1KTwYyGSyeXXj8uRorlRPboZNsAn4b9pdv6BSDig8bYndMgFpqe86CYOOj9eNdOoEo
 Av7iQu/o9/QhRzTKYisFTmaYvCm3W/bRWgY3uzFHsxytdBA94tiWsg9eohbFu4hs+ZJK
 rBF+5lL7gGQo4RUAdaiL9LXWTCfR2vZHlk50vSWiLUwW9GiTgt1vCBzrufgsispLexfk
 /OoA==
X-Gm-Message-State: APjAAAXmemE+jAMP/LRwih6KQgkXQRrwz5sHlwsomd6lNkjRKyLTKB/d
 9WgHYrn+lMTKQDsZ1xY4JJk=
X-Google-Smtp-Source: APXvYqwrzlEFCd8aEl+MX707ABW9/oKXaAfQb9y3qVddfy9HcwNI8V2Uy6mC5DRt0o/+z+5hD8uriw==
X-Received: by 2002:a63:f5c:: with SMTP id 28mr1085276pgp.348.1578618977355;
 Thu, 09 Jan 2020 17:16:17 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
 by smtp.gmail.com with ESMTPSA id y21sm271676pfm.136.2020.01.09.17.16.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2020 17:16:16 -0800 (PST)
Date: Thu, 9 Jan 2020 17:16:14 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: fengping yu <fengping.yu@mediatek.com>
Subject: Re: [PATCH V2 1/2] Documentation: devicetree: bindings: input
Message-ID: <20200110011614.GQ8314@dtor-ws>
References: <20200108062923.14684-1-fengping.yu@mediatek.com>
 <20200108062923.14684-2-fengping.yu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200108062923.14684-2-fengping.yu@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_171619_927038_487358EF 
X-CRM114-Status: GOOD (  18.94  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Jacky Bai <ping.bai@nxp.com>,
 wsd_upstream@mediatek.com, Stefan Agner <stefan@agner.cn>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Marco Felsch <m.felsch@pengutronix.de>,
 Leonard Crestez <leonard.crestez@nxp.com>, Will Deacon <will@kernel.org>,
 Anson Huang <Anson.Huang@nxp.com>, YueHaibing <yuehaibing@huawei.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 linux-input@vger.kernel.org, Thierry Reding <treding@nvidia.com>,
 Valentin Schneider <valentin.schneider@arm.com>, devicetree@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Maxime Ripard <mripard@kernel.org>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Aisheng Dong <aisheng.dong@nxp.com>,
 linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Olof Johansson <olof@lixom.net>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Fengping,

On Wed, Jan 08, 2020 at 02:29:22PM +0800, fengping yu wrote:
> From: "fengping.yu" <fengping.yu@mediatek.com>
> 
> Add mtk keypad device tree documentation.
> 
> Change-Id: I415b76ee980784992763c768829b2dda76699dea
> Signed-off-by: fengping.yu <fengping.yu@mediatek.com>
> ---
>  .../devicetree/bindings/input/mtk-kpd.txt     | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/mtk-kpd.txt
> 
> diff --git a/Documentation/devicetree/bindings/input/mtk-kpd.txt b/Documentation/devicetree/bindings/input/mtk-kpd.txt
> new file mode 100644
> index 000000000000..2af81e696159
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/mtk-kpd.txt
> @@ -0,0 +1,45 @@
> +* Mediatek's Keypad Controller device tree binding
> +
> +Mediatek's Keypad controller is used to interface a SoC with a matrix-type
> +keypad device. The keypad controller supports multiple row and column lines.
> +A key can be placed at each intersection of a unique row and a unique column.
> +The keypad controller can sense a key-press and key-release and report the
> +event using a interrupt to the cpu.
> +
> +Required properties:
> +- compatible should contain:
> +	* "mediatek,mt6779-keypad" for MT6779 keypad
> +	* "mediatek,kp" for common keypad
> +
> +- reg: The base address of the Keypad register bank.
> +
> +- interrupts: A single interrupt specifier.
> +
> +- mediatek,key-debounce-ms: Debounce interval in milliseconds, maximum value
> +  is 256ms
> +
> +- mediatek,hw-map-num: Number of entries of keycode in mediatek,hw-init-map
> +
> +- mediatek,hw-init-map: An array of packed 1-cell entries containing the
> +  equivalent of hw-map-num linux key-code. Each cell is Linux keymap of
> +  corresponding row/col, arrange like this:
> +
> +  row0col0, row0col1, row0col2,...row0col8,
> +  row1col0, row1col1, row1col2,...row1col8,
> +  ...
> +  row7col0, row7col1, row7col2,...row7col8.

Please use standard "linux,keymap" property as defined in
Documentation/devicetree/bindings/input/matrix-keymap.txt. You can use
API from drivers/input/matrix-keymap.c to handle the property.

Thanks.

-- 
Dmitry

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
