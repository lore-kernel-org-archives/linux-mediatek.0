Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53739FF8868
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Apr 2026 15:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lQvr3HqZaYp+UEyF/WHggwgU/+Wku1+tGGZLVfhVsJ0=; b=L20dJouKxHsb7tWObUao1q0xBS
	nKYBiQwZJIlZAyRjMqcv7qOtKq0+nNSSkbQhAIy1UwE+C2TvHrY5V9Z9djTk6GuPk1xMw5pWxoOVI
	/cxhxojzmOxdzvz9/EPYE+TXlxVsN0nyANo10EIZzI8FPfIrOY0TMvzBIZC70RLbQfDvLGnFTM/U1
	OjsQsSNRvhWGv8a3L3XwXhmBUjcArUqGTy073v2OR2n+6EQdXJmxJeAUKPjqA31WDQTQUHhp95yS8
	DHPY4Xau5w3EmBV+cZBIKFDThYwIHd5ZJyrivs4rG2o/H1f3wcVi20NFZLsbu33dk8Z+Sk8MmI43T
	029YIhMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHk2a-00000001hz3-468F;
	Tue, 28 Apr 2026 15:08:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHk2Y-00000001hyI-0QiM
	for linux-mediatek@lists.infradead.org;
	Tue, 28 Apr 2026 15:07:59 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SAhVBF819269
	for <linux-mediatek@lists.infradead.org>; Tue, 28 Apr 2026 15:07:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lQvr3HqZaYp+UEyF/WHggwgU/+Wku1+tGGZLVfhVsJ0=; b=ZCsSoChGlKhfmAsA
	HZgYdwPv9KNoOwnzQKU5JsawlehAw7BIfRIsxCDfxisRqIrhj0q8aUsa4yFx6+Z+
	VRjFASQgTzz/6ez0t5C4PWhVoCGxr8W1ww5/4f/lM/dTxIioJFIQ+XpKi0OtL73J
	7Mmo/ErQOeFbAdaMVK5ZQm9HPQDBbB15j9sbhA4mhjFp0XohDDy9lSU3uqrGlgq2
	INlcD6Re7EkQRUdCvVrt+0dJgEs9wG/DBrupKRrslMIsHrgCnfsP233RuflXc8Yp
	HMKfP418NcCBHMLO5Tr0FIug/FKkA0S3UrX4k3aRWY0q5Vx53WAJhttTSwLOyPGC
	wubAnQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtud2116k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Tue, 28 Apr 2026 15:07:57 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-60580db2539so8689177137.1
        for <linux-mediatek@lists.infradead.org>; Tue, 28 Apr 2026 08:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777388876; x=1777993676; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lQvr3HqZaYp+UEyF/WHggwgU/+Wku1+tGGZLVfhVsJ0=;
        b=FeoF+0J7IjPQFi630720PSIZOBfqHowiMyb70TBg9Vh3sYuq2qp9L4OLbAiYI2zxQl
         3ou4eHylIPyjP2jV4GTEt/NIgIKfnBimP1+XfV1m1CN+i41zustqjnnWfwbfIhhupFl5
         y8/FMjBomVFndrG62sLskngZdzWASRVL6tNyz0NJSzBrWcaodr4TxWXCgp/aZbafWisR
         cvSf/YeSN/dXO9aC220JNLpg2AmlUnLkR4wGpCafNaFftN0mhbcSovC1lA3o7RhAuLBg
         1lKhedqaWR9XWMrYFWE4mVpYDcvEuPXEQHiM5jrcLbtMcfE6Aac18SRVg6+qt7LMU75W
         6oFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777388876; x=1777993676;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lQvr3HqZaYp+UEyF/WHggwgU/+Wku1+tGGZLVfhVsJ0=;
        b=tTnkZKqI+3CewhHaamUB6Ql169E/WRgcM4bxR3pMFfH/mwowRvflKTE0qHoMAOCD0e
         FzMnKPd0W4dmveBzhXiLB1Y0/9N33rBVrsukkwFnD6DRgaja1fHw87ttA8hGz9XrVyoD
         a/2umPdbOVWnqQxLbR4PVxUJ+zSDiLqr/3H++V0h+l1LUkw5GyJfm5ikf/6enXq242Vf
         sFQV7+wo+wqsYerkjpxElpoCy/dy8fMS+tUingk3lcP6naVb7WUbKMqIqCfM4Hp1BOgc
         xPDwYcX8mm3QvX21o0ndgJS6WyAcX0xCmNQKZuhi+KYFPCD4+SLT8BHW+vLrTOOMewBj
         6xDQ==
