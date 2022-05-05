Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92554C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 02:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eBbf5Uy+tInA17q/sYL6X5xDcKkpgRtnrSRTQYvCAL0=; b=dcXpOq8tdidRfb
	TaYoQ7B1z6R9g3mPLcV4JxbuDUNHuy6lqGH9FhUpgWCIyqEglJdNqpBv6NKkK8IAm8Z9UB+kCt7WM
	nC/l5HseZZ580iJ8sUoVlrWIkZntm7Z56nR2gwvpwlvZHiDw0D+qsn7VdudN0wW6stYLsmR7RmSbb
	UNJ+S4BAhfwl+IBQp1od0knL6a0wZmqctcqfpbfQSqxa70VsfkjnV80GeBZzXF6lNUAhk362AFVRf
	YytKeRcnOFDYifaMWjuf8wtON+MerU92BDwkWF48Q+lUNBCzjWwxFUp6kWbeIp/OL0BzoQzsfd3tj
	jgXO3Hb8k3NPf6IfhyMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmRaB-00Dgm8-0T; Thu, 05 May 2022 02:51:11 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmRa9-00Dgl4-0x
 for linux-mediatek@lists.infradead.org; Thu, 05 May 2022 02:51:10 +0000
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-2ef5380669cso34991077b3.9
 for <linux-mediatek@lists.infradead.org>; Wed, 04 May 2022 19:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hQ87eN9SQZi8NIJ0dQLJS+dLce/vvTzOM8adEXAvNpY=;
 b=Le7GeHdTtmB5SEv2vlD7zJRJo2n5QshLycQemr00mvMeqoY81qcNLBHXHiJhUZzKbi
 G42atpj+pi97+SAOT5ltJpCB55xi3goWnfEZsyMZeKKjGx72SadV4XMeYTOOB/j/Ch5I
 cKg/UJvPDk/A5xrlnxZSMCG5I1DtTp79k9R18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hQ87eN9SQZi8NIJ0dQLJS+dLce/vvTzOM8adEXAvNpY=;
 b=08vAjNBWIgc877vKtsQZZkJtKt6XOz5XUGqtnw+jNUsCE19u8KJh07A4fkgXaYFGzW
 EPu8WqkAxjqpZk1Nzwep+w7NWvJ/khMfoAfqCOokQd8vlJ88mfzwL8lDbXA9K3W9zJDc
 rDyQgw4ChAs/eaRLfL6sZ9fNKA6wa4+z7blRyIx69TBKij/OuAI8PE7mV8KhYHvzRX6Y
 bhuw6eLa29EM7dqmTwcxvywvRutV082spqbCnnpoeIGWjIjWiZKpQ2Hwq9vNpTgm7IPd
 tyDnjp+fCIc3J6MbLYK8jNKClamcOYeT5ZK68jJg+/0wYQQICEEThUYD1mpR9WL5iMSN
 qRLg==
X-Gm-Message-State: AOAM533dsSK9sYJHqzUE6KCbDyWtFa9BxhExPvATkChvdyiqJbNh96Kc
 mg/Hk5++pfRu1sS1zIzdImh5HQ9nhFyqBda4dbY96A==
X-Google-Smtp-Source: ABdhPJyAKMpcVpgskbnOy66gjUlw5KH/+b9uJG5rcYjxVXxuwcOYSmCeTcLTWA1Tu+QO4F7WHXLWo3pCF2QtRAd5yPc=
X-Received: by 2002:a81:be05:0:b0:2e5:6c26:59fb with SMTP id
 i5-20020a81be05000000b002e56c2659fbmr22963642ywn.94.1651719067116; Wed, 04
 May 2022 19:51:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220504214516.2957504-1-nfraprado@collabora.com>
In-Reply-To: <20220504214516.2957504-1-nfraprado@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 5 May 2022 10:50:55 +0800
Message-ID: <CAGXv+5EOactKnHkqq4E8Azkn4MGG8VHju4F8ZWWcaYeyy2wUww@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: mt8192: Follow binding order for SCP
 registers
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, Allen-KH Cheng <allen-kh.cheng@mediatek.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_195109_103610_26D4A882 
X-CRM114-Status: UNSURE (   9.92  )
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

T24gVGh1LCBNYXkgNSwgMjAyMiBhdCA1OjUwIEFNIE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvCjxu
ZnJhcHJhZG9AY29sbGFib3JhLmNvbT4gd3JvdGU6Cj4KPiBUaGUgZHQtYmluZGluZyBmb3IgU0NQ
IGRvY3VtZW50cyB0aGUgcmVnLW5hbWVzIG9yZGVyIGFzIHNyYW0sIGNmZywKPiBsMXRjbS4gVXBk
YXRlIHRoZSBTQ1Agbm9kZSBvbiB0aGUgbXQ4MTkyIGRldmljZXRyZWUgdG8gZm9sbG93IHRoYXQK
PiBvcmRlciwgd2hpY2ggZ2V0cyByaWQgb2YgYSBkdGJzX2NoZWNrIHdhcm5pbmcuIFRoaXMgZG9l
c24ndCBjaGFuZ2UgYW55Cj4gYmVoYXZpb3Igc2luY2UgdGhlIFNDUCBkcml2ZXIgYWNjZXNzZXMg
dGhlIG1lbW9yeSByZWdpb25zIHRocm91Z2ggdGhlCj4gbmFtZXMgYW55d2F5Lgo+Cj4gRml4ZXM6
IGM2MzU1NmVjNmJmZSAoImFybTY0OiBkdHM6IG10ODE5MjogQWRkIFNDUCBub2RlIikKPiBTaWdu
ZWQtb2ZmLWJ5OiBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyA8bmZyYXByYWRvQGNvbGxhYm9yYS5j
b20+CgpSZXZpZXdlZC1ieTogQ2hlbi1ZdSBUc2FpIDx3ZW5zdEBjaHJvbWl1bS5vcmc+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRl
ayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
