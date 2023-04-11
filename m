Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B791C7619A
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Apr 2023 08:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=221+rJPVRmTBicTd5002DBEZ4voZcS37Ga3RcOPXh88=; b=w/NGo88h1aL3Q295frZxSK4nt4
	vhHc5OYcbnyKvC18mU+uwgTBZ90xrgvn39BIX1zTmOm9knMBpTwyqnGvnJq9ORbYVd5NHiqedQmKo
	G0kmvZ/aiCn2rWEgz+O2fMw06HN2H08QJA+YwHyQ0NioZwz3eS7WhFeCKLAjmrpkCqpvpxBjPkf+/
	JPT7nDC3b29isu0r48V6jZB93bNPcDzqQL2oKQ+jKQ50DpN8YDbxOWbd3HzNyqUJNmxjIw+hzptUq
	skz5NTgkLkPOsSzEN73UqdQHrYSHB+HOp+EnVx/w4ZbV62dFtBJS+psHY9GZ6qRGiGRDeIT8enKYx
	/gfoZyxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pm9PZ-00Gtrf-33;
	Tue, 11 Apr 2023 08:31:33 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pm9PU-00Gtmu-1h
	for linux-mediatek@lists.infradead.org;
	Tue, 11 Apr 2023 08:31:30 +0000
Received: by mail-wr1-x42b.google.com with SMTP id q29so6516043wrc.3
        for <linux-mediatek@lists.infradead.org>; Tue, 11 Apr 2023 01:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1681201886; x=1683793886;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=221+rJPVRmTBicTd5002DBEZ4voZcS37Ga3RcOPXh88=;
        b=0uN/cs3jya/FTvzSTyDnjUvs1o+XjEESTIuS+jlgfFdCDnY/fklJET+5dr4RyEtFuY
         /h7g1vfcxcN0ODtKhx+G4eCJOiPNCSNVEJg36G5u83eB+xJ/TCuISpRj0vbqvzzkUTW2
         3mvciNxV5LFTPE0eZnspSgllygfpe0g1dnDiFzKFjxik06T2TxBWf4RpPJo7X5XlFax9
         zeTXmgzWXHRYxpRcOdu4iLRzthG5OoR9ERKNz/TkZRi2RiHIL3A8ecxx+aHDPjw37VPD
         5zOx2Qfln6QpQffTr1Ql0YlMIZLo5RUWrKisGg/PXzt2DVy/1PvczE2xchdaBIcyL96p
         RePA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681201886; x=1683793886;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=221+rJPVRmTBicTd5002DBEZ4voZcS37Ga3RcOPXh88=;
        b=0ZsmDiVpC6YYKEI/o0T8SsoNV5im8QdZvv9Bbt5wIv22x99+ypFL18PIG4uvPDLO/F
         ccQtexMlbOFyK50grVDKnQKPNX9yxGqJ6Cqq23W42GKdH7S/M4BIYdwJBcnQrh14fpmX
         VOPz58ONbveg+Zb7S5TisoGroczjfOD95wFvhMjVSjL9CfgzzCKW5kea9+80SK75YqeZ
         meeFcSBNBbo/TOJZJgWjE9+HXsmaGlRJ07v6kc1ZZPmyXGWmNfyeYX97fGNnro3sO9QB
         YZsDsqnCswUe8qKfznpx9p8dxrYLpL4WQy7i6aRVaGoL2YJs4R8bcWaL1rtmBI2Z9HDZ
         dRLQ==
X-Gm-Message-State: AAQBX9fGLpE1LFt4hGOD7DgYLrSGKINPrlrqyN3fIqVYGrxfzmsZX5XX
	xmO3OpMeIpJqDKmmBi0JS+HBbw==
X-Google-Smtp-Source: AKy350ZVJglFgq9ztOFGuYcic4YegavmAar2H7r8LrUhlD9XQnlViWEJTMf+UJFFQclfvouAtDmnwg==
X-Received: by 2002:adf:f84f:0:b0:2ef:5066:7bd8 with SMTP id d15-20020adff84f000000b002ef50667bd8mr9648387wrq.43.1681201885845;
        Tue, 11 Apr 2023 01:31:25 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id d9-20020adfef89000000b002d2f0e23acbsm13963408wro.12.2023.04.11.01.31.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Apr 2023 01:31:25 -0700 (PDT)
Message-ID: <16cdc84a-a78b-0629-6c87-9056755b0dbf@baylibre.com>
Date: Tue, 11 Apr 2023 10:31:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 2/2] i2c: mediatek: add support for MT7981 SoC
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, linux-i2c@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Qii Wang <qii.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sam Shih <sam.shih@mediatek.com>
References: <cover.1680857025.git.daniel@makrotopia.org>
 <7b5c6ba8da51ea6145fb71815a2f65a9e1d341c1.1680857025.git.daniel@makrotopia.org>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <7b5c6ba8da51ea6145fb71815a2f65a9e1d341c1.1680857025.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_013128_580721_D0B0F66C 
X-CRM114-Status: UNSURE (   8.27  )
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

On 10/04/2023 18:19, Daniel Golle wrote:
> Add support for the I2C units found in the MediaTek MT7981 and MT7988
> SoCs. Just like other recent MediaTek I2C units that also uses v3
> register offsets (which differ from v2 only by OFFSET_SLAVE_ADDR being
> 0x94 instead of 0x4).

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

