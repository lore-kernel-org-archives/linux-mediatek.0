Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A67A60A2603
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2026 12:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=w0DwJgzq;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PXWe90Yh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TdhNgOMY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fL4ijXnPOipnQQlloELZhTJsYgcVrNR+TVVQ5/sunBk=; b=w0DwJgzqFxMlx3
	/9BmOgIBoGjfX4cKbdEcBcZRKmQbkiv7vuGIq2jDWScK8tMs1plsChQA6eNHpL9/Z0IEZgP7kdGUH
	3aQk48+E/TZp3qmnIvJVmOGX5r3aB6ZgTrsn+zWyiIInzXgskHpRRiZuqsEXkm1IKXjtIHuuV7E1G
	ihyXacihnuPfA8vN53QPWLl5xTT57fluTMY32+jmYfNpa3dZQfutmn2TtRYdl8mhA8aOUVJJbkDWb
	nOPyyfPNrU9RoChRLqiT/miqpkPmAcmRnY2R6LHejHwgqfiSaq5l8YS/ZCI7FDKlnkmpCiBYLsUWY
	RrrxFg0NRQrOVsxJDk2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTeTe-00000008o9Q-3AmO;
	Wed, 18 Nov 2026 12:09:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTeTb-00000008o8W-0uoA
	for linux-mediatek@lists.infradead.org;
	Wed, 18 Nov 2026 12:09:25 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIBkdqW3848268
	for <linux-mediatek@lists.infradead.org>; Wed, 18 Nov 2026 12:09:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fL4ijXnPOipnQQlloELZhTJsYgcVrNR+TVVQ5/sunBk=; b=PXWe90YhBRCaXDkh
	T269VXdOqRgbO9IpXhunYqlQ8H9+L5nWJr3u3nG0ftsbFJl2HCj5hQhslXSgLF1y
	IeHpp1ZemyItj6c60oPEm4sC6dgb3aMpMn6bZiBYNA5XYqVoO97qQWSHszVpyRrB
	9KHpCD4S9y2C6pstw0vYEf2jtBlTK5tF4YJhgXG5zXCc5daf3ZSvEOuD/AbD+WoY
	biCXG5q7zDmDmSWoYmCZQDxmf3tl881/GqUmEHj8uN08wxX0f+90ARBN5yC0/Xsn
	BsLt51qqDAJt343zELgFcTrmopyB7FhH2kweYJUtMtGzNGQQO92EUdiexldTodq6
	KZhXQA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv73026-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 18 Nov 2026 12:09:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9495dd0f07eso194659385a.0
        for <linux-mediatek@lists.infradead.org>; Wed, 18 Nov 2026 04:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795003762; x=1795608562; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fL4ijXnPOipnQQlloELZhTJsYgcVrNR+TVVQ5/sunBk=;
        b=TdhNgOMYXpdbFGA8Yz/bpXdZRYv2xRK9k8Sm2bBSr9AtuqdH5r94vh9FRNH+oGWcKq
         U58ac3w5R/Ttlem4v/0ncZpgUm+707/rBuceuIhTSyxQ3J0MK9+YNfTRy8MEOpp2Q2B5
         kJYxNZpJz2DREhRl4SoWP5myppygJbjFajFaFCFD7ivRxM1xwcM5eSGNbJRo7wQxAUYm
         xMmM6Aa/L76W+FbURG0IFe9sGAQoABIVwTWBKS56cUCMmGHakY15xm5IIMbnQhxUp7+O
         0a3ClmKv7QYGSAyM1dzxA8UglGPrmePyQGRqONfkLdDndQmbGhZR35/lhJZP7HB387lP
         bvHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795003762; x=1795608562;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fL4ijXnPOipnQQlloELZhTJsYgcVrNR+TVVQ5/sunBk=;
        b=0Ht3vZn+SlgwZRTwK1z/1Qis0+s//PRXSQCdjF7c0/5uXl0gfcJI6V6R/fXOkr9OWy
         2Q/r4wAyoguAAedk9BHi4l/8zpgosUAsZ66WIs5pLW8rajRrME7SDnZCSeQviGPHNnx7
         W/ETg4PF/uSoROxq6Y8Dygt1eWNGCRHV3jnR3ASZM1THLil2ydfB5xG76GIwc3oxgk1I
         /ZSCL0TnqC90t7lcs9BWHYYoV1ALWfwUjboZQcI5OWVp/UuAe+C6WRxjprpZNJ56p3lf
         juWKAR7PQJW50QHkhSGEC70/MztX0myQkMXqOkrsMt7ILdAiyDrP+NZTNRiCQECaKvJF
         dOhQ==
X-Forwarded-Encrypted: i=1; AL+hErFqkIYmi6JGabUQerClFm1ICyEZKqyXju9bcZshYWrukNFNyi0nqRO8RdBwSqMMNcfScXhb0+JUWd48fbmtBQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z9EdlSAIq51H3V95ossnbiTsuXXBTVbabnxhZdpwCCqIVefD4n9
	1S6nN39xrSW9O5a0jAUpM5exqu8w3eurzPFz8pq7ITfcuPFIKNhA649wznzJnCEAFqZaiEygNSZ
	Z0Rgf0rYPD6cH6Z6uxVA3JXpUebaukBxJJJpzW0/ZWjdEO81S0HkhMl1es8pPkVF4VNtCYrpFv+
	0=
