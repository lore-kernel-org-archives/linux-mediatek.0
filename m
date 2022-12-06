Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34257C352A1
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Dec 2022 15:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lNf0oPz1+3JYITF+uARI5oqprCns7og7GMeWkwgQOfc=; b=0CzvK/8rgWfjWwrx93aEZBh7mj
	SHJRuY447YPMR/CAl872BqP5fSkpjy32sBnDxnD19hsgaldjh6YEUXpJ8L0tKiu/1mN2mKSMSJ/6P
	MiOKdWXLmMyKHcPJJVjrBFCaWmiFdJKnfAy3DI49E4mv+Ldo2bjdv4hIFx6d0lZXCWOWQAw6lCo85
	BkxTvA2J5dyKGkfs4KcyEkIlfPhTMB6Hl62K+Jklsw9F/Bb/ES6T/GzKwVhKrmfODdZf/npUZhKA+
	bM81wPZAQFeJdzB9qYPpUw4bxUGmM+I5tGbOpwftTSFx4b14rdT8C4Fbff5elcLD/XfF3znIslHww
	W0GLcL4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2a9O-00DJw5-Sd; Tue, 06 Dec 2022 15:46:30 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2a86-00DHAK-Hb
	for linux-mediatek@lists.infradead.org; Tue, 06 Dec 2022 15:45:11 +0000
Received: by mail-lf1-x130.google.com with SMTP id c1so24305194lfi.7
        for <linux-mediatek@lists.infradead.org>; Tue, 06 Dec 2022 07:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lNf0oPz1+3JYITF+uARI5oqprCns7og7GMeWkwgQOfc=;
        b=Kx8saFYoHs97DPlt7rrWo2mlAeMwmhdrZXHcU6ApGZvCEcPzi+fsL29ZykBAdUog/p
         4RhjCcy+vvcGMq5PQyQA7TSNYry9E+K3FGHTw8SpdUT4WGFAOtEqVhtysayPFRJlxqOs
         dPbdVzjGH4w7YTBIKP69tRClDuUpWxwP60LHj5r3/rtPtf31XDHArnKPYS4DhO00wKRn
         +7e5S05nSpyz6sFoVtz9C7uRJj0P8kFprLbiwFBfFO/INtdatDSMEBGkPsmco4XMgMtN
         x+QVEirO8ZUBFE4h1OAclT2O5ukRBq1bzdNO5EQ3j1uDU63bACCnKe6NYtqG9+khx8Ld
         xIcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lNf0oPz1+3JYITF+uARI5oqprCns7og7GMeWkwgQOfc=;
        b=ewQ+mdC77f9pD7ne9D77vxxShw+Ot0Qz3Pkt85Jdfob4S750r+sGVledLefbWbNpiR
         FkMNO2IOYdsbEHP51Wo74oJURsXD2WyW6gHwEqmv/znPqHzpUaWSxTsyWOxKIUSYYTCn
         5pyOnExBnN1RZDVftqLV+FFew0/mPZWoxfTbfKN5VNVHTsCZNdIHPMn4Q7g3ykwCzijz
         XE65X71RBoxJ4K0/rDceMIIbJikOFbea03u867BXoziNcDN9U4YGTbxqOxVywZK7LPpv
         i16LTgDP82CATM0Lc1ubEXaA31mLfCXXGfgUjjOXEaRHLX6zJzAHJzOYagyS9d7jP0yw
         8NAg==
X-Gm-Message-State: ANoB5pkGqSWfub3C1wN99G0S9KGv2uA2D9UypIkbFlhYdLMWOUny0VZx
	J94LSqyBlTkgHn3dmJOUjmC60Q==
X-Google-Smtp-Source: AA0mqf5Jh+Dt9wCImCiy9pkyTRtPnrr1eJHFTxSsl5fLdur/tl5B+TujlU7R0CiZRMeh4aFTfnhVGA==
X-Received: by 2002:ac2:4e0a:0:b0:4a2:2aab:5460 with SMTP id e10-20020ac24e0a000000b004a22aab5460mr22854399lfr.62.1670341507919;
        Tue, 06 Dec 2022 07:45:07 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id v5-20020ac258e5000000b00492ea54beeasm2518454lfo.306.2022.12.06.07.45.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Dec 2022 07:45:07 -0800 (PST)
Message-ID: <d17bef48-0804-3ccc-a14e-9043ae615573@linaro.org>
Date: Tue, 6 Dec 2022 16:45:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v4 2/6] dt-bindings: mediatek: modify VDOSYS0 mmsys device
 tree Documentations for MT8188
Content-Language: en-US
To: "nathan.lu" <nathan.lu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: "jason-jh . lin" <jason-jh.lin@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, lancelot.wu@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20221206020046.11333-1-nathan.lu@mediatek.com>
 <20221206020046.11333-3-nathan.lu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221206020046.11333-3-nathan.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_074510_645068_CCF1C1D7 
X-CRM114-Status: UNSURE (   7.18  )
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

On 06/12/2022 03:00, nathan.lu wrote:
> From: Nathan Lu <nathan.lu@mediatek.com>
> 
> modify VDOSYS0 mmsys device tree Documentations for MT8188.
> 
> Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


