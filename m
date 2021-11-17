Return-Path: <SRS0=BaWb=QE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2643DC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 18:01:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E875D61AF7
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 18:01:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E875D61AF7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nAv0nfmG9xLwFDC2tAH38oKSOThWQRFCm/rJrOZsQHs=; b=B3GZB8uEDmVPXK
	qhynxWi4iHB9cB2aXedLRPLFcvBxooXeF3VA0j3i3qlDF8GblOR0hMqaZ5PlQgJZP3BLE20qkMRX2
	dn/If+OJafo23Zfnj/UhYPeO0wKJNLLw7BUwwLHs0xByWtBzUa/HdzHsXRURt1ZDxK+qujePvgn23
	SZdkMUa9de3VFVChV/Hu1G/Ao5TE7gAzHrppYJvPVJ7RPbcXkZT5huw8ZU1Uiv/lkJl6F+jfN49M5
	tNkZltSrDG4KI1hcFCtMOdzcWQtpU6XQ3tDYLpHG2bXE7a1Itg/UlgnctNN5es5gH1ds+JoymBMek
	78d+8DU7Ye/i62RTwlzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnPFN-0061Cx-V2; Wed, 17 Nov 2021 18:01:26 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnP8n-005yPl-58; Wed, 17 Nov 2021 17:54:38 +0000
Received: by mail-wm1-x331.google.com with SMTP id
 b184-20020a1c1bc1000000b0033140bf8dd5so2751297wmb.5; 
 Wed, 17 Nov 2021 09:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=NxuLEKIm0mXrsHGG2Rnv1TyH8J27v/jCNCdg57uUOwk=;
 b=br8vmMvp8cjSC2cQS37z8XFmzlVPwzqxSZqD8h/oMhNrGhzSuNCSgt7WQ3aFH+XLNw
 DwvuMtsXME7FCS/8bsJxMfjSO3Q9ZMcTEXg4umtEj+ijuSnGCjMocLkj+9/5194ksfMS
 MIcgIkumprcAbKWR8ugkkobjjvxk2fv1/VoOXL3/QV51pIitQlHCHXHn5GITD9IicieS
 uO5JYJfpC4nLaK5r0SBPqGHCDJidIYq8AW3M/6cDJahTAzUup6pmaxZWlb49k/vHLsqr
 9eVXv2RW9pA4y5LijhVAm6KTttY1Q63hQYqGb0VzXZ9StTBiqUeEGng/hmqN2BfW7KTC
 Kwxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NxuLEKIm0mXrsHGG2Rnv1TyH8J27v/jCNCdg57uUOwk=;
 b=42cZIm/M9RA7dFlqtBBdTEuHxjt/gXNusYy4eYp3K1HHqEZ05Nco0+XXkcrM5MOfPB
 Q2Bl6M7nXpiRDjubJi3O1/ISMaLpNCV22ux1CAa8y8tcCPHz7w0K3yN5AqeFMXwqxEoa
 ElBn5vKzHtVfUBxHDrpAj318L52a7CZxFPFFogMQN3CjAcK+3y8KDX4QYw8F8s/jc2Kg
 XG8iuukAvs3ANPjeUTihSHY4+NWrjYdKC5JRJz+VV3wTT2RsvGt9eIDKD0YIyUH2AGcZ
 C2/m79Lp6fvgI7tjRjvmvvV0tcjj3U0drKOFy9zyS6LsDFVvJAnQVRf5hcARSt2d8O4T
 sayQ==
X-Gm-Message-State: AOAM533oqKWVSAJDi8tBT2KrSosTR/IeOqzaauPZLqu2+0Uv9hZeuPWJ
 Yppwy5MTGGVM2K2m8uUM2IQ=
X-Google-Smtp-Source: ABdhPJylfeVPDVluNe8Z1is9/DaZeUH9l24hBfQrovOruKeoN87UMCnek+wHL8acgy+jli87m8PJkA==
X-Received: by 2002:a05:600c:21c3:: with SMTP id
 x3mr1762917wmj.13.1637171675530; 
 Wed, 17 Nov 2021 09:54:35 -0800 (PST)
Received: from [192.168.0.18] (static-160-219-86-188.ipcom.comunitel.net.
 [188.86.219.160])
 by smtp.gmail.com with ESMTPSA id b10sm553689wrt.36.2021.11.17.09.54.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 09:54:35 -0800 (PST)
