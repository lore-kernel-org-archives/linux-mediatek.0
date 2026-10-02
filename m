Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A703CA5FD4
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Oct 2026 09:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6m2y1KtWVZtI5Dc4dXOHeD8LNqvt0R4u9wS9uoheMY4=; b=oc91x7cnAyZv+DB+krDNSQ3CBZ
	3O64rgHAU0oET8CvtDwd/oZFQIJBN8wSRyV4uu6Ffw5qGuVQnZ1ZRCCYq61RIHbWDYXaQNPRnlgO/
	Q1zPulp8lBouyDkssqDCGD0JZFCrstz8XomiENHb0qL2Ijd35SI5gBHCXxHyayUiLfji4yVCh9RgD
	2x5XF1V1jfcQzSxrz2/l8O6GJZ1E/2+0ozlYtwtXDdWJIHq/NJbANq6CeZce55RFY9zyNezw867j4
	ZiYlO8PsFCZQ1BOaTdp018gWvy7nenwqm8X3cmWnDkhPynthcuufUtClIEu6F3ew6+uVxrtt5QAik
	i/aZ+UHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZwT-0000000BDDR-0Qib;
	Fri, 02 Oct 2026 09:52:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZwP-0000000BDBv-3aJd
	for linux-mediatek@lists.infradead.org;
	Fri, 02 Oct 2026 09:52:35 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6929nmwA558019
	for <linux-mediatek@lists.infradead.org>; Fri, 2 Oct 2026 09:52:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6m2y1KtWVZtI5Dc4dXOHeD8LNqvt0R4u9wS9uoheMY4=; b=TZFAZPXJvSUNssIP
	kbk4Y3PNfs53YClIJ7NeWTLSU8weFgQIhT0GriEVdsvjpKB5nQqVG2mF18cyI+hj
	TxMj+coha0MF9X5GnZRp0uy44Oi4HleRM+fPsU1qSAfPz7fksKJD7FFLF1ZVF13b
	r8OVcf9DdQ3OG6r/TrU7ZtqsuNAjkYFZyizO+z1/l7vRtJ/mSOPNVCPFy7/4amZg
	rB4V986F0pYY7OEry2uircqTrRflMnOt74soam/7mi5DQLYHbFdDNdAlZk81UyuZ
	8mti8T1dPGhaMMSipI4VKklJ25Psf88ohK304inRExITdggAOZpJ6WTjwj/MpE1g
	pjBHZA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1tbgbg6w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Fri, 02 Oct 2026 09:52:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb6391e89so405427285a.1
        for <linux-mediatek@lists.infradead.org>; Fri, 02 Oct 2026 02:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790934751; x=1791539551; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6m2y1KtWVZtI5Dc4dXOHeD8LNqvt0R4u9wS9uoheMY4=;
        b=LNxvDpF33F2kUTSmuhS/AOmO5sNr1tb04VookCK3cUkK+DAZD9NFiHWZKFYju8M+xq
         Zx03Ak01qAL7HR/TfvKeXCUvDdq5W4u2rRu6OrwxNUsy4jNmJ1vk6vnaHfQIFt7h/AuE
         jeiL9AxCTCs1OXJTfkENTTJvJwQZ+DEZAxx4CRArQDMUM9pGeUcSKX3cr/iDna/lflPf
         LJP9W6Y72t4l5kePGhz1HHTfsWKk4NBwUMk7uD2+44FA/xU65xVktOrIze7lE3VZdsn7
         MpArKWfziOkFiz2inYL5kb6mU1pfI9KT04Gd/glujOSvJtfNVJAgy7U8ZR7YfOjmX+A8
         2jhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790934751; x=1791539551;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6m2y1KtWVZtI5Dc4dXOHeD8LNqvt0R4u9wS9uoheMY4=;
        b=P1wvkzGAOOwUIgLT+7rtI4iJt8FfK6oM75BIgjOld5yGsmqUPGzapO+8w8TQ4HCsGF
         wZIPOrR9iqOoyY8sdwMdfcKKU6h6jR+pyN4e5PUDBKXUfBlaOJZ/t3bEVbXcogKx5CMA
         P8qzVNGFg6xKHsrLGVbtPEOF4L4GFjy9EO2tRd4XLXEc6ZLlDuY3FOrFSZP6bygybDzO
         ZP55XXrki+5J3clJFW6fE4ST404oKoyXYIqqD5r1sOG0T4FF9IH1buEMD7Kow1pM1J3y
         PawD0FQs3r7fZF6hNHZkAlev9rm8btSVViqki0cxBPfjyR8XvyYZ4Ovb8ZomMCpZEI72
         gFTg==
X-Forwarded-Encrypted: i=1; AKwUvBzDauRIPoe98dXp98hPQ42XzN8nY4nGhngRzh/+NYICUNbct2aulL2WxVyUCMQl1mWcPZ92KncMrYXH11JL7g==@lists.infradead.org
X-Gm-Message-State: AFuF++kaqCxZTY3IGPYkX3S8pmJ22GhjGM/CGECwyfzxHKziKsKW38gr
	Y42zH4fHm6dNsfmHeDMzkXmzAGp93l+R/gnZv275iLcvh4S380xWqi+yvCfcQn3iB9pj1N0n5rw
	QGpYfh8xN5ABfTM3ZltgPTIh6SZVOB/Dvv0DTet6i/zRecCr6hQ9tdoPNZI2VY5GdGHblyPs0FS
	M=
