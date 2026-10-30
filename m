Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D826F606A32C
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2026 14:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jox2CawW;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IHDI6toP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gia7fIxf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OuitTymSSoEUqo8wxOrof9T+ZUTGPTidse28qGJb34o=; b=jox2CawWA3iRh3
	vsGJEvHfju/N/gdRIdyJCg9DgCg4E12gYWox2LMpwJucMnJuVnGmZdifRKosXJU6nimJAKK6BVu36
	NntnyqKzFAL3dW/0FxMXCgXdfX6R7ssN14HTHR4WDBzCQVGqkxZJUcD0HnXH6UXD5ND1hKFiKdsXg
	2orBn4uMQh/fxgzKnU+LIhMA1iVMUZiDbReb0UOroBJ0PIq/2GNiv7vq3FRCNjyxvG14FqVZa+BF2
	K0tU4azaNjJj8/lRKnyh0wbAqdkIV/oxpXFfiiivun57XxAv9ug6Uh2rVeuT5bNm8VLSw88n8+ar6
	LmtUKdWBo8Atj+WVfkTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMn9w-0000000BoBn-2QMm;
	Fri, 30 Oct 2026 14:00:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMn9t-0000000Bo7w-1n7x
	for linux-mediatek@lists.infradead.org;
	Fri, 30 Oct 2026 14:00:43 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UDnFgI4019693
	for <linux-mediatek@lists.infradead.org>; Fri, 30 Oct 2026 14:00:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OuitTymSSoEUqo8wxOrof9T+ZUTGPTidse28qGJb34o=; b=IHDI6toPVOYrtJFP
	z1ZskiucSL9zaQF1sOyXvlzXXmXLcY6WxvfQOn8yxwZ/hYxEfwFWQ/xNVWoXwEAw
	pi2RJnDNfhF1UY3r1JVkL39V2aGWfVLebudH4SncyDQbgusv+q053AUMKyXiydcu
	Xuuds3tuDj36SZThVwg7WNX+iTMThoNIdbLdehPh7qg+SsNrAl41CZj8mGPab3aC
	IzSvs1s97jhg8gczI1Lc967TPUvwZW3AZO3Od2RD79WhwlAtEum8sDjTCmqLUOnB
	b2ChyMvzXr5LPhJDFH+YAD9wCpqfVYMRl17krS0QAmuFPTV0YMDCQfCTL3T781mK
	o4VBYw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qkbwa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Fri, 30 Oct 2026 14:00:38 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8aa185840bdso478342b3a.3
        for <linux-mediatek@lists.infradead.org>; Fri, 30 Oct 2026 07:00:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793368837; cv=none;
        d=google.com; s=arc-20260327;
        b=ZuVlDnxXkzf42etcRKuIAsJScO4HM4qrdpzRO1aplXy0fOg2cXIzMgV9P6uAiWN+bj
         c7u2gqB/gAiXZ/G65/CTQzU9OKsLoct0+3rCfjkShAZkTfWye4xAGhc85uCu3dGKglld
         lbDbPE8g0oAi/rNr8wNqlXci6eaSyfmSTBJEw08uzuILdpTxc+p+6/VSwiUZ+TE5Z+wS
         Liw7aiQ/p+sjkq/CQNBkwqGRQbwinOSorPlWE36MKdAfAoEpifKUyjqMMScXZE9ec9OO
         gwTwEIgWpAn5JLfr1r0xdTAGEl4vWgJWkkpE1K1WHxNbfbzX+3RsLU6p1WDcgpohO86s
         +aDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OuitTymSSoEUqo8wxOrof9T+ZUTGPTidse28qGJb34o=;
        fh=vW09Dw3XZopQv4mPHbcNVQmP36qZqOnpMqNj7DrezaE=;
        b=Nm/oSlJjy20FWw94sC65HXhrLddbq6853uYF+oUYNneNDiZW71YRzE8yNjPVO92TO2
         pA5KFMg9yXOb/K2UWMc4DhqOY+NejyEPVbaUQzjorBePoKJQNSSgX0YLr+ilbzUh2zB/
         uXhiypSz6ONvc0dOm85ZTLItVtB/WgTKg0GoAtdjLLn2p1VgFReLvspT23zVobBfC0Qj
         3Mq2HUbDMbxUveSolvXaQZdv45MbTseeVJ/eNMM46cEBBUAy7IusEvlHIYsDm+p09hqM
         2apH+lfQy1rEsIzGVEOyA4dUIJXOD3wMXsqYCheGKd9NsMsF3tViuEETa1fZYQ5KfZzc
         Cctg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793368837; x=1793973637; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OuitTymSSoEUqo8wxOrof9T+ZUTGPTidse28qGJb34o=;
        b=gia7fIxfbQReLJrEQ1AnOki0SPQIaVik4Vuo/yhGa0q0Ki9xUk3+H6IhZGB73dXmqc
         2lsMF1lXbiXQ4yMqW66HmTpTpfLQECRGGee/TFpKeJat3BraQ8oKCyw5eyPryLwj7Roh
         +17Y5Z32Bty4pDPrem0ikllAH6VKY+v8skM2fjEVjhFY2C9I21Ubn9R0QOs5ROU7FDHv
         h5jbL39JHdPhm9fjC/UCZPiSWo8QRin2ceGGsd7qEBHcf0DJ0XlFL3sw8V9GdxIDumn2
         z+7YkqIJ1qWbAbIocesnnH5GqRSqtiWYQaW1X66bENbdHeFFEutx5Sy0eXmIDSMN4qfX
         7Pog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793368837; x=1793973637;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OuitTymSSoEUqo8wxOrof9T+ZUTGPTidse28qGJb34o=;
        b=tPzmj9b+JfiBDekbY96DL+m5b3OKykkRZWa2sereVZbhv3EmWEANhLG9ZnYyDu/+sp
         GOOu5E5yH4c9J0ZFL7NR6UJH5z6ltwY0jOuliAJmJNsmrkU90vR6+3dF/0KRb76kHRVk
         PESraRfNf8bpkTgIYqTrCHC7pyFTuFnPWbF397Iuf20kQTpQRmQBQ8UpLMXaZ4T1JGzL
         +BtaO7CdyYVs9EK733jQiG8UP20UHCta6nEyhSF/2vOyccLFjh/6Ml1DNDdn8Weyi2G2
         8HzaDAjtX7VUgDwNVA0PcjQrQuqHIqKeYcVjYtRINq0lHjSQMpQtBEfQi3SfAQhV3mT+
         WTAQ==
