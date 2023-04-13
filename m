Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADEB3C77B61
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Apr 2023 13:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3uZ2L6Z2WT9YlA2M5FGrOlxdAqlFCV2dHB/1lrAHpy8=; b=nhXp9E3SMpiXoDiPBAaJBaQy0I
	6hMvsXnh6SNMKKf1kh4BnBph61UmZZXVp6hunfI4r2z3vWT79ZSJDDdbRQHc/H1tZXkTpbCQVvspt
	qE/Y/eXG6WCG5iZYfN/pe+W87e8dU7FMSiPKQd/P7lMchXkR+nUCVBsjPJqkf4qxOYxX86G4tJ0Ds
	OphyM339sV486sr4EhxCMUSO5ZRFv2o0wKbOwTi9zqJwsauC2xFctfOulzQ2zKJF4DhqbUFoDmUSY
	aYTY0MISt/YLATgs/rEFD8XAkyhoBFUZB93QwagNc6lYUhbeMIjjHCec+la84AfBHokv2IPDsVoIj
	13hlycWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmwrI-006FAM-0i;
	Thu, 13 Apr 2023 13:19:28 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmwrD-006F7k-0j
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Apr 2023 13:19:24 +0000
Received: by mail-wm1-x336.google.com with SMTP id o6-20020a05600c4fc600b003ef6e6754c5so6157777wmq.5
        for <linux-mediatek@lists.infradead.org>; Thu, 13 Apr 2023 06:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1681391961; x=1683983961;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3uZ2L6Z2WT9YlA2M5FGrOlxdAqlFCV2dHB/1lrAHpy8=;
        b=Ov3hk06jdZM9d+LdbrIweTCN7GSwWPVPVn8K7uK0TKIk+ttnUmCxFAYbX4B6Qow0v+
         3yxNPHKSoX2xPg9VEAaI3ryZWdl4wWd/HpP2FFf1eXrfTpZR4R0T+KRJvq+SAkW4ypn4
         rmgp4zxq7aKbyPsofkCGIkZkYE/9WOE9S8AlekWZERnszbZxr3jypF8yuwgsit2BKiYG
         wJZrp/pLgjCxK0TxZCADbqdMrY/1YuvexbDG5OEcrI5YL2x7RqFPzNKG/UEEGOT9mLe/
         bhE4rgwiO9H+h5ViytfFeTrueDyueuH0RrL/moWptinT8DITBsTLuN+LUJ2b+22rugnl
         oHDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681391961; x=1683983961;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3uZ2L6Z2WT9YlA2M5FGrOlxdAqlFCV2dHB/1lrAHpy8=;
        b=E4p2NBf8chgCxfa+l8Aacj2a2L5vruIguvhkKkqCsB4tkHbCz8Qcd/Dk9cjiBxVGyT
         Ftom6sSY5kVNz5r8/mgaMitQ1s5K0g2x+d7MfXSsfXrIxRjHH06TGNAZMDtD2NiFVNef
         gLvB+L4dP+ylmG/j4/IeDnHHgr7gzhz+OIJ6G5ah8dtoYMt5ltFf/2wiTJZjdbA/gdG4
         gTSq0iRXusRdR5QNPl2xDwpeBMROYCX5Td4mX8EvjrU8hkhtIkSnapNoCxJG3inZgV6T
         eKstNziGKrq47USbQtprjBZlo5X6h+911RCZmkg/kWHyqXVMkUoQPv2lnzGa0URJRShf
         r6bA==
X-Gm-Message-State: AAQBX9ff2ZUwFeayJ20DDgwplLPIJwUrErMdaAKOWNMwmeXaPn0vDITR
	hwaLrcdrHsSE4uRNxsGKL6LC2Q==
X-Google-Smtp-Source: AKy350ahHJ2R0u9+ILirA6SYvVmLljxqBN6oqzCFoHvHTKwkDlxy0i7/480WgJIzYZwsrG2RkQgdPg==
X-Received: by 2002:a7b:cd15:0:b0:3ed:c468:ab11 with SMTP id f21-20020a7bcd15000000b003edc468ab11mr1819189wmj.28.1681391960810;
        Thu, 13 Apr 2023 06:19:20 -0700 (PDT)
Received: from [10.1.3.59] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id m2-20020a05600c3b0200b003f0652084b8sm5463491wms.20.2023.04.13.06.19.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Apr 2023 06:19:20 -0700 (PDT)
Message-ID: <32450a66-78ff-8ec8-2f31-6e5d91e38a5b@baylibre.com>
Date: Thu, 13 Apr 2023 15:19:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 6/7] leds: leds-mt6323: Add support for MT6331 leds
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 pavel@ucw.cz
Cc: lee@kernel.org, sean.wang@mediatek.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com
References: <20230412153310.241046-1-angelogioacchino.delregno@collabora.com>
 <20230412153310.241046-7-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230412153310.241046-7-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_061923_282139_39B0C29D 
X-CRM114-Status: UNSURE (   6.80  )
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

On 12/04/2023 17:33, AngeloGioacchino Del Regno wrote:
> Add the register offsets for MT6331. The hwspec is the same as MT6323.
> 
> Signed-off-by: AngeloGioacchino Del Regno<angelogioacchino.delregno@collabora.com>

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

Regards,
Alexandre


