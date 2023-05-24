Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4198BC7EE2D
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 May 2023 13:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8YMChv0Kbwi+1uRdxv5SOqopG6OU3NDn7YchG3hX0Iw=; b=HpjL4t0Kn9A6L/omn7q8OA39WN
	uYfQx8FdnGiys3DsB8ukSZx8OxdaVyWBDZCY9q7CllqSis+hDS5TQVs/9hRAHNnLjS4VbiF3fNFLx
	pKUujGHXUpXYfJu5nT4pr16OXbTi/9C1nX3xWg+NQ3tkF+zQhQ2JTA6Hkn7b+VJcB6PZgOdIFBGYR
	KFNWfrOYK1HwLsViRS9oqCb7b+b3f4rDsLygk3OgZc+KiMoE7oV45GvcJmYgpX/OPB0PJ+vs3MLJK
	jbSUU0jYeJEkRAaRe/LM3IhxUcigw0qCvbjFbqAZpPZm2zODCAKkAHbe3RV85ym1Rs0sb0/ab7Nu0
	mAwecwYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1oHD-00DXZq-1T;
	Wed, 24 May 2023 13:11:39 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1oH3-00DXUZ-28
	for linux-mediatek@lists.infradead.org;
	Wed, 24 May 2023 13:11:31 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-56187339d6eso13278707b3.2
        for <linux-mediatek@lists.infradead.org>; Wed, 24 May 2023 06:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684933885; x=1687525885;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8YMChv0Kbwi+1uRdxv5SOqopG6OU3NDn7YchG3hX0Iw=;
        b=FzhfdVCfaEF8SeFwWuGcxH53uaFvlyDENmSU3rCkUWDk0E0q3sFBoCrO7Tdr46T3r4
         Vyjr7hIn2/iQaJZ/65nivMCr8UpwPV/A1tBlrI4EGVPm3yni77wjoHJH9E4yfmoPgS4v
         gaOAUYjzUnzM2AQZrdtrHAatCfewAiN5c00Jru3Smpl4RIBRuwmT9CNa3wQA891lqDC1
         ZVAiD8hq/eV6blv1yT/lBY8oCwZ1g9me6RH8R3R5vgSgOLct8/rZq19C9GfHFJaqUNET
         Gr1jwoCG6svyPkrBYWFh5VJRypt3KC7ukY5ySxmBTcKNA1JYAERPQWVJi2G5q9bPujxb
         rfQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684933885; x=1687525885;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8YMChv0Kbwi+1uRdxv5SOqopG6OU3NDn7YchG3hX0Iw=;
        b=QKpVGqc2BANck/M1VbZ8L0cJM5mI4cVD+j6jNiTUVhsvOgDlK8bv46qI/dRd4D7a/7
         QhtJDu/SYDOdJzwUBW9JkLVXzkfwFy/zvQTFqMtBzOQTwe1ziULXVbEZDSQorA4SxxmJ
         m32mUO4lbiKytFUWKr7joHvs4q25TSslyDbyopiQCXlIKbu4TKSjVodnl8NSQ00GXIjs
         zsUz4D1tOciWPSZ592qZBZ3YwkXTNIb99ht1ZlqC6JjiY3EhmfPP1l5vuEHOveYEA0uo
         8+nm9pD9Q/bkJLTAURdAepPxTdGznyOYGy5gIrZDH/+6V88KOA4H9IaA2GJrHc3okFuV
         MrWw==
X-Gm-Message-State: AC+VfDxZrO5g+cyBU9lZjFC1vVBZKYcNLk06oxRGKDBWX72+nX9bBBo5
	XmFgb0/z+DYiUW09t7a+c+XGeBrx5yZ62QYtJHidsw==
X-Google-Smtp-Source: ACHHUZ5jC4QdtoAG2YFQReK8EIv0ceZyovFAuJzf8NehJc1JaI9nZSehPe/mk/8GQTmaDHWY9QXTNtT6G3XHe5ugM+I=
X-Received: by 2002:a81:71d7:0:b0:55d:a4fb:864a with SMTP id
 m206-20020a8171d7000000b0055da4fb864amr18918048ywc.14.1684933885028; Wed, 24
 May 2023 06:11:25 -0700 (PDT)