X-Forwarded-Encrypted: i=1; AKwUvBzeKe+4A23+iKDwCWTNSJIML3R17bvqxDKUjNnrkqo3k8HJrJo+Z4bx8mLCMJ6pTFxAWXPmQ0XE4yOcE+HhTg==@lists.infradead.org
X-Gm-Message-State: AFq9FYL2A+DZWMzSD4Ir19PvV1Lj0390DQCYMcHMOPrZ+8/0cILNz6o4
	HLnIX0jgTHVcnYajcC+U5mIoSB2A+d04y6TM1Sk8rDWASDImaIXQGUKMcTd74E1Vu0jEKaMLVVB
	WV519tVwVONh10fXnrGd3Kavd/mTuZkxsRXp77KpkbnzIiqPqBNQSrYcOVmys0fXo514kPeKLUe
	LUJTZvwvd7yjUwS/6RsAvUJpaNna3hL5p7KZxHA4lVRBnjXP+5Zg==
X-Gm-Gg: AYBFou17eRqEe7KB4b4nBN9H8b2Ero1r3N9nAjVUVeq24nwXWLaKRpqCjWjicpK3Ru9
	C0GuVdBGBidYRv9TJn9wYcbaHc27d4G0w2+YJtQyo+kHKv3NT9ONDC1/jNKK7c7AjJh45pL3Nyo
	19AKuEityVv8STaaS8I/rmLNFuXAeDVWn+3MH/DC2BA6JPXk5x+iMRFzQA2Q==
X-Received: by 2002:a05:6a00:1c91:b0:89e:584:bb77 with SMTP id d2e1a72fcca58-8a9c098ab29mr2174608b3a.58.1793368836882;
        Fri, 30 Oct 2026 07:00:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:1c91:b0:89e:584:bb77 with SMTP id
 d2e1a72fcca58-8a9c098ab29mr2174559b3a.58.1793368836406; Fri, 30 Oct 2026
 07:00:36 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027144002.10606-1-ansuelsmth@gmail.com>
