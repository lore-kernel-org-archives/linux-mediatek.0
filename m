Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 486C4106F2FC
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Mar 2026 08:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UahLMjjXP4HmY+1teJYFwYlE8SFM1tviQgqBvsmUzcw=; b=A7sIzEeO5KqoKU9LhHxWjYc+vj
	6hmmzfCCZrc+4TzzI1somO8wAEKV0/+4Rmg8tGVQ2oHIx/u3L4kJPplHVprJB5KYDHkvycet47URT
	GUXVYuReQicKYNqzK0e1a61Q81yJoeFaeUtcr2dXWwXcRyJo41CmO8aXVuddU+HrrjyK0GfRShkH4
	qMxNujPntdW99VR8Ih+doVue9bWhsJbOL0yOwn/PUZle18z5/ISKHhRqaD4h6EEOHGRPVzm8QzEgZ
	GWXzCk+Cjgg7PpgCCU5Zjoy7pwSwg1+/BJuzvBXmWBdW7odECziDeZNTpAbaZ8fbmj+6LwUiC6eqJ
	lGO45tLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gH8-000000052s5-12wl;
	Thu, 26 Mar 2026 08:41:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gH3-000000052qj-2s1z
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Mar 2026 08:41:08 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q7MLWL3070099
	for <linux-mediatek@lists.infradead.org>; Thu, 26 Mar 2026 08:41:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UahLMjjXP4HmY+1teJYFwYlE8SFM1tviQgqBvsmUzcw=; b=kwqFVl0va4Ro4+rt
	fFgR1pQCzXvp8Mms5DBXi0Ow2aYvPUaXH6hlIhO16WnSpOV8MwbNlmWjKWe9TKJE
	J5coywcqs7VMaFOehqKnkiVjfyGA84VV0WzF2crMLMozmnJHtB31gFvTLueSbfT2
	oJz/npWpybSJK7bmwLETA+J1htz3aqgcjl5OnJrb18YiV84BH13+p0O7sLaLxWWp
	qjvKUy1ZBqwJmFSvaZsWvbGKJlGUI/ksvGuSF852jMxu8vFHlEnGMIjHl/YKvGZ1
	YDL7/rX9w/6AkkPIYPuiFYRcd6YJpfYxMRNWh6hNffJVdy8pY1E6zmtANkTByNj1
	7zCBdw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4rcn1qc1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Thu, 26 Mar 2026 08:41:04 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b31cff27fso9726841cf.3
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Mar 2026 01:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774514464; x=1775119264; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UahLMjjXP4HmY+1teJYFwYlE8SFM1tviQgqBvsmUzcw=;
        b=esFW+z7sDsnt2/deeBnQpFnxlrsAEtHdGxkrVkRznLIFo85Um9rRPWThdkg3mzSl3C
         uRTlmquJ+H6fddRgVVInC6PZeXvQGu3nuG4fUVNDWpN7Qx27LMa6pWkRSLJtUo7/wcw7
         3EgFA2u95Nrg8fIV1ZhRoUDvv5Q3TM+snBL0XZ3HjTxmtoLzZZ5eOTyxRcnsz8AxBCMd
         nmxandvjzSugIrPmBPaxDRX/CNoWcZatqWefzYQ0zoUiWW3izX0wc8eOCvlAbkFwwx/B
         Kmw6AhnKM/mji42jK1T2brq9Tb3BkIZvEv8wx14MpvGRIw0MjVwNnNCMGjNdWNSHca8u
         i4ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774514464; x=1775119264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UahLMjjXP4HmY+1teJYFwYlE8SFM1tviQgqBvsmUzcw=;
        b=NvezVXXzZeMI9zEzlGZ5tVOz9q9anLjuZUKQvs7kQYyG/U+winKQIrAIH9Vi261O6Z
         Obez9totJt9M1GFI/S/WEO1Mu2wY8mePW1CXSZHnNWtgYvFgHW+MFq0cobqt2e9KRjxP
         VrPOXaxHjww/MJx0xz5qhnW6tsFw/r9BJ/Z4TYE0GU9Y0Bs7J1harb3onSk6xeIjOfXL
         FqewVcxtsYRlVymOaUmFKr5QeoFxQezIE/mYTm3NMtlClmJEpqREpOtv1Y3zIQqldEw4
         c4SkhGiFO2FY1OpvnuDXB8pMnxZODgBPtrxLMPVmdNdQSHCO1BKv2Rw5xXGWxWky8ReR
         dMaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmiBnJKe+JPSwktiWNI20xlje2EAbmvjPczuqHIEN+qf8MxgZgAl2MQDuKj5fybNZV4BIVWw6Jmm0EBVCGLQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxjH1CH7YjbIYJSoUikDIppO9ZC6r2346ZvNrInwJkwSF8d+66c
	rhXv38NzjucmXKDSGU00QyAP4oNYBt0mbtIWkLbrW5F8jtYheq4knENnOXHEFWbvKoJUUlfqiuS
	lq/i9+iIoToZs4rFEw5SbROmHpSbCdypUU3rOTa0S8ExCEM3ibMnlXb6Pfy/VoFc+AE50cav2QH
	M=