MIME-Version: 1.0
References: <048cd6972c50c33c2e8f81d5228fed928519918b.1683987673.git.deren.wu@mediatek.com>
In-Reply-To: <048cd6972c50c33c2e8f81d5228fed928519918b.1683987673.git.deren.wu@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 24 May 2023 15:10:49 +0200
Message-ID: <CAPDyKFoTkEp53hxw3rC1H2n+Z6Jm9DkSND8=PSd-3oFehWEeOQ@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: vub300: fix invalid response handling
To: Deren Wu <deren.wu@mediatek.com>
Cc: linux-mmc <linux-mmc@vger.kernel.org>, 
	linux-mediatek <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_061129_702888_1282E276 
X-CRM114-Status: GOOD (  17.76  )
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

On Sat, 13 May 2023 at 16:49, Deren Wu <deren.wu@mediatek.com> wrote:
>
> We may get an empty response with zero length at the beginning of
> the driver start and get following UBSAN error. Since there is no
> content(SDRT_NONE) for the response, just return and skip the response
> handling to avoid this problem.
>
> Test pass : SDIO wifi throughput test with this patch
>
> [  126.980684] UBSAN: array-index-out-of-bounds in drivers/mmc/host/vub300.c:1719:12
> [  126.980709] index -1 is out of range for type 'u32 [4]'
> [  126.980729] CPU: 4 PID: 9 Comm: kworker/u16:0 Tainted: G            E      6.3.0-rc4-mtk-local-202304272142 #1
> [  126.980754] Hardware name: Intel(R) Client Systems NUC8i7BEH/NUC8BEB, BIOS BECFL357.86A.0081.2020.0504.1834 05/04/2020
> [  126.980770] Workqueue: kvub300c vub300_cmndwork_thread [vub300]
> [  126.980833] Call Trace:
> [  126.980845]  <TASK>
> [  126.980860]  dump_stack_lvl+0x48/0x70
> [  126.980895]  dump_stack+0x10/0x20
> [  126.980916]  ubsan_epilogue+0x9/0x40
> [  126.980944]  __ubsan_handle_out_of_bounds+0x70/0x90
> [  126.980979]  vub300_cmndwork_thread+0x58e7/0x5e10 [vub300]
> [  126.981018]  ? _raw_spin_unlock+0x18/0x40
> [  126.981042]  ? finish_task_switch+0x175/0x6f0
> [  126.981070]  ? __switch_to+0x42e/0xda0
> [  126.981089]  ? __switch_to_asm+0x3a/0x80
> [  126.981129]  ? __pfx_vub300_cmndwork_thread+0x10/0x10 [vub300]
> [  126.981174]  ? __kasan_check_read+0x11/0x20
> [  126.981204]  process_one_work+0x7ee/0x13d0
> [  126.981246]  worker_thread+0x53c/0x1240
> [  126.981291]  kthread+0x2b8/0x370
> [  126.981312]  ? __pfx_worker_thread+0x10/0x10
> [  126.981336]  ? __pfx_kthread+0x10/0x10
> [  126.981359]  ret_from_fork+0x29/0x50
> [  126.981400]  </TASK>
>
> Fixes: 88095e7b473a ("mmc: Add new VUB300 USB-to-SD/SDIO/MMC driver")
> Signed-off-by: Deren Wu <deren.wu@mediatek.com>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
> v2: add Fixes tag
>     update commit description
> ---
>  drivers/mmc/host/vub300.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/mmc/host/vub300.c b/drivers/mmc/host/vub300.c
> index e4c4bfac3763..9ec593d52f0f 100644
> --- a/drivers/mmc/host/vub300.c
> +++ b/drivers/mmc/host/vub300.c
> @@ -1713,6 +1713,9 @@ static void construct_request_response(struct vub300_mmc_host *vub300,
>         int bytes = 3 & less_cmd;
>         int words = less_cmd >> 2;
>         u8 *r = vub300->resp.response.command_response;
> +
> +       if (!resp_len)
> +               return;
>         if (bytes == 3) {
>                 cmd->resp[words] = (r[1 + (words << 2)] << 24)
>                         | (r[2 + (words << 2)] << 16)
> --
> 2.18.0
>

