Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D00C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 May 2022 08:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uyPyKJpWpf+vRJ6gtHh4cKBKgx/BUaW+VC4Yea968U4=; b=JIOqIS8nuOT7sP
	RUJ3jx2qdSgKAYxGh5IjJjA4ef8rVdgcAHzfNPDZe1K/P2MCOKb564iF71wh8gpKwFNs+NTURtnOY
	k1FVW6DeLT3jvvxDszEOCD7Ia2ev03CyZyLEqHDVnFVfakmAjMBllzO/NVZJJxn6Bil48c6Ia6bHc
	bohOSSHDcHC9VP1I5+sXRhoxpelYIaiUmodVmWIv4+M++rhLiVET31ed2r/uTCZVoHZNNfVLxMiLZ
	KTx9w6fMtgBkwQqBPmUUg/XP/bPVASyOyA3y3Pw7BuEM70VZJLN7wwUjsZiF4Q5wBeLopE2N9IvMM
	v2bl4kaN4BxvCImFWBXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnyWI-00D3ce-Aq; Mon, 09 May 2022 08:13:30 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnyW6-00D3bB-Ti; Mon, 09 May 2022 08:13:20 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 497451F43981
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652083997;
 bh=nN5bkg+Kcbz+2Ef7HwzKBHrumC//NVeNu6tEQwdSl/w=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=VNAHhwUGrv2v1zSCqOgvcBbccCi6o+VNeYGspH0tsMWIFhZnH4Vc8957cTcnpmL3y
 GS2wxkBBt4jymq9pjLhf2Njw4tKfJttt5mO798U6IEIy8usEisDOVJP1xcIaedx1c+
 gYq3XJ7vUZxNKC99BRiw1LBshO8ahUkQk7SibNA80LWlBHdthhT3C5S36GzYtCqBd+
 Q02bcrWuMW1x3vQyw8qDeBgcHpaVFrimAlvBXKP6myNxtNJtZZUIV/G0lZKZVa9BT1
 JUpV0pRVT7eUqmwYJKtD+KWYWsf2sfyaKqzKEKTygu/kTB+U/0x9XoZl945q0YhYdA
 /z9JXcR4wLgpA==
Message-ID: <92b2f870-2b98-77c6-f8c3-fdfbc455831c@collabora.com>
Date: Mon, 9 May 2022 10:13:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] pwm: mediatek: Implement .apply() callback
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20220507084337.167890-1-u.kleine-koenig@pengutronix.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220507084337.167890-1-u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_011319_149959_580DA2C2 
X-CRM114-Status: GOOD (  10.04  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SWwgMDcvMDUvMjIgMTA6NDMsIFV3ZSBLbGVpbmUtS8O2bmlnIGhhIHNjcml0dG86Cj4gVG8gZXZl
bnR1YWxseSBnZXQgcmlkIG9mIGFsbCBsZWdhY3kgZHJpdmVycyBjb252ZXJ0IHRoaXMgZHJpdmVy
IHRvIHRoZQo+IG1vZGVybiB3b3JsZCBpbXBsZW1lbnRpbmcgLmFwcGx5KCkuCj4gVGhpcyBqdXN0
IHB1c2hlZCBhIHZhcmlhbnQgb2YgcHdtX2FwcGx5X2xlZ2FjeSgpIGludG8gdGhlIGRyaXZlciB0
aGF0IHdhcwo+IHNsaWdodGx5IHNpbXBsaWZpZWQgYmVjYXVzZSB0aGUgZHJpdmVyIGRvZXNuJ3Qg
cHJvdmlkZSBhIC5zZXRfcG9sYXJpdHkoKQo+IGNhbGxiYWNrLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+CgpSZXZp
ZXdlZC1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVs
cmVnbm9AY29sbGFib3JhLmNvbT4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