X-Gm-Gg: ATEYQzw+/dgOljBrjm3lI456lTNH6Zm+uXGwnPhSAeCkgnjbYWFLgERZ2KN2//We5Y4
	IdAVAy6TxpczH+LBP6jF/5ZBgxC13+FUmRZ8wMX+cO2yJFHywt887makbm2Gwf84nC+8xUenOLz
	OXq3Sp+8qDX1dO5G2AS4L1eSbmraLZtZUqe5kEM/gzUB6SuAIrQq44F+eB8wuvk8UraXkvH3YyU
	lKzInKekJ+5O70oFoj5S0yYM3QTmO3y3oHfQypr3E/HM3iu4eFPvt1A/5lMrFK44SVYc9T2mMS9
	ufqhWf+Jci0aKqTNpTbJgyk5LU9qnIKpExM7J1yKC58PE5KDm2xKKmEfTpEXeLJDmH/R85T6TZN
	GvaHzJqA9MXENYjQSkTZP8Q+W9R0nWq3NT/IP/h9BRrFgkzxBIM8=
X-Received: by 2002:ac8:7e92:0:b0:50b:44cc:2a95 with SMTP id d75a77b69052e-50b80e36ab3mr91222391cf.36.1774514463729;
        Thu, 26 Mar 2026 01:41:03 -0700 (PDT)
X-Received: by 2002:ac8:7e92:0:b0:50b:44cc:2a95 with SMTP id d75a77b69052e-50b80e36ab3mr91222121cf.36.1774514463190;
        Thu, 26 Mar 2026 01:41:03 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:92a5:ac13:cd81:9625])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c845b8sm16608955e9.4.2026.03.26.01.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 01:41:02 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Arnd Bergmann <arnd@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>, Yixun Lan <dlan@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] gpio: fix up CONFIG_OF dependencies
Date: Thu, 26 Mar 2026 09:41:00 +0100
Message-ID: <177451445822.5060.11939390617609457696.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260325100144.1696731-1-arnd@kernel.org>
References: <20260325100144.1696731-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Vdr6/Vp9 c=1 sm=1 tr=0 ts=69c4f120 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=faeRYzTSnDSNNYB9Nk0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: qDDVAIhqmiewOGFtSVj6nx80OIra4Pc_
X-Proofpoint-GUID: qDDVAIhqmiewOGFtSVj6nx80OIra4Pc_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA2MiBTYWx0ZWRfXytriSAx0by8T
 +GPqKL1LgSpL0mcyUJVzAP2WAMofIVGL+9QeCPvXtsHb12YwzoHz1k9uUAkSbpaZ4osp+aB8S2X
 pX/5vegYRCDlzDdgNYuZTX/ieQfl0BwGpAzjSN6B+KRgud/1Ph79FSPFlisjmBXjSInyx0++yE6
 Xhw/eHOmSeGj6flOkVIrU7SE0rQjL5aokMaClwpw4ymwkif/vvLXkcB5/4RqGSMN+d2EsCGEfPH
 qxk0HbUX9GfLkP3Xectdf066u4SJKKMZUEpQcCh8v3X8PAYztJF5DsNSmlOKaiebuwiNxRythyH
 c1qKjgq/BH+BOOlSy5XWASIF4dbikzt7AwK7dWjxgMnXPa4xoJ5sjmQiNPlvb/HBtAlR0v1gboq
 1oAGu5L4RAAsflZvWkwW9/7kOkxTytB07SN1QTN4mZW7OWkHF62LGn7xrUWFJNo2y73zaRta1VW
 psUJmfRY1AY2yfNGDQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1011 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_014105_833802_CF0B632A 
X-CRM114-Status: GOOD (  10.76  )
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


On Wed, 25 Mar 2026 11:01:14 +0100, Arnd Bergmann wrote:
> A number of GPIO drivers that used to have a CONFIG_OF_GPIO dependency now fail
> to build on targets without CONFIG_OF:
> 
> WARNING: unmet direct dependencies detected for GPIO_SYSCON
>   Depends on [n]: GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF [=n]
>   Selected by [y]:
>   - GPIO_SAMA5D2_PIOBU [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && (ARCH_AT91 || COMPILE_TEST [=y])
> 
> [...]

Applied, thanks!

[1/1] gpio: fix up CONFIG_OF dependencies
      https://git.kernel.org/brgl/c/af475c16bc02a08ed6af6ca0c920f98a45611fe6

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