Message-ID: <b3f2391e-7310-ea85-515b-c52caebb66f2@gmail.com>
Date: Wed, 17 Nov 2021 18:54:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/1] arm64: dts: mt8183-kukui: Update Tboard sensor
 mapping table
Content-Language: en-US
To: Ben Tseng <ben.tseng@mediatek.com>, Fan Chen <fan.chen@mediatek.com>,
 Zhang Rui <rui.zhang@intel.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 linux-pm@vger.kernel.org, srv_heupstream@mediatek.com
Cc: Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, hsinyi@chromium.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20211103033044.2777-1-ben.tseng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20211103033044.2777-1-ben.tseng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_095437_302543_F42CB8F8 
X-CRM114-Status: GOOD (  15.14  )
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



On 03/11/2021 04:30, Ben Tseng wrote:
> According to auxadc change the readback value from raw data to Vsense.
> Update the tboard table that temperature map to Vsense.
> 
> pull-up voltage: 1800 mv
> pull-up resistor: 75K
> 
> Vsense = pull-up voltage * Rntc / ( pull-up resistor + Rntc )
> 
> Signed-off-by: Ben Tseng <ben.tseng@mediatek.com>
> 

Applied to v5.16-next/dts64

Thanks!

> ---
>   .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 108 +++++++++---------
>   1 file changed, 54 insertions(+), 54 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> index 8e9cf36a9a41..65447de64f06 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> @@ -151,33 +151,33 @@
>   		#thermal-sensor-cells = <0>;
>   		io-channels = <&auxadc 0>;
>   		io-channel-names = "sensor-channel";
> -		temperature-lookup-table = <    (-5000) 4241
> -						0 4063
> -						5000 3856
> -						10000 3621
> -						15000 3364
> -						20000 3091
> -						25000 2810
> -						30000 2526
> -						35000 2247
> -						40000 1982
> -						45000 1734
> -						50000 1507
> -						55000 1305
> -						60000 1122
> -						65000 964
> -						70000 827
> -						75000 710
> -						80000 606
> -						85000 519
> -						90000 445
> -						95000 382
> -						100000 330
> -						105000 284
> -						110000 245
> -						115000 213
> -						120000 183
> -						125000 161>;
> +		temperature-lookup-table = <    (-5000) 1553
> +						0 1488
> +						5000 1412
> +						10000 1326
> +						15000 1232
> +						20000 1132
> +						25000 1029
> +						30000 925
> +						35000 823
> +						40000 726
> +						45000 635
> +						50000 552
> +						55000 478
> +						60000 411
> +						65000 353
> +						70000 303
> +						75000 260
> +						80000 222
> +						85000 190
> +						90000 163
> +						95000 140
> +						100000 121
> +						105000 104
> +						110000 90
> +						115000 78
> +						120000 67
> +						125000 59>;
>   	};
>   
>   	tboard_thermistor2: thermal-sensor2 {
> @@ -185,33 +185,33 @@
>   		#thermal-sensor-cells = <0>;
>   		io-channels = <&auxadc 1>;
>   		io-channel-names = "sensor-channel";
> -		temperature-lookup-table = <    (-5000) 4241
> -						0 4063
> -						5000 3856
> -						10000 3621
> -						15000 3364
> -						20000 3091
> -						25000 2810
> -						30000 2526
> -						35000 2247
> -						40000 1982
> -						45000 1734
> -						50000 1507
> -						55000 1305
> -						60000 1122
> -						65000 964
> -						70000 827
> -						75000 710
> -						80000 606
> -						85000 519
> -						90000 445
> -						95000 382
> -						100000 330
> -						105000 284
> -						110000 245
> -						115000 213
> -						120000 183
> -						125000 161>;
> +		temperature-lookup-table = <    (-5000) 1553
> +						0 1488
> +						5000 1412
> +						10000 1326
> +						15000 1232
> +						20000 1132
> +						25000 1029
> +						30000 925
> +						35000 823
> +						40000 726
> +						45000 635
> +						50000 552
> +						55000 478
> +						60000 411
> +						65000 353
> +						70000 303
> +						75000 260
> +						80000 222
> +						85000 190
> +						90000 163
> +						95000 140
> +						100000 121
> +						105000 104
> +						110000 90
> +						115000 78
> +						120000 67
> +						125000 59>;
>   	};
>   };
>   
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
