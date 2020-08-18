Return-Path: <SRS0=p+jW=B4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B360DC433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Aug 2020 18:00:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8128D206B5
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Aug 2020 18:00:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VZ5/WVQd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="HRBaEU/l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8128D206B5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:To:From:
	Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7mQCNc9Kxx0+fR8grcK2fTDxAjEaCMEe1EpEQPPWP0U=; b=VZ5/WVQdPr4PSr1C6zAvj+PXt
	teemV+THt1upvTMMoGYjvkBNaNp6qzsQ/JOWrZTL/mFAUSntl7oE1zAOix3ZEMNHb+4jBtAT/ZiWY
	uEG+fKn0kvorsAFx66W5Dae+EnyW6NLQ4foS71lO6Up2fQVhHwkrOAZm7VXV3H07RezkIuAi4neAs
	z5whozn8dSMsvJBXUrFtOQfhkQNBQbNmgfnt6j8/lLbHKJmCR0YesFvEq38M1c3vlAQZ97sBwS4S+
	88rroJwSFW3NeYsYFXnZyoLCPF0e5egFShhaFFQQfRoI8TFCHuCJ1E2oEhuNGaqeZgwVMiX8sgIbP
	gxj353lRw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k85uh-0006YN-PU; Tue, 18 Aug 2020 18:00:47 +0000
Received: from mout.gmx.net ([212.227.17.20])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k85uf-0006Xg-NH
 for linux-mediatek@lists.infradead.org; Tue, 18 Aug 2020 18:00:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1597773642;
 bh=ThYSr0h07PGP1iFZ6rJ9QbxAVk1GY6nk6qUL/FemZjQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=HRBaEU/li2kEgxCDEF+rbzVwNaGn9TebEjIOYRL3bj8S+sGeaeg9WB9GaDRqNnBKa
 tv4800n4BqhiBqhHL/taXfTXXc4q02yej18695iFbfWUvTdoyvOP+hq6Hxyae3FYQ5
 xYnHmQjzaU+G9JDag5Cj52q1jV6dnHo1GSVlU8O4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [185.53.43.192] ([185.53.43.192]) by web-mail.gmx.net
 (3c-app-gmx-bs30.server.lan [172.19.170.82]) (via HTTP); Tue, 18 Aug 2020
 19:54:41 +0200
MIME-Version: 1.0
Message-ID: <trinity-fb75beca-fce7-4d9e-b427-0e3e261ef8ca-1597773281910@3c-app-gmx-bs30>
From: Frank Wunderlich <frank-w@public-files.de>
To: Landen Chao <landen.chao@mediatek.com>
Subject: Aw: [PATCH net-next v2 0/7] net-next: dsa: mt7530: add support for
 MT7531
Date: Tue, 18 Aug 2020 19:54:41 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <cover.1597729692.git.landen.chao@mediatek.com>
References: <cover.1597729692.git.landen.chao@mediatek.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:Ds7VLClrKGTh8K23luUtZMtW5sd/BqVZ/QNFG8icOaN//D2sZPAPHdI401Z6MtEtACOkM
 VZax2EdaXstWLv+op9BWiVSjga+IuK3OVvw4bazTpeIyWGzp3V2nSFk2ZPa3H1t0cXMQXjK3oa3g
 dDCIWWlrAsWSKRsQYqwRhlAz9VfEbn2PAPSGiHX2UHC47xQqMD1/BXMgEdoTYQPkzJySeXhJgCa9
 QEMpMC7X4AwLQB0A/+r/DMv1nLio3QOlGuDPEjGKJeANp5DEfgMocu2TSqshfeXKqp+LB/X/9Qx6
 co=
X-UI-Out-Filterresults: notjunk:1;V03:K0:EC4Sg1NFbyM=:hvXsVpj0ZARTT5OfrSrxgP
 A66E/kocCqYLXzDX68Q0PowLE8liKeZQf9iLVB1Ja2fqxDpo/4QrpzKtjp4IEbxi8dxx2Q5qr
 xn5OMhRVs96VHcY4bzM8a227j8g5DnBGNfhwDMfEOIEX8stKK9J6z3aktTpIPgk4z3qsv2EQ9
 b/P8jzmDN5xOr0P6nytdLuKJo/EmkP93tizYzlRaVln+7x2iCLho+veYZkJS2cizQdNoiB4kB
 p4SbjVmfP+lBHHvzfSh2kgHsBJ/Sr0Y2CDeYQHP9wndO9NZCPSGSRgutR5pg7tRXrRKKzKjc4
 tY3hUZW2Uej/nHPydr7VZguOaSZYl6WlBJNLYWObZprOQeS5cr3RM5uqN7l+r2AbdtfCvFG6h
 OXGe+3nxO4e1vjDz4NRS+z1n+rzDwxgDxv2Lugq8BNqGx+vuGFDHGEE+vCQklGzTZ0M+JWqOs
 YdlSDaEX43tF9Dk/L9r8Nn5H7Q6WtsqsdMXg4LticDOayleSrkw2ip2p7vwCnKQNLlyiPG8JM
 bBxZnLUjvnjWVfZJ+sK2+SdMjr6iVSI/bTLziETMDXAuOf193mJIxWRCfrS295BaTmv8WwAX2
 yb9yuIdjWmmi02GKiFUrDHe1P22lGArqe8EtR8rVIlfjsrUyRAWk+h4XQYOI3N3qN8c88sTQK
 zpHPBC+tmqwS7uSTCFu0VoW3DjSgF+64G1zY/LBAxW4213qFkIy8VB0FHmdSy0Tk990k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200818_140045_987880_33E192A8 
X-CRM114-Status: UNSURE (   6.41  )
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
Cc: mark.rutland@arm.com, andrew@lunn.ch, dqfext@gmail.com,
 f.fainelli@gmail.com, vivien.didelot@savoirfairelinux.com,
 netdev@vger.kernel.org, sean.wang@mediatek.com, linux-kernel@vger.kernel.org,
 opensource@vdorst.com, devicetree@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 Landen Chao <landen.chao@mediatek.com>, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Tested full series on Bananapi-R2+R64 with5.9-rc1 (iperf3 no retransmitts, Throughput >900Mbit/s)

Tested-By: Frank Wunderlich <frank-w@public-files.de>

maybe you can include the port_change_mtu callback you've send me? or do you want to send it separately

regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
