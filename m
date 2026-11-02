Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0C4606A324
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Nov 2026 19:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zm6HPYYj;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lK1UUgMM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xnc65brz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Gs8th4SEozRoaQAfmCE6xTxW3o2poAMT5v1gu4UQZJE=; b=zm6HPYYjsFwezo
	HAcC8DXldFwEOcoWRxy6Twa91m+VBtV7DAz760xMFnN+8LTLjYP1LU5WUHsfkhRvKOmdpNKQQYHUE
	6JsqSm2GbrC1zWaAVN4PxgLxBryktaPMLOrM2oCv2tpZXzEvWxsIgnfFAYG/dRMSEYTY41IUplgju
	HZ1kMk7XVQVnVln0yrpuMNP2sNM5ky8ZJZbTf7qpCHwBxFbK/cIdcs+87yb+alrTj7e3uU0frxEmU
	FLDmnCGo6W7TaKio7Z2HcRTn5DAlUMLJM0teaSiFSulXUNaWJetZzclvIBnhqcNnFkHFZuoq6+QRn
	7nsj3wgxIq6ybwdnxTjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNyAX-00000000FIE-3fHu;
	Mon, 02 Nov 2026 19:58:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNyAU-00000000FGo-0qxT
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Nov 2026 19:58:12 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2ItUqj210588
	for <linux-mediatek@lists.infradead.org>; Mon, 2 Nov 2026 19:58:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gs8th4SEozRoaQAfmCE6xTxW3o2poAMT5v1gu4UQZJE=; b=lK1UUgMMQ4M+nSdm
	jUtNwcV5tUBSKR6VI2R4h7mhNBNlagdmdy+T5VFiGgfsxWwW9WmoEAi06aev/fp7
	DwlALsquMaMk+4vq0QEGuo4DovwMQcJ1vOTfzJDPuaeDoQJvZSe5yMiGDnygDQFm
	5wgXz77DMcZ+2/QP1iNQskQVWiSdE0xa8iktbl/N59BeMM4mETI/ieHpHjHzzTPT
	zGaR32W4qFzp11ouwiyk6C8xUCa+68anUg7SnvqT/wqjqiHlxcxmMHG4U5PVR5h0
	oDkbpKnLfSxwsCrEy88R0PEqhaGRQLOCokS7Bpvm2XjOlV6L0fXx0East22/lbKR
	sbYoLQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07r08jf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Mon, 02 Nov 2026 19:58:06 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-359b81ad4e8so4614367eec.0
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Nov 2026 11:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793649485; x=1794254285; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Gs8th4SEozRoaQAfmCE6xTxW3o2poAMT5v1gu4UQZJE=;
        b=Xnc65brzM4wHO6Fzv3jQ8QaynmrvBJNtiVZf3+OgdjmHpYLx7vD6sjw4rtji19C9ce
         zIrCT0CyT/W6GLWbg6hRNwWa/pTIAlEU1/KtNamNA+WTPZQ7x8d+bB8utukMZykundgJ
         9TsC1qvMAuSZvjnUkuf58OvrVWCRfnIlTDWwZ4CnTfJsmL7oXAF33zxm4hsiz+FIHPpO
         jZSMkw2SYt2s5ZXH/OIAjeBHochnnd9WsS9WRN4RKX1jH/tKJXlsgLn6OjAxaeLcINuM
         Upl/1u53GLMhhbyPDDhfj6lZ6mkT94k2z0g40AM8xEwGAw88GEcoAyGQb4FT4++XztCm
         mV4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649485; x=1794254285;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gs8th4SEozRoaQAfmCE6xTxW3o2poAMT5v1gu4UQZJE=;
        b=0EkKs1D3RivRuPWRlmkPnycxnyByN48YiH5I2N0wo3pyKttrqdbPZUUG4Bv0KF7T9b
         XrSZdAsquw9cd+MmQtupnpFY8rN7frArNOIWzcMVwvNg2U4I5DnJ2fQG7o3PXvPVbkUK
         pWLTj5G3KSoYvObmgwfcVE+5Uuggmas8F3k2mgP5EsnMN63eehCbKF1ykiWwuPaAoBK8
         rsD31DJeO8HSWESZ8g6CDKroTv4JapsfPGYw8mrokFtG54NtzSzPlSgxsY6MNVrXtzO1
         0ZNuGmJ4GsYtPQROwnnhHrwYZSMwaifnuNagGIKgUDboIO7tLz62t7qjtr1l/Cox2kKk
         sG2w==
