Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01FE6F0183A
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2026 14:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YXGlJMtwlNbzmIK4AsQF7tf4SFG4KHJRxXMi3UOORvw=; b=4LtYvpc3Zze3WAVmJDJgqRmVVN
	rnK+LKYcmYXqUsvZPccTQhtzOQq2QJcsQg6KAQkqZCvvqDk19CoLNLyP2lzDmISRmxLoVVRizXNwf
	9Oz7Py+A6xYI6eCR3IYPd9B8p0/jw9XWC3aaJUNJ//9kDBGKY7JH48yzcrJ0WCE9EMvsBB4Pks8fO
	df+T8Xr9vn6XRfQHpBPy+W9DJs4JPurdHeoEiskGgKql2hywha9KaHVwA0gcer3UEXRVpYb0xSG/c
	ibSkUH7KgCJvk0tePKZShX/+YcJKiHbb6hNAiAcfR3coPL6cpivHrOIHjQzmsTC6rLxtOK1fNvW8H
	Vtr9OcJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVwb-00000003sfm-3y6N;
	Fri, 06 Mar 2026 14:14:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVwY-00000003sf7-41h7
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Mar 2026 14:14:20 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626BakDb4186067
	for <linux-mediatek@lists.infradead.org>; Fri, 6 Mar 2026 14:14:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YXGlJMtwlNbzmIK4AsQF7tf4SFG4KHJRxXMi3UOORvw=; b=NcbHDJJQW/xr23HL
	K80Rd9I2mBgtFGG6KsJXj0GBODHAV0rflxvT7L8C5nCUBWJiXlc0zoaDinnMsUBY
	yAqd2+Tkq549Gv4CiHs9puYpOc9ouNp+H5R4Gup76+t4YUPEFA/Mcjrtt0mUp3H9
	/SfDOezBDmkAPM9Y6hcsKrNmFZQM8z83CQn+49TS4f8XoyvuPNe5qQ77X/tO/0AR
	fZgtdF17cN/B+qU5TEQtlDKXt5Xx5C8tEW0Cs39zIoBeLRkvEjxPeG78vG+nnBwe
	Bcd1QfDBBk845dUA2NWujogKmLFZMkjWBRbiK5Cpocsizo5YbA56GIVpFTGrFxYB
	yC2npw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqruk9mva-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Fri, 06 Mar 2026 14:14:17 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ae4f27033cso57938955ad.3
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Mar 2026 06:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772806457; x=1773411257; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YXGlJMtwlNbzmIK4AsQF7tf4SFG4KHJRxXMi3UOORvw=;
        b=AcjqZhdp+07zZNwe48fWwTzpQbo0JTfrWkS/xC2I034qFgFaC9G2x3noCuziqoEHfn
         S480DkTbQo8daelIdhpEVnPXJI1kegrW20gb9Rf2+OI73YVMVSa3MyXQqk7dK8j4imYa
         sD5RmYVYSeLfhNhrszaa6eTgce4/nQkqfb8x5vuuts6qUZYIm21S0J9FK223ESKuWstm
         76Y8NGkQzCMyntYyY5as33/bRO7qrtrSB88HPW1CP5o/s/rzxYg3dl4mzu9bGGVNxP1i
         fkcEGNF7fF4ceHCw0af6fcWjhed5ozePLEtggoTJnAgE+0RaiJSKR9OHW96mNzVcyfS5
         hdtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772806457; x=1773411257;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YXGlJMtwlNbzmIK4AsQF7tf4SFG4KHJRxXMi3UOORvw=;
        b=EZVcSP41cein4Kn4PI2AEKWz2bWhXbUpyQamKQYsrCFzYAHwl8fovyqHpJZoyupwaj
         Z+M6mXDlPDV6GDrac6WE2GqH9TZkWyoK568gLvT85TJZAM6Rng8ROqgctW0S0hkebj83
         o+3Uc5oaX5fBgwoLtYRzjpG+2hgBXGGr3R/r7yoCKHH+Ztw/sKTu3YbCK1d7DZNuiMFn
         enTX6PLjD6hFuq+MTIKfwlOiJc+QIatvFWlVHMp1zRskorhmenM1iGGiU0l4AoM1UV9U
         XchwhieE4GQ7LviXWlREtq3f5gEGFPl9HqSmV5WJIkerIxIBHjECCgKRbIE8DlENwpAK
         +DHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTiPAw/D0v6JMR0rl2u6luf7wDaL0akZZby+VNIRJfGAE/zRGJ1t5jcpRkA/3/4tKsE617kKawLQd9Rg4MlQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yykl+UWsHPhpFUB42qZHraUPis0X4xLAFBUs88olcs1jaRJ9DZM
	LNPQFjvcsT6sFNdgTnESx1/b9p0xzyBjsk3pS5bv9CJij/zT4gWY8CKOnhZRjN7WPZC42v1LfAT
	cvWclEkK+/+/lEtuUabOjlVoDWkEiJZnBTyw7Jy9cbhs6V04vNVDMUFG98Zvx/utI1kVFjHP+JS
	s=
