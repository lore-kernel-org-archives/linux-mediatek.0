Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD22DC43458
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jul 2026 15:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HUxYdITeq/FY+FFUjMdRTMxDfy5p0X/5gpQ0/qb6sDI=; b=fEMDezGCahbpJxvJkpaN6hZoKs
	PGWfq8lYnssXlpBxszwfO+u5vZ13FMVtEIMKl7Ihe3ocYAGVvXnqGltzn86BaCSkiQpNCTMgEeVlR
	1GIBx1XKC5K3tHdDxGxIpSElxNnzMqNcC7htafm1J6Cd5/LlyWB5ySBPuFI8cVpO6eGGDX8gNxcPY
	MZ/WlmPhBVAo4HQui/mPm6ez6lGyNiFpcGPCqTWYQ5Tzdo0GakjC6RlhsLUHlAkT15mq5NxbH9gdo
	btJydV8+FOCccI0pmwE8SdA7z2C2b9coIsg1jyD6TsU/LnT/zb/jXvkc/7GRyejINmDe53tE3yKG0
	jy7CEhEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wglXn-0000000CwX3-3jXn;
	Mon, 06 Jul 2026 15:47:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wglXl-0000000CwVf-2wZe
	for linux-mediatek@lists.infradead.org;
	Mon, 06 Jul 2026 15:47:38 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF3nS981419
	for <linux-mediatek@lists.infradead.org>; Mon, 6 Jul 2026 15:47:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HUxYdITeq/FY+FFUjMdRTMxDfy5p0X/5gpQ0/qb6sDI=; b=fb7UTHsy2qV3f//A
	xMmgKNW5GqGvhgOJ1plc98d4btdiVlUep3RLCEgrqpyl8HDfraQ7zeQEvQFQCZwd
	3iGaAqVGF5tlBr2MDqJtoXi0YpHS6wZQ0IRnJUspHODAIOQVAhhluSK9OKCgVt+l
	qhNc1+6x/qjiH6O999ghpvRwUAzqHoXEj3LTZI/sTwa9flZNqalMGpywJIZ6JbnY
	wo/ee2r0fbuEtPXzn7QdwgXRffN1SWuhwC9wDLlUUrNu7YmGfikWUL7ruFGV4gn4
	2vysvBx/px7SlWDIHDSjUSpbJq6QCgUjXm1iMMxdChlWYu+jAUelbO5raXUkRkca
	7n4+Mg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89kgsr57-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Mon, 06 Jul 2026 15:47:37 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ec235c7c66so41840216d6.0
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Jul 2026 08:47:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783352856; cv=none;
        d=google.com; s=arc-20260327;
        b=kXcZoYmRhR5+xspDOGgJi/iu2PgvecF/2SwxrS2SRjWzo+ocWpYloVZY2T/E+Udjkp
         53rRMmx38sv08EHp05q/2jPPSV+QDVJJr8QGgkAUw0VR+ZDJCzODEUNC4RjAw099u3CL
         ssWnXRQroNmGQvHRgyZcC9ddPe+3ONRKbHrLHsWsmBzyaBRKKsxBxX3g1qhRKd0fQB8a
         Q3+9QIZExqUKQnnwQuF1pjVlcTTufg5+3IeLXNSH7OsYV5EbBMFDRPN2qEN8d61XSYUs
         ynwecf5ZrCVzLFQF35lvVj8BPnau7EoiGsj4JmaN1FS3gXT+TG6vt50EjGFrUjUVBTdt
         nP8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HUxYdITeq/FY+FFUjMdRTMxDfy5p0X/5gpQ0/qb6sDI=;
        fh=Hs3mloD6EtuH9EFXzy2p0XLsMUAqj8jYhwIOhuHdc6o=;
        b=I7P4hzXTJsKwAe5JepT0W0N3SMCPA2cGngLvjEE2E3H6cZ6cmtcX4FTHnhaNw8/hGg
         1EUYjhJ0Nmw0lBtbJh0Vjo7E8esbZHRHIOj5CtNkNM0NNQSRfu3wbhu5VGRvrCcY6lwa
         LdL41apEZir+ny0pemtwes98chzh9jDZWGVgC7li8qJ+kfFLbvcG9U1Z7/IR4ZfS64EM
         nKwHhLMV6rVtUEj2i3eXDrWXKTBpXDSRoLZLjBFN29XEj1jV00za4Cr1xDkTCMnQWc39
         +SVATtsN6Oi5StlpBLd7C5VA39XE/rbKP/pNUVhU0ksvKheSlMh5QXbJV1/nXLGU23cN
         5LkA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783352856; x=1783957656; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HUxYdITeq/FY+FFUjMdRTMxDfy5p0X/5gpQ0/qb6sDI=;
        b=PooumEfmhr8cfI+4iC38cRHf3SEDM3TenlJRz9Zj/4d72oMuJtkisuKPv+Kk5HFYFv
         SoD0QYEkCb4vDQZbylJlPyMrUGmiG9zoRxLb051AdO5AjWti/ekJjSmftar87X1iVbkz
         pC7ewSGHHBeWdF1tlyvAorEptnpMBP7v5ZIviI3opida2RyBf75uKlo2NsNFoql9+YTv
         +B+yuV3Nk9dBqSlk0wSXxi9mtrYnI9VP4qVmjha+N2nmSls1FqdRFDWClrWyo+1hq7dx
         FYVKqbUAH3NXAtlvsDK5m6Ny3D/MB7eByq2yw9BGzUORWRwXNoXG0c7LRUSP5oq1Gt0b
         IAFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783352856; x=1783957656;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HUxYdITeq/FY+FFUjMdRTMxDfy5p0X/5gpQ0/qb6sDI=;
        b=Abt0GTurcuuSrauOcyeFCIp6VWngVnwSsuPUBMyOglZ1NdU0fO+ZSqFBX/H1h2U8Uj
         fnJ3okTthuTXABC34A6psrHZSETTr4SdX6yz56XoUwwrJKVv8K/KDNLHWjav3+wo93tI
         flyXmmnJ1szFTt9TS+VaCfUBYF1QK5fWUeE9u5w7MC/54qoUcNgk5cYNvglf3uV5hRLC
         9lYt5YhkYcqedDCwy+CSloZiqvTDiLTMM+LVimUHg3UeZunVhEXjFtBj0SCkWh2gfaIC
         WUjdXby14JdxES7RKtfLbOMNUjZ09zhlKhOeY6rJA6aza1eqiTq4yUgGrbci+wXb/7r+
         4TIA==