X-Forwarded-Encrypted: i=1; AKwUvBzEkHXNxp+3ZqUosGOtEXjYO9CZ00oE2ASKPcQjR250YI2nV8lEMjZRPdSvOB4DoE6KbtDIB171Jcu0jX2cCQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYLPy0wOpi1KRtydIi0U5U9ljUccKmU/His3dxNaZAgUC/exM9ah
	gvz7e9GZhZ2V6fKFU/fb7owmjPTKXmtXKBM0ZwCUf7M7gZUbKkkQ1KDuQ9b9a+D2qDUtipR72QI
	aZgpMgTrc9iBpOTVqy5tOcWWd0itTjy2+DqnTpXLD0SmjS5v9xIaa2VhU6gmDCv/70z6rD2rg9X
	0=
X-Gm-Gg: AYBFou3VJWRLKxVJAixRkrFFYQboeuScq7MslJ/pvTjCFgFFUK3Y6Nym4u4xHPNV4JT
	sdpWNlmyIwoYjzb5Y1MiXVzpUfkiREBgRZ5dFb6hVPc3Inc+ydfsAQikXAukxDXSAkdXhM85V3/
	+RGIDTLl1cxDyISGjpKK2Z0Hiow2sET/mrk9tJcpnOqHdK19kns+TLEeBgG+oXW3wvCy4AGI97y
	AsUfQ0D+b/t0wLbKZLPlGZlkAMHe4yc5x1Ke6ifGl7i2f7FmU9T/TX1FJz7cxq9qWDlwWkTjcAy
	FTZ3vfWxPeTp/9fMwOVzbRebgK7REP7nzdQGboKaZ33+QjoJVzio19QOClhjephjhhJEbi+EqcX
	7ldgTNrmaSBwiDByH6XSMGLeI8AXMmHGV1+tFF5FsSN0wBjcQ3EpnmD0kWLu9aEhW+3GjFYpMSy
	+HW2VljJf6C4AE7Y0N99e44IYbCA==
X-Received: by 2002:a05:7300:7a83:b0:35e:2c6:d46c with SMTP id 5a478bee46e88-36a42362460mr15804695eec.10.1793649485352;
        Mon, 02 Nov 2026 11:58:05 -0800 (PST)
X-Received: by 2002:a05:7300:7a83:b0:35e:2c6:d46c with SMTP id 5a478bee46e88-36a42362460mr15804647eec.10.1793649484607;
        Mon, 02 Nov 2026 11:58:04 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a6f7f9sm46910086eec.25.2026.11.02.11.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:58:04 -0800 (PST)
Date: Mon, 2 Nov 2026 11:57:58 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: "santino.wang" <santino.wang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <light.chen@mediatek.com>, <Fred-WY.Chen@mediatek.com>,
        <arnab.layek@mediatek.com>
Subject: Re: [RFC PATCH 03/11] soc: mediatek: dram-ecc: add tracepoints
Message-ID: <20261102115758.00005a16@oss.qualcomm.com>
In-Reply-To: <20261102092334.138759-4-santino.wang@mediatek.com>
References: <20261102092334.138759-1-santino.wang@mediatek.com>
	<20261102092334.138759-4-santino.wang@mediatek.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xaDs-khHFAuNcwUO9PaGCAFEJM4cWp8g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA3OSBTYWx0ZWRfX9EzOzi2OavPw
 2tk3hDsNBqiE0tU/yCJA41kNrWC3f2swXG/tBo5bovoH8S1i+Mf0y2MZqERPmLzaiQplpuB0dpY
 BBohJXef/ziYYA6CWcgSm3qN4u+EaM7XuvLuNqfvF9nSmYkRPjttwDAQUItEiEtcfmrozBo+izT
 kDend4fTlSqOK3ZIAyKEKxT8uE1PlDchsptcZeIIv6qh9mEgS9HVqHc7Z8HZOdhTerpZl8yZY7l
 pjGei2cAGEuVKn0ejg3yw9LiT0AG+NPY5T22wX5gwU3NKjrVJtkiIDGrv0lT5kPWFE5bSpRe0oO
 G2ygHxQwH2Z1IhcYB9II1DVzP9Fl0ymT2H3dyE+zqKTprQDfo6LiplBciv43gm19XQ7k1EdgpF3
 2T2Ahpa+SP/6y9BbW7b22AI1cQIUJbOaKo1wewJkbEmzUpZnHZvlSOoz8XUHVwNbjq+/yeDKuf0
 CBGJGnYEKZX/8J5NfkA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA3OSBTYWx0ZWRfXx0LVCEbdiRLC
 mHuR7pMDU1SJc07f6YukvNRmgsFyDAgGSHNlSWw3l+Gt6sOgoCDmz4FCw7zX5RCUgqw5SBwEsLf
 hQZ8XTHBViq3luh6ZJ0/QXVnEjSlmOs=
