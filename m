Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52977C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 14:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AmUNW7Eked5rCGU/Zm7KNY3qNk/sGVRCRFZz6Eikc9o=; b=TQhRER4VgazQK+
	Qn+GGneoXSNJpRsI0WP9GyE6S/hHTlzm42cLyQ40YgQlUVZKJrZ/BIV0ygd+FXUpp9qy+xP7MLp2/
	fBvYwtpd8aBMA8ChYWfHirF2zOgl7PkbPxW3q2+D+HEZbjJXzgUwu5pims3mvwrvZmX2JAKdnywBY
	sTKlB7XSjlfi0y+ULszL7vxEemxHZYxZxaKjBYn7zqgk2uvInHuYnVXL/atSJ0Wm6f9cseg4ITVi2
	WILJ9ci2tS0NDL2PtPfRLcrEkrW2NkCMxTyqSIw94uSZ89azA4F5cjXkML1klujVN71uz9dys6PJl
	8BqB8EJ4w/h+UxMdfjcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqyEC-00EQj6-OI; Tue, 17 May 2022 14:31:12 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqyEA-00EQfh-9H
 for linux-mediatek@lists.infradead.org; Tue, 17 May 2022 14:31:11 +0000
Received: by mail-lf1-x12e.google.com with SMTP id bu29so31762791lfb.0
 for <linux-mediatek@lists.infradead.org>; Tue, 17 May 2022 07:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=D4tC4CnESKBgOF+WHUt7nUFhsjNxOiCDiAL5/0+dEm0=;
 b=rUMZqKgaNmZMwXks9Jy/UbcRcIgVdnZbN/zHltL6ebIaQRXsWq5UkTyh0hR4Zzz9fK
 Xl6eE2KTXcqmrXbu/LQGy32ZkLitSI0Ym1d9yFnFtnN7GCQA5XegcoWnN+R+BpV+KCdy
 KKWF6zAqQvHtfWg+URqhrihJ0h50x9ddqm6tO3MbQ7nSc5oOQ1+aJ2vjW8V/IZZiRzKb
 JUfcZoJv0YBZ6yT3Lkmp4kzMaCSNhq5izazjXp4mqYQ5fkPTPR99EkvU9Ou9meAkYIUF
 CBBEyyyuHwoD2o5up4i4Qnq0Grav+d3JVtCvUQs4AdjqWIzB28dxjKt3B4FnbRiMkbWG
 7O6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=D4tC4CnESKBgOF+WHUt7nUFhsjNxOiCDiAL5/0+dEm0=;
 b=lXDSvIVJFg9xeTh1Cro1eKtlUgaJbfvS2asKANg1UjPSZ5J4rtin7AuOqVmh/wfSEz
 t/cXBW1Af/BrF7gBm+8Crj66jT5G1tU/z+fCdewGO+tGupoPSdkz4h47N8U4nKnfC9rM
 V6/N9VxHBPJep0cocgAgS+4if4IXozkDUaJGDOyLmJNZDEyllzSRTO8FwgAk19bd2Bgc
 huzQCS2lrEn2glfDlAQhoGAWGd2tdkX8I+OrQXK3CvLZCrznjLgVLcv99bVOnfVqDWis
 1HXHL6WKyuH0XY+7ovT2avRYQIFNnovuKf/vh7X4pbnf8mZ1aFh4X5VcKUaonIoq0v7o
 HRYQ==
X-Gm-Message-State: AOAM533Zgt8fhaBW5iUmPRpI8GMOlCb4Rxll+JhKRHdGmdS1DYM9b1Oj
 3QZWIbLenHFHayEqVwS2DZXvTw==
X-Google-Smtp-Source: ABdhPJwXMt1lAtTIKCHzfXbl4frwEhcaGUM+J8+xGzgnu5RUnPINhXiaY+LuOMG6qu0c84K5UgTVKw==
X-Received: by 2002:ac2:593b:0:b0:477:a3d8:4042 with SMTP id
 v27-20020ac2593b000000b00477a3d84042mr2580626lfi.640.1652797866635; 
 Tue, 17 May 2022 07:31:06 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 b2-20020ac25e82000000b0047255d211dasm1598860lfq.265.2022.05.17.07.31.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 07:31:06 -0700 (PDT)
Message-ID: <cfb32aee-91f8-ce2e-3915-6a444e189c07@linaro.org>
Date: Tue, 17 May 2022 16:31:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 3/6] dt-bindings: arm: mt8195-clock: Remove unnecessary
 'items' and fix formatting
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 sboyd@kernel.org, chun-jie.chen@mediatek.com, rex-bc.chen@mediatek.com,
 wenst@chromium.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220517101514.21639-1-angelogioacchino.delregno@collabora.com>
 <20220517101514.21639-4-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220517101514.21639-4-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_073110_433596_2D5A4E5E 
X-CRM114-Status: UNSURE (   8.15  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 17/05/2022 12:15, AngeloGioacchino Del Regno wrote:
> There's no need for 'items' when there's only one item; while at it,
> also fix formatting by adding a blank line before specifying 'reg'.
> 
> Fixes: 34d3ed3b9a00 ("dt-bindings: ARM: Mediatek: Add new document bindings of MT8195 clock")

Squash it with first patch and remove the Fixes tag, please.


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
