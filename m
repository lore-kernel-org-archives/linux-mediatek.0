Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A44A8C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 May 2022 12:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bonFlgJhKTuBHw8sBzYXCMxpkk8SSRWSb5jktZY5NEA=; b=n5hDG1G1O2cyuY
	CvVD+DcASxljrUcHR+lo0gVeQuS7WHmk2821CWXIeHaBhBS6FSEkNhD/vNa0Eoka1IWm0rPilbYI0
	hiznSUQotIQWEeWUTKXsaxo6YqQxaATrie+h0/oZFLV7aIw4HfX/rmmW3UbvIuVjux72kV/6NQwNR
	KQOl4GV9gdNqryoyKd6kW888oBZUU4FG7kTINR9iqaHqWGb3JCPMKsmyAv+VIkakYj3hrMt2HSnDL
	bkpTURu/vfnpxZcMw0ET1wytI3FvfbRcVzRtvgbvNYZPLcM88BqfaWkSNJ7n81lEI1VRIcqL+DaE0
	uJYHgUdyLquhhhS/g+og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nls5j-005wEg-VR; Tue, 03 May 2022 12:57:24 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nls5h-005wDF-6O
 for linux-mediatek@lists.infradead.org; Tue, 03 May 2022 12:57:22 +0000
Received: by mail-ej1-x62e.google.com with SMTP id k23so33297149ejd.3
 for <linux-mediatek@lists.infradead.org>; Tue, 03 May 2022 05:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=oHVWIHmT3rXaJWCw7EdaE9tGEpo5kLJbmB74t27e7cY=;
 b=WxTviOacb8RbEXCmV4V2QEdj59ihDchP24+Q5ofFVwEwYo+N5IlvZoWocxGL19gBEO
 9GP7A7wQYpfU1m/egluyXoXAzh6q9SnZpD1BUjqhnQFZdk3KxwYxWw0EJW41ITKUNoMF
 yxhEizTD4pG0+CxnPEHquK54Doy9UCNjMmu0YxYtHDCuPNlEMwkaQxuS6O1afCKYrmIJ
 m7E4ufuMuCRd8Q9a5PBZEYC5+OcDSwBfwQ/kxDxs/hlsT8L5iogA+IVTyOH3xLWcpXET
 hgiJMcTqySAcLR7U3PUeRaBuL8jTf/LLqCp3A02TIMfLEBjQ18RQ9dui/ju5OkXgpr6n
 /Dow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oHVWIHmT3rXaJWCw7EdaE9tGEpo5kLJbmB74t27e7cY=;
 b=GLJU/mS0dD9IL1vOXvDd+OVqPZdCNZZO1/dYF7nlyzogWyd5GtzalNAb0pUnQMx+3k
 kYpUN3JjoVtZuFMU/AAsnvaL/7rk9WHQE+NbHH80ABJxN/ylRsr33aP0tVGyCk71jINZ
 3Rr9tHH6SyAteYLhv0MWfD4gUOXn2M1xeBqYG3QHspbKxLAKnlQrDhq0xrRp0/COSL1H
 6W55Q3TGmLBXtA+BWLp7hf4NFhYHdr1ULG6NPMNsnwGmx2rdUdF6V9b2D6cP3ZV0ynAn
 2BruiOpTf6hp6oVB++1/5PiCymOqxI/C4UV8WRdrdWYmQKGwd+uejmzINBhcfqZ40Xbo
 KNWA==
X-Gm-Message-State: AOAM531dPD5JzTjlmgMe+ppqQ9ms07ZJA27+QNMonnO/o3SM+nLn9Ao8
 u6DgVSCwIsOLJTCn8PB6fGIYHg==
X-Google-Smtp-Source: ABdhPJyV7FB552dnmsD4CpjcsIkJUNmoKVpXP4QizFokJu4ctT28NesCBD0GDTATdFIukuUc+C46/Q==
X-Received: by 2002:a17:906:c147:b0:6df:f047:1677 with SMTP id
 dp7-20020a170906c14700b006dff0471677mr15436567ejc.4.1651582639603; 
 Tue, 03 May 2022 05:57:19 -0700 (PDT)
Received: from [192.168.0.203] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 t19-20020aa7d4d3000000b0042617ba63c2sm7860341edr.76.2022.05.03.05.57.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 05:57:19 -0700 (PDT)
Message-ID: <d371fff5-0d45-b827-2696-3862b3c5fd59@linaro.org>
Date: Tue, 3 May 2022 14:57:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] dt-bindings: power: Add MediaTek Helio X10 MT6795
 power domains
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 chun-jie.chen@mediatek.com, weiyi.lu@mediatek.com, mbrugger@suse.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com, nfraprado@collabora.com
References: <20220503105436.54901-1-angelogioacchino.delregno@collabora.com>
 <20220503105436.54901-2-angelogioacchino.delregno@collabora.com>
 <ac774c74-4577-3dfc-7bf4-3c180d45b420@linaro.org>
 <94dbb7ee-764a-5568-a044-80dbfe77c29a@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <94dbb7ee-764a-5568-a044-80dbfe77c29a@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_055721_269765_CE2D81B3 
X-CRM114-Status: GOOD (  11.47  )
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

On 03/05/2022 14:43, AngeloGioacchino Del Regno wrote:
>>
>> If it is not a derivative work, should be GPL-2.0 OR BSD
>>
> 
> On that, I agree with you, fully.
> 
> Though, all of the mt(xxxx)-power.h headers provide this license tag and I
> wanted to follow that to give the same.
> 
> Should I change it to (GPL-2.0-only OR BSD-2-Clause)?

Yes, please, for this one.

For the other bindings - you would need acks from people involved.

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
