Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C82C1C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Mar 2022 13:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/AzVlam7IySYDgY0pLjgAuW5REWQooK/60QdPjb/8XM=; b=GkM7/H2mR0g1E+
	qYcj1N3TA7iXiGF08v3huZ4IL2jNQF7tUqeaJgjJbAKoLyIENZJ4BaxOliTV5R+I9LDKLjS6FccLw
	V3/7RShyi7WH5b2aUa1YYJRV3d6y6GyQ+sOIQ41m2BbFxiDrTBQd2MMefUidXGlZf3lvDp1P2OL92
	oVAyIZyV5I7paH8nuhtFGvazdv9fbCBPjBSePygsJn5bczK1OV/7Hcnd4wTeA8nZT7V+WBxVQCFO/
	8vYQWyj9/rrZSDqe03swB7oBxXOL+S73yRAtCj7TpotdV1yx6QbEXfiladPvu1gDQp4bm9JgJ/yRu
	zfBf65NCZBAD1BTB7XxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXkQW-002EkB-BT; Fri, 25 Mar 2022 13:56:28 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXkQG-002Eeg-DT; Fri, 25 Mar 2022 13:56:15 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 8554B1F462D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1648216571;
 bh=Bdh0loN24wgZrV5HeJ/in7cwRtS14Faz0EbpjdK++MM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ZKb1jMxDVeOmRFSng/U2OfN18a7nN9u6Om63BUmeHyc9sfLcHBdjPxTfyUorrHVa5
 21TerkeLjQHv0rmn03Yx9miaHWmW3KeUf70poJoQ6uOrdEcGojO78eXsACBavaVhnJ
 2fmUeidPnBc8Jue/a19+XCJdHRPkqRPXj4RqSMCA/a4YG5KALMRFY3+wSsqkiL/3y2
 y5PgvLtWCFrGVPJsUe9BH/KFwdJ92WiD9pCG+A+IELcZMOpz/dUyDjnuTsTDNm0xs2
 XD0w1s1ZEnS5WrJ1Nnf2jvDqrKAqw8EF6jRL+m1KcsT5RQQEnbSO5A0lB9BWHXs9ln
 ihWvZL09/e1sw==
Message-ID: <0c7593c6-c87f-e70f-bd36-d3e7ebc7dd67@collabora.com>
Date: Fri, 25 Mar 2022 14:56:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v4 21/22] arm64: dts: mt8192: Add gce info for display
 nodes
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 Hui Liu <hui.liu@mediatek.com>
References: <20220318144534.17996-1-allen-kh.cheng@mediatek.com>
 <20220318144534.17996-22-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220318144534.17996-22-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_065612_612325_7F460372 
X-CRM114-Status: UNSURE (   8.25  )
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

SWwgMTgvMDMvMjIgMTU6NDUsIEFsbGVuLUtIIENoZW5nIGhhIHNjcml0dG86Cj4gQWRkIGdjZSBp
bmZvIGZvciBkaXNwbGF5IG5vZGVzCj4gLSBJdCdzIHJlcXVpcmVkIHRvIGdldCBkcml2ZXJzJyBD
TURRIHN1cHBvcnQKPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbGxlbi1LSCBDaGVuZyA8YWxsZW4ta2gu
Y2hlbmdAbWVkaWF0ZWsuY29tPgo+IFJldmlld2VkLWJ5OiBOw61jb2xhcyBGLiBSLiBBLiBQcmFk
byA8bmZyYXByYWRvQGNvbGxhYm9yYS5jb20+CgpSZXZpZXdlZC1ieTogQW5nZWxvR2lvYWNjaGlu
byBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4KCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRp
YXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
