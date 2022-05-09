Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CE65C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 May 2022 12:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:CC:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=CtwFVbLean2FlzJNJgfF48fMpkEAvZ32eXzFw9PmaDQ=; b=TGtROskVmBFpID0VEwEUIumEU0
	APXAZ90TmGUGXbeYUjwp7Wy9yz9gA5SLfLic6fsAdWv3GFCDGOLHebkIwZ4+XVEWV+7NnBid+h3Z+
	ivKFcUVjnKqN+5pWwLef/HTuFTxmoZx5D/FxV2pfddjySlA65B9CEQSEFWCzbhrrpIxXMaUIUv6y/
	ltbxLnxuUn7PxvuzpaGkQhPPaURB2nIYB1CKHhVGOPnLDa+WUg2KmKLPxGpJGMeQb2uK2E2ZTSCa+
	ZwPYhcKtUr27dmIjB+ZsI3BGUjNVSRzYNKYI1pOIFx8y0PS0sGPaCb8zGy2LFq+Brv+oPFpCDiX6g
	kFECyBeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1no2FK-00EHFB-R7; Mon, 09 May 2022 12:12:14 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1no2F7-00EH8H-CZ; Mon, 09 May 2022 12:12:03 +0000
Received: from canpemm500007.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Kxg250Jr4zGphW;
 Mon,  9 May 2022 20:09:01 +0800 (CST)
Received: from [10.174.179.215] (10.174.179.215) by
 canpemm500007.china.huawei.com (7.192.104.62) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 9 May 2022 20:11:47 +0800
Subject: Re: [PATCH v2] ASoC: mediatek: mt8195: Fix build warning without
 CONFIG_OF
To: Mark Brown <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
 <matthias.bgg@gmail.com>, <tzungbi@google.com>,
 <angelogioacchino.delregno@collabora.com>, <trevor.wu@mediatek.com>,
 <arnd@arndb.de>, <alsa-devel@alsa-project.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
References: <20220507021424.12180-1-yuehaibing@huawei.com>
 <YnkAAx3VAXCMFOTn@sirena.org.uk>
From: YueHaibing <yuehaibing@huawei.com>
Message-ID: <3ba32c96-eec3-61a0-aece-d161d8db24ac@huawei.com>
Date: Mon, 9 May 2022 20:11:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <YnkAAx3VAXCMFOTn@sirena.org.uk>
Content-Language: en-US
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 canpemm500007.china.huawei.com (7.192.104.62)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_051201_685699_10261437 
X-CRM114-Status: UNSURE (   8.02  )
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

T24gMjAyMi81LzkgMTk6NTAsIE1hcmsgQnJvd24gd3JvdGU6Cj4gT24gU2F0LCBNYXkgMDcsIDIw
MjIgYXQgMTA6MTQ6MjRBTSArMDgwMCwgWXVlSGFpYmluZyB3cm90ZToKPj4gc291bmQvc29jL21l
ZGlhdGVrL210ODE5NS9tdDgxOTUtbXQ2MzU5LmM6MTYzOTozMjogd2FybmluZzog4oCYbXQ4MTk1
X210NjM1OV9tYXg5ODM5MF9ydDU2ODJfY2FyZOKAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1
bnVzZWQtdmFyaWFibGVdCj4+ICAxNjM5IHwgc3RhdGljIHN0cnVjdCBtdDgxOTVfY2FyZF9kYXRh
IG10ODE5NV9tdDYzNTlfbWF4OTgzOTBfcnQ1NjgyX2NhcmQgPSB7Cj4+ICAgICAgIHwgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn4KPiAKPiBUaGlzIGRvZXNuJ3QgYXBwbHkgYWdhaW5zdCBjdXJyZW50IGNvZGUsIHBsZWFzZSBj
aGVjayBhbmQgcmVzZW5kIChpdAo+IGxvb2tzIGxpa2UgeW91IGhhdmUgYWRkaXRpb25hbCBwYXRj
aGVzIGluIHlvdXIgdHJlZSwgYW0gZG9lc24ndCBrbm93IHRoZQo+IGJhc2UgU0hBMXM/KS4KClNv
cnJ5LCB3aWxsIHJlYmFzZSBvbiBuZXh0LTIwMjIwNTA5IGFiCj4gCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxp
c3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
