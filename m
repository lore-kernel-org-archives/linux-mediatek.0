Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44289CCFA13
	for <linux-mediatek@archiver.kernel.org>; Sat,  8 Nov 2025 20:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:From:To:Date:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rvz22euyiQuemd7gE2/WyX9KUivWOzw/dV0pveuzV0I=; b=HoGwaeBh/iKqVwa+PAKqy0UF9x
	DcMceHbf4EpMX86+BsFCEvaVx6j4X+j0IvjFQfqi6/r7eBUw12+WY8Cbmv8yGVY1z98rMkU1H55bE
	FsGOIYPT9NIcc8MCdRAzqJz6hGkfJTUiUJT2PASUkIlSJOrr06XPNBkWDCbjakX5eaWV5zHW7N+to
	RqZxmrP+MNjcUpKYXp1MpnUTbr0w+w+BtleDMs2FAdjASC+VEar+v/AteBaGp6LLydOLmA7huNgKi
	UO1ClTIudr4SrfwuisJMhUCaCSK0nSSrVEdBqC2589slvT2PzNzRcOVH7JixN8XS9dtWlbtM/Qe+c
	GKQ4/pNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHpls-00000003S5H-2L9S;
	Sat, 08 Nov 2025 20:42:52 +0000
Received: from mail-24427.protonmail.ch ([109.224.244.27])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHplp-00000003S4m-3bXP
	for linux-mediatek@lists.infradead.org;
	Sat, 08 Nov 2025 20:42:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1762634556; x=1762893756;
	bh=rvz22euyiQuemd7gE2/WyX9KUivWOzw/dV0pveuzV0I=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=KCCnmSDVrZiGE8SSJgvbsc7+5EIn4h8GCGTdtf0z4B1Rxnnf4vyJPLK3hvKsimtC7
	 bQNvTy5fg2jxCPt3Re2RWJzKQDjjAS3LTkTCsAkfv35iucavrJ9r5opx7sZd4sPerH
	 rMU9Rm/IWUGCFFdplz0D7HEUiWnWmjGaFmz1U3rrG7KgbiiSLxV8v+ZvqqAkA+gVXi
	 JOqu+ETsFEakRBe+0v9YE2kMhLITJovktRWup3MLBtBPP03kCVRqyIkOPeEjkyEMBP
	 SWyNkHjZnZ9RqozFoDulaS4mE/KCyx+KR0GMfR7HfLfMhWFbnQ3pOXF8Ux1owTIiD3
	 uSQWioot5Se9g==
Date: Sat, 08 Nov 2025 20:42:31 +0000
To: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
From: "olivier.perardelle" <olivier.perardelle@protonmail.com>
Subject: [DRIVER REQUEST] Status and development plan for MediaTek MT7927 chipset
Message-ID: <HQybgWTYrvKIrFPV4I0eMUz6ppxBw5slyhVQ8KRKxEg1ZkVkQYKjP7ggfQUDQk_a5bQ_1hXkylnIdv5jq0NTEODzuNeVOiPlAvQop2AZTTE=@protonmail.com>
Feedback-ID: 6491766:user:proton
X-Pm-Message-ID: 468efb95342101b26cb1ef375adce661723f3c28
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_124250_048017_827E06DE 
X-CRM114-Status: UNSURE (   2.71  )
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

Hi developers and maintainers,

I have a Wifi 7 adaptor with the MT7927 chipset I can't use it on linux sin=
ce more than a year. Would it be possible to prioritize the delivery of thi=
s driver?

Many thanks for your help

