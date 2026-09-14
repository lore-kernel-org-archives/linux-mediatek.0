Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57035C88E72
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2026 15:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wVlvxm/so69i9rBF3Qqf6pqpvc/+LeTsxiPPuQMtYXE=; b=hJELOq74srqZz8U7WmZUHhUT80
	eVXkuZs/amUEz38JF/aZC9/DhV0O/uAU/dOAFGVilaGlPX+wybQ2/cxdOlRgEEhQgNjysYmfDzoU8
	NxU6yOI3K8tuT3wuyCy6cUOII2ldB8lhVsh5ECFm8rQUD1QlgiJzB80lIT6ixG9/y1f3q4ULAF+rp
	GpXDgGbp8S1ptmJcrZXxhdoJ0oYxsmawQaooiyJg3AGXdVttwQXA50tXcAXQePsIjH2PIexhQcESH
	DhJYiMypbz2mTnxtIaaueyMaO6hXRYMKbkkHyKeWjG0ZxqQm0q2leeosHqKtyoIqQx2OHhnNm2HeP
	pSAchsyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x68zF-00000004DwR-41kH;
	Mon, 14 Sep 2026 15:52:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x68zB-00000004Dv3-0LKv
	for linux-mediatek@bombadil.infradead.org;
	Mon, 14 Sep 2026 15:52:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wVlvxm/so69i9rBF3Qqf6pqpvc/+LeTsxiPPuQMtYXE=; b=AakWMGNlN4j8gSP7bnOTXSvWms
	Fa/JAm/du/GhbDAow/Kh8idYohonWQInzif7QqHfmWTJDJwvIJPKPubW4qcTazq9Y/JSFJ4okBWKw
	MZyii7dwTRZiwVqTwfJQJdvItvL3NaCBKSdt9wbD/S+3d2coJO4S0i/XTxw1jDxWPkgwpivdogB8B
	F2BnkRIs6+uSh1IMvETqdJTxQmppdqdJ/Tedden8AzEydsYOqHO4HKr2f4FpX2XGNkS312Wph2Jtb
	qEydgMkOvP7E41Avru0sJUYqomux9vR+9eBRQ6iLYTWc8Y+0Y8sQgxm9Zs90Ayht9YED0U2KG5Fiv
	TGd+s7XQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x68z7-00000005nut-1CMX
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Sep 2026 15:52:47 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0jCr512755
	for <linux-mediatek@lists.infradead.org>; Mon, 14 Sep 2026 15:52:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wVlvxm/so69i9rBF3Qqf6pqpvc/+LeTsxiPPuQMtYXE=; b=JpKZIH2f9DAXQmXH
	2iSP1VdlpJ0jceUw4F13wvvmhwgtDHYwagzFi0IhLy8fWf1EZBTsFWgxC2NtF+td
	1WB37/06bpqcAzlBAvfooguEFqC49IGSvPVLEjjDniBT5Wk0wufQgO3pvEHhA6DR
	vzmq7nW95tq33wdbJ61049JaWHRe3zZQo9rYHgZSTB3t9nBRWzVB7ZtP/fofSiWi
	e7XA9fOcoKAvtOLodW3OMJ5HOzHr8EhHdSiHkovtecswNEkJ/z+6GaUfDWFH6tn1
	lLDJrJtF4D74EaNcKXw610/z4fDiD6TCkV8IMdJyApCyirO2+QUisvflLq/wqhrD
	t9dkSg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpgvtgv3f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Mon, 14 Sep 2026 15:52:42 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-980b637ed69so452262241.1
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Sep 2026 08:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789401162; x=1790005962; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wVlvxm/so69i9rBF3Qqf6pqpvc/+LeTsxiPPuQMtYXE=;
        b=KQbSQS1AH1wq4AE2+ZNmoAAaCeWGjjSUkqkkmg4Mu+7o6r8BghKoDh+r6nCK2s7gkq
         ciE1WhSyp6ZFul9Ugl70uGefVKbelZzRtHgdn6GCsy7qw/FMl507I0x0BmmIHsQPRxqx
         BN2l9e0ZkVkh2gCEJ6nif2uga/owRQVebJOcj9PQjnn5dGDo8eicW7uWh+L8+kBR/bBi
         5x5bPW+XGCln/wNVUTidJAIRJUvlrqzkHC3NIR2ZmnC9ejNhGVi26RhQoJ+6RjY2x12L
         cC0DuA9S9R6t9AzkVycNaIm3JrznNQJ9uHDGyMXYcnhkERYNYdLfia4/NzZBENyFv3Tp
         G6+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789401162; x=1790005962;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wVlvxm/so69i9rBF3Qqf6pqpvc/+LeTsxiPPuQMtYXE=;
        b=IKRTjIUmSRnlXC5uuqJCkYK8IdiA7UMZnFlMJVoLDKdYBgkUnsckHoiEtAZMV1sE6Z
         QWofmmGziZmagEFbKRGykNGUY1TyKnco+Ia6pFOmYqdbd0AnXtyNy5EIykVRbDsLvhRZ
         JZPkfkX7+cE2YJl7UbaTD+6k1ALYg8twYtY5YWI+ySeMdMJITw0AGOEodXAEKBlak1bG
         H3wr6wH17cfU89FGFYKBtc5JKlDvzXksKfLFwbCUGy5r8HFbjSvAB/9y5jjuWKNbH5kn
         j843XJy9o+cyyHT05RbvwftTkRUvpyqT8BdS7z5rfTrzWNXZpa9Aay2ibfm2o80UF2TU
         +OVw==
