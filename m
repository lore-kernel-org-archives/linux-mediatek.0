Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83109C4452D
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2026 02:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MgZfS+DnAyFYoUCXxLOPV0UVnqmhd00WX8pZs+xw1v0=; b=0oIahrS4lSR5c8N9aIy8PBn6h3
	Xq/pZaj2fI/XWDDvnCw6cRCi2jzS8+1pSLWTAjnv8jmniD+xHqPdKuXyKrGWAXfylEbVweqLQXceV
	MiVQKDtUyblYvtvMij/xm8482GvO2KmagrdvmtZFbEZA+JnTZlUJSTV42gmo/lRdiqk7tcwRJO+r/
	Nbm5NdFa2mm6rkUhR7i2iPUfg9f2edwCcoajJ84FfzXwADyWhs7+lvLkVxh387czr37nJDEKrm2AW
	KzefeByxg5Afz/5hwKi9Tdn3P4TZqbSMuYXihqiWwP6iyp8ojyOvE0ruy9eXnMKp72M4Tw5k05cHr
	J66OSG2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmMeV-0000000AkZx-1Gzv;
	Wed, 22 Jul 2026 02:25:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmMeT-0000000AkZd-1LML
	for linux-mediatek@lists.infradead.org;
	Wed, 22 Jul 2026 02:25:42 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M1Cvmw335862
	for <linux-mediatek@lists.infradead.org>; Wed, 22 Jul 2026 02:25:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MgZfS+DnAyFYoUCXxLOPV0UVnqmhd00WX8pZs+xw1v0=; b=WEnXx0Qsxn/8D6eF
	lZMkT8V49TvVjdjonY65I0OPcKhcG5OwWhru0ZP8iCX/WrgTVglkkcX2yJv7AxKg
	PER1B3y1auWnfca50lFSsPqc269V14FvdZC9VA0jjJQO3JDod7+1uku///DFte0I
	0vrCxR9q0yVXEY2Aq9o1uzvVe1RpV5WWseaMFVg7g1m9J8c4Va8GcnTC5dBVVOWS
	NNiVjLxfhijjHqOaRpc+8/XoLc6Q5GYBsXdjgsqF2PwQArm6sWDD0QGbu1+kw+K4
	KgmWTBKPItTn4Z4j1JUQbFjj0/6J7mPRqn53qJUyylujsu86y8y8UB2MAbfXszpL
	25kU+g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6nsuxs6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 22 Jul 2026 02:25:40 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cab3e9cd922so6584211a12.0
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Jul 2026 19:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784687140; x=1785291940; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MgZfS+DnAyFYoUCXxLOPV0UVnqmhd00WX8pZs+xw1v0=;
        b=IJsKdhmqOoJFjHXvzM7YGsmpy2uPOBAcZjl97TSxu8n2TQ78x4zlmq5RnpMDK38b/z
         I2XlFHD9elpYUM2Bw1D0mXCP64f5ygeZJeI1fnkD581cUk0J7puOJioEF5sYTAJdgcBI
         3lkyQ9z8bET9N03DEY8/M7+LNN3p2sZWGNzI4YHjVrEq3vMrCBMykpC3yhybZNMIagT/
         H2rUkCSLHNyhEZ5HCWOddTfBsQOda09uzirWdME2L+Mb1I8TPOcfGroaRw1COAphXYKw
         u6n1N7QdLqvaUGE3KbJVTROE2KtZ0nhi9maFe5mFJYzSbglhvPK8DFiFgIqjU4WtxGT4
         ivBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784687140; x=1785291940;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MgZfS+DnAyFYoUCXxLOPV0UVnqmhd00WX8pZs+xw1v0=;
        b=DIYMoRX/fWz3Z3VqlhURutSfj2F1HWghaagcA89ilaQ9jTtEXzjJSKP3QFTve7SpRG
         /rzwpTE5yvvdKNALmolIFoLi9CF0tZdYzkBTZNuyBXwozlvtwLdHheLxRGXxVE9cmAKi
         DHxv86j/RKfkfwCvHBD6xRUtlZq/1B/6bG5KBKBxLTIkYE1zz5FGQwkMlUUkUiKIuETH
         3dZNEzHdHZ5ZYIHQVn7vOVKfwte3Ab7qAh7er845xIkG+lKs63xtdx4rm9AgQ2SD636j
         Wt5pAY8RC5RRp6ZlGUHOfueYGYdokgMlCltH+8nQJa0abrmklxt2KE5XB4jqwDShmAJc
         F1hQ==
