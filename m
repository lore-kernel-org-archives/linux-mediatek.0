Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C28606A32E
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 12:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BY3gACQo;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dfOkZ+eH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ifA6RjGI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MatU70aFGzUpefEfOY9ZfVcRCCMiI8u0W7ROj7FQCKI=; b=BY3gACQoB6tTKn
	E1scDNZRqizXaeCQAn5iVIAebD2j8ThoDDlqItdSnYpn+U2gZKPECO21UBjUMmT/7PrKOZNALATLu
	6hmaqCbMvxRr9meRGq1vcHghu89Az3XvcQ1wkHjUab87G1RPNn6J3xw8QFGzBINSBYTf5xQMw1yJM
	pByS8G+vCZJbql+KCFrBTEqxmSucxnEn5wHE5Gg5sWIHy0qt6Vs0QbYjvRlcYwrb288A43uo8i3RB
	iMtsf0fz4l4pYnC7tWBhZqFqHyp3XRBlOJo4P3DlDoQVRIt4kLW+H/BhAJUsN5xJao64dUZqcHuwB
	GtHilbgs/acEnumprXLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlBE-00000003tgC-0uwE;
	Tue, 10 Nov 2026 12:42:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlBA-00000003tct-1wVa
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Nov 2026 12:42:26 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABAaXw3850915
	for <linux-mediatek@lists.infradead.org>; Tue, 10 Nov 2026 12:42:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MatU70aFGzUpefEfOY9ZfVcRCCMiI8u0W7ROj7FQCKI=; b=dfOkZ+eHCzjaObQa
	arqogdPgi6Sicmsw8s9UW74t1KaD3DEI8mGFbx26JErUorxPHUzWEhLVmrhGkgKc
	SnSkCuZ10nJaQ4jut8xSzy6qwkEpRGQxeVOqvTow4lgJu2h9f6w1fSaC8VDskXE1
	qekFaTr8/B4uo8/SSpYz3kcMzuum5Do0ar6cP+F1xDH3Sgz+EFIJbW4gprKmP3LV
	+1Q45fBRG5pzz9b0q0Sq3NiN8WO2w8BLQ9n70oc38FEvFGghOVciXjt4RrrXPRp/
	0rQ7TPy1mnCzCz5lIpbISeh+1TfLVm9bVfSGxzmDkFQn8Olvqg9vBn6RwBRcb1yu
	TQh88w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hufx84qur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Tue, 10 Nov 2026 12:42:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9460411fce4so32646085a.2
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Nov 2026 04:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794314542; x=1794919342; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MatU70aFGzUpefEfOY9ZfVcRCCMiI8u0W7ROj7FQCKI=;
        b=ifA6RjGIEHFpPWyEZlAYkdcmQ60qBWutofVdWe45+ITHR5ALoeGxTYUbjoh9S0Ihx+
         gbbIUtDlvHK+vT/BhyqiGwnll0NbpnlBVtx5Zm5ySY+3LGkO4geqXI8VL0Nxy0TQ6je/
         Q1DQrlwXpLAShUgyqCVEDIuuBtQER9fjicDjMXmqH42Bw3k3Bu8sLErPEauOyELKYrDO
         UFk8UXuB/OJzSQNnmyrecmFHYuKucR7iZxOP5Z6hiC2xHPOKc/g/kNDpSlihiuH27wy7
         pTrChWyK6kBwBSBPf65xtQbmckw69rbYroJyGzp6rwOulb8JiXQIN+Snk8g87WMzp/IO
         WtGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794314542; x=1794919342;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MatU70aFGzUpefEfOY9ZfVcRCCMiI8u0W7ROj7FQCKI=;
        b=MlLWyCupgolwXqfaYJilIhfTShJNssxu007JibjSsRq2IqXZtqvBOkJ78euTT8gLhG
         w4KQDl0x4y0hbVSRIOdlgYGNY0uUwc1nxdI1K9S2QABKDn89ckdPMrGVfLZCNowqARCU
         qWaaZVx7aXQj9ZUYFFKMhacYH/xTsnU7yNvpJqnMrS5UELHB/Oe+WhkRuAbWlalqyXYi
         b66uMoWcxdwkNX1UlwLgv5c80PqXUR6z5ecZhZIZHNM2Ql35AgKXcbMgjHYrPXBIas5D
         NuBQUOJt8JJ7MOO0BonXfRJYCuTht0DKV23QgLLCN76Md+wJm26GSLySlWLQfAQG0HFn
         e67A==
X-Forwarded-Encrypted: i=1; AL+hErEO05VjTsJ72TISTvSbMAfywL3LjWhNBl+6sZnBWecLMJ677zFLHK97a1nO6wl21GHs6g+8mWlnCTIHotVLGg==@lists.infradead.org
X-Gm-Message-State: APuU4Z84QdqPWHafUpmfGGy282OpwhYFGsPqYiJVasNKN3llDAWj9Kea
	1JQOmIrXVIcvCNMAqGMXhWvdQD+3Hsd4JUiTDVUoXuXzV0/qdQSsGM3nhYAXD+JWxC2ujYbQ7Wb
	Vmb1Jw2IksweC4LCuDrFIIcamzz5FDFejx+nBjYYIHs0mxK5kCXIydJykspm/0IBX/FJ1jcBjaT
	U=
