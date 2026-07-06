Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24EBFC43458
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jul 2026 15:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+OnMOn2/de6czvKsT65QKA7vIysNRqWUd1S/71D1Jas=; b=MfVorKoLcJTKiB19Ty0nTWKl/E
	9ELqETm8BF6h6Fy3EKQSm8K8qA6xVlgkMSmaKBEa2TVHvJlbZmMOb0zfeFBtE26AT1LAeorOJZsvM
	7nTWmAln3c/2eL9659nt9A382hvacJCs9hX6aQW3b/TVCIiPUXthl3hT8iD9JT7HjUzJGtxt6h/dS
	rHgDfb+mEofvDNLtdTCI80iLT7h3fZ7ZKsoIp89Wxg2O1MqWLIvF7Gvzg2GzTFLUJPM/nX2dNG2Cz
	mv603btEA2f1kPq5yF+vnI76ym8M2ku+O2zLdNoDIDW4K6y1HVy8Gw1GPC2MDhQT2P2n5p+TTDNuC
	msBMRe3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wglWj-0000000CwD9-2s8u;
	Mon, 06 Jul 2026 15:46:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wglWg-0000000CwC4-2z3F
	for linux-mediatek@lists.infradead.org;
	Mon, 06 Jul 2026 15:46:31 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF6gg832916
	for <linux-mediatek@lists.infradead.org>; Mon, 6 Jul 2026 15:46:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+OnMOn2/de6czvKsT65QKA7vIysNRqWUd1S/71D1Jas=; b=hXZp1fbz4cz372gL
	swOx37jRUZyhMOJu11R2PHaveWDbkEDuxJtIIw4ZT8oFYwMMK0fEMQd5MDT2KCnP
	XASsVc0hrVC9REAWNI++Jh/oryw7S61DX6jKX1daudC2gs038daj+7xFQQgF988+
	JPH+iDKbsv8dnDthyUtGuJefBq/O8S5tEJ2U4eUOBxCenwg+6OzRVVzZt/AYtFjd
	mh0HyEE8+WxFz8efJ/yINBZoPcjRTpPy6IBmGwV/H+I5Jcx8dZIxnwVKGM4XVHhu
	9fArCoYwqx5Bk9VzTbzuv8X/36v6/sds5G9lYjuxWbzWAvoU9PWrdm/SDU7CBcMz
	tYON5Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a98hgyt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Mon, 06 Jul 2026 15:46:29 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8f0f45415cfso39805356d6.2
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Jul 2026 08:46:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783352789; cv=none;
        d=google.com; s=arc-20260327;
        b=XCcPiOpCUCZSIDzPLiiKp12YteMZKcip1tF3OdOq3ofL4qMKzlKX0OOjUJc88AgjLw
         5zOnPtsGOymhqwmOHmmfwg6jiC/hpzjV7bYreClAWkerUqjP708DRkITQpDfzxAH4P1B
         EdZupBR5lPWdDVqP3zJWt4UUHmskF2Ecy4ZTSILl7KqPtXDFULxbsf6/CIzsOLv934+5
         /tuXXmZkDHR5UAo5vKboAKfkpy30JkI/c6CQJc54vGhthClsAbZcKEz2o8z+LN8nK5D6
         6xZBoqj7hJjhP4Zb3QtbG8xEMK6ORJVR77lETVs42xmTDVtHR1D+rzVFBthMTs/uHGAe
         0hiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+OnMOn2/de6czvKsT65QKA7vIysNRqWUd1S/71D1Jas=;
        fh=obOd52SXTnTqFzEZsJwQQBSecCX8mzv1yXuCrGUfRF0=;
        b=sC2JzIjmcaGMU7Zc1UEkngC8KlRoP0Sjmyisltu80QAOYk0Zmpad2B2Fy9/eNE7koC
         GuEl8ReVDUIyw4nInYTc4l4CMpuPp6TOhGVIvPlqEzhyJJDCa08d54sN18sPAoCDoqhd
         dlHVYXFkt/rSVVQxgWjTihKGhR0Un5iZC1+Bh77FVhbBlNSOH1FFRZVYWQEFKSVtNY29
         8fkYV8mWDVGizdhySIWXgIIMmdJspIDmSxyVaVIajuYo+oEfGtFaWs+THgOdXi3L9jwP
         z/pueOO7N9GVSMiyzd5y7jgZwCQg4pNJEnRdNckUjV581Y7fIb3ZnqaygcuMaCaw4bWf
         D84Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783352789; x=1783957589; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+OnMOn2/de6czvKsT65QKA7vIysNRqWUd1S/71D1Jas=;
        b=OPuvuj86dLThpqE0Hvv0MZrTC7BqopbPJMkZnddjZ3Z40a1CjnI4rVJwTIk+kQr3xk
         woPkK1WGd+XaiPMwydseOwwzukJmVDk5gouuIn4gTjhzXXbfgOIgoxg6qZDT9XG5Sx+E
         3LGiWQtZzgUopTBYF4rky9EroH408SV0H+aORpniBMxnLx6olonceU8WqYZvI+FZhZ0H
         ahuGYhHBuHw9HNxv66kkxS0VwsK2TCV2C72BIz1pZ83/cndmaOIHFb5ITMeg6dJa+0lA
         cCYc+IcM5+nduD3p2sTAn6q5TYqRa7sPG3yzHYWRUkWYYtbcXkDdtOe+Kb+W2qZuglSn
         ER8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783352789; x=1783957589;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+OnMOn2/de6czvKsT65QKA7vIysNRqWUd1S/71D1Jas=;
        b=fDF+oe4jly4hkm3zTN0cMoXG8k56WDGvGsq5r7D0MSwWUVVVBxPJEgboj3hh3OxVmn
         v31tAbFuFOcfmyPjy8BWZxBScJmLoFtLaBaiTCHZfd7PY4Vip3UHtJLrKjMPNLJ8D62Z
         7j0xn2LEsWTequAv7lKh7O3OesNPgJDg07KEkjwM0tLBtUro+DDVRfLNDQoeEesRW/LC
         5vociV4ef3k5FasDfquf5kDPIZR2nwE3KUWwx3M7h1dxn3PZWRRSAzwB33OQev0UZO/n
         voCg+O0KShPSDY4XSBrOR51xI94BDH66eW5vyFXSllwWx9Op6wCvhTjirP9GSgfO6A0e
         Vz3Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr4YwfvLdQitQb5LRmjGGTPLaPl/ssMLJnR4ACgo3LKcVotT7I/g9pr0v11QHP7yTcwL6ysUF+EQBKHcE0MDg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwQvVcUd0L7eQa2lsXcuKqkKpmvqUkCD/K1tWYVU53h4eNxMaRn
	QGr+Ir0zRc6MIQVxbR/zWaXoyrpJJyyQ9u4XRn+c04TTdXSBVpsHZgkycMVZ7/22Y7ZMh56TEUC
	MPhJCbXnTCnFIFeLu0qx4k9c7jy0EbFTye+HW8Q0RFNat1yTSO5X6F8F+0xemJFcYcp8tPMU8Sf
	9tADaQd133D3+BS1Rep3cZxmy3iZdRgZ7idNtwiorrSSs0QNrBvA==
