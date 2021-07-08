Return-Path: <SRS0=ooiB=MA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B12AC07E96
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jul 2021 09:26:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDD38619C5
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jul 2021 09:26:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDD38619C5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=+7ZOTYYOB2e6nxyRD+lTz3k+XSUzD8bipgQacqiLzUY=; b=cnwUWdLdRPWtocDMVqmyGWEZMP
	y1XFAShpv3Zd9R1BVVpisj/LGumxL4OU2s+qlWkkj+6oH088eHTjUtMncN+QB+I74UZuhK4/c+zqw
	GBSOFi7MQK0UXSTrFNXuM5H3c0WwL2udq+2e0HI3UMBEUCCEw/ziGtGaOwD8xv0HWWPegZXovmab3
	0Fv4hylSp+llG2YAMI5oDFk9yjQj2LqzcrZil2YbHi+2ZA+B8gzzEsnE/sC/8vpV31rRMjayf/kyL
	5uSe7OECELgy2MQdm54KHZ8bZQ8bsY0lFQsqnucaEErbpPICqSgoGtEA45q5S5N9ak7OXF2mfqx28
	qzV2d8xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1QIc-00GQLv-AF; Thu, 08 Jul 2021 09:26:26 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1QIP-00GQHb-CA
 for linux-mediatek@lists.infradead.org; Thu, 08 Jul 2021 09:26:14 +0000
Received: from mail-wm1-f72.google.com ([209.85.128.72])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1m1QIL-0006Bn-3n
 for linux-mediatek@lists.infradead.org; Thu, 08 Jul 2021 09:26:09 +0000
Received: by mail-wm1-f72.google.com with SMTP id
 b26-20020a7bc25a0000b0290218757e2783so573924wmj.7
 for <linux-mediatek@lists.infradead.org>; Thu, 08 Jul 2021 02:26:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=koIPrhzeeGnASWujJpf7LVgsTrCU+gcQgVFV1kcN3ho=;
 b=iglrJ3uo1t31Io2y2BvFXu3es4n9lXZbQDZVxhNrJGqbbCQz0dcByx6p+X7O+9BIeH
 ERrRBrOFfVtdEm0hkmdb+fMAf+gZQG6ZpRPVR7YoMOt/v/iZ9JfiCYtZf2oJHK9wwsh1
 VyQVSRYiOwrC2Eim12Ea2jLM4qVV6bmzEYgz6nOo33L9cYBLGPUEHRmM6fGOaRXv+8bP
 PbkQIOz4XrJTCZAf+Qz8US68HDpEIlvAPWGJhodnjf7UVb+KNP44mLGEfeyDZ8SFpYgD
 /WCGrtLkvQkXU0su9cBAQzStOs3ruHyPaQZoC168jQ/I8DbFQBZ+mAlVcO7IwkCRkDYo
 IolQ==
X-Gm-Message-State: AOAM532Tk995vzcdv8xfrBNuvQWEcVuoA/+h0r98a5EOYOrqYixfT0KJ
 wpnTsjOGlY5l+ENIKbOQ4DMJvOHHJAYiarwNJU11h2UYfS9dS9+PEGzeji0zhkGjNtOaiJVLkg9
 bnzxFGXEOCIq+bBw12lTUdKg7KZRnYe0XZBwYnDPG+bRs8l70ow==
X-Received: by 2002:a05:6000:1ac6:: with SMTP id
 i6mr29153774wry.327.1625736368925; 
 Thu, 08 Jul 2021 02:26:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9bTjhzy4ewOg0e87DpVaZF42E3AYLNFYRiKycIX46b0OEGS9rxawBZpCgOiwlhnyBj7S+/Q==
X-Received: by 2002:a05:6000:1ac6:: with SMTP id
 i6mr29153760wry.327.1625736368771; 
 Thu, 08 Jul 2021 02:26:08 -0700 (PDT)
Received: from [192.168.3.211] (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id h10sm4020332wmb.46.2021.07.08.02.26.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 02:26:08 -0700 (PDT)
Subject: Re: [PATCH 1/9] dt-bindings: memory: mediatek: Add mt8195 smi binding
To: Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org,
 youlin.pei@mediatek.com, anan.sun@mediatek.com, ming-fan.chen@mediatek.com,
 yi.kuo@mediatek.com, anthony.huang@mediatek.com
References: <20210616114346.18812-1-yong.wu@mediatek.com>
 <20210616114346.18812-2-yong.wu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <6e512d15-3acc-2097-1fd1-e021552fdc8d@canonical.com>
Date: Thu, 8 Jul 2021 11:26:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210616114346.18812-2-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210708_022613_495895_8D3052A2 
X-CRM114-Status: GOOD (  16.59  )
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

On 16/06/2021 13:43, Yong Wu wrote:
> This patch adds mt8195 smi supporting in the bindings.
> 
> In mt8195, there are two smi-common HW, one is for vdo(video output),
> the other is for vpp(video processing pipe). They connects with different
> smi-larbs, then some setting(bus_sel) is different. Differentiate them
> with the compatible string.
> 
> Something like this:
> 
>     IOMMU(VDO)          IOMMU(VPP)
>        |                   |
>   SMI_COMMON_VDO      SMI_COMMON_VPP
>   ---------------     ----------------
>   |      |   ...      |      |     ...
> larb0 larb2  ...    larb1 larb3    ...
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  .../bindings/memory-controllers/mediatek,smi-common.yaml    | 6 +++++-
>  .../bindings/memory-controllers/mediatek,smi-larb.yaml      | 3 +++
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 

I cannot find it on devicetree list, it seems you did not Cc it. Please
use scripts/get_maintainer.pl.


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
