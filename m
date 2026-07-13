Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C064BC44507
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2026 11:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U9tA3tFtTdnt2OcqRFhofQ3tr91DLiJW+I+IyBckjI8=; b=1OH7OpaQ7W2TGXAd3ae3JkUeFN
	tpSc862mDGEj5C9fbePPsufMO1kq04tZFmnFUeuux948YE1zO9P7vq7RHkIeRACxcHfXUPyRpBLCV
	3ET910iLw7QZHwGf5pZAZzI7r2kjjfX0Tr7Qy70Nk146WR0vJKHNoK++Uvv+2QjOU+wLA4QpcPb+z
	H29TjtT7p7nrGzLtLgJSwElZCFTfDBzZOEeKyahqVwD/+z0hUZkuMJjL0zyrV952//te5UWZc8wmU
	KAS98TGOGHR9Twu311PAkr2oBokuL3HBPE0CisrlWIBHFH0XnIoRQ8O6tGAoO63N3k1zFlGc1C2QH
	+6DlGXEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjEUe-00000008y3S-3lTl;
	Mon, 13 Jul 2026 11:06:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjEUb-00000008xzI-1QUk
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Jul 2026 11:06:35 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D9M1GG1090406
	for <linux-mediatek@lists.infradead.org>; Mon, 13 Jul 2026 11:06:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U9tA3tFtTdnt2OcqRFhofQ3tr91DLiJW+I+IyBckjI8=; b=DI8Z8pG3wdQMwjdq
	NgShZmtTxQEhxFPIhHzG7Y4XzDgWQeVTDEJ8TOU+sxTGh15y8yWG8xKeHQ49dJj1
	e1p0ChIPIxcRutKhsC56jX3fZi9FPHm94PFL2LzrkVexJq/LKYNIMZkY2kKYcSM4
	3SnKeDl8psgTv6f77tztLtl44Iq0WYPTON+OJaMaolB0PJeRapF/1xLuUCtLfzpH
	k7E/XBBdkNABekqxi15zBOSFJJHU/dWX9lSnwoR6piA+mZOqBdO9SRmCmGIEZTod
	aqUbXvFwWjULYAw2EBIt8TtjflJc4IFAv7Sx01pCYRWASjnU3XysIrGW1Z+sCxVP
	RECV1A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwavrc24-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Mon, 13 Jul 2026 11:06:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92d1cae5939so427025485a.0
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Jul 2026 04:06:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783940792; cv=none;
        d=google.com; s=arc-20260327;
        b=G8eQ+Bcbcb+vjIRqT5R0y9aEZ1VdaSr5rPiCS469UbSHMBrb8OGXRLjL8ovKuJCjGv
         HgHsyRbGIS7iYziQylgHk2A/mZ9QU24EmNdpvFZTcSKbRO4Ded/g9jyd89qjr7DoXF+l
         p+o2s1NTZTViwksi0oz9+1bW6jOExCcyImeYo9N0bvKKZ8UACmHZyzgoFxxaieU6Z6JM
         OuG5xbGXD/2UQS7gHuBCH6lq5MxGlWt65bHxdu4qBsoWctUzxce4SdrB25righdORDnL
         rB8EqjXz+aSNy8eYaSYkAFdx+VmqSHyrVcuVzFyYC5cUY1qtK+9Ddbv70HXDVYFpAB7P
         E2Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U9tA3tFtTdnt2OcqRFhofQ3tr91DLiJW+I+IyBckjI8=;
        fh=US4ylNwsuKyQhKUDLn0vRMJSedSmMdy1qJgHNd9qoK0=;
        b=cmhWfIGgHzdHnn+AojA8h7Z+gFHFO9AVOMnrbbHji4ns1TUT68GKnZrrgFYVQ07kLz
         fbqzoyWUh/HcinWSTVKG7eHg0EKRFn6HrfRfanOxiOc2fYy8k76reqeYRmidjNCIZVCA
         2KuyWB5db9SyG/m6OfUFbdSDRcK6N8tsxbPphFE9KnPJ4NEiVGC6buB3drnAlBb+P6eE
         pTGXSuvZV2J7PXs+X6qL1gQwa4Zijgjc6cY+zxlZvHusCtTr1jyvaAwCtucEZ3hZUL51
         LEwsGIytvDFm6ZDZOQwwh1H/G6P/tYGrNN+Vba52ZfySAYHEzUdQCd6oe+pCxdVDG2RM
         G85g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783940792; x=1784545592; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U9tA3tFtTdnt2OcqRFhofQ3tr91DLiJW+I+IyBckjI8=;
        b=Gh8pqIMPqto6uxvE7Rpyod+XJ7uM9IsxyuKB2HJUxtoRc0ZQLAwJsZSPot151Kdwtd
         BWqo1umFFjtT4jqkXOl7DjJPwTnoBjLHOgx0WVEIF1M2/g0PuglI2eEM5MiDO81/gYLp
         5cQNopBjlPnAQSxK107gyLi6aHEyhsXH6fqz9X0ZkiYH44LfSO50jhXzgSghOjhljfzq
         HOSKpa/E40s/XuaUt4/S1ulS39Hk3ECLcfvcVWCi/cdxYAKV750awbmbJM2NjL1/GLaE
         MfUICI7Q8/hU866F+59V9wiZVvivjjY33EQ4o00i7qG4Z50itniFSgwJeUu2dR/cBKXZ
         0urw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783940792; x=1784545592;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U9tA3tFtTdnt2OcqRFhofQ3tr91DLiJW+I+IyBckjI8=;
        b=hkyoZgJ0M6Sd/ijHDBUSngaK09/OpqQiLk2gIiPEYpV1cDlC6864gm04VWucax71wc
         yjHs4ENsM7yAg/nx4Td0WrVzKLfFzeau1xrc+V6GmS41/z780QwMh4FH4H4pbAPQUYWQ
         W/WEn0cYYdaQpkUMJGKC+vBX5lr+e5jw/jU34KFUkNIzP+oEWwZ1QHB0IpbNuBCEkprr
         cX7BKujmadQHfEMVKcXVZQ0TueOYpdrPsBKt8FBdzUFB2sO/A4v1LUPWgOFnaqZ9xL5B
         5n0hww+DNsDvPG9yBQoWiySh7li8ttQ8UT453kX7ekbbjwPkHutMsuXh1mzG69pFJk7i
         eiww==