X-Proofpoint-GUID: xaDs-khHFAuNcwUO9PaGCAFEJM4cWp8g
X-Authority-Analysis: v=2.4 cv=NZlzRGD4 c=1 sm=1 tr=0 ts=6ae8eb4e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=sXLBpHRKkfUpVznMtjYA:9 a=CjuIK1q_8ugA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_05,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_115810_361843_C3E6454A 
X-CRM114-Status: GOOD (  15.83  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


> diff --git a/drivers/soc/mediatek/dram-ecc/core/trace.c b/drivers/soc/mediatek/dram-ecc/core/trace.c
> new file mode 100644
> index 000000000000..9a8b20e48069
> --- /dev/null
> +++ b/drivers/soc/mediatek/dram-ecc/core/trace.c
> @@ -0,0 +1,6 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2026 MediaTek Inc.
> + */
> +#define CREATE_TRACE_POINTS
> +#include "trace.h"
> diff --git a/drivers/soc/mediatek/dram-ecc/core/trace.h b/drivers/soc/mediatek/dram-ecc/core/trace.h
> new file mode 100644
> index 000000000000..d603fc38f0a7
> --- /dev/null
> +++ b/drivers/soc/mediatek/dram-ecc/core/trace.h
> @@ -0,0 +1,119 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2026 MediaTek Inc.
> + */
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM mtk_dram_ecc
> +
> +#if !defined(_TRACE_MTK_DRAM_ECC_H) || defined(TRACE_HEADER_MULTI_READ)
> +#define _TRACE_MTK_DRAM_ECC_H
> +
> +#include <linux/tracepoint.h>
> +
> +/* driver lifecycle - state: 0=init, 1=exit */
> +
> +TRACE_EVENT(mtk_dram_ecc_lifecycle,
> +	TP_PROTO(int state),
> +	TP_ARGS(state),
> +	TP_STRUCT__entry(
> +		__field(int, state)
> +	),
> +	TP_fast_assign(
> +		__entry->state = state;
> +	),
> +	TP_printk("%s", __entry->state ? "driver removed" : "driver initialized")
> +);
> +
> +/*
> + * ECC events - spa/channel/subchannel/rank/bank/row/column decoded from the
> + * ECCERR_INFO0/1 entry that determined severity (see ghes_notifier.c),
> + * mirroring ATF dram_ecc/mt8992/fiq.c's decode. No agent/master ID: ATF's
> + * GHES vendor section doesn't compute them (see mtk_dram_ecc_event.h).
> + */
> +
> +TRACE_EVENT(mtk_dram_ecc_ce,

Why push these through a custom tracepoint?  This look very similar to what
is in the Memory Error Section 2 CPER.

> +	TP_PROTO(u64 spa, u8 channel, u8 subch, u16 rank, u16 bank, u32 row,
> +		 u16 column),
> +	TP_ARGS(spa, channel, subch, rank, bank, row, column),
> +	TP_STRUCT__entry(
> +		__field(u64, spa)
> +		__field(u8, channel)
> +		__field(u8, subch)
> +		__field(u16, rank)
> +		__field(u16, bank)
> +		__field(u32, row)
> +		__field(u16, column)
> +	),
> +	TP_fast_assign(
> +		__entry->spa     = spa;
> +		__entry->channel = channel;
> +		__entry->subch   = subch;
> +		__entry->rank    = rank;
> +		__entry->bank    = bank;
> +		__entry->row     = row;
> +		__entry->column  = column;
> +	),
> +	TP_printk("spa=0x%016llx ch=%u subch=%u rank=%u bank=%u row=%u column=%u",
> +		  __entry->spa, __entry->channel, __entry->subch,
> +		  __entry->rank, __entry->bank, __entry->row,
> +		  __entry->column)
> +);
> +
> +TRACE_EVENT(mtk_dram_ecc_uce,
> +	TP_PROTO(u64 spa, u8 channel, u8 subch, u16 rank, u16 bank, u32 row,
> +		 u16 column),
> +	TP_ARGS(spa, channel, subch, rank, bank, row, column),
> +	TP_STRUCT__entry(
> +		__field(u64, spa)
> +		__field(u8, channel)
> +		__field(u8, subch)
> +		__field(u16, rank)
> +		__field(u16, bank)
> +		__field(u32, row)
> +		__field(u16, column)
> +	),
> +	TP_fast_assign(
> +		__entry->spa     = spa;
> +		__entry->channel = channel;
> +		__entry->subch   = subch;
> +		__entry->rank    = rank;
> +		__entry->bank    = bank;
> +		__entry->row     = row;
> +		__entry->column  = column;
> +	),
> +	TP_printk("spa=0x%016llx ch=%u subch=%u rank=%u bank=%u row=%u column=%u",
> +		  __entry->spa, __entry->channel, __entry->subch,
> +		  __entry->rank, __entry->bank, __entry->row,
> +		  __entry->column)
> +);


