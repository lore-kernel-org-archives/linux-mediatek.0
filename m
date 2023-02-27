Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA96C64ED6
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Feb 2023 08:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sPZA0XSKxRo4YB/M42Xch0cLpdtNvC/oUhrKIx5ckBU=; b=K25YF86Bn9l3QKSH7y5lP/Ws3O
	QKweDimMn1a0I6fiHGB7xWXZYM5VfLsuVXzOB2rq3oQ/34pg6p68/r6s7ZjZ+8dkfU7w8W5/z+46B
	Xhqm63jIw0DZyKSTLdHMr3wVNykqPUeZPNuJ/5gA2/8Bt6RTY48RtzJJYKmAkq5eY+FQS0UDyv/SQ
	Gpg4Zj2/8qqD5CRwPwXMnsyZ9uo6ey6S1GJ1cFUCVt/ENXT1TUXDdfse3Zh6LETj+IGq9Derj3Ww8
	h+t5STJgMdMMX4BUrA550PU8/fiiTJHAGC/Xy34DXHRl7bP/kX2knXU6fZlYjW7YjLujvEBxIqkX5
	rjEkFz4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWYez-008l70-Ji; Mon, 27 Feb 2023 08:15:01 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWYew-008l5u-Ih
	for linux-mediatek@lists.infradead.org; Mon, 27 Feb 2023 08:15:00 +0000
Received: by mail-wr1-x435.google.com with SMTP id t15so5215927wrz.7
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Feb 2023 00:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sPZA0XSKxRo4YB/M42Xch0cLpdtNvC/oUhrKIx5ckBU=;
        b=hym7BxZM8YUGCUNlxpVqf+3CxalXvS/VffvyAHsTZ6xmYzZM8Mpju237R+IJUnQrNv
         CWfR23+gY0hU7N/mgnQYCsvL5EVgoBNJaZbGIxRMmNRaBpTjhOOgs2EuV4pY4AyV5FxP
         SKcY/Z4Ywbz4+hbhLbFeqynZ786BVX3LLXy8oATwOKPqLbqUNCRmArdp1MbJnhguAIgv
         oOyi0atdhcvSLr3pqkpSzO+xDJcuNneVc6e/EDcOzcsAFqqZYdVnIQ840Xo2gYMKU5xs
         raYuAqD47BDiAo2G2hQxZT3Y+G4Xv0poNJyj9j+17FY4BB+DjnLVp4jzyoUepqXYZsP9
         he2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sPZA0XSKxRo4YB/M42Xch0cLpdtNvC/oUhrKIx5ckBU=;
        b=H39PCuxqWq4DdXucujqXca4V1LZ+DtxVKmj99hRVlgIMkelINVJYbm4K7xY7p8X0kR
         YE5wkq+ScXETlUU+V+ZrOmRgNWYy7gD71Qyqlwng0u7HW/yaCrRVFxk8GZoNRvHjcWko
         C1bSVd0MxQrMdvaiCvvvjpMszv/8YHGwk8i9hg3z/NAfO3OyYMrqD6Sg+YGnUXaO2t/2
         NPP+FWw7GYJTU3zZaNzO9vTZ2/WNbGewzD1X9kR9uqAn0eqXO1ib6rcb6WyChBxJ1XqN
         KaeBsGxQEfufAUfLneftXNbSp3VW4hb5xuN9Yy4NaX2AlmMS6BsHDimAJXsmxfvlFRxm
         QD7A==
X-Gm-Message-State: AO0yUKWksl45ecQPDHnr8QoH2FUrZEI4++0RiS2X8gD6FD74bon/hil8
	Z2dK6xlqbgTVlWigCntCQrQsqA==
X-Google-Smtp-Source: AK7set/s9+7NWpmDjGEUEEHrmychpJ81y9ZNfgqj5JXXi2ASfL2q/j8dhtlWWGIGiVsvQZF9J0c5AQ==
X-Received: by 2002:a5d:4642:0:b0:2c7:d7ca:4c89 with SMTP id j2-20020a5d4642000000b002c7d7ca4c89mr7103428wrs.58.1677485697110;
        Mon, 27 Feb 2023 00:14:57 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id h8-20020adff188000000b002c54241b4fesm6326357wro.80.2023.02.27.00.14.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 00:14:56 -0800 (PST)
Message-ID: <8757f3ae-9145-78a4-6a41-d6c66746a9bb@linaro.org>
Date: Mon, 27 Feb 2023 09:14:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/3] dt-bindings: power: Add bindings for MediaTek MT6735
Content-Language: en-US
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230225101629.264206-1-y.oudjana@protonmail.com>
 <20230225101629.264206-2-y.oudjana@protonmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230225101629.264206-2-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_001458_829534_9B81B5CD 
X-CRM114-Status: GOOD (  13.37  )
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

On 25/02/2023 11:16, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Add DT bindings for MediaTek MT6735 SCPSYS.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>  include/dt-bindings/power/mediatek,mt6735-scpsys.h | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 include/dt-bindings/power/mediatek,mt6735-scpsys.h
> 
> diff --git a/include/dt-bindings/power/mediatek,mt6735-scpsys.h b/include/dt-bindings/power/mediatek,mt6735-scpsys.h
> new file mode 100644
> index 000000000000..5124cdee9dc7
> --- /dev/null
> +++ b/include/dt-bindings/power/mediatek,mt6735-scpsys.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */

Dual license, please. Same as bindings (checkpatch should warn).


Best regards,
Krzysztof


