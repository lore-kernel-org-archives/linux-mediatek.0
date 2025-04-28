Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 639D9C369DC
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Apr 2025 11:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YuK7JoVFw4BkBRnm2Ypzhevv3vdRGeuSRVhD+23HyZI=; b=iMDQvm/mH5P5dCYxOZgcIFo2Js
	xEoto/rX6/i36Gtk90PfYBnYJQbzI2XovDg7VJg+eNMFcBdkCIpugI7AXh/cvl8y4IR2/byNxdIM+
	5L8VrvFdyFNfghyJPbCEG5A0w4sItu2VuhJshQQFjM/cArrdpClizPEBLDtk0amRkmumTdwlAyGcp
	q3KFxrRU/g4zQ8IoUVvmveHxxZtXyVGLZq2VbmPokueuT9ZA92uOQxLed5TSVE1TAHSUaQo8C9K2J
	FN4ZmSl0J4wRECb4qf9K8yukIufKv/uSpHGBCJkSz/agGa8GlIV4L5nX/wSmgeQ8FMGio2OKaQWu/
	M3mLm6fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9N5Q-000000063i6-2UWz;
	Mon, 28 Apr 2025 11:55:48 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Mci-00000005x1T-3klA
	for linux-mediatek@lists.infradead.org;
	Mon, 28 Apr 2025 11:26:11 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5f62ef3c383so8631448a12.2
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Apr 2025 04:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745839566; x=1746444366; darn=lists.infradead.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YuK7JoVFw4BkBRnm2Ypzhevv3vdRGeuSRVhD+23HyZI=;
        b=orP7Q3VBGM5SR/Hx6z7/Vo2layGIMnDeo5o/0IBD6/aAxnI782UeGsraORXJR8DAvU
         paNxIRU7OpPM/AT05NYy5aqZvjg8k6gSBr7j0L2mmDew0bMIhG5LPCFffePYmZrs35rR
         zUJmnytQx9TPbF9SsjkY+2zjoiSHmTI5I8FskJ+mBjjVlQA5KAZ3hbluYkquy1XG+Sx6
         E00nJmALm8z8AiiZMaTSZZFD7WMkusD1HRiYhXryUl50tiWmtRidifIAzNiOscasgmA9
         GdFyePQ6+KsZa/gqPBdmS1fHQGin+dpJzvqThCLLy/+5vZBEQTdv+KW1Dw04bcfBsEy0
         PIsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745839566; x=1746444366;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YuK7JoVFw4BkBRnm2Ypzhevv3vdRGeuSRVhD+23HyZI=;
        b=V7uOr/UZiABu/Ewndhqx24dMcKgsJ9+NgIJr5pv/81an45bWugNZSr9ZUziSGugkDB
         QfAzpVqPYVIs6Xx+MlKdib4Q4j89Hrd6dvhXQYZU1ZzG8nPaRST2rxM4dpUG5XzMPg+F
         +xGNzCIKztBmAgGyqGuPq7XUJnWVkBDlqoWxTr4/7grao0H/yMvn6BCN0eluO2QV5m9O
         B7BWjVR4uh977uOpTSJeQlyDxbrk5t7y27DAXLT1rluGM7KzZz/PNQR3L9JvJ4rX/2Ws
         P3HlSn/o5QJMgCqTdmUXZYEQlbZjwQkKpjRePqHp0ne03N5MOegfTxDxZT8bbjvyI9nU
         9rTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXY3asmegICF9lZCkv9S8v/pzgU/0A4CV39N7aqB0BHWNGEgdDv3RBf5FOX5f61MqjEOwNVRwhv3n4FD0Rnug==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9gauCp5o554cRCYOuwBDdRq2Q9DSuRcFXTa2FGp9YMRHhr2s+
	CqoCJVQ/1Mt22Pw6k0K2w3FKxl7qB0rRDlcB/G/e0VnVj/6JUGBDAhoNTniTovQ=
X-Gm-Gg: ASbGnctvh1dT4ktXkF26UJs0yGQmpKSU3jj8u9d/KcU9U5WrlUE+F1cOsjQlDK/21Oy
	YdbmMcjVAJdvUkJGLywISp0mH3NM7guENJcIVAa5mzJti5LmjjyeCPrJ7AVFXNiFdq6AmE4s+A1
	ggJH+lwv2NTkpvlcIFnZ52NvjlQ6f0tpg4XmK6cmMif8g2aehCbZRG0uTZsWGxOC7rhjToI3hsS
	7m4SU62cbb6pmKwWqd+z8au+9UTCmItahCB9ForQMWcVbZ0uctYAME/hFnz4N6ExA1sHs96+OWK
	UZiUh4KVUF2VSZPDqlGOyUMWpMaU+fqYqwu7ZMNb2EMWGg7Wpg+JKHeHlN3+Y690SyAisXVVsp/
	5lIc5DvKxKg==
