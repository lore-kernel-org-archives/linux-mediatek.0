Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 104CAC04FFE
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 May 2024 15:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q2d46BIzaS71fynIkzwWpbI/UQLh+9rw0YHOl7HkTKw=; b=ZIXg+EBV0nLAef/WX/dtaD/UJ6
	IqELnKtTLX8YA0pxNDLRnfiEmDSTdcbyRXd3/HQ/kLitWKPqH1m9y5bk4LkwQ8EizwktucpNRQyn+
	D2KF+pqwYo9Do0emmPh6fib8i66/pz/KSHId7mhECS7Yts8mc69a4/fbwB/2EePo7qns2NyHIlYc/
	xfmZvxZXUo0n0ulL5BPfSYWIBEhCMby+HvJIQUIgxb9WV9cB0LB9fOLezhzw3o6vyHpjlWxIKiooj
	A49zkrt/WZm1MNqtw72HEjF+Nub5XAxXRA9Iyi7o/fX6CWEF47JVEGDT2oEYPELlK+PU67a1U6KbY
	zwkZS8hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9520-0000000ErEf-1vk0;
	Mon, 20 May 2024 15:34:32 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s951v-0000000ErAw-1Mdp
	for linux-mediatek@lists.infradead.org;
	Mon, 20 May 2024 15:34:30 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2e576057c06so34820801fa.0
        for <linux-mediatek@lists.infradead.org>; Mon, 20 May 2024 08:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716219264; x=1716824064; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q2d46BIzaS71fynIkzwWpbI/UQLh+9rw0YHOl7HkTKw=;
        b=GWfu3J4dzkMFa7V7oIMAYyOJ622siqfVXsYKamdJd+RllnkEakwLSyUqAhe169+X8+
         69KjTNTxjTyxPh/z+IKLds9KVZ6GIa1+ZkTnugaUcOabSZtqD8rqjIi/0b7aQVww0E8j
         9YBOrGW2TeXVpZg1QC9DYhqIsCirdm2AQ/h4aUzwRb6/iILynm2wy52Mip/HlrrImmAD
         KMQ/BebFPbXGVgBMeaF7ybCoYcWJBujUaHnXIwDoccC4JsAvm7XYkMzCxUa+SeoaXEaa
         1KTmyLSNKIFazMOgnxHtr+7ykfqYR+f4LwfVgb0Fwmt+jUvkMJ9owhjl6XoafEX2XGx3
         0IjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716219264; x=1716824064;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q2d46BIzaS71fynIkzwWpbI/UQLh+9rw0YHOl7HkTKw=;
        b=oiKroxRUymWBKPjXerdvRnap/j+NKokhxgyUQwsqhHC8cQAZq8crKXJ3/bSXTLN+Jd
         DHCB7gKlveX+QzMG4dpZ/5ljK3ytnPLFxH3u4DFwq2SScCx3IKRp1vokcS+Lu7bhRN5e
         mxS0WwfWuzVP1LpcrDfAFfzrBargVw+YqK2XmSFkdljr1WhW8a4ZdrkMNme58AqaKAYK
         9iqtDDjDZO17UssDfx5rYcESSdKQuIj/aTUqMGHVDVL8aDXsa4AQUwjvCr/V7qwCfmun
         b+xyhhOAVEwbZun4yDuY5QmKFD6SPhvKFP8HZoyxgJGbohswWoVE5qEJoBu7rFlSo2+K
         PuhA==
X-Forwarded-Encrypted: i=1; AJvYcCXiIyY5vr9Pq2B02sXTg/BKDeVIOdjRkBCs7B3jfOFquq1IeplCg0aKnPA+0l/FJxFnstRlsfNH0R8QrdIrB9f1IqAd2CXlYS0Z0U/Dz3/kQgWd
X-Gm-Message-State: AOJu0Yzm6eqkjncEdKUAkrMwWvI5EjNcEUuXZkX90yYhFXd6vVBTWv3q
	mSQIuDnahJsu2PD0R2DvoN6jf6p9ldqNFs/NsbKTFT8hXeE6objfYc+Cc7OltB4=
X-Google-Smtp-Source: AGHT+IFwdu6YJ9mb/t8HH6MJk6jbYDbj8a+haKLMBrRf9ny2u4juPEFKyoKT/juaePI9RR6Hkf8E8A==
X-Received: by 2002:a2e:a6a6:0:b0:2e2:72a7:8435 with SMTP id 38308e7fff4ca-2e5204b2e7emr164397641fa.45.1716219263883;
        Mon, 20 May 2024 08:34:23 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42003bf579esm374395215e9.43.2024.05.20.08.34.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 May 2024 08:34:22 -0700 (PDT)
Message-ID: <23609d0b-0908-4acc-9fc7-d74d2c06e80f@baylibre.com>
Date: Mon, 20 May 2024 17:34:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: display: mediatek: Add OF graph
 support for board path
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
Cc: robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 matthias.bgg@gmail.com, shawn.sung@mediatek.com, yu-chang.lee@mediatek.com,
 ck.hu@mediatek.com, jitao.shi@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 wenst@chromium.org, kernel@collabora.com
References: <20240516081104.83458-1-angelogioacchino.delregno@collabora.com>
 <20240516081104.83458-2-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240516081104.83458-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_083427_479687_4A65C7C6 
X-CRM114-Status: GOOD (  13.44  )
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
Tested-by: Alexandre Mergnat <amergnat@baylibre.com>

On 16/05/2024 10:11, AngeloGioacchino Del Regno wrote:
> The display IPs in MediaTek SoCs support being interconnected with
> different instances of DDP IPs (for example, merge0 or merge1) and/or
> with different DDP IPs (for example, rdma can be connected with either
> color, dpi, dsi, merge, etc), forming a full Display Data Path that
> ends with an actual display.
> 
> The final display pipeline is effectively board specific, as it does
> depend on the display that is attached to it, and eventually on the
> sensors supported by the board (for example, Adaptive Ambient Light
> would need an Ambient Light Sensor, otherwise it's pointless!), other
> than the output type.
> 
> Add support for OF graphs to most of the MediaTek DDP (display) bindings
> to add flexibility to build custom hardware paths, hence enabling board
> specific configuration of the display pipeline and allowing to finally
> migrate away from using hardcoded paths.
> 
> Reviewed-by: Rob Herring (Arm)<robh@kernel.org>
> Signed-off-by: AngeloGioacchino Del Regno<angelogioacchino.delregno@collabora.com>

-- 
Regards,
Alexandre

