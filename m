Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13BFAC83F34
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jul 2025 16:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZwFGdQdzfvP/rmubG2Qeee2P6QDZM7L/fKdfITpiTjQ=; b=m3Qh1wCBMftC+3nRvc5tOzYUEX
	P4YT8fxfb2UZqyPbvylcqpCoh2/hntnISpGxxk/OvCgBqHGiMz3rGEm98b7gMuWPGRBZZhmHGiH3x
	sD05bB/BtJLXHLsip467C52zOI6XRgo0kISqdCQDzWEB65CY3txTWjs4BQ/hho0pAH457w0n3rRY9
	4n9LMCMVZkLAgXa0B+lYqz8ffFhxajpbLH+jvazPBESb7jFDsDSpSggECQmmBasoFsbxBdqaIcfAZ
	Hp3c5WzZ2QgnEDFwcF0tYSalZ58X0DlZkkX/km8U7mazeqxmsb+wegVJNvp6+qJk/a9YlBgbuSpJw
	ViAZjxmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucRMY-0000000AckD-0mEm;
	Thu, 17 Jul 2025 16:21:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucQoH-0000000AXJR-3LoV
	for linux-mediatek@lists.infradead.org;
	Thu, 17 Jul 2025 15:46:15 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HCEhUJ020662
	for <linux-mediatek@lists.infradead.org>; Thu, 17 Jul 2025 15:46:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZwFGdQdzfvP/rmubG2Qeee2P6QDZM7L/fKdfITpiTjQ=; b=kXmbstGwL9feq4+i
	Y815sxyr3zgPIC7i+badJKZe3fJ9NVxNgppqa91Bk3QiyKivPw9NOauv7OpJJgYv
	ToTl0BEF50kVy9BQepNVgGtEMsAPMpjH9V1jm1I8kTNUO7DWDVClWo0dVCCwJrA0
	mLUAeSgsiUEqUmsCfTOSMUviM30AIHJhpmbJtlMryKHhDbUXpbQ77a3RG4rXxRnu
	mJ5Duq6BA6kJbnjBgmEmKqhXZQeUgQtFUziSwFESyUH8WffF3jEwCB2g0xT6yFTu
	UkwCWs8KX6j1OEz4ydoDjJSu76Ejwb3p3oMKGuwZlhkAkxLDwXrCZtAW1MJWyNrm
	lXNW6w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dpkatw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Thu, 17 Jul 2025 15:46:13 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-74b185fba41so1055631b3a.1
        for <linux-mediatek@lists.infradead.org>; Thu, 17 Jul 2025 08:46:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752767171; x=1753371971;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZwFGdQdzfvP/rmubG2Qeee2P6QDZM7L/fKdfITpiTjQ=;
        b=twiGOvdtoarlDK3MCBBdHMkRxH3TdRu86ERCVIWeS3m9VHuQp3DxVkA6Hp50NYIfpM
         l8ufx8jpwsBP0ZDA2EW3oHi8I3s6J3yJryDrwCVpczciXjKvrUN8vmSLHGSYrz9mhZzP
         qE2b9Ac2k8ReE5pLDO0HM4pt3q73UPc8rj/qhdxTfewHZR9WrwKnY3/hbBkeLZv2ZecV
         3NIKIC/pFOAMy4X48mQj2f6NmbwDKx0Opnj5nEcPB8W2SnfWOVnzcKOyxuAFtfiuqY8P
         Sjpa2TmOhgVEc6/jRz6hHKNx59OESPNuIVjvUalTiy+89fAczGJzGRfpj2uj/lQOqT+q
         boTw==
X-Forwarded-Encrypted: i=1; AJvYcCWYG5m6PtgrkfTSdm1CrYu79MmVjP3qSrMC4ls1WkyXBe+KHp/O9w4cNzsuv7NtxRzkCp4jv+kffca/FMLOHw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzaGqoG0Ri9IYJ/OkpBTxzH8nFdIsmttD8obCtwrNLmSL1dCqVx
	5Oz5ASHkUxwyFOzHGmTNs0A6uWfRfczWrWdu5Du1ivs6NERCdPe5Sj3s/LKg+8xopMlaFMC0vuK
	Bha64AvZxY6wkEj9UihkpWdlt6XAnYJPjc+Pd3zjLeGnEkqBLRnrzkZABgqcA3PKtIF7VzHjAe6
	uOP8w8qI8=
