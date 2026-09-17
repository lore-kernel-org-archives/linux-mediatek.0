Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D730C88E72
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Sep 2026 14:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0A5pVANVs2H+9Hg4Fbm0Q5ZuUpgZ7lTiuPXga4d1Dwk=; b=UsrKDnEQ71Lbc+++LH995Fa7hQ
	/geXxnSlnlyiI1y82NCiTx6fEkAij6KUy/ZnQPkaqLAuFoD/v0DvDab3SGTVbWDEOiyhMrQrCtxrg
	S4LmELRMCjzYzRnyWzAU6CZgMQlSPIvymnLIfuAkcD6o0WJugfcbOppTp5w2YOamZO1P3JkzFDuLp
	eFj84DiDGw5T2lEpuO+YG0FJTlbvU1pONm1ggMjupqyVOlkO6vtIWvg3+nAZnZ5jL9U2uPC4vrNQW
	Qj4QS6eS35/po0jJ231wyfgWWiw8GUvdKDBT+p3I3mhLhOG0cfp62FB5TM6IrAuBxMMsV+Brcf0xb
	Xv/ARwwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7D8K-0000000BXf0-1Lww;
	Thu, 17 Sep 2026 14:30:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7D8I-0000000BXeH-3sSq
	for linux-mediatek@bombadil.infradead.org;
	Thu, 17 Sep 2026 14:30:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:To:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=0A5pVANVs2H+9Hg4Fbm0Q5ZuUpgZ7lTiuPXga4d1Dwk=; b=YpuJcL9D9c3i9tU7iXyfyvrEsI
	7QAY/+68inmcesP6FK0ddqKdQqViMsR1SOmZGwMhaE07GT3j7xqPvGpX9wLP5Tedied4gPbhLzdUU
	+6O+wyWwccXLY95opii15iZshEHGlSXE2bKvJnlgPCogjkTpWw+/q5F4Rbc6dS+Z9TUQhU6M/hGAr
	0cXogQ2IItrqSAcXWX7gCRmev+sWRfKjgC+Y/6KcHeolIECYBZFPLUK2vDeP55fxsNFMVUSj3JREM
	ioAjKA90+YarNhUtLGsFtu2INAJ9NUjoEOjhMyV45sB1VTQHAQGQkiKm7oRt7BLDWNjZkmUeZzJLL
	7FJhgYZg==;
Received: from mail-43167.protonmail.ch ([185.70.43.167])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7D8G-00000008wkg-0eOw
	for linux-mediatek@lists.infradead.org;
	Thu, 17 Sep 2026 14:30:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1789655425; x=1789914625;
	bh=0A5pVANVs2H+9Hg4Fbm0Q5ZuUpgZ7lTiuPXga4d1Dwk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=EV0d9hZaIcfY8ouG6edwFwwIQznQBK5nh0puqRAoSDefy2aTEWbkyt17jLxINRxYe
	 i4BOqoqQioPKa0W3BLuhf3/ESIYXjeOi5Dw+s1U+bgVlG2zVPYov5y6E0OqmAClkXD
	 tXSEqfPd+Bd+WE6UMKBRyG1QE4l3a5gCgLqm1O8HPFjTJ3tUQWLB4I76XaLRPn9KBg
	 05LDnI3O9ZeZiW9asQpVvDtHeJLs6z1ee/2hxMX0G/JrKWpUXNm3wCGjnb8xo0wsEv
	 zdRC8KLklMgOO/pP/YCoCd789q0uMx8QH4h+Xr0bpEbxhFinrUvPe9ZP9dzcBRxtZs
	 cWo6CU0buIXqg==
Date: Thu, 17 Sep 2026 14:30:20 +0000
To: Pauli Virtanen <pav@iki.fi>
From: dt <derektern@proton.me>
Cc: "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>, "marcel@holtmann.org" <marcel@holtmann.org>, "luiz.dentz@gmail.com" <luiz.dentz@gmail.com>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v2] Bluetooth: btmtk: don't generate bogus ISO packets from zero padding
Message-ID: <YIDlCNZQwBhqkY9WfsaV0eA2620ZhUMPvlLJnmq919znENWqW0zIOHy4r5sxp8YY5VO0O_nxU80SfxhAgs0ibGL9V72vdLRCVfR-uzyF-vQ=@proton.me>
In-Reply-To: <e4b4da9d018ab26c5376fef47476b8852222eb07.camel@iki.fi>
References: <fp1LLpMjte31CZfdRymzNx8DeLqozYHgFf2TAKxtIiHEkPcykA5jgtuDuZYcJTb5vPGpPkgB8GoVoX5_821oWe9NvenZdL4kwrxyCuanlw8=@proton.me> <e4b4da9d018ab26c5376fef47476b8852222eb07.camel@iki.fi>
Feedback-ID: 213585229:user:proton
X-Pm-Message-ID: b78e3d7ee951c238b3dafa7d73d712f8b75baa6a
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_153036_297138_FEEE06B6 
X-CRM114-Status: UNSURE (   3.08  )
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

> Did you test the latest 20260813113236 firmware version too?

Yes. The kernel logs confirm build 20260813113236 for the reported tests. T=
he phantom ISO packets occurred with that firmware, and the local padding-f=
ilter adaptation removed them. The exact upstream v2 patch has not been tes=
ted here.


