Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB48CC3DA7A
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Jan 2023 12:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TAOMstZovNL9Fw1icUH51vZKfotjQqt9VMYdlqvkSf8=; b=Ndhkha1+Qb0x22IS7CM1FUBANI
	zqyS3L44djIoOdQj3ookpb/8CMwkYIpB/PGnX7VqQ+638HmgfNDA/NYlnxrkixKFlHSckJPxbsZ/w
	tF353HdjtLlS8GRVLWEMXw7cUJP7nDgpjfBDWEPEUu1FUvieCESvPmBPkfMNhcw09nTBBW3sH8U5+
	IV0NUl28Ksl8Zujrg9mK5UsD1OhH38edZVSOIZrY+02zWgsCpCOgywFrqOGukg3VCi5GVPQnOkB61
	VWNog2Zm8UB0C1Wk+u4NuJ8Xdu1tB20bcFCNFLSJucLJSk/DY8a2qhRtpas+fcQM9k2vVEq4kj94o
	lWXajnEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDmD5-008CDG-QW; Fri, 06 Jan 2023 12:52:35 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDmD2-008CBE-Tb
	for linux-mediatek@lists.infradead.org; Fri, 06 Jan 2023 12:52:34 +0000
Received: by mail-wm1-x32f.google.com with SMTP id i17-20020a05600c355100b003d99434b1cfso1007670wmq.1
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Jan 2023 04:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TAOMstZovNL9Fw1icUH51vZKfotjQqt9VMYdlqvkSf8=;
        b=U8ZvDuPJkFFQOlBgzFNmC6o8YMOiY/MeXyL1tdI5FZphEVXgu6KszyKxnDFtBSMrqC
         6K7fRtUQcJwQdHNQ3LMF5OHDj6Tj4o6Zbtbk2njmn4D8KskY2K/9zqNdsNq8Vf4+yCgN
         /nz3LBTAAawpO03uf4ve80mIDrXpWbBs8aqNlJXFTJnhGPcNIqqeNPAuaS56MlIWDiib
         V8aAkAGfLSawL/uWnXyNOltei/sxpGTU8cFEzU5mhMU3+b5Ve6K4XcmL20HgfGWVDVl8
         LMrd3T8IKvM1mYKtltSP80JdczaAf9eQLXTzrhz8i04wTqfLs4hkY10RoiFDuxRdDHws
         i/Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TAOMstZovNL9Fw1icUH51vZKfotjQqt9VMYdlqvkSf8=;
        b=tkpEWOVpld1Pnx1vAzQFjJvb2unE23J/opl125+VsBaDsZhxWtfkgoxRYuTcuLVH9H
         B1xnabivGP1R51RhLqd1KUt/JDNNIMD9yHI14L9X61UFT8wunv0ky5Y9rYSomq12ZJ+S
         9GS+ST2V1lO2dygsTxQyYng4JYZvECCgWP+ONxXuOWzbf3DXDiEKal0PsxIllIRYxpOS
         HmQ0U7iYAPSP/426wySAt3KN/dPWFVtH4mZ1yaAfQVhkINhfVe+z3tNYDSiC0W2wF347
         il5OpoqnCM3xhCsXVwyzWhFdOo3txwa7fivxADk+1w5oEiO1kY82UkiYBitDkLz3o8aM
         6ntg==
X-Gm-Message-State: AFqh2koCGNKsnNyg4H/CWlGn7txexzjuLd983hjPnJYVQ+WIOB2X3OnS
	k7I92BR7xhM7HOKhaXaC5A2QMQ==
X-Google-Smtp-Source: AMrXdXttz/qmuwcn3VqjXhrWUfUZyiMjfZIVlIzwzOCT/WC9xGVucirL7hV8GfUERndLqM55ciQDsA==
X-Received: by 2002:a05:600c:17c5:b0:3d1:ebdf:d591 with SMTP id y5-20020a05600c17c500b003d1ebdfd591mr37880740wmo.15.1673009551764;
        Fri, 06 Jan 2023 04:52:31 -0800 (PST)
Received: from [192.168.1.102] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id r10-20020a05600c458a00b003d35acb0fd7sm6625327wmo.34.2023.01.06.04.52.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jan 2023 04:52:31 -0800 (PST)
Message-ID: <03802554-42b0-7f4a-08b2-835b7ea9dc8d@linaro.org>
Date: Fri, 6 Jan 2023 13:52:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v5 13/13] ASoC: dt-bindings: mediatek,mt8188-mt6359: add
 mt8188-mt6359 document
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
References: <20230105081606.6582-1-trevor.wu@mediatek.com>
 <20230105081606.6582-14-trevor.wu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230105081606.6582-14-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_045232_990154_3F892A90 
X-CRM114-Status: UNSURE (   8.42  )
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

On 05/01/2023 09:16, Trevor Wu wrote:
> Add document for mt8188 board with mt6359.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
>  .../sound/mediatek,mt8188-mt6359.yaml         | 97 +++++++++++++++++++
>  1 file changed, 97 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


