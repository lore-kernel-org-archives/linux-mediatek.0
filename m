Return-Path: <SRS0=13eL=E5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8345C2D0E4
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2020 16:07:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 429C82080A
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2020 16:07:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HGDXTxRd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Cd9H8Fy/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 429C82080A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WNlEn7f+9OyPtcMssItrH+2lhONNU0VdPxHP7SMU8uo=; b=HGDXTxRdUxEK8LCevjTqip25+
	Y0IGcprDt2yRh1TXdt02UTcF/GnTIyqNkvVMs+T+xYM+oywgAyfdOBpk5vuCQSIE4/5nuOvi3wBCY
	FKN9bp4j+SZ+ae0+3kMauqtM1ecCcmVxB02C0fY0gyE7uZn91oLTKnvzUKW6IWwUWSsiNtRDTADY6
	DX3gUZVSacteH5xiuliuQaJc8fqCx5u6kgLVZt95UprkEplpfaBqoMqaytOwOoEbv9ixJeoGaLr0p
	gDRm/o3O23dMVqwjWcGVG19jrohTtJVrj8rBMS1M48Jqc8Ski48Jvo+KNc3TnO+eYhzmJQjOf0Hlc
	9PV3jW3LQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khENM-0003FB-Uo; Mon, 23 Nov 2020 16:07:36 +0000
