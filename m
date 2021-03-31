Return-Path: <SRS0=zLKe=I5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BDE3C433C1
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Mar 2021 10:14:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA6D66146D
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Mar 2021 10:14:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA6D66146D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=S3B5sVcxkio/Yym3BnJWBYq+aflwSry7Q0RAJxNRqlk=; b=mBcCA/rc+0Ai/AVp2TcCvgckz
	YmztJTtckzGjMQgMZH4/mxX8aEGI9ND9E05smYwJatQt7FMe4pPSSgLg7Cg2pqL594gDEM7VNNXJv
	Vj9mENTz+Jihdq8QSs7dQgX0ybbYoKRn2cuEC3lETbNMuSFQMs3DH7Baemq1ULQNjUSFNGjWwOh/6
	nAvXxTJBD/ulyspfAagQjcxRP9k4DewEjMOWK3WAJZWxhcAhpZ5EFORtSPGFc9zvVt1uUd0A8bkCz
	gKF+wAdPBluVJ4A6AGFKoGnHFSHnB+ySKCQdHb/wY0R7D8XuBTWkjk+Wm5e4tXojXSWYAQpSLItrC
	5Bd83g57w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRXrX-006EWn-Tw; Wed, 31 Mar 2021 10:14:12 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRXrL-006EUm-9J; Wed, 31 Mar 2021 10:14:02 +0000
Received: by mail-wm1-x332.google.com with SMTP id
 m20-20020a7bcb940000b029010cab7e5a9fso856006wmi.3; 
 Wed, 31 Mar 2021 03:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=c4/jb/onpfRSCNwhLaXR762taSPSqHcBp79M2N1xunQ=;
 b=Lcry5IJiXguBsfACvMyWHzG123ZxOoCByNzxSLk1knbWacziXY0gJi7W5ClFZGM5lO
 VqnxbqBOc8M+mJGPJBWfcVI16e/+nhiXMyiZvYDtft3SEVcqofw4qWvLS4Dzbd7lGO3e
 Vm0CJFY11UAKaGNWVWgNws/PW8+Y1Svqjx024d1cFpskjiCOhRBWSEKJ0zXaQc7DFDXk
 q7xqTfX99kYiMga6OTpMwXYAvrWKURmhd1TwSnp18gr/4JV7+pKELYmKhcJt5nN8Csn1
 CCqbuw5vN+abcxr94yeNaDb8oJ740jgZhEKeiKQ+Ffk8ct3/RgGuWsrCDjA9RfSCp46C
 jk+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c4/jb/onpfRSCNwhLaXR762taSPSqHcBp79M2N1xunQ=;
 b=lj4gbnwbkq/pOX+oZxDNt2FrdDgOtSBZYDHKqVQQgfeCs/su/yWRh2coxeOctCiXfM
 jF9khX98hQ/g1303xdNP11wM+wa3PsWNu+uUqx3b89elZBYzv0mwk/JW/r7Xk1BBU28b
 KBOKaV1GzViwNNU2aBxGiuS3Ve70+/Bmc39gpc0WXaF3TgJIp84SEyco2dvnx1NC8vc/
 k7diHiAm7shlSaxANaqhTF2BDwTBY/AI4aBvghD37RB/IKPxARrYLoLxWGmyvB8wcv7b
 ktlzGr1IkyAQ4gNjjGTdBbwLbvVJAmY8HNSkdDRddcHVVTVJ41kgL/ASYeSp2quRz+RJ
 VP6Q==
X-Gm-Message-State: AOAM532jp2D1nKIGl30/pgSilRVARGeLuD0Yq07YNl/0cVKpUjnKTE3g
 haqI/w+Q6jCUpBZPEsjYwtSPTUUNX+j/JdOP
X-Google-Smtp-Source: ABdhPJz/IVtF4RqfrQ3TZNSfCTUyxAjCrenQbl5KbDNp6EBM3919C7exvv1X8ZngNe2ulOqjcn0I8g==
X-Received: by 2002:a05:600c:4f4f:: with SMTP id
 m15mr2454196wmq.29.1617185634230; 
 Wed, 31 Mar 2021 03:13:54 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id k4sm5483000wrd.9.2021.03.31.03.13.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Mar 2021 03:13:53 -0700 (PDT)
Subject: Re: [RESEND PATCH 1/2] arm64: defconfig: Allow mt8173-based boards to
 boot from usb
To: Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: lkml <linux-kernel@vger.kernel.org>,
 Collabora Kernel ML <kernel@collabora.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, Nicolas Boichat
 <drinkcat@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, =?UTF-8?Q?Guido_G=c3=bcnther?=
 <agx@sigxcpu.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Max Krummenacher <max.oss.09@gmail.com>, Michael Walle <michael@walle.cc>,
 Nishanth Menon <nm@ti.com>, Shawn Guo <shawnguo@kernel.org>,
 Will Deacon <will@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