X-Gm-Gg: AYBFou1NnfiyCciTWUAZkiT5uC1jt4X5X4aa7JyCNa0edTn4OHmUDzkI37pYDBx7xDM
	Xwmvu79Lz3plHqxrKYgveyXHpLnKfLKGs2bzjdNLxP6dFE0rcxBvTlqj+Vb14zWVyU31nsNSD09
	fL5bs7e0+Uu8t6UL/p0xnCd+t7lna5y3wnOD0iNowxs1lIDooKLwxHR589dqVw5SgYf/SmY46qM
	WM7FBKAVxUqh2WCIdUqsijvmcH9iK+jx0PMGvCZX5sWgolTnMNbEwPIHbAQygnvUNYEYagYT/bK
	kh7MWQw4eQOVX8JNGh7rY6oYiIS8cxhpo3VDvw/JhaetJYGi0yjhUKkxPsgP4VnG5zCKb7bmRXO
	5aANKVv7f+uiK2CejHLqAG/1sbK9Gt7PZHlSIAwTz8IsgMbqL5pKD43yOrkLeYg==
X-Received: by 2002:a05:620a:a790:20b0:93c:bb75:d8f0 with SMTP id af79cd13be357-93cf170b54cmr237247685a.27.1790934751352;
        Fri, 02 Oct 2026 02:52:31 -0700 (PDT)
X-Received: by 2002:a05:620a:a790:20b0:93c:bb75:d8f0 with SMTP id af79cd13be357-93cf170b54cmr237245885a.27.1790934750933;
        Fri, 02 Oct 2026 02:52:30 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:f14c:b716:c104:4712? ([2a05:6e02:1041:c10:f14c:b716:c104:4712])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280d1e38sm55681315e9.13.2026.10.02.02.52.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 02:52:30 -0700 (PDT)
Message-ID: <94e3f42c-4ffd-417a-9bee-69c504360af9@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 11:52:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] clocksource: clint: Use IPI_MAX for IPI muxing
To: "GUO Ren (XuanTie)" <guoren@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        Anup Patel <anup@brainfault.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20260911-ipi_max-v2-0-a77826ff189e@kernel.org>
 <20260911-ipi_max-v2-3-a77826ff189e@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260911-ipi_max-v2-3-a77826ff189e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAzOSBTYWx0ZWRfX0OQoq7WSeHKk
 AbinmDbJCRT9h+2/IXMRL+ISBZRHFRHs2b9b+j3wUwhVXX/SU6ao1ItB5uzZkMkEeavnCKYmgIn
 9BzjQcorNGhNco9g8hX7maMNO8vVUl8=
X-Authority-Analysis: v=2.4 cv=QY7zLcbv c=1 sm=1 tr=0 ts=6abf7ee0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=uCLItbk5GdqmTsIkEKsA:9 a=QEXdDO2ut3YA:10 a=Dn0JnjMMefUA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAzOSBTYWx0ZWRfXxqx8JtFulQid
 g4gQkzhJAOzELfvouW4418FDHYRuPSppw89QE5NYyTv9LPSkqddfswjdLpy9yhOIYat8j34kQcY
 wDFdjZqH7gwaLu/FTKYsdWprg8hv6YPLPuCDWdFEv3oI9N4y4+T1prnevPV3Is/Yuo5fIdYzl0c
 P/7R88GBqrk2dt0WHtTgzmMQk1AzfA6B/+sosluoLYiIPWl/gu9rg8SW4uAvF3HVwp5ubxYPNOr
 RVvl+covKeienG9rwH1lPcPCwv2a2C8TNwLUMBhb4zRcMWYDnggCFgZPUn8Pe3WPNJlRhQOtDhf
 5PspXgv+K/oV0h2YR5GWNDYREUrDHvut9kfxqiaiYmSvRILu6UASGfUmEMohDSAL7Fq+bKStPrT
 wL4Hr1RSB+INUWdviTKE/NLXZCchOkiiWXjmyUFC6wcr8vckJUEJDaxH/Cw18YU8JDxtvdd2DBD
 cGEALHIkTdRSwc46oog==
X-Proofpoint-ORIG-GUID: IeTxt9NlpKynFecpVWZCRMDRdJAcsGOQ
X-Proofpoint-GUID: IeTxt9NlpKynFecpVWZCRMDRdJAcsGOQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 bulkscore=0 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_025233_899551_C45BD341 
X-CRM114-Status: UNSURE (   9.55  )
X-CRM114-Notice: Please train this message.
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

On 9/11/26 05:27, GUO Ren (XuanTie) wrote:
> Replace the hard-coded BITS_PER_BYTE with IPI_MAX now that the
> constant is exported from riscv asm/smp.h.
> 
> Signed-off-by: GUO Ren (XuanTie) <guoren@kernel.org>
> ---
Acked-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

