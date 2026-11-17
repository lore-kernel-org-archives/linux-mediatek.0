Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06ADF606A31C
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 15:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bfbWytQ2;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dAzwO2sp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gs0IFOEB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rvqbXhDVk4eAuTewQMcNRxrpZoO2UE6gkhrkk4bilQ0=; b=bfbWytQ2Eyb0R1
	yu7QcnyjfzAmSRcEfEIm3wcpATelGrx7NM7LnXDyvVfa+9THj4yTEOdXSb3ArQJM6R6meydy1krCw
	PwV/mrkB9tyWsbydMMrfqN41eW91xeWbnvoxb7J38LlMO469Qdn0qyeWI6bjB/JvvsCsYj2M1C/SG
	ak0Eb815sPwKgh9qaMXUEXINF2vTJupefD5fxue23p480ZeveVQRY3KFbRZvyBxX2zJipqH92NW2g
	I8S1qvcM2ChxQzFV6B1LwGtYmPn3MVmg2VdsZ1mr9KjtERagVKp3lFcyhfgMjhPWGfm7cghIxtE28
	OgDBddMOB9ALpV7vW1jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTLAF-00000006Iuw-2IpN;
	Tue, 17 Nov 2026 15:32:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTLAB-00000006Itc-1hXO
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Nov 2026 15:32:06 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHFSb0g2555450
	for <linux-mediatek@lists.infradead.org>; Tue, 17 Nov 2026 15:32:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rvqbXhDVk4eAuTewQMcNRxrpZoO2UE6gkhrkk4bilQ0=; b=dAzwO2spMjFA52YP
	lWfm1fMR9YkERhc8Qme5ieeIMcKp8DTbFKHz3g+J/qI9d4lfz9FKE1n5G7LZFAfk
	oeMOa3vGAFr9C7IU7MBa3dnNMI/IjnjNURZByNs6v03+je/pSd9LhyQzrPn68mTh
	oRIjUzuMixpoZZ/WEHhriOKux5nPPCjxGGXHmlkCGFC7Dim4cRaPXHqcx7CZkPm/
	ox+dHFzPKc4bNVncWmkCcruNWtEGvLtJq5esi8U+Rt5ipLgEN6eZ1ZYaebrNwz5o
	JpUTEEMGES6T9LIVpjW3l7XGajRTzhPAQuNmxRpxjtugzbcYICFHS5ih+l7nBqzg
	eMHVMg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0c7h3g24-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Tue, 17 Nov 2026 15:32:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f33438950so474608285a.1
        for <linux-mediatek@lists.infradead.org>; Tue, 17 Nov 2026 07:32:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794929521; cv=none;
        d=google.com; s=arc-20260327;
        b=fauQ/MU4EUYElpwfyZV+HYeTwMD64nQmErE39fWUkLqTeCn0tfqakfErfUR1oYEoNQ
         +Fl5T1HYLTzLsOgdk56C5bfO6nZ+9HJj6yqnv/Xei1SsaogaDeko/G9/3W0La4OCZKFI
         sKj6ivNgEU21lw7j1cu/psGxutHpb14L7R0xNWDpXThmyRaF07q4M4lgDhI+sywfdF7Y
         XWmnQl5LNOxwVYGjlMpByprWx9NGSBmrSZ4RuvrQR0qCEnr3s91pRco+8lzzWczbEQwn
         9UWrHuBwzvGMQnzvOvqjhUbMUUoFnYgWvIj9HmusdsGqFKNrHyKOOJEvH962mz1q/EEG
         fyJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rvqbXhDVk4eAuTewQMcNRxrpZoO2UE6gkhrkk4bilQ0=;
        fh=ljr194unDgb1XJSwrgLi9qdEXtxE5qgKkidrHAkQSHc=;
        b=h4O/2r5c99Z+vkFkJyWO0FYGwW4hsuFTF2qTmTqt29vI4zjVtFsS+yihHMTijRmBKL
         G/cBcV4FzxKO5S0dY4VINkfcpvptQWs6mWzkmWiozjx2h3/TQYNdQhYNYRf52OI5skcF
         VVOB5xsgg+J4AMoxNox0xpfr3dgXfTDcY8cwmCZ24CPfJgG/iffhO/qe9P8yGCQR9f5M
         IqR0KkfZm00I/iH4uyjnuZazH/M6P9511YCnaNq8b4Q+G1zPRIYG7jUicMx26A6FT9CG
         gQNZSE83QD0E5nqeJ6eo2VQLPR6tqhrJmad7gDWvcQENuL04DkjCkOJ/UJwuDrQb94NI
         wQ8g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794929521; x=1795534321; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rvqbXhDVk4eAuTewQMcNRxrpZoO2UE6gkhrkk4bilQ0=;
        b=gs0IFOEB/UPBOxjXz6EWJJOvdqn0ID8XzgDOmihQvb3g5OOdDhGnn+SrWcQslW1IE+
         26NB+uRiregRTWP7OC5Ymw12hxldAK+stKuX8ZlTTFf7OaOTxXYmytKPpwpewsorAW+E
         uMWs9+9iZzHILe6iyfBA96+UXsZZP3uXO1uTCDkY5JEkZ8KA/k1OKdiezC4th46fFow7
         WE+SNHK3Mn4IskrAFkitihIvL1Pda9hmfSNMSnnzRf0yEuBMct1Jv/R75SVGIUch0fW1
         uqvScXl7CZDoCGj4ydL9fN82a5T0So69VE4ur2cMZvy5Pvbc3VGt/VT1sP+/PncFWITb
         5bvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794929521; x=1795534321;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rvqbXhDVk4eAuTewQMcNRxrpZoO2UE6gkhrkk4bilQ0=;
        b=XehntLyEvbopXm46ZwZQO5/X6PeYWt8M67QBcV2IdbQszOSqBApjBlNh0yUEQKXw0+
         N2aW6Kk5bTHLiBVa9qwJH5kDv6UM5VqrEC8SdIr4STPi2rxS9obe+KbaC3VqicaZ7iVA
         hMZeFzq2wtJyMPrqVA+NJt7R82mXIcl4uhrOt6VuXZledBXURZ9CBiuEFeGNnwR5GyRz
         rNXyKUXx6kBKWDdrlhJJDC1Ew4sXPJ1anfAA2+GTnWY6qf/jm2Gm0BgYVKTtLjQ2LCjV
         u2KwwqWYPr7fAFzVoIKT6rCJPGaD7lewpDFmaEiB5uA1QfwXjivOM3MReJ5uT539VmbQ
         JViA==
