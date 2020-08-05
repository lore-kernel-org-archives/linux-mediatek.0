Return-Path: <SRS0=PAw8=BP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA987C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Aug 2020 06:30:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A13A8207FC
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Aug 2020 06:30:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L3kwR9+o";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SELbjQE3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A13A8207FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uHvPVXG8/vb31lLqql7Ssdp+kweIkj2oqBIW39pnfiw=; b=L3kwR9+oIK1DZsgbFtxAi5jIr
	RhLsJW96b2OrjPZj7zB55cCuRMwm8dAlWAeq2rjnByWbFde7C+7udItHFB/dWYTu6XeM9WkpMDtMC
	HiFIu3BjkiZT9uveljOppzbWDlJWYCMwMpkUQw3KbrGuoycYpGdK2ykdTooS6wdseynFCoWzsENmK
	c3L/NQkJ4bfRQzGXUIf04w54kjn0RywVWj5f0z+raPBlAdQDLy8UO90Y42KBUal3rBdVZQpItdaa5
	THl9vGCgE0wQWA++9PMbMK3E37S7eqhYc3727Wqub9fuGhlIoo3wSziOxI/aS53IVoONs2jZpmGLX
	jCla39JMQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3Cw6-0006ru-R2; Wed, 05 Aug 2020 06:30:02 +0000
Received: from mail-vs1-xe42.google.com ([2607:f8b0:4864:20::e42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3Cw1-0006qJ-I3
 for linux-mediatek@lists.infradead.org; Wed, 05 Aug 2020 06:29:58 +0000
Received: by mail-vs1-xe42.google.com with SMTP id 125so8120083vsg.2
 for <linux-mediatek@lists.infradead.org>; Tue, 04 Aug 2020 23:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PafBHgWX9Ed8Ls29XGCsvQo6W85zGUK4SY0StMcf7E0=;
 b=SELbjQE3Rc8NELPLzVKZILxdKMjbNPzHyd0Awr5gaQeDLxA6JLBa8CPgaUJ1T9YWxo
 DkMwT7lYT9LCU8zg6GQuOKmB0YsmPC9UjtOe235Q3uLRct550j8piRqET4CcZ8+zgcD0
 KahPFoqPQccvgsMP8M5LZ399tqk3ZUi6OVKVoHIM4ATwSHIceUIt8UZbilgsfHaRa8NH
 vKljP5BU4kePGjIbsvB3WQM0Fq2dUKB9BGJubAAaeL3HTJm3b6PTumfJ9XMtkVrt8cgP
 sCu/PvIuLa8tEv7OBDwH1tBTfKc8JoEh2Bspf3bpvcEAiAZByKAXFU7qfwWWamiwXIHf
 u4hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PafBHgWX9Ed8Ls29XGCsvQo6W85zGUK4SY0StMcf7E0=;
 b=K6A9SpZ+nwAulcIrEm9LiTTU8/pkmoGuHxh9mVyHl/spXpgct/bnFqJdHZpVri1YQy
 Ry3RVCLQqNWioJGBkRVmR1gvZGqDaGx/yregYWnzRYqaWGRpHeka2HzcmEIl9wIB0ZFQ
 lGcNUVoTFLJMchkJ1DdJH2PQwhPcz4eKOzucWxB3XjB8y+sjuT1kePa68m9t5/rksApG
 /DC1yCj0h0E3b4oAk5PgKFY9zxKZvjqlEJuzU3OAjTT2U6uHYz3VYOqU/T/BHGsV6GkD
 HNgYoPvrmy2D6CMV8wJxNWCL4HzXPPPs6QSiXIQyHsNEaOrjocQHanzgOHsqUxJDyHxy
 F9TA==
X-Gm-Message-State: AOAM530to2/cbv/7PJynKKIJO2fEtkzb0QpUZ5NieG8ETwnR2c/BEDU6
 5HPxFo4ct3NfBFxbIyCka6YsyqCf7jTt0jWK/9PBpg==
X-Google-Smtp-Source: ABdhPJzKr8nfy+DUtqVT/z3MLTu+xXv0yuzs0sknYVoyC0Fe26DahYb4Hw/jMmaoR+FMGZfzcJq4hAnWmnogcVRnsFo=
X-Received: by 2002:a67:8c06:: with SMTP id o6mr900047vsd.200.1596608995671;
 Tue, 04 Aug 2020 23:29:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200727171129.2945-1-weiyongjun1@huawei.com>
In-Reply-To: <20200727171129.2945-1-weiyongjun1@huawei.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 5 Aug 2020 08:29:19 +0200
Message-ID: <CAPDyKFpgBJ9YonJNvF-gtneSjn7furi0DD6i=SWxj-4JMQLU5Q@mail.gmail.com>
Subject: Re: [PATCH -next] mmc: mediatek: make function msdc_cqe_disable()
 static
To: Wei Yongjun <weiyongjun1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200805_022957_671193_DF9390FE 
X-CRM114-Status: GOOD (  16.44  )
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
Cc: Chun-Hung Wu <chun-hung.wu@mediatek.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Hulk Robot <hulkci@huawei.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 27 Jul 2020 at 19:11, Wei Yongjun <weiyongjun1@huawei.com> wrote:
>
> The sparse tool complains as follows:
>
> drivers/mmc/host/mtk-sd.c:2269:6: warning:
>  symbol 'msdc_cqe_disable' was not declared. Should it be static?
>
> This function is not used outside of mtk-sd.c, so this commit
> marks it static.
>
> Fixes: 88bd652b3c74 ("mmc: mediatek: command queue support")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/mtk-sd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 734e403a142e..4e2583f69a63 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -2266,7 +2266,7 @@ static void msdc_cqe_enable(struct mmc_host *mmc)
>         msdc_set_timeout(host, 1000000000ULL, 0);
>  }
>
> -void msdc_cqe_disable(struct mmc_host *mmc, bool recovery)
> +static void msdc_cqe_disable(struct mmc_host *mmc, bool recovery)
>  {
>         struct msdc_host *host = mmc_priv(mmc);
>
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