Received: from mail-vk1-xa41.google.com ([2607:f8b0:4864:20::a41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khENJ-0003E4-RX
 for linux-mediatek@lists.infradead.org; Mon, 23 Nov 2020 16:07:35 +0000
Received: by mail-vk1-xa41.google.com with SMTP id b190so4064985vka.0
 for <linux-mediatek@lists.infradead.org>; Mon, 23 Nov 2020 08:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UNsop+cjEneyR6Ql2hsZCZcsflP0cbZhcL6E3kTgIJE=;
 b=Cd9H8Fy/EEy2EVXyMtJdIYyP/IYtfyQfGwJCqk0fyc4pG+Ri//S5+3ZvYM5glp1ZJ4
 ZVpOc3/9mHF17iULTB1oum8mS8BTwOcqNPsBrBr5KOopK58JAPYG3ZtH5Cfh7EM02SfW
 u8v9dh/qskdFaQxe+oZy5GeJzKFJOVzMzvIpfXw6+2isPqbRi+/GT7kpplRCoBpQNKEh
 vluYENBYiw7UwIlqIKR8In3xPatHHeYpCB/CRhdg1R6sNQrRsUOftWmJzz2bxj5PDcHV
 edfTUtm9iAr2BidHf1KMyEU4zK35Rhw7pNGjat+i42krW9SDkcKf9jtgwNbyEGOwpVU7
 8vZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UNsop+cjEneyR6Ql2hsZCZcsflP0cbZhcL6E3kTgIJE=;
 b=jkHrRzAGtEAZtxvwOWY+tKxekcU/TnzUuNN46KLSNWCi3Y7iliUEuYGQzNrwJNcInr
 kxjf8vx4NwY6A6qiIzfV8VMKIn0NRrrh7HEwEZhcHqzXBeFmxGG4IpdBud/b0Va1nTk0
 G00XCAz5AoWgDPh5Yhu3syvablxPj60P2uzhVhvCcUlrpgjRQMkLg3YabM6N3clMAZFx
 GcgsVPU0++qCS6Z+jb9soByuKqnMpD/X9J553RIEtCCsqaYJhGiLv30LS6vVFuHt9RSB
 HEJJHYHkaLHwhSJaTlaIUUtzkulGbjVMIFeUHQpDxbdfSnGQhbRsY0338zogcLU6E6Tu
 GEXA==
X-Gm-Message-State: AOAM532QmdpXkHhbiHNtdg0b6x+I1h195TNrptz1Z0W/DqmfyVteVW/V
 7yYpEd0DJQjueNPkRioSBHaH5XA1LYsXntQTNijFyw==
X-Google-Smtp-Source: ABdhPJyOs8N3MeZsp7FriWdMaHZTpzFrInprCKZugi76ui1r4JwfNeV5VLB6ZZQVRdgjqtC5UIQahxENrMD8YMjwo74=
X-Received: by 2002:a1f:9889:: with SMTP id a131mr456205vke.15.1606147650704; 
 Mon, 23 Nov 2020 08:07:30 -0800 (PST)
MIME-Version: 1.0
References: <20201118063405.24906-1-wenbin.mei@mediatek.com>
In-Reply-To: <20201118063405.24906-1-wenbin.mei@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 23 Nov 2020 17:06:53 +0100
Message-ID: <CAPDyKFpHAWBtxLOOvvqmAYFAwCsV66s_LzzVJg-zfXH5QE++Ng@mail.gmail.com>
Subject: Re: [PATCH] mmc: mediatek: Add system suspend/resume interface
To: Wenbin Mei <wenbin.mei@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_110734_307365_4C8B7A7F 
X-CRM114-Status: GOOD (  22.84  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: srv_heupstream <srv_heupstream@mediatek.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 18 Nov 2020 at 07:34, Wenbin Mei <wenbin.mei@mediatek.com> wrote:
>
> Before we got these errors on MT8192 platform:
> [   59.153891] Restarting tasks ...
> [   59.154540] done.
> [   59.159175] PM: suspend exit
> [   59.218724] mtk-msdc 11f60000.mmc: phase: [map:fffffffe] [maxlen:31]
> [final:16]
> [  119.776083] mmc0: cqhci: timeout for tag 9
> [  119.780196] mmc0: cqhci: ============ CQHCI REGISTER DUMP ===========
> [  119.786709] mmc0: cqhci: Caps:      0x100020b6 | Version:  0x00000510
> [  119.793225] mmc0: cqhci: Config:    0x00000101 | Control:  0x00000000
> [  119.799706] mmc0: cqhci: Int stat:  0x00000000 | Int enab: 0x00000000
> [  119.806177] mmc0: cqhci: Int sig:   0x00000000 | Int Coal: 0x00000000
> [  119.812670] mmc0: cqhci: TDL base:  0x00000000 | TDL up32: 0x00000000
> [  119.819149] mmc0: cqhci: Doorbell:  0x003ffc00 | TCN:      0x00000200
> [  119.825656] mmc0: cqhci: Dev queue: 0x00000000 | Dev Pend: 0x00000000
> [  119.832155] mmc0: cqhci: Task clr:  0x00000000 | SSC1:     0x00001000
> [  119.838627] mmc0: cqhci: SSC2:      0x00000000 | DCMD rsp: 0x00000000
> [  119.845174] mmc0: cqhci: RED mask:  0xfdf9a080 | TERRI:    0x0000891c
> [  119.851654] mmc0: cqhci: Resp idx:  0x00000000 | Resp arg: 0x00000000
> [  119.865773] mmc0: cqhci: : ===========================================
> [  119.872358] mmc0: running CQE recovery
> From these logs, we found TDL base was back to the default value.
>
> After suspend, the mmc host is powered off by HW, and bring CQE register
> to the default value, so we add system suspend/resume interface, then bring
> CQE to deactivated state before suspend, it will be enabled by CQE first
> request after resume.
>
> Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>

I took the liberty of renaming msdc_sys_suspend|resume to
msdc_suspend|resume, as I think the "_sys" is a bit superfluous.

Additionally, I added a fixes+stable tag, then I applied this for fixes, thanks!

Please tell me, if there is anything you would like me to change.

Kind regards
Uffe


> ---
>  drivers/mmc/host/mtk-sd.c | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index fc5ee5df91ad..c5f9cd6fc951 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -2758,11 +2758,29 @@ static int msdc_runtime_resume(struct device *dev)
>         msdc_restore_reg(host);
>         return 0;
>  }
> +
> +static int msdc_sys_suspend(struct device *dev)
> +{
> +       struct mmc_host *mmc = dev_get_drvdata(dev);
> +       int ret;
> +
> +       if (mmc->caps2 & MMC_CAP2_CQE) {
> +               ret = cqhci_suspend(mmc);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       return pm_runtime_force_suspend(dev);
> +}
> +
> +static int msdc_sys_resume(struct device *dev)
> +{
> +       return pm_runtime_force_resume(dev);
> +}
>  #endif
>
>  static const struct dev_pm_ops msdc_dev_pm_ops = {
> -       SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> -                               pm_runtime_force_resume)
> +       SET_SYSTEM_SLEEP_PM_OPS(msdc_sys_suspend, msdc_sys_resume)
>         SET_RUNTIME_PM_OPS(msdc_runtime_suspend, msdc_runtime_resume, NULL)
>  };
>
> --
> 2.18.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
