Return-Path: <SRS0=xu2G=EK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF3B2C5517A
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Nov 2020 16:49:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 252DB206DB
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Nov 2020 16:49:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yyKYmO0l";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="Gsge5Zyc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 252DB206DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:To:From:
	Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nqe/Fb5g4YIt9fEGr3HgkR4fu+6KVEVrGGIxS1laylI=; b=yyKYmO0l6JjO/J+6azrq+L65F
	1CHTHGPqk+rulwX+jKMp6zhz7KdfJWztTcw8Brst9PEG1LlSiNK9fui5q3jMVZiuuTtXMT/4b9p9S
	SJzQOUAdUO4NMcQDZakiL2rdHT4m8T+lTKQ5o+dd1L9tUxtkJfbK4KWMADEHDpJGq4PaxUpsRKLmU
	6GyAotcew/KXWeuDKpf2vV8ELja2aiHEjuTlR0Y5rXCk65RtoHayUjyGBN3AzX/AK2dbpiB0x/CWk
	I+uJSjgPf8s0IL9Ykd+wAdwSH3MIVxQeTY1D0vugpicAAxz9Qh+K2I9bZ4v48AF6KXZeR2O/IWkru
	vHHIf6IBg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaLym-0007t2-8L; Wed, 04 Nov 2020 16:49:48 +0000
Received: from mout.gmx.net ([212.227.15.18])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaLyj-0007r5-LU
 for linux-mediatek@lists.infradead.org; Wed, 04 Nov 2020 16:49:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1604508572;
 bh=itzpSSQZMzHTOjFQwaEjOIn3NoQnKY3T93SB2E0JxlU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Gsge5Zyc+RmE8Sl9apnpDqbBJ8G8EAQ/AP19g1QVh5rXrd+ZejDwLdDUnxKeIAWr1
 IOACslAO3KuY9TuywV5nYTeOmXvP2Z5YJNyhDqHKu/q1jSSiviPw6GSaZCV9uakHG9
 VhZTPhfyNdY0FrgMQ+DAI4UVtZIPc4KzxShuNETw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [185.75.74.195] ([185.75.74.195]) by web-mail.gmx.net
 (3c-app-gmx-bs02.server.lan [172.19.170.51]) (via HTTP); Wed, 4 Nov 2020
 17:49:31 +0100
MIME-Version: 1.0
Message-ID: <trinity-1d7f8900-10db-40c0-a0aa-47bb99ed84cd-1604508571909@3c-app-gmx-bs02>
From: Frank Wunderlich <frank-w@public-files.de>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Aw: Re:  Re: [PATCH] pci: mediatek: fix warning in msi.h
Date: Wed, 4 Nov 2020 17:49:31 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <87o8ke7njb.fsf@nanos.tec.linutronix.de>
References: <20201031140330.83768-1-linux@fw-web.de>
 <878sbm9icl.fsf@nanos.tec.linutronix.de>
 <EC02022C-64CF-4F4B-A0A2-215A0A49E826@public-files.de>
 <87lfflti8q.wl-maz@kernel.org> <1604253261.22363.0.camel@mtkswgap22>
 <trinity-9eb2a213-f877-4af3-87df-f76a9c093073-1604255233122@3c-app-gmx-bap08>
 <87k0v4u4uq.wl-maz@kernel.org> <87pn4w90hm.fsf@nanos.tec.linutronix.de>
 <df5565a2f1e821041c7c531ad52a3344@kernel.org>
 <87h7q791j8.fsf@nanos.tec.linutronix.de>
 <877dr38kt8.fsf@nanos.tec.linutronix.de>
 <901c5eb8bbaa3fe53ddc8f65917e48ef@kernel.org>
 <87o8ke7njb.fsf@nanos.tec.linutronix.de>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:ICfh3WtogdrpOnkT/gXuEFWIaM4DIXYnB6COgVA3DMs2B7BYKR0IimJCA1wNt80BnphrN
 b6RXx+FWw4J8CmDkM5SfE7XkSYj865O3iXpD8zOrKFKQQqApmFLgevMu7mlJT4rnIK9z9x2oZa2z
 9DigQch4XDeQoGUPG2OqhId4i0Jnzsfy6wHJoNc+0Mforeye4AWbl52RfriMaCuKpmXFmI0VoUfd
 f2khjJaTHIqxyagSS2C02FdjMC/t0s1y+KM6EZ2dNDyPMNbs0472YDr+il/FD/BM742DBSYF69XY
 po=
X-UI-Out-Filterresults: notjunk:1;V03:K0:o7DDce+FsRY=:fDyjahd9aVh+82I0GoJ23v
 JW5+QemSWiUMZJTMvMGE5axjm1sY0mpUNeNy2Ls20p1D41mAOaBH32Kbeb/my7WAj2pSslnKC
 WOaCrq2NBU0ha6lQDJY1cHo4SyOoRYMGeUabvOZSpx9+al3OjhsWw6Mris1ZSZ8lbJuKIIUMK
 KG+0TNWpKWfgLbdcVX3mMWfnQhujuKATPJKp2yAnLAOe/faUjQ0/sueVoNNYWPrapgyrKjS3V
 BjN8/WNf5716FWqhQQoSRvlq/CUNHcGH0GPAhs0dtpPYT5onSAZavK1GUem8V7jFSy02T33d9
 pcZuybC/8DRT5Uerg5CtZzO7nZovo8ywB/p6Qf/CDlogLdijHzmxkwW3RbJITA6hM52QoOd2G
 j8XSBWqQkzONvW3Rwo3zsV0dsj1HyfIqWu/k0B6FjYiI+Qbr88xrQcTmJE41nV61ke10wVeIh
 PY62GVe8ezVCfwXxmGUr7F/J+KPh9dHc7CEuuyW46jGj02eAJsWEMknFkvZkP4uOY3ZpIlDwc
 JuJjpAuNiPBJo+3S0xSWNO8TGdezBXupyMNf3W//PYGIQtcB+jejYmoHpPIz20AQOiylrxCcH
 qTa/iS9HJTi/Q=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201104_114945_918257_8DF34539 
X-CRM114-Status: GOOD (  12.04  )
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
Cc: Ryder Lee <ryder.lee@mediatek.com>, Marc Zyngier <maz@kernel.org>,
 linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Frank Wunderlich <linux@fw-web.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


> Gesendet: Dienstag, 03. November 2020 um 11:16 Uhr
> Von: "Thomas Gleixner" <tglx@linutronix.de>
> Any architecture which selects PCI_MSI_ARCH_FALLBACKS and does not have
> irqdomain support runs into:
>
> 	if (!d)
> 		bus->bus_flags |= PCI_BUS_FLAGS_NO_MSI;
>
> which in turn makes pci_msi_supported() return 0 and consequently makes
> pci_enable_msi[x]() fail.

i'm not that deep into this, but just my thoughts...you are the experts :)

checking for PCI_MSI_ARCH_FALLBACKS here does not help?

something like this:

#ifndef PCI_MSI_ARCH_FALLBACKS
	if (!d)
		bus->bus_flags |= PCI_BUS_FLAGS_NO_MSI;
#endif

imho pci_enable_msi[x]() does not do anything if there is no msi-support (or does not get called), so maybe check the PCI_BUS_FLAGS_NO_MSI before the call (if this is inside core) or inside the enable-function (if called from outside)....

or is this the issue marc talkes about (called before flag is set)?

regards Frank


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
