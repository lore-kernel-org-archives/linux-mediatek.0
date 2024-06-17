Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52355C27C6E
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jun 2024 08:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u+y/L6S5UL+8vZAxwL74vV1B6m8M84m9zI1fQPT/Bfs=; b=txZhWC1NXNLC4HdbxKvse7ENC4
	fhDrJJhuasTLawBIM8bjEt+ISstq7kZ/3LDq3fIS+2DtpSJfnDhmYPz7SzCdHq9zV/H4hpptYlL5v
	kAx6X4WWcYv9N8WqEkPImNfuCYeQoIsfHz4W1f9s9WF6sFQWaQzbUctSqiCh8fz4a4PrAd7iE3vJ5
	wjq9uhfPOIEAf6M+mHRQEFeXtHhLCohp1tTfBxsmG4H+6dC79viJJNySPWyAjJ/XCHLtKCOUZh6yJ
	B+/UOiAHSrcEvof2Ywvu83Q2+s28nDTM5IiG8HOrQApBf324ix1xbQXPvwgoO9Yenz4uYBTfkEiev
	IrhM7Hnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ7SR-00000009nyJ-2NP2;
	Mon, 17 Jun 2024 08:11:19 +0000
Received: from mail.salesoptimize.pl ([162.19.245.89])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ7SP-00000009nwa-1hAX
	for linux-mediatek@lists.infradead.org;
	Mon, 17 Jun 2024 08:11:18 +0000
Received: by mail.salesoptimize.pl (Postfix, from userid 1002)
	id 056F646EBE; Mon, 17 Jun 2024 10:10:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=salesoptimize.pl;
	s=mail; t=1718611876;
	bh=u+y/L6S5UL+8vZAxwL74vV1B6m8M84m9zI1fQPT/Bfs=;
	h=Date:From:To:Subject:From;
	b=qiMOPS0r+H0SUUbQWqYm5IKYN6L3AEXyynuQpspUnb/5VDSvvpMHdXZvsi70Nyu5B
	 TZi1Mp/PQkyEe7+PuyO1t4/7JT8fJwc4/MgbIdXh9787IUN/1gT8z5+6V8uavcm1fH
	 NU1BkdQX05v4+u/kaavb69Dih+eC1mN6EvrKRBYREE7mz8jzJEhnL2cOyhSUBQ9foI
	 G/jJ6lvEEa7gFcag9WwUIgJu32f6vkAWuJ6t9/EryHzlLBiKpXONuK2NeQOumx3L/F
	 yRsze2TxPSt5nGSj882Sf2G+fkicgS8eC7o9Es3MqxlF7ldDTdmekmkfhxZcTpIveR
	 zmELvNDZRCdfw==
Received: by mail.salesoptimize.pl for <linux-mediatek@lists.infradead.org>; Mon, 17 Jun 2024 08:10:47 GMT
Message-ID: <20240617084500-0.1.31.oewz.0.c2j1trq7oy@salesoptimize.pl>
Date: Mon, 17 Jun 2024 08:10:47 GMT
From: "Tomasz Wawrzyniak" <tomasz.wawrzyniak@salesoptimize.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: =?UTF-8?Q?Odroczenie_zap=C5=82aty?=
X-Mailer: mail.salesoptimize.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_011117_611110_41B236B8 
X-CRM114-Status: UNSURE (   0.18  )
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

Szanowni Pa=C5=84stwo,

chcia=C5=82bym zaproponowa=C4=87 mo=C5=BCliwo=C5=9B=C4=87 wyd=C5=82u=C5=BC=
enia okresu sp=C5=82aty za zakupione produkty.

Mogliby=C5=9Bcie z=C5=82o=C5=BCy=C4=87 zam=C3=B3wienie u swojego dostawcy=
, a my dokonamy p=C5=82atno=C5=9Bci w wyznaczonym przez niego terminie. P=
o otrzymaniu p=C5=82atno=C5=9Bci wystawimy Pa=C5=84stwu faktur=C4=99 sprz=
eda=C5=BCy z odroczonym terminem p=C5=82atno=C5=9Bci (30-90 dni).

S=C4=85 Pa=C5=84stwo zainteresowani takim rozwi=C4=85zaniem?


Pozdrawiam
Tomasz Wawrzyniak

