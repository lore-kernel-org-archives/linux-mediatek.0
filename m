Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B3F0C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Mar 2022 08:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R75383B34sk2iwJ80CA5rhKpB/hayKSMQBWIZDfU1kk=; b=Wql/4ZOLyk6MNy
	NcQkRXdaMMEiS37wEMIgruAyiXHDilAWRI298d898AFLI6aFRecsFKe5+epyXYw9PyUA189H58JiL
	JOre5SqGvEyOt+tPkmKEJS+VeWIXAn54n2Unv/0ptKnqaGgT0Tn3n1mlKB/djHXcyzznbdC5CFU74
	XDD8ph95lhrs94G69OHyQyVjXkXOyHFWTFWTJvZUG0gLAACaBul41heOhP3uUE8gz68iHE0h81qel
	S/R+Ad2U9KsX+jdCOqiiGd6an/DCFTVzlhiWCf966oeQGqZYIACs8A8bfaQMP0D0ALYyPF+9f5TZL
	Qpqc+pkyK2UVaLTvUmaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUPCj-00CABl-B0; Wed, 16 Mar 2022 08:40:25 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUPCF-00C9wY-Q9; Wed, 16 Mar 2022 08:39:57 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 0F2571F42D12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647419994;
 bh=bHSGpAY3H23x1JXYE/vlHRyklr14DosBMgReoFNi82w=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=MHiJhWlwW1xeZka6HRhpj+rlWu+9Kd8BURuDH3UuA5LviMHOn7BaZFsEDpXsdmgOv
 33hZ9D/+xvXcxuh8EtscEFl7PtXnhKjsn1+r399kfidoFhnO4Sb3f7ZunA5iKpgUzJ
 RcYSOtEUGInpXxyp9kZTHWi0G7ZmgN2POFwYI0CCrKJQBcDf6/836YmDrkDERGUzZz
 vm7GvoqYB1530JKF4ZqoPAmYivaUJd6EvhY6N1xE4/m1rxAjjjZkQgRW23+LnGPxtX
 FQAdnaOdyY4t4BWCriSGuJ3ej9Cxf2YqK+tO0wefzLkFkVyZCDPfPcgPn+Dcfl2P3t
 J57/EiGZFw6wQ==
Message-ID: <49885741-ec06-c73e-23e9-6c946c25a2df@collabora.com>
Date: Wed, 16 Mar 2022 09:39:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v1 1/4] dt-bindings: pinctrl: mt8192: Add wrapping node
 for pin configurations
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: kernel@collabora.com, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220315211936.442708-1-nfraprado@collabora.com>
 <20220315211936.442708-2-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220315211936.442708-2-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_013956_061547_F404D1A9 
X-CRM114-Status: GOOD (  12.73  )
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
T24gbXQ4MTkyLCB0aGUgcGluY3RybCBub2RlIGhhcyBwaW5jdHJsIGdyb3VwcyB0byBncm91cCBw
aW4KPiBjb25maWd1cmF0aW9ucy4gRWFjaCBwaW5jdHJsIGdyb3VwIGNvbnRhaW5zIG9uZSBvciBt
b3JlIHBpbm11eCBzdWJub2Rlcwo+IHRvIGxpc3QgbmVlZGVkIHBpbnMgYW5kIHRoZWlyIGNvbmZp
Z3VyYXRpb25zLiBCeSBzdXBwb3J0aW5nIG11bHRpcGxlCj4gc3Vibm9kZXMsIHdlIGNhbiBjb25m
aWd1cmUgZGlmZmVyZW50IHBpbiBjaGFyYWN0ZXJpc3RpY3MKPiAoZHJpdmluZy9wdWxsLXVwL3B1
bGwtZG93bi9ldGMuKSBpbiBhIHBpbmN0cmwgZ3JvdXAuCj4gCj4gVXBkYXRlIHRoZSBtdDgxOTIg
cGluY3RybCBkdC1iaW5kaW5nIHRvIGFkZCB0aGUgbWlzc2luZyBwaW5jdHJsIGdyb3VwCj4gbm9k
ZSB0aGF0IHdyYXBzIHRoZSBwaW5tdXggc3Vibm9kZXMgYW5kIHVwZGF0ZSB0aGUgZXhhbXBsZSBh
dCB0aGUgZW5kLgo+IFdoaWxlIGF0IGl0LCBhbHNvIHJlbW92ZSB0aGUgZXhhbXBsZSBlbWJlZGRl
ZCBpbiB0aGUgZGVzY3JpcHRpb24gc2luY2UKPiBpdCBpcyByZWR1bmRhbnQgdG8gdGhlIGFscmVh
ZHkgc3VwcGxpZWQgZXhhbXBsZSBhdCB0aGUgZW5kLgo+IAo+IFRoaXMgc2FtZSBjaGFuZ2Ugd2Fz
IGRvbmUgZm9yIG10ODE5NSBpbiBjb21taXQgNzlkY2Q0ZTg0MGNjICgiZHQtYmluZGluZ3M6Cj4g
cGluY3RybDogbXQ4MTk1OiBhZGQgd3JhcHBpbmcgbm9kZSBvZiBwaW4gY29uZmlndXJhdGlvbnMi
KS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyA8bmZyYXByYWRv
QGNvbGxhYm9yYS5jb20+Cj4gCgpIZWxsbyBOaWNvbGFzIQoKUmV2aWV3ZWQtYnk6IEFuZ2Vsb0dp
b2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5j
b20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlh
dGVrCg==
