Return-Path: <SRS0=9yZI=PC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B68F4C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Oct 2021 14:53:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86C9B610F8
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Oct 2021 14:53:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 86C9B610F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GjneUic9wKJndM8eXeBGEcjZKhi6kJ3KrhjPpjEWk/g=; b=hXcMPKLL+M3jja
	PwHLrFkdTmFqftX3i/WqDLk50m6Kgjiwd5MDOV123XkYJ1OZzKe/AC3ozGGhdx4ROw7l+LZRYgTPL
	wHziaRoVfPf1HlvTkzWdcsUCrTZUF/QZ8Z92ytQQOIktLDBNc5kEdJHNYBqW5f6PrZmT1jS/xQnxh
	MFndIs1bIGvCKZJZGgjiWuouH3YCPY+dcfWsq4EkhwHHm+G7NBahNzPXqZcyw8/ULTQEnugyIZFRY
	wnrKnCa5ApA/ba5NiaDlW0WEA8isers7QSjzvAa4umF0hWC0I+eL9BgEp6j1IJOdZBECKjRVKaZp5
	jAy7mOIGBUC0o+04kMow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mb26o-003W1j-QX; Thu, 14 Oct 2021 14:53:26 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mb26Y-003Vs2-5H; Thu, 14 Oct 2021 14:53:11 +0000
Received: by mail-wr1-x436.google.com with SMTP id g25so20281476wrb.2;
 Thu, 14 Oct 2021 07:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=d5B5HCqMrztLLrW5kmrymVzCm+NfqoWthUp1VRMYYUU=;
 b=FYAYK+krCgB7G+n7iC8xxBZL9hwQhtskXsUeTLq+SGHCsdiffdkrumJkiCjGCkNt8q
 NobtW9/V9kivu488dgG3anr3hFQXLanVZgjc9ZWPYoAL4ZOckOR6CDDih+2RoPOqWIAP
 uf3jEheouMKJGa0VUgZSUcB4uwyYE44h2ml/ELVJ+2Lm7C2/Q1N0UKX31G01echDTHli
 np45qs1t2yAfZtd90Pq4F/Uu1ZmJbatDCzxYzhnj9dNVyxtzutZahdPspgSJvcZYxiev
 OmkixxM8YATtMgc/Py/IJ4UlCe8vGG1SpG7jrwEQP8EuaO4waH3k7Qf/2SRsp8zJeg3M
 UuRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=d5B5HCqMrztLLrW5kmrymVzCm+NfqoWthUp1VRMYYUU=;
 b=Xj4YmSqPoH72KzSqPpEs48gzFZh19mdFC/kLXO48WXI8FiBn7rQr1Wu9dLVhvHCegQ
 WK8L+vDcrLADneQfqKrA9NhEmjLLP5Bt01JIYyyuwJJBVB33XxtrESGNMvPGTLC8aIrE
 ExnNKjn4wK68BOSLG8h9nOFIVEw25XdftRNtQqswQX6fixa7qLjKij+uIHPSgkxbbxJM
 fcxr6BvGKBFVJFdn5ef9oORrc9EMTxylECiCRzt0hkRNbye0G0BII+dU8n+c9m0/Qx+G
 /7Kfmj4JG364G04PrnRO9KM11mVnBebJVSNRklfVAUMhhSCNrxC46nuCPh8T4gG6a344
 ubjw==
X-Gm-Message-State: AOAM5307z5d4fjkfYE+UDTNk3+MqzH/xDCZIpOLpC6+zj0c1B+IHVhQ9
 qfPBZ83m3TKob7Q77Pzw6AI=
X-Google-Smtp-Source: ABdhPJxwj4QyeoLsfTgposAnSqBMgGEjIEJUCSUuIY5sn6cN9GS9Hiej7sU0HldUQkDYK6Ps0HMdrw==
X-Received: by 2002:a05:6000:1acc:: with SMTP id
 i12mr7034978wry.249.1634223188314; 
 Thu, 14 Oct 2021 07:53:08 -0700 (PDT)
Received: from ?IPV6:2620:113:80c0:8000:c::779? (nat0.nue.suse.com.
 [2001:67c:2178:4000::1111])
 by smtp.gmail.com with ESMTPSA id o23sm2423900wms.18.2021.10.14.07.53.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 07:53:07 -0700 (PDT)
Message-ID: <47708046-ce93-b879-2d1d-40cff2c3b7ea@gmail.com>
Date: Thu, 14 Oct 2021 16:53:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH v7 6/6] arm64: dts: mt8183: change rpmsg property name
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>, ohad@wizery.com,
 bjorn.andersson@linaro.org, mathieu.poirier@linaro.org, robh+dt@kernel.org
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210924033935.2127-1-tinghan.shen@mediatek.com>
 <20210924033935.2127-7-tinghan.shen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20210924033935.2127-7-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_075310_237555_E806CBEA 
X-CRM114-Status: GOOD (  14.82  )
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



On 24/09/2021 05:39, Tinghan Shen wrote:
> The the rpmsg property name is changed to "mediatek," to sync with the
> vendor name defined in vendor-prefixes.yaml.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---

applied to v5.16-tmp/dts64 which will become v5.16-next/dts64 as soon as 
v5.16-rc1 is published.

Regards,
Matthias

>   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> index 8e9cf36a9a41..bc4bbcf457ee 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> @@ -754,7 +754,7 @@
>   
>   	cros_ec {
>   		compatible = "google,cros-ec-rpmsg";
> -		mtk,rpmsg-name = "cros-ec-rpmsg";
> +		mediatek,rpmsg-name = "cros-ec-rpmsg";
>   	};
>   };
>   
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