X-Forwarded-Encrypted: i=1; AHgh+RreZLzQwLwbcF3+EWUuu8i8mObHlGC9YoAXZWnVXrbE99tSJJocn89zpm8Dt07ddRXCrmUGV8Ks2uf2IcQhAQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyNWUl5xjmg1jzwWukcSKi/Lr2SF/xRXXolJ5y7FUAcAk98Pd60
	P2RFWdtiHUmbeW0AOXdN3Q1MK/qbNKJ9NY4KiAgRqRBygWMgZ6UfJ/yrtBNf2RoYmyDadeKfMEc
	ivo6zcyNb4emndvXK/kNPB8evaxBP5WT4y/4aePU9B+WZzdE3B68EAqp4g/QdyoWgvTxwUfFows
	5bJeoKqWWIlBaGzun+iKGc3Po5HLfdRi6ZEBk/R65ewl4bdI12lg==
X-Gm-Gg: AfdE7cmPAGWqvOC+x3VitQZzm8mwI9bM8KjxqNK3bbTN4r81ejtaNWygd6grGiVLY/Z
	wM97tks2qLvlyFD9StTeq/74IQK3btSUR4/1GFoNkykPlxcxY/KjTDMk/7DHfoK2hiRL90ZiKXR
	afH6AfR/2paeUyo+B2YB/bWxkxrrpULIUlYlb0A5ZONh+YA2CF6mhWd8ddd6mBx/Q2eVVz
X-Received: by 2002:a05:6214:3bc7:b0:8e9:f62b:8f9c with SMTP id 6a1803df08f44-8fcb59c6085mr13169516d6.49.1783352856092;
        Mon, 06 Jul 2026 08:47:36 -0700 (PDT)
X-Received: by 2002:a05:6214:3bc7:b0:8e9:f62b:8f9c with SMTP id
 6a1803df08f44-8fcb59c6085mr13168716d6.49.1783352855484; Mon, 06 Jul 2026
 08:47:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260701-mt8189-mmc-dt-bindings-fix-v1-1-e75f241a275b@collabora.com>
