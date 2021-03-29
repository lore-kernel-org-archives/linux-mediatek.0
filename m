Return-Path: <SRS0=9jr7=I3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6DA8C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 23:41:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E57261924
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 23:41:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E57261924
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8atNbkA21wl841QdjO3k0rbi8lgDcZJ5iW6Olpx93mI=; b=IrjP2YnV+tB0ndpw21tlLCZx8
	MS0uZHUrOaYGFEE39eQKoBKFOKi/eF1AUaQ2yrVDSjT5lJDyWURG0EYKGFYKj7hHHDxloiABDiePH
	PexZ5VBgCNYQJ4JwVwuvNxzEKMaroLCYhkw32HyRj3gZddJ4KjiK4VfwzI04oUDRIuR5H1gxIo7NP
	KTtj8D1Us52ASNR650kXN+5tsphEHkrRdPJlstJ6IDN+c5rzNoIzhucMOZZYbZveSSw8hJL9mZylH
	c6EMZHbwQ26/KlSuYwC45w9hrEByKTK30F4UJWrpkVysCmzmK7oDx/o2ksuKFiA+P8r8eT12TvYYl
	5BvnOgr/Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR1VH-001zrg-Q2; Mon, 29 Mar 2021 23:41:04 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQvNj-000rLP-48; Mon, 29 Mar 2021 17:09:03 +0000
Received: by mail-wm1-x32c.google.com with SMTP id
 u5-20020a7bcb050000b029010e9316b9d5so7033215wmj.2; 
 Mon, 29 Mar 2021 10:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=y2ZHeMj4ec57luc4oS02DRiziRVFT/KvHjnr58lcOHE=;
 b=NrOmoj8+szpaD0TUhTvIHhUPkTOQ4tVlROIC1p2MCcryzroeZGHR3ttV2nqcQ6oH5c
 DB5Hsax5Ay315Hv2z6ey7gCtkk5cZa32qjHVVEnR1x+IhlGqsDYxvMT8bHXri9eH5OdU
 iV91ITQsfx4xQmpheYY61o487elN7DDJXcQOKAFwhDUqzEBUwQ62Om7I411XW8n00GlQ
 zN6pBQPrqEuT2ZLESk0oz4jpwGdimFrZxe21VX1PzHzHcwrjLpmavXsAVeKqM5ZocEy3
 PmlQBi6XAX1JpR9uGn5aIq2Xe0Oo6HdvSx8rG+0qKaby+UGTty7qiwGdhpaHSCn7wjDm
 oZbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=y2ZHeMj4ec57luc4oS02DRiziRVFT/KvHjnr58lcOHE=;
 b=N/40WIU1tezMWAGD0mOghNuOojNIEiLHsCg6PNQG/puwb6abkiMC8gtYecIqHzKCxf
 nZdi2jnr+KULwO+dxenM1mfYWPz6+/KAoaP1GCfw0VyC31DApALtqRatO82yXegHycia
 CWvGR5QDjtJKl8PGOgM+qoTf5C2I7L8WtS6gaJyly2i8UKgmrysjBvcqHxAJInwQnF8J
 3DYq99oFycooZ6EOuJq6U1j0ZfAcC0nYWKM8kxt+94jqSdD+/qqJ0i14u6agbz1MUagA
 HRu/hMIBQpfSXyrkEQ5uJzznkp/W9mivcloI2xGp+3meXJjEJ4zPK4itFGF37EhYB21W
 EDWA==
X-Gm-Message-State: AOAM532xKhEdI3zNeRc2g+TxfVvrk+4X4DtJ2jcSajePSVKgi/RyABk3
 qVCIK+PRTK/wtBFQFj6kMlRJhLa0RmqFVN4W
X-Google-Smtp-Source: ABdhPJz/bx5hehJCuehhLrvgunl5jW1+LBDS5GpNha2CBGC2FnW+8T+XE8v2Vs/jtpJf5vn6ags7Iw==
X-Received: by 2002:a1c:1f4c:: with SMTP id f73mr100191wmf.25.1617037724150;
 Mon, 29 Mar 2021 10:08:44 -0700 (PDT)
Received: from ziggy.stardust (80.174.240.175.dyn.user.ono.com.
 [80.174.240.175])
 by smtp.gmail.com with ESMTPSA id c8sm34819213wrd.55.2021.03.29.10.08.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Mar 2021 10:08:43 -0700 (PDT)
Subject: Re: [v7,1/3] arm64: dts: mt8183: add thermal zone node
To: Hsin-Yi Wang <hsinyi@chromium.org>, Michael Kao <michael.kao@mediatek.com>
Cc: fan.chen@mediatek.com, Zhang Rui <rui.zhang@intel.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Linux PM <linux-pm@vger.kernel.org>, srv_heupstream@mediatek.com,
 Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
References: <20210316070144.28440-1-michael.kao@mediatek.com>
 <20210316070144.28440-2-michael.kao@mediatek.com>
 <CAJMQK-gQxMmq-4+Hb2vuTmz9T7XOZPV3=uwTp-8doHRVD4y_Jg@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <b4fb751f-c440-9a39-ea89-21c4543c9d8b@gmail.com>
