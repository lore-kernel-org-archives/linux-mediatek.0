Return-Path: <SRS0=kfxU=PO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48031C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Oct 2021 15:41:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AF626109D
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Oct 2021 15:41:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0AF626109D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=chRs8D01oUuInvW5QoSeHTYj8pb4/2L3A/uf3hI//TU=; b=rwMm4+jS/XmyXo
	pHx2zQoBOGVHMEpVkAGdZb5wVCx2FNUd6RIO3q1Wf8dCHzPwDweTrSrO2UkPlnnLzR/wEL60cUFet
	yXaVpHSHQ/vAMis1ZFEaDzfWwtwGvH2fHQ3PlNElniP0jFz5Ut+v+t4LK229nt1dVNDmovxhEVRwq
	GT4OrlkkuUVQp4UgiBlRIFG366m+0pSrIz9hcoZ07wzqrihKUZW6H5dZSirQdFE38msN7JEuq3vnj
	bwcGRvmCrZiVlh6WZAC+bO+xtJ1eYcEPgXmRCU0h74QQfK+T7rcNI55S0Ur/ItGKQrNvbuq9UrWla
	T+MUkAYQ+UHIp8VfL72g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfOZM-002CsB-8B; Tue, 26 Oct 2021 15:40:56 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfOZJ-002CqF-As
 for linux-mediatek@lists.infradead.org; Tue, 26 Oct 2021 15:40:54 +0000
Received: by mail-lj1-x232.google.com with SMTP id s19so16597603ljj.11
 for <linux-mediatek@lists.infradead.org>; Tue, 26 Oct 2021 08:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9JGWO5jt5QtIvnBeSd0VahxH9KJ8Ngd7aKYQ3TRmWp4=;
 b=l2eP8kM2v64pFzuyyl8uOFKlFsPMlKgu6nnHVfMCPdQcboDCBDOmjuw0LUnrnUA68/
 Y9Du49VrgR8hzTI2lL8jYGRLZ3N/CdAj2UJa//D5Me0NsdW1XrxIUELXxar8F7tQUHFu
 T9BdjUzWCTFDoNcGquFwDDivn7fM1bRYMrOqW3QpKqpkZ9d2vepoEGz8jmRhH58Woyci
 VcW/VYfg3j+oRkS8ezSEbsIK9VqX2cRXWU9PXXZRW+x+1gfk05kp1Zi+YGHKjNhwPO42
 QZSEsV2bLE5Wf7E27EzkFUeqV07DltcwQ47yJa3z1Jz4Di36WWw96qjcs2I02GUBJTvw
 phqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9JGWO5jt5QtIvnBeSd0VahxH9KJ8Ngd7aKYQ3TRmWp4=;
 b=Ljk2XMzBVrD21aBEMisZQj8z8l3cruEKYhz00Hbx7Jp+lrk3j6mCwqD4KRsp1yrECY
 FPpWJOeKpVc6sGCdii4rrg12hLmWloxqx1YH9KsjJXuGdBHO88puPDTmqDy36biw86RE
 09gKcBEe+XGhCg19UAPft0PDjGf3obO9RJbrWVle8OWokLVmecnzmngYmSQEB0+RQuX5
 h3YKfMb/FRLSQRnKBZxT4rzqm+tToJ6wEw1iuRCcXhDyR1YnJRx7TVq8EQhZ9ZsYZTc/
 egaNwyRYub7Pry76hQq9xpbH/HCTVAqyBVtBcWaEKLql426WDZvB0YWurBxdHurpxJW7
 Ek9Q==
X-Gm-Message-State: AOAM5330CGHjTBYZl9Ok2RY2QHzXmokTAJ8NCAlsftWdMY9qAkCQLkBC
 utpyzLUCqO7rxQ76VOrejqHCJ3GEOr2SA9TYC6gdhw==
X-Google-Smtp-Source: ABdhPJxxOsxXey/zZUMsKaDVg3dujNtrb2v5kzU7OfyCjPJ0s85CzbTm/9BZ3RdZ4fBQvppT3W8byIBy4h5Ka655VpI=
X-Received: by 2002:a05:651c:907:: with SMTP id
 e7mr28394579ljq.300.1635262849171; 
 Tue, 26 Oct 2021 08:40:49 -0700 (PDT)
