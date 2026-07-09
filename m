Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B8A8C44501
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2026 08:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Voq3Sg1/b718gexVzD9pZPvNMxe2Vpa+Z96N1Vl0ne0=; b=BVwc0a4t0tGfEYf4aZ8uAS16ov
	Y67Tx3JNy1Q4mWaHyFD9ZBVcNPeFw4zPBgCf1UFK21h9jZpQ5/xIQo/JdOyOnaE51IwuJFLibqgw6
	1YqZJbO0V0ESj7VsLDhFwzU4TKVg90NZnONHw8JxaOkibHKA65g6gLi0CTUnwQwHXlFyMFsmpPySQ
	EXKfZOcVBUXs0dhpcbi7X8gqIZtcTJ5UQHlTwWKgnp8cyscOJpZbOpEBj7OpxhVKq9n0qaHqp1LK4
	toDrdMsgNQDUjR+l+3MPTh6bhACt8msFOVYPeboSmWmH1JBT4M10dOuvv/rV8WTTH/03XyNyut2ie
	yKliEYtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkWr-00000001eX0-3mcX;
	Thu, 09 Jul 2026 08:54:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkUn-00000001aSu-3yI6
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Jul 2026 08:52:40 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960aTU837412
	for <linux-mediatek@lists.infradead.org>; Thu, 9 Jul 2026 08:52:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Voq3Sg1/b718gexVzD9pZPvNMxe2Vpa+Z96N1Vl0ne0=; b=Vzmdtsv4Src4CMvg
	+mFiVwhDKpcjFXB+283QlPlKGH7IQKguo85jTg+HFc3wFGFSuuFLnxHQD9qv13PT
	7S/sayDY1+nx3mQ+hrAmpfkiafgteB8eT/y1X7YqJ+Eba5l+mKRfu78/Ot+e4G0l
	EhYIj072MvUflHuGCsTuuAjTg9QPrN2PiP8PCLjsPtjtqSZPvSc7kU0DnOE0ve+K
	Qq48+7qHO0c6pa/Qvx74sBAV2AN0fhnLy5O6H80paJOOaM4aoupOkuMRcTkk/itQ
	bnQYmf71v/cDQDxbjQ4xbE3vJX/+XYZFx1EUV5VsL/gdRSaIpkx/6CXvCjuAEvU/
	amWFRA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqwb9u9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Thu, 09 Jul 2026 08:52:36 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ccb6f6a3f4so12815635ad.1
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Jul 2026 01:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783587156; x=1784191956; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Voq3Sg1/b718gexVzD9pZPvNMxe2Vpa+Z96N1Vl0ne0=;
        b=FC5hqmntml6I1mW5LCwzHtTQUEE92aNlEyHYiiFG/hWeqT/zpyQuZMtOZvmfoCNKKP
         nGAr3RzCiqe6JxIziP5DfaKGTq5+X3tzgfam9aESYsqDn7JIYrxeiDuyGDfghp2hWj8w
         npSGyBi5tVj6v+adT8zdtL7gvCH95woSbeI+zh5qyaSejwzqq/eiuAOfdLTZ0+lCYA3K
         uJhxRn3zbJFNi/yMW4VEQOAmDvdbJLLRFkVMt9r940w5N6Ua6nDxAng6OABNPOVGaW7D
         WNTP2KYar6UFQtqbkPFDaYHQwiZ02Vt6RMvLmL7HJ/wwD+vK/Rvbq4WoVRRY1/eL56Qn
         cQUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783587156; x=1784191956;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Voq3Sg1/b718gexVzD9pZPvNMxe2Vpa+Z96N1Vl0ne0=;
        b=fbXK24PhR1KeCqOYbdHBkcBZm9g3ZlVVyjmYdAxrzf46as89YU+jIk45G141eWo3P6
         JmbP0fcTRX9ZuzmtLo6dpOIe7OeRFyn2NiBbDyE85fuSFYUnUvzeGj3/3GBNGqfldt7I
         KDuRyYMMjnubqY7d+tGtaTHaFIR1JsEYMDpCJTVX/Iy/nDpbE2sHkC6XjdeDTMQxCr1E
         q6L7kfRdN2Hi+N/mNQQacZN61uxYGHkJBws/uQTjktF3FSYOPqU/5q1/4+KFHaeHOH/l
         GMbxM3UTfUzHFc+S5LFc6Jq2SX3XzvsppdqsC4l+J06deZL2NCq2Q3YkmXM2tyrAYLZx
         ihQg==