X-Gm-Gg: ATEYQzx3vcOn2e6U0pfDixYmqB/NFzOvYxMz5Pb38hCa5/nkSIq5Xn+bak8i29SH5Dv
	qTxUdSM41llZxQNToxEQDK0sQMcr+4sGvb5ylc0SzIrIVUojEgZm+5sQxkTqgMEWDhfQCxyCecH
	tx8+lR7+7mtoSIy1hLiUurnRVmImWStBJOlpLKggwsevgOhIg3nklc3X9YdzYj+PEp2BHZu9lA+
	VyLp4q5kgskCf2gW8zavYzouPgJwyYjed/4PW4pgDnOqIGNpdg9DWSMici+4soX8nmfSBF6yjlD
	/gQx3NFxtSBzgDkH6KsR6eXpeJfZVUmAEUS1uCUl8GX2gJpLLRTkPfJ2QFEQ5liRdCWiEvvTmsN
	kWJKvLkMo1LyWt340bQ1feq774gdXtIbKHJ60gzYAc6rxbXppaOWtlwzMup9fdBcLzzPeMsVYDS
	sFRYL7JWcq1t4=
X-Received: by 2002:a17:903:1108:b0:2ae:5426:da46 with SMTP id d9443c01a7336-2ae82432d71mr25502765ad.29.1772806456437;
        Fri, 06 Mar 2026 06:14:16 -0800 (PST)
X-Received: by 2002:a17:903:1108:b0:2ae:5426:da46 with SMTP id d9443c01a7336-2ae82432d71mr25502415ad.29.1772806455714;
        Fri, 06 Mar 2026 06:14:15 -0800 (PST)
Received: from [10.133.33.226] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e585b3sm24906255ad.10.2026.03.06.06.14.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 06:14:15 -0800 (PST)
Message-ID: <072aa8b3-151f-4b6b-85c4-eb9c9f50b859@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 22:14:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/11] scsi: ufs: Add TX Equalization support for UFS
 5.0
To: Bean Huo <beanhuo@iokpp.de>, avri.altman@wdc.com, bvanassche@acm.org,
        beanhuo@micron.com, martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        "open list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-mediatek@lists.infradead.org>
References: <20260304135313.413688-1-can.guo@oss.qualcomm.com>
 <e116e78ad9590f5845aaaf7d4e26833a7a0194d0.camel@iokpp.de>
