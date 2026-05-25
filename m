Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D86CD5BB1
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 May 2026 14:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tIaLFX6wDvz8omqyixFH0407VovWexTGXfAx6MM8XwE=; b=h5EWGPNlRYyAXl
	p3LvBImCoyjh7zqrBGE0kAJKnCc+G0jxTPopIOBC3klwplq98RUZGpXmeQ714LeElOB3JBRmDKQSM
	szAOyCq7JQOcGu77kq4VO82jjmc7WVxJUqrEVOUt2lcVBKNYD7CpEC0v69Nma9QwBcF+mVgFw13jU
	wJG8QJQEAaxVucGnSQzEZ4BLV1NK7ZrTYZWk+N0Ju6Cc55Zw3rZU68KjScUGjJUbfXX1fuZL3TDpt
	cAUw6C4SgFpLC0vijDa/vxdhjd6MJMU+k9HHZB1l9fg23cB4Z/ey36x3ImDUdym7TATg1jdATKIY5
	On3Sx0PfPa+z9c2w5CTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRW5i-0000000HOhq-3kSp;
	Mon, 25 May 2026 14:15:38 +0000
Received: from air.basealt.ru ([193.43.8.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRW5e-0000000HOfv-09Mo
	for linux-mediatek@lists.infradead.org;
	Mon, 25 May 2026 14:15:35 +0000
Received: from [10.88.128.234] (obninsk.basealt.ru [217.15.195.17])
	(Authenticated sender: petrykinpa)
	by air.basealt.ru (Postfix) with ESMTPSA id 6EB1B23388;
	Mon, 25 May 2026 17:15:24 +0300 (MSK)
Message-ID: <93addbb5-7097-4f6c-a21b-920fa44e7cff@altlinux.org>
Date: Mon, 25 May 2026 17:15:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] mt7921e: Intermittent connection failure
From: silverducks <silverducks@altlinux.org>
To: Sean Wang <sean.wang@kernel.org>
Cc: linux-wireless@vger.kernel.org, nbd@nbd.name, lorenzo@kernel.org,
 ryder.lee@mediatek.com, shayne.chen@mediatek.com, sean.wang@mediatek.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
References: <59f58f03-6dee-4380-80d6-7e2778b5f14b@altlinux.org>
 <f264b392-37bc-4b31-ac0e-768466f2b962@altlinux.org>
 <CAGp9LzrfD+a84ZVGjUnrv7KYCpgfe88NyrXos8wW8U7aKM8BZw@mail.gmail.com>
 <651b9626-0c2c-4993-829a-3259141109dc@altlinux.org>
 <ddb70af0-b3b1-42c3-9459-ce41914c4d20@altlinux.org>
 <CAGp9LzoEaNuQf7+2i5QZi8f44zQfxpWGJiW0WgYrAZhT2a9D+Q@mail.gmail.com>
 <4d4f7e6a-b887-4541-9928-0f255bc61ee7@altlinux.org>
Content-Language: en-US
In-Reply-To: <4d4f7e6a-b887-4541-9928-0f255bc61ee7@altlinux.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_071534_271418_76897E88 
X-CRM114-Status: UNSURE (   1.90  )
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
Reply-To: silverducks@altlinux.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Greetings!

Update:
As of kernel version 7.1-rc4 the error is no longer reproduced.

