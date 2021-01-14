Return-Path: <SRS0=30Xp=GR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67826C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jan 2021 10:45:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBF2B23A50
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jan 2021 10:45:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBF2B23A50
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=69GWDDgXNArQQ1zuqyTKh9e06w2AWAPXGHu6XvJobDA=; b=S+GjgKcgo+jN3kHgkWTlRyERP
	pcQf0pe5kE+hTa4Lew0793tAbi5wRiSN9MS1OQbM/25nLn2uZK6FBW1EsMJ3nnyOSUZ1ODstDdrqA
	cHCMj8WMDmFwXTIOtGjhrwhhnJz9/6EibNFrWkSTC+K/HXC/vC46fwRz1xHkktQn6H2DHm9XYFLLt
	iwak514OK785Oz3oTlogBWs00AprZflodtuhMze0ceJj9GpGisQRe3j7siCfx//1TW9nMjmHi/Hpb
	/iWnCdc57Iw1CpDwZkzmEUbP4MYiLF7H30KSxLQ+HbepZkHHR6LuG+OXf7oiLuL+ar6s7UsyD/oPB
	+V3pQeglQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l007c-00023Z-Jo; Thu, 14 Jan 2021 10:44:56 +0000
Received: from m43-15.mailgun.net ([69.72.43.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l007W-00021z-4p
 for linux-mediatek@lists.infradead.org; Thu, 14 Jan 2021 10:44:55 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1610621092; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: In-Reply-To: Date: References: Subject: Cc:
 To: From: Sender; bh=OjjfXZal6B47GNRAOFXmbhnpHD2u3Oq2qC6Px4eVK1Q=;
 b=mp2879zdzumyyz1NVPMisd7QVOkJsbc3B219d2Osgl5jAZhpB1yS8t/B9qqSbWuabcm0C1gE
 YQ3qh7Ek7wt1Iktrhgvjix7h1AINbAXRTCNYoUNWQm/g2/vTebtFG3XB7gSCqucOQrYolOT8
 OTlmSDkstFdLNhIqzVcORE4hCJ0=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 60002096415a6293c53ff05c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 14 Jan 2021 10:44:38
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 39090C43462; Thu, 14 Jan 2021 10:44:38 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E11AFC433CA;
 Thu, 14 Jan 2021 10:44:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E11AFC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Petr =?utf-8?Q?=C5=A0tetiar?= <ynezz@true.cz>
Subject: Re: [PATCH] mt76: mt7915: fix misplaced #ifdef
References: <20210103135811.3749775-1-arnd@kernel.org>
 <20210106135801.GA27377@meh.true.cz>
Date: Thu, 14 Jan 2021 12:44:31 +0200
In-Reply-To: <20210106135801.GA27377@meh.true.cz> ("Petr
 \=\?utf-8\?Q\?\=C5\=A0t\?\=
 \=\?utf-8\?Q\?etiar\=22's\?\= message of
 "Wed, 6 Jan 2021 14:58:01 +0100")
Message-ID: <87r1mnhk6o.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210114_054452_575077_2264EB47 
X-CRM114-Status: GOOD (  15.93  )
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
Cc: Arnd Bergmann <arnd@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Arnd Bergmann <arnd@arndb.de>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Yiwei Chung <yiwei.chung@mediatek.com>, linux-mediatek@lists.infradead.org,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Shayne Chen <shayne.chen@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

UGV0ciDFoHRldGlhciA8eW5lenpAdHJ1ZS5jej4gd3JpdGVzOgoKPiBBcm5kIEJlcmdtYW5uIDxh
cm5kQGtlcm5lbC5vcmc+IFsyMDIxLTAxLTAzIDE0OjU3OjU1XToKPgo+IEhpLAo+Cj4ganVzdCBh
IHNtYWxsIG5pdHBpY2ssCj4KPj4gRnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4K
Pj4gCj4+IFRoZSBsb25lICd8JyBhdCB0aGUgZW5kIG9mIGEgbGluZSBjYXVzZXMgYSBidWlsZCBm
YWlsdXJlOgo+PiAKPj4gZHJpdmVycy9uZXQvd2lyZWxlc3MvbWVkaWF0ZWsvbXQ3Ni9tdDc5MTUv
aW5pdC5jOjQ3OjI6IGVycm9yOgo+PiBleHBlY3RlZCBleHByZXNzaW9uIGJlZm9yZSAnfScgdG9r
ZW4KPj4gCj4+IFJlcGxhY2UgdGhlICNpZmRlZiB3aXRoIGFuIGVxdWl2YWxlbnQgSVNfRU5BQkxF
RCgpIGNoZWNrLgo+PiAKPj4gRml4ZXM6IGFmOTAxZWI0YWI4MCAoIm10NzY6IG10NzkxNTogZ2V0
IHJpZCBvZiBkYmRjIGRlYnVnZnMga25vYiIpCj4KPiBJIHRoaW5rLCB0aGF0IHRoZSBjb3JyZWN0
IGZpeGVzIHRhZyBpcyBmb2xsb3dpbmc6Cj4KPiAgRml4ZXM6IDhhYTJjNmY0NzE0ZSAoIm10NzY6
IG10NzkxNTogc3VwcG9ydCAzMiBzdGF0aW9uIGludGVyZmFjZXMiKQo+Cj4gSSd2ZSB1c2VkIHRo
ZSBhZjkwMWViNGFiODAgYXMgd2VsbCBmaXJzdCBpbgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVu
d3J0L210NzYvcHVsbC80OTAgYnV0IHRoZW4gbG9va2VkIGF0IGl0IG9uY2UgbW9yZSBhbmQKPiBh
Y3R1YWxseSBmb3VuZCB0aGUgcHJvYmFibHkgY29ycmVjdCA4YWEyYzZmNDcxNGUuCgpPaywgSSds
bCBjaGFuZ2UgdGhhdCBkdXJpbmcgY29tbWl0LgoKRmVsaXgsIEknbSBwbGFubmluZyB0byBhcHBs
eSB0aGlzIHRvIHdpcmVsZXNzLWRyaXZlcnMgYW5kIGFzc2lnbmVkIHRoaXMKdG8gbWUgaW4gcGF0
Y2h3b3JrLgoKLS0gCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC13
aXJlbGVzcy9saXN0LwoKaHR0cHM6Ly93aXJlbGVzcy53aWtpLmtlcm5lbC5vcmcvZW4vZGV2ZWxv
cGVycy9kb2N1bWVudGF0aW9uL3N1Ym1pdHRpbmdwYXRjaGVzCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QK
TGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