X-Forwarded-Encrypted: i=1; AHgh+RrLRRiRf/6rWBMwGCpCTNX63cfgYDvDiCPGZ5ZZbEPQbawHatdgmAiCZXo4kHkuKYcWT0WdE7F/gujR1UY5/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxTpPNIoyTXE0GCa6uxNQYwJ0dK8nWCDUw9m8B4fo6TCJIfV+i3
	ShEHB83G1VUaAtupjm2Le9MveGwvTjaO3Px3pL4AiQBnQKWIVg5eHWJrS7VqyWKmAGnRH2TUOD9
	jVL38ehKJkRE7vXvFs44yJuMQGz5lC90vyJjtV7gKmFgJkzqwncgXsppzAlperDra4kD0oGWyjH
	4=
X-Gm-Gg: AfdE7cn46FpHgT9aQ9HAx1quQeID8vhr2nwJHPLQWmfuxAZShS4ZTNHT0QbBu+SX10t
	aOxTBVSfDHkav4uInqHL7YnLPthyO4A4sM/WAHGQg24sLe7LKrVlJBNvucQ+8kAogwCMgQmGztN
	BUnckGsL/bcn/Zwp9KW5cttXHc9GPPaVqzwXMze6JYdSxeC4f2Vsko5iIj+8fFo+c7tJMcOXz3p
	NWgCnNNC9ocurZgvrnF64eN39EVUF8nO86MU+wYby3AfRr+peCCfihi4L3xKTN9HE8IIS8C0JOs
	cFZV2bD90Z5IE+1hP9gsPRWWgQam1UUu93a6KFwTwi6aygDqrQqGc18L0KNWf6TIGlXFBzSrDsp
	p7jV5SQDoBxUZ4bZ4Sz789lW1kSjKf9UFiZv7cjIFzkU=
X-Received: by 2002:a17:902:d2c1:b0:2c9:b2c1:1401 with SMTP id d9443c01a7336-2cdd8a16112mr22278345ad.5.1783587155490;
        Thu, 09 Jul 2026 01:52:35 -0700 (PDT)
X-Received: by 2002:a17:902:d2c1:b0:2c9:b2c1:1401 with SMTP id d9443c01a7336-2cdd8a16112mr22277765ad.5.1783587154710;
        Thu, 09 Jul 2026 01:52:34 -0700 (PDT)
Received: from [10.92.212.146] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3d946sm40530765ad.66.2026.07.09.01.52.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 01:52:33 -0700 (PDT)
Message-ID: <5eecf3a0-b608-4057-b400-236f6952b380@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 14:22:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] tty: serial: propagate errors from uart_ops.pm
 callback
To: Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Richard Genoud <richard.genoud@bootlin.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Peter Korsgaard <jacmet@sunsite.dk>,
        Michal Simek <michal.simek@amd.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        bjorn.andersson@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org,
        linux-mips@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com
References: <20260709-add_return_check_for_uart_change_pm-v1-0-e85c6ffa8ec4@oss.qualcomm.com>
 <9320a573-ebf8-459b-a313-3a8b73a6180b@kernel.org>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <9320a573-ebf8-459b-a313-3a8b73a6180b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA4MyBTYWx0ZWRfX6C5+GTCURHMQ
 LZuDh9dqe6HtwtE6Sy9d/GgWwtAJ5284ShRlKMGF8FlNecHbCN/CzClnZM9R+a50L6vfJD0u1hh
 LnjvZbffYk1X0PRZBMtRtpItvESthzf9RxA4cjgkAf067Sv2QMrQPECbRsArXSUCnc/CIAaPUmv
 cFVL+hG3nfpikLFtQmSeiqHsYUnVMOGDh3Gh0HDFnwH3beXQac/h61uqwcQqdhJPdczScb5OEUQ
 +MVri0H8nRqaZqOSRpgHI3a5ZhyhdspgXsyUY9u4W62dbACKoWNP002dffXMq791AOntv7X9iTt
 OAgFR6lBB//xvU1hnoBMU3Mrp/9d1G0JctEIYhb/uvy74aCIb1oFauvgE9BJWXR5woaOOtzs764
 Qem/jj4KMzoa9n9pbItRkfiNdDqn6oiNggabOl4Ry3HEGzOjdnes9EMn4qxnwxmd9tUUSo8I5Cl
 JXFpBlrxXNEsUwV+yVQ==
