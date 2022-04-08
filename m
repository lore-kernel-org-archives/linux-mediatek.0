Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4767C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 10:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Iik6cfEGaf15MzJpTYro/4Zymn+vPm/6en9LPMu+vQ=; b=oSBB3RmF88kK9e
	F+z8GNVfKtOg2YtfAXJ66dOPAU7bb6yP5mnkkJzhWHnuVE+7xN4PvSflTP5sZStLREaJblPw4xL11
	MqSO4MNNYVrMEbIXx+p1dahX0p9kQT8ns42Z4+mdBt9tl4advArYhkWRATip6UPr9/uaq7TlKwpio
	9wdw8W2bK/GrvICLVQ/UR/8VAnTInQkFnpUSx1tH0z0o5xfFPjdCeBViTScaTzdcfu/PtFGpNCNes
	L9CfQJmbeiosGVjP8+Msc6wOeejJzRNmI62a6KdzSckGmgZdGKkCOMbrRND4o/NcNDSL+SDFOpkVz
	4Ip2yxjvwbIgbVCvHVcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nclR9-00GEgN-BC; Fri, 08 Apr 2022 10:01:51 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nclQl-00GEUK-FD; Fri, 08 Apr 2022 10:01:29 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 2C7A21F46D05
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649412085;
 bh=H48V/pdViwo1p4zdgSuQJNP0nt+xojqU1ZySQizv8TA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=e+OwaoM0/W425yMTI5CiDoCZ2qF4wxgsbTPnDsjRfoWZspx1u5BLH7u3Km871jNEG
 L4cybVNSOkyyskB9p5pTI6tNLYKQ59q48+IlDyI3qQC2cagfvteklRJBKrPSYYPGrU
 ojvfbobYyK6exslPlXMMBsNKap1o9DbsBJAur0vvYCBkmKzcBpx4FqPLC+/rks8On/
 8oOlFArZ9jrqzgnvekz0cXfpXd4s/kxsys1/yhytnzSdA0L2p3y39IG4uv7I+avuq7
 7yOVOw3jLdlMWZ4iDOMmkadY3qhb7seD+TMjw/3uO11aGeME37oS+sZpJaE3zBK89B
 k11ozMdvSfgNA==
Message-ID: <90bea01f-aad1-6150-4d51-0c51bcb48d09@collabora.com>
Date: Fri, 8 Apr 2022 12:01:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [v10 2/4] ASoC: mediatek: mt8192: refactor for I2S3 DAI link of
 speaker
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
 <20220408060552.26607-3-jiaxin.yu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220408060552.26607-3-jiaxin.yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_030127_764545_9C01D683 
X-CRM114-Status: UNSURE (   8.76  )
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
YXRmb3JtLCBwYXJzZSB0aGUKPiBydDEwMTUocCkgY29kZWNzIGZyb20gdGhlIHNwZWFrZXItY29k
ZWNzIHByb3BlcnR5IGluIHRoZSBkZXZpY2V0cmVlIGFuZAo+IHdpcmUgdGhlbSB0byB0aGUgSTJT
MyBiYWNrZW5kLCBpbnN0ZWFkIG9mIGhhcmRjb2RpbmcgdGhlIGxpbmtzIGFuZAo+IHNlbGVjdGlu
ZyB0aHJvdWdoIHRoZSBjb21wYXRpYmxlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEppYXhpbiBZdSA8
amlheGluLnl1QG1lZGlhdGVrLmNvbT4KPiBSZXZpZXdlZC1ieTogVHp1bmctQmkgU2hpaCA8dHp1
bmdiaUBrZXJuZWwub3JnPgo+IFJldmlld2VkLWJ5OiBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyA8
bmZyYXByYWRvQGNvbGxhYm9yYS5jb20+Cj4gVGVzdGVkLWJ5OiBOw61jb2xhcyBGLiBSLiBBLiBQ
cmFkbyA8bmZyYXByYWRvQGNvbGxhYm9yYS5jb20+CgpSZXZpZXdlZC1ieTogQW5nZWxvR2lvYWNj
aGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4K
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1t
ZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVr
Cg==
