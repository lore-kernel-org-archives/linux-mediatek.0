Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FDFEC61DD6
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2026 16:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DAPmwpOVMYBIF2IijOmIRShxJK4mqn3MwoKwfXdUyaE=; b=T9N7zkPD0RekIHa8bDk4NCt+CE
	tX43WO7bvjanGiA6YNARA1EOv22r2VxhaSUfeO/zJQidRHYSfpBLL48C2pi9UmevYpNfFq9DvURNU
	pCOnMjbEa+qfaYWfPV09FgyESvD3ApBw+tR5C+eiSYhPx/uxFNR+So9DZSHfx85zgtbpeRYv/tUzE
	crPZtg+lOb3oyzPl8R7+P2VG7o1LAZOtG2UW0PVW8KqOAnvy61jGLD3vvtgYEw44Lj8ESzsy4N2d3
	Pezh0wOSUc0QgMklRl5D0wNzRVTWeqUUX0PrVy1Fnl6PiHh1FSRfkZOs4M3+F1OxNuh9l6Wuqi4Ko
	GFRngenw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1nVE-0000000FAK2-0bXE;
	Wed, 02 Sep 2026 16:07:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1nVA-0000000FAIL-1Zuq
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Sep 2026 16:07:55 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682FZQmL1409243
	for <linux-mediatek@lists.infradead.org>; Wed, 2 Sep 2026 16:07:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DAPmwpOVMYBIF2IijOmIRShxJK4mqn3MwoKwfXdUyaE=; b=YsipzOKZ4KL8slmv
	7lfUIOmUegtvaHe9Q6n5DfrEnbHMetttDM8JsiMptpyFqCWJV5piU+VqF0TpWPGB
	5aJOWc+CF+houMN3k8AD3259qR5ufX2Sj22hlEhnK5029+0Fipr2pbVM5CDfc+JT
	nqa/5zGIjLRLEKYM70juFAX9H2/WHygWQNXie65vVEINziPvR602/ktfEG3b1MIH
	zgniwmAEpQZG7TnGNlJLJ7eQTX7NHKXC26cFpbLMGl3v0NDPsk5OpsZHYrRIueBF
	+vpUf2iu7tNG9aPCRMduPxXedUwuHUcDu0bHXJmlJj6MCxMOjt134Hp50/yoH7qd
	TkF4bg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemce8rgp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 16:07:41 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb11535e6a1so1426752a12.0
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 09:07:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788365261; cv=none;
        d=google.com; s=arc-20260327;
        b=CRy5uPmhD4nW9JoTfHZpnoLnUseNEmDFwQsU8wasbU7Mw4Gp3LOdrGvlHaq1B1gLrA
         jqnOlnL3WNooQgwEghnPShP+VxvDWYgN7nZQ3imJb8cKxq9rCHnZ0jCz7UU4JteFJCPT
         oTqYlNCWQk4ND8uknlggA20TKzWRJavf3GgNaNyZ04TOhjwhGkZ7eDNsuiJ7dyWZyX/3
         Cuuc7nQkIwDfIL0zRUpcAS/NNAM4qadVpAJIiBm6+ZhrC5Xa9yvVCFncbFf5DLWeJ/QA
         oQGCjPZM6bagp2NLYp54wAd/Zc29cy74agHkejpnIQ8AweRpuYzUPGWfIphIuKooOigK
         vPMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DAPmwpOVMYBIF2IijOmIRShxJK4mqn3MwoKwfXdUyaE=;
        fh=9D3dRWSoON05ccXi9n4hDQhbt4GVSR4n1MCq9X1LV6E=;
        b=EIP6UnUH91QhtdOO0CnT2goTvqLYDlcxxIDqowN2LzysGLKhmEgNljk/QR02mUpmPt
         ADSrhSamemOINiek+k7zOwm9QNfei3Li+krkPHzKdI2B3NdD1ky010Cr9Rsq2EY7uWbQ
         ISmA1QPloSLdI+FSXFeuhLmGFDhra4AibymjTkknJGGBJr+3jIIVnBxxyvb56WrtDTEs
         TcU4PbwVR9D6pawqufa9iEI09PKLG1n1lVukotElZkY23zNIHW3Kas9HFGmvkZ4T1wdR
         Yq32mnGM4nimCwoDPBkeCzk+IYTOSymkPFC3+Ip7xKmHRge0mYuZllwNF7at5GEeJVS9
         V8GQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788365261; x=1788970061; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DAPmwpOVMYBIF2IijOmIRShxJK4mqn3MwoKwfXdUyaE=;
        b=juer+Xqri5Muv6WQXuVFv/y/2a3fCSHA+P5q2cX0yiCW5QFGI1meqjjJDGTY1PnXRY
         hvuYPe3LTA4U8IS+TYK2CyX6aLwtAmckjt0IZss/Jkx/8pohLqqP5yXv7qtYZe8Aq3Uj
         dO08mHf9JSAv0JkSj3caHH/nnB8W4ZksyckiA0noBYCnwLqtvhSF9fNvZdluU5pliYyo
         S1pfYB4IXq5plFmXkt434xvCX7sgSeqNY7jQhkAvllkEcxHeJ927XyArMLGakfUbexQa
         i0WPalYptdla13mRzxXyY1InYQO0ALEYFP+F70Sqqasmq16Ug32MfqYqT0b441tBv+ZK
         BeQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788365261; x=1788970061;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DAPmwpOVMYBIF2IijOmIRShxJK4mqn3MwoKwfXdUyaE=;
        b=BwlEGguYSz9hi/CD98Dhz6nqnHHMgCD3AjWmwlBcyvVhqFNkQ+Bz3nLuUnGg0GaVwu
         Aj6zDqtcnb5Uzz3Pr3ys92xB5STkZPnr0K6Ui7Mj03NmAnsH5vUlhtRF6A+hGiuCqdYe
         Bm1Wj5l/6I+GdpkUtnsHqCJUyMzKRLERE8COtwy7usYNpdIlcLSQ0tQNdqaxxYFxB2xh
         1A6qjfShjK5zpbU8omPsj7Wu8BcltT/GMckRXcVO/qFp+534jehI5/QK65F00SFgiCIS
         t2Gyc2ThGI9b0JK6LUexjILFOQca1583Sm8zqulpEHTI2d9VeY9X5tfFikk3eL3k12oz
         xogw==