X-Forwarded-Encrypted: i=1; AHgh+RpRgyl2ecUu3Yv4djvKPOVK/b2/bEUaHPmIqDgcfa9RR9snT9840+4IQ4tRru225YOOZQigr2llQq5XM33Qcg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8MXW+61xkcO7bupZuzq0aFz9RDmtQy4vqzEjUuN/yPX6EyBI3
	J5P292Srl26EJnEG4xXnoINPyPrHTSvkmTopTLzJfTot6ap18WBWsAhK8E9CCxo29tjiVeXIAdn
	KUEH1xv1CQ+E+9E7wcKsD9yYm79N1uWvb4yk8JXLN9manzNQZEFL/kjocC9nyF9lIUqWXNNG6Em
	4GVcLvGm59QUyzyTzt2JGoKO5Yd/u4KIA1KooD0zSdFsnUA+QqSA==
X-Gm-Gg: AfdE7clj93WGzmfrEzzKuOA4SUNJtlHLp0k5/XxSvvOd9vf+LlsaaXhvMXE4rQcXMWm
	gFgnZCyf0S0CgzgQm/QmW6Lj3OnDy0eSEXJz7m8LzfXeRwZU31dpLHGsQw1qDzw9OjuFbyeKYaw
	9TSPjofIqkEutWVzDz0QrvPaIvZiQw5V5IQgYZIjo9kJf/e31Vm82uBKcTzmQo6671sbGZ
X-Received: by 2002:a05:620a:2950:b0:92e:cd78:9244 with SMTP id af79cd13be357-92ef2e26c76mr815024485a.84.1783940791831;
        Mon, 13 Jul 2026 04:06:31 -0700 (PDT)
X-Received: by 2002:a05:620a:2950:b0:92e:cd78:9244 with SMTP id
 af79cd13be357-92ef2e26c76mr815022285a.84.1783940791449; Mon, 13 Jul 2026
 04:06:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260709084635.24912-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260709084635.24912-1-angelogioacchino.delregno@collabora.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 13:06:20 +0200
