Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74426C4345F
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 May 2024 14:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qfOPtHMC8enWGIxXfWoDYzKhbZQ6bX4zXIQNZyD9910=; b=HZlC0s3PabWRA8Xac5bmTCf+OO
	Oy7h6nGAAcTFdJSiUtNHPNbOpg1nLoki14Oot3D6TP5bCAD7t/c73FQJovzWwX1jvDQKyyaW/DM0E
	jDiPYTfdCKSHHZ54s9hDFgzEuzZ0y+n3QPZ8d+d3IWuboul/ycnK6JOUCOEZfOq/hL6+/FNUOcOcC
	BHqWtt8N1Lfd2qWeIyA8deXzAWdsixGwy6iQGcYt4smgp5NC7iIWXK27dCy5NRHOmiSdtolvf2aD6
	ULseANl3p0GiOPRHWo54lF+ddzsz+vIfzq1xNwFTw9Fr/K77hrKHo4YB+NUMQc2pNxc84HrI/8YWM
	eqoOrA0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2X72-0000000CsiM-0bHB;
	Thu, 02 May 2024 14:08:40 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2X6x-0000000Csh5-07XS;
	Thu, 02 May 2024 14:08:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1E008CE1151;
	Thu,  2 May 2024 14:08:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7EBCC113CC;
	Thu,  2 May 2024 14:08:28 +0000 (UTC)
Date: Thu, 2 May 2024 10:09:14 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Tze-nan Wu (=?UTF-8?B?5ZCz5r6k5Y2X?=)" <Tze-nan.Wu@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "Cheng-Jui Wang (=?UTF-8?B?546L5q2j552/?=)" <Cheng-Jui.Wang@mediatek.com>,
 wsd_upstream <wsd_upstream@mediatek.com>, "Bobule Chang (=?UTF-8?B?5by1?=
 =?UTF-8?B?5byY576p?=)" <bobule.chang@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "mhiramat@kernel.org"
 <mhiramat@kernel.org>, "mathieu.desnoyers@efficios.com"
 <mathieu.desnoyers@efficios.com>
Subject: Re: [PATCH] tracing: Fix uaf issue in tracing_open_file_tr
Message-ID: <20240502100914.33d6aa83@gandalf.local.home>
In-Reply-To: <aac0a4cc0a12fc9593ab7de6c34836757e6814f3.camel@mediatek.com>
References: <20240426073410.17154-1-Tze-nan.Wu@mediatek.com>
	<20240428202837.0cabca17@rorschach.local.home>
	<20240429144626.7d868ad3@gandalf.local.home>
	<661f101456506db945ccbd94700a0f47b95f91e5.camel@mediatek.com>
	<20240501235044.12fa3297@gandalf.local.home>
	<aac0a4cc0a12fc9593ab7de6c34836757e6814f3.camel@mediatek.com>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_070835_281992_44B5FCB0 
X-CRM114-Status: UNSURE (   9.26  )
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

On Thu, 2 May 2024 06:49:18 +0000
Tze-nan Wu (=E5=90=B3=E6=BE=A4=E5=8D=97) <Tze-nan.Wu@mediatek.com> wrote:

> Good news, this patch works, the test has passed, no more Kasan report
> in my environment.

Great to hear!

>=20
> my environment:
>  arm64 + kasan + swtag based kasan + kernel-6.6.18
>=20
> Really appreciate, and learn a lot from the patch.

Can I add:

Tested-by: Tze-nan Wu (=E5=90=B3=E6=BE=A4=E5=8D=97) <Tze-nan.Wu@mediatek.co=
m>

?

-- Steve