X-Gm-Gg: AYBFou2hZUYjNh8WeCea0PRXarmUzrNTH1vFto34shrOREMi78QyjuE2NjSHG82Ho37
	9wAxm+EHUuGsoIY6DhiRqNcShITdzHZD/DAdcmg9Vuan1ky2rgsPNj9IcPb2Yph5vRuz4yWX+BY
	cNc/MyGDXjtzBgdC+wnzqaek4Hcd5sWBaciueGAWrF0ZpcBOjqtVtES0Au61ec9+JXHCcvatwnY
	4B8ZzBZlaVEfXgDNuESjer5nrWscfyU20g9RDRuOjnlPV2Lct5Stm815h+o8u6BPqXlVi7RblQL
	j/ftJovH36evd+nqtfp4+0U0xJjyD7JWHY0V4AdEmklQY/fMOqgKv3vtyUgsRN9gK2FpsvIUS+S
	2yVd0ut3EzbX19hyW1XlMUbZygcSHr0oxzh5YO3oZ2llbv89Q3CVQDKlf7ezYY+1UXyyLNVRbU4
	k=
X-Received: by 2002:a05:620a:4381:b0:949:7b2c:671f with SMTP id af79cd13be357-94999658ae7mr397171685a.82.1795003761619;
        Wed, 18 Nov 2026 04:09:21 -0800 (PST)
X-Received: by 2002:a05:620a:4381:b0:949:7b2c:671f with SMTP id af79cd13be357-94999658ae7mr397166285a.82.1795003761030;
        Wed, 18 Nov 2026 04:09:21 -0800 (PST)
Received: from [172.20.97.102] ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d001a64sm63760025e9.0.2026.11.18.04.09.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 04:09:20 -0800 (PST)
Message-ID: <96e3cc39-d10b-4743-bd9a-d683a91fdf34@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 13:09:16 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: Remove undocumented, unapproved
 aliases
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger
 <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20261117130556.234785-2-krzysztof.kozlowski@oss.qualcomm.com>
 <3882ec4d-9f99-4419-8914-19c3a2a3cc46@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <3882ec4d-9f99-4419-8914-19c3a2a3cc46@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JkWfRyPasmyQ7bkj-IPqeOhvEpU90GW2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA0OCBTYWx0ZWRfX1fptXKEUvqRm
 7zalNka1FysStaRUJLBRFU8VGCLANnw1blNh1KgOssEKuXSB/B9+itmkPk6Nd7kB3lcbQBx/BO0
 0uqRUrAKmE7ywL6wzQo8o/ec8OE+BGSx9/HHpujq7nmGI1igk5SADiGgjwrnKPQUKAZgpyN1dGx
 z6LNcNbiBFvj/6f52Bhx3hRRGyyKZ6EYyGknkctQDtLXMxMIcaWOfdwjCNVQPQjmA93HfXQwJaO
 4KQubSrAd3ZcDpAGFVDIXy7b751AuQPEYBY8VShfOM4hBCv99aIQLMp8o0lFgjuHw+qWWFFJVgX
 Kalov+K6j1DUn+/texm6NleDLF4vN/bV1FNiY5/CJzyjAsnbGgxseyq6lqlNteDCzVI9QVf6woz
 ljGWuto6IYgKpf4ggbPGrzi3PQwESEtPyCviybT/sxIVDohCPL4Ru7lfIU6CA+MyPFKmWwzc7yp
 syRXDPDnZeHonU/cfmw==
X-Proofpoint-ORIG-GUID: JkWfRyPasmyQ7bkj-IPqeOhvEpU90GW2
X-Authority-Analysis: v=2.4 cv=H8xOUOYi c=1 sm=1 tr=0 ts=6afd9572 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=QXGhswp5__15x8Fhz6wA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA0OCBTYWx0ZWRfX6IhFj9iszMXD
 e7b6brNq/jYCjefsrBB5wn/BqK+XFI+Dc0Jy1F3S46kEy72ZElB5j30o4t9zTqo8g2KKW+V9xbK
 yfrB4bBPEDc4++Tj1CSTujms6OCys/E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_040923_280296_720D946C 
X-CRM114-Status: GOOD (  22.71  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 17/11/2026 15:06, AngeloGioacchino Del Regno wrote:
> On 11/17/26 14:05, Krzysztof Kozlowski wrote:
>> The ovl, aal, color, dsi, gce, rdma, split and other aliases were never
>> approved by Devicetree maintainers, because they were never documented
>> as actual ABI.  Drop them, because no new custom aliases are allowed for
>> years now.
>>
>> This might break users of this undocumented ABI, so these should be
>> updated to use only documented and approved ABI.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> That'll just break everything.

True, almost everything. I suppose few aliases are not used, but rest are.

Well, it's a start of a discussion. :)

> 
> I do have a mediatek-drm restructuring series that is partially resolving this
> situation, at least for some SoCs it's getting 0 and 1 hw instance id dynamically
> recognized, but with some caveats that could be unacceptable (as in, if 0 is
> disabled and 1 is enabled, 1 becomes 0, so it's not actually resolving anything
> for real, it's just making it tick right when stars in the sky align in the
> right way, which for some SoCs is reliably possible without side effects).
> 
> In any case, all of the ones that have only instance 0 (and all of the instance
> 0s) can be removed even right now already (still needs some testing to make sure
> that there's no regression), but everything else can't, at least not until the
> whole restructuring thing is merged as that'd break things.
> 
> Worst part is we have two new SoCs (MT8196, MT8189) ready to be upstreamed here,
> which took almost a year of development... and it also does rely on the aliases.
> I was in the process of slowly cleaning up those (as I said, there's already a
> restructuring that makes things a little better in this regard), but at this point
> that'll need to be done with the highest possible priority.

That's unfortunate and still new DTS/DTSI should not come with these
aliases.

Best regards,
Krzysztof

