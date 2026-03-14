Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0489910706CF
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Mar 2026 10:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CTYv1dXFSAG7Ui2x4cGtMMWcIHDnGh1Nk4Vqdo4b774=; b=Rb3AdSt59euoirsiRrDgSKsier
	TlzEN1JARqZkNGbSJH+TNdnbxqsr3fWEaKogvqx4cGpN6Pzi0R8MVi76CAG/b3z5R38aA+2yecg8m
	DUJFNNACtOueNoaSuDBn8Q8sdUOtCU2UDhRb8kjJHPIAFYJvWbUHZLh5F26ZBgUePFYTrLgpmXOP3
	wPNSkmnNe4kkkc23mCjz7Q+MKfpOeIZPxikuopHr2Ilv9sESi5fi5Zglz3LI5gFs0EV+VytcYUHku
	N7D8sXkUTkQZOEB4/I7kjOF2ijGpVgNf/mY4bH06Fs106yF25q2mK8/mKLblaaEMTN88O0kGIC+8p
	yDRXYE1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1MXg-00000001kxG-1h7c;
	Sat, 14 Mar 2026 10:48:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1MXc-00000001kwZ-3W9o
	for linux-mediatek@lists.infradead.org;
	Sat, 14 Mar 2026 10:48:22 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62E4dRcJ4128169
	for <linux-mediatek@lists.infradead.org>; Sat, 14 Mar 2026 10:48:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CTYv1dXFSAG7Ui2x4cGtMMWcIHDnGh1Nk4Vqdo4b774=; b=HmDNMtal7+Xg6p6k
	uI6jIcPugYo8EvDp9/Nz+HPBGOawsx2lL9ZdzTybUylv98x8MdP5sg1DHnQH7u9l
	+aIrZd/mJ5RGDBmJofX6FwhYJk3V9RshVqzU23apu9dYUScvsEOMF2IG6zDc3G7Z
	HKu7/k4H9Gf0wCY3ov++ju4pI5RYG2XEsPy5vD4/vfMrRRyBKzgB3qt8HtWPnAX5
	jtl1VP572UEpnaY+6Crkw0xpoDWmkq/HbCVSHIq+StbMj4BR/bc6vT9ZEjuvMtue
	s3T10qCz40aSA07n8Xt0F0gQ4Hr5jY4hEQ6jgvoBtiV16fUzontVPrWJ5W//zmGg
	5eCivQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw0udgha3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Sat, 14 Mar 2026 10:48:19 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3598c05c806so3478489a91.0
        for <linux-mediatek@lists.infradead.org>; Sat, 14 Mar 2026 03:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773485299; x=1774090099; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CTYv1dXFSAG7Ui2x4cGtMMWcIHDnGh1Nk4Vqdo4b774=;
        b=L5iZIPEe3YkTAmF+WZWEoJRK8u9nJmcFwk5mhk7bi0KErKtl91qea0z8EbCUcq1j3Y
         3IauktX09cm2BGi/8xKyc0lYciuRNrbTOHYBHOjOz5po/ZAGG0T8N6F6YjFoEEAdoGs0
         K+fjwFX/FKh85fv5XVk+Cnko1pTOAsK9KTkO/9lkkiZgWPc+0/D1Jw3USXCAmgz0i2bD
         io4kMEFOenxrxcxjsnBk3Dt3Jcq4EJkSV8VLwoIaQ222LSm9LiKqUvEppiW7m6fPnNSj
         o3fN971kWg1NDpUyxiFCYJ+vw6ffCdkW/sqfsh6k1aMKmz5EAdL8D8Z8AazrT8rLs6DP
         O+KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773485299; x=1774090099;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CTYv1dXFSAG7Ui2x4cGtMMWcIHDnGh1Nk4Vqdo4b774=;
        b=TMU59Yy30eDL4aD6V5DLRC6y417i1CBua1dVdahhjH8nxsotUvqUnjG7IOUFDe770H
         26ewlo8Wxg7OxicrxxufAYD6Stwv5RJ35RMfwFkZQqce8sNZl4OSFftRebB4NvqLyiuD
         MmOme+Nc/uu0EcDUVbalPbpsUXGSHVd9gTMPo4M0iOy7suPlGbM/A17RZ7VoW7S2SZix
         f7HMst/tYZSM1A23e3+O9OPLgPf/cVXbqwIhlfp4rlmgv5dVRPLADksVSI9wPQ3eA3Rh
         VToawXRWJxOsVkTTAIjJVe1bqKWZ0Pc2Jt/M4zHhpPl51A8sP1+Vowiiqehiu4bVz67S
         rQRg==
X-Forwarded-Encrypted: i=1; AJvYcCUeRyLHBoj50d8juIkQSteGlhSt/15m1Zw33JU1N0fBm7rYEHIaDvtAiC+K3AChHlKT/zuxofuSl7yRspCJjw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/NA9CBvc+wKsH6eQ8/swEmI+X+fyuvdgUFgwczFtMhiH7W+NK
	iimpsyj5tAGqfRWgpPgGuIXMOUq8UccoKuFXCOvvgSpR/IzsaLmR9//ZBLknMtfTZYvvJ/QYJJ1
	rv1VonvG/dUzUC9KBZjQ+hYYG2/J5n4tVsSrRVHPY98nVhk1JlvXbw6ojU9mN18sjvc57j4HNsi
	s=
