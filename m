Return-Path: <SRS0=bV6b=D6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD45DC55179
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 12:11:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13D59208E4
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 12:11:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="smFd/pba";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="F2petIDg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="x3wTaTK2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13D59208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WkRE0IUndWQaY0vaVuPknqtzPu7Ekg5kHylISlU3Taw=; b=smFd/pbaJ5nefu7D+LL/g2ORv
	sZaO7DPxwQUZ+RY+fHLcuql9UbCIdabi2pw0gIQ9MVwglF0L9MMk7Q1KF8/VehpgR51Q0NKXPTNnI
	9TmIL49iSXjGmADu+b1vmxEyxjGTRk94LL0ydEjdCFGl8VZNH69uhMAva8KSrp3kXdVIGg+UiV6Cs
	/DoR5o0wIDOFnuhMOs006Q1omCIl8NWaSeTGNN+Nqzb5Y9kfR/iA3+fQZVmBL0dlNN1i4b5io+MWu
	pOZoffIn5xWNJ+hmfUoNPjSs9XNr6vB/FA8n632p5coMRJSaTQX7DBdw/MGIuWEDzCqgDhMUjGvwY
	ka8ho6IXg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVvup-0006U2-Q8; Fri, 23 Oct 2020 12:11:27 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVvum-0006TL-Sg; Fri, 23 Oct 2020 12:11:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:Cc:List-Id:To:Subject:
 Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=pwa1zX/dylKMr2F0KjT/tv/JDd9XrtL4YRMZBR+2IFk=; b=F2petIDgDaT+gI8cjyTBZ1QDOO
 Mj5BmOPr7Mo7DdPoEtzBw+hHMnxsqfqz/TvVptNUqvY8szHXMNpV/nLZo2L80N8UehmSm/wELcJY6
 aX8JvmeF1mjG64s9qxPyEJLtABUyuZ/eA3qJCL13WTchCbCEgW1bCb7OI3+Dprn2Du4UFMFZyRTyX
 YQjz46mQPtvupUPQIDSYUYvhR4PflbqvDZVA0ksskCxXO/2DLGk5nwMpFPTH8rWuHxkzJJLG2NTVI
 RSEdzoGt72c84Gr4UlpKvbKcqTw+9CkKL5UlxhRbobTJiOmuEqmxaHZyN3qHgDKOlzFxiwMcoQqzZ
 F/GbULew==;
Received: from mail.kernel.org ([198.145.29.99])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVvuj-0000hn-1E; Fri, 23 Oct 2020 12:11:24 +0000
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
 [209.85.166.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BC8CA24182;
 Fri, 23 Oct 2020 12:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603455075;
 bh=zTz0bRSApTPYOppSNodzB/6/jw7ty/VjpWmXL7j4xj4=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=x3wTaTK2gKQ8pt/nzzVj31XKrFPk6eE+7C4MOXEHsNFU+Gpg4AYNKBkRpB7AsBMXz
 stb5nnEnfIxpkOvgy9vH583Ys9zUOh5DropTwKhR3B8BlyBGoa3YANfJNxnvci7U/V
 6KvaE3YwDNcNATs+eZ7TxyehMfKQIILpeazoh3fs=
Received: by mail-io1-f43.google.com with SMTP id q25so1477748ioh.4;
 Fri, 23 Oct 2020 05:11:15 -0700 (PDT)
X-Gm-Message-State: AOAM531eJfbCYy2EhLgV/f7caSpg+oDiHnXpP7xUVPRvUzgdUPS2gYTe
 g6yn930ina4XX24yNIKVzJwPtHAdjlXmG+/qcHw=
X-Google-Smtp-Source: ABdhPJyHkVe08MTTutYFTIB7Sx75pqDLpP4/v0y3HuYeQjSqJcuL0d5HzFpepTPbbFffr/L1b8lt8LMrvzjfhes5oRM=
X-Received: by 2002:a02:b052:: with SMTP id q18mr1610741jah.81.1603455075082; 
 Fri, 23 Oct 2020 05:11:15 -0700 (PDT)
MIME-Version: 1.0
References: <20201023091026.32066-1-irui.wang@mediatek.com>
In-Reply-To: <20201023091026.32066-1-irui.wang@mediatek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 23 Oct 2020 08:11:04 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6XZ_GZ4SCKiCCX-e3xR9eV7hJqfXgwo33zk7BvibsHpw@mail.gmail.com>
Message-ID: <CA+5PVA6XZ_GZ4SCKiCCX-e3xR9eV7hJqfXgwo33zk7BvibsHpw@mail.gmail.com>
Subject: Re: pull request: linux-firmware: mediatek: separate venc service
 thread
To: Irui Wang <irui.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201023_131121_800044_48F5984E 
X-CRM114-Status: GOOD (  16.33  )
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
List-Id: <linux-firmware.lore.kernel.org>
Cc: Andrew-CT.Chen@mediatek.com, Maoguang Meng <Maoguang.Meng@mediatek.com>,
 srv_heupstream@mediatek.com, Yunfei Dong <Yunfei.Dong@mediatek.com>,
 Erin Lo <erin.lo@mediatek.com>, Longfei Wang <Longfei.Wang@mediatek.com>,
 Linux Firmware <linux-firmware@kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>, PoChun.Lin@mediatek.com,
 Tiffany Lin <tiffany.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Pulled and pushed out.

josh

On Fri, Oct 23, 2020 at 5:10 AM Irui Wang <irui.wang@mediatek.com> wrote:
>
> Hi linux-firmware maintainers,
>
> The following changes since commit 58d41d0facca2478d3e45f6321224361519aee96:
>
>   ice: Add comms package file for Intel E800 series driver (2020-10-05 08:09:03 -0400)
>
> are available in the Git repository at:
>
>   https://github.com/irui-wang/linux_fw_vpu_v1.1.5.git v1.1.5
>
> for you to fetch changes up to 76ceac823c3f5e867e8a22d6505993fe49f602d9:
>
>   mediatek: separate venc service thread (2020-10-23 16:43:57 +0800)
>
> ----------------------------------------------------------------
> Irui Wang (1):
>       mediatek: separate venc service thread
>
>  mediatek/mt8173/vpu_d.bin | Bin 2977184 -> 2977184 bytes
>  mediatek/mt8173/vpu_p.bin | Bin 131180 -> 131180 bytes
>  2 files changed, 0 insertions(+), 0 deletions(-)
>
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
