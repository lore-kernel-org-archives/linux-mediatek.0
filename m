Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B209FC43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jun 2022 14:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AXQQabnUzi2nqUuzG0siGrivaHWjQI5utqZ7hUmJ/88=; b=uBU+wVtbEEc1Na
	8LEJEJx5K/O88LlGciUO9zOc2lNcnobCL1KpCFr1LwBkk1KdbbyByxAljveSB4TVAZrJaZ011u+be
	qIq3AMgngNu7FXaG8iXqTBhBy63WMYrU2y6zOyqx8CtT4ZQjk0deEEwhyoUtXznxZzxW0CIKuOHj2
	SVZR2btNg4Z/8SUSQAclJaOhLh9x44Yqf/Y4k9YUZXYjKqzVF/d3ACpCvVL8uy2svWtXjzRa6y+zZ
	Td6ihnroiUxrHH2nUAoWNO3ZgC6ZovXcbPM2ZcQkQ3me7JMaOazhCBBcYl2GebltRX6XCSwF8/T2Y
	W1eUrBctbKMRVWGdzzhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwlnf-003Ywh-5K; Thu, 02 Jun 2022 14:27:47 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwlnc-003YvQ-M8; Thu, 02 Jun 2022 14:27:46 +0000
Received: by mail-wr1-x42a.google.com with SMTP id u8so2352849wrm.13;
        Thu, 02 Jun 2022 07:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=PU8lc3rqUKJ9fwYFMxTWZiWtxbKl/aHmbF7KgXVxdw8=;
        b=nTCCpeSYwfMZY+4KPdvMlazL72pUA9cf31ff5VpnywSiVU9k5w5t458nw6elFguljg
         OyVTJ6tj4p5kxFAUAVicDk6q903TOeCzEEX7UqisGtUPG8ui4J274meFJKWGwWzRorv5
         h5Y/xMsiRDKaMFfBWbUE9FlqYBqmZC0lnC6o170UwiLmvD1F4cIwmf7q6WKP+ypzmGfO
         fpHzIbIvQPob9eBzeY3t0iu0sV9vuWV98dAV+9s35Y3YBfLr2FiMHs3dQHaWnTqKjxYZ
         HtUvhV7aVJm+ZxGEJfifkYjdHnZJFL+muk90bFTjaLFdQ1KGsobxK1HtczYZDzorbLox
         rnCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=PU8lc3rqUKJ9fwYFMxTWZiWtxbKl/aHmbF7KgXVxdw8=;
        b=Q/Evj9Xafz/vtmMwbbu7P82j7bXvxYCLXhyho6iVTc8W9lYN4/tojFhkigu3MO2Ahl
         EKJvXgKoXjSOHfR/US5WCSNsk7Oaaiimrhb9+1fpbaxBc6f5hJSKpfQJm+kZvwzat2pA
         7fqjvQy+9zUxKIEmzG5wZ5BHVUkKEXh55iGz1RHYUjp55COuRk0kSH/JJEihyd1ustjj
         9ri1/Mt5eZOvYeuV6B2wZH+2nyUMhgULUbEGFkDLJ5o0QuvzahTRgWnToZkhlJz706fE
         5p/Fqdjhr6bhdWIgKl3dqeng3Ik/VMzvQ5xV2a1juSREVFsJ64S+nPL+hlWvk4AhG8jc
         CJtA==
X-Gm-Message-State: AOAM533jMVNSqfFo7gmRq3LhFEsXTASeag32Zz/tpXoo+ESu+WGCXMd4
	E9uu1ucX2ZdFrQVKSfSL40M=
X-Google-Smtp-Source: ABdhPJwjC4sOY/AU32uEMgLGNEAI19FhBPDUP9arLJ7oiFGKBMRXEJZ7V09GeOEGnuHwTIckNIWbKQ==
X-Received: by 2002:a5d:5885:0:b0:20f:f390:c47e with SMTP id n5-20020a5d5885000000b0020ff390c47emr3997562wrf.133.1654180061203;
        Thu, 02 Jun 2022 07:27:41 -0700 (PDT)