X-Gm-Gg: AfdE7cmNHaiExO5EGGh7iTGaJWw694qJNbB1cqIRsp1dOWAr+ruOVQmzouIvXF92Sjl
	HSqnBsBkBeMasX9qcRGwzZME9Gv9amgrtvk4pMMrdpfaZvSrChOmWE/SeVHFXpV0nxR3M10Enn8
	JcH/FD7jCti3q5RixlRhSFrit4Nb7Y8NGpNoq95Mp0sJtoBTFpd3pR+BQI8jW3+7YMxjSa
X-Received: by 2002:a05:6214:5003:b0:8f3:e97:59b8 with SMTP id 6a1803df08f44-8fcb3d3ee24mr12450896d6.29.1783352788267;
        Mon, 06 Jul 2026 08:46:28 -0700 (PDT)
X-Received: by 2002:a05:6214:5003:b0:8f3:e97:59b8 with SMTP id
 6a1803df08f44-8fcb3d3ee24mr12450156d6.29.1783352787606; Mon, 06 Jul 2026
 08:46:27 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20260624021955epcas1p2ba2fa4eb8bd0aafaf7b46bde2cf524be@epcas1p2.samsung.com>
 <20260624021912.632627-1-cw9316.lee@samsung.com>
In-Reply-To: <20260624021912.632627-1-cw9316.lee@samsung.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 17:46:16 +0200
X-Gm-Features: AVVi8CcBYSP5zyLpt00Q11yUujyWdz_mc32EjqBaIjLdlr5HgDzXa1HvKfgTjLk
Message-ID: <CAPx+jO9=7B4SYyKSwvGqx+zzMsJ+hhFUK_vmU-HNYQZfKv+bdQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: cqhci: Remove unused intmask parameter from cqhci_irq()
To: Chanwoo Lee <cw9316.lee@samsung.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>,
        Asutosh Das <quic_asutoshd@quicinc.com>,
        Ritesh Harjani <ritesh.list@gmail.com>, Ulf Hansson <ulfh@kernel.org>,
        Chaotian Jing <chaotian.jing@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Kamal Dasu <kamal.dasu@broadcom.com>, Al Cooper <alcooperx@gmail.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Haibo Chen <haibo.chen@nxp.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Michal Simek <michal.simek@amd.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "open list:EMMC CMDQ HOST CONTROLLER INTERFACE (CQHCI) DRIVER" <linux-mmc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
        "open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
        "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=SpigLvO0 c=1 sm=1 tr=0 ts=6a4bcdd5 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=hD80L64hAAAA:8 a=EqBXy2bI2-3AcK8LOXQA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE2MCBTYWx0ZWRfXwKS9ueftstKe
 baHfLbbd3rz0nqIyJcSRTdi2itZxHYw8xf5gR1tUOIm/oiaVMmkjoArGJsozeezkxZ3POy59Oa8
 3QLeIiDSJvgoZi08l1RBtzqkjWmjaSxch5505MLzDP8/FVY6T4hTpvVVh0J9J5tcTVwcQjmysy0
 +xUVrucup6lci3feIzOnLEoNyT7Zv1DrBuW3MaALgq/rW/dn4YK/mICqmLry8ID8ayeU5LUrm4F
 jIizYSutftzbrAbAD+VTt7u0KNaUT41mH6B+pPIkMyl0Q5NL/BjmCKugIZUBDmRhk0gYg1vCf6y
 gn1heD1nz0HYf/Enp8pNSRqHK+dGyzhXKLYdZ6PtIXnqVfqLZQVHsGL9R2CFyYufFpUtuMEcNLN
 SAWgym6aNzUHKuzQQSrazhwn/5KEFRgcluT5qryvSBSmJVLht5ywy5hepn7AmvsfptttwpF7VlV
 RpmYDBBu/cUs4RD9Gdg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE2MCBTYWx0ZWRfX4QpCU4d92Ew1
 dJc/4rMw9TMQdXGihaq1k4D1mCnO+EUptAcUIghhm7lhU1VCtSs6ES3uzelfaBoYGTwj7nkFgIw
 hC5TmC9YfSh7JlRapfim4w3wNvqv7fg=
