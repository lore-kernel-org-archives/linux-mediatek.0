Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B026C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Dec 2021 08:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UYjnfJXGREyHXBEl2KcbXR1HFB+lefWBANmG1lEu3Lo=; b=WmvOf5j7AoEaio
	gwWKxMMB650vJOXW8WdMItHyFtYkb7noF7OZ3nbk3R45sUvmDoZ2t3PaaNgsbOyjhCxTzs50EJJFb
	bh1XdLErb2yE+fCQ2Ln7UhNVNUzGb6U6P5dQdyMPFAEGz9oCFO9B4V3w7EyY9Z++XNW7TUR0mZQWn
	4yqqwL1qWD/WBCeOEshwcwS1WD8g8oLbSVaLOMvmTV6Ip2StEZLOHYPwA6NCJ0wOuKDilsW8CYyVG
	DM0QyRguIiixztOoth+xoaK5kl027LkjuLXTxh0wMJysWQ9XLuAqCQ3oz3aP8ZTsfSyyUTLS+UItA
	mJFB7DiyR1e67zRiUgmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwgMV-008E1a-Se; Mon, 13 Dec 2021 08:07:07 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwgMR-008Dyf-G6
 for linux-mediatek@lists.infradead.org; Mon, 13 Dec 2021 08:07:06 +0000
Received: by mail-lf1-x134.google.com with SMTP id m6so17445926lfu.1
 for <linux-mediatek@lists.infradead.org>; Mon, 13 Dec 2021 00:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=t7I28HqZkghwhrZHUUn8NTs6S2RHIB9DZcJNWAJhWMY=;
 b=LsPD0SMXwIxCEt2/4UIgZsDZrNe4V0blMahA8x5TD9u6LNdX/B7HLHJgjaDZB2W+Lf
 27xi8EEABBVYYe46DBgxO5teRmuRxdA7/jCLfi5rKwGJ/OC1yDtBfCgujGmhk0ocNgbT
 tHmyx7lAijk5czUiSrfrAH0okKQjGKiI13yn4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=t7I28HqZkghwhrZHUUn8NTs6S2RHIB9DZcJNWAJhWMY=;
 b=ksK8ccAbU9X5JqMN+7EOvDeWK32cihkDf0AHx5/zkgqCuYVMd7OKqONubbXGwKJinS
 /i6F7kJD9Z+T1uSRFou5bQXjbdcUR/N+jLUsFpiwV8CPgHfmifXnZpPJfvkpiLCxmy6E
 SPWjOyR/VQgHJMD6Bb5Dnh0Nb39WUzFxORRbP2Dqxqv+oNcwM4SS3VZFs+iWzM96C6rN
 UTM2U5E1wndo7HH0D4GY4mjLNf2x7DHXnpQLSX8hiSZKyGf7n6a/bzzmadKfNpTCmMUE
 /qcsQCjkA1FSr4fgNhTfoR3OHKutciIptFWTy1CxMxuWNc85fHdcZHln4cqUFF8YeIyH
 kv+Q==
X-Gm-Message-State: AOAM532JWb4HT5d6s2uVtwSJ4UG3PxMTxI7lvGPnH4/xcGoxQT6qYekN
 ERNNh5zxH4emH2aAHzIrfUDfkjNLJk8uoWe81MOAPw==
X-Google-Smtp-Source: ABdhPJxLqEqJrlLZ0L7uWkbBqzn0qyqaZrw47K03z1EWMg8G5E4XhaZHaJHlOy1JBY2EVegaQZJTj487DMrNj11SLgM=
X-Received: by 2002:a05:6512:32c9:: with SMTP id
 f9mr27458632lfg.308.1639382820385; 
 Mon, 13 Dec 2021 00:07:00 -0800 (PST)
MIME-Version: 1.0
References: <20211208185211.40682-1-jose.exposito89@gmail.com>
In-Reply-To: <20211208185211.40682-1-jose.exposito89@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 13 Dec 2021 16:06:49 +0800
Message-ID: <CAGXv+5FpmRyPXUB523+v9=tZ+3_2YzvS7qMEn5Dc5N8rfs5A-A@mail.gmail.com>
Subject: Re: [PATCH] clk: mediatek: Fix memory leaks on probe
To: jose.exposito89@gmail.com
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, 
 ikjn@chromium.org, chun-jie.chen@mediatek.com, weiyi.lu@mediatek.com, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_000703_590042_F82D2BD5 
X-CRM114-Status: UNSURE (   6.12  )
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

T24gVGh1LCBEZWMgOSwgMjAyMSBhdCAyOjUyIEFNIEpvc8OpIEV4cMOzc2l0byA8am9zZS5leHBv
c2l0bzg5QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBIYW5kbGUgdGhlIGVycm9yIGJyYW5jaGVzIHRv
IGZyZWUgbWVtb3J5IHdoZXJlIHJlcXVpcmVkLgo+Cj4gQWRkcmVzc2VzLUNvdmVyaXR5LUlEOiAx
NDkxODI1ICgiUmVzb3VyY2UgbGVhayIpCj4gU2lnbmVkLW9mZi1ieTogSm9zw6kgRXhww7NzaXRv
IDxqb3NlLmV4cG9zaXRvODlAZ21haWwuY29tPgoKUmV2aWV3ZWQtYnk6IENoZW4tWXUgVHNhaSA8
d2Vuc3RAY2hyb21pdW0ub3JnPgoKVGhvdWdoIHRoZSBiaWdnZXIgcHJvYmxlbSBzdGlsbCBwZXJz
dHN0czogY2xrcyByZWdpc3RlcnMgYXJlbid0IHVucmVnaXN0ZXJlZC4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcg
bGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
