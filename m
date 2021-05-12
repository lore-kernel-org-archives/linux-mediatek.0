Return-Path: <SRS0=1nN3=KH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F5BEC433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 May 2021 16:39:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB15461006
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 May 2021 16:39:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB15461006
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/xCrYgvj/HmigOzHAVhXvV1C0OL88qdwAeLwrd3/A4Q=; b=JpnL549Er+xsxju/4UT5OgSrQ
	f9muPrNEzy0AV/L0cfeuOfzGn/I0kcx+j8Gpiopd0tLQZiISorN7hBKvv2nW+rjAYK+sEz0w+CY1e
	YWR9jI/lG4ia+DOEgarPH6eMaVZvj8M+4htA3uSsG0OuFPLTEmjz660QHmWFc8pQlj/c0dBc3tXhV
	ZU7DnZNBs31LAdXMoqFQYacnILKftq+ms5CdDmRmTnY4FsiSObOwqF9uX9Qe/Pup6oSsbK/0+DmGP
	OpgRWkRFYYMAG8J5bNdLkTnvq4KXzZgXwE2RCgJd5S0kpBeTyYXNftd0s9DhTK2B+XZOXya7uv9mk
	oJFSC2VfQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgrtA-003MTk-0Y; Wed, 12 May 2021 16:39:12 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgrsx-003MSR-He; Wed, 12 May 2021 16:38:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=YMb7uN/QWY5kpiEORQpOCJvo0plM7mzHsaNeBHSjrWg=; b=vAwAlhtyF/9uFFXEvw6HK3yxUO
 INhSzCYbKpYCgAx83e+tU9K27mBNfYUEEHgbRyD6sNT+NWFlmN7pR+WBGAygHxu63nTSJtPLSu75V
 VOnoadaxcapFGia237U9KhVJ5Mv2On6P1YcNgf1QtEPQDrb/ahvwIGS5GidPNmai9/dC9U1k9NrFl
 qDHVIFh5HeSCexQRoT7tAdV2m+x5fAzheTgu7KSsZAan16IQRD5gG5Eim6r/afKuQ1YOW1WABR3b0
 To13YzO0Rn4VbsspQozGsGJOlm9cqM0wmuT/KXlkH74c9htHOrcWZwey13eYt98jt87UbcKCOeRr+
 5jNhI6OA==;
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgrsu-00AbdO-Pg; Wed, 12 May 2021 16:38:58 +0000
Received: by mail-wr1-x431.google.com with SMTP id h4so24268558wrt.12;
 Wed, 12 May 2021 09:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YMb7uN/QWY5kpiEORQpOCJvo0plM7mzHsaNeBHSjrWg=;
 b=pxjAbg1WrLWOXCdwri/iyguoBHX06bS+zsC1ZbzXBKincC3w+e7sr8NUhh4kg8fw0J
 g/3VpiDSYjgo3NqDU462rHTuSpM51uDXm9sY0RvYOfP73vWjoKxYX8UNfRNz258pUL3t
 xCtiDTUk0UjlU5qmi/sVccDAYCY4BlEz44Br9BR1qazP6d/2EdDdN42asYTVkXVsm0MJ
 zOkrzjMl153Y0OhqSMnlHVWtqV0Kxb6XapepjSFHo9aR4rhOHLChqHtubpNBKaUu7IIa
 Lr2UQahSAsbve/8abe41aR1lplbAuX1AkSz+gaUNSyE8FuvMlORnLz1WjTv6oapQt5f/
 VLVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YMb7uN/QWY5kpiEORQpOCJvo0plM7mzHsaNeBHSjrWg=;
 b=bWRsU7hj9gldLBWgLjd1HEggdmg6Y0rFnbJcIf4HpRszv1Qd3dFKTCEusvHPrrVzSG
 SVlcqrIPaeF4KwEaLSlTm58eIg2ZXZyPVnOT+69UsxxXzqlKVKI5lhDv0WDrFWd5U697
 EnIiGCp4BdNzc454qjLv0oGOHOhRRS0/pEzwsKO34IN/oyEHDLOTR/WUBJUNtTI9iChT
 quDhKeCShiAFsDS4luk2aP7a7A6xfFNlvAOEXfXcbt5qAuZeMl55TEQnyvf/34dCNT6v
 knuAMG3lt92tKrfwf2iJKeT8pGrkeyx7gyvTv0cVHB6+JSBelRjxuqdZERh0LwYKtcQd
 JLJw==
X-Gm-Message-State: AOAM532JO4vUz4++8v3rxKgYQFi1cCUkgpkBm6ya86vZ+IWubNR5PfD+
 /xKAsahM5KUCol6m+uMR1/E=
X-Google-Smtp-Source: ABdhPJxFNrKOWVPM0JkDbkwH3AwuL6kakoN+0Qnbn/3gkIZ1tbCKYCw8x+nyqNJtJr7PUf/fvUK6Lg==
X-Received: by 2002:adf:cc85:: with SMTP id p5mr46235148wrj.75.1620837535360; 
 Wed, 12 May 2021 09:38:55 -0700 (PDT)
Received: from ziggy.stardust ([37.223.140.37])
 by smtp.gmail.com with ESMTPSA id z5sm179335wrn.69.2021.05.12.09.38.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 09:38:54 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: mt8183: add cbas node under cros_ec
To: Ikjoon Jang <ikjn@chromium.org>, linux-mediatek@lists.infradead.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Hsinyi Wang <hsinyi@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210510092631.3141204-1-ikjn@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <c5a253ba-6451-c538-39ea-c339c176afbb@gmail.com>
Date: Wed, 12 May 2021 18:38:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210510092631.3141204-1-ikjn@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210512_093856_865177_F16D54B2 
X-CRM114-Status: GOOD (  19.08  )
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

Hi Ikjoon,

On 10/05/2021 11:26, Ikjoon Jang wrote:
> Add a 'cbas' device node for supporting table mode switch in
> kukui devices.
> 
> Kukui platforms with detacheable base have an additional input
> device under cros-ec, which reports SW_TABLET_MODE regarding
> its base state (e.g. base flipped or detached).
> 
> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> ---
> 
>  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> index ff56bcfa3370..40030ed48854 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> @@ -816,6 +816,10 @@ usbc_extcon: extcon0 {
>  			compatible = "google,extcon-usbc-cros-ec";
>  			google,usb-port-id = <0>;
>  		};
> +
> +		base_detection: cbas {
> +			compatible = "google,cros-cbas";

I'm not able to find any binding description for this. It seems linux-next has
driver binding to this compatible, but the description is missing.

Can you please clarify.

Thanks,
Mathias

> +		};
>  	};
>  };
>  
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
