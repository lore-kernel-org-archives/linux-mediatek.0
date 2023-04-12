Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C85C7619A
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 13:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BxkSh9qGiNggOqM0IqW5ttMVYnP04di9hmJMdY7w8ec=; b=QqA2EyZiRA+mPC/ZkdwFPxub+d
	u8bjcNCSfheZDP5n11lCD9iYG8it72p484k6d0vwo1w7uARq27uIWDJpPhCI10OzhFEREKFJGOagW
	JyQOBIYpTvvG1HUdlL4FKe3c/dacH7TRT1uHWpULO4OhZa3CEtqze+NLn7hSTzQN30E2VQvf4CVwo
	Fd6+h7usZaNmNnP/YNlkBSzR7Mwvbd8MuAP+CeWT75+PHPtzjGzkoZcgr+S94LAEOT6Vv23iW0T2p
	hLb6I5JPuUEnOh7dY+JiveqRjXIdqH1+Ex8BlP0bqtpgURS/2W2NsBVTWmpFm4le50ebE6leWhIMm
	v6XdeMXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmajQ-003NbG-0w;
	Wed, 12 Apr 2023 13:41:52 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmajN-003NZB-1V
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Apr 2023 13:41:50 +0000
Received: by mail-wm1-x336.google.com with SMTP id v20-20020a05600c471400b003ed8826253aso2403036wmo.0
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Apr 2023 06:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1681306906; x=1683898906;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BxkSh9qGiNggOqM0IqW5ttMVYnP04di9hmJMdY7w8ec=;
        b=B9d0pJGJszb/AtvGc1LSVISUvO3gkEB2r6axSkehkm6Wtb3x6EVZv/GnRNDTMvsDYA
         BOiJtsEel1Gj1GBQZdHsQRzA2moZSHwuTofFQnpowXCkNui7+YHgFoFWWwsKgpkD5KnR
         EIlJrioSvTxALhp4/bsKpFuPw6/AEaOIkVoMz2v1Aaehmw81SQM7CsGfQXoAKdYYVoeg
         NeKC6fFqyF7y9uErvCuNqOVcgosikfVSwIZcVm1TriA74ZN7yEBDpIp/ojw0Ogv7wpJg
         WB4ZnnTyjho3a91QqJBYE5I1G5789pzeJhkveCHJ74iimofE1AMERp2XzsRunQ/Wt8Mq
         bkNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681306906; x=1683898906;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BxkSh9qGiNggOqM0IqW5ttMVYnP04di9hmJMdY7w8ec=;
        b=Coq9VylkJ3vakapLjxWGhp6wW9M2A14JqTDy+P9vjWjYJ3jpwxP9GO4SVhUzzBMYPV
         tmXw4xltXkBW2uLTgpHtueiVHFQu61oPUCr+ZSF1Up6ESb8ERl16d3zv2RrZCD8JeOZ/
         qynPE8+R9KEuI6MZfrW/6FNuUUodXBf0XxXwjmsIrSslTdJgFbE1qubdkijZbvgXxAJ0
         D/IMaopkqbaf7Qu2wbdtQl112an8JJ0q2hY609yBeXrDLA5UyGA87oy9wgEi/Fg7OeLU
         9UxPF/BPbzv30teCDiU17Qp3igDR6HwubvIK4W0yce+bk5QmXSdgXC4TNXRcsgqPsBP7
         Hj1A==
X-Gm-Message-State: AAQBX9cvIns/KFArNaSv29w7XXF4GTG0GgBoXkQTMgGSPglF6DfZwVum
	NH0jJPuHLnUJ2pVhhqnPRPPZXg==
X-Google-Smtp-Source: AKy350Yi7DLY8Lcdq0xFepDVOiGuUCd47//3OO0bGUu9eLXFeO7jdLZnBpmOcGhBfDnlwtlu+bd7Xw==
X-Received: by 2002:a05:600c:22c2:b0:3ed:a82d:dffb with SMTP id 2-20020a05600c22c200b003eda82ddffbmr1949562wmg.40.1681306905383;
        Wed, 12 Apr 2023 06:41:45 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id t15-20020a05600c198f00b003f0a007b802sm1434367wmq.12.2023.04.12.06.41.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 06:41:44 -0700 (PDT)
Message-ID: <6aa48e26-31dd-cd7e-7a1c-f46d05c8e74f@baylibre.com>
Date: Wed, 12 Apr 2023 15:41:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 6/6] soc: mediatek: pwrap: Add support for MT6795 Helio
 X10
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 matthias.bgg@gmail.com
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 flora.fu@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20230412131216.198313-1-angelogioacchino.delregno@collabora.com>
 <20230412131216.198313-7-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230412131216.198313-7-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_064149_501699_2C933093 
X-CRM114-Status: UNSURE (   6.96  )
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

On 12/04/2023 15:12, AngeloGioacchino Del Regno wrote:
> Add the necessary bits to support the MT6795 Helio X10 smartphone SoC:
> this is always paired with a MT6331 PMIC, with MT6332 companion.
>
> Signed-off-by: AngeloGioacchino Del Regno<angelogioacchino.delregno@collabora.com>

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

Regards,
Alexandre


