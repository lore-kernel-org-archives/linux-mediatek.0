Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9711C46467
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Jan 2023 18:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q+LXchndemc/sNMv5my3g+K8PlBnxGthZAA6IpMmwiA=; b=xMdiMu8Ofr1Y0F
	zwPGb3R6YVuVDjghq410snvWMSUyDktYdbplBIpM0x1ThfWore8WEBvmhaBR+J7cT1doczcTLe7N2
	kedoBg/beMbXMM20+FqvUOtReIGuksHSIw+6Za5U/PyZteKwbFCsdSnGgYK6GL+5p+/7kOq48f6kH
	KV+jPFEw5xOkN14JnRejOTE4MHNEoBFSjR9oV6knqHdwe5wZ9quDwaEC122fq7JuGlcegfhoq2mOs
	wY4Pb6HiA5VE7mm2XSqN9Fhfjc+sM9D9Zc0myUgAmQyQmtQDt3kdpVWbPUV7ZH+l9yaINrjHCw4GC
	sPEjkZA0fes9S+Ci5C1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHTtD-00BeJg-Dt; Mon, 16 Jan 2023 18:07:23 +0000
Received: from dilbert.mork.no ([2a01:4f9:c010:a439::d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHTtA-00BeIN-EG; Mon, 16 Jan 2023 18:07:22 +0000
Received: from canardo.dyn.mork.no ([IPv6:2a01:799:c9a:3200:0:0:0:1])
	(authenticated bits=0)
	by dilbert.mork.no (8.15.2/8.15.2) with ESMTPSA id 30GI4wtd2106436
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Mon, 16 Jan 2023 18:05:00 GMT
Received: from miraculix.mork.no ([IPv6:2a01:799:c9a:3202:549f:9f7a:c9d8:875b])
	(authenticated bits=0)
	by canardo.dyn.mork.no (8.15.2/8.15.2) with ESMTPSA id 30GI4r1d2112691
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Mon, 16 Jan 2023 19:04:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mork.no; s=b;
	t=1673892293; bh=q+LXchndemc/sNMv5my3g+K8PlBnxGthZAA6IpMmwiA=;
	h=From:To:Cc:Subject:References:Date:Message-ID:From;
	b=e8Yw0oL3Bdoj07I5EPWN0RnNtgxfnjEyN2O53RjXdrZNNdOxh5mNCTdBDn0A8E5gZ
	 PyV6VlR1K79TOYCPI8YhG5oMczjyl7RuKTNq/2lPLA23919AGkvTpawLXYq8/94EF4
	 SMeRtHjKYK/IS53VwZK7TbhHSJDp3Dx551AaA2N8=
Received: (nullmailer pid 386555 invoked by uid 1000);
	Mon, 16 Jan 2023 18:04:53 -0000
From: =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Subject: Re: [PATCH v2] net: mtk_sgmii: implement mtk_pcs_ops
Organization: m
References: <Y1ansgmD69AcITWx@shell.armlinux.org.uk>
	<trinity-defa4f3d-804e-401e-bea1-b36246cbc11b-1666685003285@3c-app-gmx-bap29>
	<87o7qy39v5.fsf@miraculix.mork.no>
	<Y8VVa0zHk0nCwS1w@shell.armlinux.org.uk>
	<87h6wq35dn.fsf@miraculix.mork.no>
	<Y8VmSrjHTlllaDy2@shell.armlinux.org.uk>
	<87bkmy33ph.fsf@miraculix.mork.no>
	<Y8Vt9vfEa4w8HXHQ@shell.armlinux.org.uk>
	<875yd630cu.fsf@miraculix.mork.no> <871qnu2ztz.fsf@miraculix.mork.no>
	<Y8WNxAQ6C6NyUUn1@shell.armlinux.org.uk>
	<87pmbe1hu0.fsf@miraculix.mork.no>
Date: Mon, 16 Jan 2023 19:04:53 +0100
In-Reply-To: <87pmbe1hu0.fsf@miraculix.mork.no> (=?utf-8?Q?=22Bj=C3=B8rn?=
 Mork"'s message of
	"Mon, 16 Jan 2023 18:59:19 +0100")
Message-ID: <87lem21hkq.fsf@miraculix.mork.no>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: clamav-milter 0.103.7 at canardo
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_100720_810040_3C4D4B98 
X-CRM114-Status: UNSURE (   7.62  )
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
Cc: netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, Alexander Couzens <lynxis@fe80.eu>, John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, Frank Wunderlich <linux@fw-web.de>, Paolo Abeni <pabeni@redhat.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Bj=C3=B8rn Mork <bjorn@mork.no> writes:

> [   52.473325] offset:20 0x10000

Should have warned about my inability to write the simplest code without
adding more bugs than characters.  20 !=3D 0x20

I hope this makes more sense:


[   44.139420] mtk_soc_eth 15100000.ethernet wan: Link is Down
[   47.259922] mtk_sgmii_select_pcs: id=3D1
[   47.263683] mtk_pcs_config: interface=3D4
[   47.267503] offset:0 0x140
[   47.267505] offset:4 0x4d544950
[   47.270210] offset:8 0x20
[   47.273335] offset:0x20 0x31120018
[   47.275939] forcing AN
[   47.281676] mtk_pcs_config: rgc3=3D0x0, advertise=3D0x1 (changed), link_=
timer=3D1600000,  sgm_mode=3D0x103, bmcr=3D0x1200, use_an=3D1
[   47.292610] mtk_pcs_link_up: interface=3D4
[   47.296516] offset:0 0x81140
[   47.296518] offset:4 0x4d544950
[   47.299387] offset:8 0x1
[   47.302512] offset:0x20 0x3112011b
[   47.305043] mtk_soc_eth 15100000.ethernet wan: Link is Up - 1Gbps/Full -=
 flow control rx/tx
[   56.619420] mtk_soc_eth 15100000.ethernet wan: Link is Down
[   60.779865] mtk_sgmii_select_pcs: id=3D1
[   60.783623] mtk_pcs_config: interface=3D22
[   60.787531] offset:0 0x81140
[   60.787533] offset:4 0x4d544950
[   60.790409] offset:8 0x1
[   60.793535] offset:0x20 0x3112011b
[   60.796057] mtk_pcs_config: rgc3=3D0x4, advertise=3D0x20 (changed), link=
_timer=3D10000000,  sgm_mode=3D0x0, bmcr=3D0x0, use_an=3D0
[   60.810117] mtk_pcs_link_up: interface=3D22
[   60.814110] offset:0 0x40140
[   60.814112] offset:4 0x4d544950
[   60.816976] offset:8 0x20
[   60.820105] offset:0x20 0x31120018
[   60.822723] mtk_soc_eth 15100000.ethernet wan: Link is Up - 2.5Gbps/Full=
 - flow control rx/tx


Bj=C3=B8rn