In-Reply-To: <20261027144002.10606-1-ansuelsmth@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 15:00:21 +0100
X-Gm-Features: AclHuK-MTjfwt2OQzyBtwa_iraZJVoORJ1j_v3oQYZTa5jWvtZ6sOZH5C5h4Bak
Message-ID: <CAPx+jO-TT=UAhH5=5DEPuu1XtVvvE_QA_1V=9qw1moZJoPUU-Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: mmc: mtk-sd: Document support for
 Airoha AN7581 SoC
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Wenbin Mei <wenbin.mei@mediatek.com>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1NCBTYWx0ZWRfX1+Y6WoxzvOoz
 sWQkPD544kgB4yxCA5EcQZe7uBPNe+eUe5u7PN45LEiAzh+O7+H53sj+CuvUDMg0swrR1qB+wjh
 h9u5TFwI9WVrMs0o8trVjO6lZ6OiBNVKmgz5CZNwAlArCjz3GsmAID1Uv+OliQEVwbBqgh8FiPP
 y2b/ZAryaiRfqZjCWy+JdyT1ypaXT9rRuQddHgNxnNOHV8TOyzJkvlaYOzs1CG/7jQRtyQ2+IFe
 PTPxLzz0/kk+w3TM+rltHPvfstQ2/YOmNEYEBng/4SwDvobGUnITsdNRsTLKTzuj24vOyCqk46r
 x04EXUCOx9lDuPl3A9sksED6rzsjeZxeeNsR34SSx9/YQt7Ttcd2DIFJsJAAyweCzHXb/SoXAj+
 5xMiFQsJ/f/cxIOnQroy+3CIMCMWOAqbER4lrMvF+QQw5OJi6jyfcSuzw1j+dcJiAXj5Pdkgerv
 W6idBWfi+Ll18szdJSQ==
X-Proofpoint-ORIG-GUID: oiLpeCxPV8YCN_A4i24mFz1rk15mDGyU
X-Authority-Analysis: v=2.4 cv=IeoSymqa c=1 sm=1 tr=0 ts=6ae4a306 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8 a=5vCY4yJ5Sko5zDJxFQEA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1NCBTYWx0ZWRfX9ApX1YhCVhV1
 RVeLvA/9tLx99sjksTa42CDs+3YupZnKoAmSRI/NpX97XI7jvAAOXezpPo48N1Xx3fH1zqEpxbT
 RSxCBkkUkD8BxMWsH/I59PXDryIfcqU=
X-Proofpoint-GUID: oiLpeCxPV8YCN_A4i24mFz1rk15mDGyU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_070041_589941_14C2C682 
X-CRM114-Status: GOOD (  18.55  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 3:40=E2=80=AFPM Christian Marangi <ansuelsmth@gmail=
.com> wrote:
>
> Add dedicated compatible for Airoha AN7581 SoC integrated MMC controller.
> The MMC controller is based on the MT7988 with the difference that it doe=
s
> have a single clock controlling it.
>
> Add the dedicated compatible to describe the 2 register requirement and
> permit to define only 2 clock (the main one and a fixed clock for HS)
>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
> Changes v2:
> - Also add compatible to restrict clock-names for source and hclk
>  Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Document=
ation/devicetree/bindings/mmc/mtk-sd.yaml
> index a4d032224dce..704d59360bcb 100644
> --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> @@ -14,6 +14,7 @@ properties:
>    compatible:
>      oneOf:
>        - enum:
> +          - airoha,an7581-mmc
>            - mediatek,mt2701-mmc
>            - mediatek,mt2712-mmc
>            - mediatek,mt6779-mmc
> @@ -182,6 +183,7 @@ allOf:
>        properties:
>          compatible:
>            enum:
> +            - airoha,an7581-mmc
>              - mediatek,mt2701-mmc
>              - mediatek,mt6779-mmc
>              - mediatek,mt6795-mmc
> @@ -238,6 +240,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - airoha,an7581-mmc
>                - mediatek,mt7986-mmc
>                - mediatek,mt7988-mmc
>                - mediatek,mt8183-mmc
> --
> 2.55.0
>

