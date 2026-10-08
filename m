Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BDDACA600E
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Oct 2026 09:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NHzdCrzB5CwJNMDm2rJXhCb7qWjOLhdrunIo0lH9wqU=; b=oI5mHby6Mq+nPAvMs1/RVz6ovu
	4m4lFu81kfiqCA2jSWHGAeYhKrXqEs3NHXhwmjFUniBClvrcTF7PQKRGghU6nj4seUaYc4DQOHwQt
	nkQaz85023rw3b5c8dwctcrSh8/okJAOeSJBCemLHZpMd09IAEg9fz5t2AMACnTO+I/OYAnuCi5ic
	X6P96KsvSyP3epwi0z+NSI/3Pnw4Kh+g41wad8vzfvv6+z60zKkCOBojeFPN6RjpZa6FFGCrlFr9a
	aflXKu7Z6ws2wuCpsZF9kHMiBgzpKUpmftwQbZfmZXfkR9h+83kOaCLrrDdD+kv71RoSMYmWUhFDS
	EM3lrRpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEkWT-000000040ja-1cPW;
	Thu, 08 Oct 2026 09:34:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEkWQ-000000040ib-3MbU
	for linux-mediatek@lists.infradead.org;
	Thu, 08 Oct 2026 09:34:44 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KTdP1846440
	for <linux-mediatek@lists.infradead.org>; Thu, 8 Oct 2026 09:34:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NHzdCrzB5CwJNMDm2rJXhCb7qWjOLhdrunIo0lH9wqU=; b=ewtkd9Vv03MTGYw1
	yJqi99u4KX64v67wjKlDurhKecn+nlTJlKHFcpY5y9zKLUqGTl4KIP4IuYJhZvbQ
	Z+SSJ8secrzcFE5ePquEgmOE6RI1mYGzT8Ajq4yfHkXl9nK6/BWEdzgVQGzQllYY
	QY6pUoLYeiM2d2kIsho1zEJuFiRBDNNYfHSXgy3XfjVJFZnfv96iBGEZ+upHW9XH
	jS2TzYBehdQzEg38TBKCKBieMi8kOLnuNCpYll2XysIdx7+0L2PD5d2U6oEkUiWC
	YPftL/TO3NGVF9qkSSZpuzxQRrBwtiUR3d5uZr0lyTfwXDkf1JCEJeCvinFWQPvL
	giRHng==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3ja3t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Thu, 08 Oct 2026 09:34:41 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d6f75c1219so67202715ad.3
        for <linux-mediatek@lists.infradead.org>; Thu, 08 Oct 2026 02:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791452081; x=1792056881; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NHzdCrzB5CwJNMDm2rJXhCb7qWjOLhdrunIo0lH9wqU=;
        b=GZPwNQEZrgLSz7aLqIy9HTYmxu+jiIIc1148X2rkvVKZHEKC347uByOMwqoMGSfWT8
         qP2vvGg700688wx2ZDvwkPRtzggDGPjy6AcTown44J9mPDidL338PvjPUopxrBDSlxSv
         Rn4zfXcrNbLa1tPvu6qVVQ2vXBKRB9Pg9LL9RGpWdwLQlVFsreianJ+mUKzWni9gguyK
         vZKEeegdMtVSIH65YH8bDm856bJ64HoM8G2r3Y7jkStH4TPR89gq0TpWM44ts7DvFA2D
         svPrigTxMR6/m4vpfnej3zfME4+Isn3CvnkLD/CM7ic60D0ArUbvmVmDpKoV7+S05HOk
         +rgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791452081; x=1792056881;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NHzdCrzB5CwJNMDm2rJXhCb7qWjOLhdrunIo0lH9wqU=;
        b=aBtD3ZeUsJziheQtIAkia7kd7PDCfRWaWR9ixvXAmr/UWgzsFmhIAK2Gr8wOaM4Ye0
         3Kq1XB7xqs5fEq1Q5oS6a620Uy1vl3zmbDD+M7wDG2zVTCxThzOW0hfgIFkEBrxalqQi
         iHZi163ztIXIW2ODLpvnlAmq7JKs39iNv0XCu8flBxtYdk9yMCouitHFKLr/m+64nk/m
         zT5ASQYDlkW2eygf5ZAwEB0ID6Sind7GYq7UlGMAs5b6U52pbcF8/T8DTgtK2HJPQ2Qp
         m04h/Q8BXfR8puRi874kYQhzngCX8qhiRwdmfuC2DFhnfa55seeBPmZVHmHFzM/dL3hk
         BGNQ==
X-Forwarded-Encrypted: i=1; AKwUvByKLBIvy1/lTyF+izmPpCgJ/rrr8EIRrQQmq+rurlE+8yutkRZRDl5WMRJu5KoAcy+cydLGKs0+ywEga3IXnQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYKbI6Q4XXM+WRbT1J67gLA49zOsnFuJNZ7zNl4msFoAnc/Mw83n
	RAGpRzkp0T8UgKTTu0Br4BP+ZYUifge3bBdVQQSw+z74qlw9Okj46XJE/m4uZ8t39PuXdSmZ6Xl
	s1mPN6zppMR5QcAHUPY+u7sic1tSJMAdx2npQLd8jDh1LOv4JaL8rANpbaiWSfM8y0DOC7VUjow
	E=
