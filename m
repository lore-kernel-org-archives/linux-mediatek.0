Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3715FC5AD4C
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Nov 2023 17:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R82qYWgHzyabWKd11HpcZVo2+/o3FL2YzV126Cd5vsM=; b=O8JvPFKXyVAK1g9Nr/fgHi6a1a
	sJGbALPslTwybl2cApaX4HmsjjoErGxJ+6jycSo5nGRWw4C1BaKr9sOaXHqX3QRrJv6M0SgRl/9x3
	NlnE+hvID3QiGsWp8ZYepSQwI5qmB0xiYRUYkOxdFnuyYAOU+Ndsh78PG7xiO7cQYNe6di+DQ8pOJ
	aRJT2UNYM2yqt46WN73lylK8YGVs3IbUNa2H2gtMOtzKKrlmjvrWMh9R+gIlzuSffzN3+FLBmiUgm
	7bdm/iaMMLI3qPnKmpMoPJ41UEPs8eadQ/pIqPhgNPV9PMJxwxCHHkgnPLutd7ZzLeEF5+i/Z+oGO
	37sgygSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r57wB-00Dj81-2K;
	Mon, 20 Nov 2023 17:19:55 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r57w6-00Dj1i-2d;
	Mon, 20 Nov 2023 17:19:52 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1cc0e78ec92so28263945ad.3;
        Mon, 20 Nov 2023 09:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700500788; x=1701105588; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=R82qYWgHzyabWKd11HpcZVo2+/o3FL2YzV126Cd5vsM=;
        b=lD8uKoBZX9kqjF/5T65VEHsxPqvVoEDed6ZxV52NtcRNIvN64bLdvkw/lgBG8RrYxB
         rpiWDiPwUSeqrHcTRo2ibwbam7ZRdxg2WrSMu9Gq0Huk9zzZxC6v5RF6qOolIhdK4XWi
         Fe65JojlA+YJgwAZDwTVgWjTvyppHMgPFORm7qEAuM0dic7wCCnxF1RdzCuwmAueXHxB
         kdSI0zcHBDZlM3CmQWkYES1PJDZtU6YOXNOSJnYZrckzbdaaWb5PbXUk9Pn4V3XdyVgZ
         dcNsYA7JYJe/950uBQ9+iH7DEl0hnQeO7LFP9l51VEfz1skOhzzD2WY+pN8IJFMSuQrA
         iv6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700500788; x=1701105588;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R82qYWgHzyabWKd11HpcZVo2+/o3FL2YzV126Cd5vsM=;
        b=c4HKNkO9NpOqRAfxMjgCYc5KTvTm8xH+TgYmUhyP/aA2G7NdmVx0WzBRZEJNaUjdzb
         ISZ9Xeo8Y5uBEsyGdegJa7sqVUQ14+eJkXWZTu8bSllOqCtQZQVpK2x0+VdtxjScSsSZ
         ODYBQxUKafMX5f6WLi3sSOSC/RM0/buGgWhVCK7KOgAJczHbYuO+UoKLfCqZm1nZfi2F
         CGMW1g6i5s43I6crp+1qzL6JYQr3MYVO/DgAn71S66SqHDPSYU+p1kMBNaZ8T1X81Shq
         mgeyBU4YnhsHVEhklYJ9Nyi7bFYBUSjEHVNOYlKZfneF6vFjFOosMIRBAkOfOwNFxHy+
         JhcQ==
X-Gm-Message-State: AOJu0Yz5bH8uvv0Yb1XzR1ZVTHIRmpE/SCAEOnKCOtlT8fkXc/VAcfq8
	x4oMhSJmpDqqq2FlcJ+SE+Q=
X-Google-Smtp-Source: AGHT+IHsC9lTDG/b/GONQkCY5W/Eh6jxxNasdKd8ye72X4RlUKsgeESMk2QD0S3Eews7i7Mx3UqP2Q==
X-Received: by 2002:a17:902:7c8f:b0:1cc:3de0:bcc4 with SMTP id y15-20020a1709027c8f00b001cc3de0bcc4mr5706484pll.44.1700500788281;
        Mon, 20 Nov 2023 09:19:48 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h18-20020a170902f7d200b001cf5d425244sm2420579plw.298.2023.11.20.09.19.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 09:19:47 -0800 (PST)
Message-ID: <dd9c2e72-c0dd-4e94-9474-a20b4598a0d4@roeck-us.net>
Date: Mon, 20 Nov 2023 09:19:46 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] watchdog: mediatek: mt7988: add wdt support
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <4d7db8786dce35273db516f3d41228bc27a08fe9.1699980962.git.daniel@makrotopia.org>
 <3f5ed9656ea66637d259e9771ed852511369ba9b.1699980962.git.daniel@makrotopia.org>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <3f5ed9656ea66637d259e9771ed852511369ba9b.1699980962.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_091950_856327_C69EC6F2 
X-CRM114-Status: GOOD (  17.60  )
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

On 11/14/23 09:04, Daniel Golle wrote:
> Add support for watchdog and reset generator unit of the MediaTek
> MT7988 SoC.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
> v3: fix wrong function parameter name in kernel-doc comment
> v2: call new toprgu_reset_sw_en_unlocked from toprgu_reset_update while
>      holding lock.
> 
>   drivers/watchdog/mtk_wdt.c | 40 ++++++++++++++++++++++++++++++++++++++
>   1 file changed, 40 insertions(+)
> 
> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> index b2330b16b497a..3b4ee7185feed 100644
> --- a/drivers/watchdog/mtk_wdt.c
> +++ b/drivers/watchdog/mtk_wdt.c
> @@ -58,6 +58,8 @@
>   #define WDT_SWSYSRST		0x18U
>   #define WDT_SWSYS_RST_KEY	0x88000000
>   
> +#define WDT_SWSYSRST_EN		0xfc
> +
>   #define DRV_NAME		"mtk-wdt"
>   #define DRV_VERSION		"1.0"
>   
> @@ -71,10 +73,12 @@ struct mtk_wdt_dev {
>   	struct reset_controller_dev rcdev;
>   	bool disable_wdt_extrst;
>   	bool reset_by_toprgu;
> +	bool has_swsysrst_en;
>   };
>   
>   struct mtk_wdt_data {
>   	int toprgu_sw_rst_num;
> +	bool has_swsysrst_en;
>   };
>   
>   static const struct mtk_wdt_data mt2712_data = {
> @@ -89,6 +93,11 @@ static const struct mtk_wdt_data mt7986_data = {
>   	.toprgu_sw_rst_num = MT7986_TOPRGU_SW_RST_NUM,
>   };
>   
> +static const struct mtk_wdt_data mt7988_data = {
> +	.toprgu_sw_rst_num = 24,

Kind of odd to have this defined locally, while the others are in include files,
but not worth arguing about. Please make it a define at the top of the file,
though.

Thanks,
Guenter


