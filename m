Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EFA6C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Dec 2022 13:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NZKYMOZIKxtwI9C5Y2DsLl9mvShg/E7HjBCtUKagoFs=; b=sQumBFOr+uTKiaJDJWSD9qPECz
	fx0ttCkR9XD5YsRj7A6gf3WX3hV/OAjprz/7/EACkvY5kFfvLN6CRglda6LrVXt0E/828+hLD0FEV
	RDqOMiUpSCyonUAXaH+PBig+YKNHS30TAT9tdxEn3fV2oQAmKz01rPmXX2DKLjJd5I0YBjic9SgNe
	AeLsdkVpo1dnif3jKGl8WdWmo+QMxwN3U89p4aZ6kcyDY1brUFyv5Ia1raoQJ9SY4DahpuRrbYlWH
	0tdoAVFhgBeW7uEcuDE3SdJdwnkJ1r77gaGFik4Eiox2yeIycE1/drdPhXQl1gQVbV8JgfrlAFCZ0
	yuUGenVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8La6-00CNQ3-1z; Thu, 22 Dec 2022 13:25:54 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8KJM-00BfQD-Pk
	for linux-mediatek@lists.infradead.org; Thu, 22 Dec 2022 12:04:34 +0000
Received: by mail-lj1-x230.google.com with SMTP id g14so1658006ljh.10
        for <linux-mediatek@lists.infradead.org>; Thu, 22 Dec 2022 04:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NZKYMOZIKxtwI9C5Y2DsLl9mvShg/E7HjBCtUKagoFs=;
        b=NU/xJ/gqpRxcFPSTXASvHZNTQPQImqNO0nE1XWDSUjaRHX0J8bJai/8tQDYnflTr3h
         mDwlz1YH/Y9rUvFdqn5KvvivcDz/eE+tVUL2U086HVKo0+8Bty90EtnrbwBHA1ZP7Psi
         uIu+pMXg4XzR1XZpARdpCm8XkQi56jlu6uC4M0XJei7G0I5P9ucBVWHyIh2TtcUHFKkw
         i8TPm2VD40sEt+8b9lCYkavuHDU/x/gHGWDdypkP65F+NkP29O7e6OGJnO/2RKBeMQP9
         IFdJPzXo0BhEvBYkZudzNFXi4HBQVk6tj3OFWLPUItUfM1vrtWMLZ0+agIf6FB7nG27X
         vfjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NZKYMOZIKxtwI9C5Y2DsLl9mvShg/E7HjBCtUKagoFs=;
        b=5lICPlXX4xphpEoJM39efuxprgGfzb2u4Hv/WRO7wOnauOmBIYwvhFRpVOKn3V5QlO
         lBEDHWCTXmHf3b8pn4Pkah2vEkQ79B7rQfrJYaq9QC1gOH/xLKXntynAftdoZUMVdpym
         Z+NWThtLfWpAbAr2CdPxJ/GCtpdampyDNhyLrRphnxu2KgBXAU+HEB5QPNcpOj1ukWcT
         B4TCUiEKqhYMPA94Y30k2GLXAK+PRGFpLhsaxso24K1DAczvLNx8G4z5X/6I4yl4C2ia
         jYhujkcWZrYCr4TIubUIQ4IwV26+B2DgdSp3HfwtZoxQim9U2jAAnVEJkJ0Pa/KN4RdG
         BCFA==
X-Gm-Message-State: AFqh2kobW+x2pOtDiMkd8o6AKeI4RTZ5uCfT4sB7vsV29O4OQxrVlanj
	f398iel0qLTpgKqO7cmTnusfBA==
X-Google-Smtp-Source: AMrXdXsdaEtj4y1LKgPUfPuRDzm6FjbtRSzDQGmYrSdV99fosJd2YkpIi0ZnhHBqHX/WJacriLb3ew==
X-Received: by 2002:a2e:8652:0:b0:279:bd34:dcd7 with SMTP id i18-20020a2e8652000000b00279bd34dcd7mr1628383ljj.48.1671710669874;
        Thu, 22 Dec 2022 04:04:29 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id s2-20020a2eb622000000b00279e93c9c25sm30608ljn.29.2022.12.22.04.04.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Dec 2022 04:04:29 -0800 (PST)
Message-ID: <c675a104-7ae6-59e0-f73a-aae4ef0eb05c@linaro.org>
Date: Thu, 22 Dec 2022 13:04:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v1 1/3] dt-bindings: dsp: mediatek: Add mt8188 dsp
 compatible
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Chunxu Li <chunxu.li@mediatek.com>, Dan Carpenter <error27@gmail.com>,
 YC Hung <yc.hung@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20221222072150.10627-1-tinghan.shen@mediatek.com>
 <20221222072150.10627-2-tinghan.shen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221222072150.10627-2-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_040432_865136_E2A5639E 
X-CRM114-Status: UNSURE (   7.71  )
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

On 22/12/2022 08:21, Tinghan Shen wrote:
> Add support of the single-core HiFi5 audio DSP on MediaTek MT8188 SoC
> for pre- and post- audio processing.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


