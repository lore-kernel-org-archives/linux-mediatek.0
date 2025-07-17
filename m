Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC46C83F34
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jul 2025 19:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=luY0BVPgSWUzb7YHuowS+pO8iR4/4nofCJx/Pk3pHto=; b=DWyjw9NhPrGxFAIqxaX08Zk5e5
	1zT5nxmS3TKLmhDgJhwhShcbodZRRHeMVMoFDC7/bzX1yryX+dmbQzRz0uRP64N/C0BkNAfGsfN3x
	cUhX6K8VkWGQ8GXNyxI3gy5z34h38SLOQ2J6IPE8an5NUh+iw3jlqNmIKcHTW3iK4fOhabnz3QRGg
	EZGDBJFcefHRXdpa2O9diWfPTlQ0oaIA9Io06fFcX3oFT+Wp9KhZT1QJC1WrTMgSkl1o65Tn640PK
	Od2WmiL8CGS3CVn6VvyXDwc/Xq3JGokFV29p3pd9kcDsVnvcNRaxtSvtf+B6WEjMYbVUbBBmh1CHA
	fFoFbeSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucUUy-0000000B23s-1VdW;
	Thu, 17 Jul 2025 19:42:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucUUv-0000000B23U-2Fye
	for linux-mediatek@lists.infradead.org;
	Thu, 17 Jul 2025 19:42:30 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HCsVeH021557
	for <linux-mediatek@lists.infradead.org>; Thu, 17 Jul 2025 19:42:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	luY0BVPgSWUzb7YHuowS+pO8iR4/4nofCJx/Pk3pHto=; b=cPGi4pIv0V81TKLM
	1j5BrdGMFeWgONQRmoZMkxe4vH+uGz2/LGst0BZg3rVAlJC8/O4EOR2hesYJNL99
	lTmSrmyfvDzdQGOVVfgPeXgrup3fIKmkJIxpzjHeVycGPo9JkHH3p6gSuyyW+rbE
	EfKeozBBVOQeNV/WGM6SUsKjiAPQk7WEFbSugKSzjwS8UAIPUhfFH5zAVrAdJOxP
	jXFTGNzHr8q6im7tZFVp5sBUg4VzYweS8XjcLE8rU/3BbpUI8Jc0k84RM5EpAZ7T
	iBl+rH0JJWQq5bfB8XVtyEvrt/NV4sPBM8NpCmiMWiQvUiDngPpVBxMAfGrtIlBk
	KeAbGQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufu8gu7y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Thu, 17 Jul 2025 19:42:28 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-23638e1605dso10621345ad.0
        for <linux-mediatek@lists.infradead.org>; Thu, 17 Jul 2025 12:42:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752781347; x=1753386147;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=luY0BVPgSWUzb7YHuowS+pO8iR4/4nofCJx/Pk3pHto=;
        b=E7U3i8Xlt2b72rVqaLDvxmB17ACVmF5669f70ACYiN6/tw6Zv9ySHIyyN64sTM/3s6
         vGdP1EDccX31PRi9uY431xcnrPasgHOvTnN6YLg4+aieaL5DYLOZiKrDeGi8qf7Q2R7L
         6bMDmVFaTTPwjh0IvW2OIMqO44cIxY1BJixknhrikGoilaX2xQdWmTDr8CrK9ieE/3Tr
         QCC6CvMV5beHTwSun4U1hoB8ct7J915Sjtd+ucEzLFY1xzSsoxPxGa73JDc7syZOUIUH
         DbsIA+kvSEKHom8polsj9r2uLBXZRHdiph73WpJImiDmeLE0SJyt33FdCCxW/19oDya1
         yWOA==
X-Forwarded-Encrypted: i=1; AJvYcCUIICjmsG5NSDwYPMcy5OvSSKC52772eAAttBItrilStJc44kH+5e0MSRF9SylVFInX9ggon8id7uBBEHR3zQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwSiLtMny4tkRbBrjaXcnMp13rc+6XqjUQgpRL0racft0R30aKr
	wdR/V19juMYiEawr/iSb+wzOgoItH5Gei+5pZ8G9LPKUtvR/x6PFFCSpKUzpJGAf+cP/qkP5RTA
	+/XPYWvfOzFhGSbX4cct7/VoP1lqgJanVfnIvhHHF7Abv6UzV2ewD0yjOe3YAum37qXlfPFMTLx
	s=
