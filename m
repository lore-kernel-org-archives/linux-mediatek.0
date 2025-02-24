Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB5D5C021A4
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Feb 2025 14:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+7myiS5YDjg48/Ag8fwVJzAPYwjPP2oihtGPggfyt3U=; b=2nKPPM9pFZ5UqqSCj18mQIsC6/
	/sgrVzYyFPUGd9jKifikk2H8XonPmfVia2VmkIVRgxRnirPSAT17kCnrN1DNjeztHYPY/RcgF8W9L
	/pJb3SGX926V4kCDMe0yha3GXuNY6xqckbYPW4yWiZ+1JcQ1XPU6xwBe2BenCOiofV5a4TDHpTrgo
	UbwL41p0fr2Ca7BvmZQDe1VAkuMiU5OI6HTEU58MrFDOvGyUTF9T6XK4wdwc02A1Dw/OyCFzEsMu0
	cK/DoxUhZxllWPy0/w4FiLy7oopvRXQt6K1a5zE2xnpCRWN0kSqTqhyrTLWKyvTF63h6Pt68qmqS0
	y8nFvg4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmZll-0000000EAcI-3mG6;
	Mon, 24 Feb 2025 14:49:17 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmZRo-0000000E647-019Q
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Feb 2025 14:28:42 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-38f488f3161so2426813f8f.3
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Feb 2025 06:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1740407318; x=1741012118; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+7myiS5YDjg48/Ag8fwVJzAPYwjPP2oihtGPggfyt3U=;
        b=J5VQQKhtRC/felsB8meQV5HBJuHHbg3FYIl9X4AgXN4YbSPsGh6s6pQSuk4LY0N5kz
         lcsyQb64AqCoESxztpdoDoPbTI9mPC3odLTKxLh5NSicnb7dEDHUXxKEH+nstmbFZ9Ld
         xAB9pywJ41U5hA9CoQku9jH2HGBBqBfkVM/eFw0Fw3qML5dEY1NXFIpmYJMX73TaJQ4g
         C/NmansEzsCVwiC4+HzfSe837N4zb2bD2wLlSn6bNr3ZxolVPepHVXNRz2afJiWSnkFp
         IrwplCK/uEMnT+phZXnV2moP97YkmuvfrLI5tjmONz8lXk4gTmSjwiBHhyo+fCJn95P9
         hPNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740407318; x=1741012118;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+7myiS5YDjg48/Ag8fwVJzAPYwjPP2oihtGPggfyt3U=;
        b=prwt80PWUwxQpwwXd40OIN3VaCBNuUsHBYHQti8kPUjRvkh96vbFJGKGgKUQE1dOEH
         C2QsOqT7t7u7DrMK6Fkf+PIXXfJNLj+wpnZbG6p+B5fMkwi6zTHJmMdBNP+kzTB/oxyG
         YABw6A4yENmK84rLZjlh7i+aUgjPSwFBlLU8EO6zeixN/RvSefVNsUe2UM2Kqa6mi31V
         YeXJD/BF0/X50q3iCdu+I6F0wPkU/fJCMP9REBX+WJCs5HCXEyKhV6geP+VDnXtxnoQT
         kLX4E8jgUsmbbG2Is2rDsxU7IvpuokKHs8OYbFSQWP3jT39IES8iSfOvjtPd86uX0W59
         OXqg==
X-Forwarded-Encrypted: i=1; AJvYcCXPGRa/UT309o86k4T2HvmOUCEMs1RZfxZMzmk9ZaZVJbRe68vBiJwR8WSz/NTOJSFQBeZxv247S1rpFyLM9A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0Iue8ZdCr3uLtoBp6bs16annKMpa9CYJbZ8xfDEfKh9/DGlWA
	Lg06uNgqvAs88dvl8Yju8tcikoqQes3tFbLUgnXzvTF2/A18uuWXCC+X8jRa7mU=
X-Gm-Gg: ASbGnctlZa8EygWy9jmyeT9j1k8cQbhJao9YSOnLlMzDdAtgH1KHiaKYRNaaKCkt/OE
	2CynQwogks4JyjBLZ/zvKT7kI184tW83ruErkI3huSG+2qUC2QpIi+ISxZNHtyzOxWkHET99mza
	VFaAkLLLD+P6/0ca3LESEiJoO71DxuEpM6JvN/9kcuc2MeyIO7o/wqLo4iI2OJRL80oREWj2ZCK
	cZi9KgvWQAbKvF6cIU/Ye+TZhabAU/wRagFw+lAw9ic7ox8OkKIbJo6Y/dTOAVvxKppu0xDt11e
	Xst835I5KFl9QR6yg8/h5CnLOgeDHy2y2nOeuAespqUYPhXSUKkXO/IZaBF0+HPeIXQLXC1T/Q=
	=
X-Google-Smtp-Source: AGHT+IFgTjY0B9Q+EBdWo53fKYf0MGWnVrcQoJfE4mJdhQbgBfmM6+4xRs286ajDlhlvB8MLPAk/3g==
X-Received: by 2002:a05:6000:4014:b0:38f:28a1:501e with SMTP id ffacd0b85a97d-38f70772b46mr10667747f8f.8.1740407317886;
        Mon, 24 Feb 2025 06:28:37 -0800 (PST)
Received: from ?IPV6:2a01:e0a:5ee:79d0:ce53:5813:dc8a:b123? ([2a01:e0a:5ee:79d0:ce53:5813:dc8a:b123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d9be9sm32217076f8f.79.2025.02.24.06.28.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 06:28:37 -0800 (PST)
Message-ID: <43d23c40-09bd-46ca-840f-4724a42946a6@baylibre.com>
Date: Mon, 24 Feb 2025 15:28:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] arm64: dts: mediatek: mt8395-genio-1200-evk: add
 support for TCPC port
To: Macpaul Lin <macpaul.lin@mediatek.com>,
 ChiYuan Huang <cy_huang@richtek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-usb@vger.kernel.org, Chris-qj chen <chris-qj.chen@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>,
 Yow-Shin Liou <yow-shin.liou@mediatek.com>,
 Simon Sun <simon.sun@yunjingtech.com>
References: <20250224114934.3583191-1-macpaul.lin@mediatek.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20250224114934.3583191-1-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_062840_232239_A56117C3 
X-CRM114-Status: UNSURE (   8.15  )
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

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 24/02/2025 12:49, Macpaul Lin wrote:
> From: Fabien Parent<fparent@baylibre.com>
> 
> Enable USB Type-C support on MediaTek MT8395 Genio 1200 EVK by adding
> configuration for TCPC Port, USB-C connector, MUX IT5205 and related
> settings.
> 
> Configure dual role switch capability, set up PD (Power Delivery) profiles,
> and establish endpoints for SS (SuperSpeed) and HS (HighSpeed) USB.
> 
> Update pinctrl configurations for U3 P0 VBus default pins and set dr_mode
> to "otg" for OTG (On-The-Go) mode operation.
> 
> Add ITE IT5205 (TYPEC MUX) under I2C2 bus and configure its properties;
> also add references and configurations to 'typec-mux' node.

-- 
Regards,
Alexandre