In-Reply-To: <20260701-mt8189-mmc-dt-bindings-fix-v1-1-e75f241a275b@collabora.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 17:47:24 +0200
X-Gm-Features: AVVi8CfPNJrEYS0E8R69POW_oPeNyXt4oUaNnxJ3KUF6es4aIXlmymOTBoUEd9A
Message-ID: <CAPx+jO-vFS+p7K9unKDtPGHMNNdS0Z6YwsgtE1cv01TxFmpNmg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mmc: mtk-sd: Document extra clocks for MT8189
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Wenbin Mei <wenbin.mei@mediatek.com>, kernel@collabora.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 2YAASfUg2DrsDkBMYAzql4iMHEqK4lHV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE2MSBTYWx0ZWRfXwdvcNc/qPi0y
 TwVMFpakFSAxCScDOPPFGNmiCfXjFh8QMSqDbM5x0Y7keBnQdgzFXGbGKtOn95+OWg7Rqzn7AJI
 KjpE0zf040v+MICha/qCJDBaYLiRKcynEJSnTARM0GZgAxU8JiHdLv6qL4B3psUarZrawz6LjFT
 MSwVmPTRrnKMATqwsqNIJqJV8DbWyyKN+m9N9dYpu0y1/7+8vnaUO9yxKC6eQqhNsY38Qk4zcCk
 07AUftRpjfsVOg9+EUsp1zrG1a0BfY8PktViPI9FDMV1BeHK4vL39SvRLkMGNJWD7HiJk0k07XR
 S3J6HFI5laZTbF027Ttn5pO/z0iNvGIvQGi9mHamxNUIbnfxpz40pGNGSBND2RjQgg/9zbpT/cA
 5BMfdxM5Td8+H0stplYrno/hKv4bo7/Bqz7EcptywD8/npC7Wekzoq+U3OJc5krV69yDe3xCfGw
 sRg6blS6wzMVkNbLlzA==
X-Proofpoint-ORIG-GUID: 2YAASfUg2DrsDkBMYAzql4iMHEqK4lHV
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE2MSBTYWx0ZWRfX97PpWtOICIsP
 JxdAUvGjUUhyO7h3h9GRgBWPKo8y14o2KRAZZ2X4p0R+CezxbKR9VW/Td+kF2UskTmPinBDF34B
 3D1W3FnYUUfaLk6MQDB/CgJKinP0PD8=
X-Authority-Analysis: v=2.4 cv=c6Sbhx9l c=1 sm=1 tr=0 ts=6a4bce19 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=QX4gbG5DAAAA:8 a=6cAowrh06DlNpcgoBcwA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060161
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_084737_743108_65B4ECF3 
X-CRM114-Status: GOOD (  20.42  )
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

On Wed, Jul 1, 2026 at 4:44=E2=80=AFPM Louis-Alexis Eyraud
<louisalexis.eyraud@collabora.com> wrote:
>
> MT8189 SoC MMC Controller IP has 4 additional clocks.
> Describe them in the dt-bindings for this SoC.
>
> Fixes: 7514f64780a4 ("dt-bindings: mmc: mtk-sd: Add support for MT8189 So=
C")
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
> The patch is based on linux-next tree (tag: next-20260630) and has
> been tested on Mediatek Genio 520-EVK (MT8371) and 720-EVK (MT8391)
> boards with board hardware enablement patch series.
>
> Additional note:
> There is currently no use of "mediatek,mt8189-mmc" compatible in
> Mediatek board devicetrees.
> ---
>  Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 29 +++++++++++++++++=
+++++-
>  1 file changed, 28 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Document=
ation/devicetree/bindings/mmc/mtk-sd.yaml
> index eb3755bdfdf7..a4d032224dce 100644
> --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> @@ -193,7 +193,6 @@ allOf:
>              - mediatek,mt8183-mmc
>              - mediatek,mt8186-mmc
>              - mediatek,mt8188-mmc
> -            - mediatek,mt8189-mmc
>              - mediatek,mt8195-mmc
>              - mediatek,mt8196-mmc
>              - mediatek,mt8516-mmc
> @@ -348,6 +347,34 @@ allOf:
>              - const: axi_cg
>              - const: ahb_cg
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt8189-mmc
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 6
> +          items:
> +            - description: source clock
> +            - description: HCLK which used for host
> +            - description: independent source clock gate
> +            - description: bus clock used for internal register access
> +            - description: peripheral bus clock gate
> +            - description: AXI bus clock gate
> +            - description: crypto clock used for data encrypt/decrypt (o=
ptional)
> +        clock-names:
> +          minItems: 6
> +          items:
> +            - const: source
> +            - const: hclk
> +            - const: source_cg
> +            - const: bus_clk
> +            - const: pclk_cg
> +            - const: axi_cg
> +            - const: crypto
> +
>  unevaluatedProperties: false
>
>  examples:
>
> ---
> base-commit: ba7c57499e5999aeae8dd4f954eb2600589d80aa
> change-id: 20260701-mt8189-mmc-dt-bindings-fix-18959c85d5b6
>
> Best regards,
> --
> Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
>

