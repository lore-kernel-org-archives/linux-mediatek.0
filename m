Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67857C4345F
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 May 2024 00:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uzev2xwn+5CekUtcLFz9kZ+58wNIVS2hbRZ3PNKfybs=; b=WvExpY8f5Cjdd5kkizbAtpiCod
	oQ8fjZ5OsVNtSZXFkR//1xjrCTqfKOErda/p2cxilB04jABMGN2Kdke8LTqxLQyHju+hOQkRuypsI
	SYE1EgE2YVV/wNiTtD6pkaLAi2AimNRKDWKdUzstbILBFJ/SoFzDqWGei/azeZLPpJSCpa/wtn6JO
	x7iQLHWjEmgkHu2j3XESaSSVGRWGUr6/sHzFJuBDZau4O0yBK7cfAfU/L0aOscoqvqrcXDmFeO4Jt
	DtOJBslb0QeN5xgEMY5yuI8kK9TO58CZBZlkS0/zvO5Nd8p6yny81FFpa4j/aOjEgnhH5B7JxEGQd
	CJ7lhsWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1yIZ-00000008Hsn-2gZY;
	Wed, 01 May 2024 00:58:15 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1yIW-00000008Hs6-0iN1;
	Wed, 01 May 2024 00:58:13 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a55b3d57277so769338666b.2;
        Tue, 30 Apr 2024 17:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714525086; x=1715129886; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uzev2xwn+5CekUtcLFz9kZ+58wNIVS2hbRZ3PNKfybs=;
        b=MdF4VtOfoaWW2eyRvM9mSOlpKvnHv6rHvyhwg6gz2O0VmMkGAsaWOnZYpwaYub/nbu
         IdscEc1pxqBKCztmFlnXw6nLyzdzbFi59TbWe155IzXjWfXCrFtAVpQ4ooN8rTYliyu4
         xGVCBuU7XyPMpIttmvqpckY+JtkzavYpaaM1oxLUxhdO/37/4KwSg6UDXovwuFFxSz2D
         /mqMezP6IBw07KV0VNRCP35SBtd3cqxBI0qM28Xt2oVC5d8D6OC7Rg5XNJUPRJbgJBWb
         bhnJNkmbYr9DP0vbldIECJ1qc/16q7qEBytlv3wC+hLl7CWvx/yXylKXdKk28SOaqJOU
         AucA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714525086; x=1715129886;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uzev2xwn+5CekUtcLFz9kZ+58wNIVS2hbRZ3PNKfybs=;
        b=tEUTaOBlmUCBlk5/JWd8XljqUU+/khjaJTgISYDgeoTVlNVtQrWUcbCtJp6fhBIZ4A
         gyqx4N+tse6Wd2UCAvlHF7xh5ZMcDxO5XdulyuXiVhKPPj6eF4gWUnRBSAsXSoSzwri5
         aYJyzCo+DXDDqoFvYouWpyWpDS6IaheaEHKcqAvqEZJeKozq2/SL7uKwkOzmNMQ9Ybre
         Z4ytXhQBDTHblibiK0l1ysx0BhQdooeYz++H79n4Ua1VFatYjkICWa7B1oE9KEeDdG/y
         AbI4Sif4NxfshKk/4yXN36s9uLBw7Lp6QWxuVy3r/vKfc/biGRBVbwS7go4W6vdI6rUF
         3/nw==
X-Forwarded-Encrypted: i=1; AJvYcCUoSANFI7Goftt8YdL76Hjv2V8StQOtFRRow+uKqDl4S30s24MV8iCMWWicjRahDKson697+gcCTt2e0y/024n3gbQV3Dyhrk8lDJmGSWMvbCVR++x/jU6vwQj6Ub6JzsDDhdOTw0y4Pa356LB4uS+rqN28h3UXNho=
X-Gm-Message-State: AOJu0Yyr9EvnyTOnS/3KuauA6xsy2lXV4cNbgzC1Ifkbp+MBzvkDy8Cq
	3ahUgQCBQDuiyGEysIdQie0KjonN5GgDKN8Pn/LZN6K64uGNtm4We/y2YUhlHhq8ITpNvCEmjyQ
	gK8FFn3cTyG8c1jcporeaTZjM5io=
X-Google-Smtp-Source: AGHT+IHHCy0c8dpes1GMk5LcfbECV9HNNXjpuNlZG8xwfgVN38aOQvdFlQiTlvl7jbzWeuwUHRhjEz8AmQbCH2E/qos=
X-Received: by 2002:a17:906:4bd0:b0:a58:c6b2:7885 with SMTP id
 x16-20020a1709064bd000b00a58c6b27885mr794543ejv.5.1714525085549; Tue, 30 Apr
 2024 17:58:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240430083934.26980-1-jason-jh.lin@mediatek.com> <2b46b3c0-f4ad-48e1-964b-128d29bafa9c@collabora.com>
