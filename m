Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5C7606A326
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Nov 2026 20:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4aFfS5fn;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GIZgDQzS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DR0m7FTq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NjhWI7yuHtG81l8jE2qhNiW4zLmd30RBDdP41eJc7Q0=; b=4aFfS5fnihDpTO
	66bfLzDCBytpb1L4pzbCJ1zvRjhuhfheb5FrUkkIHMRC3Jdjb0NV3sninlDJzSNcVoVDbU6fSnFjs
	XaHz2W3/JcMFckOtgDnk2o1ZUd8rEbeM+32XYU2DWJLG0trTkiazAhvOog0WqL/xES0brH3m8y0K6
	0kvmIb8JRwx0D2/ZERIGM11QN8G05tkVYzRGUcI/wwi3I7QPFOL2moEvLzh60KgPuy0O51UygikMt
	ISu6MDi3yMPnsg5W4ntO3P5I4FsN8qpMq4jRWwAevWvhze7CqpUqAMG2/VGiayMtHJZGIvb0B+KVE
	Zt8vbwezowyejBumOtfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNyUz-00000000IAW-3WRU;
	Mon, 02 Nov 2026 20:19:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNyUv-00000000I8f-0DB7
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Nov 2026 20:19:21 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2K5miQ3955512
	for <linux-mediatek@lists.infradead.org>; Mon, 2 Nov 2026 20:19:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NjhWI7yuHtG81l8jE2qhNiW4zLmd30RBDdP41eJc7Q0=; b=GIZgDQzSKfkAJV+e
	snrUcvoMsxebXxOoVuF+gD6Y6nrIopJm8HZXtfuC+HP+cn5tpURxCiutfm/2wZDs
	RZGmfivmpJrMUVUBxYzZTGBBI2hVlhJr4IsP5AfUCQLfcJyp1u35H1sfs8Zrsq0c
	uXA8wyD5v8qs1uym+HbBX98fbKucCdnLt/20df7nG+pjnlbm3auZ+rvVj2kp2XU1
	yLKK+2AIXGGuEDrEv4NFHCXmmiX0D3NIZRAX/hAuRc4/m4hSznz1XN7lekSrjBVi
	0wb/G3TbMU+1VILShrFEveCHhTQj7Cdt7oNARM+sqUWMU/mZ6zhoNzrPaBw4Q0IT
	pKVfhA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq081rb5g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Mon, 02 Nov 2026 20:19:16 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b0d864826cso5362089c88.1
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Nov 2026 12:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793650756; x=1794255556; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NjhWI7yuHtG81l8jE2qhNiW4zLmd30RBDdP41eJc7Q0=;
        b=DR0m7FTqSfZ3GtJLOgXcEXGq3ezxHrc/fP1HdYfwvH2kVa1hCj63Hur6LxLFnUY1PH
         chCO3mhCF19eL9rYxvTiGQZ9tl8aQtcl+6WoFp7tnC1DYkx0KBYQGCAq/QIhPOaOXvYb
         gEbrRv5T079FUc44N7pYw+DVbaB33It70U0xPw6eVTMycRZ9pdugS6qC1pZcj5eO3AGM
         yrCO0IByqS86W+AoNY1KkQ5p9J10SWttZ9XpTiyYDKOgGHPvwFqqSGQmodDV+tbuqfpW
         Jtlso8fElfXyQpUgfJAKyILXpp69Ydl+D1xkcBr0aIJ6mkKJC55jg+mT0b3M72pVQlVL
         k+yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793650756; x=1794255556;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NjhWI7yuHtG81l8jE2qhNiW4zLmd30RBDdP41eJc7Q0=;
        b=jSuTVfsepUzv3JxnBZLDHstn2hK5MR8VKPCWR0aRE38nuP32+Smv9lINNSr3Iah3cA
         KS+N0bxyQlpbZJ9b6gqkfVVc1VXj9JzPn7pClCtLht8q2RvZCVETAh4LqTfUP34R4DRP
         zTxg7AjHML46cnBAyQSvt3kTcZbBj8Ev+Qw0EfPJjBh6fj3DvgqZPIy5lbchZYipLnA6
         WGZptxDKghbfiOzhcYMiJqu3ixmCgUi35NKLWoFVix+8uvAtBckZa2Tan6cYjwkTNr2S
         tPfyDSwuWXwiVzCUD8AVAQ0IWTBWEC+ANhRrbG8yc8WCuVRSdmdwTVGYmGFDkzQL9P3g
         L8ZA==
