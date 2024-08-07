Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F087C3DA7F
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Aug 2024 20:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xWZLjmHVUaFbudn6mhIyw0Tt+L18x2TkIcL6QcrIeDk=; b=lj4cyNv0+XLogI3Rqk50/dvvW7
	BVMyQp8oFCcmCNYocGrI3NLOzm+1jA7KwFjdIUpNwsHUHGhJ1UsGzcM8dQX/WEgSqCtohmY5rfyaB
	1IwkUVsUs2v8VM4L7JtxpIcPKDcRIBBBkTSoEB8Ci1GYUiFMspbnSA0n9QLEzEutw4bGQt8CIJo1T
	jLoMygmVYJ0vbfWEp5u8C2RadSslo87AhHiWqWV7zl1SUP7bv6viwfIyydq0ITC6oenpvVUdDJfyN
	XUismyd97X+KN4fujJsWuo8aX0ksBPR0+rneixXphKtYGPihuLg8WmVu0eg/OeKNM6Ezn4LgTZzM3
	NSWtP42g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbmsY-000000068U4-15ub;
	Wed, 07 Aug 2024 20:03:26 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbmrx-000000068Jh-0lg6;
	Wed, 07 Aug 2024 20:02:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id ED668CE1268;
	Wed,  7 Aug 2024 20:02:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E624C32781;
	Wed,  7 Aug 2024 20:02:42 +0000 (UTC)
Date: Wed, 7 Aug 2024 16:02:41 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Liju-clr Chen <liju-clr.chen@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Richard Cochran
 <richardcochran@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yingshiuan Pan <Yingshiuan.Pan@mediatek.com>, Ze-yu Wang
 <Ze-yu.Wang@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-trace-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, Shawn Hsiao
 <shawn.hsiao@mediatek.com>, PeiLun Suei <PeiLun.Suei@mediatek.com>,
 Chi-shen Yeh <Chi-shen.Yeh@mediatek.com>, Kevenny Hsieh
 <Kevenny.Hsieh@mediatek.com>
Subject: Re: [PATCH v12 20/24] virt: geniezone: Add tracing support for hyp
 call and vcpu exit_reason
Message-ID: <20240807160241.2370ae9b@gandalf.local.home>
In-Reply-To: <20240730082436.9151-21-liju-clr.chen@mediatek.com>
References: <20240730082436.9151-1-liju-clr.chen@mediatek.com>
	<20240730082436.9151-21-liju-clr.chen@mediatek.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240807_130249_423027_6525AA95 
X-CRM114-Status: GOOD (  15.84  )
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

On Tue, 30 Jul 2024 16:24:32 +0800
Liju-clr Chen <liju-clr.chen@mediatek.com> wrote:

> From: Liju Chen <liju-clr.chen@mediatek.com>
>=20
> Add tracepoints for hypervisor calls and VCPU exit reasons in GenieZone
> driver. It aids performance debugging by providing more information
> about hypervisor operations and VCPU behavior.
>=20
> Command Usage:
> echo geniezone:* >> /sys/kernel/tracing/set_event
> echo 1 > /sys/kernel/tracing/tracing_on
> echo 0 > /sys/kernel/tracing/tracing_on
> cat /sys/kernel/tracing/trace
>=20
> For example:
> crosvm_vcpu0-4874    [007] .....    94.757349: mtk_hypcall_enter: id=3D0x=
fb001005
> crosvm_vcpu0-4874    [007] .....    94.760902: mtk_hypcall_leave: id=3D0x=
fb001005 invalid=3D0
> crosvm_vcpu0-4874    [007] .....    94.760902: mtk_vcpu_exit: vcpu exit_r=
eason=3DIRQ(0x92920003)
>=20
> This example tracks a hypervisor function call by an ID (`0xbb001005`)
> from initiation to termination, which is supported (invalid=3D0). A vCPU
> exit is triggered by an Interrupt Request (IRQ) (exit reason: 0x92920003).
>=20
> /* VM exit reason */
> enum {
> 	GZVM_EXIT_UNKNOWN =3D 0x92920000,
> 	GZVM_EXIT_MMIO =3D 0x92920001,
> 	GZVM_EXIT_HYPERCALL =3D 0x92920002,
> 	GZVM_EXIT_IRQ =3D 0x92920003,
> 	GZVM_EXIT_EXCEPTION =3D 0x92920004,
> 	GZVM_EXIT_DEBUG =3D 0x92920005,
> 	GZVM_EXIT_FAIL_ENTRY =3D 0x92920006,
> 	GZVM_EXIT_INTERNAL_ERROR =3D 0x92920007,
> 	GZVM_EXIT_SYSTEM_EVENT =3D 0x92920008,
> 	GZVM_EXIT_SHUTDOWN =3D 0x92920009,
> 	GZVM_EXIT_GZ =3D 0x9292000a,
> };
>=20
> Signed-off-by: Yi-De Wu <yi-de.wu@mediatek.com>
> Signed-off-by: Liju Chen <liju-clr.chen@mediatek.com>

=46rom a tracing POV, I don't see any issues with this patch.

Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>

-- Steve


> ---
>  arch/arm64/geniezone/vm.c          |  4 ++
>  drivers/virt/geniezone/gzvm_vcpu.c |  3 ++
>  include/trace/events/geniezone.h   | 84 ++++++++++++++++++++++++++++++
>  3 files changed, 91 insertions(+)
>  create mode 100644 include/trace/events/geniezone.h


