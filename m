Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C00ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Aug 2022 09:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Id/5R3SN5Vasbdfkyu32JE/b1ZpOrfARzpy5Arox7pY=; b=DD16aep/izCJtJMNrXjolXmE5d
	cOxwdTuxQyf4C49lV03IgItRECTpbm66RAOoS5aEnnjif3NdIsfmXUWX8AatcfdXtG8cxHPt9OvoS
	f/rFCXCF4M2Zk0ZRmaDD+SFdNUeeSCP1M/5WtdObDE4zqNXTxTm9lrM9AMxKZ4NkW6gZN7oI0GXHr
	OX1YXI3AceSTMgA3rprN9uMQzmhfWJtpWOHkCO3zXEfr6jE3wK5KR+Jm6v7tladPHRx03PS3EW3J8
	TEjjkO93q+u2lqpgOmTj2U8Jex6W791g1o95hBtklGF/HDtY6oBT1ECH9NpGaQfRziXfpr7YzLTDI
	yfTLU3pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSxKM-00FVrp-LP; Tue, 30 Aug 2022 09:14:34 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSxJy-00FVbU-Q3
	for linux-mediatek@lists.infradead.org; Tue, 30 Aug 2022 09:14:14 +0000
Received: by mail-lj1-x233.google.com with SMTP id q16so10652068ljp.8
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Aug 2022 02:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=Id/5R3SN5Vasbdfkyu32JE/b1ZpOrfARzpy5Arox7pY=;
        b=x3Z1WUVhu4xg47PIApO+cX+zwhRzwA+njtOgqoSildHAIg08K/nVqB9X9BHRkev87C
         PoxejF0zgcYiy1vMP3I0uLUV7+Pyj+s6ICl1MdsT0rbizM9e3WRD1rgK/Zv5K2GQmZjq
         xxM6djO+rM6ZCXgJWP/gYiG1XXYJrnov9mBz2OtnCYg2mRtx1OtEu9iMT1o/4F4S/4rl
         ye2fYgO250MKcrqenhfd07rN+i+GxOWaqMEICpRAAJNBPw5y90UwVGwFdNVEkMpEzPMx
         zBRqq4fxGJFvt/m6OrprCAnux4xNRkQOzj/MGit0tLIrn2viN9abqhmUhIZIn11wP2gM
         o1EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=Id/5R3SN5Vasbdfkyu32JE/b1ZpOrfARzpy5Arox7pY=;
        b=moG2qHWbxZqqJze5k1Jt/6InuA/qzFnhv7x+rUVXuhJXwDae9wdaHPwIXdvfpnOTfX
         PjWcbIb9v5D9R8+i4Vwq978LRX7V62hut3vZ+jKyaG3n15PhXeO6fhNAjU5jm4NaarZb
         ZGIqNNpp9npGqSIRi2FSTZZeU27jlIsHEdd8K33ZC3YQnd7IEaoc3bI0RuclDop3VJJr
         sa5J5EOvpR2Wx+Xo+AhTz4bzXhRp4EEsTha2h4xU2LLeFwxNVyOYCTFSmFB7xHwW6JBp
         YUDzv/8DnIcYnF5Ve67F+KBadSapiXlpnrXqJBd4dMV1qjFZceAvo8ojadPG1koQP5EP
         ICqA==
X-Gm-Message-State: ACgBeo25rFK2lJo4as13JwcGJOQifLguFVdqgo+bvwm0MGqrJ/PiohJd
	CHXWWNyRJkMkZJyhnz2jgmF0ig==
X-Google-Smtp-Source: AA6agR7oE93NC6EWXvqYn7rZxHpQ4vfMbRipa3YWZuHHRuE6y7fwDMunhCl6aZf9PcaDGYKkB94LKw==
X-Received: by 2002:a2e:be9e:0:b0:261:b228:ed8b with SMTP id a30-20020a2ebe9e000000b00261b228ed8bmr6589653ljr.226.1661850848523;
        Tue, 30 Aug 2022 02:14:08 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id s8-20020a195e08000000b00492dadd8143sm484862lfb.168.2022.08.30.02.14.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 02:14:07 -0700 (PDT)
Message-ID: <bf2b277e-8b02-6a44-e463-6b7c4a697ce7@linaro.org>
Date: Tue, 30 Aug 2022 12:14:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 3/3] arm64: dts: Modify gamma compatible for mt8195
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "zheng-yan.chen" <zheng-yan.chen@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220830063929.13390-1-zheng-yan.chen@mediatek.com>
 <20220830063929.13390-4-zheng-yan.chen@mediatek.com>
 <a209aea3-bf23-4670-91d0-e7f41ac57833@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <a209aea3-bf23-4670-91d0-e7f41ac57833@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_021411_030923_52E87987 
X-CRM114-Status: UNSURE (   8.16  )
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

On 30/08/2022 10:49, AngeloGioacchino Del Regno wrote:
> Il 30/08/22 08:39, zheng-yan.chen ha scritto:
>> Modify gamma compatible for mt8195.
>>
>> Fixes: 16590e634f1d ("arm64: dts: mt8195: Add display node for vdosys0")
>> Signed-off-by: zheng-yan.chen <zheng-yan.chen@mediatek.com>
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Please also perform review on the commit msg and backport status.

Best regards,
Krzysztof