Date: Mon, 29 Mar 2021 19:08:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAJMQK-gQxMmq-4+Hb2vuTmz9T7XOZPV3=uwTp-8doHRVD4y_Jg@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_180900_344426_773A83E9 
X-CRM114-Status: GOOD (  17.33  )
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



On 22/03/2021 12:20, Hsin-Yi Wang wrote:
> On Tue, Mar 16, 2021 at 3:02 PM Michael Kao <michael.kao@mediatek.com> wrote:
>>
>> From: "michael.kao" <michael.kao@mediatek.com>
>>
>> Add thermal zone node to Mediatek MT8183 dts file.
>>
>> Evaluate the thermal zone every 500ms while not cooling
>> and every 100ms when passive cooling is performed.
>>
>> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
>> Signed-off-by: Michael Kao <michael.kao@mediatek.com>
> 
> Tested-by: Hsin-Yi Wang <hsinyi@chromium.org>
> 

Applied to v5.12-next/dts64

Thanks!

> Tested this patch on mt8183 devices.
> 
>> ---
>>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 85 ++++++++++++++++++++++++
>>  1 file changed, 85 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
>> index 5b782a4769e7..d3550af06408 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
>> @@ -657,6 +657,87 @@
>>                         status = "disabled";
>>                 };
>>
>> +               thermal: thermal@1100b000 {
>> +                       #thermal-sensor-cells = <1>;
>> +                       compatible = "mediatek,mt8183-thermal";
>> +                       reg = <0 0x1100b000 0 0x1000>;
>> +                       clocks = <&infracfg CLK_INFRA_THERM>,
>> +                                <&infracfg CLK_INFRA_AUXADC>;
>> +                       clock-names = "therm", "auxadc";
>> +                       resets = <&infracfg  MT8183_INFRACFG_AO_THERM_SW_RST>;
>> +                       interrupts = <0 76 IRQ_TYPE_LEVEL_LOW>;
>> +                       mediatek,auxadc = <&auxadc>;
>> +                       mediatek,apmixedsys = <&apmixedsys>;
>> +                       nvmem-cells = <&thermal_calibration>;
>> +                       nvmem-cell-names = "calibration-data";
>> +               };
>> +
>> +               thermal-zones {
>> +                       cpu_thermal: cpu_thermal {
>> +                               polling-delay-passive = <100>;
>> +                               polling-delay = <500>;
>> +                               thermal-sensors = <&thermal 0>;
>> +                               sustainable-power = <5000>;
>> +                       };
>> +
>> +                       /* The tzts1 ~ tzts6 don't need to polling */
>> +                       /* The tzts1 ~ tzts6 don't need to thermal throttle */
>> +
>> +                       tzts1: tzts1 {
>> +                               polling-delay-passive = <0>;
>> +                               polling-delay = <0>;
>> +                               thermal-sensors = <&thermal 1>;
>> +                               sustainable-power = <5000>;
>> +                               trips {};
>> +                               cooling-maps {};
>> +                       };
>> +
>> +                       tzts2: tzts2 {
>> +                               polling-delay-passive = <0>;
>> +                               polling-delay = <0>;
>> +                               thermal-sensors = <&thermal 2>;
>> +                               sustainable-power = <5000>;
>> +                               trips {};
>> +                               cooling-maps {};
>> +                       };
>> +
>> +                       tzts3: tzts3 {
>> +                               polling-delay-passive = <0>;
>> +                               polling-delay = <0>;
>> +                               thermal-sensors = <&thermal 3>;
>> +                               sustainable-power = <5000>;
>> +                               trips {};
>> +                               cooling-maps {};
>> +                       };
>> +
>> +                       tzts4: tzts4 {
>> +                               polling-delay-passive = <0>;
>> +                               polling-delay = <0>;
>> +                               thermal-sensors = <&thermal 4>;
>> +                               sustainable-power = <5000>;
>> +                               trips {};
>> +                               cooling-maps {};
>> +                       };
>> +
>> +                       tzts5: tzts5 {
>> +                               polling-delay-passive = <0>;
>> +                               polling-delay = <0>;
>> +                               thermal-sensors = <&thermal 5>;
>> +                               sustainable-power = <5000>;
>> +                               trips {};
>> +                               cooling-maps {};
>> +                       };
>> +
>> +                       tztsABB: tztsABB {
>> +                               polling-delay-passive = <0>;
>> +                               polling-delay = <0>;
>> +                               thermal-sensors = <&thermal 6>;
>> +                               sustainable-power = <5000>;
>> +                               trips {};
>> +                               cooling-maps {};
>> +                       };
>> +               };
>> +
>>                 pwm0: pwm@1100e000 {
>>                         compatible = "mediatek,mt8183-disp-pwm";
>>                         reg = <0 0x1100e000 0 0x1000>;
>> @@ -926,6 +1007,10 @@
>>                         reg = <0 0x11f10000 0 0x1000>;
>>                         #address-cells = <1>;
>>                         #size-cells = <1>;
>> +                       thermal_calibration: calib@180 {
>> +                               reg = <0x180 0xc>;
>> +                       };
>> +
>>                         mipi_tx_calibration: calib@190 {
>>                                 reg = <0x190 0xc>;
>>                         };
>> --
>> 2.18.0
>>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
