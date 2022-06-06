Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57FBCC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jun 2022 10:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fg75xj4FZb23mitx3rxC0X+rDc2QYnlTaztSSITQ3bs=; b=FQ/cpuqhlEQZ3G
	0kGzhmpqS83yLQWx0Hyvq292iuI/6+NILM7OTSjUg13cNGjrLfjc+wLF0L45sdUL4RwuZntvaifV1
	/1S8taPK1a4ZP4LhuBfGd6KdVfVo5hy7eam4YJd0ncmP9+tMbVXxBcPsp6GdIQ9QJEveUorMeoRJT
	RxgZWpQeiMTds7SZLAJcJ3cLboO6QIh0PxW7HarWrlM5Ci6kKyyddOf87ERIzleWeqhabZdAI4+XS
	g9TKuknlc4rYyMNqTi5pjEtrWYy050D7K8eZ51hr5TtYHl3mnGu1G0oSSIXUtbZ7RYBnhvClRJA8+
	9JfdQG95+cLM4+Zdq0Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ny9ho-000eK4-R2; Mon, 06 Jun 2022 10:11:28 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ny9ds-000cLA-J5
	for linux-mediatek@lists.infradead.org; Mon, 06 Jun 2022 10:07:25 +0000
Received: by mail-ed1-x532.google.com with SMTP id 25so17826629edw.8
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Jun 2022 03:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2uwcCEtSswrsSeV8Oe+2oTvOp0hok5ZHYDzpgWGeOlQ=;
        b=DE69h8+Q3aglb3detW4jawOS1bRNj33jBRCuZvuuZpeknccYBlvm4xRpPjZqCT6xlC
         9tO5iUZhxoO2ZJv9IkPSVwStFjoyrmQ12dGIfOazv5x4tkDRdqtx3Odupd6yfsdLYL02
         9ZsU3L6IE2/ZPEDo9d54IFGjZLrLbHosPGwF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2uwcCEtSswrsSeV8Oe+2oTvOp0hok5ZHYDzpgWGeOlQ=;
        b=wAoKRaleXvJGquhjjaZF2j6QHITSUPBc/2kQpCNkqqK1nU/H7AmiuyHgiNRoJadJL8
         eG7WW+L6fYx5MdmXJqQvFsjYpwNZlGT1JIUY11o7QZ542P0YAczz5a9YLC1q9Fnt6LRQ
         Za4ehXS4j2Cf3HDTUWmBWkzNKTGRYa4krG0wtxIBT5OsryvDFf4kzcGrPFbkRVxkO3cp
         pqhNzctKwTrCHaQS+OBEmmibs71qnu7qxlz1B6SAuJvIBYUs/trXC3mNbkml8K4AXAnY
         RY223dQ+WDxulWGHmvn7yi1G78nyGzp0t2lleDsqiHmznSSRYjhsmBGuoUXWzZR/aWeH
         20pA==
X-Gm-Message-State: AOAM533OaW6HuzyJDqh6LwCtNhGYKXSPiAjIxtl5g8uMDswgu+h0IgLg
	T6ngB/cZoYrP0eDkOTmnJqbYElHdVBz1SNIObFtUMA==
X-Google-Smtp-Source: ABdhPJw0GXg99MvbQTKVkrNI4lLKZkQooYMuZvDOZ1tfUMZGtWWH5ppQgsFJTyLOn9eTLW43RxaLMTqeNMsUuS8GDAY=
X-Received: by 2002:aa7:c84d:0:b0:431:4226:70c9 with SMTP id
 g13-20020aa7c84d000000b00431422670c9mr9032595edt.51.1654510043095; Mon, 06
 Jun 2022 03:07:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220527110036.8810-1-johnson.wang@mediatek.com>
In-Reply-To: <20220527110036.8810-1-johnson.wang@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 6 Jun 2022 18:07:12 +0800
Message-ID: <CAGXv+5FZ9DthNaZCgaO6ygO4cUD91Bw1uVYJq98SHUcoAmPoPQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] Introduce MediaTek CCI devfreq driver
To: Johnson Wang <johnson.wang@mediatek.com>, cw00.choi@samsung.com
Cc: krzk+dt@kernel.org, robh+dt@kernel.org, kyungmin.park@samsung.com, 
	khilman@kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, jia-wei.chang@mediatek.com, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_030724_656181_02CA5BB0 
X-CRM114-Status: GOOD (  15.46  )
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

On Fri, May 27, 2022 at 7:01 PM Johnson Wang <johnson.wang@mediatek.com> wrote:
>
> The Cache Coherent Interconnect (CCI) is the management of cache
> coherency by hardware. CCI DEVFREQ is DVFS driver for power saving by
> scaling clock frequency and supply voltage of CCI. CCI uses the same
> input clock source and power rail as LITTLE CPUs on Mediatek SoCs.
>
> This series depends on:
> Chanwoo's repo: kernel/git/chanwoo/linux.git
> branch: devfreq-testing
> [1]: PM / devfreq: Export devfreq_get_freq_range symbol within devfreq
> [2]: PM / devfreq: Add cpu based scaling support to passive governor
> [3]: PM / devfreq: passive: Reduce duplicate code when passive_devfreq case
> [4]: PM / devfreq: passive: Update frequency when start governor
>
> Changes in v6:
> - Remove unnecessary "goto" statement.
>
> Changes in v5:
> - Modify some binding description.
> - Remove pre_voltage member.
> - Not to enable/disable intermediate clock.
> - Not to "put" resources that using devm_ variants.
>
> Resend v4:
> - CC interconnect maintainer.
> - Change sign-off sequence in commit message.
>
> Changes in v4:
> - Add a maintainer in the binding document.
> - Modify clock description.
> - Add binding document into MAINTAINERS.
> - Replace format specifier %d with %ld.
>
> Changes in v3:
> - Move binding document to 'interconnect' and rename it.
> - Add COMPILE_TEST dependence symbol.
> - Remove need_voltage_tracking variable.
> - Move mtk_ccifreq_voltage_tracking() code into mtk_ccifreq_set_voltage().
> - Add an interation limit in the while() loop.
> - Replace 'cci_dev' with 'dev'
> - Replace old_* with pre_*
> - Remove of_match_ptr()
> - Use module_platform_driver()
>
> Changes in v2:
> - Take MT8183 as example in binding document.
> - Use dev_err() instead of pr_err().
> - Use 'goto' statement to handle error case.
> - Clean up driver code.
>
> Johnson Wang (2):
>   dt-bindings: interconnect: Add MediaTek CCI dt-bindings
>   PM / devfreq: mediatek: Introduce MediaTek CCI devfreq driver

FTR,

Tested-by: Chen-Yu Tsai <wenst@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
