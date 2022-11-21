Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C9E2C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 10:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=phJFVLoc9/POc6nbD0liFwrgYsKAiaNUs+VrsQZny0U=; b=4Z6BFYpyLfwbdUqR/VgIA8hUUA
	ZdLuMIe43Z9/y+5/ytvF2qoAP1SRKhkN8z4C5aba4ld1sEV0QCJlf2Bwexs5KIQAF2FCIrsK6eTO+
	XBrNOgcpMo3k2aCgTDGb2aVjFsbVVHypSIeOkcEcr84a27v2LqF6BcNQoYsTULVGjPcibwEYKszun
	PRc49vd6lP95wjffBipVdCVOKK0kbxrBF6U4PTduUn6M5EqMvxFeBxAJwYbvbuo8l9FeZ3QKAgTdR
	onS75z0kdTO/aAOb9C+FAwOVkBXsgs3PfV1a28X76ya3UpWLhZqG/SBiepMPDhJtBKHG86OFvhqGG
	RBSzcm7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox3rB-00CDNx-AC; Mon, 21 Nov 2022 10:16:53 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox3qy-00CD7O-JL; Mon, 21 Nov 2022 10:16:41 +0000
Received: by mail-lf1-x131.google.com with SMTP id d6so18087678lfs.10;
        Mon, 21 Nov 2022 02:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=phJFVLoc9/POc6nbD0liFwrgYsKAiaNUs+VrsQZny0U=;
        b=HMQtLNQC6JHUcpQnXKaMPeLJYNEXESjWqW9Jm9fxHdDsyxq3fD2y+gUbum8cazGLlS
         0Nzot0o7wlI3aHmX0JtEp59ASN04zoUP5cBLwhJUS8UWXS1vrDPK5s0nm6MtNyPRkAXr
         i9HRjhzMXJwfcX+oinAm/OP6xU5bC2NyVL00djub62igijCsqVS/+Gs3g8Ob67GV62e5
         lbpACEGBVz+P7gegvEedJPLtYc/UAuXuZCP3D6YMe70yXUQfK1oo2OuCbl17wDJsWOWJ
         juioZPmih2Q2tDZ+3ZlWsJUEwqpG6mEfuUGwVkFA5iKPxQNEPbzHK7gtA/8R8W2wDMdd
         a+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=phJFVLoc9/POc6nbD0liFwrgYsKAiaNUs+VrsQZny0U=;
        b=a2NxsPc8sf4eN8yF6RwLLMTcr9FegfuIOTjzWV7saa90S79Vad9zAUlY9462kWzxXH
         bt1wC01AREBN8zQzd+sxlKk4vej4+0QN1lz+PS1CS8/sgo3d03OTIVJ0bZRdMf+KJHNQ
         jXUfXH8JCuP4XcI2BxdJ5zsoWvAfJudp4YGf7BiWvKYSG03yhSE2nJlbi95GQFO9g3Uv
         qVlVmA82SPrlIwKXHKym1AhGGYmm6+mG6shyRnQUHoSQ8lrpyWYK93zIWbUFznyPj7SS
         yErRq2j92rs2+P9xy1T9IM6vJd6f3XysCTlxgUYBxeDDcIHfKvnjogcHNb5BGTTnbaki
         AGPA==
X-Gm-Message-State: ANoB5pn/m60KwyNPngPXJbusFvNPT8Abi7WmpBBzoERsmeJQ/BXJU1es
	u5CjORcLEa0P6uP0DEm6C1c=
X-Google-Smtp-Source: AA0mqf4ot1dRfz4XcQJOzbIEVDNmvoy9FxZf/F3Gx+j1WTmSwhOpMtvOjIltFzq0/t2LrM51x6qHTA==
X-Received: by 2002:a05:6512:2521:b0:4a4:5e83:e07d with SMTP id be33-20020a056512252100b004a45e83e07dmr1937785lfb.409.1669025797870;
        Mon, 21 Nov 2022 02:16:37 -0800 (PST)
Received: from [172.16.196.95] ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id e8-20020a05651236c800b004a03d5c2140sm1957388lfs.136.2022.11.21.02.16.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 02:16:36 -0800 (PST)
Message-ID: <20825b50-c2ef-7efb-efbf-ac00cc4ab9f4@gmail.com>
Date: Mon, 21 Nov 2022 12:16:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
From: Matti Vaittinen <mazziesaccount@gmail.com>
Subject: Re: [PATCH] dt-bindings: Add missing start and/or end of line regex
 anchors
To: Rob Herring <robh@kernel.org>, Ilia Lin <ilia.lin@kernel.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Yangtao Li <tiny.windzz@gmail.com>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang
 <jianjun.wang@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Javier Martinez Canillas <javier@dowhile0.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Maxime Ripard <mripard@kernel.org>,
 Daniel Mack <zonque@gmail.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-spi@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20221118223728.1721589-1-robh@kernel.org>
Content-Language: en-US
In-Reply-To: <20221118223728.1721589-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_021640_685451_EBA31603 
X-CRM114-Status: UNSURE (   9.87  )
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

On 11/19/22 00:37, Rob Herring wrote:
> json-schema patterns by default will match anywhere in a string, so
> typically we want at least the start or end anchored. Fix the obvious
> cases where the anchors were forgotten.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

>   .../devicetree/bindings/regulator/rohm,bd9576-regulator.yaml  | 2 +-

Acked-by: Matti Vaittinen <mazziesaccount@gmail.com>


-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~



