Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8074C531D0
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2026 12:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=44rzlthw92Pyb3IiSzSQiDvHWraFwPuyNqv1IZJTnr0=; b=D9GzUO10I5xTJ9R5fVzfacZxaP
	gixyg+pfkU5brb7nJ6s8GxeD+hBW+sITUwnIa53n4+0MdpvnGaT5tZez3nSvuykDqVt5W43mqsHJq
	Ht92CDnaNb5WGcvzRbrg60aHzb8ve49AygV2zZm3QyXXhB7Mzb1hhevBLH2igDW+nmpb9OnuA+RU3
	Q71XAWzPLKu5fzvRuxScTyJrFjqSqXPoMrtPqFxTuCkh4EL7k05sy8oSE7ExAEVn2Wdk/Yi3vVERh
	2r8c55JPgh5WGpDNiKaetmt73xzyzu+9rtYBU42qzWJLXZXxMph/7fzDM1qhbV1fDA1DbpfMGbPQk
	1E8T7JAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKYm-00000002ilY-2Qw7;
	Mon, 27 Jul 2026 12:35:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKYj-00000002ijG-1vgb
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Jul 2026 12:35:55 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RAM2mw3647563
	for <linux-mediatek@lists.infradead.org>; Mon, 27 Jul 2026 12:35:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=44rzlthw92Pyb3IiSzSQiDvH
	WraFwPuyNqv1IZJTnr0=; b=OvlEfZJa2Gb68W5vnOidmz+1rY7r3EwR1TsK6esL
	APGXdea8+9tVyHs8yQGHF79EJ9vB1o7oM5tkOQbg2VmmnAl4g2L4Hogu+o1Jq0pQ
	Hl5xDaNCJtnQAqTl9BQpU1p+JlYoPGBbeNABgvpqZErCs29WsCvuUmeor/oc774y
	pQl8Kr02kzLsQKIdnv/2FpP9MtpyWiVwdzAE+LE9Xsy2J2FngW47uTv/junf8/M3
	KWWbLvr9ssvqfhwGLZK9wtPcEb279z0UiEgMeBg3sj48POOil+FL6h1l8RtmuE2i
	8ePEY9kzaAlWC3Aaj0oDbw8IpORtKdSOidkjSr+wAaktKw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4mrrpec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Mon, 27 Jul 2026 12:35:51 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c856470fe9fso1673729a12.2
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Jul 2026 05:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785155751; x=1785760551; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=44rzlthw92Pyb3IiSzSQiDvHWraFwPuyNqv1IZJTnr0=;
        b=fW+m7tCmF3oRdlDVqnbBBbyLF/FWLkaslVU0IQrvTk0d1SMfTwRDyJFHOu5YbYOIQe
         pFk5Zyz/y6PZVWiNLYAu1EZ6rdYtuCEDu1Sgy+FotDwGRHKbI4REL8QRqLoEP9ZZgRO/
         IPJe6JNX7oA7E4cHfh0p9bqEjzggGAB7RBzM9mnFJx+kZwAcMIZvw62y1GFE/sYzLQ0I
         C16pXQNI2KK6w0WbrPeXEz/bCe43d1LHsrvNIkkfd6TsFTCYpC6MSjgNpk/X3pPq4FsK
         pIYTnwslLK7DtWTgqdxZHa3hsrSeI7l9ZYdcWIVDILVNckBGuXed5I9+25Gum3bjhNQg
         cAEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785155751; x=1785760551;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=44rzlthw92Pyb3IiSzSQiDvHWraFwPuyNqv1IZJTnr0=;
        b=JDYqN+RnuD67F5QyQc23wJy/YQa7XspciRvbLPAmx/1UDdZVZnF5O9mfHkYGPqenFC
         JxGcJS+UUaysth5rsgPd7U3dv/WMil9gzFsdS7iq0ZeXmjuAYyW3pbuN2vEGwbGzxX8I
         C5dNC516aNnu+sX0h34Uh+usrcQyPGzK4HapSKryb6DJsCyexV0zh4S0WgA9Ed9hH00/
         Wy1aqlzjfeBvpWXNhQk153VG/eL4DC0c890XPte4g7QYlvr2p0kTbZgtEFhJ34Nzs4nH
         32q6ID8BhiMJf0y1W66oI3o1hY5bcKBcujnjzqBunjl+ZvVL4CId8ef4sOQawzbIwC34
         6q1Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq/eO92oN6t+xQCxqIvHLJXDvhsx0k0OD/e8plSO7ASp3fHcX7OuWOWOFUVdGt+nki0tmOkqrJgmZKL4ObfoQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxQb5x4C17Dcnyjpyr2342d6i4aOKiAoBPk9VK+h8/ImlX1dw31
	EyhGM9/G54Jbqe6Ns1bB8EAQysJxHwoN9rB3AFK24LleoxdOteT5xHqscLRnYYq2Ji7CuNGJFob
	iE1+RBJZuGRu3bCaMR2Ly4JpS2VQfj4DSrvHhi7ZKdV9VnKy31kjA9Wp+wuO9aEXBJ1wTy+AMPg
	w=
