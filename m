Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A732C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Mar 2022 08:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mqo17GG78i2vMDy1BJkl28Jubc1YIsL2uQYQuSMNkak=; b=nwREtoyrx9xC+l
	M5l6BCy3P0sKKaqEXknbHYL2HJXCq3XjqjwrT7Q5Ih6xqEGlafpz+FtRqDu6ZttYcHVoM+2J9qX+K
	Rpm8q4LkspKAtukqMbbpCjVUmatTd4ceeQioJqR0KlWbS+L5TW9p1cg9jJzA1pwAVPGJrfPNjc0pZ
	fXXLXPx8VpePxGk25aBGICboC4zgNZEzxAaNwx2sKd922VNoPUj1J9i6QeS7NgW4THagO+mScI6Ue
	dufP1ZEgqmjSrCtwRFjhWLY9fxInAjZSIyyBQDArKkujn2cYwJN/u7O/C16CwHKAmO+QUC8ieO5yJ
	+ZSZI31/lMS+iorHRO1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUPCT-00CA4L-HV; Wed, 16 Mar 2022 08:40:09 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUPCD-00C9v6-Dn; Wed, 16 Mar 2022 08:39:54 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 1D96D1F42CD2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647419991;
 bh=OBn2nRrFw1dTirvfKDQG9NVJ8Eqyjie73NtNTXIBhSk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gwiAU68gIl2PnAoSpTZuwVmRdEYHTSoD9eRfwg027X8/0MqBSYwiNvvMt+Cdg7vyp
 nsAu4DPoBSMepTgto63T+yf6RJ5VO3bFGMGwqPgZ9n3mqrpZYb9LsSgQt9G+JenDCt
 cmtrK/hr1jeylxdFMPoa9RN+SI6GZMGDPgkia3BDBA30PwuxkipPMhpU0SQFJJk1/S
 KtZptrEYh0CrYFLZ1X6XDaG4tadT765C2R5JBOLJ9xd8/WO+B252LFLnJMP6we2ZRk
 MGB8hKGcecK/qdDJ3HpU38w9J7/WAPuKXRTCrUVDH4lOH5kOFYzITjvsTBsFc9cEJp
 VR6Bz5tmzsMGQ==
Message-ID: <dfca0eb8-9800-9feb-3608-f29c6333b0ce@collabora.com>
Date: Wed, 16 Mar 2022 09:39:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v1 4/4] dt-bindings: pinctrl: mt8192: Add gpio-line-names
 property
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: kernel@collabora.com, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220315211936.442708-1-nfraprado@collabora.com>
 <20220315211936.442708-5-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220315211936.442708-5-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_013953_618719_E40E9520 
X-CRM114-Status: UNSURE (   7.42  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SWwgMTUvMDMvMjIgMjI6MTksIE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvIGhhIHNjcml0dG86Cj4g
QWRkIHRoZSBncGlvLWxpbmUtbmFtZXMgb3B0aW9uYWwgcHJvcGVydHkgdG8gdGhlIHBpbmN0cmwt
bXQ4MTkyIGJpbmRpbmcKPiB0byBwcmV2ZW50IGR0X2JpbmRpbmdfY2hlY2sgd2FybmluZ3Mgd2hl
biBpdCBpcyBwcmVzZW50IGluIHRoZSBwaW5jdHJsCj4gbm9kZSBpbiB0aGUgRGV2aWNldHJlZS4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyA8bmZyYXByYWRvQGNv
bGxhYm9yYS5jb20+CgoKUmV2aWV3ZWQtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxh
bmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+CgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBs
aXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
