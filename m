Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94042C4828D
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Feb 2024 14:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bF+ioF4rU6hYdKskdmBXlkag6Ll/8Irxamnq5jEhMXI=; b=mCPjaxYOgk8BiC39kFtJ8TUqEE
	LjcK30WXSusrnzZDJbSaPcDY1m/V3opbtKj1hJczVfruWOrqUNKQLTWTznDC/wn/LkAudhbtjgb9h
	gzbESa1bjwQpzbuM/vqaxN2v8Wdrn8WUxqIyJE/lka45K7em7rbjsotcLHSiywZOcTltLKaiqVd8m
	l7UQxUQbmRKtzx+jZSPZe6q1E/C8uRLJyzlrvSR0qmdqtRVnI9SD4EJiDO7JVAnK9NzurX1kUTUpN
	pzZXX4W0doqgWphAcLuw3rTZPrkHa0zkNT97IVvVVb9muga1928qenoGsk1+LPbEN49p5I/mciw2X
	M+qFnobQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX0Cj-00000003ed3-06qp;
	Mon, 05 Feb 2024 14:44:13 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX0Cf-00000003ecL-2j53;
	Mon, 05 Feb 2024 14:44:10 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2d0512f6e32so53614781fa.1;
        Mon, 05 Feb 2024 06:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707144245; x=1707749045; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bF+ioF4rU6hYdKskdmBXlkag6Ll/8Irxamnq5jEhMXI=;
        b=RCRpJJxAZTCAJDc0gQla9Wcs4487X46SwjPQ+/wmYhGKsLt8zsDcCP8xrl08KXBWA0
         YShKzQWCO0gM1188gVXOfnyW8FIeRfGGmWErw1wQWOw1QMoF38A1bT6Ez+jrnTuGWdWk
         3W5nDxft9R/FYyM53azThvSnDu2F+7CjspXqnBkgJTvsG4W11q898dPOnMK9Ra30HPxN
         XS+Fz/tJWGobpgEiQwJp+PjRC5NHColpvIOUHOSxdBdkGVPj356voooAtSTlISBXalph
         ZGiaFRO/Is06vxaZ/h9bq5z+q33u1quxvfOpW044Dbr8Ll7/Xj9JXMETc7Jo5iWfesIA
         8nhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707144245; x=1707749045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bF+ioF4rU6hYdKskdmBXlkag6Ll/8Irxamnq5jEhMXI=;
        b=rgvD3wsJduLExVjvaLWuqOg7Gq0KsKT0nORVgMqY4vVfofE5PkEOADShTt3bmVVGTb
         eXhGlUeGaijAQ4GrmedIqtsJoW0DiH/Jf93q2qlfmiDehVE11VAaxty9BEAYiky8HM10
         lvuACKwUHyCYz8s+5MoDRsb4R3n/BembYYriZdKjpH4Rxl2lI9//rZigVRYjNIOqB9mD
         /58M6DSKTtRDsLkQMgzFAbOv0zV+lq6sTRkAG/PcYQKUyr9BRr7XEcyS1Rh/zgWIfvnM
         U3bu+76RWtVrxnodD6PYoBNBijbF1Hljb2fu70qMvPV8430wcor5R3OTwAZJ4byvk7iU
         n2Kw==
X-Gm-Message-State: AOJu0Yy8LuKa+rDnim/wOumZLvD0SzXmfR3gnawXamDYFvq/Qzhag4cf
	QWVjqhaMQK6GsVMe54sEV21bBzcF9c+JEPqxOR6yKvVrUMUsz3P7vS/ovNoTNqEGqBZrNbyPAU/
	x7No3PLxMGzYDL4KMCfHSlru+xw==
X-Google-Smtp-Source: AGHT+IGmWKx8ItqhTYnDkpaf28i4Fx1v2apIgAI/fIL955Sgbj0u6jNf4TZdLG7QNW8CbT27NNtf1zL8vJxNXjynXgY=
X-Received: by 2002:a05:651c:214:b0:2d0:aae6:bf2e with SMTP id
 y20-20020a05651c021400b002d0aae6bf2emr2255789ljn.34.1707144244549; Mon, 05
 Feb 2024 06:44:04 -0800 (PST)
