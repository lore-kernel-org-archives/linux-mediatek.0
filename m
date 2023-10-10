Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A4BCD80BB
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Oct 2023 12:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nndtjHuMt0cf145zyVj0vZGF/G3X++LPFZ51I696qiM=; b=3GuJqASy6XvigvYea4ZilKSGz0
	QYwF1+6fyNE+1Z0WHSyuSyxHfuPg0j8oTzGfdtRek7+kMzlX0Brsau4FDva+bpcdQS8M4LoTvikRT
	vimT/oScpMai5sS+KRUeSJCPMb3/40pNKwEP6sT+vAZC7se875hfN2CIqjzCeOY+si23TXjqhIF0o
	LzddGUONDPIkqgPPGZaoSKNkDJTereanvGom0KGqsQs4fXBG1RZQBlHB12b9fYxLSG9kum0Lh+beA
	+uAdYh8bXGf6jgZwzywzZf0htlDCWpkRhprWkRbDBGwqTM40qBKdsNbjhhryraExihpC0WQVTRiqP
	O9UsSSxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqBf6-00DJEn-26;
	Tue, 10 Oct 2023 12:16:32 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqBf3-00DJDQ-0Q
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Oct 2023 12:16:31 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-533c5d10dc7so9812934a12.3
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Oct 2023 05:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696940186; x=1697544986; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nndtjHuMt0cf145zyVj0vZGF/G3X++LPFZ51I696qiM=;
        b=xKrqTOZX7Yk3JsHOHmk7CAf8C/9JiHg/BAxZovhs8xCQMdEJeRAiJ3cTTBLY/C0V4H
         HBM/V1StN3ZdbPUQ2YXXmJk/dNm4JNIvcbyYsTQavGNK628X5dkUm4ks/1WP/nmJykwU
         tsnuz94rt0ln8Qi+4vKkGE9szc9W9tv7940N1l+5rfD151bsK8GYbLWZNRx49A2HA5Mk
         Q3rkgraAT7NTYEKAuN8+Fz4DDQ33iuEDSe+1YpkT5m8KKPw6edUW4aOaMGM0gLlAQX7t
         GWRIfl3VuI3cVwmQrx1kXFjFkqNBiyurI/FeYbGHZ9abBFdKDb488hk/IvWL6QIZYXh/
         nWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696940186; x=1697544986;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nndtjHuMt0cf145zyVj0vZGF/G3X++LPFZ51I696qiM=;
        b=T4LvTSfCfPEjwPiSBPy5D8JdZGbUO3MKMsiznOlrbr7uA9BU7BIk1vy82BNryQQc6S
         4P9323Xh6VLKqcsTV36H6pM4dMBuLCZhmSIMg5FdW3EheVKOgYxnm1yetfCU4Vas866D
         2gT+He1g9EaM3hBJnNO+yHrovgJIsNcOSrKfjeJAQde2evPxvgB5Lw+Bxj1vtZkDJlXM
         Gi1OC0+I/vvkdW+fe5pHVlXONy7hRqmG/PiNgdG/cP5GYLXZDhvMdoSYGJh9EUWQWgnv
         VLWSnpfwQfMkbn2FbQ79bxh8mp0XNv4JB9Un+a9CC30mvhd22co4MMwNYqPHYRK5/L73
         BmJQ==
X-Gm-Message-State: AOJu0YwmMCI59kVIzpEUVSnxqXg2bUJ1pE9c2ie6a+8Z+P+XUT6SiQPJ
	ejHhtB2s5teXM5lOwPtjsfgPfg==
X-Google-Smtp-Source: AGHT+IGvbaphCGmTo8kI0FKFqK44m2tAKrLMU9877yBSznrJMtpCLD2SsXe+zSRMlWY5bELacdHCPw==
X-Received: by 2002:a17:907:7711:b0:9b2:a96c:9290 with SMTP id kw17-20020a170907771100b009b2a96c9290mr15848525ejc.33.1696940186336;
        Tue, 10 Oct 2023 05:16:26 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id k16-20020a1709062a5000b0099315454e76sm8293803eje.211.2023.10.10.05.16.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Oct 2023 05:16:25 -0700 (PDT)
Message-ID: <50662394-0da1-49ce-a519-c0b963d19e54@baylibre.com>
Date: Tue, 10 Oct 2023 14:16:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] media: dt-bindings: mediatek: Add phandle to
 mediatek,scp on MDP3 RDMA
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 mchehab@kernel.org
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com, moudy.ho@mediatek.com,
 hverkuil-cisco@xs4all.nl, sakari.ailus@linux.intel.com,
 u.kleine-koenig@pengutronix.de, linqiheng@huawei.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com, wenst@chromium.org
References: <20231005104905.120544-1-angelogioacchino.delregno@collabora.com>
 <20231005104905.120544-2-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20231005104905.120544-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_051629_352666_302DDC10 
X-CRM114-Status: UNSURE (   5.86  )
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

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 05/10/2023 12:49, AngeloGioacchino Del Regno wrote:
> The MDP3 RDMA needs to communicate with the SCP remote processor: allow 
> specifying a phandle to a SCP core.

-- 
Regards,
Alexandre