X-Gm-Features: AUfX_myTjQitf9mLWKDNP_7823p7zFAcgW6QTMG2dOgcyWT7UVSwFMCpk7KVrgU
Message-ID: <CAPx+jO-_KLM1Rhu0G=hOx0aLr+XT6X9w9gLui=aHjSBgDkLMoQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] pmdomains: Fixes and add support for HFRP Direct
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: ulfh@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        matthias.bgg@gmail.com, nfraprado@collabora.com,
        irving-ch.lin@mediatek.com, macpaul.lin@mediatek.com,
        aford173@gmail.com, mbrugger@suse.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, justin.yeh@mediatek.com,
        kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: cG63NgG6sgx_jwS22ASVmPJ0hfedj-vi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDExNSBTYWx0ZWRfX45juT7R8lOTC
 cZqZA3PzvLMZzCH9n4k2l/8FmgwTZu5tAH5SD4hmHmLCsqzH4ZQleIygq9dy0kypwrzxy9rgtzU
 inIGZfP+giuBlA9AD55o7PxSY5GrS9SfW3oFIeLk4tEVSsFXRegyLOk88xIjs385RyXmoyXVqGA
 ey7rYLugT60UiZKwe3A/bdrtsw0NtJ7SSAd3UFxU7payXnyysi/3m9CRofwJumzR5ei1P0ZTuXP
 XUGV+DjV4Ynir9ZBiUpZfUdniuZCD+OlMEq3zfQ0XIfYJYomKNC/5p3eKvda8hTrFKMOT6p6z9D
 zh0VxmYRAWXqhYXJxMaJ04JTrwvM5fX0E2mOrDpgJZg6FfdGA9Jd5COpwfZjKtSPDezXuaLYaCP
 2kEEIxKe+u9HY0lspdzilM3dXuPJtb2IEiFZLY5+g1bmUVXLF4+2adHyGHDBjOzOthZ+RIlwPZp
 RWtVSFLIEDohuh3Jiaw==
X-Proofpoint-ORIG-GUID: cG63NgG6sgx_jwS22ASVmPJ0hfedj-vi
X-Authority-Analysis: v=2.4 cv=dZSwG3Xe c=1 sm=1 tr=0 ts=6a54c6b8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=QX4gbG5DAAAA:8 a=1sG5g2DzjvmgYBam1ucA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDExNSBTYWx0ZWRfX6O2mQdEJ4skq
 VxETQpjI2k2gKWwdxtcJW9ghsAgtMdsfoeqNfvOff24G9dNN6Ar2131mmqUeR4/dietsGUVabb7
 D2b95PYkfZO6lo3gYAo4t2NechrqD6k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_040633_408903_0D1AACAF 
X-CRM114-Status: GOOD (  19.30  )
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

On Thu, Jul 9, 2026 at 10:46=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Changes in v3:
>  - Added new Fixes commit for possible null pointer kp during cleanup
>    of internal on-check
>  - Added proper error state cleanup support for SIMPLE_PWRSEQ domains
>
> Changes in v2:
>  - Fixed return value checking in power off path
>
> This series adds support for the DirectCTL HFRPSYS power domains found
> on the MT8196 SoC (the ones without HW Voter support) and also adds a
> fix to respect the power domain relationships during error cleanup,
> which avoids HW lockups in case probe deferrals in the specific case
> of "almost fully probed" power domains (where most of them probed and
> got set up but a probe deferral happened almost at the end), behavior
> seen on the MT8189 SoC during bringup (but honestly I have no idea how
> are the current ones working fine without this fix...!).
>
> This was tested on MT8173, MT8186, MT8188, MT8189, MT8192, MT8195 and
> also on MT8196, over months of development, both manually and over CI,
> with no regressions detected.
>
>
> AngeloGioacchino Del Regno (5):
>   dt-bindings: power: mediatek: Add support for MT8196 direct HFRP
>   pmdomain: mediatek: Fix possible nullptr KP in HWV cleanup/on-check
>   pmdomain: mediatek: Respect PD relationships during error cleanup
>   pmdomain: mediatek: Add support for Direct CTL simple power sequence
>   pmdomain: mediatek: Add support for MT8196 HFRP DirectCTL domains
>
>  .../power/mediatek,power-controller.yaml      |   1 +
>  drivers/pmdomain/mediatek/mt8196-pm-domains.h |  27 +++
>  drivers/pmdomain/mediatek/mtk-pm-domains.c    | 184 ++++++++++++++----
>  drivers/pmdomain/mediatek/mtk-pm-domains.h    |   1 +
>  .../dt-bindings/power/mediatek,mt8196-power.h |   4 +
>  5 files changed, 184 insertions(+), 33 deletions(-)
>
> --
> 2.54.0
>

The v3 series applied for next, thanks!

Kind regards
Uffe

