Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA2B3C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 08:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W+dhxsKb7u4hYIKW5Zq2sCH2edqwgEPqJaCaV8Pni3o=; b=OgfFamq7E3QZ3Q
	9MKUfIayNJ2XitDFrczTgFlfDTzoacyqi425cyRNwNYndcL5guOFrIajOg2AbwamPxwFvNG2VidQl
	V0bKRWuyuxfIAznecPbP4Sz/jvo96PrRCA2CKOOq/HqiNG284f8mJFq0YG37Uk/09omOtzCyWfZVk
	DEolTgfuCj0IccbPDvy/EIAh/Bv5R+ocwd2eX9f5bl2LyNc/I/7swHclrvUsL5bUseSicK0nULSYc
	iPKL8/TevgkclVWgTQO2z1wKnfgc8zto5FMFJ1f1/Uw+Vr9yxOKX1Zt9aZWj7ThBhbv3XkM7gCsNL
	M3z4WYRU56e9FmIj3GaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncjqI-00Fou2-6W; Fri, 08 Apr 2022 08:19:42 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncjpm-00Fobd-0P; Fri, 08 Apr 2022 08:19:11 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 3CE601F46C62
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649405942;
 bh=n3PZ5EP+atv7EGkUpF8rFTDvYYK90dAfeWT4ALjfgCk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=AGaSlQ5GwsYXwaRRFXeblbG7SziGG7emykikpIAfxEU0y7PwcVwq+u6+VC78eN7ac
 dvw4nM8YN/wlDXzinoeJexXRkswap/l5Ls4ByFmjq/HeK24G2a+ei3E/QPHNlU+kb0
 FACQyoSJTpUN6/Qwc7zjRsdxlPDWzX/WDlEMy/6m4XewBkGSzAmTCCLqrY3gX6T3hj
 I96FsuASNPhaQ76uG7hfT1gtyOnHu5KrRh3XnPIl3aQoVUBLlIbyAfSs8KB68bB0ZK
 EkXH2Wm3jvEvoVccIPRgGHjU+2jhsf2pcMh5mSC8js3K5Of3XDs8yFPmkJJr5iHzGr
 Z0TDgO0kfr0gA==
Message-ID: <ba1d3b7b-9bcf-9c45-c487-91da767b83f5@collabora.com>
Date: Fri, 8 Apr 2022 10:18:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] drm/mediatek: dpi: Use mt8183 output formats for mt8192
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: kernel@collabora.com, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Jitao Shi <jitao.shi@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20220408013950.674477-1-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220408013950.674477-1-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_011910_285585_5AA4E519 
X-CRM114-Status: GOOD (  10.03  )
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

SWwgMDgvMDQvMjIgMDM6MzksIE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvIGhhIHNjcml0dG86Cj4g
VGhlIGNvbmZpZ3VyYXRpb24gZm9yIG10ODE5MiB3YXMgaW5jb3JyZWN0bHkgdXNpbmcgdGhlIG91
dHB1dCBmb3JtYXRzCj4gZnJvbSBtdDgxNzMuIFNpbmNlIHRoZSBvdXRwdXQgZm9ybWF0cyBmb3Ig
bXQ4MTkyIGFyZSBpbnN0ZWFkIHRoZSBzYW1lCj4gb25lcyBhcyBmb3IgbXQ4MTgzLCB3aGljaCBy
ZXF1aXJlIHR3byBidXMgc2FtcGxlcyBwZXIgcGl4ZWwsIHRoZQo+IHBpeGVsY2xvY2sgYW5kIERE
UiBlZGdlIHNldHRpbmcgd2VyZSBtaXNjb25maWd1cmVkLiBUaGlzIG1hZGUgZXh0ZXJuYWwKPiBk
aXNwbGF5cyB1bmFibGUgdG8gc2hvdyB0aGUgaW1hZ2UuCj4gCj4gRml4IHRoZSBpc3N1ZSBieSBj
b3JyZWN0aW5nIHRoZSBvdXRwdXQgZm9ybWF0IGZvciBtdDgxOTIgdG8gYmUgdGhlIHNhbWUKPiBh
cyBmb3IgbXQ4MTgzLCBmaXhpbmcgdGhlIHVzYWdlIG9mIGV4dGVybmFsIGRpc3BsYXlzIGZvciBt
dDgxOTIuCj4gCj4gRml4ZXM6IGJlNjNmNmU4NjAxZiAoImRybS9tZWRpYXRlazogZHBpOiBBZGQg
b3V0cHV0IGJ1cyBmb3JtYXRzIHRvIGRyaXZlciBkYXRhIikKPiBTaWduZWQtb2ZmLWJ5OiBOw61j
b2xhcyBGLiBSLiBBLiBQcmFkbyA8bmZyYXByYWRvQGNvbGxhYm9yYS5jb20+Cj4gCgpMb3ZlbHkh
CgpSZXZpZXdlZC1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hp
bm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRp
YXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
