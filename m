Return-Path: <SRS0=Vpwr=D2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EADCCC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Oct 2020 10:25:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 610BD20578
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Oct 2020 10:25:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tV31igEv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LKKgD50z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 610BD20578
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FfNbUWAeBocXeH2fzCXS5yklSLgyN499h61YTJY4HgA=; b=tV31igEvXB0b9WNHoks2f/Tt9
	cA17EbPKViHY1iweaaAUlQqF4nfvwI1J9fZzNG9eMDKEtvE/CWy/x1GMXl/iKnStfNMZ2Rf+muzsK
	H06aGQ+XpPM+FO3GoqktHl8GH0Z/o2d2McWppEGmB3vSIxFJyiydO1rs3+tpKwitq7cGsVBXac+ZY
	MIkLNLIHBizvO6TSJ5FUeq9NhAA/IqJro7t63OJ+ppk+6TGwnA537sTEF5hzjc3BOTpl0lxM1T/Vj
	Ki9hmgqI+XG0FWlp+bNC2hO3aP/W9w+CA0max232x7uTGp+AdGeEiBDSlhOBHECXqufVtIzeJiLG9
	GErpF9exQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUSM6-0006WR-5g; Mon, 19 Oct 2020 10:25:30 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUSLL-0006Bc-Ke; Mon, 19 Oct 2020 10:24:50 +0000
Received: by mail-wm1-x342.google.com with SMTP id e23so9748967wme.2;
 Mon, 19 Oct 2020 03:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DMW0yCt5PBQfW3WFVdC3B0AANBzYHJJxzkQs00mLzDU=;
 b=LKKgD50zTmIM0cMSAE/AvUDkwu/kdSsZ0L95UgKa3KWLBAjnaSiWy1XHl+SdcRqEV3
 IQE/moIhIeabtBKHMoROAOuKwuPkgmFo0f8fwML+IguoHnBOiuyuv+mQ2N28vq+7hO0z
 1bA/5KGrtkXxRzGVQmzHYNj+YDoAnbUhDK5vTJDwEYvTfrucI1LrYns1/fES2K5VyN48
 YTzw572i9QZEsNGaJMd0/NwKZqNde/TgGQ68LcbQEsJoJUs3bpaReIvTrIRsvloxsORF
 o3Qa9GlsO0fooOT2rs6I6fPRmEpx/Ky7xtBbaa0CqwskxUSg0U2rwHmlbHfuFQNrPxT6
 BwTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DMW0yCt5PBQfW3WFVdC3B0AANBzYHJJxzkQs00mLzDU=;
 b=dCTrUEN1z5kKIHNY9OIz+pG4vFUk7NlcRtlBVHafDmSGtrpILYp9iu6n+XyCZ2oHrD
 OWhsW0YcgHdXY7K5sa/Pf/TDyhig0jRCsjq4XsBze/nu6ndz8sAdlafPp6oyBOMZF5EL
 w0nJ++TLDB763xKSmdvr3elWeH/U9frZeEgbKeBZ+GmMFCczazGgDYmBOd3+jva/oWAl
 QSmwF9cRpM/xNcyOim3/qbeRombcZnORp1TPvplJRw/II2YmGXcIEg/NNME9xbLtiOIQ
 DH25C6UQP93LJ3OQsbzBw1SWRP0si4WvAzjuT5q0E4/b2FxPqaHLisaHHMfFh+RUDmhx
 SMaw==
X-Gm-Message-State: AOAM5337XkOxha7LVXUzurIqO/b6yqBl7PeR8pyG2Hbztri2AqJWt4II
 G9g3aMg/EA+8Mvd+YMb/lwg=
X-Google-Smtp-Source: ABdhPJxbSA06zBvEt/c3tORxcj/AmyLbEGYsK6l2y/z5MVdKIojHim9Mbimp5qDS8XKjW333ug8wiw==
X-Received: by 2002:a7b:cc89:: with SMTP id p9mr17644734wma.4.1603103082028;
 Mon, 19 Oct 2020 03:24:42 -0700 (PDT)
Received: from ziggy.stardust ([213.195.119.110])
 by smtp.gmail.com with ESMTPSA id t13sm15863863wmj.15.2020.10.19.03.24.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Oct 2020 03:24:41 -0700 (PDT)
Subject: Re: [PATCH 1/2] dt-bindings: dma: mtk-apdma: add bindings for MT8516
 SOC
To: Fabien Parent <fparent@baylibre.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org
References: <20201015123315.334919-1-fparent@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <9308a487-ed84-6112-d612-a8a777ee0dee@gmail.com>
Date: Mon, 19 Oct 2020 12:24:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201015123315.334919-1-fparent@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201019_062443_898490_372E0DC4 
X-CRM114-Status: GOOD (  19.15  )
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
Cc: vkoul@kernel.org, robh+dt@kernel.org, sean.wang@mediatek.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 15/10/2020 14:33, Fabien Parent wrote:
> Add bindings to APDMA for MT8516 SoC. MT8516 is compatible with MT6577.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   Documentation/devicetree/bindings/dma/mtk-uart-apdma.txt | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/dma/mtk-uart-apdma.txt b/Documentation/devicetree/bindings/dma/mtk-uart-apdma.txt
> index 2117db0ce4f2..fef9c1eeb264 100644
> --- a/Documentation/devicetree/bindings/dma/mtk-uart-apdma.txt
> +++ b/Documentation/devicetree/bindings/dma/mtk-uart-apdma.txt
> @@ -4,6 +4,7 @@ Required properties:
>   - compatible should contain:
>     * "mediatek,mt2712-uart-dma" for MT2712 compatible APDMA
>     * "mediatek,mt6577-uart-dma" for MT6577 and all of the above
> +  * "mediatek,mt8516-uart-dma", "mediatek,mt6577" for MT8516 SoC
>   
>   - reg: The base address of the APDMA register bank.
>   
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