X-Forwarded-Encrypted: i=1; AKwUvByogigwELD9u2Z4ZaYfZND9yKs+HZik/2+whH2PUf3PkNbr2HXsOcoUwaDBGrTICgkjX5IJY6gWnGOaHH2Pdg==@lists.infradead.org
X-Gm-Message-State: AFuF++lzL5UrtkFt/p/uRn1tsQ04Umk7hDJayTeW7I2Ey5KNj/O8ry9c
	yZSxgPh8BSHHUO2JFGsbfrq0IzdRCwRNIhR6RgUFIc778tButJLQDpZDYLW3DydwQYyzt3m5XOB
	SqV/3oDIj6RwAXqL7lMbDK/8rAX4FubwUJgNA11ttf7aBnVlSuN3U2q7kAcJri7biJ5FyGoXxxO
	8=
X-Gm-Gg: AYBFou3CBUrwQemqeYMyVgFYTwjJrT0UOhrs7z5/lwkIXbwg44DxXHkaA+1iXi3ohAz
	UHmJwLLB8qEOhpIF0bl5YSA6lkidfwNzadeaCRSMWkwzdQWwVznAbRI6fCWM05KNhYIFI0qH9jz
	CDUU7zOI67aSaeq163rA5xjaovkLfAW9IGg4BsSng0ITVONK6a6B6OIXWqrFx45QTxNVzWeCFdS
	NglQRJJ6ggPsYpoh8yekZM3AxgyOmgyjfm0Zxj7BLiCnLmoyOcNnKt+yIeT/17lVyfG0FbHYs4m
	tbjuzNXxTRU7RqgtKX0j5FZdwhE/irkZ7i6Gvw4ReaZm4DiGiDAuZu2Yx7e+1bW65l1WdDtoFyw
	/oFl/pRRRTza2XtUnSOPoAF29CyCy
X-Received: by 2002:a05:6122:32d0:b0:5c9:72ea:141b with SMTP id 71dfb90a1353d-5c981d701dbmr3781386e0c.6.1789401157366;
        Mon, 14 Sep 2026 08:52:37 -0700 (PDT)
X-Received: by 2002:a05:6122:32d0:b0:5c9:72ea:141b with SMTP id 71dfb90a1353d-5c981d701dbmr3780433e0c.6.1789401153186;
        Mon, 14 Sep 2026 08:52:33 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486f301121asm22926613f8f.0.2026.09.14.08.52.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 08:52:31 -0700 (PDT)
