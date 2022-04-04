Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F860C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Apr 2022 08:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=npXMQHoZLizxRC0FZ6kaFPIWa4Ln5bNScy68efengp0=; b=vzFhOiaE7aB6dP
	XAnE5pJ+iE9LJX8gmj++U9uSZTAKa3slTyAphFsAtWI9EX7K+SuQStD9EGx+4/Y14CHOJkDVCRMze
	1nCDirjnlRGOtbygbnltxBsWPe6XbOXDBjwz5q1KAolfz1rkZqCCrvanhCbjQS+zGQDHG3ukYsKO1
	rIH0U+Bu+bK3f+pqdSXFeBejut02UKXKmrk9e9NmUIL5NVh2mEKO7j95IsIu3LK2vVmrLcZ59lxe2
	wd1U1gd7I3YdoBmkZleasdYajZyORkq6tBhEAUIhRTADIhlx/vDsFc7dIyAo1ZrYgmcWwnXU5JJ6t
	o56Fx5pkUUaYm+oflTBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbHnL-00Dm4x-Ie; Mon, 04 Apr 2022 08:10:39 +0000
Received: from mail.coredeal.pl ([51.75.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbHnJ-00Dm4I-Ea
 for linux-mediatek@lists.infradead.org; Mon, 04 Apr 2022 08:10:38 +0000
Received: by mail.coredeal.pl (Postfix, from userid 1002)
 id 1C9F9A2D3C; Mon,  4 Apr 2022 08:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=coredeal.pl; s=mail;
 t=1649059836; bh=9KGuIG62LgzC9aYmjKxzocuYLRCVghXg6v9Q1q2LHec=;
 h=Date:From:To:Subject:From;
 b=fKGp7Hr6b5KxQ/TvJ29Z81XC93JsQjrINDEMovg9/7MgpiXm+8HYIKz6gEvydIzvU
 Zi4Nb+k/B5n87CD3T7JPpMwZ3D3709ORfM0VhhTX8lY8qnb6fV2K6S1IweI8u3vT5q
 gc3LeQfL7MenaUIaXCfF8RdE4M9Mby9o9jpe+s46wO1KNRpe/xGbXu4LC/huW3jkOF
 ejBfmMtjJbkDJnbiOER4hd6bbGoPYv5kdbSCn2tgAh7ZEJLqfVcizUk3B++rumTuMa
 J5IInZAgAn7NGE6dX1w/duFmQc+kUpP8H4g27T40HWjEAXhC6KbZVmQgC21cM0RWZO
 QAI797EhBQXEQ==
Received: by mail.coredeal.pl for <linux-mediatek@lists.infradead.org>;
 Mon,  4 Apr 2022 08:10:30 GMT
Message-ID: <20220404064500-0.1.2c.c8ld.0.d3spxalnkr@coredeal.pl>
Date: Mon,  4 Apr 2022 08:10:30 GMT
From: "Krzysztof Maj" <krzysztof.maj@coredeal.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: Biznesowy angielski
X-Mailer: mail.coredeal.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_011037_673366_97C6042F 
X-CRM114-Status: UNSURE (   1.24  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

RHppZcWEIGRvYnJ5LCAKCmN6eSByb3p3YcW8YWxpIFBhxYRzdHdvIHJvenfDs2oga3dhbGlmaWth
Y2ppIGrEmXp5a293eWNoIHN3b2ljaCBwcmFjb3duaWvDs3c/CgpPcHJhY293YWxpxZtteSBrdXJz
eSBqxJl6eWtvd2UgZGxhIHLDs8W8bnljaCBicmFuxbwsIHcga3TDs3J5Y2gga29uY2VudHJ1amVt
eSBzacSZIG5hIHBvZG5pZXNpZW5pdSBwb3ppb211IHPFgm93bmljdHdhIGkgamFrb8WbY2kga29t
dW5pa2Fjamkgd3lrb3J6eXN0dWrEhWMgYXV0b3Jza8SFIG1ldG9kxJksIHN0d29yem9uxIUgc3Bl
Y2phbG5pZSBkbGEgd3ltYWdhasSFY2VnbyBiaXpuZXN1LiAKCk5pZXN0YW5kYXJkb3d5IGt1cnMg
b24tbGluZSwgZG9wYXNvd2FueSBkbyBwcm9maWx1IGZpcm15IGkgb2JzemFyw7N3IMWbd2lhZGN6
b255Y2ggdXPFgnVnLCB3IHN6eWJraW0gY3phc2llIHByenluaWVzaWUgZWZla3R5LCBrdMOzcmUg
endpxJlrc3rEhSBrb21mb3J0IGkgamFrb8WbxIcgcHJhY3ksIHJvendpamFqxIVjIG1vxbxsaXdv
xZtjaSBiaXpuZXNvd2UuIAoKWmRhbG5lIHN6a29sZW5pZSBqxJl6eWtvd2UgdG8gbS5pbi4gemFq
xJljaWEgeiBuYXRpdmUgc3BlYWtlcmFtaSwga3TDs3JlIHcgc3p5YmtpbSBjemFzaWUgbmF1Y3rE
hSBwcmFjb3duaWvDs3cgcm96bWF3aWHEhyB6YSBwb21vY8SFIGphc25lZ28gaSB6d2nEmXrFgmVn
byBqxJl6eWthIEJ1c2luZXNzIEVuZ2xpc2guCgpDenkgbcOzZ8WCYnltIHByemVkc3Rhd2nEhyB3
acSZY2VqIHN6Y3plZ8OzxYLDs3cgaSBvcG93aWVkemllxIcgamFrIGR6aWHFgmFteT8gCgoKUG96
ZHJhd2lhbQpLcnp5c3p0b2YgTWFqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
