Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 243A3C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jul 2022 13:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IXccb145xbl9bZhb8fRE6pZvNgKdIysmieigHeIfmZo=; b=cmwonwevfufYcmGWrH6HhJ8WW+
	E4k70I/8+zwBSdhWM2mavDGdDlX8ytpPXF4xhewK2HQfWUXd8QfeLV1rdO1xxeuxZLrrk+aufPiHM
	FNAznVi2al5GDIsQGSzOU15geaSYngqUA5tZNj4FyU5XOmHjOPf7AQpLw3lp/y6INdVRmANZMj74O
	AmafdDA7gvW+pwJ4jTqRoQIyIyZjHUuj7NER7Otk5ip23xdCSwsu4VTEFM9MmRPrnlCU4aK0EAg+s
	YRBXKdt+0jHEtlW6vAUQdr2O3x/jtjNN8cFn+/W5NDaD7lMYwKn4ujt3mvUx892glnf9LVmJa0WBA
	9D+7hJpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBFyh-00BMG8-Dz; Tue, 12 Jul 2022 13:31:03 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBFyf-00BMFH-AP
	for linux-mediatek@lists.infradead.org; Tue, 12 Jul 2022 13:31:02 +0000
Received: by mail-lf1-x129.google.com with SMTP id t1so10416519lft.8
        for <linux-mediatek@lists.infradead.org>; Tue, 12 Jul 2022 06:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=IXccb145xbl9bZhb8fRE6pZvNgKdIysmieigHeIfmZo=;
        b=K+cxKClQT+nal2Ss/wSUwNnUruBN00qnV6lGjcHmhKsfL4g1trgVLYIAwWkJpMJ/jb
         I9RHCUfxN8RN+wqPu13MlDp9p7p5OiQEUDOMS17jHgLTjcPzOsAdINmszGICLTYx8AAs
         9e0onp1pHq69byA37r+scqmt8RukZqPUKFKZnWnxJQzum0Od/eSryRJJXsCxQgHVqaw+
         93IzQQENvGMVzpffb3bJvK5bMi376UDDnc9zd9cwUl/TZKfQtBLpuElEoqjhtY0TMw4y
         riWZusM8mkxeEwWhdZU9qVrfTF3tDXJO80PH5xBUvDe2cz2EKARRLCeNre0yFkZBvPHZ
         MlEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=IXccb145xbl9bZhb8fRE6pZvNgKdIysmieigHeIfmZo=;
        b=YnxTTU+g41ZQ7m225cAKAuHbwXs4yI+w4OUbNFoJvEg64qF6WF42MvJuBODGUXzShT
         bWEyWrhMykrEFSdHWl6Hdjk9j2sMeOoxUbAT2dAVVv9cyBjQCvPNTRVcmSBc8HlI/l34
         S7+vJMoixVSDavqyr9kFVPPCLvDWZLpxpMZdy5kJusCgefECuruMojgGVWv4aYSFRzk3
         2icl3ATjZ+NQ9p/gh07YJ55Siu/HuKnjbISr2Fz56WpljjeUerUQsSyCZtdn7PbOhHdt
         2zasJ7/RM0kEuEFZjYlZtqZWZ1nQZM1xJ02gXIajltDZVvHtPtvVInjKKjGmZ13YCCeU
         rb4A==
X-Gm-Message-State: AJIora984DoqMrH5gUw9xTDOMJND29erRE+TkT7C8I8rhOrMN1WNo1Ga
	Bo8RfivGfiI1Ku+jI4N2cbNZUg==
X-Google-Smtp-Source: AGRyM1vMk2is/L2k4CTCicsaSu7ob3Bblj9cJOjz7rVfS0kLH+Eqq7Q53d+A5Jqs36ZWxIETg1pngQ==
X-Received: by 2002:a05:6512:1381:b0:489:cd0b:3a03 with SMTP id p1-20020a056512138100b00489cd0b3a03mr10959222lfa.583.1657632659774;
        Tue, 12 Jul 2022 06:30:59 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id f19-20020ac25333000000b00478fe690207sm2180771lfh.286.2022.07.12.06.30.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 06:30:59 -0700 (PDT)
Message-ID: <f7eee4e8-05fa-4c83-9168-64e5ea4c510f@linaro.org>
Date: Tue, 12 Jul 2022 15:30:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 08/16] arm64: dts: mt8195: Add power domains controller
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>
Cc: iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220704100028.19932-1-tinghan.shen@mediatek.com>
 <20220704100028.19932-9-tinghan.shen@mediatek.com>
 <3b65405d-167f-a0c7-d15e-5da6f08d99b3@linaro.org>
 <eec6aee5cd023fff6d986882db0330e1ab85a59d.camel@mediatek.com>
 <0301ebc6-1222-e813-f237-f14ad8444940@linaro.org>
 <b6523c64-dfe2-13b0-db60-fb4f53ed1e31@collabora.com>
 <1eb212ea-c5a9-b06f-606f-1271ac52adf9@linaro.org>
 <c243bc9c-0862-450d-6bff-00ec5591e791@collabora.com>
 <d8bc3b20-45db-a869-2aff-9cda8e0fca92@linaro.org>
 <83162e4f-a31f-79cf-ba01-58b45fd4f62e@collabora.com>
 <410cf9aa-471b-644c-9540-9bc0b89b8fd9@linaro.org>
 <0ca0e46d-0685-8228-4d26-c6cf20d7a9fc@collabora.com>
 <4795d9a8-3a57-ffe5-c0e5-9877860f5107@linaro.org>
 <4810356c-29bb-7732-c180-943c5a41b49a@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <4810356c-29bb-7732-c180-943c5a41b49a@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_063101_429766_27155F34 
X-CRM114-Status: UNSURE (   9.05  )
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

On 12/07/2022 15:03, AngeloGioacchino Del Regno wrote:
>> and you keep telling me that it is a power domain provider and MFD and
>> something more.
>>
>> Anyway neither syscon nor simple-mfd can be without specific compatible.
>>
> 
> I believe, at this point, that adding a compatible like "mediatek,scpsys" in
> mfd/syscon.yaml should do?

Yes. Or dedicated file, like other mediatek syscons.


Best regards,
Krzysztof