X-Forwarded-Encrypted: i=1; AKwUvBxbAhtG9sukaAifDjI7YNePNiQV4jCPm+3cMryMEdgagbjjBiD/vfLXqSfEYbdoCp3UlQa5ekSpNkh69HbzZw==@lists.infradead.org
X-Gm-Message-State: AFq9FYKjWXMB14kNbx2sXClpgcW5On/XWjIuclkEhvXd6uXyijvhzK7f
	+G9Cgaekp2ddCAhNqUOBz8WOZez0LMlLYU3lop3HG5gw8Qdk9mbAX0doozXgzbzKAkzfWsmS73e
	4FXy53CbaKqg47Yy2FqnICG8WHachZYL1W/1tdVT/42RTqQ4duj7MiLO1esSwt6f7M/0sSDxQCE
	8=
X-Gm-Gg: AYBFou3INiaLHC3+E9c1+RMSvEHIN0cULydbbGX8iMHc7HRyFFQrPhl00fbz9F5oKeZ
	GKik1LqRqyXH4OPsVXi+FqlKf6b60dDf4HxYmZ8lrq1+Ad2qvEVE4zytPVmVo5QnXlpqh2XD2er
	KQJRcDr76bQeDBhtc9MDjCbfK/X966I9kjCAVbdkyeM5gBTJfpSMca25OvaMdIeZPKLqpJfCmOs
	MDNIAcgDOlWI8vCF4WpH2eZfeHxIOpbTwiadplz6KvdyHU8g6nZ+1QfL5gFOgXBqYOeuHHNZayw
	mkLefNNR5PPKiELX/yu3fuSV4xTf0j8DumWEbM8g5xaczMuM2SeUy29YyJbzg73n92UVMcqCaJa
	gy1NF/jrXNagRtrlWQT3mbOU/+E0lFoQRxS/2srq3YCpDcz4DIWorvw2LZddoTtAsbbxw+ZhIiU
	ZB2Egx9ahdjjV6eKfdg8/G2UpkwH4=
X-Received: by 2002:a05:701b:260c:b0:1ac:9ecb:acee with SMTP id a92af1059eb24-1ac9ecbb353mr14134668c88.39.1793650755282;
        Mon, 02 Nov 2026 12:19:15 -0800 (PST)
X-Received: by 2002:a05:701b:260c:b0:1ac:9ecb:acee with SMTP id a92af1059eb24-1ac9ecbb353mr14134615c88.39.1793650754462;
        Mon, 02 Nov 2026 12:19:14 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1b38ac58sm35173057c88.23.2026.11.02.12.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 12:19:13 -0800 (PST)
Date: Mon, 2 Nov 2026 12:19:02 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: "santino.wang" <santino.wang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <light.chen@mediatek.com>, <Fred-WY.Chen@mediatek.com>,
        <arnab.layek@mediatek.com>, Tony Luck <tony.luck@intel.com>,
        Borislav
 Petkov <bp@alien8.de>
Subject: Re: [RFC PATCH 08/11] soc: mediatek: dram-ecc: add the corrected
 error leaky bucket
Message-ID: <20261102121902.00004630@oss.qualcomm.com>
In-Reply-To: <20261102092334.138759-9-santino.wang@mediatek.com>
References: <20261102092334.138759-1-santino.wang@mediatek.com>
	<20261102092334.138759-9-santino.wang@mediatek.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA4MCBTYWx0ZWRfX13GxCNVjn1M4
 045SLIr2WRRjIrY+yH9maeEB9VV0NQqqaGuuSv6hwOkPNjRyfj9qJJBL/I3bAMNwN2rfRS1MWnC
 f943O2X5ZRmows0dcQih2ecU4JVrM8M=