X-Proofpoint-GUID: xKYUQ7oR9cjTQfsthe_J03eGfC0kwxHf
X-Authority-Analysis: v=2.4 cv=fMIJG5ae c=1 sm=1 tr=0 ts=6a4f6154 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=yxy72PdV_TLAuk9cO2cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: xKYUQ7oR9cjTQfsthe_J03eGfC0kwxHf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA4MyBTYWx0ZWRfXzk+L3GuQ57SO
 ZBLQ2AD7nJUoNhYQXrsUf6SPvHBUD5YVo2wDG1B0fvMdTCaZvupORbvRbvGDckhPHq1jzwpFtPq
 KC43i8kAaJ1zBxbRp6m5wKj7/8MGp4A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_015238_138006_45AFED80 
X-CRM114-Status: GOOD (  24.35  )
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

HI Jiri

On 09-07-2026 12:23, Jiri Slaby wrote:
> On 09. 07. 26, 8:25, Praveen Talari wrote:
>> The uart_ops.pm callback has been declared void since its introduction,
>> which means any error from a driver's power management implementation is
>> silently discarded by uart_change_pm(). Beyond losing the error
>> information, uart_change_pm() unconditionally updates state->pm_state
>> even when the underlying hardware transition failed. This causes the
>> serial core to track a power state that does not reflect reality:
>> subsequent calls to uart_change_pm() see the stale cached state as
>> matching the requested state and skip the callback entirely, leaving the
>> hardware permanently stuck with no further recovery attempt.
>>
>> On modern platforms where the .pm callback performs real work —
>> enabling clock trees, interacting with runtime PM, asserting voltage
>> regulators — this is a correctness gap. Failures are invisible to the
>> PM framework, the port proceeds to call ops->startup() on potentially
>> unpowered hardware, and suspend/resume errors are hidden from the core
>> that needs to handle them.
>>
>> This series fixes the problem in four steps:
>>
>>    Patch 1 changes the uart_ops.pm callback signature from void to int,
>>    updates uart_change_pm() to propagate errors and only commit
>>    state->pm_state on success, and handles the return value at every
>>    call site in serial_core.c with appropriate policy per context
>>    (propagate, log, or skip-on-failure).
>
> So does this break build without the below applied? IOW: breaks 
> bisectability?

You are right, patch 1 alone breaks the build since the driver 
implementations are still void until patches 2–4. The series as 
structured is not bisect-safe.

Do you have any suggestions on how to fix this issue?

>
>>    Patch 2 updates the 8250 driver family: serial8250_do_pm() and
>>    serial8250_pm() are updated to return int (with the exported symbol
>>    declaration updated in serial_8250.h), and the 8250 sub-driver
>>    pm callbacks are updated to return 0.
>>
>>    Patch 3 updates the remaining non-8250 serial drivers. All .pm
>>    implementations are updated to return 0. The sh-sci forward
>>    declaration shared with rsci is also updated.
>>
>>    Patch 4 updates arch-level implementations: SA1100 (assabet, h3xxx),
>>    OMAP1/ams-delta (modem_pm, now propagates regulator errors), and
>>    MIPS/Alchemy (alchemy_8250_pm).
>>
>> All existing .pm implementations return 0, so there is no functional
>> change for any current driver. The series purely adds the infrastructure
>> for drivers to report errors going forward, with the serial core ready
>> to handle them correctly.
>
> OK, now I miss the rationale behind the patchset. Neither there is a 
> possible code path to actually test this?
The rationale is that qcom_geni_serial_pm() calls 
pm_runtime_resume_and_get() which can fail, but its return value is 
currently discarded because the callback is void. Patch 6 in this series 
is the concrete user: it makes qcom_geni_serial_pm() propagate the 
pm_runtime_resume_and_get() error so that a failure to resume the UART 
power domain is visible at uart_port_startup() time rather than silently 
proceeding to call ops->startup() on an unpowered port.

A code path to test: on qcom platforms with CONFIG_SERIAL_QCOM_GENI 
enabled, if pm_runtime_resume_and_get() fails during 
uart_configure_port() or uart_port_startup(), the error now propagates 
to the caller instead of being dropped. The test case from development 
was injecting a failure in qcom_geni_serial_pm() and observing that 
uart_add_one_port() returns an error rather than proceeding silently.

Thanks,

Praveen Talari

>
> thanks,