X-Gm-Gg: ATEYQzyM973nynssyY4HBc9x02Fxtff9ZqLOjDt40N3+1i5wgf38K9tsZoyP4S8YuFG
	LRKl4ToDZjea7Nq2VQdzoI49GjrkV1kXIXA9UzpqpLl0m7k/umixk4p681IJJB89zY8i85j0AWV
	oRukCxiplG5dLm9WkQDP4q/vK2QnVP+TNll9EQln3vaGhQPb3FK9NDDPrw/oHQutR5RQm4zG5AD
	YwyUnif31dw0BZfBjXANUFqjT3wgjYxnzsl/wTN7nrqDozHXGHLFqYOQxTwOEcQ7X/8++Kdm2Nu
	jpPvCvU7f6FiYDOMypGWPjRv0S4R+73J+x+4dkGAdlcNYqief/19zoLjPjVSjOkFmMhJgDWDzl8
	Fkp0EOTcWoB1kAJK+QtQfLNdo51F7+P9K3NRsckAcSa5oiOikB3UpW9Kr82RIhye+q7Dct3vwsM
	z7c0GpBX9wUA==
X-Received: by 2002:a17:90b:4b05:b0:34a:b8e0:dd64 with SMTP id 98e67ed59e1d1-35a21efd272mr5787955a91.1.1773485299231;
        Sat, 14 Mar 2026 03:48:19 -0700 (PDT)
X-Received: by 2002:a17:90b:4b05:b0:34a:b8e0:dd64 with SMTP id 98e67ed59e1d1-35a21efd272mr5787938a91.1.1773485298771;
        Sat, 14 Mar 2026 03:48:18 -0700 (PDT)
Received: from [10.133.33.24] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a1ac3baf8sm7099399a91.12.2026.03.14.03.48.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Mar 2026 03:48:18 -0700 (PDT)
Message-ID: <71986394-0ed4-4ae5-afb1-7da4710856e7@oss.qualcomm.com>
Date: Sat, 14 Mar 2026 18:48:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/12] scsi: ufs: Add TX Equalization support for UFS
 5.0
To: Bart Van Assche <bvanassche@acm.org>, avri.altman@wdc.com,
        beanhuo@micron.com, martin.petersen@oracle.com, mani@kernel.org
Cc: linux-scsi@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        "open list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-mediatek@lists.infradead.org>
References: <20260308151409.3779137-1-can.guo@oss.qualcomm.com>
 <d4b09db7-db5c-4d99-afb2-47deffc0cd17@acm.org>
Content-Language: en-US
From: Can Guo <can.guo@oss.qualcomm.com>
In-Reply-To: <d4b09db7-db5c-4d99-afb2-47deffc0cd17@acm.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BJ2+bVQG c=1 sm=1 tr=0 ts=69b53cf3 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=BTOOqkP4DqQlibgNVLAA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: Zg26ttxi47bMSosFSGcJUTQVIsjjxJUB
X-Proofpoint-ORIG-GUID: Zg26ttxi47bMSosFSGcJUTQVIsjjxJUB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE0MDA4MyBTYWx0ZWRfX38woPMYPGeRD
 gumpt1/4OUGILaXQxvij4qQ6LQFqRmY3hFEuvbDMRgu3jFUZvAYhCMVqN4VwwR1ukP6CXjxMXbK
 aneM4ES1TiXddMmqD0CsrNMlzhEXBS0gm6ZVPDNt+Q7L/OIokfx8b5YhPjsND9zQ/rWmAfEv3bQ
 NvlapcJJQEyoyqROdgXoHX2Plyc1JQKoGRVkGSaiFTTHneneaCCewV9HOOzSqyoQKHncA8UxxL4
 dlE40MJcVbc1cedyP2IJaD3nB0dNvufqfG28evyhxZxnPJh1vqnxj5edfQMR/7Bp7j89cCN26wB
 q187gMy+69L+mq+4cr5dkfZBkUziMT05SViE+rIUyC0ilnrpaevl8+m6xxk8hr7Lk+h1CyYyQ4m
 dvBZBtnd1xT9AMe3XfYNmLh6XMI0H6QggGVm/LK+949CUz8LUxcIec4Vg90wfHcZIS8QrthT3nF
 8dKrY0cqdm9DmFdQVnA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-14_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603140083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_034820_942041_CB2BAC1C 
X-CRM114-Status: GOOD (  11.13  )
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

Hi Bart,

On 3/14/2026 5:56 AM, Bart Van Assche wrote:
> On 3/8/26 8:13 AM, Can Guo wrote:
>> The UFS v5.0 and UFSHCI v5.0 standards have published, introducing 
>> support
>
> have -> have been?
>
>> for HS-G6 (23.2 Gbps per lane)
>
> Hmm ... my version of the M-PHY version 6 standard says 46.6 Gbps for
> rate B or about the double of the rate mentioned above (table 11 /
> page 45).
Aha, good catch! I will challenge the same to Claude who helped me draft 
the cover letter.

Thanks,
Can Guo.
>
> Thanks,
>
> Bart.