X-Gm-Gg: AR+sD12vKlYQToG72zMSjgxgCPYeyVMkfxZkdfHTj8Y99q5XCr2VRPTiA84KEOAWps7
	89LC1uC5K/x4KjP3eEuuIc4VBwH7ImB/uDqpEvzIHclZ5OmcZBwuv8qS9NWtIYeWczNwWGWYWL/
	BXfL/svrpk2D3HQowFSz97pJU7APg8sED28gSfTn5gBBmmbQMEa28oIfk7yGZr229VI8VIc0WUy
	OquUwxBWrcZUeZ72/gr4s6YEemlBqIgmmVbKSjVMqjU3UOkUeq4FpScqqG6H68x8O8YH3+3Ldiy
	QiRwc4OyPmnUZFOlD/VYONPyNH5kwnCXvavqeDcqQkcCdZk4dIcpAWdNFzEF45bnL6bVmmLn2uf
	jJhO1qxVFRCRUwOKzBnAhu3GyCIs=
X-Received: by 2002:a05:6a21:3990:b0:3c3:890f:6d75 with SMTP id adf61e73a8af0-3c67d9b4670mr7490813637.2.1785155750457;
        Mon, 27 Jul 2026 05:35:50 -0700 (PDT)
X-Received: by 2002:a05:6a21:3990:b0:3c3:890f:6d75 with SMTP id adf61e73a8af0-3c67d9b4670mr7490750637.2.1785155749813;
        Mon, 27 Jul 2026 05:35:49 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc5a04b2sm29439425eec.28.2026.07.27.05.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 05:35:49 -0700 (PDT)
Date: Mon, 27 Jul 2026 18:05:33 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-scsi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 1/3] soc: qcom: smem: Use 'unsigned int' instead of
 'unsigned'
Message-ID: <20260727123533.hz53oknuy3xwzw5z@hu-mojha-hyd.qualcomm.com>
References: <20260727-topic-smem_dramc-v5-0-66188b3e338d@oss.qualcomm.com>
 <20260727-topic-smem_dramc-v5-1-66188b3e338d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727-topic-smem_dramc-v5-1-66188b3e338d@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEyMiBTYWx0ZWRfXzEOPx4HFHLPN
 UWWCittNh0MfEgLRKxNx/67PShym80uC+/AQwDJq2/nvNg9fjSgG4MqjB4HPFYYR/Vb8gpMo73V
 t9IwR+uL3H85pL4i0/fzQoXyqJe96+k=
X-Authority-Analysis: v=2.4 cv=UYBhjqSN c=1 sm=1 tr=0 ts=6a6750a7 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=EZmpetop0t0RzpqVzL8A:9 a=CjuIK1q_8ugA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: k9j9mBtr4UQ3fHLNZD40Hp1HlyrPmXO2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEyMiBTYWx0ZWRfX0O0IS6SJNeno
 n+nM3NQnfkSdfMqYvRTDsEmKXJb2gKtMRZjAoW9NodyJkj8ayFAE7AmVlDkPkOr8OowIf1P9Ofq
 QLAJhG147oeoa+lRfPTPfJaDYGxR+BYsCWxYw1CajjMv6qFj6UX/nBSeq7Og67rnVYenYrErSr6
 WjUQMT6zCT6b/9blE94J9T/sGATn3Rn4pV7MMWjUs2tJ2G3S7B7k7CMvJY6pOGngXys2kknLZpS
 4QKrwFPsim1aLDM717ESy2j91H5MD2RfHFqe54tdHQqZ3uyPkMLZ7cdfidvbvo811qO0BYOS2i7
 PHnIVqBxf9oHsCkozAJltWnruk4maQIog6NIy/JG8MScfjqqRK20YcseWcYpkY/i04YaeW9RTeo
 TDmBFzLsDf0ERxp+3wSc2KNAZ1vl35hG9TfsRqjXKCazQyh7Ef8C1Tx7tPXi835D9cKS4nTNJWv
 a+LW0paG8COZsU97jcA==
X-Proofpoint-ORIG-GUID: k9j9mBtr4UQ3fHLNZD40Hp1HlyrPmXO2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_053553_604785_67523426 
X-CRM114-Status: GOOD (  12.00  )
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

On Mon, Jul 27, 2026 at 11:59:27AM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> checkpatch.pl reports:
> 
> WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
> 
> Convert the SMEM driver to use the less ambiguous type instead.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha

