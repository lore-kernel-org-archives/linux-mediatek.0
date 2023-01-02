Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58716C3DA7A
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Jan 2023 16:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q3A8u/ZGvQ/u+zdMS+02ijfzhgqQE287Jcbfn2PLsGQ=; b=1XJte8Ii8bi7eNxiuF8uIF+uSW
	U0q4nt9dYSCTEqI9KZH4T+XRbd7SR3aigFkuq2fow3jJ8QCNohQqRai365JVpIXjSRuQowbGc/tIS
	esqG7jTns5mS4Okj7KdHFdmcqNzFBmgJwluyMIPhdCA7Vk4ylbcozMYw7zCJiskvRa7UY13QMh0Rh
	51fPqRvBUvKw7KKd8FYDux+IqtV9Wtxtcj2XTHE6qFcKP5Zf2Dy3T0hCUlZcL4hkPuZ/T6rKqcqyJ
	rlYAEmhRo4wnfyV7ft3Qw3XQOna1SiKpR1noZ+LY63p8bgq2NXRhgOCumH0UHpxVhouY+iZ/LJxVS
	MeTdSlVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCNa0-00Chwk-1a; Mon, 02 Jan 2023 16:22:28 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCNXm-00Cgz0-Gy
	for linux-mediatek@lists.infradead.org; Mon, 02 Jan 2023 16:20:12 +0000
Received: by mail-lf1-x12e.google.com with SMTP id j17so32671548lfr.3
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Jan 2023 08:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q3A8u/ZGvQ/u+zdMS+02ijfzhgqQE287Jcbfn2PLsGQ=;
        b=nsD1fDj9r8KfUFh6NXsi0K/iHf26iPOnFBnPk1q5gNFp5rh8g50KXmXNQ2R5AGnYZ3
         WQ58F2XqXuQRpE1bRd41laCI4AwErNQVTnvF8DAj52Hlm6r6dEuBFabHN130RNXxfKPA
         xDCDAnbPQuNxu4xa/qXt62R4S4vJ/eUFxS75HnRQ4u+nxoqwRPokye8bYohZr/AXlAt8
         UbcGOxld548ZSxrBbDNqBNvBUeFY50uyvZUDFF0+jF9pNGC4Y0jTAE0MGmi1vDAqcHig
         w6zLHKSULHPUcGi4eVXVbu51dm78bwsLRnho2sb40mJkcbM0KNmx7ovKlEgL2GX5X9HY
         9Efw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q3A8u/ZGvQ/u+zdMS+02ijfzhgqQE287Jcbfn2PLsGQ=;
        b=NReQKCkJnBiqtYnCru4lL0i6XntRfwAJNro20bjz47UuAfQZh5Za/9ZRRbU/1TjObZ
         yfACajuho7o5mKZIcaHM+v+rYx1xIz2K5Y9PRJjLGzki++tIDlZrZt10Yan5gyen7inR
         reudldfBUtR+DOwEDVVuJgkIR+xtbLcFYcsuCjBZ7eukvGps6mWXbfeffq+mmII3MSVu
         sZIaMQ6a/JzyMw88Ix63i93LG426cFfTAU7w0QnYutxdQqPERr1qNNMv+IdeMqD8JZYL
         +NOi8wvdE0RBl2PNs7ZY6vAgi4Vt09aLntVNh3G2AJ36Xy9nA1ejyDSH6DzfTaAAZNrw
         pbTA==
X-Gm-Message-State: AFqh2kpDn0zn2KbIYHU0N/ovRmvWmcwHSx1oLepSUz2HPOqlzhQB8t9j
	BKD1fWju7hFOkSRgsj5O4W69cw==
X-Google-Smtp-Source: AMrXdXufChGyPfDAtZg7eDw3Y+8UbIrIoQtz8mcF7V8z/KPz0mOltbTDF2y7e5TD5DohAD8pZKcxTg==
X-Received: by 2002:a05:6512:3135:b0:4b6:fdbe:773d with SMTP id p21-20020a056512313500b004b6fdbe773dmr11657064lfd.43.1672676406353;
        Mon, 02 Jan 2023 08:20:06 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id q23-20020ac24a77000000b0048a982ad0a8sm4520838lfp.23.2023.01.02.08.20.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jan 2023 08:20:05 -0800 (PST)
Message-ID: <43ee7ca8-de65-8c0a-20b4-e3cb5f10a3c8@linaro.org>
Date: Mon, 2 Jan 2023 17:20:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 10/13] dt-bindings: mediatek: mt8188: add audio afe
 document
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 p.zabel@pengutronix.de
Cc: angelogioacchino.delregno@collabora.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20221230055443.16024-1-trevor.wu@mediatek.com>
 <20221230055443.16024-11-trevor.wu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221230055443.16024-11-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_082011_166391_F9A64473 
X-CRM114-Status: UNSURE (   7.99  )
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

On 30/12/2022 06:54, Trevor Wu wrote:
> Add mt8188 audio afe document.

Use subject prefixes matching the subsystem (which you can get for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching).

This is still not fixed and you got comments about it. I am not going to
keep reviewing this patch. Implement the feedback.

Best regards,
Krzysztof


