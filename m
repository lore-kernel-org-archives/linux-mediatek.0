Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B67C6FD18
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 01:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ZHGglGdWPxmLZqzE9Llvceqs/qTUTBeEQL05IjQ1GM=; b=wvjP9vXi31yzG0agECH7uSmInY
	gUTNcanBxTsZE3hpjgSUUqP2hNR+KwGboMEeNwnHP+kRpIpUvs3pk7uwGhOb9uOBw1Sug9IqJt71d
	HeVSXWZ2O1dgZMJkKL5lMZ+lG8r2Q7zFcElWecE9BJ8WkUfZ9n2zihHFDYNMORRTZ2KPA+z8yNT4V
	d695ALx+fCj3STNTSLhtmRNi6ixSEbAMagbx9YeL+7+MFanCROcw0gK5NB+rVoY49BiNGiXeFnYfx
	vRNTBvpspyIVlhhQh+WOpkt+aZ4aPCRicYID0hXoZwlSwpY3QD0puCI7eN0er/m99oOXek3c6NOK0
	LpaKOsGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phKfl-00GHAJ-2j;
	Wed, 29 Mar 2023 01:32:21 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phKfi-00GH8p-2M;
	Wed, 29 Mar 2023 01:32:19 +0000
Received: by mail-lf1-x133.google.com with SMTP id k37so18234202lfv.0;
        Tue, 28 Mar 2023 18:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680053535;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ZHGglGdWPxmLZqzE9Llvceqs/qTUTBeEQL05IjQ1GM=;
        b=XcsoEJJxl1+QHxMh2z9moGG+r4jo5wA6j2Pz55DBO+Ag1Gm0mr3PXkC8s3EPqYcBC/
         +7VY6+B9iLi3TAsuSyKqTitSZeF7f3qh0bm3BzVhu/doEiY+KH0QGKoV2O0gpflRjw6X
         jPayASahJ8WBBausFNZG+70PPanU2EHHjcFjo6ZP9nOQOnA0jZyGccK2eWS7wYWg35B8
         wFmIZFrk7uge/DMV/JintYkGIxM6158Ot5rcv0u6JMSYv3Tfv2fdmvRHsGcF6UcWRYTf
         FD6t54ZhJsmXouT8lYKsA1+tJdEQhQ4BEBq/fRInizySNx+s+3pAD8V5wUuCkMyVGzcz
         /sag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680053535;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ZHGglGdWPxmLZqzE9Llvceqs/qTUTBeEQL05IjQ1GM=;
        b=AGsw/9/MqhM4RxCx2RR2mTfJ9oS7sD6wqkIYxRHwUgs0WQLNdt0DiZ5TtDQIAXq2b9
         vYywYOVl1xpJfTGt2FUVftEJHZzDgd1KZ+eCZixqFqMHjJPY1qnkTfjsuhwIYrjeIqVe
         /+TkLDzc0zPc38ABCAqVhVtEiPu8/uirkpvrUnGIxjMTeqU/ifUGKDxJLvoEu8SfAZCW
         UFv5ZO5ZGe7kQBlU8x9xMzBy74axwheoFz66ONiNz9xPFR2MFXLvAiKrhQghNgo9P8Jr
         bIAqlROKJrq0e1MhuhMMBTmocIpNeJSVD2K8HDRS34whkmiX74wPcwJA8+g24TzumEdA
         cMmg==
X-Gm-Message-State: AAQBX9c1y4q3wa1G4HQPwpuPV3/l18CgKjXLZ/SPc2MZEXKryh6zOAaY
	C8GavQLSi/cUcbrg4EnYdxb48qBz61u08Qqs/w==
X-Google-Smtp-Source: AKy350ZJB6a7OQPoK0lwOGpL2K/wAnPDQc3srlgvjR3MpcfWsa2UceRHwbzl4Nrp2RSgJYQpa/EAliAkUvNWxBzIoIM=
X-Received: by 2002:ac2:4473:0:b0:4eb:eaf:aa00 with SMTP id
 y19-20020ac24473000000b004eb0eafaa00mr2977003lfl.4.1680053535096; Tue, 28 Mar
 2023 18:32:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230328103801.11198-1-powen.kao@mediatek.com>
In-Reply-To: <20230328103801.11198-1-powen.kao@mediatek.com>
From: Stanley Chu <chu.stanley@gmail.com>
Date: Wed, 29 Mar 2023 09:32:03 +0800
Message-ID: <CAGaU9a_dCZA3A_1TP=ijGgXTfiNZffvBe875xXXCKmoN8bQPxA@mail.gmail.com>
Subject: Re: [PATCH 1/2] scsi: ufs: core: Add host quirk UFSHCD_QUIRK_MCQ_BROKEN_INTR
To: Po-Wen Kao <powen.kao@mediatek.com>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
	Bart Van Assche <bvanassche@acm.org>, "James E.J. Bottomley" <jejb@linux.ibm.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, wsd_upstream@mediatek.com, 
	peter.wang@mediatek.com, stanley.chu@mediatek.com, alice.chao@mediatek.com, 
	naomi.chu@mediatek.com, chun-hung.wu@mediatek.com, cc.chou@mediatek.com, 
	eddie.huang@mediatek.com, mason.zhang@mediatek.com, 
	chaotian.jing@mediatek.com, jiajie.hao@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_183218_771064_8A3BBEA3 
X-CRM114-Status: GOOD (  12.27  )
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

Hi Po-Wen,

On Tue, Mar 28, 2023 at 6:42=E2=80=AFPM Po-Wen Kao <powen.kao@mediatek.com>=
 wrote:
>
> Quirk UFSHCD_QUIRK_MCQ_BROKEN_INTR is introduced for plaforms that
> implement different interrupt topology from UFSHCI 4.0 spec.
> Some platform raise per hw queue interrupt in addition to
> CQES (traditional) when ESI is disabled.
>
> Enable this quirk will disable CQES and use only per hw queue
> interrupt.
>
> Signed-off-by: Po-Wen Kao <powen.kao@mediatek.com>
> ---
>  drivers/ufs/core/ufshcd.c | 8 ++++++--
>  include/ufs/ufshcd.h      | 7 +++++++
>  2 files changed, 13 insertions(+), 2 deletions(-)

Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>