MIME-Version: 1.0
References: <20211026070812.9359-1-wenbin.mei@mediatek.com>
In-Reply-To: <20211026070812.9359-1-wenbin.mei@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 26 Oct 2021 17:40:12 +0200
Message-ID: <CAPDyKFpGSrMkFg1PkRaH6zePOqH7aSbjfoCk6AhWgwGnSkoNAw@mail.gmail.com>
Subject: Re: [PATCH] mmc: cqhci: clear HALT state after CQE enable
To: Wenbin Mei <wenbin.mei@mediatek.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>,
 Ritesh Harjani <riteshh@codeaurora.org>, 
 Asutosh Das <asutoshd@codeaurora.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 srv_heupstream@mediatek.com, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_084053_402275_3EEFDEBB 
X-CRM114-Status: GOOD (  17.65  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 26 Oct 2021 at 09:08, Wenbin Mei <wenbin.mei@mediatek.com> wrote:
>
> While mmc0 enter suspend state, we need halt CQE to send legacy cmd(flush
> cache) and disable cqe, for resume back, we enable CQE and not clear HALT
> state.
> In this case MediaTek mmc host controller will keep the value for HALT
> state after CQE disable/enable flow, so the next CQE transfer after resume
> will be timeout due to CQE is in HALT state, the log as below:
> <4>.(4)[318:kworker/4:1H]mmc0: cqhci: timeout for tag 2
> <4>.(4)[318:kworker/4:1H]mmc0: cqhci: ============ CQHCI REGISTER DUMP ===========
> <4>.(4)[318:kworker/4:1H]mmc0: cqhci: Caps:      0x100020b6 | Version:  0x00000510
> <4>.(4)[318:kworker/4:1H]mmc0: cqhci: Config:    0x00001103 | Control:  0x00000001
> <4>.(4)[318:kworker/4:1H]mmc0: cqhci: Int stat:  0x00000000 | Int enab: 0x00000006
> <4>.(4)[318:kworker/4:1H]mmc0: cqhci: Int sig:   0x00000006 | Int Coal: 0x00000000
> <4>.(4)[318:kworker/4:1H]mmc0: cqhci: TDL base:  0xfd05f000 | TDL up32: 0x00000000
> <4>.(4)[318:kworker/4:1H]mmc0: cqhci: Doorbell:  0x8000203c | TCN:      0x00000000
> <4>.(4)[318:kworker/4:1H]mmc0: cqhci: Dev queue: 0x00000000 | Dev Pend: 0x00000000
> <4>.(4)[318:kworker/4:1H]mmc0: cqhci: Task clr:  0x00000000 | SSC1:     0x00001000
> <4>.(4)[318:kworker/4:1H]mmc0: cqhci: SSC2:      0x00000001 | DCMD rsp: 0x00000000
> <4>.(4)[318:kworker/4:1H]mmc0: cqhci: RED mask:  0xfdf9a080 | TERRI:    0x00000000
> <4>.(4)[318:kworker/4:1H]mmc0: cqhci: Resp idx:  0x00000000 | Resp arg: 0x00000000
> <4>.(4)[318:kworker/4:1H]mmc0: cqhci: CRNQP:     0x00000000 | CRNQDUN:  0x00000000
> <4>.(4)[318:kworker/4:1H]mmc0: cqhci: CRNQIS:    0x00000000 | CRNQIE:   0x00000000
>
> This change check HALT state after CQE enable, if CQE is in HALT state, we
> will clear it.
>
> Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
> Cc: stable@vger.kernel.org

Applied for fixes and by adding a fixes tag, thanks!

Fixes: a4080225f51d ("mmc: cqhci: support for command queue enabled host")

Kind regards
Uffe


> ---
>  drivers/mmc/host/cqhci-core.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/mmc/host/cqhci-core.c b/drivers/mmc/host/cqhci-core.c
> index ca8329d55f43..b0d30c35c390 100644
> --- a/drivers/mmc/host/cqhci-core.c
> +++ b/drivers/mmc/host/cqhci-core.c
> @@ -282,6 +282,9 @@ static void __cqhci_enable(struct cqhci_host *cq_host)
>
>         cqhci_writel(cq_host, cqcfg, CQHCI_CFG);
>
> +       if (cqhci_readl(cq_host, CQHCI_CTL) & CQHCI_HALT)
> +               cqhci_writel(cq_host, 0, CQHCI_CTL);
> +
>         mmc->cqe_on = true;
>
>         if (cq_host->ops->enable)
> --
> 2.25.1
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