X-Proofpoint-ORIG-GUID: 58Oa9qwLQXdO2dkvIEq1w5VSmxvzXLuJ
X-Authority-Analysis: v=2.4 cv=F73C5ahN c=1 sm=1 tr=0 ts=6ae8f044 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=mpaa-ttXAAAA:8 a=AaPcPOS3PQYIbfi2GmAA:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: 58Oa9qwLQXdO2dkvIEq1w5VSmxvzXLuJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA4MCBTYWx0ZWRfX3eMylqQzch5d
 RhD2kEhMKJBEJQpngEkapXujbf1e0BwKWwsvIRnPGqiJaMIDg1rXiebqJb1/eF9o10ycto33toV
 gDIhhQAWuWqaE8U7RGWIIzNhW0LzmUWVZtJ5LAmCwEv2FyK3J7AMywsksw14jB/h1KiV5d9w/BF
 IjLojBquFqnX1ai5L4UehS4n0WIRvKf0SE1dVVSDc5YWh10CCR3h8oS6p2reBMqqA4HhA1TYA/x
 prd3ARlwUhl/uJOWrRlxlo5nGD7AcSOSB87l5Pd/qNs48tOTH/JqwQzAuYx0JpJCdnLbADfzaIs
 I+XhooP93LjRB4EQiY9CJIwYoNSjkFGT6ZQwKKhLxb2/wBby+J0PAlQpiwWlA3oGqgvmIrvhXwO
 RXvwxOkwi44aY89K7JWfRH9mqm1RR49yb+seB18q91iTyAiVBJTrQzlAFpjPC+59lTgwEON8PKr
 Qwmny60s1TfzvMrN6mg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 clxscore=1011 impostorscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_121919_777074_689FE5C3 
