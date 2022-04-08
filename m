Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34C80C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 10:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xCu+vpm/TpmL/7A7Z33Ncs/Uh/JsmyX9oMFPS7CzTH0=; b=VX/RJQmemHQ+Ap
	M+ydyqx2Yv5XoBYWJUO5sddHiIBijBPknz8OqUWc3V43fA1hngg2bcvvj/W13JwrBRlfInatJZAzf
	tGk4VGter/jCRSDzst2r9cWUDnvE9pT+yz0T9jeb7nPe2bdqSINfatotqNDW3uXdyw6PoYu9qk7ri
	XerroGUOxySv0Cr44/dr0SA3756w1PE76SvvG0XdaC8ZyBcnvdlfZsFaa7w6MlU9PnL+09BbEw5zE
	xtv7wHKMzYC6a3GzKlCmUvFm7UQQCjgblEnxMH/yP5HOlvEGkq+FXK6kbNblyl4g6RHfNTGc2TTHz
	38mqFB/F4RABlw7nw6Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nclRK-00GEnO-Ph; Fri, 08 Apr 2022 10:02:02 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nclQq-00GEWN-9F; Fri, 08 Apr 2022 10:01:33 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 5045B1F46D04
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649412091;
 bh=FqAvt8ypfsA4NVC3NbXVr4Xzdu/Pk9xlB69DZ7giK+I=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QPIy9xooIHcG5c9g9Fx6s0BO7NaFy/BEHV7pyH2cPBuyyl/xQ5oRBeR/kaR1xy4kO
 xQcw5RhPJc65peVUt+wiM7WB/aFJlSy5dHF/u7GzjT8JIadxaKQZpzc8cuBYHIFXIe
 m6eEkdwhRCGZY9rRs3cYPOEJgROePqI/3gMfBw7grVIwmSupEo+S0eAn2rrmF3Nr3T
 mli8YOjg/vLkAc5u1wOpRwZ0oEHDiJ1/Xkd/9nRq+sTHXgs4pcLddp2pGufVB8DZo8
 tlQ6hCgRNaD2HXk6E/PDxk8jKjnLKOcFmsLJ4Rsl6904IL5jcZeHyzo8Q8baVFbJDh
 Xu7W/pSB5kcNw==
Message-ID: <ca885fc0-d67a-b2f7-454b-c8e65ee5ce1d@collabora.com>
Date: Fri, 8 Apr 2022 12:01:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [v10 3/4] ASoC: mediatek: mt8192: refactor for I2S8/I2S9 DAI
 links of headset
Content-Language: en-US
To: Jiaxin Yu <jiaxin.yu@mediatek.com>, broonie@kernel.org,
 robh+dt@kernel.org, nfraprado@collabora.com, tzungbi@google.com
Cc: aaronyu@google.com, matthias.bgg@gmail.com, trevor.wu@mediatek.com,
 linmq006@gmail.com, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Tzung-Bi Shih <tzungbi@kernel.org>
References: <20220408060552.26607-1-jiaxin.yu@mediatek.com>
 <20220408060552.26607-4-jiaxin.yu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220408060552.26607-4-jiaxin.yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_030132_491126_774FF171 
X-CRM114-Status: UNSURE (   8.45  )
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

SWwgMDgvMDQvMjIgMDg6MDUsIEppYXhpbiBZdSBoYSBzY3JpdHRvOgo+IEFzIHBhcnQgb2YgdGhl
IHJlZmFjdG9yaW5nIHRvIGFsbG93IHRoZSBzYW1lIG1hY2hpbmUgZHJpdmVyIHRvIGJlIHVzZWQg
Zm9yCj4gdGhlIHJ0MTAxNShwKSBhbmQgcnQ1NjgyKHMpIGNvZGVjcyBvbiB0aGUgTVQ4MTkyIHBs
YXRmb3JtLCBwYXJzZSB0aGUKPiBydDU2ODIocykgY29kZWMgZnJvbSB0aGUgaGVhZHNldC1jb2Rl
YyBwcm9wZXJ0eSBpbiB0aGUgZGV2aWNldHJlZSBhbmQgd2lyZQo+IGl0IHRvIHRoZSBJMlM4IGFu
ZCBJMlM5IGJhY2tlbmRzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEppYXhpbiBZdSA8amlheGluLnl1
QG1lZGlhdGVrLmNvbT4KPiBSZXZpZXdlZC1ieTogVHp1bmctQmkgU2hpaCA8dHp1bmdiaUBrZXJu
ZWwub3JnPgo+IFJldmlld2VkLWJ5OiBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyA8bmZyYXByYWRv
QGNvbGxhYm9yYS5jb20+Cj4gVGVzdGVkLWJ5OiBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyA8bmZy
YXByYWRvQGNvbGxhYm9yYS5jb20+CgoKUmV2aWV3ZWQtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVs
IFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBt
YWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