Content-Language: en-US
From: Can Guo <can.guo@oss.qualcomm.com>
In-Reply-To: <e116e78ad9590f5845aaaf7d4e26833a7a0194d0.camel@iokpp.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDEzNiBTYWx0ZWRfX3+MJUZZe+xGB
 CPwbvstK2D1TfUyUe60a3YA3bG+w7ZHt3/qWdr9DAijOUyaQSE8aIt6/LNXdU4KryyjzbGgUO+D
 +49RYDbXOHpqFnf303PRrVnqIA9JKbnUgIKDKXRvzCM4TRcvtJ/rKG6OA+CD4fskw7O3VzRdMa9
 RtmifJcGKRE+dWo+tB3yqa30AayOm3r+3dnQMJzQn3VRqwEZtC3ArWDdo9n0RnqL+oDlhDuRNRn
 E6BSbIIXbbF29r8j8oe6+pVyXTQqxUh+FcX1+E0gLlvn+pFPGLK2ZuMdzBCkyevmmBOvPUGJZ7y
 P98BT3Cl6V6Yjdr7GicGDwFnXjKArDL/Jnr5Crb5HXVYJ3Rb95yisf3hQyUaU7IntH9QpQInyn+
 EpqdV5w+UeQLh2UegTOBFG4SLtfCx5B4hxx3tlbz7GKm+XY+pBAMMM8F5Cr7WkOjTg+LQ3Du+5K
 WIYmc2yKMqkhk8/6iWw==
X-Proofpoint-ORIG-GUID: cGed84SnojBTa36H3kmeKTxtYZ2QkJCc
X-Authority-Analysis: v=2.4 cv=DvZbOW/+ c=1 sm=1 tr=0 ts=69aae139 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=i1lnRYMTL1kKw9KRX74A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: cGed84SnojBTa36H3kmeKTxtYZ2QkJCc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_061419_130407_8CC8962F 
X-CRM114-Status: GOOD (  16.19  )
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



On 3/5/2026 11:04 PM, Bean Huo wrote:
> Can,
>
> On Wed, 2026-03-04 at 05:53 -0800, Can Guo wrote:
>> Hi,
>>
>> The UFS 5.0 standard was published today,
> Myabe replace time sensitive wording “published today” with stable wording?
That is also my plan for next version, thanks!
>
>
>> introducing support for HS-G6
>> (23.2 Gbps per lane) through the new UniPro V3.0 interconnect layer and
>> M-PHY V6.0 physical layer specifications. To achieve reliable operation
>> at these higher speeds, UniPro V3.0 introduces TX Equalization and
>> Pre-Coding mechanisms that are essential for signal integrity.
>>
>> This patch series implements TX Equalization support in the UFS core
>> driver as specified in UFSHCI v5.0, along with the necessary vendor
>> operations and a reference implementation for Qualcomm UFS host
>> controllers.
>>
>> Background
>> ==========
>>
>> TX Equalization is a signal conditioning technique that compensates for
>> channel impairments at high data rates (HS-G4 through HS-G6). It works
>> by adjusting two key parameters:
>>
>> - PreShoot: Pre-emphasis applied before the main signal transition
>> - DeEmphasis: De-emphasis applied after the main signal transition
>>
>> UniPro V3.0 defines TX Equalization Training (EQTR) procedure to
>> automatically discover optimal TX Equalization settings. The EQTR
>> procedure:
>>
>> 1. Starts from the most reliable link state (HS-G1)
>> 2. Iterates through all possible PreShoot and DeEmphasis combinations
>> 3. Evaluates signal quality using Figure of Merit (FOM) measurements
>> 4. Selects the best settings for both host and device TX lanes
>>
> what happens when EQTR fails, mabye you have this comments in the patch.
This is a good question. In this version, once TX EQTR fails, 
ufshcd_config_pwr_mode()
would bail with error before calling ufshcd_change_power_mode(). But I 
am planning
to loosen it in next version, that is, if TX EQTR fails the TX 
Equalization settings will remain
unchanged and ufshcd_config_pwr_mode() would anyways go ahead change 
power mode.

Thanks,
Can Guo.
>
> Kind regards,
> Bean
>
>


