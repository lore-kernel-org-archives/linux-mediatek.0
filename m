Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661EC606A326
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Oct 2026 15:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=stgzDhlY;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OgvPAAv2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C8el8aPf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xAGpz9TD6oCxgoJfz5D+tXdaBBTRPGgALN6kzjVk6w0=; b=stgzDhlYhEzehkULrsPqRgLBTi
	2CvP4bjS/AKOZBi7fnzxOtazqp8u5CLALjaD/Q00lEtxxbwymIfP16bLna/242hTg4xJMaBHolZ6W
	tI0sNVuhQOKz5ULfhCeSjC51PdeDUXu+k9tUkcYrd7ui/+b1d18V5Dj9E/VVgpRuYlDh97lolPxdz
	zs36AuQaoBwfCbBoHU9Xg45SB51bGvngsqM0sTJ9rnjVOO6iEnreYQOizbLrskWgF0zQnTfqI/7hl
	0FPst5tsGZN8B0C9UkdYSc8oveOQ2Msfw8Hdz99f+G1Wa3jEbLbBOQ59CWW+ePEHo51tPg+0Nhm4R
	VIy/Z1vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM5mZ-00000007Qd8-3YhG;
	Wed, 28 Oct 2026 15:41:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM5mW-00000007QcG-1StF
	for linux-mediatek@lists.infradead.org;
	Wed, 28 Oct 2026 15:41:41 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFAbsY423467
	for <linux-mediatek@lists.infradead.org>; Wed, 28 Oct 2026 15:41:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xAGpz9TD6oCxgoJfz5D+tXda
	BBTRPGgALN6kzjVk6w0=; b=OgvPAAv26Z+jY/F3lMnjG4J8bK2QeZ+lW6MBAcFa
	9ldLQr72iZ3IOG8JMXXK68mRP8AW3N2Ndvco1y8nUQeHp0Euxm9Buo5Qa6YXkUS9
	2Eu/O85eHzBqAzgzFL/na3MgIz2nFnim45LBQRvbu5Nvd2s6hN3O8YMsf9EftPke
	9AkgK9OwzOnzJX+qCuvxGgvRD5GvSCSWD4TqEx5nV/JZiKYrW8KBBTVUimZOljsg
	GVdeOAT6CchVYA2Uq7HtfUnhRgFmNdmZMoyodDJ8ji09AcISYE//UdD54a5Fqf1X
	DeFeURvl86BxECwPBb5mfs0bfHMSycRCYZuXDCbmPyZQ/g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdsp1mxd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 28 Oct 2026 15:41:38 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91b92acedd9so903506d6.2
        for <linux-mediatek@lists.infradead.org>; Wed, 28 Oct 2026 08:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793202098; x=1793806898; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xAGpz9TD6oCxgoJfz5D+tXdaBBTRPGgALN6kzjVk6w0=;
        b=C8el8aPfJ1ZRxDIpgaNn/3fkRZ0to1WUih0/sJ4KVdzX9R5EAaWaMVJzXvA7QT8cxM
         V12tt/QvasQuPfHtQBEYo7Y2tHNVAJiUBRyglJoBcGgNm1wRGq9XQDwsY3gyYQotnvX2
         orA7u5KhP77KB5CS5NWowh1u6BtpF7Iid0CJHoSLdK/2xQv49rbEMcjeTBDAGS+/hWbu
         wCJvCUzh6I4Sy+kasGnpNcrFzFblr4eLWgYMYT1bLTCBMgSbUkbHtMVptgo3W1Kb1sFj
         5EwA2suSO7Pq2XBxJ7gk7q8cLqAbQQAnQlbfmMejRUUw2m3e6aY/2paqbxpZoDgTz4Zh
         DjPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793202098; x=1793806898;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xAGpz9TD6oCxgoJfz5D+tXdaBBTRPGgALN6kzjVk6w0=;
        b=HV1lSJ3L/q7pDLKOAFAvRuBzD1DXYT/HfO0Xi90GZ1/gdquNtab/iiXfGCbUsn7qKi
         xhbobo3kW0ESKfN+wF7xI48QRIWVtPX8ecCsXsGOkG+F4rWJWXM/TUF+0y9Xk7yn4tyd
         UU3gvX9e8ufrY8a+AEZRcfon1KCCmw2iCRD3CbVyrF+pT5p0XtmaxnF2WecCGQ6SPmFo
         C1O05BC8hUbSkzugna8T+K7En84h7ePA4KKWGaht+YGnvX7Dt2s5Zs+mglpoM56kJdpi
         zzOIqUT1UgGu67Y6pPAIICOvTC0gVxWhGRK2xWI4rxL3KiwCYHiOEvjJoob+oEwQj7by
         dd2w==