References: <20210331090659.4169966-1-enric.balletbo@collabora.com>
 <CAJMQK-jO=yfXDa4t1WzNVmyoQnaBkQP1t1G3HgThWCRAseWk3g@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <a36f2b08-5e23-271f-f894-911ebdd85c5a@gmail.com>
Date: Wed, 31 Mar 2021 12:13:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAJMQK-jO=yfXDa4t1WzNVmyoQnaBkQP1t1G3HgThWCRAseWk3g@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_111400_697573_687F6805 
X-CRM114-Status: GOOD (  14.55  )
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



On 31/03/2021 11:15, Hsin-Yi Wang wrote:
> On Wed, Mar 31, 2021 at 5:07 PM Enric Balletbo i Serra
> <enric.balletbo@collabora.com> wrote:
>>
>> Enable the option necessary to boot mt8173-based boards to boot from
>> usb devices, like its phy and the regulators needed to have proper
>> support.
>>
>> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>> ---
> Reviewed-by: Hsin-Yi Wang <hsinyi@chromium.org>

Both patches applied to v5.12-next/defconfig

Thanks!

> 
>> This is only a resend rebased on top of mainline to fix some trivial
>> conflicts.
>>
>>  arch/arm64/configs/defconfig | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>> index d612f633b771..7b4be3807b6d 100644
>> --- a/arch/arm64/configs/defconfig
>> +++ b/arch/arm64/configs/defconfig
>> @@ -448,6 +448,7 @@ CONFIG_I2C_GPIO=m
>>  CONFIG_I2C_IMX=y
>>  CONFIG_I2C_IMX_LPI2C=y
>>  CONFIG_I2C_MESON=y
>> +CONFIG_I2C_MT65XX=y
>>  CONFIG_I2C_MV64XXX=y
>>  CONFIG_I2C_OMAP=y
>>  CONFIG_I2C_OWL=y
>> @@ -594,6 +595,7 @@ CONFIG_MFD_EXYNOS_LPASS=m
>>  CONFIG_MFD_HI6421_PMIC=y
>>  CONFIG_MFD_HI655X_PMIC=y
>>  CONFIG_MFD_MAX77620=y
>> +CONFIG_MFD_MT6397=y
>>  CONFIG_MFD_SPMI_PMIC=y
>>  CONFIG_MFD_RK808=y
>>  CONFIG_MFD_SEC_CORE=y
>> @@ -611,6 +613,8 @@ CONFIG_REGULATOR_HI655X=y
>>  CONFIG_REGULATOR_MAX77620=y
>>  CONFIG_REGULATOR_MAX8973=y
>>  CONFIG_REGULATOR_MP8859=y
>> +CONFIG_REGULATOR_MT6358=y
>> +CONFIG_REGULATOR_MT6397=y
>>  CONFIG_REGULATOR_PCA9450=y
>>  CONFIG_REGULATOR_PF8X00=y
>>  CONFIG_REGULATOR_PFUZE100=y
>> @@ -787,6 +791,7 @@ CONFIG_USB_RENESAS_USBHS_HCD=m
>>  CONFIG_USB_RENESAS_USBHS=m
>>  CONFIG_USB_ACM=m
>>  CONFIG_USB_STORAGE=y
>> +CONFIG_USB_MTU3=y
>>  CONFIG_USB_MUSB_HDRC=y
>>  CONFIG_USB_MUSB_SUNXI=y
>>  CONFIG_USB_DWC3=y
>> @@ -988,6 +993,7 @@ CONFIG_OWL_PM_DOMAINS=y
>>  CONFIG_RASPBERRYPI_POWER=y
>>  CONFIG_FSL_DPAA=y
>>  CONFIG_FSL_MC_DPIO=y
>> +CONFIG_MTK_PMIC_WRAP=y
>>  CONFIG_QCOM_AOSS_QMP=y
>>  CONFIG_QCOM_COMMAND_DB=y
>>  CONFIG_QCOM_GENI_SE=y
>> @@ -1064,6 +1070,7 @@ CONFIG_PHY_HI6220_USB=y
>>  CONFIG_PHY_HISTB_COMBPHY=y
>>  CONFIG_PHY_HISI_INNO_USB2=y
>>  CONFIG_PHY_MVEBU_CP110_COMPHY=y
>> +CONFIG_PHY_MTK_TPHY=y
>>  CONFIG_PHY_QCOM_QMP=m
>>  CONFIG_PHY_QCOM_QUSB2=m
>>  CONFIG_PHY_QCOM_USB_HS=y
>> --
>> 2.30.2
>>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
