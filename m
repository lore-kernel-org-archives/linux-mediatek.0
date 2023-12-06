Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53AD6C10DCE
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Dec 2023 19:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9bnUt4mQN0sRHuHZE/bBNs8Z6MZSXk16CG08Vf2hXjs=; b=nacScfxjuZx8MG8g7CuCFYULoT
	7iKoyZkCvBerA4ROzE9uMpk1ia80Cy0ldxD0HsDTb00OckL5uos8qJE0ENpdLBJvUjAuPoq+4jmnP
	5p8ZfoZkGVfbepm8MqF9p02he1mRg6A+v3cF7HUBIwVNPflHZnnHn5n+G4emvZidW9p2mOPYGjsWU
	EmlPKJnlUSkz+xpodqZdAYKUgQ1seuPDQo1bx0xgaPgXPLtCGgHFdSK2soAfd92qxnADq/jSM/lRG
	G8J7z0BGgkPaYpvmHGBCbwwkyhTDinup88M1J9a9A0lIcGVxN9H2bKHclJnuc6viE09212+oJpsjJ
	xfUtoBjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAxvn-00B9na-1E;
	Wed, 06 Dec 2023 19:51:39 +0000
Received: from mail-4318.protonmail.ch ([185.70.43.18])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAxvj-00B9n2-38;
	Wed, 06 Dec 2023 19:51:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1701892290; x=1702151490;
	bh=9bnUt4mQN0sRHuHZE/bBNs8Z6MZSXk16CG08Vf2hXjs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=oSU146QXFS+PhvtrMroC6/bnYa4wLzuCKzLmcWr3Ckb0yPjIhj+khldB9XV4QqEgR
	 NjeUloT2t+poIcLfYkoLEBX/3UWl2lKnkQXfHm62H2OXO/dspJpaFf2ookn25RqwZZ
	 U7OtrEhXVIjm4jahmkWiKQTPyteVt0edv3hKukF5i0f+P2GSuWcX82e+f/65Xr/l6H
	 vSwtZgvmfGSHJv/yNNlffCpJS3C2EAgPWhSLJHCZila+KY8cQNFCLrFnvvndsvIs+c
	 y763KJlfIJi4wadS+kWRNFQskL2E0loDvigStgUAA/b2WUy3heLVwHvH0XziUN0Ee1
	 TBNQiZ1725JPg==
Date: Wed, 06 Dec 2023 19:51:19 +0000
To: Jakub Kicinski <kuba@kernel.org>
From: cristian_ci <cristian_ci@protonmail.com>
Cc: "kvalo@kernel.org" <kvalo@kernel.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>
Subject: Re: [BUG] wireless: mt7601u: probe failed with error -110
Message-ID: <QGXUDgc-RbYOKRZYX_gp7uyKz_WQ4_6b_R9c4Qyd-3oEd4V_vluPJtyJfVqpvcF5kKQ3Ffr3cVXmxAY3jPYQwKSBrusexYYFIPfHJ1qtFPI=@protonmail.com>
In-Reply-To: <20231126142634.3a100e2c@kernel.org>
References: <Bnwq2et4CBU1_MS8X3rFeejMDmKf2dr_BNq60IzBcGKbjTxHG1CjJ0zB_wZjn8_iLJsi7fCx6_Eh01ozYBqPA-cEZXMZE_X98E0b7yotXCg=@protonmail.com> <20231126142634.3a100e2c@kernel.org>
Feedback-ID: 27475468:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_115136_184321_8D1B1B23 
X-CRM114-Status: UNSURE (   7.31  )
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

[RESEND I've made a mistake with list of recipients]

Update:

I've built and installed mt7601Usta vendor driver, which is shown into lsmo=
d output.

ra0 interface appears as shown in the following output from iwconfig and if=
config:

ra0       Ralink STA  ESSID:""
          Mode:Auto  Frequency=3D2.412 GHz  Access Point: Not-Associated
          Bit Rate:1 Mb/s
          RTS thr:off   Fragment thr:off
          Link Quality=3D10/100  Signal level:0 dBm  Noise level:0 dBm
          Rx invalid nwid:0  Rx invalid crypt:0  Rx invalid frag:0
          Tx excessive retries:0  Invalid misc:0   Missed beacon:0


ra0       Link encap:Ethernet  HWaddr 00:00:00:00:00:00
          BROADCAST MULTICAST  MTU:1500  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisioni:0 txqueuelen:1000
          Byte RX:0 (0.0 B)  Byte TX:0 (0.0 B)

The driver is properly loaded and the device doesn't connect/disconnect con=
tinuously as instead happens in mainline driver:

Bus 001 Device 007: ID 148f:7601 Ralink Technology, Corp.
    |__ Port 3: Dev 7, If 0, Class=3Dvend., Driver=3Drt2870, 480M

Any thoughts?

Waiting for a reply,

Cristian.

