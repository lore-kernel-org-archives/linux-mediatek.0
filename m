Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C73C25B0E
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Aug 2022 09:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G5NAqTux0bOKykcXT0wq7j9epj8v8D7Om8beKuCJzt8=; b=ill+na9ucJWEeHVIyFdQafkCYM
	7X8ydh3VimMsAo0oUNU3O9Lpg8H0uFSEexI5J8K+6F3TWtWyhTfA1kH0WEf6W4mNV82N+Kh6Y01TI
	O58TbG72OfitMrZZeTgabTYkDXb9UrLPKuHt0hTEpbajuj2z0sikTs50BFj1fpbAbocKrUPBpTHo/
	jraUEytoAp/NvKbBma3Jyy96DPKCk+P+vxCns3w5aqDETcR9yrtipsOqZkTnQhfUDp9iu002QBSq9
	ZL47MK69kyYh4pnwmzuWwAlG33d0ZpolZ0MyTGe9AYPJqKqR8CIheP4ZS+EYSoIvv0XrbqsQjrT0N
	Ihwh3w6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOy0j-004e88-9f; Fri, 19 Aug 2022 09:09:49 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOy0h-004e6a-3T
	for linux-mediatek@lists.infradead.org; Fri, 19 Aug 2022 09:09:48 +0000
Received: by mail-lf1-x12b.google.com with SMTP id z6so5321442lfu.9
        for <linux-mediatek@lists.infradead.org>; Fri, 19 Aug 2022 02:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=G5NAqTux0bOKykcXT0wq7j9epj8v8D7Om8beKuCJzt8=;
        b=GEm+toPB7s/85Tf4ejtzhH+vMhvU+PeGUhf7rXYBXhLcgaPZRYan8pyh47nO0P3rfL
         TdjsMv2NONrjdYIJEJD3YSyKfnCunWW2/EAfXZubV5emXm48dBhDONK7MdkGr71TCPFr
         b7mwBc5GsC63xQd4Lg/XY5gtbRW73Hs2HtMTbguE8jaHv03/tYxGzOlhICrW/Q8b72qt
         j2h4ovR9MH46YtmAq4Rg7iefCFUj22H7rA9eqwhFHQ5Ba9moPjmZJrFEjcZcVlZgyNFA
         VnHIC6kSiLH3aYFavmH+OYhgYgxmpmoffHi2IIsxwYq5hWzZCUX2EtCgGDb8qI5RiFYO
         fwfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=G5NAqTux0bOKykcXT0wq7j9epj8v8D7Om8beKuCJzt8=;
        b=FcwnWc33g8/kTb/1gb2N2TUFvLT4bFBfZjULa5KgUSOWHK6g+ERvbmXqR77lQ82FqK
         1tC6BkKbLSSqeLGUQqD2aL2IXORE+2r/fu60B5d1IIWyKDIBFULXkSOoUpRlh4fiYOyB
         puLbsetWNi5zoIwu2Wjj85sKo+LqDtYTD0vj5rwtWasH9q/E7uKRUA7b6DNR19AeLRuY
         VMEf96ywCEe3QtJPTW6eE0GdR6sZADu2EF31qpnMShvk9iU9XvGIrNtu3CD6tsN9PSQa
         yRk1zSV4witCXVzbf1jHb3dJ7RFeoweQT1ebbVdy710j62HUsbTXS5LA/f5lFlaXRh3X
         9rWA==
X-Gm-Message-State: ACgBeo1DaCHh6tF79n5cRF3NQO1uiT9q4GnvA2S6aiSAQf/eEddEAuhp
	C7ariCgGkwv3kHRCHAzP5xpHvQ==
X-Google-Smtp-Source: AA6agR6N3Py2jGhuCpuhSNB73nreMYs2MhssmyKwqw2ZIa+aUj65/gNBqA/6D2rGBHLR6HDoAltPRA==
X-Received: by 2002:a05:6512:280e:b0:48b:132:c420 with SMTP id cf14-20020a056512280e00b0048b0132c420mr2080357lfb.542.1660900185712;
        Fri, 19 Aug 2022 02:09:45 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5? (d1xw6v77xrs23np8r6z-4.rev.dnainternet.fi. [2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5])
        by smtp.gmail.com with ESMTPSA id cf29-20020a056512281d00b0048a828b6b2dsm561027lfb.182.2022.08.19.02.09.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Aug 2022 02:09:45 -0700 (PDT)
Message-ID: <9bf85483-61b4-f57c-d46e-fd18b8cce399@linaro.org>
Date: Fri, 19 Aug 2022 12:09:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] dt-bindings: usb: mtu3: add compatible for mt8188
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220819081027.32382-1-chunfeng.yun@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220819081027.32382-1-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_020947_260988_098F0E57 
X-CRM114-Status: UNSURE (   7.44  )
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

On 19/08/2022 11:10, Chunfeng Yun wrote:
> Add a new compatible for mt8188
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

