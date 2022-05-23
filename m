Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F74CC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 10:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LWQyYE6BP2E5IRi0Gt8J1tAMiFw9HHcce0fZUI0C+vY=; b=ORKcJdW7GKVBds
	jVAw2ccbQUYdESLjYyNw3ejl5sgAe9Qa+6CMiNpYhE17hBX/bsTs5A8/lUCYuP0Uu07ff62CNuKoF
	cVioN+HmUzSgQgB50dI0yhC/AUJG8+7l4rLVa/BEUB1XcjoKoQozUGpE5iPNQNj3kHc1lJ7PcpOQ4
	1SRxwi8dlulxxEoSKvxacs8nkNwdsOXRCTggxL9ywtiucCkYkqO7g5h+VHgllw5vJUT5qNlebQf3B
	1lgdsm7Oz17f677VyoP1qykob8/lcHadguzUSQnxMWHiPbbHsgUVkxwJYixgiWEYdKKaOzOVNpbRk
	EGMjAb7ZywS2AwznK0SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt5L3-003GRN-VH; Mon, 23 May 2022 10:31:02 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt4Bq-002m2y-9R; Mon, 23 May 2022 09:17:28 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 9BD4C1F42CC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653297444;
 bh=REzwy2jbEfxDlRNJ3gYCepX00BBtXmnPigKqEo22lqY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=D9FDcKpm/V6yRmd3FNGHKKAzj+bP6sI/RUvJnUGA/L9Q6NnMjaWZiLg17f8OgDGs6
 /kqGAl1ZRQJr/1ejHXORNPOvXyy0OcCizWKPiZ1gymqf6/d7cQwbxcfku2jJUrYuH0
 BUWQ68P3a9lWBYW6+n3G8Hsb909xRgIF1gnftepXT0yyZjPRTgCDoMXtJScnBdDeRf
 Mfb/mKZ/CsAltCPWmyxDZ1zpIZ4gJijxWsfI4sdSkZKUqmfvsuyRBLMhmFN/qTzzQf
 m62m4JEBtGiXw/bPkfhRDGdCrtBZMVZDhpPwe5d4uDzhVSLw+E+tI8uxxB7726VuWm
 kkKvbGsDoNX4g==
Message-ID: <fed16322-1ffb-7744-38c5-4854882778e0@collabora.com>
Date: Mon, 23 May 2022 11:17:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v8 19/19] clk: mediatek: reset: Add infra_ao reset support
 for MT8186
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, mturquette@baylibre.com,
 sboyd@kernel.org, matthias.bgg@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Cc: p.zabel@pengutronix.de, nfraprado@collabora.com,
 chun-jie.chen@mediatek.com, wenst@chromium.org, runyang.chen@mediatek.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220523060056.24396-1-rex-bc.chen@mediatek.com>
 <20220523060056.24396-20-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220523060056.24396-20-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_021726_577235_A1271A41 
X-CRM114-Status: UNSURE (   7.46  )
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

SWwgMjMvMDUvMjIgMDg6MDAsIFJleC1CQyBDaGVuIGhhIHNjcml0dG86Cj4gVGhlIGluZnJhX2Fv
IHJlc2V0IGlzIG5lZWRlZCBmb3IgTVQ4MTg2Lgo+IC0gQWRkIG10a19jbGtfcnN0X2Rlc2MgZm9y
IE1UODE4Ni4KPiAtIEFkZCByZWdpc3RlciByZXNldCBjb250cm9sbGVyIGZ1bmN0aW9uIGZvciBN
VDgxODYgaW5mcmFfYW8uCj4gLSBBZGQgaW5mcmFfYW9faWR4X21hcCBmb3IgTVQ4MTg2Lgo+IAo+
IFNpZ25lZC1vZmYtYnk6IFJleC1CQyBDaGVuIDxyZXgtYmMuY2hlbkBtZWRpYXRlay5jb20+Cj4g
UmV2aWV3ZWQtYnk6IE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvIDxuZnJhcHJhZG9AY29sbGFib3Jh
LmNvbT4KPiBUZXN0ZWQtYnk6IE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvIDxuZnJhcHJhZG9AY29s
bGFib3JhLmNvbT4KCkZvciB0aGUgY29kZToKClJldmlld2VkLWJ5OiBBbmdlbG9HaW9hY2NoaW5v
IERlbCBSZWdubyA8YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0
ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
