Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89553C71136
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Jun 2025 02:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/4zSIPw19HlLUie6b0kgjQJHS7vidQhIk3Cd96brfSo=; b=Gxw5DWJ4CEDoBPMcDsL4NZi5dW
	JglFGROPjz7OkEvj10dCxW68dg+ojVUrmLJG+AT7ob4Qm1SjQNbgExt/z6YHsUV4r9Riv2jDuitEm
	c2gm4Prd5yMkKbq9R8LGaFMBfxNlgpR9OQNT//YnRKMTdmwbT2+1vZ7FZnqk41mUaThKaS0O0WP2y
	IVW20NsJGrnyavs78598P7rvipFMqxg2t3+NJesmgzLjKv7bElMMxalhiHo79VGLBHa56uoTywWrN
	dcG1lMZx2bxq2HLUIT9S5Jn851Y2OdJNRKijBfyiv1qSK6lg1GfUDVgtLg6agHhL4i8/72cQR8+X2
	+RBxSIGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQGmo-00000000Y2D-3Frq;
	Sat, 14 Jun 2025 02:38:26 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQGkf-00000000XvQ-0L2P
	for linux-mediatek@lists.infradead.org;
	Sat, 14 Jun 2025 02:36:14 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-5532f9ac219so2779336e87.1
        for <linux-mediatek@lists.infradead.org>; Fri, 13 Jun 2025 19:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749868570; x=1750473370; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/4zSIPw19HlLUie6b0kgjQJHS7vidQhIk3Cd96brfSo=;
        b=3x8Ikry+84sh/oYb+1u191TuViegfjTNSMxwXKg6WGi2YOSXAu0ytehfdClPTwRSTu
         EchHdh4/YbzhCw6M+aT7if0drOeAUZFMuDLCPuPA2BhU+CWSFJiV27X7cVvTgctP7wyo
         CbLviI6FSZulYAkfRhJHx4Bdb2LHGukNn6idq06mnoy8P0JrhSVruwZkneTqOxLLJk58
         bwwglr9vqCuWvdHlLtrpGfZOV1OQiwDiBR9BrtL5Oiz6i968sE1LPNga4ktS/kYkLBPH
         Voru1nY2Onjs9UbZdS7WmJVwT+IPX6/SknS/D5eOVTfp1PSjWzLxuSca355I0IGuwrl+
         5EDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749868570; x=1750473370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/4zSIPw19HlLUie6b0kgjQJHS7vidQhIk3Cd96brfSo=;
        b=jxI4AVf6JgNu4Bu1HqN0D+Y4Uc0167UFBP4mOJ0xPnh52enAR0JYKuC5v9JyLfnqxY
         oEkOEBNMsu/pMCMQDFotys0SVvJJUAoh5JSXMSQu4HjdZNT/Z/UZEWfN9bglHGhCwWv7
         U7G4+iFqEWJARiWSujYpqDQP7r9yJrIIqsuNCrXm41pD80tt90k7UKa2WbPqG4qdfwnB
         RxLtQkvu1nsILwj1MnrxKKMe2XxhzSRw9Vta1/FL7U+6VB+rxsAnyoEKLoRW18i4nsU6
         AXcz/yIwh0QWoBB1tes1LJXwksiXiRRfZZpsLoDeeQZyEltMduBb1TwsDLGuA0xjyeB/
         EMFQ==
X-Forwarded-Encrypted: i=1; AJvYcCW22cpAMgbBYz0j1gZS4EsGb55UnxTZy+IRFS7KtscQKgVDXAlz3PK+m/XnCq3A5NpDchI55SgxCRZiArWKmA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxtR8Iu6qUwO9IeZTpfwFP+ooE00J7YMBVwDHOYKpgbEmjX6bd3
	vmoECDpj4CO/jW3bCVopBKX5AzCxojeUiLZpIX7oHuuFAIUjOqmKTGk9bFxsvl80RUKCWDG+MUW
	9X+QlqvxYtJYkf0Nep509C+F6ch/ucsU/wNPeT/8=