X-Forwarded-Encrypted: i=1; AL+hErGt7jXDxzDgXkBnUI3m4/I0y/4CRnCsCmvaIQe/zqNQVl6/DVZlemsbKHTrPxgAdG/gSd6Dt06uJOVUTOH+6w==@lists.infradead.org
X-Gm-Message-State: APuU4Z+0OuWYoWUZnFqrME2H9OgWr0mrJlPGwpnry9+4kyaPkYUOq8g/
	zwqKdng/PR4tIs2ycldxE9BMKuxrvuyqKBDGag30TCxqle/aFyjbMP/2JQknSyAoS4XNFZXIBg5
	CRO41Z5SSglje6v3vdo/7pKK0onOFQmaBshpCZMSxGT4WEWUS7msWmNU82n7CxJt7uz8K7NMRD+
	gmAlG95NPle4WudYuBsR0qeXJM/21e5A/cHEVRHOpKfrfJZx1jSA==
X-Gm-Gg: AYBFou1G6Bi8zGrq0RK3ehdMywJ4IE6wqLzqFv0KnYq2/7l/KCQtgd4J2WcxMxz1J9o
	e1dB0nsQX1mO5wXAUMUriV+kgt3Ns0c/2k0Y/4cQfoU4QlNqtpuVN0zX8V5UD33PPK12GNgy1m7
	KvUDUFynVycJD7RhSVzwl4s+RIVTApYes4MPxboeV5TT3Rv2PGJDkA7XYkEMW47e83JerEjj/fO
	DiWl9cZRm3U6CF1lopSrteOdQQhF/9CujfYybZvPZuuMggoQAKugrESD3tlQj+4cWQAu9WWGE6L