Received: from [10.40.36.42] ([193.52.24.5])
        by smtp.gmail.com with ESMTPSA id ay1-20020a5d6f01000000b0020fee88d0f2sm5954781wrb.0.2022.06.02.07.27.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jun 2022 07:27:38 -0700 (PDT)
Message-ID: <c5022150-a2b4-07b9-d8ec-789147134d85@gmail.com>
Date: Thu, 2 Jun 2022 16:27:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 0/3] Support MediaTek devapc for MT8186
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 runyang.chen@mediatek.com, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220504115501.3490-1-rex-bc.chen@mediatek.com>
 <CAGXv+5E9s3c0j501fHZxhwsHSeK0vG+GEqLMhtZMvtvC=+etjQ@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <CAGXv+5E9s3c0j501fHZxhwsHSeK0vG+GEqLMhtZMvtvC=+etjQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220602_072744_792028_D12D17B6 
X-CRM114-Status: GOOD (  15.95  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 02/06/2022 09:48, Chen-Yu Tsai wrote:
> On Wed, May 4, 2022 at 7:55 PM Rex-BC Chen <rex-bc.chen@mediatek.com> wrote:
>>
>> This series is for supporting devapc implementation in MT8186.
>>
>> V2:
>> - Add a patch to separate register offsets from mtk_devapc_data.
>>
>> V1:
>> - Add dt-binding and add devapc data for MT8186.
>>
>> Rex-BC Chen (3):
>>    dt-bindings: soc: mediatek: devapc: Add bindings for MT8186
>>    soc: mediatek: devapc: Separate register offsets from mtk_devapc_data
>>    soc: mediatek: devapc: Add support for MT8186
> 
> Applied this on next-20220602 (with a few fixes for other section mismatch
> errors), booted and got:
> 
> [    1.948483] mtk-devapc 10207000.devapc: Read Violation
> [    1.948488] mtk-devapc 10207000.devapc: Bus ID:0x100, Dom ID:0x0,
> Vio Addr:0x13000000
> [    1.948520] mtk-devapc 10207000.devapc: Read Violation
> [    1.948523] mtk-devapc 10207000.devapc: Bus ID:0x200, Dom ID:0x0,
> Vio Addr:0x140001a0
> [    1.948537] mtk-devapc 10207000.devapc: Read Violation
> [    1.948540] mtk-devapc 10207000.devapc: Bus ID:0x200, Dom ID:0x0,
> Vio Addr:0x140001a0
> [    1.948555] mtk-devapc 10207000.devapc: Read Violation
> [    1.948558] mtk-devapc 10207000.devapc: Bus ID:0x200, Dom ID:0x0,
> Vio Addr:0x14000100
> [    1.948573] mtk-devapc 10207000.devapc: Read Violation
> [    1.948576] mtk-devapc 10207000.devapc: Bus ID:0x200, Dom ID:0x0,
> Vio Addr:0x14000100
> [    1.948590] mtk-devapc 10207000.devapc: Read Violation
> [    1.948593] mtk-devapc 10207000.devapc: Bus ID:0x200, Dom ID:0x0,
> Vio Addr:0x14000100
> [    1.948607] mtk-devapc 10207000.devapc: Read Violation
> [    1.948610] mtk-devapc 10207000.devapc: Bus ID:0x200, Dom ID:0x0,
> Vio Addr:0x14000100
> [    1.948624] mtk-devapc 10207000.devapc: Read Violation
> [    1.948627] mtk-devapc 10207000.devapc: Bus ID:0x200, Dom ID:0x0,
> Vio Addr:0x14000100
> 
> during the boot process. So I think this works well. Manually reading a
> known secure address also triggers it:
> 
> root@hayato:~# busybox devmem 0x1000e000
> 0x00000000
> [  135.069121] mtk-devapc 10207000.devapc: Read Violation
> [  135.069132] mtk-devapc 10207000.devapc: Bus ID:0x482, Dom ID:0x0,
> Vio Addr:0x1000e000
> 
> So,
> 
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> 

Whole series applied to v5.19-next/soc

> BTW, looks like MT8186 support in mainline is shaping up real good.
> SCP firmware is still missing, so video codec stuff won't work.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