X-Forwarded-Encrypted: i=1; AKwUvByr9DrG5hftlji12Ejk5cLKJAyr+Cszoyumec3G3EvwBl5xtOxe+CbF53jcAvXjm2ja7rCf+cV3lAWWVLL0Sw==@lists.infradead.org
X-Gm-Message-State: AFuF++mQTg+QeFQekqGgkdywqtOwXzkKcGUkEURTt5+BDdF/dtGd3Qu+
	RL0rDgNPOlccZlzWx0nNrxo6v62a7uR2/l0T8+8LXfhL8tM6vKkrVWuI/cBE1oSgL2ebVFf8vZB
	CDmPtzmRT5q890WtOzYjElu1zaGURSpmSQx3rElpZBs+YQa62fgIPp7KnVzcUZGnGG44j+8DzGm
	nMYkuNFKvd4QBe1sLgFl44SvcjWCqXQRMxyaWC1uwnVecPpR44RQ==
X-Gm-Gg: AYBFou091D8eTzkxUZckjGghOywZzCGALov4mQ23iNoM/ma6AX5XMCRk3VNBh8XugBj
	s9klC1RGHVR9sJSbsaqSHp02MxYvbuEulKbMYIdlKIl11MprdAjJV9jaMuB9jFDyjKc8ldvBjFu
	7Zi2+WYF1pi5eOD3vBwYXeRRR4ctH99QWeJMXmkzvhdo5pKSKZdaFBJFoXjQ==
X-Received: by 2002:a17:90b:2e50:b0:398:b426:ca4b with SMTP id 98e67ed59e1d1-39aee1a9994mr9843078a91.22.1788365257270;
        Wed, 02 Sep 2026 09:07:37 -0700 (PDT)
X-Received: by 2002:a17:90b:2e50:b0:398:b426:ca4b with SMTP id
 98e67ed59e1d1-39aee1a9994mr9842890a91.22.1788365256476; Wed, 02 Sep 2026
 09:07:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260625003525.22594-1-pengpeng@iscas.ac.cn>
In-Reply-To: <20260625003525.22594-1-pengpeng@iscas.ac.cn>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 18:07:23 +0200
X-Gm-Features: AcwNN1Um-bxia3REdAXf8m-38tcHtMIEpV7_v--sQ-7-GTkWwOc4grrEf97NRUI
Message-ID: <CAPx+jO_6jWt2YAjzHnD56_LX5mAFkxwOiUy4Ka+BRG9WX2M0PQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: mtk-sd: report DMA stop timeouts as data errors
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson <ulfh@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE0MiBTYWx0ZWRfXw8ATptZCwNfH
 yoh1mgUqMT0jkPyiVjltj8V4PfJbz+IXU29zN9NOyn4QGMBtNy4cMtPp2vDxj+lkKvRa+P2aD6i
 dOSPoYwIF4nzeO4YNstnowCODsNT7X36+5b7irC+BZmwG8iymYxL2HyppCrFoAP9S+hqpBeDeu5
 r4+/ulhUOXuOdmJ6af2hj7JLJ7BkAwuvcgoKDXYbsEn7fra8rjkXtno0anYWs9ThbsH11wJ3QXa
 Sn6k5ber+7pJessEB+89T2OGknMhtOCtowHseAzHUFtPIJ8tnoqAPCJNXy912ps7suT9Ps5pDY8
 aSQnHx5Sq1PjnndH52LRD3XjGLFhv+nGjIn5cZbf/L0fih7xFhiW+tAPM0snCkl9FW/BAlgEJGk
 +4UilR6TolsHhl/ucI5FSplKl6ih61dIvFBVvSx+oeJQ3RBeLmHu+A49zYy8XMXejZzKmGAuhHh
 WUJpNY2Najk6yb6jOHg==