X-Gm-Gg: ASbGnctTqFMozKNLHg1XVp5+D2SkszVh+sQnfj6IgZZZYmB8kb1N91yx0rQsSzzWlxm
	wg1bgOMCrtU4Bn1IT5dk3VOQpmUCFgrV0DE0W9Lpd+HF9gdu0s1u6KmisToMRCJGI2PKfVJbCsL
	wwbBywldsHGrYTO6cj2kdLhsw7bu0wzalSUSYr35lVJzQA3McmPLBRF3MPGCYPIg5h1LxICcTxG
	Dl/Y9PmBbXcOzsRrLjrCA4/B9jsa+Mj+tyjDdKiuVDORhMd7I/y3HCxmvy1fXi9RRk29Y0fsu3x
	DS+/Ocp8gEAOrkO1dZNyjD14VunAe7h1/nmTJRcdFzvVsRFuM2kmt+XOHc6FY7XsHrryTnQCnKJ
	+BeP2C0D3DluYEjUPlQA=
X-Received: by 2002:a05:6a00:1704:b0:748:ef04:99d with SMTP id d2e1a72fcca58-756ea1dd3abmr10368818b3a.14.1752767171513;
        Thu, 17 Jul 2025 08:46:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuMgT04W8H7FqBViOukrixeUUnPxkr/5CXJJMRmftkb7wIp9ibVR7/CoJg49nYXw6zIDgzbQ==
X-Received: by 2002:a05:6a00:1704:b0:748:ef04:99d with SMTP id d2e1a72fcca58-756ea1dd3abmr10368772b3a.14.1752767170903;
        Thu, 17 Jul 2025 08:46:10 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eba428161sm16444906b3a.42.2025.07.17.08.46.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 08:46:10 -0700 (PDT)
Message-ID: <a5e85969-1dc9-4d6b-be2e-ac2338d38d98@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 08:46:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless v2 1/2] wifi: mac80211: Update skb's control
 block key in ieee80211_tx_dequeue()
To: Remi Pommarel <repk@triplefau.lt>,
        Johannes Berg <johannes@sipsolutions.net>
Cc: Bert Karwatzki <spasswolf@web.de>, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <06aa507b853ca385ceded81c18b0a6dd0f081bc8.1742833382.git.repk@triplefau.lt>
 <20250410215527.3001-1-spasswolf@web.de> <Z_jpq26P99qzPP1c@pilgrim>
 <1df3a3df19b77e3b8d1f71a3a93c61221ff46a6b.camel@web.de>
 <aHj4zS_3uhDRhzDn@pilgrim>
 <fa538ba960369497f6d65c1448ab7710f76aa078.camel@sipsolutions.net>
 <aHkHOC6DYBXtnE5e@pilgrim>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <aHkHOC6DYBXtnE5e@pilgrim>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDEzOSBTYWx0ZWRfX9HG3c/1pEZuC
 UX/HkcHk12jGprOg0mgwnOHGus/PS8QcmPH4tpo5tcKaMyWKIHL8mtfMYkq1NVAUZ8C7cK/+PTR
 UdeuZxsn3OCxxqqcukT/rKDi3CSNa02qmgYic5W037gIl6ki8bwa10rfiqe+IhcbMFF0tfhqA+D
 ONJUxwVsraNi5nm+Mo5DcMRBrd+OpPxWjBRS7TQ1zHo9oJL5nKKWS0nDdVr+84X9TK+bJ4K6OyR
 zMnsNSQ8iqs2NS5Q5XcghQV7RV3rwdEzrvLnshjlT//41625lzHojrYMSW7/xob+enZCI9VoukV
 fmjjkIjjVD+tM7Eq+rEr5RXROYtWU8QQCHVb0TYVMM6AIjSexWdww8SdK070FYDuAaForwb2ERK
 n7NfxQEIeyX5/fttVxfiUXEnGdoFtcYsnQgu2pVAV57Vu3ARF8H4qIgPV0k+xLQDYqLlJsqa
X-Proofpoint-GUID: DM6EopAupkIG3JHDJ5KjuLrUsR24ataY
X-Proofpoint-ORIG-GUID: DM6EopAupkIG3JHDJ5KjuLrUsR24ataY
X-Authority-Analysis: v=2.4 cv=Y+r4sgeN c=1 sm=1 tr=0 ts=68791ac5 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=MOVf-BS0YNWMpZGKuf0A:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=996 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_084613_844768_1FAA8904 
X-CRM114-Status: GOOD (  10.11  )
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

On 7/17/2025 7:22 AM, Remi Pommarel wrote:
> For the record, if I am not mistaken, ath12k driver does not seem to
> support 802.11 encaps HW offloading mainline yet, I do seem to have some
> vendor patches to support it though.

Upstreaming this functionality is in the internal pipeline but won't make the
v6.17 merge window.