X-Forwarded-Encrypted: i=1; AHgh+RoUJvZNlJhSPmyZPF3/XZtXSW4jzK1sDr8bvZ4psk5wnqyvgTY2Pki70gylSfX6bBs80ZTc6epnubHx9+oWEQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzoJ8P3zVBep990/+/xy81nfii7fvIE6KbKN1mMvI168FuzCeIU
	he2WbovUSOhrbaf1LBS1PNS6vX6xEiHsvGlIGOJyoNgo4UnMisoVIF5eEI9SBFCmnkSHB9Pa3kB
	QDdCpLnDt1B8rN/DEr40wHLh+jOEu9S9uY+jGdu560XbBYwVCvOjXz+9Id+Ue3tBnse2axa/sy9
	U=
X-Gm-Gg: AR+sD139S0XN5Yntx/LEnYRNly/c6ZVlWY5p2tUxmnO6O9DIZJZaiN0y5+O1ZtQtQTo
	0rxa1aTEnOx+dcJELarxIZCpsLWfkPbcxVt9auRGBkRj8AORNlezhRp80SBBSR4hsfvB6bRN/DF
	cuFJJ6eMm1dMCLX5uaGWD6W8i7l+pEA7UtYeXihLAWVSnZemG4v3ZkyvYt2OMytOuDioAOvN5Gf
	oqvLzR0kflTqaUH5EMuOG/uDrc6zOa+M7VMMhjmjNgm9uGGjKMqhBl7fhGe+cRoapCVZjhHLoZU
	l4vKsbtUCxZ8cmI0xJQrYTetb4tzTUwZLffIevZmdqM7LyxjeHztHtjSnyvGK/UttQy/q3GUCtV
	pfCxNR867kWPsxce9qG7p72V4nqy4MzYT8kChmVYeYB8=
X-Received: by 2002:a05:6a20:5484:b0:3c4:3672:ba2 with SMTP id adf61e73a8af0-3c4367217e8mr64322637.71.1784687139943;
        Tue, 21 Jul 2026 19:25:39 -0700 (PDT)
X-Received: by 2002:a05:6a20:5484:b0:3c4:3672:ba2 with SMTP id adf61e73a8af0-3c4367217e8mr64307637.71.1784687139520;
        Tue, 21 Jul 2026 19:25:39 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e081978sm3133250eec.24.2026.07.21.19.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 19:25:39 -0700 (PDT)
Date: Wed, 22 Jul 2026 10:25:32 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Peter Wang =?utf-8?B?KOeOi+S/oeWPiyk=?= <peter.wang@mediatek.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: CC Chou =?utf-8?B?KOWRqOW/l+adsCk=?= <cc.chou@mediatek.com>,
        "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
        "bvanassche@acm.org" <bvanassche@acm.org>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        Eddie Huang =?utf-8?B?KOm7g+aZuuWCkSk=?= <eddie.huang@mediatek.com>,
        "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
        Chaotian Jing =?utf-8?B?KOS6leacneWkqSk=?= <Chaotian.Jing@mediatek.com>,
        "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
        Naomi Chu =?utf-8?B?KOacseipoOeUsCk=?= <Naomi.Chu@mediatek.com>,
        Alice Chao =?utf-8?B?KOi2meePruWdhyk=?= <Alice.Chao@mediatek.com>,
        Ed Tsai =?utf-8?B?KOiUoeWul+i7kik=?= <Ed.Tsai@mediatek.com>,
        wsd_upstream <wsd_upstream@mediatek.com>,
        "avri.altman@wdc.com" <avri.altman@wdc.com>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        Tun-yu Yu =?utf-8?B?KOa4uOaVpuiBvyk=?= <Tun-yu.Yu@mediatek.com>,
        Chun-Hung Wu =?utf-8?B?KOW3q+mnv+Wujyk=?= <Chun-hung.Wu@mediatek.com>
