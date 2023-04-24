Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2B77C6FD18
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Apr 2023 01:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x6aqoC9dPFtpf3SM23IBF/5iiAH7dEsrwMZeoRqWySc=; b=QfHRP0+v6j6LmdawdSx3NbE29f
	ZVSS8kN00GZ0PyFmATesafLO6EN6TVmEBWChH2Sp6r5jRRBSKubgB/S3AgMS9meTaACMzC0XtHm+o
	cJQ/gG6/v/KNQIoma550M4L72sWXWVyc/xOx1gI6EpSabZP+M3NmFMwwoiOKjv3z1oejtsgAOQKFq
	TgcUP65/ITYbr7RM9KdJU3epOAm5h87kyegIEQX5uRIlWGS3yoPkNoApEQrSp8QbdXRjyORXQvsMe
	KwAZnwZRAVd+B88WmweZJckI8dP26KbKjovYEJzGwZzn8e249w6lQeyMxSK0odplLdzCSfhp6RK0e
	WwAsTCmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pql7y-00F3F6-2s;
	Mon, 24 Apr 2023 01:36:26 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pql7t-00F3EI-2F;
	Mon, 24 Apr 2023 01:36:23 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2a8b082d6feso36584071fa.2;
        Sun, 23 Apr 2023 18:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682300174; x=1684892174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x6aqoC9dPFtpf3SM23IBF/5iiAH7dEsrwMZeoRqWySc=;
        b=h7dURazMP4F2Nh70Sh6/I/wMOfK4H5Aof0Bwsai9k0WhGXGYdh9RCDrNnje1Sy8CyL
         epfkNZFljEa38NoF6otxhl+GYI+NZHNU6bYPK+LH8v5zDUFdPsXb9cQkBsPllruXBua/
         e0AA9APX4lTV4wZdyO7WkJHv0OjE3Xmp2BtkKOU5zrOJz7aEK7fT1+TBDzrLW3hE0rIT
         PKgz8/BS+geIHyLYIFH0iiCgX6FnIZycUhlS2i57CpAsKshTho5YF56T2hT17T7KFfI1
         OF+hwg7D4L/jZXciE44vUQ+nrbsYe0t/SgN1l/bBM3MQPUqgRpQPo+FYdYtdz+WvVBAa
         iC0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682300174; x=1684892174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x6aqoC9dPFtpf3SM23IBF/5iiAH7dEsrwMZeoRqWySc=;
        b=PQANuZddxLWYsrSNeCVL1Z23aH9vsnzvOSIOr17gZk+dnRAZFLJSbJ4D21GEVc4Yly
         mDozWRn1OoiWRAfAdhLqoAFU4czp33/M1G/D5LzM7a21q6vJ2ZCkWb5Rpu2ogVaDBEiQ
         1plCSImG27b5Ejuwtmo9ndT0oEvyW9wp0UyQ73wkQVFik2CveKTpR9MUmLILGtfD8QKE
         mCNvy0IyswCBPm3ues+fnr6dmSg50aDxpmtf0XJ16S5BRKoz1wbwjoaWZFLnba/vhPxN
         k7MmeYhf2PMG98vTaHLQrfLKB4xuinxTbMuVSa8+xdgnbtyp2pyLQxi2Z/kyOODGNa+B
         y+aQ==
X-Gm-Message-State: AAQBX9dOfDVyTvTN1Q7IbAUozVu6l0R2kZrV/iQfaJ32ATj/5a0Q4RlX
	OFSe2pABVKdekh0fjKDcJM/0YNc0AGH1OLMUug==
X-Google-Smtp-Source: AKy350bgD/CUSWWCOBwCf63h+PjnZokihstmsZMZBSNM1B/NhgpICayXhu+ukCYsQYF0/iBspyFHjJHMi/ggotOwTUI=
X-Received: by 2002:a2e:8187:0:b0:2a8:bb4b:fd94 with SMTP id
 e7-20020a2e8187000000b002a8bb4bfd94mr2460334ljg.0.1682300174012; Sun, 23 Apr
 2023 18:36:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230421075636.24946-1-alice.chao@mediatek.com>
