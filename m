Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0AD0C27C79
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jun 2024 18:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ceumPs6CQec2Ii8QHoLW6uVvM6OUIg9EFfPHe4qWsWE=; b=vnAOYL7ghpd7bmpyp0yf5l4pnW
	ObOnIF+Zv+dmZdxH9d+nx6ub5+cQ/TGdgcLW098e4z7Qar1w5fOYr9couFCSVsJOhQ/Rf3px94Cmr
	3pPrGpsuPTMGOH+vtVhyM3nyANXB9TzRlmn6kEASZssZSo5h9Y8BEA4LwMmSFyjcPXydO8LHJMR9j
	3p8Wff4QWkRw5vSsayeyANhLY5KZ9uPa9ULSC+Lz6MiyfYNLWA1gvvtfnkp0mUyNatkuYXriDzl/O
	qeyb2OWEaM2mYEYEONN/v/y87K6qkdePc2rZKt3TpdGqqO7k9ahAXdNdYT/VKt/UAB1P7OV2P686d
	tFxvAyQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJGwD-0000000C8ZL-2qd3;
	Mon, 17 Jun 2024 18:18:41 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJGw6-0000000C8Wy-2Kc2;
	Mon, 17 Jun 2024 18:18:40 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-52c4b92c09bso6082299e87.1;
        Mon, 17 Jun 2024 11:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718648309; x=1719253109; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ceumPs6CQec2Ii8QHoLW6uVvM6OUIg9EFfPHe4qWsWE=;
        b=Yw6VY1FqhdDnkt2TUQAj3ybu5++OqUbEhZv8dCSEIDi8a2NvA7l4tkkEv5YE0ffbYm
         6iR8aNAk0D/jII7QTa2Ea4gBP2NERNlxIX7wi69tCG8ko4BEm9Yd0pMPte6Z1nrFuDE3
         GqeVWnPV5fIE73R6MoBEiQBsd3ci1FCTYQOMYN/nAQsJ6PER5yBVKO2KN4JIa30sm86k
         jKVgpt/3v6Z5MMbZy9ZFGP+tjzgK/EZFdx/GojLD9bNf9+B6cq0W8aWNyCpwWOI1Vw+g
         nHJV23T+cegxgSU5Gey3fs5V/5nvu7241PlqUWtTjoqeSj+raweKEPSuLUQF+L9Eaxpu
         K1eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718648309; x=1719253109;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ceumPs6CQec2Ii8QHoLW6uVvM6OUIg9EFfPHe4qWsWE=;
        b=Bc9aeFhO9x2qWwwT1dnFCEvBqd9xJdHGrxoXiCY6fcCxu7QTaC8ps5g7fZ9s0A88zp
         xLcKzEmbJWiX+92LCffYKqkVssmEtlerTLgSG5SyCDkBl27BMCD5n9yL3pPYYONLYQLh
         iJPg7cb7vqAB0FntabvpZepXr1ZsBTm4ZpKtOvQQFrEB2bHHkWGLOMQVgkwQK/BNsy/n
         QJXezBrzmUm1zP6YDWUEpZGZ23N8lkg0zvM+obeqU3MVmL80BviEAgyYqMNuWMriP9DL
         PUUKZRCrF8s+QQAwqqLPqfXCPJMIvjcku4BQ2bPSGYc2tNI0MT4dRjFYX2kddjlAKRJV
         XcwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBvBzMjVYN7ABrAc9/0rnX/5CO4Fp1iAAKNQjdLnpmV+dDm8aCXNy9eIbkTTLDEdFlBMSLHT8S3/VSYhyUxbF1rIyc6NuG+EAquKZ4cQcLaTw25NPQ2q/B2/JLPA9EzU5gh51elvNkFJ0oqTVlJfRNn2x25cc3aX4=
X-Gm-Message-State: AOJu0YzokPqagCoyOJAkF0cMVoWnHMto3Y1jJeID1GsnDeIJdSExJAbT
	UXnPl3SHAU7ECybL+OvLb5Zso89d88PbAyoiIl1/FO6IXXm2L0IX2j7uLTlCqrvqyzZ9rQ0Nd1T
	09UZzEq09YOJgw/19qKKF3+Ntkztq7HLH
