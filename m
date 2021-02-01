Return-Path: <SRS0=VX5C=HD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC765C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 05:54:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BAED64E15
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 05:54:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BAED64E15
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xXtVENOiAAMXe+Iw0We73i62zaWVNzyH1QTyjc5d/rE=; b=CpownbbnogerhOidDfdTnSglK
	BJdn8zynRjDOTehj7Xu5MLWD7NLfMzYNhwf9hB7cPJvce5qnz3LHSu1UxvkARiwRU0QaJfxOOQuJc
	+b8/k1mcDDXms5byO1yTD9xqcbCvk9EJ+926cV/sfoYFGqdHX2q5671M1/4LfBbxZwB88O0pqbpBd
	iGNb9xBBlBbazmu1AeHGSuQK8GvLNepO6LSncemlav/UiXOrqovs/ETRxelDos58maJl1ahgpSO4z
	dA8GztJM5zloiDkm3TS/394Z7bsFlltyQInVA1Iqk0eQyOkL4JcOI0kGjVuGsN0pt6+6i5pJRcgTX
	vQZJNwfJQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6SAd-0007cc-AK; Mon, 01 Feb 2021 05:54:43 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6SAa-0007bi-4c
 for linux-mediatek@lists.infradead.org; Mon, 01 Feb 2021 05:54:41 +0000
Received: by mail-io1-xd2f.google.com with SMTP id x21so16119387iog.10
 for <linux-mediatek@lists.infradead.org>; Sun, 31 Jan 2021 21:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yE9K9haDCJkujJfpiYMh3J0DehWAaLemXdkg4MY47Ac=;
 b=mPaxIlsIbgZnY/tVj3f9/oTEEP56Gg4rY5MpP3Nuq2v8tvJlXTifMfX3FrWevEXmWy
 wqBLPtJyjmz3CmKhJsDGUyfM2xfV4/GrizPfdgw3jkMshlzcok2brthQOxUJViWf9VgQ
 /eQUf4uJrB1lJbQxL27/9qTIfcbPCKRucodfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yE9K9haDCJkujJfpiYMh3J0DehWAaLemXdkg4MY47Ac=;
 b=fmRC/RjqtLuC+FAgZh5FRS98N4Ej8zUhdd4HLhv7oe9dPyQbB6OdxmAcgOhuOwQOvS
 91Hdnbpzj8NjZEFe4xTPB3RZ6oRSdh7SII9C4I3RvRAjcudHbW7n13GTq0fzv+jVHayn
 sYMoDWde6wy1Npp3RTP6vR+lAVa8mfZejoogZELj2FkRBMVTzYYed/O6uxEClFagtS1G
 xLIoM9WlRPwIntlbGk1AU11F4j3b8oqVoeaffDPThTF9uXFwIJwt9T9Z3QZ9zeaMHuku
 aNlCifhq+Idqz+UyefBlrp2rnYrRWg6Bfpw1tnYHQa12tdU9AZJJcwn1LNeFkxC1mn6s
 ZOFg==
X-Gm-Message-State: AOAM5302oCkeABhX0lRfPv5IWacRqonbbJdBA0QJWtDi3G4gTvXcaNDb
 rD8aFIUClhr4vzQn/P4ldojBAW47y2oOfWPx3hXJrQ==
X-Google-Smtp-Source: ABdhPJwbilNZuRAaOmpbOQ8lESG2o9x3QeCxZJsZsuAW3kkhwmlLpUANeswwfrRMQJmsNTF8X1lbaUiq8aHnTwORyJk=
X-Received: by 2002:a05:6638:619:: with SMTP id
 g25mr12990902jar.43.1612158876472; 
 Sun, 31 Jan 2021 21:54:36 -0800 (PST)
MIME-Version: 1.0
References: <20210201054542.1470695-1-Bilal.Wasim@imgtec.com>
 <20210201054542.1470695-2-Bilal.Wasim@imgtec.com>
In-Reply-To: <20210201054542.1470695-2-Bilal.Wasim@imgtec.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 1 Feb 2021 13:54:10 +0800
Message-ID: <CAJMQK-hYsM=a747UvW91Pbb0XPsqov-O5dUqawrGozYk1Q7Wrw@mail.gmail.com>
Subject: Re: [PATCH 1/2] soc: mediatek: pm-domains: Use correct mask for
 bus_prot_clr
To: Bilal Wasim <bilalwasim676@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_005440_212507_E978513A 
X-CRM114-Status: GOOD (  15.50  )
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
Cc: Weiyi Lu <weiyi.lu@mediatek.com>, lkml <linux-kernel@vger.kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Feb 1, 2021 at 1:45 PM Bilal Wasim <bilalwasim676@gmail.com> wrote:
>
> When "bus_prot_reg_update" is false, the driver should use
> INFRA_TOPAXI_PROTECTEN for both setting and clearing the bus
> protection. However, the driver does not use this mask for
> clearing bus protection which causes failure when booting
> the imgtec gpu.
>
> Corrected and tested with mt8173 chromebook.
>
> Signed-off-by: Bilal Wasim <Bilal.Wasim@imgtec.com>

Reviewed-by: Hsin-Yi Wang <hsinyi@chromium.org>

> ---
>  drivers/soc/mediatek/mtk-pm-domains.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/soc/mediatek/mtk-pm-domains.h b/drivers/soc/mediatek/mtk-pm-domains.h
> index 141dc76054e6..7454c0b4f768 100644
> --- a/drivers/soc/mediatek/mtk-pm-domains.h
> +++ b/drivers/soc/mediatek/mtk-pm-domains.h
> @@ -60,7 +60,7 @@
>  #define BUS_PROT_UPDATE_TOPAXI(_mask)                          \
>                 BUS_PROT_UPDATE(_mask,                          \
>                                 INFRA_TOPAXI_PROTECTEN,         \
> -                               INFRA_TOPAXI_PROTECTEN_CLR,     \
> +                               INFRA_TOPAXI_PROTECTEN,         \
>                                 INFRA_TOPAXI_PROTECTSTA1)
>
>  struct scpsys_bus_prot_data {
> --
> 2.25.1
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
