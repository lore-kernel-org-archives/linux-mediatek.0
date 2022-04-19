Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD63EC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Apr 2022 21:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Y4dgAMir1AyBOUJZ5aL7wmtXDLVeMN+b8lOGn7HSQw=; b=VwM5+gUj+AUg06
	5YoWYQLe16GCXPOXXqidYe5gD55O3f+CKPsHDPYOWOvedAGqfUQdjvHqH6Z8S9lZQBifzhq/kl841
	459UlWURB6u4a/taDK2FpSd343JTbG4JR+Zkb7c/1Zr7cgSt7S5AwMjFRGyZ+ZyHXtjrZmF8SLtQN
	Hcddx7Ley+/az0IfI02obfeC9S5zLGiuxIpfRbWVXkj3Y2LSvqVdYkfASCGHO2HLfeEfO6naUVFjI
	OZMpdX4xxjis9UK+kt/PifuSNefYABfYDT1bnUSuOF12UsgZhLK7JKyaONy8S6ju8Bjep3nSp0Fy5
	R8mWCQPgpfjv+3+bKcrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngvBV-006NWw-0U; Tue, 19 Apr 2022 21:14:53 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngvBI-006NSC-76
 for linux-mediatek@lists.infradead.org; Tue, 19 Apr 2022 21:14:41 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id i20so33353775ybj.7
 for <linux-mediatek@lists.infradead.org>; Tue, 19 Apr 2022 14:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=B5FkgS7CpCMD1fBHRk4Pg2TvAwwG8HWvfvSYT8z+CM0=;
 b=cWM1mQNRxVVmkRqvpJoS6HQ7n4uVQ8ZXRkav1OIuUXOelKwkJGOE/I5lh4mFQSdjQs
 9CywP7VVEHQcY0IMFPwuidd5CTnqBt53/BReu3XS6fO1tL8Dsd4kjIXv5l2hgfHpAE9w
 dOkGgbjywxdy2/bwAxkLlXpuAqoL1N7Aa3o/nhBed31tzQe5TG07pQxl08GFRBMAAiKS
 LiN/5rbJScXQbBkUNQKS3Ol0BSMkpZC23iHgRos10Z1Pp4sQq9svt/A0KUukNX9Bmx5Z
 9cE7gtXwERipmqD/bCVXKTx0bYgY2z55WTHhHsBZVY5j07YliDRhWaHLeDn0v+nhYZGW
 NRlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=B5FkgS7CpCMD1fBHRk4Pg2TvAwwG8HWvfvSYT8z+CM0=;
 b=VkQr2PGhC/il+9JNNiaM5TV5sKzQz6zJ15rvsdTeVlpKfzhPdFVhUQ9aF1DaXxrcpm
 dhJxigLypQNI6nmu1nokz0EkAdrMHmbPK6DozTAM9p9s/CtG6/Z1pQIz2Rsh108WUsNi
 gjLqAtLFuTn9wyCfqPpAPPq3roAx4Y/Wth9N+AfBG+U8PsdaP0g/qLW2URogmWQ9SITe
 EdLlhpTcjxIlpjMuwL5WoZr9hek86H8IMFA4uivt8h+LGgmx8H31WEM1DBOIh4enLx91
 K6e6Q6AsmRcTIZ9jA51BXLGsMdsb1dRalGEPoyWP1VZ0De548BcRkaNdN6smJKXpieKv
 dh+g==
X-Gm-Message-State: AOAM531jet2wKr9npTtyDPiWvmc1jYDYiATWEsUMXxVb5VLGtbzjhcmO
 zyg+4PDZgZma2Dr2lzq8K4YZp7rT+u7g2Kd81hVNMA==
X-Google-Smtp-Source: ABdhPJyUm04KA3osPPotEEqNmtRkf6e+697t9fH2aHJ9OuoYnB5ZhpMPCHKyoLBadeQJAgM1x+lwH2LZA0t7o/A48cA=
X-Received: by 2002:a25:a12a:0:b0:644:e94e:5844 with SMTP id
 z39-20020a25a12a000000b00644e94e5844mr12357883ybh.492.1650402878390; Tue, 19
 Apr 2022 14:14:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220315211936.442708-1-nfraprado@collabora.com>
 <20220315211936.442708-4-nfraprado@collabora.com>
In-Reply-To: <20220315211936.442708-4-nfraprado@collabora.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Apr 2022 23:14:27 +0200
Message-ID: <CACRpkdYbRXrqNwo-h2jn91xU20pQ-aiNxeJHxyK2uMgbKm7OsA@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] dt-bindings: pinctrl: mt8192: Add
 mediatek,pull-up-adv property
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Rob Herring <robh+dt@kernel.org>, kernel@collabora.com, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_141440_293694_5086CD04 
X-CRM114-Status: UNSURE (   8.38  )
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

T24gVHVlLCBNYXIgMTUsIDIwMjIgYXQgMTA6MjAgUE0gTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8K
PG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tPiB3cm90ZToKCj4gQWRkIHRoZSBtZWRpYXRlayxwdWxs
LXVwLWFkdiBwcm9wZXJ0eSB0byB0aGUgcGluY3RybC1tdDgxOTIgZHQtYmluZGluZwo+IHRvIGFs
bG93IGNvbmZpZ3VyaW5nIHB1bGwtdXAgcmVzaXN0b3JzIG9uIHRoZSBwaW5zIG9mIE1UODE5Mi4g
SXQgaXMgdGhlCj4gc2FtZSBhcyBpbiBtdDgxODMtcGluY3RybC4KPgo+IFNpZ25lZC1vZmYtYnk6
IE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvIDxuZnJhcHJhZG9AY29sbGFib3JhLmNvbT4KClBhdGNo
IGFwcGxpZWQhCgpZb3VycywKTGludXMgV2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4
LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