X-CRM114-Status: GOOD (  33.39  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 2 Nov 2026 17:23:30 +0800
santino.wang <santino.wang@mediatek.com> wrote:

> From: Santino Wang <santino.wang@mediatek.com>
>=20
> A page with repeated corrected errors is likely to fail. Count the
> corrected errors per page in a leaky bucket and retire the page with
> memory_failure() when the count reaches a threshold. The bucket decays
> over time, and its threshold, decay interval and the number of tracked
> pages are configurable through sysfs.

Other than registering on your own record (that replicates
the standard one as far as I can tell) what does this bring you over
the stuff that edac provides already or can be done easily in
userspace? (where in my view most policy related stuff should be!)
=46rom my initial read I think this patch set needs a lot more
explanatory description and comparison with existing infrastructure.
Not to mention send it to the edac maintainers and mailing list.

Just so they are in the loop I've +cc Tony and Borislav

Jonathan

>=20
> Signed-off-by: Santino Wang <santino.wang@mediatek.com>
> ---
>  drivers/soc/mediatek/dram-ecc/core/Makefile   |   1 +
>  .../mediatek/dram-ecc/core/ghes_notifier.c    |   2 +
>  .../dram-ecc/core/policy/leaky_bucket.c       | 277 ++++++++++++++++++
>  .../mediatek/dram-ecc/core/policy/policy.c    |   9 +-
>  .../mediatek/dram-ecc/core/policy/policy.h    |   4 +
>  5 files changed, 292 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/soc/mediatek/dram-ecc/core/policy/leaky_bucke=
t.c
>=20
> diff --git a/drivers/soc/mediatek/dram-ecc/core/Makefile b/drivers/soc/me=
diatek/dram-ecc/core/Makefile
> index d8d878f321d4..7c973831c9ef 100644
> --- a/drivers/soc/mediatek/dram-ecc/core/Makefile
> +++ b/drivers/soc/mediatek/dram-ecc/core/Makefile
> @@ -12,6 +12,7 @@ mtk_dram_ecc-y :=3D \
>  	policy/policy.o \
>  	policy/containment.o \
>  	policy/storm_protection.o \
> +	policy/leaky_bucket.o \
>  	policy/address_range.o
> =20
>  CFLAGS_trace.o :=3D -I$(src)
> diff --git a/drivers/soc/mediatek/dram-ecc/core/ghes_notifier.c b/drivers=
/soc/mediatek/dram-ecc/core/ghes_notifier.c
> index 633bf89e2231..a010ca652e86 100644
> --- a/drivers/soc/mediatek/dram-ecc/core/ghes_notifier.c
> +++ b/drivers/soc/mediatek/dram-ecc/core/ghes_notifier.c
> @@ -28,6 +28,7 @@
>  #include "mtk_dram_ecc_event.h"
>  #include "ghes_notifier.h"
>  #include "counters.h"
> +#include "policy/policy.h"
>  #include "trace.h"
> =20
>  static ATOMIC_NOTIFIER_HEAD(mtk_dram_ecc_notifier_chain);
> @@ -249,6 +250,7 @@ static int mtk_ghes_vendor_cb(struct notifier_block *=
nb, unsigned long severity,
>  		spin_unlock(&addr_lock);
>  		trace_mtk_dram_ecc_ce(evt.spa, evt.channel, evt.subchannel, evt.rank,
>  				      evt.bank, evt.row, evt.column);
> +		leaky_bucket_hit(evt.spa);
>  		ret =3D atomic_notifier_call_chain(&mtk_dram_ecc_notifier_chain,
>  						 MTK_DRAM_ECC_NOTIFY_CE, &evt);
>  		if (ret =3D=3D NOTIFY_BAD)
> diff --git a/drivers/soc/mediatek/dram-ecc/core/policy/leaky_bucket.c b/d=
rivers/soc/mediatek/dram-ecc/core/policy/leaky_bucket.c
> new file mode 100644
> index 000000000000..a51793d53efb
> --- /dev/null
> +++ b/drivers/soc/mediatek/dram-ecc/core/policy/leaky_bucket.c
> @@ -0,0 +1,277 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2026 MediaTek Inc.
> + */
> +#include <linux/kobject.h>
> +#include <linux/sysfs.h>
> +#include <linux/string.h>
> +#include <linux/hashtable.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +#include <linux/workqueue.h>
> +#include <linux/mm.h>
> +#include <linux/jiffies.h>
> +#include <linux/errno.h>
> +#include <linux/printk.h>
> +
> +#include "../counters.h"
> +#include "../mtk_dram_ecc.h"
> +#include "../trace.h"
> +#include "policy.h"
> +
> +/* ------------------------------------------------------------------ */
> +/* Per-page counter table                                               =
*/
> +/* ------------------------------------------------------------------ */
> +
> +struct lb_entry {
> +	struct hlist_node node;
> +	u64 pfn;
> +	u32 count;
> +};
> +
> +#define LB_HASH_BITS 8   /* 256 buckets */
> +
> +static DECLARE_HASHTABLE(lb_table, LB_HASH_BITS);
> +static DEFINE_SPINLOCK(lb_lock);
> +static unsigned int lb_tracked;  /* number of entries currently in table=
 */
> +
> +/* ------------------------------------------------------------------ */
> +/* Decay timer (delayed_work)                                           =
*/
> +/* ------------------------------------------------------------------ */
> +
> +static struct delayed_work lb_decay_work;
> +
> +static void lb_decay_fn(struct work_struct *work)
> +{
> +	struct lb_entry *e;
> +	struct hlist_node *tmp;
> +	unsigned int bkt;
> +	bool reschedule =3D false;
> +
> +	spin_lock(&lb_lock);
> +	hash_for_each_safe(lb_table, bkt, tmp, e, node) {
> +		if (e->count > 0)
> +			e->count--;
> +		if (e->count =3D=3D 0) {
> +			hash_del(&e->node);
> +			kfree(e);
> +			lb_tracked--;
> +		} else {
> +			reschedule =3D true;
> +		}
> +	}
> +	spin_unlock(&lb_lock);
> +
> +	if (reschedule)
> +		schedule_delayed_work(&lb_decay_work,
> +				      secs_to_jiffies(mtk_ecc_data.lb_decay_interval_sec));
> +}
> +
> +/* ------------------------------------------------------------------ */
> +/* leaky_bucket_hit - called from ghes_notifier.c on every CE event    */
> +/* ------------------------------------------------------------------ */
> +
> +void leaky_bucket_hit(u64 spa)
> +{
> +	u64 pfn =3D spa >> PAGE_SHIFT;
> +	struct lb_entry *e;
> +	bool found =3D false;
> +	bool start_timer =3D false;
> +	bool retired =3D false;
> +	u32 count =3D 0;
> +	int ret;
> +
> +	spin_lock(&lb_lock);
> +
> +	hash_for_each_possible(lb_table, e, node, pfn) {
> +		if (e->pfn =3D=3D pfn) {
> +			e->count++;
> +			count =3D e->count;
> +			found =3D true;
> +			break;
> +		}
> +	}
> +
> +	if (!found) {
> +		if (lb_tracked < mtk_ecc_data.lb_max_tracked) {
> +			e =3D kzalloc_obj(*e, GFP_ATOMIC);
> +			if (e) {
> +				e->pfn   =3D pfn;
> +				e->count =3D 1;
> +				count    =3D 1;
> +				hash_add(lb_table, &e->node, pfn);
> +				lb_tracked++;
> +				/* start timer only when table was empty */
> +				if (lb_tracked =3D=3D 1)
> +					start_timer =3D true;
> +			}
> +		}
> +	}
> +
> +	spin_unlock(&lb_lock);
> +
> +	if (start_timer)
> +		schedule_delayed_work(&lb_decay_work,
> +				      secs_to_jiffies(mtk_ecc_data.lb_decay_interval_sec));
> +
> +	if (count >=3D mtk_ecc_data.lb_threshold && mtk_ecc_data.lb_threshold >=
 0) {
> +		ret =3D memory_failure(pfn, 0);
> +		if (ret =3D=3D 0 || ret =3D=3D -EHWPOISON) {
> +			mtk_dram_ecc_record_retired_page(pfn,
> +							 MTK_DRAM_ECC_RETIRE_CE,
> +							 ret);
> +			retired =3D true;
> +		} else {
> +			pr_warn_ratelimited("mtk-dram-ecc: CE page isolation failed: pfn=3D0x=
%llx ret=3D%d\n",
> +					    pfn, ret);
> +		}
> +	}
> +
> +	trace_mtk_dram_ecc_page_retire(pfn, count, mtk_ecc_data.lb_threshold,
> +				       retired);
> +}
> +
> +/* ------------------------------------------------------------------ */
> +/* sysfs                                                                =
*/
> +/* ------------------------------------------------------------------ */
> +
> +static struct kobject *leaky_bucket_kobj;
> +
> +#define MTK_ECC_LB_THRESHOLD_MAX		10000U
> +#define MTK_ECC_LB_DECAY_INTERVAL_MAX	86400U
> +#define MTK_ECC_LB_MAX_TRACKED_MAX	16U
> +
> +static ssize_t threshold_show(struct kobject *kobj, struct kobj_attribut=
e *attr,
> +			      char *buf)
> +{
> +	return sysfs_emit(buf, "%u\n", mtk_ecc_data.lb_threshold);
> +}
> +
> +static ssize_t threshold_store(struct kobject *kobj, struct kobj_attribu=
te *attr,
> +			       const char *buf, size_t count)
> +{
> +	u32 val;
> +	int ret;
> +
> +	ret =3D kstrtou32(buf, 0, &val);
> +	if (ret)
> +		return ret;
> +	if (val =3D=3D 0)
> +		val =3D MTK_ECC_LB_THRESHOLD_DEFAULT;
> +	else if (val > MTK_ECC_LB_THRESHOLD_MAX)
> +		return -EINVAL;
> +
> +	mtk_ecc_data.lb_threshold =3D val;
> +	return count;
> +}
> +
> +static ssize_t decay_interval_sec_show(struct kobject *kobj,
> +				       struct kobj_attribute *attr, char *buf)
> +{
> +	return sysfs_emit(buf, "%u\n", mtk_ecc_data.lb_decay_interval_sec);
> +}
> +
> +static ssize_t decay_interval_sec_store(struct kobject *kobj,
> +					struct kobj_attribute *attr,
> +					const char *buf, size_t count)
> +{
> +	u32 val;
> +	int ret;
> +
> +	ret =3D kstrtou32(buf, 0, &val);
> +	if (ret)
> +		return ret;
> +	if (val =3D=3D 0)
> +		val =3D MTK_ECC_LB_DECAY_INTERVAL_DEFAULT;
> +	else if (val > MTK_ECC_LB_DECAY_INTERVAL_MAX)
> +		return -EINVAL;
> +
> +	mtk_ecc_data.lb_decay_interval_sec =3D val;
> +	return count;
> +}
> +
> +static ssize_t max_tracked_show(struct kobject *kobj,
> +				struct kobj_attribute *attr, char *buf)
> +{
> +	return sysfs_emit(buf, "%u\n", mtk_ecc_data.lb_max_tracked);
> +}
> +
> +static ssize_t max_tracked_store(struct kobject *kobj,
> +				 struct kobj_attribute *attr,
> +				 const char *buf, size_t count)
> +{
> +	u32 val;
> +	int ret;
> +
> +	ret =3D kstrtou32(buf, 0, &val);
> +	if (ret)
> +		return ret;
> +	if (val =3D=3D 0)
> +		val =3D MTK_ECC_LB_MAX_TRACKED_DEFAULT;
> +	else if (val > MTK_ECC_LB_MAX_TRACKED_MAX)
> +		return -EINVAL;
> +
> +	mtk_ecc_data.lb_max_tracked =3D val;
> +	return count;
> +}
> +
> +static struct kobj_attribute threshold_attr =3D
> +	__ATTR(threshold, 0644, threshold_show, threshold_store);
> +static struct kobj_attribute decay_interval_sec_attr =3D
> +	__ATTR(decay_interval_sec, 0644, decay_interval_sec_show, decay_interva=
l_sec_store);
> +static struct kobj_attribute max_tracked_attr =3D
> +	__ATTR(max_tracked, 0644, max_tracked_show, max_tracked_store);
> +
> +static struct attribute *attrs[] =3D {
> +	&threshold_attr.attr,
> +	&decay_interval_sec_attr.attr,
> +	&max_tracked_attr.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group group =3D {
> +	.attrs =3D attrs,
> +};
> +
> +/* ------------------------------------------------------------------ */
> +/* init / exit                                                          =
*/
> +/* ------------------------------------------------------------------ */
> +
> +int leaky_bucket_init(struct kobject *parent)
> +{
> +	int ret;
> +
> +	hash_init(lb_table);
> +	INIT_DELAYED_WORK(&lb_decay_work, lb_decay_fn);
> +
> +	leaky_bucket_kobj =3D kobject_create_and_add("leaky_bucket", parent);
> +	if (!leaky_bucket_kobj)
> +		return -ENOMEM;
> +
> +	ret =3D sysfs_create_group(leaky_bucket_kobj, &group);
> +	if (ret) {
> +		kobject_put(leaky_bucket_kobj);
> +		return ret;
> +	}
> +	return 0;
> +}
> +
> +void leaky_bucket_exit(struct kobject *parent)
> +{
> +	struct lb_entry *e;
> +	struct hlist_node *tmp;
> +	unsigned int bkt;
> +
> +	cancel_delayed_work_sync(&lb_decay_work);
> +
> +	spin_lock(&lb_lock);
> +	hash_for_each_safe(lb_table, bkt, tmp, e, node) {
> +		hash_del(&e->node);
> +		kfree(e);
> +	}
> +	lb_tracked =3D 0;
> +	spin_unlock(&lb_lock);
> +
> +	sysfs_remove_group(leaky_bucket_kobj, &group);
> +	kobject_put(leaky_bucket_kobj);
> +}
> diff --git a/drivers/soc/mediatek/dram-ecc/core/policy/policy.c b/drivers=
/soc/mediatek/dram-ecc/core/policy/policy.c
> index ecd0a430de6d..5a4181b8de7d 100644
> --- a/drivers/soc/mediatek/dram-ecc/core/policy/policy.c
> +++ b/drivers/soc/mediatek/dram-ecc/core/policy/policy.c
> @@ -26,12 +26,18 @@ int mtk_dram_ecc_policy_init(struct device *dev)
>  	if (ret)
>  		goto err_containment;
> =20
> -	ret =3D address_range_init(policy_kobj);
> +	ret =3D leaky_bucket_init(policy_kobj);
>  	if (ret)
>  		goto err_storm;
> =20
> +	ret =3D address_range_init(policy_kobj);
> +	if (ret)
> +		goto err_leaky_bucket;
> +
>  	return 0;
> =20
> +err_leaky_bucket:
> +	leaky_bucket_exit(policy_kobj);
>  err_storm:
>  	storm_protection_exit(policy_kobj);
>  err_containment:
> @@ -44,6 +50,7 @@ int mtk_dram_ecc_policy_init(struct device *dev)
>  void mtk_dram_ecc_policy_exit(struct device *dev)
>  {
>  	address_range_exit(policy_kobj);
> +	leaky_bucket_exit(policy_kobj);
>  	storm_protection_exit(policy_kobj);
>  	containment_exit(policy_kobj);
>  	kobject_put(policy_kobj);
> diff --git a/drivers/soc/mediatek/dram-ecc/core/policy/policy.h b/drivers=
/soc/mediatek/dram-ecc/core/policy/policy.h
> index a535e2ce0e6d..c9926cbc11be 100644
> --- a/drivers/soc/mediatek/dram-ecc/core/policy/policy.h
> +++ b/drivers/soc/mediatek/dram-ecc/core/policy/policy.h
> @@ -13,6 +13,10 @@ void containment_exit(struct kobject *parent);
>  int storm_protection_init(struct kobject *parent);
>  void storm_protection_exit(struct kobject *parent);
> =20
> +int leaky_bucket_init(struct kobject *parent);
> +void leaky_bucket_exit(struct kobject *parent);
> +void leaky_bucket_hit(u64 spa);
> +
>  int address_range_init(struct kobject *parent);
>  void address_range_exit(struct kobject *parent);
> =20