X-Gm-Gg: AYBFou2Bv2EmC7YUhXhYLSlmxOmHjdsC4c7xm98tt91zwAHlZ5/rwNuCwHDjsda3qDn
	YDnV8AQea4Hd/NV/Mh9JybzkdGjXs9LdNiUgvtPszsc+ad1Abbwl2WahObTPalzwudFr62AYy5e
	bx6LIoTRfng6gJmzoEj7iHjBQTU/FDV0nMYtS3UsKsx9iRpkZHQFM9Ne4qPYsYhH6vXM+JwUraJ
	s3sPNvNFZQ94JiWERuG8+sILEEws9FNjqexj1OZ5VdVYu6RHqC6JYv/Hs8k95uWZAAFOOVT545K
	pk/reTOiNk42G96kUYv3T+HMWcj2BzMumryEP8i3N/F/yV32u+9TjN+xx0R1Q3jUAgBkyydJUYo
	SNYx7faGiDjVUyLMcHBFe/+2Fdso=
X-Received: by 2002:a17:903:3504:b0:2e1:35f0:6822 with SMTP id d9443c01a7336-2e5ffa150bemr49850925ad.2.1791452080642;
        Thu, 08 Oct 2026 02:34:40 -0700 (PDT)
X-Received: by 2002:a17:903:3504:b0:2e1:35f0:6822 with SMTP id d9443c01a7336-2e5ffa150bemr49850655ad.2.1791452080181;
        Thu, 08 Oct 2026 02:34:40 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e604a46604sm22029495ad.72.2026.10.08.02.34.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 02:34:39 -0700 (PDT)
Message-ID: <041edb78-acc2-4832-8500-28db58db1529@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 15:04:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/21] arm64: dts: apple: t8103-j313: Add
 speaker/headset jack nodes
To: James Calligeros <jcalligeros99@gmail.com>
Cc: David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
        Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-11-7b47ed6335a8@gmail.com>
 <31d91f44-3f16-4a4c-916c-f4d8107d371e@oss.qualcomm.com>
 <CAHgNfTy-h8m-XBBzW6jSNBz0dVe=vXL6nJ3VOqgMjCbsK_t6gA@mail.gmail.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <CAHgNfTy-h8m-XBBzW6jSNBz0dVe=vXL6nJ3VOqgMjCbsK_t6gA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzNyBTYWx0ZWRfX+pL3EKopwOg3
 g4GA36O9ok1OE9GJmb/PZghmWYLlMgYLU17yp2pzJYX0znXBS4m150eHtQ2Y5wx1KRwET+dI77F
 Q8fXoqXmuPur+9l2Dwo+OMouKu9w5l0=
X-Proofpoint-ORIG-GUID: sO8UM9x3ZE-arTE3a50PgQ-UXPlAsl3e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzNyBTYWx0ZWRfX8lGCkHy2WJey
 nkfGeIuEEyS5oPPaB5QW4pAyp2KInY5JOzvmLhYk5Lg524i08PDtIGxSZyKJWAD/WfOZ0OeTIH8
 tCV/u/M9IO7nuDNSKVWZT3++8OjsA+zM32FQRRP3SN9vsv87K7ScHyPuDcOT1EIjihoVJTjoA8k
 3M09WvcnudfvPLNVba/nTRQWakSznAGJrWQGrbAw0QoBqlkkZoyuH6BdaLV8yMqCRKKcc9E2n94
 dtmjNsqpPMH94n7mykpU4gVh4fifEyogP8rsFPdegznmJfgcmBGH+Q4vWXc61CsuEGxBdY058RQ
 Zkzz7KAiKkH3yGOBfoVqZSYZrNjHKr/HZQx9ZaH6PzhUa9kAoMSS3jHoeza0kal9yLqWu/5EhrW
 pVBSyX6GUmcO9M3r7aebHhxa0IVfco6+eMAMfEOrWcjlMPDll2DOESB90Dg2VwgQxIK7LlocaUe
 LrLcZOKCynMAO6Y7avw==
X-Authority-Analysis: v=2.4 cv=IIuXmQvG c=1 sm=1 tr=0 ts=6ac763b1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=k_whtCd4PG3F-9RvoSsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: sO8UM9x3ZE-arTE3a50PgQ-UXPlAsl3e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_023442_956151_E2692A5F 
X-CRM114-Status: GOOD (  17.50  )
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



On 10/8/2026 2:16 PM, James Calligeros wrote:
> On Thu, Oct 8, 2026 at 4:33 AM Ajay Kumar Nandam
> <ajay.nandam@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 10/4/2026 11:33 AM, James Calligeros wrote:
>>> +&i2c3 {
>>> +     status = "okay";
>>> +
>>> +     speaker_right: codec@34 {
>>> +             compatible = "ti,tas5770l";
>>> +             reg = <0x34>;
>>> +             interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
>>> +             shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
>>> +             #sound-dai-cells = <0>;
>>
>> Both speaker codec nodes reference the same shutdown GPIO. Is that
>> intentional for this board?
>>
>> The TAS2770 driver requests 'shutdown-gpios' per codec instance, and
>> GPIO requests are exclusive by default. So I would expect only one codec
>> instance to own this line, while the other appears to fall back to the
>> register-only path after the GPIO request fails.
>>
>> If GPIO181 is a shared physical shutdown line for both amps, how is the
>> power/reset ordering expected to work across probe, suspend, and resume
>> when only one of the two codec driver instances controls that line?
> 
> We use the new(ish) shared GPIO proxy stuff[1] and it all Just Works.
> 
> [1] https://lore.kernel.org/asahi/20260831-apple-shared-gpio-v1-0-e855b12e18ce@gmail.com/

Thanks for pointing that out. I missed the shared GPIO proxy dependency
when looking at the DTS nodes.

That addresses my concern about the shared shutdown line.

Thanks
Ajay Kumar Nandam


