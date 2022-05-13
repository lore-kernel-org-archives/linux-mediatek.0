Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 816D9C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 May 2022 08:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b4jftRYCysLTwtQfcxH7wnXbp0u7hqBjzLCD14rLsR4=; b=3dKjfLz/W47S8g
	k6P6OZiA66f6KfanYrJNJ+omRdm0nLXAnTlXwc6IeS9AtWK2EKjOX1wpa/0FnRNKChPr4K2ceIO4P
	V/WkJ73OwvNuyu4pHcmFevkVLPAldngyBarVk9wIhIiqhqTd6qeNR7fCFqWO3IDjUb7NcnM01Yhrp
	cXvjj3g1P8Sxg7HhpJLypm7RF/8I3+mhtKGAEIHh4BSyZIEgZrasrGTz8Z8MVYl8k3r7Lb1KHCOQ4
	2oU3fKx1rYqc+reEkwYfFKqpIjhRgMPt1RlL7MwMkDAHn+gNgYfsRYF6hjw/PglRcMrhQssumOCVe
	eZpDr24bk3Mee0La1CSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npQhO-00F4kg-U5; Fri, 13 May 2022 08:30:58 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npQh8-00F4ce-A8
 for linux-mediatek@lists.infradead.org; Fri, 13 May 2022 08:30:45 +0000
Received: by mail-ej1-x62d.google.com with SMTP id z2so14825056ejj.3
 for <linux-mediatek@lists.infradead.org>; Fri, 13 May 2022 01:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=rIdMXWo1r64Y4/FoS4X9RpN/HRh3/syFTT7xnGA6T5c=;
 b=kYn9THiEvjgdOi0srB9gv0TQcb1JT6AXp6rZ7l1PrnDHo9qkMGlSwm7w8VteNAoqP2
 I1hQw5r+p9CvNNrd+cbvslCXTbQhhWoY+/b8VMs8SRlRmlPGmUtUZxPH/BAnN8ZShquT
 i+Deg6SKr82BxkgfXu7yGOXRtCVnE/butUAWCAXyDy/QP2xl+DFxPiGqGeAYrLU5kZxK
 2OD5B8XN2qmudqjk/H1QcleJQzIZ2ZsA/l9eEx+gFhXAyFSjDIG/6ZZLj411OxtRbG5x
 86y43GfWeayMPZbFTNXzs9A4ag06Z9uxI5N7+mSk4coGdp5Kv7xQiHljskPrXxntCpQU
 7YHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rIdMXWo1r64Y4/FoS4X9RpN/HRh3/syFTT7xnGA6T5c=;
 b=g0uv3YjZtpqt0/jf0EvVHEDFLUnV3ilv0DGaxcdOa9bXoofM8Y8bJ851DFYZ8zvkAq
 0GZEw+TfIQGR+xB3v2nSs1Zn/aU+v0vqR6nZRDhLQmAtJhLB8tuINFDtksY6VnlclcpA
 GmLGKq631z+9jUKjrJRCqcouFVj7DZxOrT0exUTW+hS85UxWMfqZWDCjEnfBHrtBOOTr
 ip6VpHAvZW/cUbHTnP2VqIPpn/Smoem13wzVQ3EkbypaPSEFASGtYOXL3q2aTL6lrw8l
 aBIc7qnHuqWxhE17hG2UlfQZPv03JsouF99dApdU55tAFrH+Q3H9FTmqav+mFjHV8jzA
 koCg==
X-Gm-Message-State: AOAM531/DBDNtck1Up9xZl73LA37Cw7CS7zXdoC6HAg7EgLQusXmTTqN
 Xxk37zBx7WMli1cg/ThVeYk08A==
X-Google-Smtp-Source: ABdhPJyJ2MbVQT4SxCH65r033Zpdd9f9AOE/v8ahHMI//oxZ3uzkmD0d6awASJrIeLl4rZ47+JH2TQ==
X-Received: by 2002:a17:907:2da7:b0:6f4:801c:6c3d with SMTP id
 gt39-20020a1709072da700b006f4801c6c3dmr3119325ejc.310.1652430640281; 
 Fri, 13 May 2022 01:30:40 -0700 (PDT)
Received: from [192.168.0.169] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 f19-20020a50a6d3000000b0042617ba6392sm655223edc.28.2022.05.13.01.30.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 01:30:39 -0700 (PDT)
Message-ID: <c4278f18-359a-d658-7b42-0a701dd15270@linaro.org>
Date: Fri, 13 May 2022 10:30:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 1/3] dt-bindings: mediatek: add vdosys1 RDMA definition
 for mt8195
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
 <20220512080523.25082-2-rex-bc.chen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220512080523.25082-2-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_013042_401603_B4C68580 
X-CRM114-Status: UNSURE (   6.64  )
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
> Add vdosys1 RDMA definition.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
