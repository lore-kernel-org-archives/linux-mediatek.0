Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81742C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 13:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p++bIs2HneM4Mmo2YjeBS7JYAqLzkFDGH55M3o+NIxg=; b=BVdbuK++WQx7r1eA69w5qnM0dH
	B+QFipKw/jv5h2fhRbGztQE0eRRpZyE0pO1bYcazMFcV5MmwCGYY1aRmvbFvnS5FytVvrB37/7+pm
	KK6lttraN+5ZRUUq8N4eK3amlLktP0NDqiji/j/03kD8fv0yIHEwpa4qgbmaZX6oPOSkh3qF4pgv/
	gbNX0D9IYXCcheimTZK5zSGzsRRAUJBJrtlKx9pKVoayJ0P3fKjHvOwVgdpmwxORl/6dGBuTP26dn
	22MzNOXVLjpCwol23a1eDBpi3uNS177GES4MN1zzMOJNnq1b8nUxGEdgw7zKK0/LJW3dQzF+jMMuU
	Pc7tVeAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1q09-002eI5-Al; Thu, 16 Jun 2022 13:57:37 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1pyU-002dW1-Qq
	for linux-mediatek@lists.infradead.org; Thu, 16 Jun 2022 13:55:56 +0000
Received: by mail-pg1-x52a.google.com with SMTP id g186so1325441pgc.1
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Jun 2022 06:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=p++bIs2HneM4Mmo2YjeBS7JYAqLzkFDGH55M3o+NIxg=;
        b=BehuJv74CLjkgQwQW2YTJI7GYHpWAyt46Adp9YWqP2Ino810KUqBU3m1LAkJP2RoeF
         +eA+u8d7kVSzDosz5vq7VxcNcZTX5YfEAdbw3WwaqZk6zp6IGjSa69Y0nIzpcs7oQ7T1
         5P9k5mgEtdwx7+92E2Hd+8E/s1CExYyHRLZ7rC2g7YdASXXLLCb/7P762HZgHrjLA75R
         xG5TtUiW3VtMrQd6uFAmQG8Y4p1sUGlhBWUz7hIEqmjYZkezA6cSjVo4NTIG9NzxS6uo
         9KvtSOoyXEs4n5UZOYuuYOrIE0Y0joFHJlTY2q8mQG0IgbCAF5+0MpkutS140mIBOqqJ
         kXZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=p++bIs2HneM4Mmo2YjeBS7JYAqLzkFDGH55M3o+NIxg=;
        b=F44J3but25dv3Wa7z7pO+Ib7K0S7ymlPKBqFsj7HP6/PVPt+aVIYjqaPwcwPdKjcjj
         RI6EL9V1s42SQOqOAj9Cr9iPVFbCU85xOURPOwY57HhYnTj0ft8R3N0xZga1A+qA+12C
         QNmo4VU123wempd/vBdBZffkYABC45GhclvnM/Iy11QtsTwOg5solBE+eGxZXAx3BX3o
         xDSSYjtm3/4KV34YXmGsBWSol3h6f1Xj1uDFNvn9XPBc5fjP0imUb+6DCf2DFlmLeTyg
         MhpeC2GdfwAE+s5rKqQgw8EvU1mL6Y6MdU0vJuftLVCkhz1N8GWMirWUB9gkPMihseMV
         2fgg==
X-Gm-Message-State: AJIora+K7xd/Rqun4o7kX/C0QsCMMxVRBabBmAvVcFYIkJZMFjTgg5m7
	Fk/ueKkjk1uxKa/DNCj9KSuH+w==
X-Google-Smtp-Source: AGRyM1vXMhY+ZrUKaR7yePLi9tk4x6RLg+QaJ2jT5cqYNFanziG3iv5eJoN4umJFjqajEOEp+YtBpQ==
X-Received: by 2002:a63:356:0:b0:3fd:7477:63f0 with SMTP id 83-20020a630356000000b003fd747763f0mr4613366pgd.601.1655387752971;
        Thu, 16 Jun 2022 06:55:52 -0700 (PDT)
Received: from [172.20.0.255] ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id d2-20020a056a00198200b0051b9ecb53e6sm1773063pfl.105.2022.06.16.06.55.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jun 2022 06:55:52 -0700 (PDT)
Message-ID: <ea767ff8-9fa0-7a2f-af52-e0d05adafb03@linaro.org>
Date: Thu, 16 Jun 2022 06:55:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 3/4] dt-bindings: dsp: mediatek: Add mt8186 dsp
 document
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
 YC Hung <yc.hung@mediatek.com>, Curtis Malainey <cujomalainey@chromium.org>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220616073042.13229-1-tinghan.shen@mediatek.com>
 <20220616073042.13229-4-tinghan.shen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220616073042.13229-4-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_065554_945295_9F198B74 
X-CRM114-Status: UNSURE (   9.15  )
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

On 16/06/2022 00:30, Tinghan Shen wrote:
> This patch adds mt8186 dsp document. The dsp is used for Sound Open
> Firmware driver node. It includes registers, clocks, memory regions,
> and mailbox for dsp.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

