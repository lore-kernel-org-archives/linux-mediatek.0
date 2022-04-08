Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8459CC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 10:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=64+TLOygXfbHV1udU5NVxAKKW7PTAzpN8m5sdQIDIIE=; b=x3k2TveAgaAhJC
	I6yfpQjbWVu1Wrs/ZiCkriUg7zK0bkwW+ZRdxVJo+snoc85E8lDJvfLIqoOurWsHFX/xD4UTFk0MY
	6L2A3OavRfhfWpInOicdsdQ73ei/+vl/tQQfgjkSjaLAmAdIwa0xbQTPG938TcY3EJp33tLtJ7oKY
	Eg9uwlwiWg8dCY2Zm0hocGe3FKxZJe3mbpt5xpEyoak4J/lhI4m1ONt9bUJps+ySiMO8DFXzgIlzU
	aKQvp7G+9e2z5dq2ZX5b16299y8UBNsZ54hQC2TU4EJPCgSeDljLTl67H6/sIbOdTCIcK7LQ5F5UZ
	uaxCpEYNMmjC4KDcaZEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nclRd-00GEzC-U5; Fri, 08 Apr 2022 10:02:21 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nclQs-00GEX1-Bu; Fri, 08 Apr 2022 10:01:35 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 711501F46D05
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649412093;
 bh=7NGSuo4Sc3q7d+xEOL+gCuZe8DYDWsEbLcdLWfuCj9I=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=JxcO36VmnJPCLOLcyirJ48rdA8J1Gy93FP8p7ew06GuDciO5pj3p+5yjfd/VgFyNf
 fB3zwg1o7CBqPqDV11/Jg3p2t0pqRD7WHS3NXe3476+ti6gJmpNqDXnDP8gcDi8xx+
 Nw/H5hhpQJnE6qKWQmWRCFuGxvVvc8IqB4H8K6y3KaxEeZh0sxet79Ye2cVJ79E6Cq
 HSSp6JCE8ML4aA0vKpze42X1qA1mHjF4LT2byKPpog94zHIypR2JiPYgvDy28RfKwP
 1WSEJB60U5gJRYxl8wPdrrpWJwRsjxiIxHS/VcJqFk++49D3SVnxhlefn9hEJfPwt2
 GFxXISHXBDiZQ==
Message-ID: <118239ae-e1c9-2f72-4a4f-26a5523755bb@collabora.com>
Date: Fri, 8 Apr 2022 12:01:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [v10 4/4] ASoC: mediatek: mt8192: support rt1015p_rt5682s
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
 <20220408060552.26607-5-jiaxin.yu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220408060552.26607-5-jiaxin.yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_030134_575661_36126D88 
X-CRM114-Status: GOOD (  10.37  )
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

SWwgMDgvMDQvMjIgMDg6MDUsIEppYXhpbiBZdSBoYSBzY3JpdHRvOgo+IEFkZCBzdXBwb3J0IGZv
ciB1c2luZyB0aGUgcnQ1NjgycyBjb2RlYyB0b2dldGhlciB3aXRoIHJ0MTAxNXAgb24KPiBtdDgx
OTItbXQ2MzU5IG1hY2hpbmVzLiBBbGwgY29uZmlndXJhdGlvbnMgYXJlIHNoYXJlZCB3aXRoIHRo
ZSBydDU2ODIKPiBjb2RlYyB2YXJpYW50LCBzbyBzaW1wbHkgc2VsZWN0IHRoZSBTTkRfU09DX1JU
NTY4MlMgY29uZmlnIHRvIGVuc3VyZSB0aGUKPiBjb2RlYyBpcyBwcmVzZW50IGFuZCBzZXQgdGhl
IGNvcnJlY3QgY2FyZCBuYW1lLiBUaGUgY29kZWMgd2lsbCBiZSBsaW5rZWQKPiB0byBieSBwb2lu
dGluZyB0byBpdCBpbiB0aGUgaGVhZHNldC1jb2RlYyBwcm9wZXJ0eSBpbiB0aGUgZGV2aWNldHJl
ZS4KPiAKPiBXaGlsZSBhdCBpdCwgYWxzbyBjcmVhdGUgbWFjcm9zIGZvciB0aGUgbmFtZXMgb2Yg
dGhlIGRpZmZlcmVudCBjb2RlYwo+IHZhcmlhbnRzIHN1cHBvcnRlZCBieSB0aGlzIGRyaXZlciwg
YXMgd2VsbCBhcyByZW5hbWUgb2NjdXJyZW5jZXMgb2YKPiBydDEwMTVwX3J0NTY4MiB0byBydDEw
MTVwX3J0NTY4MngsIHNpbmNlIHRoZXkgYXJlIHNoYXJlZCBiZXR3ZWVuIHJ0NTY4Mgo+IGFuZCBy
dDU2ODJzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEppYXhpbiBZdSA8amlheGluLnl1QG1lZGlhdGVr
LmNvbT4KPiBSZXZpZXdlZC1ieTogVHp1bmctQmkgU2hpaCA8dHp1bmdiaUBrZXJuZWwub3JnPgo+
IFJldmlld2VkLWJ5OiBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyA8bmZyYXByYWRvQGNvbGxhYm9y
YS5jb20+Cj4gVGVzdGVkLWJ5OiBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyA8bmZyYXByYWRvQGNv
bGxhYm9yYS5jb20+CgoKUmV2aWV3ZWQtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxh
bmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxp
c3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
