Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C47E3C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Nov 2023 20:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/6Rou90ZC/YyyJYxVbEOGHfj5WMXYWOx1f+Ff7XOa1I=; b=q7csEQlaa+mcU2tuphFrYtIiWY
	G/nDwuJp3rWdkz6HfQqqB8FLHHq5hJCBuT93yLdM0jHXiX06wz3X9Njq8rLfuHtiShn+zASYnsIQq
	mWVfJbZMX9bns/dn1mDHYDGXXXeNbbKHbbX+b+4VOIA9A1lV5lF9G9CEPQww/wsJ4+SFR5IC7ji9Y
	vvk0I9WfweO0S3EuJyD2Zsx1pBXqudwFLG8/Dt3iNQTmtFQAh/Aduo04D6N3Ay9Uo1/ZQn0NeKmMm
	+Cv2LUt07QzN6XqYGu6Si5Y1tioreKqmHzO8B3vWTbo+CWJPAdSHTlE4Pzubvk2XbNCtVq5c0tPfR
	ZbJgTywA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0T7L-002OKA-2K;
	Tue, 07 Nov 2023 20:56:11 +0000
Received: from mail-oi1-f180.google.com ([209.85.167.180])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0T7G-002OIi-2k;
	Tue, 07 Nov 2023 20:56:09 +0000
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3b2f28caab9so3666645b6e.1;
        Tue, 07 Nov 2023 12:56:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699390564; x=1699995364;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/6Rou90ZC/YyyJYxVbEOGHfj5WMXYWOx1f+Ff7XOa1I=;
        b=El0YgItUsKq04+ii0I+WqktOnAjho93znrChMdJoFWlQBrPa2QnlEXBX7Lz80zJvzN
         QcLft49rdfmlc2eNAubJKbQT8Gipnj+Kwvf+mr9AnMckf138dQP843lReaxEoYRAX6Df
         45HDCeQpn4h6RS1MN4Gsd6y2pQdSN5Ophp1HM23m/gpVFKC/+vlWREhTzcPWARjkw2uy
         bS+65s1EMWtTRN6c8PUCexEPAWDhRJhFegPNQQexX4G9BsL5AbPMQOx0KgwpAyf3F7BC
         6uYNP4TIQD9uIiZ+LIudUpDCOjYeYUOfNQLSAqaBQgqt5fAAmH+CPg8A/ZaGfs2mldA1
         S8rw==
X-Gm-Message-State: AOJu0YyQdhRG0Jzt9+ExQxbV/rN8Qh1kReLMNsB5iiN7DCy6q8lKpavM
	UMXXEO1M0k9GCQoKVgkJ8o8=
X-Google-Smtp-Source: AGHT+IHaVgJsDpMhGNCp2vy1e2k6VSsMSNXCGuVJSbryRe2BREjphu4QS4E0vpDG6xSv+mpyajdD2g==
X-Received: by 2002:a05:6808:3993:b0:3b5:ae0d:b208 with SMTP id gq19-20020a056808399300b003b5ae0db208mr213931oib.6.1699390564172;
        Tue, 07 Nov 2023 12:56:04 -0800 (PST)
Received: from ?IPV6:2620:0:1000:8411:403c:7209:147d:958d? ([2620:0:1000:8411:403c:7209:147d:958d])
        by smtp.gmail.com with ESMTPSA id x11-20020aa784cb000000b006b225011ee5sm7644220pfn.6.2023.11.07.12.56.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Nov 2023 12:56:03 -0800 (PST)
Message-ID: <74f98f63-3200-4485-bbf0-819800837ee9@acm.org>
Date: Tue, 7 Nov 2023 12:56:00 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] scsi: ufs: host: Rename structure ufs_dev_params
 to ufs_host_params
Content-Language: en-US
To: Can Guo <cang@qti.qualcomm.com>, quic_cang@quicinc.com, mani@kernel.org,
 stanley.chu@mediatek.com, adrian.hunter@intel.com, beanhuo@micron.com,
 avri.altman@wdc.com, junwoo80.lee@samsung.com, martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Brian Masney <bmasney@redhat.com>,
 "moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-samsung-soc@vger.kernel.org>, open list
 <linux-kernel@vger.kernel.org>,
 "moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-mediatek@lists.infradead.org>,
 "open list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-arm-msm@vger.kernel.org>
References: <1699332374-9324-1-git-send-email-cang@qti.qualcomm.com>
 <1699332374-9324-2-git-send-email-cang@qti.qualcomm.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <1699332374-9324-2-git-send-email-cang@qti.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_125606_888162_4F77FBCE 
X-CRM114-Status: UNSURE (   8.87  )
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

On 11/6/23 20:46, Can Guo wrote:
>   /**
> - * ufshcd_get_pwr_dev_param - get finally agreed attributes for
> + * ufshcd_negotiate_pwr_param - get finally agreed attributes for
>    *                            power mode change

Since you are renaming the function, please also change the description
of the function into something more meaningful, e.g. "find power mode
settings that are supported by both the controller and the device".

> - * @pltfrm_param: pointer to platform parameters
> + * @host_param: pointer to platform parameters

Please make sure that the argument name and argument description are in
sync.

Thanks,

Bart.