X-Gm-Gg: ASbGnctTwsHHTHhhlrpIOOdd/T2tSr/I1vVAA/lYGiLP4JaXAmD3JJ1CvtoLpkAwPme
	+U4ilL5xIuwBALaY/h4tT5vvZ84m/mRJojIKDjsrFAKFH4f/tl0aLL6toeCeaioIujT1mM65tZd
	lGhqpogaVg4eUtU2D4jH4aSKTHBePxcNyPECoMfErsfI+OHqmw8yJuI3T3+qRcAJu+DE3N6WU=
X-Google-Smtp-Source: AGHT+IFxdd/eeA/jqO+ioIaQwggzyaJAKSp2npacWe2qm5ZmqZbGMbcXq9pAMDlbKaGfZHdE5uH6xTWQR5MyLSGGuXg=
X-Received: by 2002:a05:6512:3f12:b0:553:ae47:6856 with SMTP id
 2adb3069b0e04-553b6e7d3b4mr334265e87.10.1749868570161; Fri, 13 Jun 2025
 19:36:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250614020524.631521-1-kuyo.chang@mediatek.com>
In-Reply-To: <20250614020524.631521-1-kuyo.chang@mediatek.com>
From: John Stultz <jstultz@google.com>
Date: Fri, 13 Jun 2025 19:35:58 -0700
X-Gm-Features: AX0GCFtDliQH_6brlg-dmQaZIRQh31WrUqfBwRgyCd0Z_gzAKUDVN86BzaEZjjk
Message-ID: <CANDhNCpoKUbQU590m-vBKhk96ZCKDsYWOHwP_LL2W84SPOnXww@mail.gmail.com>
Subject: Re: [PATCH 1/1] sched/deadline: Fix fair_server runtime calculation formula
To: Kuyo Chang <kuyo.chang@mediatek.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_193613_111430_B50A6FDE 
X-CRM114-Status: GOOD (  18.04  )
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

On Fri, Jun 13, 2025 at 7:05=E2=80=AFPM Kuyo Chang <kuyo.chang@mediatek.com=
> wrote:
> From: kuyo chang <kuyo.chang@mediatek.com>
>
> [Symptom]
> The calculation formula for fair_server runtime is based on
> Frequency/CPU scale-invariance.
> This will cause excessive RT latency (expect absolute time).
>
> [Analysis]
> Consider the following case under a Big.LITTLE architecture:
>
> Assume the runtime is : 50,000,000 ns, and FIE/CIE as below
> FIE: 100
> CIE:50
> First by FIE, the runtime is scaled to 50,000,000 * 100 >> 10 =3D 4,882,8=
12
> Then by CIE, it is further scaled to 4,882,812 * 50 >> 10 =3D 238,418.
>
> So it will scaled to 238,418 ns.
>
> [Solution]
> The runtime for fair_server should be absolute time
> asis RT bandwidth control.
> Fix the runtime calculation formula for the fair_server.
>
> Signed-off-by: kuyo chang <kuyo.chang@mediatek.com>

While I've not quite gotten my head around the details in the
dl_server code, I've been able to reproduce the problem described here
with a 6.12 based kernel.

Running cyclictest (with arguments "-t -a -p99 -m") , and a randomized
input test on an Android device, its pretty easy to trip 100ms to
*multi-second* delays of the RT prio 99 threads.

Perfetto image:
https://github.com/johnstultz-work/misc/blob/main/images/2025-06-13_cyclict=
est-dl-server-latency.png

Link to the actual trace:
https://ui.perfetto.dev/#!/?s=3D9bbb9e539ac2bbbfe3cfa954409134662a9f624a

Using this patch, so far in my testing with the same workload, the max
cyclictest latencies stick around the single digit ms range.

The part that is a little confusing to me, is that prior to the long
stall, it doesn't appear that RT tasks are actually starving
SCHED_NORMAL tasks, so I'm conceptually surprised to see the dl_server
boosting the normal tasks, especially for so long, but I admittedly
haven't looked in detail at the code and have been going off my
understanding of how it was supposed to replace rt-throttling, so I
may be missing a subtlety.

thanks
-john