X-Received: by 2002:a05:620a:2548:b0:949:7b51:2dc1 with SMTP id af79cd13be357-949994ae281mr2619285a.2.1794929521015;
        Tue, 17 Nov 2026 07:32:01 -0800 (PST)
X-Received: by 2002:a05:620a:2548:b0:949:7b51:2dc1 with SMTP id
 af79cd13be357-949994ae281mr2612285a.2.1794929520342; Tue, 17 Nov 2026
 07:32:00 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261117-t9xx_driver_v1-v12-0-e181b616b820@compal.com> <20261117-t9xx_driver_v1-v12-2-e181b616b820@compal.com>
In-Reply-To: <20261117-t9xx_driver_v1-v12-2-e181b616b820@compal.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 16:31:48 +0100
X-Gm-Features: AclHuK_lDMCUZMYyFfncaim5uPRYhhiPBMrtwbTDrTdo14SKGBiqnZxhh1KjEuo
Message-ID: <CAFEp6-2Ru8=dMA=ra3r+ShvxWoLAa0i-xw0e8vhQ+QxRah3f3Q@mail.gmail.com>
Subject: Re: [PATCH net-next v12 2/6] net: wwan: t9xx: Add control plane
 transaction layer framework
To: jackbb_wu@compal.com
Cc: Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Wen-Zhi Huang <wen-zhi.huang@mediatek.com>,
        Shi-Wei Yeh <shi-wei.yeh@mediatek.com>,
        Minano Tseng <Minano.tseng@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Robert Yu <robert_yu@compal.com>, Jeff Chang <Jeff_Chang@compal.com>,
        Eric Dumazet <edumazet@kernel.org>, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 7lkVkrDkY6cEllrl345mazz7KwRk6yzh
X-Proofpoint-ORIG-GUID: 7lkVkrDkY6cEllrl345mazz7KwRk6yzh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA2MSBTYWx0ZWRfX0dVy6trRaRJT
 7dqU3GyAttTROrGRYXrio77K8EHGfeYgEhGb98b6Ctdhc2EZljq08NlF5eZNofNhc104P4x2ntp
 3QjfNbVn0vqGJfTniIqpW1VgmNUDC66ctUgBtZtZS703w6oF+/m+HE3gsxoTJTkPdeGO2H49CeD
 61mUOTlKG0eORja+FwjOUlj7prPRYLAVB8Y3VIQQVa0X1DXDUuxNgD4uz2k6c9Dzs/uGTGssKXq
 ccrzIaTO5nUiBoOpYfUtw9K8jCKFvPm2gb/HOaEn1uJd4Glsbs0wCJkif+hwhBoIshe3NEnm64D
 wa//sIaDt7qiZi0z7bl1xH1N5WGz+ZN+cUJLL+Z+xkbHv0gEeX6ZaUAm51Ygxw7suUjz9zUXQBj
 vPPefncgWOFvl4yyVlZsvt1XEsjwfl0Mi+YUSgI6PpbCMoAOb0C4nqlMiWp41uPrYrC2NmrQRDD
 TT7rIpPFuZQzn6/5ntg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA2MSBTYWx0ZWRfX0bu+X6g8gUQA
 /IzzrRS3RYDz4MR7cnNDD2MNbZMfdMGXx/JqvYk8mBg42a6k9G8pwv/IqEJUIsXmR93j+RhtI3B
 wfHI4gWhCLgzvv+2VsdkXmZQRJHjo6M=
X-Authority-Analysis: v=2.4 cv=bobZl0ai c=1 sm=1 tr=0 ts=6afc7371 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=3D83DlupAAAA:8
 a=qgzm9M8pbGeJEq2Y9kQA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=LLo2LcjZcqwTTUQ_I4Ao:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_073203_557390_26F264E4 
