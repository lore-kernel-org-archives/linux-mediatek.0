Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ABD5CC6B08
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2026 14:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Knyg1eGY/24N+B3mUzbdi0IL1ZaLh+/WexIOA3FWA8E=; b=QIPaoviIWichN1OlPXCFVx8Ask
	6VvotQEPVQJYhPjhnpWlz9wUcOKaY83xMIvvXB21z/wJSkrBMMfDqFbYHvIsV/d01Wmk+fPWIiDW1
	EQvKz5w8e6n47A2b9IgJF/uPhXqvUdkFljqK+NxTRi48acFnG3GuhuHFrjNs64B9pTRJTvPovCvrI
	4Hs4fSER+PVhpgdWVJyrbWKxv1T/Ah5kKAqtq6XmuAXTDoNstCdMBdGgRTjMyorD70Bkp5jDDsfwU
	Qb6AXYFcYVd+KSXuNgEjtY3pVqj4SUskLoNWf8VGZ8T2uhuxD0WvZn1kG9b5NXnqLVz0cQfBIz+XK
	j+2zQ2ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGdga-0000000D9SF-1Igq;
	Tue, 13 Oct 2026 14:41:00 +0000
Received: from mail-24430.protonmail.ch ([109.224.244.30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGdgX-0000000D9PJ-33dT
	for linux-mediatek@lists.infradead.org;
	Tue, 13 Oct 2026 14:40:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1791902452; x=1792161652;
	bh=Knyg1eGY/24N+B3mUzbdi0IL1ZaLh+/WexIOA3FWA8E=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=fbF8/XhqCmtGg+IcN7Mpk9Qawu9KfCxyTeAUfzYl88ln4vo6xpsrIBP+JPl+AWVhS
	 IVywqsQn4UeGDvqwUd+7rWyRXqqWU6VrXwzKu7dyT65+BklbaUdm1UFBbMokr5RASX
	 hpuk8ASYcuLcZvv47zlr/r7dMsYUZ2SQjETjKU2UBwDTwAe9N06Jj335kzvK4oWG+Z
	 sqxDhs5kQSeghvjLOao1aLZ33MEZEGYSIxqW3oKo+Lz7F8nM2+6HfXxAky9BDm/Lek
	 Zkosj8vwI3osihU+v9T0ILLKVpY8ccJboeLwVqeHlJQ9T3SZU+1sqx4IDtI+rbhaev
	 9mMTPzO2gnI3w==
Date: Tue, 13 Oct 2026 14:40:49 +0000
To: Pauli Virtanen <pav@iki.fi>
From: dt <derektern@proton.me>
Cc: "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>, "marcel@holtmann.org" <marcel@holtmann.org>, "luiz.dentz@gmail.com" <luiz.dentz@gmail.com>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v2] Bluetooth: btmtk: don't generate bogus ISO packets from zero padding
Message-ID: <J3DTIOm26VPmRQxbaFuf_tTRFcN5sTc2wkM_6mtmgidrgPnZc7pgqR-LFI9BxR7grHfdq-H4BieuiZ5Gwa9_Qb9nDVQfN0KhREuXSFBlNbk=@proton.me>
In-Reply-To: <e4b4da9d018ab26c5376fef47476b8852222eb07.camel@iki.fi>
References: <fp1LLpMjte31CZfdRymzNx8DeLqozYHgFf2TAKxtIiHEkPcykA5jgtuDuZYcJTb5vPGpPkgB8GoVoX5_821oWe9NvenZdL4kwrxyCuanlw8=@proton.me> <e4b4da9d018ab26c5376fef47476b8852222eb07.camel@iki.fi>
Feedback-ID: 213585229:user:proton
X-Pm-Message-ID: 1d941d7b6373cd483068120e7022780a632b38ca
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_074058_576061_0B669DB9 
X-CRM114-Status: UNSURE (   2.74  )
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

Hi Pauli,

Following up on 24 September: could you refresh/resend the MT7925 padding
fix? If you are busy, I can prepare a refresh preserving your authorship.

It is still absent from mainline, Bluetooth-next and stable v7.2.9,
checked on 13 October. Our local adaptation removes the phantom handle-zero
ISO packets; upstreaming would fix that parsing defect and let me retire
the private driver rebuilt for kernel updates.

I have not hardware-tested your exact v2. I can test the refreshed revision
before supplying a Tested-by.

Thanks,
Derek