X-Proofpoint-GUID: NmxgTHhTA3Il1STAqDL1g5LUqVy2lU93
X-Proofpoint-ORIG-GUID: NmxgTHhTA3Il1STAqDL1g5LUqVy2lU93
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_084630_757486_781D9AB2 
X-CRM114-Status: GOOD (  19.98  )
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

On Wed, Jun 24, 2026 at 4:20=E2=80=AFAM Chanwoo Lee <cw9316.lee@samsung.com=
> wrote:
>
> The intmask parameter of cqhci_irq() is never used within the function
> body. The function reads the CQHCI interrupt status directly via
> cqhci_readl() and processes interrupts independently of the SDHCI
> intmask value passed by callers.
>
> Signed-off-by: Chanwoo Lee <cw9316.lee@samsung.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/cqhci-core.c       | 3 +--
>  drivers/mmc/host/cqhci.h            | 3 +--
>  drivers/mmc/host/mtk-sd.c           | 2 +-
>  drivers/mmc/host/sdhci-brcmstb.c    | 2 +-
>  drivers/mmc/host/sdhci-esdhc-imx.c  | 2 +-
>  drivers/mmc/host/sdhci-msm.c        | 2 +-
>  drivers/mmc/host/sdhci-of-arasan.c  | 2 +-
>  drivers/mmc/host/sdhci-of-dwcmshc.c | 2 +-
>  drivers/mmc/host/sdhci-pci-core.c   | 2 +-
>  drivers/mmc/host/sdhci-pci-gli.c    | 2 +-
>  drivers/mmc/host/sdhci-tegra.c      | 2 +-
>  drivers/mmc/host/sdhci_am654.c      | 2 +-
>  12 files changed, 12 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/mmc/host/cqhci-core.c b/drivers/mmc/host/cqhci-core.=
c
> index 178277d90c31..98ceb0b9a6d1 100644
> --- a/drivers/mmc/host/cqhci-core.c
> +++ b/drivers/mmc/host/cqhci-core.c
> @@ -819,8 +819,7 @@ static void cqhci_finish_mrq(struct mmc_host *mmc, un=
signed int tag)
>         mmc_cqe_request_done(mmc, mrq);
>  }
>
> -irqreturn_t cqhci_irq(struct mmc_host *mmc, u32 intmask, int cmd_error,
> -                     int data_error)
> +irqreturn_t cqhci_irq(struct mmc_host *mmc, int cmd_error, int data_erro=
r)
>  {
>         u32 status;
>         unsigned long tag =3D 0, comp_status;
> diff --git a/drivers/mmc/host/cqhci.h b/drivers/mmc/host/cqhci.h
> index 3668856531c1..8fbbc48c3f85 100644
> --- a/drivers/mmc/host/cqhci.h
> +++ b/drivers/mmc/host/cqhci.h
> @@ -315,8 +315,7 @@ static inline u32 cqhci_readl(struct cqhci_host *host=
, int reg)
>
>  struct platform_device;
>
> -irqreturn_t cqhci_irq(struct mmc_host *mmc, u32 intmask, int cmd_error,
> -                     int data_error);
> +irqreturn_t cqhci_irq(struct mmc_host *mmc, int cmd_error, int data_erro=
r);
>  int cqhci_init(struct cqhci_host *cq_host, struct mmc_host *mmc, bool dm=
a64);
>  struct cqhci_host *cqhci_pltfm_init(struct platform_device *pdev);
>  int cqhci_deactivate(struct mmc_host *mmc);
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index b2680cc054bd..01ea3adbdf3b 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -1805,7 +1805,7 @@ static irqreturn_t msdc_cmdq_irq(struct msdc_host *=
host, u32 intsts)
>                         cmd_err, dat_err, intsts);
>         }
>
> -       return cqhci_irq(mmc, 0, cmd_err, dat_err);
> +       return cqhci_irq(mmc, cmd_err, dat_err);
>  }
>
>  static irqreturn_t msdc_irq(int irq, void *dev_id)
> diff --git a/drivers/mmc/host/sdhci-brcmstb.c b/drivers/mmc/host/sdhci-br=
cmstb.c
> index 57e45951644e..1de2f05fd958 100644
> --- a/drivers/mmc/host/sdhci-brcmstb.c
> +++ b/drivers/mmc/host/sdhci-brcmstb.c
> @@ -430,7 +430,7 @@ static u32 sdhci_brcmstb_cqhci_irq(struct sdhci_host =
*host, u32 intmask)
>         if (!sdhci_cqe_irq(host, intmask, &cmd_error, &data_error))
>                 return intmask;
>
> -       cqhci_irq(host->mmc, intmask, cmd_error, data_error);
> +       cqhci_irq(host->mmc, cmd_error, data_error);
>
>         return 0;
>  }
> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-=
esdhc-imx.c
> index 18ecddd6df6f..d0fa83f67a80 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -1503,7 +1503,7 @@ static u32 esdhc_cqhci_irq(struct sdhci_host *host,=
 u32 intmask)