Subject: Re: [PATCH v1] ufs: core: Remove unnecessary block I/O quiesce for
 clock scaling
Message-ID: <amAqHFOgPQQY-3rI@QCOM-aGQu4IUr3Y>
References: <20260604133503.2049288-1-peter.wang@mediatek.com>
 <al8YkXydXJQZrl_Y@QCOM-aGQu4IUr3Y>
 <29b5f4368a63847b84b87e36a1e358f5991b694c.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <29b5f4368a63847b84b87e36a1e358f5991b694c.camel@mediatek.com>
X-Proofpoint-GUID: WFKcewZbnVKjHM__uhKUeMjJEySal3J5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDAyMCBTYWx0ZWRfX1IBtd8W+DT6Z
 FwvFh5+Lcs+5gPWGl90TcotxmBbmm5PjiAPVJ/aMgmmm27KAXP9mkw8B+CMLYxz9KpyM3e/GfM4
 VFgiFIa09Tdlx55Y/g8eG5sxdRdAM3c=
X-Authority-Analysis: v=2.4 cv=ZJjnX37b c=1 sm=1 tr=0 ts=6a602a24 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=inPtic0riIV1Bx39OKkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: WFKcewZbnVKjHM__uhKUeMjJEySal3J5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDAyMCBTYWx0ZWRfX7vlDB4ZNdzJ1
 68MbL5oKX1h/e7QqkUG6WqKs/jLf/7+5KMreNPT2mk4VGfrMwrzd+fFKegnHnP0gKbhgtW3jJ78
 TEVydO58IjvD27Hpxdiro0Q+8CklCKs6RTwtrg4Y4Ph0s1DKQHl9GDYUckR7jqGwvCfQ9iYMm6J
 PKqWdOt6jlqEk1dnDkW6xzAj1aLs1gM2xC1WpCp/MiOxincHcNtCccT425Z/oJ8qB/7ZOWOHJTP
 fng9GhkZwRa+/GE73iI9frrB3eY4WRhgJpwbNkvfzAJde5mXoJV2OOvOMsrKXcFCMXLO1rvGkhc
 /zzJP2QryIc8wAsnguC0P6/Xl3PBiZnNB97Ss3z/CBL+qcdP6cX3JxXGZtcHRyE6stfod9xxmsA
 XwK6ywa2JaQrf954R+ziiSUjoDacdOi4Co/OXQGkcs0aiZ78h8InS+NBRZq8s8X3XW+KPKM4TSD
 5ZMpPNrBAu0UHFwpnwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_01,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_192541_380744_EC1EE9C9 
X-CRM114-Status: GOOD (  12.43  )
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

On Tue, Jul 21, 2026 at 12:54:01PM +0000, Peter Wang (王信友) wrote:
> On Tue, 2026-07-21 at 14:58 +0800, Shawn Guo wrote:
> > A revert of commit 85b2b9662854 ("scsi: ufs: core: Remove unnecessary
> > block I/O quiesce for clock scaling") fixes the regression for me.
> > 
> > Shawn
> 
> Hi Shawn,

Hi Peter,

> What is the probability of this issue occurring?

It seems 100% per my testing.

> Is this a design limitation of the Qualcomm platform or?

I cannot tell. I copied Manivannan who is our UFS expert, for possible
input.

Shawn

