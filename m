Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A096DC5DF87
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2026 11:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oh9SGcJoUiskZKX4r4ZOUupPC4HusVwgeUCpZ4i0z2g=; b=pgMwKswu/KeqF92zbMJ5Nax0G9
	bYfTo06iCE9zMlDsiXLw68HO8UmsYgS3hJ4yXUudgSsUj1nyk5ydimfppy7LahO1WCYx195R/lSDM
	KBYfs6ry81iIXQYXKPWpLQzftlXezCYGHCRvJS43YdTL8FiTWX5e/vPFF3NFMotBiO9sVgBEvQ7zo
	vciLTQLYa7OEEnKXKrduHIC1mC0pTN4c2t23o2kZh/ypjSuU9MljAx+o4HRv5UbTreck0sq0BEWWH
	FZE+Y//IbKU1+dIejomhzOXUbvmIqZ3ZbB8mK8EAyO8/I2Wz1Y0w/KsOT72izfVOSTAsixdvCEdWL
	tSinCiuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxNdq-0000000DCyt-2UXr;
	Fri, 21 Aug 2026 11:42:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxNdn-0000000DCyB-1Mtb
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Aug 2026 11:42:32 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L9LtUT1799149
	for <linux-mediatek@lists.infradead.org>; Fri, 21 Aug 2026 11:42:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Oh9SGcJoUiskZKX4r4ZOUupP
	C4HusVwgeUCpZ4i0z2g=; b=dIiHrkTie97NjxVm4NvU2TiTEPat6N9VWVR5IIA2
	RhkfBrap9NoBtwZeXf84BAFAvVqDmeUEEBvzztw6grOX+S36Aah6OQKe33ZrZhj+
	IQUgKQ8o0BiJOn2Jx761e3/gJcHAjbEg0SDLZ7ZCNjGn/u9gzb4R5hXN7n+9nqVZ
	QGRYA89WYA0/kMgPqzGdns4lDCPLwQmN+Bt/35DOV1DFLVLdr4Bp02FWo4/EkgNt
	MNCqVVGTiHHDjxxxZ1Q7yxqzfCfBUWr6xzYIYYQ24/B/k+ePz6/3Xoxfas9PWnmG
	UCmHB6WAWGlYEXM9Yd+WTwz8LeHPhNHji2REd4PtzfIpGA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6ecb9qtt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Fri, 21 Aug 2026 11:42:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5276aa86d00so9258661cf.2
        for <linux-mediatek@lists.infradead.org>; Fri, 21 Aug 2026 04:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787312549; x=1787917349; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Oh9SGcJoUiskZKX4r4ZOUupPC4HusVwgeUCpZ4i0z2g=;
        b=aBoSipodtUDdRNbZuWLPZ0EJi45IGmvz+sf1SdjmZZxL+XJxSbGQTq2SuaoLQ2y17k
         4GPVE8UPQoymB/DFqP6Ggd9TS4Ogkxfm0GSktqGEan3EuOWr/9+l2eT8CEeRtb4/0F9W
         UJCDqoXwSh8ATE12cMDH9q6o2xwEIR6MTKt0Yx2wDWtBrihrSK8llA6osNfK2hI5r9OT
         51gDt1HIooCwA7955/uiLRDvKtOl+eIaI6DfUrzfL3LXr+4PMIXhe+bVvdil+PH8+8uX
         dHVh2pnnBLDft4Fsp0Q6rwanlX5Jgc+SOmxu+CZxX9s+vDBhtDDf9QIF6NLxqqQh0LFn
         47HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787312549; x=1787917349;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oh9SGcJoUiskZKX4r4ZOUupPC4HusVwgeUCpZ4i0z2g=;
        b=OECegwNdL8mKU+6jrqkWVV5Tq4tFZ0FMX9tyhEXTla5HzL+jxb7qeQY2LUcbvlhszX
         +GAZBV0vDw3eO0Lv6OCUcupj3/4rKope0JNFERarQdg0938bcyyn3VD5gWYBXDo+2DWF
         Twje+hsb+M9OPD01e36m7EWjZUPWlZXKb6TTED1ETPtXgufV76+RSu2+3mYqR8odCcKt
         p1Af1t9/0ADUp5GHuFJndOuHee3KAWdmKAcCA6ZaBy13h4+o2sQ2WI9bmFrkJ3vb3Jsk
         T1lkKIuFUEz+Q5ckKfpId1PP/7QOwFHiR7Q/c6So4yuyrjwec1+4+PBP3dsm2tMJfcRx
         0DlQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro+BhFkJ/E6BCCNB1gKrUrrZV5zE8BU0XpdjHyH79adaIJ6XrDU9grElQfL5MpIazxepaW9wzCneo22oUvXXA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyeyung2odrf7U6uj5+OfKV43GY5O3DfIhO1P0l08J0fuFuBrEl
	rOI5u2R643yCLF6ps/yTXldfqaTO8GXOsONSSWfhBJTnO/BKs+0hw2znoOKPewIHmR5GbAcbleq
	XlUEVBSogez0bmwK2V5mR2OIflH+ycI3+kyQvY9WCXkt6WULQpSBbPg++LZWwlfFzYrf32BA7qf
	U=