>         if (!sdhci_cqe_irq(host, intmask, &cmd_error, &data_error))
>                 return intmask;
>
> -       cqhci_irq(host->mmc, intmask, cmd_error, data_error);
> +       cqhci_irq(host->mmc, cmd_error, data_error);
>
>         return 0;
>  }
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 0882ce74e0c9..ceed47ccfda8 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -2165,7 +2165,7 @@ static u32 sdhci_msm_cqe_irq(struct sdhci_host *hos=
t, u32 intmask)
>         if (!sdhci_cqe_irq(host, intmask, &cmd_error, &data_error))
>                 return intmask;
>
> -       cqhci_irq(host->mmc, intmask, cmd_error, data_error);
> +       cqhci_irq(host->mmc, cmd_error, data_error);
>         return 0;
>  }
>
> diff --git a/drivers/mmc/host/sdhci-of-arasan.c b/drivers/mmc/host/sdhci-=
of-arasan.c
> index 785d3acb18c5..4ca73e7d799e 100644
> --- a/drivers/mmc/host/sdhci-of-arasan.c
> +++ b/drivers/mmc/host/sdhci-of-arasan.c
> @@ -555,7 +555,7 @@ static u32 sdhci_arasan_cqhci_irq(struct sdhci_host *=
host, u32 intmask)
>         if (!sdhci_cqe_irq(host, intmask, &cmd_error, &data_error))
>                 return intmask;
>
> -       cqhci_irq(host->mmc, intmask, cmd_error, data_error);
> +       cqhci_irq(host->mmc, cmd_error, data_error);
>
>         return 0;
>  }
> diff --git a/drivers/mmc/host/sdhci-of-dwcmshc.c b/drivers/mmc/host/sdhci=
-of-dwcmshc.c
> index eef53455b8ee..4c5fa6a6931d 100644
> --- a/drivers/mmc/host/sdhci-of-dwcmshc.c
> +++ b/drivers/mmc/host/sdhci-of-dwcmshc.c
> @@ -624,7 +624,7 @@ static u32 dwcmshc_cqe_irq_handler(struct sdhci_host =
*host, u32 intmask)
>         if (!sdhci_cqe_irq(host, intmask, &cmd_error, &data_error))
>                 return intmask;
>
> -       cqhci_irq(host->mmc, intmask, cmd_error, data_error);
> +       cqhci_irq(host->mmc, cmd_error, data_error);
>
>         return 0;
>  }
> diff --git a/drivers/mmc/host/sdhci-pci-core.c b/drivers/mmc/host/sdhci-p=
ci-core.c
> index c347fac24515..b121d896a804 100644
> --- a/drivers/mmc/host/sdhci-pci-core.c
> +++ b/drivers/mmc/host/sdhci-pci-core.c
> @@ -215,7 +215,7 @@ static u32 sdhci_cqhci_irq(struct sdhci_host *host, u=
32 intmask)
>         if (!sdhci_cqe_irq(host, intmask, &cmd_error, &data_error))
>                 return intmask;
>
> -       cqhci_irq(host->mmc, intmask, cmd_error, data_error);
> +       cqhci_irq(host->mmc, cmd_error, data_error);
>
>         return 0;
>  }
> diff --git a/drivers/mmc/host/sdhci-pci-gli.c b/drivers/mmc/host/sdhci-pc=
i-gli.c
> index 6e4084407662..b55618566d65 100644
> --- a/drivers/mmc/host/sdhci-pci-gli.c
> +++ b/drivers/mmc/host/sdhci-pci-gli.c
> @@ -1760,7 +1760,7 @@ static u32 sdhci_gl9763e_cqhci_irq(struct sdhci_hos=
t *host, u32 intmask)
>         if (!sdhci_cqe_irq(host, intmask, &cmd_error, &data_error))
>                 return intmask;
>
> -       cqhci_irq(host->mmc, intmask, cmd_error, data_error);
> +       cqhci_irq(host->mmc, cmd_error, data_error);
>
>         return 0;
>  }
> diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegr=
a.c
> index 820ce4dae58b..221e48b59f48 100644
> --- a/drivers/mmc/host/sdhci-tegra.c
> +++ b/drivers/mmc/host/sdhci-tegra.c
> @@ -1280,7 +1280,7 @@ static u32 sdhci_tegra_cqhci_irq(struct sdhci_host =
*host, u32 intmask)
>         if (!sdhci_cqe_irq(host, intmask, &cmd_error, &data_error))
>                 return intmask;
>
> -       cqhci_irq(host->mmc, intmask, cmd_error, data_error);
> +       cqhci_irq(host->mmc, cmd_error, data_error);
>
>         return 0;
>  }
> diff --git a/drivers/mmc/host/sdhci_am654.c b/drivers/mmc/host/sdhci_am65=
4.c
> index d235b0aecfdb..2a27db2f558b 100644
> --- a/drivers/mmc/host/sdhci_am654.c
> +++ b/drivers/mmc/host/sdhci_am654.c
> @@ -462,7 +462,7 @@ static u32 sdhci_am654_cqhci_irq(struct sdhci_host *h=
ost, u32 intmask)
>         if (!sdhci_cqe_irq(host, intmask, &cmd_error, &data_error))
>                 return intmask;
>
> -       cqhci_irq(host->mmc, intmask, cmd_error, data_error);
> +       cqhci_irq(host->mmc, cmd_error, data_error);
>
>         return 0;
>  }
> --
> 2.43.0
>