X-Gm-Gg: AYBFou2KAX8bpiKVQ63TaLSXDASliXH03QL+nTi7cAOQ/JMRHtITYwARLmeY0/oo/ju
	vmfWhot30QuRdTxsbwVuvoUCZrPbCtshHA63zG3p7WVpZglPaS9yeeLigUbwgeFEg85lwGf3U+E
	cwy+Pj9SYf+DNSeWloX5rtXgwHTE54wSRYlbO1K2K15JYPdeTFjbUIGbxaMid55zH5llM14jPqz
	qp1lbunFepxnDl8oGk+D1OGSlTVTqOEz4XRy2XI9D/xVzdFvf+bYTyZhup2KW4OvZRrNFmN0NCx
	NxfvmFQveAX2taAPSGy51IsfSkTXI7hcDd+FgvZtYOAGAwTSgJKRHWfR60CmRiroClHvyiH+ytD
	vNRWsb0SVFVqUruMiZZN1QNDiv7oQ6TN0d+IKmY1HWa2CHSlwhewjFCXcj3EQu3InzQf81jE=
X-Received: by 2002:a05:620a:a2d5:20b0:945:cfbe:816e with SMTP id af79cd13be357-9479f3d6b39mr351994985a.4.1794314542082;
        Tue, 10 Nov 2026 04:42:22 -0800 (PST)
X-Received: by 2002:a05:620a:a2d5:20b0:945:cfbe:816e with SMTP id af79cd13be357-9479f3d6b39mr351991585a.4.1794314541623;
        Tue, 10 Nov 2026 04:42:21 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a3a66b9sm103217466b.9.2026.11.10.04.42.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 04:42:20 -0800 (PST)
Message-ID: <7fb5ae20-c4f3-4aad-8d7a-a37a6ad15fb7@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 13:42:18 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] thunderbolt: Prefix NHI core functions with tb_
 and tb_ring_
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Mika Westerberg <westeri@kernel.org>
Cc: Andreas Noever <andreas.noever@gmail.com>, Sven Peter <sven@kernel.org>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20261110114925.722014-1-chunfeng.yun@mediatek.com>
 <20261110114925.722014-2-chunfeng.yun@mediatek.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261110114925.722014-2-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AbYkjHXG c=1 sm=1 tr=0 ts=6af3112e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=e4OhxiAmdoAHhBioD_AA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: XYtZFC0MvEaJjcCx_XXS0Gl1X3ByCFFS
X-Proofpoint-ORIG-GUID: XYtZFC0MvEaJjcCx_XXS0Gl1X3ByCFFS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1MCBTYWx0ZWRfX2JWIFHNapgAb
 DfZv2vBXE9A7awLzM2kC4UdLCXLMPF+lFQBPztfUfeMlvxyoOVjqiNlLVZh99rOTHV3nt6+FmQo
 kCdBnw69KT52sQ4uyI6wQRZ91LJUXbw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1MCBTYWx0ZWRfXy7uv9+3BI7qp
 ScHc2b+Ptw9tI3VYXUqY3jnBilCVhnzKjfTHs4AlZSkkNxhzPLbztIPLMqlzQu30jSvdbKkbuB+
 xUq3icRoD0oh2U97AoxGE3/E/XfVw7AM9LTjAirOayEhoo/XtfwppKqYy2vhlUGvgAS7YEPdseL
 oZKzhbnYUVS7baHQlguppdrpBfXdYP4F5hiuQSU84cWjWM8zSJjhv7qBPUY6rkSc/nlBFpRgR73
 r1ZYvTMJnYnkdhVPDgPlWDnbRxM8cQdfkny9Loae4vOxnmfCjQmN7AwUYBCOSvXp0BhJwJY5KXZ
 o3tFm+HIduRxZ/4BBjjFeBXh4CVvwe9KMal9FjtH6UUbLkFU5kItc5usIJjO9DNQ4I0yLm8gmxE
 gMFCLfEy5crkPw6PLdhJZlRQitPfAuw3EdDnwaqqkni2slpKV+Km+rKJb6Aw9TeT8YMRj+vgX5f
 Nra2iyohizKvO3Z1n8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_044224_611798_FD9A9DBD 
X-CRM114-Status: GOOD (  14.54  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/10/26 12:48 PM, Chunfeng Yun wrote:
> In preparation for modularizing PCIe NHI support and allowing PCIe
> and platform NHI drivers to be built as separate modules atop the
> Thunderbolt core framework, several NHI functions and structures will
> need to be exported.
> 
> Currently, several of these functions lack standard subsystem prefixes,
> risking namespace pollution or collisions across the flat kernel symbol
> namespace:
> 
> - ring_msix() lacks any subsystem prefix and diverges from all other
>   exported ring functions in the driver, which use the "tb_ring_" prefix.
> - nhi_probe(), nhi_shutdown(), and nhi_pm_ops lack the standard "tb_"
>   prefix used across the Thunderbolt public interface (such as struct
>   tb_nhi and struct tb_nhi_ops).
> - nhi_msi() is named after PCI MSI, even though the ISR simply schedules
>   the interrupt work and can serve as a generic ISR for non-PCIe platform
>   controllers as well.
> 
> Rename these functions and symbols to conform to Thunderbolt subsystem
> naming conventions before exporting them:
> 
> - ring_msix       -> tb_ring_msix

Maybe nhi_ instead? `tb` is used for the software connection manager-
related functions

Konrad