In-Reply-To: <2b46b3c0-f4ad-48e1-964b-128d29bafa9c@collabora.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Tue, 30 Apr 2024 19:57:54 -0500
Message-ID: <CABb+yY1P5q8wHFOmTTR0sQnnS_gDeJB=f6tQ101bjY44qfHeDw@mail.gmail.com>
Subject: Re: [PATCH] mailbox: mtk-cmdq: Fix sleeping function called from
 invalid context
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Jason-ch Chen <jason-ch.chen@mediatek.com>, 
	Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, 
	Shawn Sung <shawn.sung@mediatek.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_175812_362019_FF50B886 
X-CRM114-Status: GOOD (  21.87  )
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

On Tue, Apr 30, 2024 at 4:39=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 30/04/24 10:39, Jason-JH.Lin ha scritto:
> > When we run kernel with lockdebug option, we will get the BUG below:
> > [  106.692124] BUG: sleeping function called from invalid context at dr=
ivers/base/power/runtime.c:1164
> > [  106.692190] in_atomic(): 1, irqs_disabled(): 128, non_block: 0, pid:=
 3616, name: kworker/u17:3
> > [  106.692226] preempt_count: 1, expected: 0
> > [  106.692254] RCU nest depth: 0, expected: 0
> > [  106.692282] INFO: lockdep is turned off.
> > [  106.692306] irq event stamp: 0
> > [  106.692331] hardirqs last  enabled at (0): [<0000000000000000>] 0x0
> > [  106.692376] hardirqs last disabled at (0): [<ffffffee15d37fa0>] copy=
_process+0xc90/0x2ac0
> > [  106.692429] softirqs last  enabled at (0): [<ffffffee15d37fc4>] copy=
_process+0xcb4/0x2ac0
> > [  106.692473] softirqs last disabled at (0): [<0000000000000000>] 0x0
> > [  106.692513] CPU: 1 PID: 3616 Comm: kworker/u17:3 Not tainted 6.1.87-=
lockdep-14133-g26e933aca785 #1 6839942e1cf34914b0a366137843dd2366f52aa9
> > [  106.692556] Hardware name: Google Ciri sku0/unprovisioned board (DT)
> > [  106.692586] Workqueue: imgsys_runner imgsys_runner_func
> > [  106.692638] Call trace:
> > [  106.692662]  dump_backtrace+0x100/0x120
> > [  106.692702]  show_stack+0x20/0x2c
> > [  106.692737]  dump_stack_lvl+0x84/0xb4
> > [  106.692775]  dump_stack+0x18/0x48
> > [  106.692809]  __might_resched+0x354/0x4c0
> > [  106.692847]  __might_sleep+0x98/0xe4
> > [  106.692883]  __pm_runtime_resume+0x70/0x124
> > [  106.692921]  cmdq_mbox_send_data+0xe4/0xb1c
> > [  106.692964]  msg_submit+0x194/0x2dc
> > [  106.693003]  mbox_send_message+0x190/0x330
> > [  106.693043]  imgsys_cmdq_sendtask+0x1618/0x2224
> > [  106.693082]  imgsys_runner_func+0xac/0x11c
> > [  106.693118]  process_one_work+0x638/0xf84
> > [  106.693158]  worker_thread+0x808/0xcd0
> > [  106.693196]  kthread+0x24c/0x324
> > [  106.693231]  ret_from_fork+0x10/0x20
> >
> > We found that there is a spin_lock_irqsave protection in msg_submit()
> > of mailbox.c.
> > So when cmdq driver calls pm_runtime_get_sync() in cmdq_mbox_send_data(=
),
> > it will get this BUG report.
> >
> > Add pm_runtime_irq_safe() to let pm_runtime callbacks is safe in atomic
> > context with interrupts disabled.
> >
>
> I see. The problem with this is that pm_runtime_irq_safe() will raise the=
 refcount
> of the parent device "forever", which isn't the best and partially defeat=
s what we
> are trying to do here (keeping stuff off unless really needed).
>
> At this point I wonder if it'd be just better to really fix this instead =
of working
> around the problem.
>
> I'd say that one of the options would be to perform a change to msg_submi=
t() so
> that it will take into account that a .send_data() callback might be usin=
g RPM
> functions.
>
> Ideas? :-)
>
@send_data:  The API asks the MBOX controller driver, in atomic
 *      context try to transmit a message on the bus. Returns 0 if
 *      data is accepted for transmission, -EBUSY while rejecting
 *      if the remote hasn't yet read the last data sent. Actual
 *      transmission of data is reported by the controller via
 *      mbox_chan_txdone (if it has some TX ACK irq). It must not
 *      sleep.

As long as send_data() does not sleep, ideas are welcome.

Cheers.