X-Gm-Gg: AR+sD10FzwKDhhrjFIl/zJy/tutDpYM4M1QQSIYOLVYGE6ZEHvsZ/k0Iuajz7/xrQDk
	IwxLxX8SKaaIxur4ciegme11mpJlv6rHHlHoPeo/LuqXSE4NLAcr0Db7vavGAs5UubL3qu2g33g
	9E0l+JQW6ZW7CdQ6++vjTXM/kLr+su+q0wBN1o1RNu3KQH6PXc1tII9R7q43NlWkWQXAI30JpjJ
	ph6tvMt+/cBnHuqx0nw6zd4N1iSViDKUmCQwsfOKuoNXgkcfAecm5yziGEiu+JtjPV+jFa6uJNA
	QVGn3YRvJuMkB5nAuOKYdB6OWPvTXGIaWvV6kerCDBvStUugJMoWtll0h2bh8cMTGEEKetbH9Kv
	lapjEQfgu3xrkmrI=
X-Received: by 2002:a05:622a:283:b0:52d:89f8:4f8 with SMTP id d75a77b69052e-52df56e491bmr49499961cf.5.1787312549405;
        Fri, 21 Aug 2026 04:42:29 -0700 (PDT)
X-Received: by 2002:a05:622a:283:b0:52d:89f8:4f8 with SMTP id d75a77b69052e-52df56e491bmr49499401cf.5.1787312548864;
        Fri, 21 Aug 2026 04:42:28 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24591df293sm474840366b.45.2026.08.21.04.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 04:42:27 -0700 (PDT)
Date: Fri, 21 Aug 2026 14:42:26 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH] pmdomain: airoha: fix unselectable AIROHA_CPU_PM_DOMAIN
 kconfig
Message-ID: <7hlarbdpln2y5ckt3i6nz4gskcxl6e6rher6rvsgmwop6bj7jc@exu2d7paa5iz>
References: <20260821085222.140633-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821085222.140633-1-ansuelsmth@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA4OSBTYWx0ZWRfXxp9w3AanGe4Z
 5fYmC0xLcuRwiBkY0RKEroehHqPnOqUgCeC7Ab++HI/zYE8hD0VPaR4zB7EwMvwKcoQe1YVBWYg
 rnUoYc7Q4u1eKpUBGH3r+vg8z+UdmfZmTi0XUVgJsJyANoWWcbB9FcS3tktm6YK8b98g1v5jBb+
 TQ5mWopWutxmHRQ0c7X87Xp4tHv6J2Zt2BBSQL6cQCLIltRK0f8yNMonQYUM2R/crYDdxYWtpQH
 ve8oIpyqCjDV13bw8ljyQfasYzSU1XkXo6Ojhy2d2zi9t/rjV/Xbj2OLwYCG0a9OP/HZtNjWkuo
 aZ9GPmn/5Vq8D5yW/Sz7ZhlEGk6HFRlrv2nSZ9nijtkwqZgKEiopLbkFgbRKLN8yP2qUmFg/uox
 xABSoSO8QZyrDwm/O/lmXOl2GekN79jjFxaP9gz1Qaaxn4IQ/V0dmupHBLYAwBCAjETG9YWr4/D
 u2HvNbGjLWldDpIcW5w==
X-Authority-Analysis: v=2.4 cv=e/s2j6p/ c=1 sm=1 tr=0 ts=6a8839a6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=8jWgAth1d_VLo0Q-LswA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: xkOKndRHOBri8ETcHfBx11X4O76TGCmG
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA4OSBTYWx0ZWRfXxqw1GUWCNfMu
 xRAjC6D8JWPUpy/5uisMZLn/phl1Co+HHuI8hhObT4jCq22de+mh/Xvndm3PekU0b5oIdgKHzvf
 wfKJWOWHD9SjcLkJKhacZf+v7xLvG18=
X-Proofpoint-ORIG-GUID: xkOKndRHOBri8ETcHfBx11X4O76TGCmG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_03,2026-08-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1011 malwarescore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608210089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_044231_471545_95B64184 
X-CRM114-Status: GOOD (  10.33  )
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

On 26-08-21 10:52:15, Christian Marangi wrote:
> The AIROHA_CPU_PM_DOMAIN config was wrongly guarded under the Mediatek PM
> Domains menu and was unselectable.
> 
> Move it outside the menu so it's now visible and correctly selectable by
> default on Airoha SoC.
> 
> Cc: stable@vger.kernel.org
> Fixes: 82e703dd438b ("pmdomain: airoha: Add Airoha CPU PM Domain support")
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

This looks OK to me, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