X-CRM114-Status: GOOD (  29.87  )
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

On Tue, Nov 17, 2026 at 11:51=E2=80=AFAM Jack Wu via B4 Relay
<devnull+jackbb_wu.compal.com@kernel.org> wrote:
>
> From: Jack Wu <jackbb_wu@compal.com>
>
> Introduce the control plane and transaction layer framework
> for the T9XX WWAN driver. This patch adds the core data
> structures (mtk_ctrl_blk, mtk_ctrl_trans) and initialization
> entry points that subsequent patches build upon.
>
> The control plane block (ctrl_blk) starts out with only the
> device back-pointer and an opaque pointer to the transport
> context; later patches add the port layer and FSM hooks to
> it. The actual DMA engine and TX/RX service
> implementations are added in subsequent patches, and
> mtk_ctrl_init() and mtk_ctrl_exit() get their first callers
> there, in pcie/mtk_trans_ctrl.c.
>
> Signed-off-by: Jack Wu <jackbb_wu@compal.com>
> ---
>  drivers/net/wwan/t9xx/Makefile              |  1 +
>  drivers/net/wwan/t9xx/mtk_ctrl_plane.c      | 45 +++++++++++++++++++++++=
++++++
>  drivers/net/wwan/t9xx/mtk_ctrl_plane.h      | 21 ++++++++++++++
>  drivers/net/wwan/t9xx/mtk_dev.h             |  3 ++
>  drivers/net/wwan/t9xx/pcie/mtk_pci.c        |  1 +
>  drivers/net/wwan/t9xx/pcie/mtk_trans_ctrl.h | 19 ++++++++++++
>  6 files changed, 90 insertions(+)
>
> diff --git a/drivers/net/wwan/t9xx/Makefile b/drivers/net/wwan/t9xx/Makef=
ile
> index bd6063c85c2b..0a07507f1ddf 100644
> --- a/drivers/net/wwan/t9xx/Makefile
> +++ b/drivers/net/wwan/t9xx/Makefile
> @@ -6,4 +6,5 @@ ccflags-y +=3D -I$(src)
>  obj-$(CONFIG_MTK_T9XX) +=3D mtk_t9xx.o
>
>  mtk_t9xx-y :=3D \
> +       mtk_ctrl_plane.o \
>         pcie/mtk_pci.o
> diff --git a/drivers/net/wwan/t9xx/mtk_ctrl_plane.c b/drivers/net/wwan/t9=
xx/mtk_ctrl_plane.c
> new file mode 100644
> index 000000000000..18f0573ac653
> --- /dev/null
> +++ b/drivers/net/wwan/t9xx/mtk_ctrl_plane.c
> @@ -0,0 +1,45 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2022, MediaTek Inc.
> + */
> +
> +#include <linux/device.h>
> +
> +#include "mtk_ctrl_plane.h"
> +
> +/**
> + * mtk_ctrl_init() - Initialize the control plane block.
> + * @mdev: Pointer to the MTK modem device.
> + *
> + * Allocates and initializes the control plane block
> + * associated with @mdev.  Runs once per bind; the allocation is
> + * devres managed and is released at unbind, not by
> + * mtk_ctrl_exit().
> + *
> + * Return: 0 on success, -ENOMEM on allocation failure.
> + */
> +int mtk_ctrl_init(struct mtk_md_dev *mdev)
> +{
> +       struct mtk_ctrl_blk *ctrl_blk;
> +
> +       ctrl_blk =3D devm_kzalloc(mdev->dev, sizeof(*ctrl_blk), GFP_KERNE=
L);
> +       if (!ctrl_blk)
> +               return -ENOMEM;
> +
> +       ctrl_blk->mdev =3D mdev;
> +       mdev->ctrl_blk =3D ctrl_blk;
> +
> +       return 0;
> +}
> +
> +/**
> + * mtk_ctrl_exit() - Clean up the control plane block.
> + * @mdev: Pointer to the MTK modem device.
> + *
> + * Clears the control plane block pointer. The allocation
> + * itself is managed by devres and freed on driver detach.
> + */
> +void mtk_ctrl_exit(struct mtk_md_dev *mdev)
> +{
> +       mdev->ctrl_blk =3D NULL;
> +}
> diff --git a/drivers/net/wwan/t9xx/mtk_ctrl_plane.h b/drivers/net/wwan/t9=
xx/mtk_ctrl_plane.h
> new file mode 100644
> index 000000000000..46f1ab9f0551
> --- /dev/null
> +++ b/drivers/net/wwan/t9xx/mtk_ctrl_plane.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: GPL-2.0-only
> + *
> + * Copyright (c) 2022, MediaTek Inc.
> + */
> +
> +#ifndef __MTK_CTRL_PLANE_H__
> +#define __MTK_CTRL_PLANE_H__
> +
> +#include <linux/skbuff.h>