X-Forwarded-Encrypted: i=1; AFNElJ/P3jN1I3yBGZfzBMnkDIWUzJeQZaQbSMxMMOUT/lNP6sBK7b3fxXyY79TYSFZjSjEU8eMyxdWKGxaN+lblqg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzWE0n7cJH5lbguQikecclPVDe3KvdOouQi/UmA0q+O5xT1ROH2
	oGnMYGFJexxQ7UIvoZydj6vRA0bMHgxAknQDRQknhuSzhVVm8D7vObR3jWcXK1DBGBahlWqHs6v
	rAjNfTD7wC7JYFp9mIJJlhPsqX8SnhdgHMkYWXDuxfl6Q4seeOHfZcU5tSxjv2Si0VDfAv/fL0f
	4=
X-Gm-Gg: AeBDietfSfNa9OOj0OHg7ubGgXEq/t1jB13DlnByV8dUT1SEJfmuB3Ihf8kp14kv/SV
	x2ptM9tx6CKMmihpZe16t/PPy5gm/yPLZtOXUZyb5IBZPalk6+xIQzKFtM7UthvEPdBYdTcGmzV
	zpDZRWtzX0EarWx7yJYMPMtNe0Zh74jAgTG6hZdmYy94tEo0AIvAPCb6cKFn+Gd/3eMfGeA5TLs
	ngNdUws2rdaYyp8ziPHrTmAXrKx1uC5sp3jSD+GDH9DEIJ8xGsQLF8sM5AfJ1LzlMrCSWrpd5vz
	OJ3roFPOYDmHMYfmVSbFZaQjEx8luL7+dm7jX29ou34R295NQ+sdMwMaDHzt79Cu/DHxI837/+S
	1PnUehoHPt2lrTj/V7um1xH/3mCv78Gq9LGl6cepZOEocy65vFn/MDJHMeBk=
X-Received: by 2002:a05:6102:2d01:b0:600:3b3e:681a with SMTP id ada2fe7eead31-62800ef9c07mr1263543137.14.1777388876427;
        Tue, 28 Apr 2026 08:07:56 -0700 (PDT)
X-Received: by 2002:a05:6102:2d01:b0:600:3b3e:681a with SMTP id ada2fe7eead31-62800ef9c07mr1263490137.14.1777388875934;
        Tue, 28 Apr 2026 08:07:55 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4463cb59e90sm6722120f8f.3.2026.04.28.08.07.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 08:07:54 -0700 (PDT)
Message-ID: <bb0e5f69-d451-4d95-8a4e-38d18582ccb2@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 17:07:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm: mediatek: MAINTAINERS: Include SoC bindings
To: Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20260329085353.8649-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260329085353.8649-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a/0AM0SF c=1 sm=1 tr=0 ts=69f0cd4d cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=iRksgOEJMbIMnSfDDU0A:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: 3nhwod0zvCq3AABfQNUQeDm5bifLJBLW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDE0MyBTYWx0ZWRfX4SIcKEfo7Vvc
 sjwkGE5+nvc23se8FtqJ1WZ5rWT8q6KcOYD4e+f1yVtiiRkBdyjMpTwjmBKZ83Uf6HExRlKM1g7
 raTKtXjElPQBZQusozIxBa76zJPog3/Oao7r6M4QaeftZsGnjrYg+gJ9uis9YkndlwlxMJDE5vx
 Qe+Pc+YXemEcP+HeK5rzrs7xFNAtHdzauTYQRZ3u4VTgSWQlTJYXkuynkq99RFj1ROImWPHOR01
 FFYJn0bEPkT0KeTrbkmyER0aiBj7JmrgLDLO/KEfYD2A5YB/ZOFoszhtCJfze5si87vGR/meH38
 QYZ3amyKEzGiQDBjdVNDGfEYA4evCbrfNPrS3zI9boeEgsiym5GDi49AGChbhi7OUI5O1HrOhAB
 8abPRpKxXj17CieYi0p2Mr4gUcPuk3tZTSQWB9plQtZ8PaoUB58vIpRzVmCzRnmhbq2e4SbB+vf
 SxnCp7zFwvsgLG+jqKQ==
X-Proofpoint-GUID: 3nhwod0zvCq3AABfQNUQeDm5bifLJBLW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_080758_268011_A1A262D0 
X-CRM114-Status: GOOD (  13.32  )
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

On 29/03/2026 10:53, Krzysztof Kozlowski wrote:
> The ARM/ARM64 Mediatek SoC maintainer entry misses bindings directory
> for SoC devices.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> FYI, there are already patches on the list which used get_maintainers.pl
> script and did not CC Mediatek maintainers, so they might get
> forgotten/missed.
> 

This patch did not receive any comments from Mediatek maintainers - do
you plan to apply it?

Best regards,
Krzysztof

