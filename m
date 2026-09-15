Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC2EC88E75
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2026 06:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+uyBT5Zaxv1RHABZ8zEG0vkgVxe7bFptHBkSRZjYknY=; b=YC93GeCK6rXz/+ZActBigjWOYW
	kBhYkq4kIDwbCgiThPNWSlA2CdeW4WfPaZ4WIc7Wbb4DeMr3rILGZ1hJ1IL3pp9elQia9j6ee3hNS
	ySrkSUKxUtOJM7Mm41dK8hXyBMJ394KdKN3YgTkLiOwH6dgwEWJa7eLRCeDZiEj3JezlglkjI6jV9
	RF/KeRnoWfwmHqkWpvsF/G2wL5TVfk3fYRDAdMNSE6UCb9LGd4jnANyAY0MmF8ZvQ9BIGL0CENB/9
	fbnM8t47IDBtMYVh/KFE+13M/1pGfiB0PJ9xS79qnjjA6LOZ8oEwYVUwmWe581AA/Xf4hVxa7oEC+
	VIhvHGXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6MJ2-00000005KMB-2yjM;
	Tue, 15 Sep 2026 06:06:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6MI4-00000005KHR-1mSo
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Sep 2026 06:06:11 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F2nRDq3319816
	for <linux-mediatek@lists.infradead.org>; Tue, 15 Sep 2026 06:05:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+uyBT5Zaxv1RHABZ8zEG0vkgVxe7bFptHBkSRZjYknY=; b=IYAr1IbJLqKGHlp+
	8asmbPHttAf9fAPsgi74UFS+fWXB2zYMG+GRBUm85azZODOx/3pIAfXSSu/i/kB4
	5bwFbvagZrWPOUNgmUNmMOtSw2B3A8xhIMQ5h595xLXb77yE2vHyOUjIVCOCvKL8
	Yh9Oz+g471cIkF59lwAgs5JY5Fd7nV4JAm37hAVdwzirn29fwbNa+0ePm9SfqOq9
	G7NSkTtNk2EEt9l9nuba4rvDRUNDDOb6rM+v9U9c1h08OTLPQkegwsp/wKoqVhOs
	YXbk2bHC1haLukheqGRPl6ExyoQBrMgHSXBLv+lUOau6J3TMBsu0Bj5d29FWLNCr
	Q2ymAQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpn41tnxg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Tue, 15 Sep 2026 06:05:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a082c014aso158537785a.0
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Sep 2026 23:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789452306; x=1790057106; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+uyBT5Zaxv1RHABZ8zEG0vkgVxe7bFptHBkSRZjYknY=;
        b=c0ujiTaZeGHaNmoezz5rOWoV2LdTXn/B14GJPn3IuFFVH/y1ULlnkWA9uPqccfKdbs
         8DnoNNe3zrW4YYx7inYVYMiilC4ZKWq6kFHv3W7Cf5y4sc2jE4UcFlv0aXbftYslTR2N
         y4OQXe8tBnaAdl9Y/X6cCtTxzq6wrhWbtU5fnE1SP6eqTzE0XAQMQ6QL4q5KlOn0HLTd
         0JiOL+x6JjMBJC1MUrCi1fsQsYO5B6hb4hUhKvmfmjfHshsWpPUq/DZ/gS/bD1w4cGWZ
         p2HRmCgCEk3quP5H3FjrvXPmMSS62daczbRmP8NzyyVAitYIfqGN86b3w+kLBJYDr6SM
         UJpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789452306; x=1790057106;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+uyBT5Zaxv1RHABZ8zEG0vkgVxe7bFptHBkSRZjYknY=;
        b=BDexAZN7ehYRLgzLALRmH6SzVHZuuhLqMxK/vtlr1AeyOsRMpHX5p9+GRAh7Y2+D+E
         3U7jOIS3uGKv+xa5Ph61ZYHH6q9/GL09zoLpZrc8/Ur2WLKBIa8AxChg9V+oHU4gLc4H
         3gmzCnDP49A5XLL+pOaSaGKhwCJ9IdUed3W478N0ydZVSevwpIrBFyDb9GqU/kz+iwJN
         w0la6wYjd6QvPwydP3d46G1D0gA01NPZBV8rsWFFNyEVnfEzhpQvHwNHfvBoZ3kefx9x
         SiSebS8Ju8XqO3vtz7+mZ3PfC6n4x0cr0gdBvmBphntJhfFZMQr8Gikkk7Ij8QgbNnk6
         L2Yw==
X-Forwarded-Encrypted: i=1; AKwUvByFuDkjfEFvhji433E1MI7cn6NAb1NoLh9mgy1A0w6FqMX5WiUA2ECnNOt15gU00GMiG8UyeV58PeBrYFDKow==@lists.infradead.org
X-Gm-Message-State: AFuF++nevM3lXhD1bvg0JOt7Z19MJvcPQj5fbjDfkOlBKRyvwY6bYKzs
	78b3VLdKkklxtndNqVtMSWjbKhaofGInlgpUsPUdUVYiTSQMtF5R0GPQ0gcCHoG7tWNQRUprJ5L
	PjvlCN+NNMoR981nH/QeSSmjVHeVnVfT77dR1/3cn61tU0pJINFg7OXRFG7+L3b6RZH2EUF7Yld
	I=
