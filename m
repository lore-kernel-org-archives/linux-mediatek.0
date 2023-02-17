Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3757C05027
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Feb 2023 07:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n3U1y+OS8xHFze5wneiT44BoEGBfIqVLDOTwRPTeO1c=; b=COu98pwT17NojJl4Ik1eZEQKWO
	wBXfPLu2/T9Pvvx3S86LsE6Q7L5ZLw2LKaGi7n0rNAvnULw9mYXaLSs4XR+fuKP+vn6n0zlfR39Zd
	P4on0vlXcthS5lLs+H4FG5ov6FLnSofs6N3bv2gcUqq831PEWQY2ZxfCCU7Lfv3E8UYV/1CevH2r0
	2TQ4qSMh45zLLxPxJTLMFPDAmXqg2QDdaZEBKAduY5d2Yg69zTay/2fytvCgV4WLSzSYgdk96KHTy
	w13d/KRX4CgnikLUh19wDzmFMnbc764uWGB+Ur8jGgCHnA8dEmSoleUlCzNE8W+PqomgTs8C+cErY
	7VfNVRLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSv8M-00D4mx-07; Fri, 17 Feb 2023 07:26:18 +0000
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSv8J-00D4kY-2J
	for linux-mediatek@lists.infradead.org; Fri, 17 Feb 2023 07:26:16 +0000
Received: by mail-vs1-xe35.google.com with SMTP id g8so4685098vso.3
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Feb 2023 23:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=n3U1y+OS8xHFze5wneiT44BoEGBfIqVLDOTwRPTeO1c=;
        b=RpDZkxWnIFU+udhEWSYKG0R2/2OZcswMbc0u1muUPD8ygE4T8QIXgMwnHqHmjZwtbT
         yrHtsBMAvp6Ahvo1ot9R/doPW91e7Cr5MLmZ6y+igi7H5sk0pJah6IH8MtEQGhIw9HY+
         ZMNrKNUERpnlfCE5U0NvB3Q6ZxFdZbAh/4Ve8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n3U1y+OS8xHFze5wneiT44BoEGBfIqVLDOTwRPTeO1c=;
        b=PiSRplEKUumiYFhIz/QxN13N8fTQFIeOYC9NUA1EzcecLe1Wu53ALTBVGMIVlOgnwQ
         XXFJn8evK260M7gNh8ZCKFQmYluL3sx8OWtHiF+at2ThE45puyrwFitoPE46k9z6KjKw
         drbEZ2mo3rEOWQFDbm5ccU1MgbJGOOCXyCzuCYCkhzTa58DdOIJrcpyjefIHSNkBjr4V
         XCIYQ8hPe9QP2+gJHJmwNr691pwEFMue567ihFB0nA+y+34hS1v2iRTV76+dS/1BMhnD
         rdw52Yrc3iMF1/HSU+0Taudzr2HRwehbHNaJHW2nlj4bmhs5cZ3SOQRZxoYF1OKzZUCz
         B22g==
X-Gm-Message-State: AO0yUKVTM7O8JxzNti+978qIRpgLkxbgngsNwJPySglGK2YwYqZuwSPM
	U/Ny6lmEb4YA9yv7dThcN75lzOciEwesgIn9EfuisQ==
X-Google-Smtp-Source: AK7set/oYrpQGsELLVkMHCbstyKC7Vxeam0LT/Pg8NVkknGuitEFKcVtuuvscnIO+hmqQxJBaUY4SJSaIrtMIgipUcA=
X-Received: by 2002:a67:f749:0:b0:3fc:58d:f90f with SMTP id
 w9-20020a67f749000000b003fc058df90fmr1598974vso.60.1676618771782; Thu, 16 Feb
 2023 23:26:11 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-42-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-42-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 17 Feb 2023 15:26:00 +0800
Message-ID: <CAGXv+5FUANGiDpim4_i7pnvcKokrG7E+ucbtmPQp3Pv_hfpEmQ@mail.gmail.com>
Subject: Re: [PATCH v2 41/47] clk: mediatek: Allow all MT8183 clocks to be
 built as modules
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, 
	johnson.wang@mediatek.com, miles.chen@mediatek.com, 
	chun-jie.chen@mediatek.com, daniel@makrotopia.org, fparent@baylibre.com, 
	msp@baylibre.com, nfraprado@collabora.com, rex-bc.chen@mediatek.com, 
	zhaojh329@gmail.com, sam.shih@mediatek.com, edward-jw.yang@mediatek.com, 
	yangyingliang@huawei.com, granquet@baylibre.com, pablo.sun@mediatek.com, 
	sean.wang@mediatek.com, chen.zhong@mediatek.com, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_232615_136252_114AC10F 
X-CRM114-Status: UNSURE (   6.78  )
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

On Tue, Feb 14, 2023 at 9:42 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> All MT8183 clocks are platform drivers now! Allow module build for
> all of them.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