X-Proofpoint-ORIG-GUID: ua9kSM_9qj7ZGF62bob47hoUYAFgT1vT
X-Authority-Analysis: v=2.4 cv=QfpWeMbv c=1 sm=1 tr=0 ts=6a9849cd cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=CBFGLoz9tPvRy0Ij70wA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: ua9kSM_9qj7ZGF62bob47hoUYAFgT1vT
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE0MiBTYWx0ZWRfXxuBzbRaPYta5
 QiMHpjaA1URqUFVGvWNWdTnfjMB4CumhpppOq7vQXeKATtJ/6V3kqs0DrqW8MWiOEAJFKXZUVOU
 eeWrwee/75Pk/SJOwTMd8G7SpppsICM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_090752_420349_7A7F8EC5 
X-CRM114-Status: GOOD (  24.46  )
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

On Thu, Jun 25, 2026 at 2:35=E2=80=AFAM Pengpeng Hou <pengpeng@iscas.ac.cn>=
 wrote:
>
> msdc_data_xfer_done() stops the DMA engine before completing a data
> request, but it only logs failures from the DMA stop and DMA-inactive
> polls.
>
> When the interrupt status also carries MSDC_INT_XFER_COMPL, the function
> can still report the full data length as transferred even though the DMA
> engine did not confirm that it stopped or became inactive.
>
> Treat DMA stop/inactive timeouts as data errors.  This reuses the existin=
g
> reset/error path and prevents a timed out DMA stop from being reported as=
 a
> successful full-length transfer.
>
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Hi Pengpeng,

Did you verify this on HW? If not, I am leaving this to the mediatek
folkz to confirm before applying.

Kind regards
Uffe


> ---
>  drivers/mmc/host/mtk-sd.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index b2680cc05..e3caa9c32 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -1583,7 +1583,7 @@ static void msdc_data_xfer_done(struct msdc_host *h=
ost, u32 events,
>              | MSDC_INT_DMA_BDCSERR | MSDC_INT_DMA_GPDCSERR
>              | MSDC_INT_DMA_PROTECT);
>         u32 val;
> -       int ret;
> +       int dma_err =3D 0, ret;
>
>         spin_lock_irqsave(&host->lock, flags);
>         done =3D !host->data;
> @@ -1603,18 +1603,23 @@ static void msdc_data_xfer_done(struct msdc_host =
*host, u32 events,
>
>                 ret =3D readl_poll_timeout_atomic(host->base + MSDC_DMA_C=
TRL, val,
>                                                 !(val & MSDC_DMA_CTRL_STO=
P), 1, 20000);
> -               if (ret)
> +               if (ret) {
>                         dev_dbg(host->dev, "DMA stop timed out\n");
> +                       dma_err =3D ret;
> +               }
>
>                 ret =3D readl_poll_timeout_atomic(host->base + MSDC_DMA_C=
FG, val,
>                                                 !(val & MSDC_DMA_CFG_STS)=
, 1, 20000);
> -               if (ret)
> +               if (ret) {
>                         dev_dbg(host->dev, "DMA inactive timed out\n");
> +                       dma_err =3D ret;
> +               }
>
>                 sdr_clr_bits(host->base + MSDC_INTEN, data_ints_mask);
>                 dev_dbg(host->dev, "DMA stop\n");
>
> -               if ((events & MSDC_INT_XFER_COMPL) && (!stop || !stop->er=
ror)) {
> +               if (!dma_err && (events & MSDC_INT_XFER_COMPL) &&
> +                   (!stop || !stop->error)) {
>                         data->bytes_xfered =3D data->blocks * data->blksz=
;
>                 } else {
>                         dev_dbg(host->dev, "interrupt events: %x\n", even=
ts);
> @@ -1622,7 +1627,9 @@ static void msdc_data_xfer_done(struct msdc_host *h=
ost, u32 events,
>                         host->error |=3D REQ_DAT_ERR;
>                         data->bytes_xfered =3D 0;
>
> -                       if (events & MSDC_INT_DATTMO)
> +                       if (dma_err)
> +                               data->error =3D -ETIMEDOUT;
> +                       else if (events & MSDC_INT_DATTMO)
>                                 data->error =3D -ETIMEDOUT;
>                         else if (events & MSDC_INT_DATCRCERR)
>                                 data->error =3D -EILSEQ;
> --
> 2.50.1 (Apple Git-155)
>

