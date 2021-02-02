Return-Path: <SRS0=G+wW=HE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2B33C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Feb 2021 16:21:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30E9F64F72
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Feb 2021 16:21:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30E9F64F72
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:To:From:
	Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QVsAD1q/xKqb7dgnGkBXtN9tgtgwJhitIbEgGZwb/cw=; b=RqCJjDhQPTR8Bzf/3SYDEHPum
	xKd1hTRuS3vJnt4B5DWr6Z1UxGr5HBeCmEc90ShAx8TDE1WcKqrzv/y9ZckJHPJit339bWSnd8Coz
	s/o4GFVF09w7mGkF2U7Yz3UoA2WP/m2m+jn5YB/aagZ16j385UsMauCWY1WPbaHW+//ANtyHNDzun
	YD5UkoeVqBFEdOvBOhs/tzHDNlrYiaMKIdu3UyvAJi90SOZFhOYiU3LYri0XkipvAOUFgDXzu6xZY
	5wbdH5TOkpeCvAYNaUkIFDRV53T05UUAYGJGtMgGUdZObp62pnEcODOly79q0QcRNKQ3DZ3IXRIdP
	vH3PB4Uow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6yQl-0004D3-LY; Tue, 02 Feb 2021 16:21:31 +0000
Received: from mout.gmx.net ([212.227.15.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6yQi-0004CP-Oi
 for linux-mediatek@lists.infradead.org; Tue, 02 Feb 2021 16:21:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1612282862;
 bh=j7MqdTeRJ2CWeYhU/BJJVscXmV0af2mzaUyfN5RfAW0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=SuXGNdGWi9JtCysGxjPI2Z3K4MA44C3FSkk8lyksyx668b1rVZp+3TJg7ueWsPovL
 bzVGqiANrOCu/bIJrD5lhFV7BFBFTViszkulxhYhtIHZRoaaTA6FT3xnhqpfDnh6XR
 rt9ML7UEEDkx9TFvJi+EGGzRG20jFfh4126YSUEk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.149.138] ([217.61.149.138]) by web-mail.gmx.net
 (3c-app-gmx-bs53.server.lan [172.19.170.137]) (via HTTP); Tue, 2 Feb 2021
 17:21:02 +0100
MIME-Version: 1.0
Message-ID: <trinity-0ead36a9-4583-40d1-8b47-146be8ae8533-1612282862443@3c-app-gmx-bs53>
From: Frank Wunderlich <frank-w@public-files.de>
To: Marc Zyngier <maz@kernel.org>
Subject: Aw: Re:  Re:  Re: [PATCH] pci: mediatek: fix warning in msi.h
Date: Tue, 2 Feb 2021 17:21:02 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <c63d8d7d966c1dda82884f361d4691c3@kernel.org>
References: <20201031140330.83768-1-linux@fw-web.de>
 <1604253261.22363.0.camel@mtkswgap22>
 <trinity-9eb2a213-f877-4af3-87df-f76a9c093073-1604255233122@3c-app-gmx-bap08>
 <87k0v4u4uq.wl-maz@kernel.org> <87pn4w90hm.fsf@nanos.tec.linutronix.de>
 <df5565a2f1e821041c7c531ad52a3344@kernel.org>
 <87h7q791j8.fsf@nanos.tec.linutronix.de>
 <877dr38kt8.fsf@nanos.tec.linutronix.de>
 <901c5eb8bbaa3fe53ddc8f65917e48ef@kernel.org>
 <87o8ke7njb.fsf@nanos.tec.linutronix.de>
 <trinity-1d7f8900-10db-40c0-a0aa-47bb99ed84cd-1604508571909@3c-app-gmx-bs02>
 <87h7q4lnoz.fsf@nanos.tec.linutronix.de>
 <074d057910c3e834f4bd58821e8583b1@kernel.org>
 <87blgbl887.fsf@nanos.tec.linutronix.de>
 <c63d8d7d966c1dda82884f361d4691c3@kernel.org>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:u3SIc85K08OE7DKGZvTGXOsAnmBdfTSXT9sG/woR+q++Yox4oBwPqjdX/Z6uHwHmIaCz9
 xtoVLE6VhiyeYHWnScTDNyxEkUGTOJd7tylKctqrRlGSEA+owGrs7nyr1NZxGWbgIV+z159lUGym
 /zmcTpTSQLJ5RyWeJYJvG+K1n3k1agV04JCFP0MglDPbVPTeumrlJYzkHAvTKhOg0dV1BPu+HcGy
 EEuP6iojtiTqbE5BBj/s6s2+7/hhLLjo2SP4WotNM4ugp9hrQPPBpBsMhj6rtagoWlYfMXzQ78Cg
 w8=
X-UI-Out-Filterresults: notjunk:1;V03:K0:k/Dr0NOy/1k=:UIeRd3EBwGoX18LylrsoZW
 bNHoK2iWsEigwQNdjNgdfNyjpIGewc6CdfmAyzSRjhk8J4W+8p1Eyg8AKANXDqKy6jrkNWTn6
 9Gd65OejMRWCmrlS/RtSmH6gIBExjnyZ1PjiSf4TvubbsWifzgnSt9YXQwBqWGi0hccLjWGMp
 tRq2hBW6rz+MgYlmdVq7gN0t86FaK79esvt9mlSrNVmV0+YjjtFVga0gUnDAl6FyPGuCJqeTX
 nIZV1cizRaOyGEKg5zVUcOoCa4orCUIiWMZi25lZwUXgX8vrptvb6kS0s5Lx6ypZCoLmq2TMy
 /NKErKz3wQFG2atbjOZBxXraIfCSgRYKddmllYDfwQ6vD6WOV7KILNyVNnqk2xmbO8lRIlpH1
 TjCn03mzIzrV02oT+A/3I6IlKqdXhJaj32TYXpQIACiXoiKy9PCiehiD5iU6pAhIr7M2cgYtd
 B0E2op19XSYNfcxpZHrafgtqawMxUY3AIyS4QbuyMfy+/8OkN7jitcK1tw2pWbE9hpHG/Q/Uw
 WQX7UrRSM7UX+j4jFfveeA5VO6N760iiAFTdZD4BQETytd4STgm3DtjFhyEwb8ZoYaSUX682U
 qKFPvvPb3yJ0o=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_112129_257342_3DB3EF12 
X-CRM114-Status: UNSURE (   9.41  )
X-CRM114-Notice: Please train this message.
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
Cc: Ryder Lee <ryder.lee@mediatek.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Frank Wunderlich <linux@fw-web.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

is there any new state?

kernel test robot reports the following problem (i do not see it when compiling for my arm/arm64 devices):

ARCH=i386

drivers/pci/probe.c: In function 'pci_register_host_bridge':
>> drivers/pci/probe.c:930:39: error: 'struct device' has no member named 'msi_domain'; did you mean 'pm_domain'?
930 | (bridge->msi_domain && !bus->dev.msi_domain))

and yes...msi_domain is only member of pci_host_bridge (include/linux/pci.h)

why do you check for msi_domain in pci_bus->dev

regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
