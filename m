Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDB82C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Apr 2022 13:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CYa1EjCjv+uVDrOmp85ho1JxoRd3G+9nisrn2fpPmzo=; b=pLIQb/2g9eVqJy
	RETsYtuLCIa0w54ImBYfewC6HcDxNzShA60ZX2RFcDba7y9pOIxq1RlrATZBYenOxlRmPIDT0F5fU
	OTmoa0XE1YNQ7HyNnhMfvVHHoLvARRLR0V3Ns/MXwFtZd7XjlFUgLV+JLlof06xYnyCPvPKPL0dgc
	tBUwCS5sabWNqmG7uE+QvjqMXA6aO1L5dtcsy4l3VvrctJGk5dXDboJRagM7qTtj+Y9sIiDxsD0hP
	Ym5R8/1ltqqVeeuBCZlvWmfZYEjJkTqK0aoBff32YWxDLYFrLv/RhgN/PdG5hbtUIPM5/tbZEcrK6
	14DgtDoFWklZFdbgBPwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndtpa-0096Fj-Pm; Mon, 11 Apr 2022 13:11:46 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndtpP-0096EQ-Hl; Mon, 11 Apr 2022 13:11:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id F3075B815E0;
 Mon, 11 Apr 2022 13:11:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E2A8C385AA;
 Mon, 11 Apr 2022 13:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649682692;
 bh=4xJp5ayEkL1rkv0YZry6+V39FNge8pyIHEgWuMnKLJ8=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=ANVnl0hciFsRpT3+Pz5GS64JbvWezL8CowZ2fwne8m15ksqeHAioojqtlOkQvDdZp
 AGwh4MDOlJeO0iMWXHkZgVcM3Q+TxsyfbinHyUzXjGzpeR7W36g9bm1ulh1RHqAuqT
 bLztypr2y/FQwgSTsy3qJ7d1GsAN5TvB/lnMcSl8fKERWrTXd7KDJNnCCMaRD4q90C
 8fzwQt0pjQ6HMMpFmwg5gbZHjIR2bqDQpP2T85rrENj65z0rhj2/ppPjeFLDH5jKR8
 z2uh5uQ0Vxuzvx7Nlef8YNjJs0/lwKiJqXqWti2WQBwZs9WjgnuKxLydAY/rnGdW2V
 6Ef9trTz7wXYg==
Received: by mail-io1-f53.google.com with SMTP id p135so12678151iod.2;
 Mon, 11 Apr 2022 06:11:32 -0700 (PDT)
X-Gm-Message-State: AOAM533+WQio302fClew8hyhQMaHTJmHWMYSA7jqQzwwb7XEBy7z2lBW
 GyhwujzikrOb3ZN8W1qE+uQu2da9T48peovaspE=
X-Google-Smtp-Source: ABdhPJyzV3x2bWZaTufPAzv2zecyCld8iJbjMJtigE1TjFRKkXu2FSTJr0G8zMUaqKGMFPagHk5W7weYtn1S4UoPpp4=
X-Received: by 2002:a6b:b704:0:b0:649:eccd:d46a with SMTP id
 h4-20020a6bb704000000b00649eccdd46amr12602597iof.55.1649682691704; Mon, 11
 Apr 2022 06:11:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220411120545.20066-1-yunfei.dong@mediatek.com>
In-Reply-To: <20220411120545.20066-1-yunfei.dong@mediatek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 11 Apr 2022 09:11:21 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6KtJpppj2hj9CmSyG6cf4KkttF3acox0j+U8VLcZzopQ@mail.gmail.com>
Message-ID: <CA+5PVA6KtJpppj2hj9CmSyG6cf4KkttF3acox0j+U8VLcZzopQ@mail.gmail.com>
Subject: Re: pull request: linux-firmware: Create Mediatek MT8192 SCP firmware
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Linux Firmware <linux-firmware@kernel.org>, 
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 linux-arm-kernel@lists.infradead.org, 
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 tinghan.shen@mediatek.com, 
 Irui Wang <irui.wang@mediatek.com>, srv_heupstream@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_061135_758771_0D68545C 
X-CRM114-Status: GOOD (  16.93  )
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

On Mon, Apr 11, 2022 at 8:05 AM Yunfei Dong <yunfei.dong@mediatek.com> wrote:
>
> The following changes since commit 681281e49fb6778831370e5d94e6e1d97f0752d6:
>
>   amdgpu: update PSP 13.0.8 firmware (2022-03-18 07:35:54 -0400)
>
> are available in the Git repository at:
>
>   https://github.com/yunfeidongmediatek/linux_fw_scp_8192 v1
>
> for you to fetch changes up to ae8dfb4a5d4c6028ee1fca04b374b0e03ec35360:
>
>   mediatek: Add mt8192 SCP firmware (2022-04-11 20:00:24 +0800)
>
> ----------------------------------------------------------------
> Yunfei Dong (1):
>       mediatek: Add mt8192 SCP firmware
>
>  WHENCE                  |   3 +++
>  mediatek/mt8192/scp.img | Bin 0 -> 309436 bytes
>  2 files changed, 3 insertions(+)
>  create mode 100644 mediatek/mt8192/scp.img

Pulled and pushed out.  Thanks.

josh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
