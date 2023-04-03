Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D8FEC76188
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Apr 2023 20:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vy6stLO/SvxfwXBcW4hNhQWrO4hr3q50cVzPyJ7ePCg=; b=yTZG6UqE8dDB8iCNPdfG9bBtxO
	ElFCs+mRNsqVT47Lpf+cjCAm2pcsKEMNcK/IA5hepygAFFBkImi9eT6c0CA1RohSOlj2fU9StqmjF
	+A1gt3cNMUYPvfpKZ3el8rDNeFYqmCBdN4becGMfJE+l79xh/6ONI8+udi83Z/InXfDukXgKu2Znv
	+VmOyGdlArLlr3uAepPVuP+SSiUmc72ZGWrNJpPKSKTQ9Dg8oXU85sJdWCerqrrL1Arle3ki8aV5+
	j8J946peZzJOfylmvzNXs++iobJ5Ck5Dyax5ZpPTYA8uH8+tkOIWZoM5hagTxdRKycVbrewMObiFe
	x2YrqVog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjQv6-00GfNK-1z;
	Mon, 03 Apr 2023 20:36:52 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjQv2-00GfIu-0N;
	Mon, 03 Apr 2023 20:36:49 +0000
Received: by mail-ed1-x52d.google.com with SMTP id eg48so122204032edb.13;
        Mon, 03 Apr 2023 13:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680554202; x=1683146202;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vy6stLO/SvxfwXBcW4hNhQWrO4hr3q50cVzPyJ7ePCg=;
        b=VQvTxb4s4x3bbD5Z8pANMfZBt/tWdtGTFLjlcUO5vq99065tQltoVAoAGqWsIPjW64
         SKISUVrjdnzODaHIJFriC6qtAHslbkjCaaFdjo3jKhe0eLIiYNIk4woDDMrdLvMOJviN
         LJRWqeQZZMyzoYTQUNHVxOGf9PNNRvcZIqNZDWH6lQNmNkEUWkCdlbPj8H8ZZbE0EmvF
         KSPyqaCbmoJj+Ap4Av7wNpIOkL3fNGkmeTTxiWDFCmpu04ok6ZUh7QhK06zaFOzNlqC4
         b3a6uAzOdflcXzRPqllKfr+BRx9vCY5fXKDXspX9BMZwdkQCc61WrI+AdxPXl4Eh8lxF
         BQcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680554202; x=1683146202;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vy6stLO/SvxfwXBcW4hNhQWrO4hr3q50cVzPyJ7ePCg=;
        b=sTHOLpi/XjnlCB5nk+Tm5kqPW1Af3fUd6WlTdbJd8/d8M/m8woQV4UVJyR7Pwgi0La
         ImHA5xidHei9h2wkpdxUID+qig2LoOjyKB7ZDZA7pUI9e2tUm+tTZ3BB5OgqL/L4G14Q
         RoqLLY+/JEAngShaQPHMlGFltJIDoP6CeCYntky84qwEg9WXlimWqy9+tGfPNo4SQQis
         PbkN0dtL2goqZ9sUdF0zFAiVS4CQi1avotCB80eksmfidzOXbt4xJc2YyMAnYIExiweu
         zf4Ff7CgltygjJ39uUILJ1EkWrhboRtOQbB2hA2GVWlX4sQZaXHp8FHnwy6OW0mX/UvB
         tdEQ==
X-Gm-Message-State: AAQBX9doPpvWlflu5rumAbECCH+Hq0x3i6en0uR8flXp3m7Ew7LVX8uh
	zbg7Qg2dU1LP9p+wHa31lR8=
X-Google-Smtp-Source: AKy350alhAis2kESvJD9XmrmapRbgNzvxiwQRz0GqYYyoszFrunpcb89uovyfWfpTiMCkE0hsYCTjg==
X-Received: by 2002:a17:906:2b8d:b0:948:ce3e:8660 with SMTP id m13-20020a1709062b8d00b00948ce3e8660mr2010760ejg.53.1680554202117;
        Mon, 03 Apr 2023 13:36:42 -0700 (PDT)
Received: from [192.168.1.45] (hst-221-114.medicom.bg. [84.238.221.114])
        by smtp.gmail.com with ESMTPSA id ay20-20020a170906d29400b00928de86245fsm4965942ejb.135.2023.04.03.13.36.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 13:36:41 -0700 (PDT)
Message-ID: <eeb3a625-0af5-9009-9e75-a89938089a8f@gmail.com>
Date: Mon, 3 Apr 2023 23:36:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] media: dt-bindings: Drop unneeded quotes
Content-Language: en-US, bg-BG
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Rob Herring <robh@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Joe Tessler <jrt@google.com>, Dongchun Zhu <dongchun.zhu@mediatek.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>, Heiko Stuebner
 <heiko@sntech.de>, Benoit Parrot <bparrot@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20230320233944.2920964-1-robh@kernel.org>
 <ZCaoVwRuxVOTZdI4@valkosipuli.retiisi.eu>
 <36febd82-85b2-aa4d-c7e0-6343b119e0cc@gmail.com>
 <ZCsnYGMkV2Zrw3fJ@valkosipuli.retiisi.eu>
From: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
In-Reply-To: <ZCsnYGMkV2Zrw3fJ@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_133648_154449_784BD9AE 
X-CRM114-Status: GOOD (  17.77  )
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

Hi Sakari,

On 3.04.23 г. 22:22 ч., Sakari Ailus wrote:
> Hi Stan,
> 
> How are you doing?
> 
> On Mon, Apr 03, 2023 at 08:26:28PM +0300, Stanimir Varbanov wrote:
>> Hei Sakari,
>>
>> On 31.03.23 г. 12:31 ч., Sakari Ailus wrote:
>>> Hi Rob,
>>>
>>> On Mon, Mar 20, 2023 at 06:39:42PM -0500, Rob Herring wrote:
>>>> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
>>>> checking for this can be enabled in yamllint.
>>>>
>>>> Signed-off-by: Rob Herring <robh@kernel.org>
>>>
>>> This patch contains changes to Qualcomm bindings that have been already
>>> made by other patches by Krzysztof. I think these took some time to get
>>> merged to the media tree.
>>>
>>> I've dropped those, the result is here:
>>>
>>> <URL:https://git.linuxtv.org/sailus/media_tree.git/commit/?id=d75cae0884e80bba486f85e82b33a1dae3c9c976>
>>>
>>
>> Do you think it will fix this pull request failure?
>>
>> https://lore.kernel.org/all/20230329214310.2503484-1-jenkins@linuxtv.org/
> 
> Ah, it seems to be the same issue here.
> 
> The patch has been merged via my tree, whereas the rest of the patchset was
> apparently merged by Hans earlier on.
> 
> <URL:https://patchwork.linuxtv.org/project/linux-media/list/?series=9531&submitter=&state=*&q=&archive=&delegate=>
> 

Thank you. I understand what is going on, now :)

I will drop Krzysztof's patchset from Venus pull request.

-- 
regards,
Stan