Is it actually unused here?

> +
> +#include "mtk_dev.h"
> +
> +struct mtk_ctrl_blk {
> +       struct mtk_md_dev *mdev;
> +       void *ctrl_hw_priv;
> +};
> +
> +int mtk_ctrl_init(struct mtk_md_dev *mdev);
> +void mtk_ctrl_exit(struct mtk_md_dev *mdev);
> +
> +#endif /* __MTK_CTRL_PLANE_H__ */
> diff --git a/drivers/net/wwan/t9xx/mtk_dev.h b/drivers/net/wwan/t9xx/mtk_=
dev.h
> index fc25418bb957..ff3cbaa4329e 100644
> --- a/drivers/net/wwan/t9xx/mtk_dev.h
> +++ b/drivers/net/wwan/t9xx/mtk_dev.h
> @@ -28,12 +28,15 @@ enum mtk_dev_evt_d2h {
>         DEV_EVT_D2H_ASYNC_HS_NOTIFY_MD  =3D BIT(6),
>  };
>
> +struct mtk_ctrl_blk;
> +
>  /* mtk_md_dev defines the structure of MTK modem device */
>  struct mtk_md_dev {
>         struct device *dev;
>         void *hw_priv;
>         u32 hw_ver;
>         char dev_str[MTK_DEV_STR_LEN];
> +       struct mtk_ctrl_blk *ctrl_blk;
>  };
>
>  #endif /* __MTK_DEV_H__ */
> diff --git a/drivers/net/wwan/t9xx/pcie/mtk_pci.c b/drivers/net/wwan/t9xx=
/pcie/mtk_pci.c
> index cf59038f0906..3dd8efa374ff 100644
> --- a/drivers/net/wwan/t9xx/pcie/mtk_pci.c
> +++ b/drivers/net/wwan/t9xx/pcie/mtk_pci.c
> @@ -13,6 +13,7 @@
>  #include <linux/module.h>
>
>  #include "mtk_dev.h"
> +#include "mtk_trans_ctrl.h"
>  #include "mtk_pci.h"
>  #include "mtk_pci_reg.h"
>
> diff --git a/drivers/net/wwan/t9xx/pcie/mtk_trans_ctrl.h b/drivers/net/ww=
an/t9xx/pcie/mtk_trans_ctrl.h
> new file mode 100644
> index 000000000000..9b42f33bd008
> --- /dev/null
> +++ b/drivers/net/wwan/t9xx/pcie/mtk_trans_ctrl.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0-only
> + *
> + * Copyright (c) 2022, MediaTek Inc.
> + */
> +
> +#ifndef __MTK_TRANS_CTRL_H__
> +#define __MTK_TRANS_CTRL_H__
> +
> +#include <linux/list.h>
> +#include <linux/skbuff.h>
> +#include <linux/types.h>

Same question.

> +
> +#include "mtk_dev.h"
> +
> +struct mtk_ctrl_trans {
> +       struct mtk_md_dev *mdev;
> +};
> +
> +#endif
>
> --
> 2.34.1
>
>