X-Forwarded-Encrypted: i=1; AKwUvByk679BKMFul0ctPcginD4jRqlSjNz5o3IyuEGbzbJ3luXRVBTIT2hphFS+UMw4isWPRuivXacYjN6TmcnmHg==@lists.infradead.org
X-Gm-Message-State: AFq9FYIc2sQoZGF746I0xS3uXnipph649T2Knbn7Xlu4K5ELEMdscDZb
	qeFu6lphgY+Np5iwrwDr3S5ZwuOfcHP2Tnu/Wv5BZceqHDtRP28fHAEkuvzM9XjzUejDBW6fY9P
	vcFw11Oby/PPORS8aJzACnQygaf24uRDyWetZ0YiDyu1cAfU9SQydC3m6LSDMmpTVIHO9C3PePN
	s=
X-Gm-Gg: AYBFou1yagDD7vBvzsDjQ6RD+lkvmh5NvzNLZR0jTMd43LBb97fIwgruoNUYAz/YGbE
	f3tpK9UQjJfY2DB3BGhsEk3nRDY/hDfHFOpRJescWTCYOL0OcNHyGJPibnjmbbcVtGdc950aU2A
	4jqY6XxPEALTiDlkFlEdWHEXXJQLND1ZEiwPJX9ekuccZyeSou+tD8vqUa68EjlmwVIbW3q/fvy
	uB9gaB3wdkdJ3auNDW8KdhMExu0oijOXTkC5hua1odgVwXzLVNC7rxE4pLZwXzqa6kwVl0YLPlI
	/Ae8Qk38e/wYoTFpSS73W9jD7VcDHtZBCv+SUgErdEiUwCYuzRJGE4ocqmta/J4aYFTI/7KzARd
	bs5Wx4L49ONUMJKKQNNY8i5Of3kAzf+4kxalQYUO+lcs70GhUh99eP3yG1Q4YpqK+ow==
X-Received: by 2002:a05:620a:2b4e:b0:93e:53fd:413b with SMTP id af79cd13be357-94408dc203emr391843085a.59.1793202097814;
        Wed, 28 Oct 2026 08:41:37 -0700 (PDT)
X-Received: by 2002:a05:620a:2b4e:b0:93e:53fd:413b with SMTP id af79cd13be357-94408dc203emr391838285a.59.1793202097156;
        Wed, 28 Oct 2026 08:41:37 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd37f4sm34722381f8f.44.2026.10.28.08.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:41:36 -0700 (PDT)
Date: Wed, 28 Oct 2026 17:41:35 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Avi Weiss <thnkslprpt@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] spmi: mtk-pmif: retain controllers for removal
Message-ID: <e433xawx2fa3x33rslqiijtbk4vf4ius4h4w3k6jgrwhsqtpww@zyyd6mxxvvni>
References: <20261028094847.764747-2-thnkslprpt@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028094847.764747-2-thnkslprpt@gmail.com>
X-Proofpoint-GUID: feccfjoja__b5RysGfBhrfRvgAVFtt3X
X-Proofpoint-ORIG-GUID: feccfjoja__b5RysGfBhrfRvgAVFtt3X
X-Authority-Analysis: v=2.4 cv=Cssq4X4D c=1 sm=1 tr=0 ts=6ae217b2 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=vSNd-Fa7lg0QEwYS95cA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MiBTYWx0ZWRfX6OWxkkMQzCT3
 VG1L7G7eSVKucm+b59mZwFYFxamzqnweEl+AN3TsRCizfq/R/YWlP4Psw7asnuerJc8W6Mdjlzx
 HhnPOL6sZRuzyfLAS2VT6JwopW+yo/U+fBvIiOOludfxOfBWgo47ggQJKNvCglg9y5cBOqnupId
 XqIlQH1MkrbvPDchffiV1f5JIkpFqIAKCELvQzyVNJQGsZ5U4gfBmMaOi9+zCTXGI9axAi5yMRb
 2VNM6k1YE3bN3hsJxX4pBgy0wms3dLsAOkKfBfnnX5hqos/zF9IB/8qNjDc4pbBhNUfboGPdWIp
 x05/gBaBs6ZzFCpRGTrTRuKS2AAjQWcpM01YJjz/hFXrrtmkiWZHuslYpUXV4NTNxM1akoUlqTg
 fYhYZfvi9Y4CMydx/SgcZQveqIT/RcYuoCcgd6nCG1U3fr+Svy6AJNDqaOvHPDsQjL3OSSs0UmB
 u//Ji+TdvGEDKsCr/mA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MiBTYWx0ZWRfX5RiyKFn1HYHt
 tHiHVZGgImNyom9YGWq1Pgng65diKz0dY2dvdOH/VUa81VsZJqV6ik5lPt/6F/ssCZwLvqSIsyb
 YjQ9O5ZBrQAs2IxWnJNFHmG5byUdI0A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1011
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_084140_525864_A2975D05 
X-CRM114-Status: GOOD (  11.18  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 26-10-28 11:48:48, Avi Weiss wrote:
> mtk_spmi_bus_probe() stores each controller in its private pmif_bus
> rather than the parent arb->bus[] entry passed by the caller.
> mtk_spmi_remove() checks the parent entries, so it skips registered
> controllers and their IRQ and clock cleanup.
> 
> Record successfully initialized controllers in the parent array and
> recover their private bus data when removing them.
> 
> Fixes: 078117963b2c ("spmi: mtk-pmif: Add multi-bus support for SPMI 2.0")
> Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