X-Google-Smtp-Source: AGHT+IGT+8m3xK7xabSZ29IvBc7+P0gS4DksBTS1Czdm2SNSBAyYHQHsIegSOcFqAFzVvUJUQUDxDA==
X-Received: by 2002:a17:907:7e84:b0:aca:d83b:611b with SMTP id a640c23a62f3a-ace84aad97bmr827114066b.43.1745839566451;
        Mon, 28 Apr 2025 04:26:06 -0700 (PDT)
Received: from localhost (31-151-138-250.dynamic.upc.nl. [31.151.138.250])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ed6b009sm609885766b.138.2025.04.28.04.26.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 04:26:06 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 28 Apr 2025 13:26:05 +0200
Message-Id: <D9I8H4AII5EG.3QKI8U79KC8SO@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Ziqi Chen" <quic_ziqichen@quicinc.com>, <quic_cang@quicinc.com>,
 <bvanassche@acm.org>, <mani@kernel.org>, <beanhuo@micron.com>,
 <avri.altman@wdc.com>, <junwoo80.lee@samsung.com>,
 <martin.petersen@oracle.com>, <quic_nguyenb@quicinc.com>,
 <quic_nitirawa@quicinc.com>, <peter.wang@mediatek.com>,
 <quic_rampraka@quicinc.com>
Cc: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Matthias Brugger"
 <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "open list:ARM/Mediatek SoC
 support:Keyword:mediatek" <linux-kernel@vger.kernel.org>, "moderated
 list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support:Keyword:mediatek" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v5 0/8] Support Multi-frequency scale for UFS
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250213080008.2984807-1-quic_ziqichen@quicinc.com>
 <D9FZ9U3AEXW4.1I12FX3YQ3JPW@fairphone.com>
 <df287609-a095-4234-b23b-d335b474a130@quicinc.com>
 <29c3852c-3218-4b42-bc41-75721a95fccc@quicinc.com>
In-Reply-To: <29c3852c-3218-4b42-bc41-75721a95fccc@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_042609_004268_60B94760 
X-CRM114-Status: GOOD (  18.88  )
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

Hi Ziqi,

On Mon Apr 28, 2025 at 10:06 AM CEST, Ziqi Chen wrote:
> Hi Luca,
>
> We made changes to fix this special platform issue and verified it can
> fix this issue.
> Could you help double check if attached 3 patched can fix it from you sid=
e?
> If it is OK from you side as well, we will submit the final patches to
> upstream

With these 3 patches applied the errors are gone and I don't see any
UFS-related warnings/errors in dmesg anymore.

Let me know if I should check on anything else. Thanks for the quick
fix!

Regards
Luca

>
> Thanks a lot~
>
> BRs
> Ziqi
>
> On 4/27/2025 4:14 PM, Ziqi Chen wrote:
>> Hi Luca,
>>=20
>> Thanks for your report.
>> Really,=C2=A0 6350 is a special platform that the UFS_PHY_AXI_CLK doesn'=
t
>> match to the UFS_PHY_UNIPRO_CORE_CLK. We already found out the root
>> cause and discussing the fix. We will submit change to fix this corner
>> case.
>>=20
>> BRs
>> Ziqi
>>=20
>> On 4/26/2025 3:48 AM, Luca Weiss wrote:
>>> Hi Ziqi,
>>>
>>> On Thu Feb 13, 2025 at 9:00 AM CET, Ziqi Chen wrote:
>>>> With OPP V2 enabled, devfreq can scale clocks amongst multiple frequen=
cy
>>>> plans. However, the gear speed is only toggled between min and max=20
>>>> during
>>>> clock scaling. Enable multi-level gear scaling by mapping clock=20
>>>> frequencies
>>>> to gear speeds, so that when devfreq scales clock frequencies we can p=
ut
>>>> the UFS link at the appropraite gear speeds accordingly.
>>>
>>> I believe this series is causing issues on SM6350:
>>>
>>> [=C2=A0=C2=A0=C2=A0 0.859449] ufshcd-qcom 1d84000.ufshc: ufs_qcom_freq_=
to_gear_speed:=20
>>> Unsupported clock freq : 200000000
>>> [=C2=A0=C2=A0=C2=A0 0.886668] ufshcd-qcom 1d84000.ufshc: UNIPRO clk fre=
q 200 MHz not=20
>>> supported
>>> [=C2=A0=C2=A0=C2=A0 0.903791] devfreq 1d84000.ufshc: dvfs failed with (=
-22) error
>>>
>>> That's with this patch, I actually haven't tried without on v6.15-rc3
>>> https://lore.kernel.org/all/20250314-sm6350-ufs-things-=20
>>> v1-2-3600362cc52c@fairphone.com/
>>>
>>> I believe the issue appears because core clk and unipro clk rates don't
>>> match on this platform, so this 200 MHz for GCC_UFS_PHY_AXI_CLK is not =
a
>>> valid unipro clock rate, but for GCC_UFS_PHY_UNIPRO_CORE_CLK it's
>>> specified to 150 MHz in the opp table.
>>>
>>> Regards
>>> Luca
>>>
>>>>
>>>> This series has been tested on below platforms -
>>>> sm8550 mtp + UFS3.1
>>>> SM8650 MTP + UFS3.1
>>>> SM8750 MTP + UFS4.0
>>=20


