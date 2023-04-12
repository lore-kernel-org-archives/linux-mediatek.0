Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 129A7C77B6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 13:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hxbSg03sNJ6CHBcwBXEqQmDmhcD81dI/Z44z6aEkv9E=; b=wXOKbGYZci8tRV3C4t03rkO93Y
	XF3RTivtbX65G9RWip7B5vWWUuGn/EkYWHZQdsKbOEgQw2FdJbugtHAf+4okLEeT6wjZJ8uvxWTP0
	9KZOadNWd9NYhJYk5L2hoULprtLbUvkMI508Es/5rOPDZ7J6XF1+XuIYct5yHSeYawbEJ9dm4ufW7
	I96Sm/FZP0ay6QJ1S715T3A69doc52N8jAu0FLSiCcwenRW7hdUZ7KoI29uy5CuoiIrWi3a2xHLUt
	iQ7lj43enLnBrEcTdYFnKyB53sY3g0QjPGQY/3Eys7bd+N+yc0WOkiqeJoZUW1hpIOlCd7r6iLtf5
	KzqSAhXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmaIU-003IHw-14;
	Wed, 12 Apr 2023 13:14:02 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmaIR-003IF5-19
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Apr 2023 13:14:00 +0000
Received: by mail-wm1-x32b.google.com with SMTP id l26-20020a05600c1d1a00b003edd24054e0so8020103wms.4
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Apr 2023 06:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1681305238; x=1683897238;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hxbSg03sNJ6CHBcwBXEqQmDmhcD81dI/Z44z6aEkv9E=;
        b=iqlCaO5Meyq2KhSfObg54+ntFwmYyox7N0vs4ZwWfI0b8iXJr0zQjqeXgKZzI53SNP
         H31oK0eqoOHMwt+5dGPEyyfyj5cCrmT5nybL0zAhK41cdxm7B3v4igvA4k5lkuqtJTW9
         YOk64/8nobsuhdmuQNuTaGP9MgpNq48Y5POxZ1YyebohKwSsby8TdHV0GlDBEww3LEh0
         2eUjyyHh4WW4Z8X5/MZhtfQE/wqsOnwifvlJjM0Xg519oHxY4uFIG921zK58kcuajP3z
         gKHR1kDoH1eyRYuywA/OWUs1WJekpIDISpjEIxG8O9cEx1CttcP/zZFWWWJCQnmYiTzu
         Lgtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681305238; x=1683897238;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hxbSg03sNJ6CHBcwBXEqQmDmhcD81dI/Z44z6aEkv9E=;
        b=VjrCoQpk0VOJdy8GtP1ORtfly9nzVeNMQhucw3ZeCAGighoyzRH81FnNA4u5zRcGmb
         dUN6GXFurTIHhtbynhgydJjIs+RIOblgstOTqRRfjv26FmQoPYcVUX6EfZYzZRnkKwsF
         LCupdZbDRhAcgUMp5P0YAo/ZobvBC5XZqyZwxAnNwnU8JIvjbYsRgXDODlCIpcLJ8qg3
         VOy/6t8uNTU8eKgrL5MbEO75nEa2Pr/WYKCl0bCYzzDYqZdZ0pi24o2xhgZ/cWFjGEeW
         1kkBbYAuO70YzjeLRZ5byiGoNWJTaf9RBjEVMq1EUWcesYQdhk0Ab7pFK4oUKoqsHVhC
         qgEg==
X-Gm-Message-State: AAQBX9e44Lm9DJ+7OOvdgdB45Wb6f2RGKkjciItas9FQyFWQievXRY+U
	dHHSKH+6d2D1Qv0pyFF72yvrKQ==
X-Google-Smtp-Source: AKy350ZNRAG/3MPGjxbC9J3m06khEHCcasXR6FH61xJ832WlKtAzUSM52+gCptxIy0mOHHJs36cd2w==
X-Received: by 2002:a05:600c:2316:b0:3ea:f75d:4626 with SMTP id 22-20020a05600c231600b003eaf75d4626mr4566131wmo.38.1681305237744;
        Wed, 12 Apr 2023 06:13:57 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id u25-20020a05600c211900b003f09fe8312csm1351510wml.20.2023.04.12.06.13.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 06:13:57 -0700 (PDT)
Message-ID: <abc4c188-0ba8-8104-2c1f-39865f01353a@baylibre.com>
Date: Wed, 12 Apr 2023 15:13:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 03/27] dt-bindings: display: mediatek: dpi: Add compatible
 for MediaTek MT6795
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 matthias.bgg@gmail.com
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 jassisinghbrar@gmail.com, chunfeng.yun@mediatek.com, vkoul@kernel.org,
 kishon@kernel.org, thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
 chunkuang.hu@kernel.org, ck.hu@mediatek.com, jitao.shi@mediatek.com,
 xinlei.lee@mediatek.com, houlong.wei@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-pwm@vger.kernel.org, kernel@collabora.com,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-4-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230412112739.160376-4-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_061359_411442_4851C0C7 
X-CRM114-Status: UNSURE (   6.67  )
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

On 12/04/2023 13:27, AngeloGioacchino Del Regno wrote:
> Add a compatible string for the MediaTek Helio X10 MT6795 SoC, using
> the same parameters as MT8183.
> 
> Signed-off-by: AngeloGioacchino Del Regno<angelogioacchino.delregno@collabora.com>

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre


