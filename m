Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 545E8EE369D
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Feb 2026 16:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SnpZTRXVw8s2CXHghCnwci/ZkVwlVyjaksQVMB1Lk4o=; b=LsCjD4WggZ/4Xjd+ocxTiZwTt1
	v9IZlNRcDWFT0uK9HjkWm3nyAtpRQnAOH/46J7LDksO/j9D2XBLPsswIC8zilKWjYvp2seAOlXXZ+
	u4ZBAqLjanQWq0cP4194RDYs8Bl1mybslC2fZdaGX4ul1lFZrUizVlkptEVsMAUBVkHzraEuB/S32
	puaN2AladX1hut+2JY4gwv9zzm2Y1XL9FHWjiCnawhqnyj5oDZHVNhodRbvvsUz7Nqgm6rxER0j2d
	No99I8Yu5cMgvwPDN0gGlQ9BnsMhsk40gvkXCBF1Wiqxv9Phs+gabbQj18Ii8oGxE4tzpLU8SjzNS
	fRb0Ietg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqZBn-00000002JEq-2SXa;
	Thu, 12 Feb 2026 16:05:11 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqZBi-00000002JDh-46ZH
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Feb 2026 16:05:08 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-65a1974d3dfso4998155a12.3
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Feb 2026 08:05:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770912304; cv=none;
        d=google.com; s=arc-20240605;
        b=J909gxDYi90V/rlD3eRN+hffhq4yv4TmqOm6JufamlaPVw3tx1XTJpLjgNGBqAfrzG
         GpZyJly9QkTlugn3Xw0NTZOjCj14FJs4OqDOfn/X3Q4pKGN2l2lU91xAia6k8P94VS7d
         mJ2CwYR7sCQ6oM+1aITmSGhE1fpa0dEO1+heA3clDkzldAb1dldLoHXDNTtoA8gLnecy
         VP1v1geG3YJLbAmjST3ryZOE5B3ZtbAbyqIxG1Vh4OdSkRsvDfMCwdnYzrBUssXlRTix
         GMwq1RuQac3Iomu4oNTQQp8VI7pIWd6VIgT8YiRSlmBRlzxLGop0wAyDu1liHKctDvR4
         QZOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SnpZTRXVw8s2CXHghCnwci/ZkVwlVyjaksQVMB1Lk4o=;
        fh=wJxMPh3COtEOJFdXvHzavBSVoEF5aXg56oStxtNwEUw=;
        b=AOAJ+HuR/0FwaLhzJA5A3dtuWB/44eoVwxLiQk5UXYg7UFYD6wYurm98WjhhUn00Le
         jH8Q1jFPzxF8asDExay50en7J9HcZa0fDwL3QX241DOFlXhc+cZh66b9z/fxhbDwly9J
         xKx3fkeyFu+K+S8I+p92YOUd6RrQnliiOyfA8rG83Da+p71Em20Ccr0KCaGNZXS/Ka+L
         TaMNnfY4dRYwMeaGHCsews2abs9RCJCn1/oN551XrQj31rF4zdJ2QphgryZOB4sh2mZx
         M+kmZZf39cF8fvLoi9iMy/frgJYUowxFSN0zZjiV2hC2OewxFtsLEA2tH98vPDw4wWYL
         KZtA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770912304; x=1771517104; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SnpZTRXVw8s2CXHghCnwci/ZkVwlVyjaksQVMB1Lk4o=;
        b=UHZLZknKEXh2q780Q23SHQlJ+ji+2y+kQbZ1hZ+DfX6YladK/QR/3Fo09lQiPANjHl
         za7dHrBzP/mTdcajJDKSQ+Fod8u3a+r0Ulm69c/tdCFJ5/QmSWwMwO2f1b2t+SbyJJaP
         ZMJ17FsbHyq0j1Wlx6OzurJnRu6ogCRWtwlNNt3vUPLOakHFnImiEbMq8Hbx4lbxKzBo
         F1HmF2f3xAkDYD0YMs02tbPo1DBisZDBFL2NCLDwLSY8LQbwmx0l9OpWQ/8mMP664D6l
         iwAqOtIXJckZFI0M1KjMh4ijlyA2IQrndhAbcCTHIlv8r9yZmPyyF5AeILT+1cGDpXch
         WiyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770912304; x=1771517104;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SnpZTRXVw8s2CXHghCnwci/ZkVwlVyjaksQVMB1Lk4o=;
        b=P1APnOj1mr6E9/+nIaYqQ15zzHsBJLtsX7HDGuBow3JF1zXqtViqGFVC+Q20py+WJR
         gX1PVEhRkxPIiUUbwlMm2xGKAwCdGfXtfaNvnFYzZwf2dgf3sMbTHBPQBkPhvztU4rXv
         Z6xovSkOxGO6GiazrpgXCTYQKyfVm/KWSwRIwL+qsrLhrw417d76Ii9OX/aqL4FMdxwS
         ZnquT4Zq+/Xr/rCGdlcyDyhJK6+vnKehs04ZlAv4M21H0N8qla6h3EsuboiVg3hwf43n
         koAaoemn+bb85ncbx+83qku4jC/N+hDpZKwRUsZXcbRKMWu/Sw+kvXsnV5z2Z6ftUSp4
         FprA==
X-Forwarded-Encrypted: i=1; AJvYcCWJOz1TNhZV3zstxwoghIWne/fKen1yP+dXObH3hriGoF0oyQB12Jqae8rCuJ2/pgdia0ay7CFzz7qv/QM3zA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwA4O9pyVFUg7lRuKM0pWdsWwbMNVoHI8UNrBQy/VFu3G596eSg
	NrSwDA+4T8KCLmtg/QaTtnHrkVd3mpHxFEP3pv2ymmVvvOj74Psk3PvCJkb1DkPMmA4mNZVwYMz
	gp2rVmTbl8WRUtgTL9k0A93gOGmdtaF9eBCiQZdbNfw==
X-Gm-Gg: AZuq6aKrlVWfG6T6LQUxob0wc/av3FmX50MnMKwAcRc1tk9KJQjegvcFEUUG7o5Q8cA
	Eu00Yoqd04xnh5JhqJtHTogg0dJttm1KnreygKQn0bHJfHK1E89sAIjw9deimVl4eXTX4d7EVpC
	Fhex51WJhCl2rCqnstRJMySCBehSCQEF7gdlXdXM98G6L7WmhqaM+diLxnySZuzYUT8n/21OcyC
	jKJkIXBT+zKBzJpLERnUktDFHjTAENb00ebgy8/4yO46CMHqKvScAbGhjX+1b04l3Z8ajbYcQ64
	CChtjaMczSKDssTHH5TTCbQGqHk1zXMeixySTulA5J5JNHYW2jtv
X-Received: by 2002:a05:6402:1d51:b0:65a:1d35:8f02 with SMTP id
 4fb4d7f45d1cf-65b96e23776mr1895067a12.33.1770912304279; Thu, 12 Feb 2026
 08:05:04 -0800 (PST)
MIME-Version: 1.0
References: <20260206033034.3031781-1-tzungbi@kernel.org>
In-Reply-To: <20260206033034.3031781-1-tzungbi@kernel.org>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu, 12 Feb 2026 09:04:52 -0700
X-Gm-Features: AZwV_Qi0tM27XEyjas6LWWUftEIAHKO8h9HFZERbJMTUtDu32gd6K5hxLfiAAy8
Message-ID: <CANLsYkzgNz6qxDDKnKiZE46UJmESnxT1-mnxo1Gtme-1x5MRsg@mail.gmail.com>
Subject: Re: [PATCH v2] remoteproc: mediatek: Unprepare SCP clock during
 system suspend
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_080507_059607_000F455B 
X-CRM114-Status: GOOD (  28.34  )
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

On Thu, 5 Feb 2026 at 20:31, Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> Prior to commit d935187cfb27 ("remoteproc: mediatek: Break lock
> dependency to prepare_lock"), `scp->clk` was prepared and enabled only
> when it needs to communicate with the SCP.  The commit d935187cfb27
> moved the prepare operation to remoteproc's prepare(), keeping the clock
> prepared as long as the SCP is running.
>
> The power consumption due to the prolonged clock preparation can be
> negligible when the system is running, as SCP is designed to be a very
> power efficient processor.
>
> However, the clock remains prepared even when the system enters system
> suspend.  This prevents the underlying clock controller (and potentially
> the parent PLLs) from shutting down, which increases power consumption
> and may block the system from entering deep sleep states.
>
> Add suspend and resume callbacks.  Unprepare the clock in suspend() if
> it was active and re-prepare it in resume() to ensure the clock is
> properly disabled during system suspend, while maintaining the "always
> prepared" semantics while the system is active.  The driver doesn't
> implement .attach() callback, hence it only checks for RPROC_RUNNING.
>
> Fixes: d935187cfb27 ("remoteproc: mediatek: Break lock dependency to prepare_lock")
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
>  drivers/remoteproc/mtk_scp.c | 39 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>

I will pick this up when rc1 comes out.

Thanks,
Mathieu

> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 4651311aeb07..bb6f6a16d895 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -1592,12 +1592,51 @@ static const struct of_device_id mtk_scp_of_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, mtk_scp_of_match);
>
> +static int __maybe_unused scp_suspend(struct device *dev)
> +{
> +       struct mtk_scp *scp = dev_get_drvdata(dev);
> +       struct rproc *rproc = scp->rproc;
> +
> +       /*
> +        * Only unprepare if the SCP is running and holding the clock.
> +        *
> +        * Note: `scp_ops` doesn't implement .attach() callback, hence
> +        * `rproc->state` can never be RPROC_ATTACHED.  Otherwise, it
> +        * should also be checked here.
> +        */
> +       if (rproc->state == RPROC_RUNNING)
> +               clk_unprepare(scp->clk);
> +       return 0;
> +}
> +
> +static int __maybe_unused scp_resume(struct device *dev)
> +{
> +       struct mtk_scp *scp = dev_get_drvdata(dev);
> +       struct rproc *rproc = scp->rproc;
> +
> +       /*
> +        * Only prepare if the SCP was running and holding the clock.
> +        *
> +        * Note: `scp_ops` doesn't implement .attach() callback, hence
> +        * `rproc->state` can never be RPROC_ATTACHED.  Otherwise, it
> +        * should also be checked here.
> +        */
> +       if (rproc->state == RPROC_RUNNING)
> +               return clk_prepare(scp->clk);
> +       return 0;
> +}
> +
> +static const struct dev_pm_ops scp_pm_ops = {
> +       SET_SYSTEM_SLEEP_PM_OPS(scp_suspend, scp_resume)
> +};
> +
>  static struct platform_driver mtk_scp_driver = {
>         .probe = scp_probe,
>         .remove = scp_remove,
>         .driver = {
>                 .name = "mtk-scp",
>                 .of_match_table = mtk_scp_of_match,
> +               .pm = &scp_pm_ops,
>         },
>  };
>
> --
> 2.53.0.rc2.204.g2597b5adb4-goog
>

