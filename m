Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6AA7C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 May 2022 08:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UwH5Q4oG9mlvBO/vHzotlmX5V/YdVAjGqBmIsdhXYLY=; b=YoJB3PbdDIwjDY
	OMTNx+N5c5pRLZyKfsliigsRkEZfrI8k1kxnZ1gZj8vvJygxY/Yt5nCy8CKlmsIvchSrhbe4u1T3n
	nePOYfK8KWi1BDRPS+NaQGDzr4B/5JEgE0eP4thGBjh30plPQ2R9HV1eUrSIwWThGpuqNujH88AxT
	SsW1HN7Us2eogR8bpNwpbkVHTcvdlgIrPd7K+z3vbL+N076KAnZk0hWSNCpeCxU7uf3aPS3CCbe5r
	MrixN9o0DNT8FlCFlHwM1EOr9Xva5oZRipKA+07U7iPM9V6NZG9byuuiv2Nr8V5K34M2WtKN14qmI
	KmTlqhep6trluWF8gWxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npQiK-00F59t-0Z; Fri, 13 May 2022 08:31:56 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npQi6-00F53i-Gx
 for linux-mediatek@lists.infradead.org; Fri, 13 May 2022 08:31:43 +0000
Received: by mail-ej1-x631.google.com with SMTP id kq17so14822456ejb.4
 for <linux-mediatek@lists.infradead.org>; Fri, 13 May 2022 01:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=TNsY3qFCwXQblJPsVdG0LCyrHmw8JZ3ev2jxwT+LE+k=;
 b=UmoVPN2ActdAg0q/sV9x+QJ52g/PRzhZYttsOVqZVE9TDTLQCLgWe93efuunDeoxjT
 JKwn69yqazKwiIaopRnbqE/8GHCsx9Kv3ntH8qnhKygS8mJ14jDjtAMFSBOuwvQoa9Ct
 YaPjpGSl6DdFPek+/OyRhTvuFBMcBwG4+Yk2cQpAKzZkUcphG0Vf2zGx0nVsw0faKeTK
 +BbguEHyFGfTnEpGH1atu8e3E0LvKRJDWkjkwgUEPXC1VGmuX+j9/BJpwEneLkcWH5D/
 wgq8A4ncwnOA/+xOuHfLxxt9VhVLX9oUdfWFMKIV0b8g1C4gBIBClbHFabaBUYNMiIvg
 7C3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TNsY3qFCwXQblJPsVdG0LCyrHmw8JZ3ev2jxwT+LE+k=;
 b=gRvHXVTucO0G0xHIRNI9UwJlsumYazH8Df8SAKmHuBUuk6dR/2PX/eYR6YE+aYLP0G
 T5BajmAN/98XMbfH9W3P0sMEOPSLOE1kfpDSPZnLyQMp3gi8yFmDju08+lGTW0BkWnND
 p5nw6nTCzc/34h4mAGJLwrpR4U7bikYTvcjcLdZ4CYOiAfpdmq+iPAqAAfdGivly9AEI
 u94TNmKCo1+kUKPY/FPf/iNwYKLK+9YUonhO7CKGm8udcHVsw8tMeOvkRTjb107xXxNX
 MNF7BMNDF7kgtRPFTDcScklHP/1zCzeP1gPKDTNAD+ni0ZROKVxJ737hhVftcKOZIvOt
 0tGA==
X-Gm-Message-State: AOAM533qoiY158ag3BotOtSmCJ59x8oKswULuT208tvWISOGMO3U8/rl
 VZ5+6z5/gZ5KaguTa5nXgYA5Qg==
X-Google-Smtp-Source: ABdhPJxqCWpvbuwp3Q2VpbEQTmfvZ/vEwaSon3Dgg8K2eunwuY85dxL2dgA71OmAhW/k9YjTGKOZCA==
X-Received: by 2002:a17:907:3e94:b0:6f4:64ad:1e2 with SMTP id
 hs20-20020a1709073e9400b006f464ad01e2mr3241417ejc.464.1652430700338; 
 Fri, 13 May 2022 01:31:40 -0700 (PDT)
Received: from [192.168.0.169] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 eb22-20020a170907281600b006f3ef214e51sm511129ejc.183.2022.05.13.01.31.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 01:31:39 -0700 (PDT)
Message-ID: <cded90e2-b060-d144-b20c-cb8fdfcd4a7d@linaro.org>
Date: Fri, 13 May 2022 10:31:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 3/3] dt-bindings: mediatek: add ethdr definition for
 mt8195
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de
Cc: airlied@linux.ie, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, jason-jh.lin@mediatek.com,
 nancy.lin@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220512080523.25082-1-rex-bc.chen@mediatek.com>
 <20220512080523.25082-4-rex-bc.chen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220512080523.25082-4-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_013142_608507_F163EF59 
X-CRM114-Status: UNSURE (   6.66  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 12/05/2022 10:05, Rex-BC Chen wrote:
> From: "Nancy.Lin" <nancy.lin@mediatek.com>
> 
> Add vdosys1 ETHDR definition.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