Message-ID: <3bda35ea-1f45-4cc1-af1e-7f1513651b60@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 17:52:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] dt-bindings: net: Use consistent indentation in
 the example
To: netdev-bot+sashiko@kernel.org
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, justin.chen@broadcom.com,
        florian.fainelli@broadcom.com, andrew+netdev@lunn.ch,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, ulli.kroll@googlemail.com, linusw@kernel.org,
        clement.leger@bootlin.com, olteanv@gmail.com, hkallweit1@gmail.com,
        linux@armlinux.org.uk, hayashi.kunihiko@socionext.com,
        mhiramat@kernel.org, nbd@nbd.name, lorenzo@kernel.org,
        ryder.lee@mediatek.com, shayne.chen@mediatek.com,
        sean.wang@mediatek.com, johannes@sipsolutions.net,
        matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
        jjohnson@kernel.org, richardcochran@gmail.com, geert+renesas@glider.be,
        magnus.damm@gmail.com, yongxing.mou@oss.qualcomm.com, rfoss@kernel.org,
        abelvesa@kernel.org, vineetha.g.jaya.kumaran@intel.com,
        claudiu.manoil@nxp.com, alexandre.belloni@bootlin.com,
        elder@kernel.org, s-vadapalli@ti.com, rogerq@kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-wireless@vger.kernel.org,
        linux-mediatek@lists.infradead.org, ath10k@lists.infradead.org
References: <20260913122910.99457-3-krzysztof.kozlowski@oss.qualcomm.com>
 <178939022208.22033.14553895731937911806@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <178939022208.22033.14553895731937911806@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=c/0+0h9l c=1 sm=1 tr=0 ts=6aa8184a cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=JYzT5DUXXbXYkYiThRIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIyNiBTYWx0ZWRfXxu5+PB4Hg/uI
 2WZswRKWLbCpkjhDPIcvnbRCvC3/EJtsySsHgaOIaBUv/ogPTq/CTrvcuWaKVL5YhHuL5ippoev
 EnM1E1Z6tQr9DOuK7ceatXLYTdJ/f5uJo4m8TIkiEvzo7uOrmNsxvt5wU95X1b2I7TOneMLmOgg
 NWnXexpRF+uzSkQTofbsiZEduBzIK2e0Avr9nGjF+xsIyG+2opaDb/7LIgo5KtqMnI+Mj4shAAo
 08016EdUNWjF2o1w3xuPdfC/Sgr4VnaZ91Bcdn8qWmGIcLkVgX8ekGewEn0lkvM6QhD+/RFGflh
 Szu3Y2owTHYTgeOoMCabV8Oonp7iK7vb9tsuH5G06gLU9pDqKV9BiilIOhsO+N0Q/+w/rHn3cXs
 piAtWreZRBBMxXUxxQC3yreUHgRSL4BDhjtwVU0eSdA8SCE44Z7cxcPikuybKpbLQcAV9LvbR5I
 3EK/oY2lVZXGi1FJNBg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIyNiBTYWx0ZWRfX7lGmgjAkfZg4
 Dyr6Ej91NyA1WbgMNF2T79qARGs9uxkAOZJJFn8zZxyoiqKY3qwlpR8bKg3ULGGHLfObq5nv8/O
 WFPOSdiYLbiju+nWQ22PSZUQ5JXiNkA=
X-Proofpoint-ORIG-GUID: z6K20RSJR_4NqMootTd1t7X9Yk2fsqTG
X-Proofpoint-GUID: z6K20RSJR_4NqMootTd1t7X9Yk2fsqTG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140226
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_165245_588786_164C4A57 
X-CRM114-Status: UNSURE (   9.19  )
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

On 14/09/2026 14:50, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 0
> 
> - [Medium] In Documentation/devicetree/bindings/net/cortina,gemini-
>   ethernet.yaml the patch does more than re-indent: it deletes the whole…

Overly long, it's like use the most words to explain something to waste
other people time... I really dislike this approach but did complain and
people disagreed.

Best regards,
Krzysztof

