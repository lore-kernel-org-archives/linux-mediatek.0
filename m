Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDAD3C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Mar 2022 08:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D2h3K39uyTEA/jPBXP3OZwSlBweNuJabHvt1XaPFYpU=; b=V/xJcNG22Y85gw
	fC1ihg3bTECwYIfEUCnCM8l3fRxmk9OdA9fGk7fzBnGOXiGS/5r93aUVSYHw7voKwlRV9Q0wS0L9p
	0Rp5z119K7gqZAYeU5bXTglRNGYruUiiHhb+H6DcU/8Fi06Eybf9mJCldp+HD2cc1gzG+q5jT7hKZ
	GH+ulP+AfXgPFs+wUktNXIeiEEOfCuT0cVWW6aAtbWyIq9bCyzMehpjBjMG0Qq2LUz0lew/X5DPl/
	ZqOiLodHnCMBxAFYNLFpETSf2dcGNnFogKWTMSypDdBBsKSK2eCTMdBrMUWyTojAVc5ZbdP+SZ38l
	2Xo3j4K16UxT0HUEZpvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUPDe-00CAen-A2; Wed, 16 Mar 2022 08:41:22 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUPCL-00C9zX-2N; Wed, 16 Mar 2022 08:40:02 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 6DEB01F42D12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647419999;
 bh=YmBxd4JR5L4/vFYAKhWIFVHSjJr+fUNPnVrFxHmeKo8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=NzFGdhzShxGXV6dG+cbC30Co4S2EULReO2T1ACBEqPUytpdbhDTqQXxb76yzxt5bJ
 HEe+VLxL70NgoPqikcA687L1/mtXYNb7Uq1q8Vamlz6Lm90gm5fAbgJU9v8pXL9h1r
 MyWcI/2n8Kv15rrHmr4wYozJwiuwAnAQUjh9pAHvV9dlUaY0/G50RcLgke0yTn2nl+
 QVh1bBGudArZZKq9flV1OJVf1x4OIR6gFlmsm4NdDW+vcaDpgPcPqB0xOUUHsvlF4D
 9XP/OSTQ3U+mhwHHMnL6x23RtEPm/Iyqs5qmaSZQpJjA65CCqXGdqVwVAfI5ZoIACN
 gTSkXMaTSS4Uw==
Message-ID: <bf85ae3c-968d-c138-cedd-d144cabf1e44@collabora.com>
Date: Wed, 16 Mar 2022 09:39:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v1 3/4] dt-bindings: pinctrl: mt8192: Add
 mediatek,pull-up-adv property
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: kernel@collabora.com, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220315211936.442708-1-nfraprado@collabora.com>
 <20220315211936.442708-4-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220315211936.442708-4-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_014001_318704_A4AECCEB 
X-CRM114-Status: UNSURE (   8.28  )
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
QWRkIHRoZSBtZWRpYXRlayxwdWxsLXVwLWFkdiBwcm9wZXJ0eSB0byB0aGUgcGluY3RybC1tdDgx
OTIgZHQtYmluZGluZwo+IHRvIGFsbG93IGNvbmZpZ3VyaW5nIHB1bGwtdXAgcmVzaXN0b3JzIG9u
IHRoZSBwaW5zIG9mIE1UODE5Mi4gSXQgaXMgdGhlCj4gc2FtZSBhcyBpbiBtdDgxODMtcGluY3Ry
bC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyA8bmZyYXByYWRv
QGNvbGxhYm9yYS5jb20+CgpSZXZpZXdlZC1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8g
PGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcg
bGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
