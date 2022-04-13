Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33133C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Apr 2022 15:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RvS058fgZdrsBtZl5cisG8UWa3Je0pvo5PNNdWT67Ts=; b=LzMa7HmH30SG2a
	aORv84OsWyQn0mE7ugTdtKeIs6NQFzrs6XBfQ3oEB2kTTh4YZ8V5wKOg8gHmlD1VX5uoA52OYqwn8
	QrFstb2Zcj4pJzUze9y08EHhuJ9GN/ht62qu0odZUHxnb3ZyGYKy7XniYIZ6McV6wjNk66BBNdbSo
	BOEkuPYDxCP2MP2dxOAR0TQQBGH1ZEHKIB3J1IWvy+SEiQIRhRHcgcfOIz0oYPoHOMBL9Nu8LcgRr
	T90Xl/6agJ60VuReZrad612lzOxBa7EQlhLpN1BrF4/fGffF0lpK1+sp0VjB7cNDGLAH8AERIZn+0
	vEK/j064FkbaCMKNAGGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nef5g-001dF5-Nx; Wed, 13 Apr 2022 15:39:32 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nef5V-001dAq-Bu
 for linux-mediatek@lists.infradead.org; Wed, 13 Apr 2022 15:39:22 +0000
Received: by mail-ed1-x52f.google.com with SMTP id t25so2859482edt.9
 for <linux-mediatek@lists.infradead.org>; Wed, 13 Apr 2022 08:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=X9hKp3Y2zMwZgy3YpyTWq8d0i7RnkuDLtpEpok8446A=;
 b=owXOYmJ1qaFLaC+Sa4OOMEFbc7CITeVzef7eB4mZeIN4NwmuozoX/Xk0zG4jCEFGx3
 85BxQFrIeadN+7Pobfn8LuqZ9XA1q0oxGI8VeZPlsmnHuuAqgMpokFQYIHCq1Zu5N9uv
 BBdtYQqdtnKkA5iBxI7JZSPvKzjn6vZuQzD6aiW4esXRSSgph91BlTKgZH3xxTCqGE9x
 czdbDvnGIdn+xGdL8zn7NhTBxFl+q8kY1q92CstLQ2aDEpzEHTSN1BSO4NJe12uQm7t6
 dLblsPPAoIoQ9fMIu8UWVKwpWV5rabUwGKgqq5Jx2CpsKGxEHwELM7+yIekP2afeBUCK
 mnVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=X9hKp3Y2zMwZgy3YpyTWq8d0i7RnkuDLtpEpok8446A=;
 b=GVK2pvR6Wg971pj1NnHksVn0yjv9pHxwHag+X6cB1d5BTDZb+G6DOL7mXzDxvH75E2
 0zYWnUBt1Vd56RaGHohHo5Ebcbi3wXGVQepvjblSHWlRHqyLKz1z8rUKGwLhLO3koAdy
 RXu91Nk7yB4pSC5nCdW6Wcbta8Yhafk3rY52kFIIt40H/Zf2RTqIkPtzdD1n19B1UGsw
 oglyt7ImPgTzyySh9alRZgh4LAhlIlBBDQwul5T5EbvitMVf5EGqhfJGQksZk75fv86j
 6BohVHfURxsy0zCUe39NUjSWKnQPHm3UjC72/kOWZvmmIdiMzQv5BmgJcXHhNqGEHgxq
 5VKg==
X-Gm-Message-State: AOAM532L8YcbMnlz16rM43oep0fjEwW+sVC+QcyOrHJ+Cn9JIDqOMfpr
 HmkvCYtttgTDoBoDE31f4H7jUQ==
X-Google-Smtp-Source: ABdhPJzIGkKaUTPpciLe0PPwKf0l7G1vuQhtJBWbomF92oUQp0hsUbfNZiKNgS5HEYVmfixJI8mMcQ==
X-Received: by 2002:a05:6402:42d4:b0:416:5cac:a9a0 with SMTP id
 i20-20020a05640242d400b004165caca9a0mr45238172edc.86.1649864357797; 
 Wed, 13 Apr 2022 08:39:17 -0700 (PDT)
Received: from [192.168.0.205] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 t19-20020a056402525300b0041952a1a764sm1380150edd.33.2022.04.13.08.39.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Apr 2022 08:39:17 -0700 (PDT)
Message-ID: <e6424c41-fadd-d326-49af-28db51606c2d@linaro.org>
Date: Wed, 13 Apr 2022 17:39:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 0/14] Refactor Ralink Pinctrl and Add Documentation
Content-Language: en-US
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Luiz Angelo Daros de Luca <luizluca@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, erkin.bozoglu@xeront.com,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-kernel@lists.infradead.org,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>
References: <20220413060729.27639-1-arinc.unal@arinc9.com>
 <CAMhs-H_oRzpeqJY8Oe+7Su5v-4B1WPwzOfhrvBC08FVi-O6fVA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAMhs-H_oRzpeqJY8Oe+7Su5v-4B1WPwzOfhrvBC08FVi-O6fVA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_083921_445793_D81452E5 
X-CRM114-Status: GOOD (  15.00  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 13/04/2022 08:36, Sergio Paracuellos wrote:
> I think you cannot change compatible strings because you have to be
> compatible with previous stuff. That is the reason why when I
> refactored all of this stuff from 'arch/mips/ralink' into
> 'drivers/pinctrl' I maintained the same for all of them and only
> created one binding for all. I know that these SoCs are mostly used in
> openWRT and the way of doing things there is that when a new version
> is released a new dtb is also compiled so I understand the motivation
> of the change itself. In any case, Rob has the last word here, not me
> :).

Breaking other users is usually not accepted, so some good reason would
be needed here...


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