In-Reply-To: <20230421075636.24946-1-alice.chao@mediatek.com>
From: Stanley Chu <chu.stanley@gmail.com>
Date: Mon, 24 Apr 2023 09:36:02 +0800
Message-ID: <CAGaU9a-zQTz8hTxkLk-OT6QXqbkMQqYN5svqkJDPpZmiJrzSsw@mail.gmail.com>
Subject: Re: [PATCH 1/1] ufs: core: fix &hwq->cq_lock deadlock issue
To: Alice Chao <alice.chao@mediatek.com>
Cc: alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org, 
	jejb@linux.ibm.com, martin.petersen@oracle.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, quic_asutoshd@quicinc.com, 
	quic_cang@quicinc.com, mani@kernel.org, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, stanley.chu@mediatek.com, 
	peter.wang@mediatek.com, chun-hung.wu@mediatek.com, powen.kao@mediatek.com, 
	naomi.chu@mediatek.com, cc.chou@mediatek.com, chaotian.jing@mediatek.com, 
	jiajie.hao@mediatek.com, tun-yu.yu@mediatek.com, eddie.huang@mediatek.com, 
	wsd_upstream@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230423_183621_779108_38FA11B5 
X-CRM114-Status: GOOD (  11.54  )
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

Hi Alice,

Alice Chao <alice.chao@mediatek.com> =E6=96=BC 2023=E5=B9=B44=E6=9C=8821=E6=
=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=883:58=E5=AF=AB=E9=81=93=EF=BC=9A
>
> [name:lockdep&]WARNING: inconsistent lock state
> [name:lockdep&]--------------------------------
> [name:lockdep&]inconsistent {IN-HARDIRQ-W} -> {HARDIRQ-ON-W} usage.
> [name:lockdep&]kworker/u16:4/260 [HC0[0]:SC0[0]:HE1:SE1] takes:
>   ffffff8028444600 (&hwq->cq_lock){?.-.}-{2:2}, at:
> ufshcd_mcq_poll_cqe_lock+0x30/0xe0
> [name:lockdep&]{IN-HARDIRQ-W} state was registered at:
>   lock_acquire+0x17c/0x33c
>   _raw_spin_lock+0x5c/0x7c
>   ufshcd_mcq_poll_cqe_lock+0x30/0xe0
>   ufs_mtk_mcq_intr+0x60/0x1bc [ufs_mediatek_mod]
>   __handle_irq_event_percpu+0x140/0x3ec
>   handle_irq_event+0x50/0xd8
>   handle_fasteoi_irq+0x148/0x2b0
>   generic_handle_domain_irq+0x4c/0x6c
>   gic_handle_irq+0x58/0x134
>   call_on_irq_stack+0x40/0x74
>   do_interrupt_handler+0x84/0xe4
>   el1_interrupt+0x3c/0x78
> <snip>
>
> Possible unsafe locking scenario:
>        CPU0
>        ----
>   lock(&hwq->cq_lock);
>   <Interrupt>
>     lock(&hwq->cq_lock);
>   *** DEADLOCK ***
> 2 locks held by kworker/u16:4/260:
>
> [name:lockdep&]
>  stack backtrace:
> CPU: 7 PID: 260 Comm: kworker/u16:4 Tainted: G S      W  OE
> 6.1.17-mainline-android14-2-g277223301adb #1
> Workqueue: ufs_eh_wq_0 ufshcd_err_handler
>
>  Call trace:
>   dump_backtrace+0x10c/0x160
>   show_stack+0x20/0x30
>   dump_stack_lvl+0x98/0xd8
>   dump_stack+0x20/0x60
>   print_usage_bug+0x584/0x76c
>   mark_lock_irq+0x488/0x510
>   mark_lock+0x1ec/0x25c
>   __lock_acquire+0x4d8/0xffc
>   lock_acquire+0x17c/0x33c
>   _raw_spin_lock+0x5c/0x7c
>   ufshcd_mcq_poll_cqe_lock+0x30/0xe0
>   ufshcd_poll+0x68/0x1b0
>   ufshcd_transfer_req_compl+0x9c/0xc8
>   ufshcd_err_handler+0x3bc/0xea0
>   process_one_work+0x2f4/0x7e8
>   worker_thread+0x234/0x450
>   kthread+0x110/0x134
>   ret_from_fork+0x10/0x20
>
> ufs_mtk_mcq_intr() could refer to
> https://lore.kernel.org/all/20230328103423.10970-3-powen.kao@mediatek.com=
/
>
> When ufshcd_err_handler() is executed, CQ event interrupt can enter
> waiting for the same lock. It could happened in upstream code path
> ufshcd_handle_mcq_cq_events() and also in ufs_mtk_mcq_intr(). This
> warning message will be generated when &hwq->cq_lock is used in IRQ
> context with IRQ enabled. Use ufshcd_mcq_poll_cqe_lock() with
> spin_lock_irqsave instead of spin_lock to resolve the deadlock issue.
>
> Signed-off-by: Alice Chao <alice.chao@mediatek.com>
> ---

After adding a Fixes: tag, feel free to add,

Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>