X-Gm-Gg: ASbGncvKxeUGWXI+cpTTh9TupP2mfu2XwT3TJPrHXmLRq0+P/Fp6t1PV013hmP04v+u
	QN84gC4+ihA7g//ED52p4UODWrzBrSXP9XZAJh5tgN6luB7r7s0lmlRSR1gZdgNiNv2TLoa2E87
	sOKXxx1dpMS4n8cYwYfxK9XTrtjEGjftbfeGjQy0dHRXUDBhv8gVayVJHABt4n5ywcFCemfzZsE
	64oWtcOM4UrtsE9D4FV5BgD8ZhZ19bWyLzpJZTOy2jfHWDkvj9waxDPY6LCZ1ZBWNfZtK+/9/iW
	UczkcP4wf6DtVMGtpCdez0kJwLsFMePwckLuPTdFevzD/wsASx1rs+oQURF93DRG5PQDsRpi9ED
	ckoj2Q/VaGNbW7Q299bLN/OQ8k5RY9eLx
X-Received: by 2002:a17:902:ea04:b0:234:c8ec:51b5 with SMTP id d9443c01a7336-23e2578f517mr125095845ad.53.1752781347043;
        Thu, 17 Jul 2025 12:42:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF21vei6egRxGWQiQNQ8358x5+YNlDx/NMSCHicIfqFSoDmEJqt1K5A47VJ1nds2SQWOyPEKg==
X-Received: by 2002:a17:902:ea04:b0:234:c8ec:51b5 with SMTP id d9443c01a7336-23e2578f517mr125095485ad.53.1752781346565;
        Thu, 17 Jul 2025 12:42:26 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b5e2ca8sm383695ad.28.2025.07.17.12.42.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 12:42:26 -0700 (PDT)
Message-ID: <ead8f37c-6fc3-472f-94f7-ad4ea6fa0fba@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 12:42:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless v2 1/2] wifi: mac80211: Update skb's control
 block key in ieee80211_tx_dequeue()
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
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
 <a5e85969-1dc9-4d6b-be2e-ac2338d38d98@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <a5e85969-1dc9-4d6b-be2e-ac2338d38d98@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDE3NCBTYWx0ZWRfX3lTpI8vDX0VU
 j1f0MOZkYkN+QscijgQq9lNFmieNxPkIolFxJ5ct00QD63phbLLciWTRA+lNCOIiRH5Smvc3iFs
 4UGG72gLC/V2c/8ogbw5CvA+UK12Yax8nB789HORfEqfZcdTpvjoGcZV9l+B4qP5ZdH7GWRADdX
 HNvcWmyT3qr69fyfc/7HJGkzW/9avNBlh7OpdTmEZMNc1Qid2dzKBk4W8ihC6mofa5AGHFSIO88
 ousFhWQP4yq80UNajNgV0H7LDQxJvIHtpULIf4Dtw6B1HFTAHf+afyqvsd9yPF9bFGm6++TEJhl
 6vmVJPlu+c85G8Num06B+56S9hSNlhp3xWKKJhPNjsomsvtmPIX5HRFTxQ4Pm9rdSUYZPd15/la
 T9anhBAvxccdHA8vv1rZ+grI/LNXKXMsZKWkwde/bLcE3dwvgC8TpLtWYP/OI77rqHO3Y+Vr
X-Proofpoint-ORIG-GUID: v_ailFoitYk1QsEVrGqrv4dloSIzJom4
X-Proofpoint-GUID: v_ailFoitYk1QsEVrGqrv4dloSIzJom4
X-Authority-Analysis: v=2.4 cv=f59IBPyM c=1 sm=1 tr=0 ts=68795224 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=FvJLhJUQffOWFEYYKpkA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170174
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_124229_708516_3A2C27A7 
X-CRM114-Status: GOOD (  11.07  )
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

On 7/17/2025 8:46 AM, Jeff Johnson wrote:
> On 7/17/2025 7:22 AM, Remi Pommarel wrote:
>> For the record, if I am not mistaken, ath12k driver does not seem to
>> support 802.11 encaps HW offloading mainline yet, I do seem to have some
>> vendor patches to support it though.
> 
> Upstreaming this functionality is in the internal pipeline but won't make the
> v6.17 merge window.

I make a comment like that and all of a sudden internal reviews get expedited.

s/but won't/and should/

/jeff

