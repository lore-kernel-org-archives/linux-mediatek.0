Return-Path: <SRS0=9jr7=I3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48D39C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 22:37:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF6C461580
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 22:37:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF6C461580
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ErLL3AjuwUyfHVSJ9Mwd97nDHxIPVJuPXYmkvAMDFkA=; b=b9PWiigdsm38xtQFjr1NlzAc1
	Wo+OhIsW3MjnDx4VQD4+OVAhWvLOePjH8D3lopuOoe5FzUlUgeHXaPo/0XSAuKDeJjE4nohgjGsK5
	JUfWs1BqT8iwPUAFTn03PbtjcP7lpQELHe/1AF8SEQqRzdxzvqYvxljjRkd+8/qZifARWbsocLKpP
	swafn31uWybE9sw9ZV4R/D1AxZQoU7IfyV8zLVh58aGIRfowmEk1K4LVBS+EYR9N/HR7kCeNa+iVU
	tyi49rNTQC3kDVuewY6RybR370GYKuyO4ZQZlLPRXqeJ4mvNqueH5c/uNiBaxfofE1928sIoA8Bgg
	69nA8QLtw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR0Vx-001hwT-Qw; Mon, 29 Mar 2021 22:37:42 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQsEU-000gpy-FU; Mon, 29 Mar 2021 13:47:08 +0000
Received: by mail-wr1-x42e.google.com with SMTP id o16so12987884wrn.0;
 Mon, 29 Mar 2021 06:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SHJw7ynIQtYIZDtMTZai6BlbSyO8G1iEaclbkW3WeUg=;
 b=G2BVrmBVNZY16wcuSi4vnzeW9Uul920d03c5stRAVuxf7lP5tEwLjbE/a3srGBSuuI
 0MttY+ZbQzBLxbRnZbfYKt6+3XsGgfbMF6lEUJvThX7+JvPpXF2U8Iz3FAqUwDgYQIbH
 P1KScBlbPg+nFXIExIDLBDNhyPQN/h0EQ/9KqnudsYe1442h+zgKxT3LYUJj/faPcB3u
 ebmCa7PobB7SS8bGVRxafgLD4pQ+kT00G3b7Isdoquq41HEXCi0Eyn3VxVgTmBcTJT/B
 e6kTs3q2zEsY6ad7CrXVXV2Ha5UCTdRtmk4MwcU5zA3eXOIhmZD3LhiYVa8TUyXaewQj
 5oPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SHJw7ynIQtYIZDtMTZai6BlbSyO8G1iEaclbkW3WeUg=;
 b=nW1dV1AZqiZhK7XAkJp6O2BWqCcaz5nthBaSGsWAi3oT4IoGgx7oM9ykzMklrKMfk8
 2t+yjpwYouezsl5CYQOa03tdncoLi9ZbFN1WtypCnHhCCXhNo8KhiGq4psTnIoJuxSA/
 eRrtYHtU1+SoEsot8X2lvpeHe6U+mXxeZryOVw17Eg8Xhtuh5rdiM6N7X+U7qDrOEYsr
 /bbq21GUbU//uylb72BfyrIOLQafMpEOtPlPVXBtJ8i6yzGEELhvGEOhsXeidSeX1JJC
 xYJnSLpiGAc6geIkHn9EwjhXd3pgrZ7N4goJxYSqc0/BZuhgO7nLaxBPZhm8g6NHP9dL
 qAyg==
X-Gm-Message-State: AOAM531H2MDXzUWqbjC905hEWV1eC+PedMChRLTyjlaG1Cyf6hRyn+WX
 oIMVc0iTxgcXO8qQoqB5I7I=
X-Google-Smtp-Source: ABdhPJwy/xjxdAl7xDrzQk1wBSWQTvD30dAXW+9quVKShEdRejctfFXc6fCqm2PcwXBcDw7iQwDc9Q==
X-Received: by 2002:a5d:4bcc:: with SMTP id l12mr29016522wrt.343.1617025625889; 
 Mon, 29 Mar 2021 06:47:05 -0700 (PDT)
Received: from ziggy.stardust (80.174.240.175.dyn.user.ono.com.
 [80.174.240.175])
 by smtp.gmail.com with ESMTPSA id q19sm24533172wmc.44.2021.03.29.06.47.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Mar 2021 06:47:05 -0700 (PDT)
Subject: Re: [PATCH v5 09/13] arm64: dts: mediatek: mt7622: harmonize node
 names and compatibles
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Jie Qiu <jie.qiu@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, Cawa Cheng <cawa.cheng@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20210316092232.9806-1-chunfeng.yun@mediatek.com>
 <20210316092232.9806-9-chunfeng.yun@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <5febd2dd-5bed-3eb1-c2be-63cc588eae41@gmail.com>
Date: Mon, 29 Mar 2021 15:47:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210316092232.9806-9-chunfeng.yun@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_144706_639536_78730FE9 
X-CRM114-Status: GOOD (  15.94  )
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



On 16/03/2021 10:22, Chunfeng Yun wrote:
> This is used to fix dtbs_check warning
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Applied now to v5.12-next/dts64

> ---
> v2~v5: no changes
> ---
>  arch/arm64/boot/dts/mediatek/mt7622.dtsi | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> index 7c6d871538a6..890a942ec608 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> @@ -742,8 +742,8 @@
>  		status = "disabled";
>  	};
>  
> -	u3phy: usb-phy@1a0c4000 {
> -		compatible = "mediatek,mt7622-u3phy",
> +	u3phy: t-phy@1a0c4000 {
> +		compatible = "mediatek,mt7622-tphy",
>  			     "mediatek,generic-tphy-v1";
>  		reg = <0 0x1a0c4000 0 0x700>;
>  		#address-cells = <2>;
> @@ -877,8 +877,9 @@
>  		status = "disabled";
>  	};
>  
> -	sata_phy: sata-phy@1a243000 {
> -		compatible = "mediatek,generic-tphy-v1";
> +	sata_phy: t-phy@1a243000 {
> +		compatible = "mediatek,mt7622-tphy",
> +			     "mediatek,generic-tphy-v1";
>  		#address-cells = <2>;
>  		#size-cells = <2>;
>  		ranges;
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