X-Gm-Gg: AYBFou0PRw79f0c5bnzd3ZHxoxQ5uCVL6ttMDMHYn61bHQVc7GqvHgT0eiFbx+ao+x2
	yM90khYsOAnwxW+pxNiapQ3uz6YumygQN6u44v9Nn3TZUr3TPjV/1Q5sXTl8ca+v5TlOxtxR/C4
	727LcMCrr+KAhY8Z9RS+UNX7CusOsYBOK4k7fO5456YXMC6HhXc+qmTr8PpPEYooMwNIpt2eniA
	JE1JntvrkyvhaXYLC5pplITkIwuQp1J+pOs1VcatU/S3lUwB9Eear5xC09jibhU6eQEKBFDf+ta
	DMRuftFHNhO845cJJR5VrYgizzsOTuyg5bqxEY1g/Qfsjior0h+tOSFqoBL4KN6zApetxpdIj51
	6QJVP5WwIADhBVCmU1XaeOpxkZD/+
X-Received: by 2002:a05:620a:7018:b0:93a:3257:34b with SMTP id af79cd13be357-93a346fa956mr323526485a.29.1789452305623;
        Mon, 14 Sep 2026 23:05:05 -0700 (PDT)
X-Received: by 2002:a05:620a:7018:b0:93a:3257:34b with SMTP id af79cd13be357-93a346fa956mr323522485a.29.1789452305151;
        Mon, 14 Sep 2026 23:05:05 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb3602eesm30648123f8f.34.2026.09.14.23.05.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 23:05:04 -0700 (PDT)
Message-ID: <18eff59e-e9ec-4c44-8d2f-f689bd5f1832@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 08:05:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: dt-bindings: Use consistent indentation in the
 example
To: Mark Brown <broonie@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
        =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Khanh Le <khanh.le.xr@renesas.com>,
        Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>,
        patches@opensource.cirrus.com,
        David Rau <David.Rau.opensource@dm.renesas.com>,
        Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Yingkun Meng <mengyingkun@loongson.cn>,
        Trevor Wu <trevor.wu@mediatek.com>,
        Julien Massot <jmassot@collabora.com>,
        Jiaxin Yu <jiaxin.yu@mediatek.com>,
        Shane Chien <shane.chien@mediatek.com>,
        Daniel Beer <daniel.beer@igorinstitute.com>,
        Sebastian Reichel <sre@kernel.org>, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        asahi@lists.linux.dev, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20260914093657.61218-2-krzysztof.kozlowski@oss.qualcomm.com>
 <aqg6VUKriyVANv6u@sirena.org.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <aqg6VUKriyVANv6u@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDA4NSBTYWx0ZWRfXx+SPGXbwlMjU
 CS8o3aB6u1Nm44iLD28lBHI+uedMsG6bO71WHvJJSgZAb1jkcgqr3FX7LJPnLGIjV0zfbgE+4f1
 qEfBjkwk6Pox/cT+yI/DjMu2g8n8NSmg3+1B8O6T3C/bp5iNFC1dsEF52o4I4q9ggleIaLzzrbr
 69TwX1GW6zZSNXwg+7FCzjbtJMKSvJwKG6VUT5UsmRWUHH5FLW/9aGHMAW5rgb/xTVV2tobujty
 tIlUxhugUfIJZspyNXAnW1JtB+vI/nTf2iYq15pmj9aEq97kfF32ujzScLQCRpR8sXvrD6t5vhU
 EiSRyFxsSoR918CfvTZPabRtZZRG+lEM64vp6QFqp7QWGchO5c1efuXnGyQDlSAHyv3N9yG77Ka
 NrPsJZCocuqSEeHSqkYzVja9vuFLprXeRZQ7SwatyfBcjqLbszlw8bPsbaWEc4brFgZGiw0xopt
 KYQ4NxEhKGaL15ZB46A==
X-Proofpoint-GUID: 4SUps1ohc3LS-IIK4fb-HW0rAsWUQMzx
X-Authority-Analysis: v=2.4 cv=cqQOAF4i c=1 sm=1 tr=0 ts=6aa8e012 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=chZs0_0Ys9iI7aL1xjgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 4SUps1ohc3LS-IIK4fb-HW0rAsWUQMzx
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDA4NSBTYWx0ZWRfX7oolJYv/2gph
 sAvDftsVx1ecswg9o249jLrPneijVsBbyS1ra3MzMpAt3gwx22Z7YCDsM8WgJevP+xBPO+Bi4En
 TbayymJ8RFabiiREOb9+j+ki3EMjQxM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_01,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_230512_498436_4D0B1978 
X-CRM114-Status: GOOD (  13.08  )
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

On 14/09/2026 20:17, Mark Brown wrote:
> On Mon, Sep 14, 2026 at 11:36:58AM +0200, Krzysztof Kozlowski wrote:
>> Correct indentation in the examples to consistent 2- or 4-spaces
>> indentation to fix dt-check-style warnings ("example 0
>> [indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
>> re-indenting entire example just for that is too much churn.
>>
>> While changing the lines, correct also node name to be generic in
>> cirrus,cs35l45.yaml, cirrus,cs42l42.yaml and dialog,da7219.yaml.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Can you rebase this against current for-7.4 please?

Sure

Best regards,
Krzysztof