X-Google-Smtp-Source: AGHT+IEXnCfaKbC9VECLKvXP+gGDAdtlS2kXJD36wyau7KK+j3fKiPUEihIWyil45KdwIUkqEaNkbCk4Vt/mqTiW+z4=
X-Received: by 2002:a05:6512:3618:b0:52c:a7c8:ec42 with SMTP id
 2adb3069b0e04-52ca7c8ed39mr6903120e87.0.1718648309268; Mon, 17 Jun 2024
 11:18:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240614040133.24967-1-jason-jh.lin@mediatek.com> <20240614040133.24967-3-jason-jh.lin@mediatek.com>
In-Reply-To: <20240614040133.24967-3-jason-jh.lin@mediatek.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Mon, 17 Jun 2024 13:18:17 -0500
Message-ID: <CABb+yY2bwj2BcdJLGe1ZYwCrnXL3LtcePMb=wQPaBKorBSs2yA@mail.gmail.com>
Subject: Re: [PATCH 2/2] mailbox: mtk-cmdq: Move pm_runimte_get and put to
 mbox_chan_ops API
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Singo Chang <singo.chang@mediatek.com>, 
	Nancy Lin <nancy.lin@mediatek.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_111834_747346_CBA327AC 
X-CRM114-Status: GOOD (  12.32  )
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

On Thu, Jun 13, 2024 at 11:01=E2=80=AFPM Jason-JH.Lin <jason-jh.lin@mediate=
k.com> wrote:
>
> When we run kernel with lockdebug option, we will get the BUG below:
>   BUG: sleeping function called from invalid context at drivers/base/powe=
r/runtime.c:1164
>   in_atomic(): 1, irqs_disabled(): 128, non_block: 0, pid: 3616, name: kw=
orker/u17:3
>     preempt_count: 1, expected: 0
>     RCU nest depth: 0, expected: 0
>     INFO: lockdep is turned off.
>     irq event stamp: 0
>     CPU: 1 PID: 3616 Comm: kworker/u17:3 Not tainted 6.1.87-lockdep-14133=
-g26e933aca785 #1
>     Hardware name: Google Ciri sku0/unprovisioned board (DT)
>     Workqueue: imgsys_runner imgsys_runner_func
>     Call trace:
>      dump_backtrace+0x100/0x120
>      show_stack+0x20/0x2c
>      dump_stack_lvl+0x84/0xb4
>      dump_stack+0x18/0x48
>      __might_resched+0x354/0x4c0
>      __might_sleep+0x98/0xe4
>      __pm_runtime_resume+0x70/0x124
>      cmdq_mbox_send_data+0xe4/0xb1c
>      msg_submit+0x194/0x2dc
>      mbox_send_message+0x190/0x330
>      imgsys_cmdq_sendtask+0x1618/0x2224
>      imgsys_runner_func+0xac/0x11c
>      process_one_work+0x638/0xf84
>      worker_thread+0x808/0xcd0
>      kthread+0x24c/0x324
>      ret_from_fork+0x10/0x20
>
> We found that there is a spin_lock_irqsave protection in msg_submit()
> of mailbox.c and it is in the atomic context.
> So when cmdq driver calls pm_runtime_get_sync() in cmdq_mbox_send_data(),
> it will get this BUG report.
>
> To avoid using sleep in atomic context, move pm_runtime_get_sync to
> mbox_chan_ops->power_get and also move pm_runtime_put_autosuspend to
> mbox_chan_ops->power_put.
>
> Fixes: 8afe816b0c99 ("mailbox: mtk-cmdq-mailbox: Implement Runtime PM wit=
h autosuspend")

Can you please share the pattern of mailbox transfers on your platform?
As in, how often and long are the "channel idle" periods? And when
active, how many transfers/sec ?
I see every TX is acked by one RX packet. How long is the typical gap
between a TX and its ack?

Thanks