MIME-Version: 1.0
References: <20240205104905.24929-1-alice.chao@mediatek.com>
In-Reply-To: <20240205104905.24929-1-alice.chao@mediatek.com>
From: Stanley Jhu <chu.stanley@gmail.com>
Date: Mon, 5 Feb 2024 22:43:53 +0800
Message-ID: <CAGaU9a8EQDdrrgzuaqBYk6h-r4u6spozH3cHeHO-98dNjEv-AA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] ufs: core: fix shift issue in ufshcd_clear_cmd
To: alice.chao@mediatek.com
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
	Bart Van Assche <bvanassche@acm.org>, "James E.J. Bottomley" <jejb@linux.ibm.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, wsd_upstream@mediatek.com, 
	stanley.chu@mediatek.com, peter.wang@mediatek.com, powen.kao@mediatek.com, 
	naomi.chu@mediatek.com, cc.chou@mediatek.com, tun-yu.yu@mediatek.com, 
	chun-hung.wu@mediatek.com, casper.li@mediatek.com, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_064409_709113_8B9654BC 
X-CRM114-Status: UNSURE (   9.04  )
X-CRM114-Notice: Please train this message.
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

On Mon, Feb 5, 2024 at 7:27=E2=80=AFPM <alice.chao@mediatek.com> wrote:
>
> From: Alice Chao <alice.chao@mediatek.com>
>
> When task_tag > 32 (in mcq mode), 1U << task_tag will out of bound
> for u32 mask. Fix this bug to prevent SHIFT_ISSUE (Bitwise shifts
> that are out of bounds for their data type).
>
> [name:debug_monitors&]Unexpected kernel BRK exception at EL1
> [name:traps&]Internal error: BRK handler: 00000000f2005514 [#1] PREEMPT S=
MP
> [name:mediatek_cpufreq_hw&]cpufreq stop DVFS log done
> [name:mrdump&]Kernel Offset: 0x1ba5800000 from 0xffffffc008000000
> [name:mrdump&]PHYS_OFFSET: 0x80000000
> [name:mrdump&]pstate: 22400005 (nzCv daif +PAN -UAO)
> [name:mrdump&]pc : [0xffffffdbaf52bb2c] ufshcd_clear_cmd+0x280/0x288
> [name:mrdump&]lr : [0xffffffdbaf52a774] ufshcd_wait_for_dev_cmd+0x3e4/0x8=
2c
> [name:mrdump&]sp : ffffffc0081471b0
> <snip>
> Workqueue: ufs_eh_wq_0 ufshcd_err_handler
> Call trace:
>  dump_backtrace+0xf8/0x144
>  show_stack+0x18/0x24
>  dump_stack_lvl+0x78/0x9c
>  dump_stack+0x18/0x44
>  mrdump_common_die+0x254/0x480 [mrdump]
>  ipanic_die+0x20/0x30 [mrdump]
>  notify_die+0x15c/0x204
>  die+0x10c/0x5f8
>  arm64_notify_die+0x74/0x13c
>  do_debug_exception+0x164/0x26c
>  el1_dbg+0x64/0x80
>  el1h_64_sync_handler+0x3c/0x90
>  el1h_64_sync+0x68/0x6c
>  ufshcd_clear_cmd+0x280/0x288
>  ufshcd_wait_for_dev_cmd+0x3e4/0x82c
>  ufshcd_exec_dev_cmd+0x5bc/0x9ac
>  ufshcd_verify_dev_init+0x84/0x1c8
>  ufshcd_probe_hba+0x724/0x1ce0
>  ufshcd_host_reset_and_restore+0x260/0x574
>  ufshcd_reset_and_restore+0x138/0xbd0
>  ufshcd_err_handler+0x1218/0x2f28
>  process_one_work+0x5fc/0x1140
>  worker_thread+0x7d8/0xe20
>  kthread+0x25c/0x468
>  ret_from_fork+0x10/0x20
>
> Signed-off-by: Alice Chao <alice.chao@mediatek.com>

Reviewed-by: Stanley Jhu <chu.stanley@gmail.com>

