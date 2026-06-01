Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C08CD5BD1
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Jun 2026 19:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y4hUHaRW2pF8Vn/XBhJ1vzt2YBnt21syoEVUODaCftU=; b=HLsD8vHwa+34mAf77KjSIwI7Wi
	RqtE4OvOT7aAlNczndK1OCVVgg4+VfXn6vsWQ++mtZFsWKZFSrweaMeghc2n41f3FYzWue3hxwAwp
	X9Q9YD2zUE6wr4LlPQj9ZKz7iHKWbcq2dV/xuCi1gAOirQSii3HSmbh2NNcO9Y2i6nuOvWRSjkAOT
	tTBcJG8DzML/wKbadyuaDPKZEhEYXpty2F/eXE1RD9GvrEqj0IPrnOLN5xDcpp2Y32VbNgIU3AQgp
	AIStAR80kjTVWH3HaV4IHfwa/6UAkXDQBn3n/ddwVlWdWI3PIVCmsPPC7XPKy0E1o4U6jOOf7KP5L
	S2QT4CzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU8Hb-0000000BihC-42t3;
	Mon, 01 Jun 2026 19:26:43 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU8HZ-0000000BigE-236v
	for linux-mediatek@lists.infradead.org;
	Mon, 01 Jun 2026 19:26:43 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-68d2342c5e6so2501300a12.3
        for <linux-mediatek@lists.infradead.org>; Mon, 01 Jun 2026 12:26:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780341999; cv=none;
        d=google.com; s=arc-20240605;
        b=h9X/fNCaCCo0PvcePiRFFpRkNAjzEwe9dSOjHaWeDhPy1KI/BOW0ki3CStAx8/DbWb
         CFixg9OF9RajEmuzuDWlVEYKyhC7G7RgLppRy9X/doR8iF3avcUiHbBvbfVylPG0Nx2x
         PMAf6Wvabe4xtI/wEE4ExqhjJWQVePeoCkBrrWvB+a/7uP7F7bHvwnaGmcgJF5kW/NOo
         Ddf3OOjMnylk9RCBo+evB9LEqu3kKacnTL4UvEtPHiH7ZUw/Oh8JUV+OLgOSNJ164C3e
         sKlgM3B/e9U4ueew2o0Lteb4KVUcwykxqUuK+MTOMMEW8Fjy/z3IQqBvyoxDXUkMSsD0
         rV3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=y4hUHaRW2pF8Vn/XBhJ1vzt2YBnt21syoEVUODaCftU=;
        fh=KFxMp9RFJHkNr1vtM4vIhdn57nvmCAx01H4FPJExnKs=;
        b=iiMSzuMWQRkx0gmUVD4N58H3h7zAi4pSTdHe/QgZbJnHFimrUKQ6ieF3QnEl20ygRg
         IqzptTQ4ER0YSklHkQQIrpmQvL4JV3EW0EAADUfi173wF+IjONJc1xS6nzQNWwAsDTsf
         EyjsIYMxVUmwhJIMbwq9XFOZXsGJQzFf5g6cSfejABrUvuK40R5SaR2f/d+cFgFlk2sw
         bRNaoff1QRI+KyIeYJ/KKd5oRyu507wTsyyP/fYpVi0uYCWNqNe0S/pP8MrXDYvQ1j3j
         /rDlP4XpyokTh2b3UgvM2ZCmnkPhHmQxWo/b+kp1poKeqi6wicQNv2xJV0Q6ot35Y5xW
         QXAw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780341999; x=1780946799; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=y4hUHaRW2pF8Vn/XBhJ1vzt2YBnt21syoEVUODaCftU=;
        b=bjiThTTS5UUwR9/My/GmTT2scpd5CSfIa2EpnllYu3jE/cmYGzLIBlmKHcOePgSKjJ
         mAZryuNcq89zkncOYvkXT1iZnRK1ajCMSiraRIJ6j9lQLyDeoYToWDyeWE+1DCQSDLlT
         OVwoAuvkW3vtJZGSc6GWXjo8ALF4G4RPalhaS3SFSvv/XjK/iF5tw3nrXqUPF46+1u9Y
         33Sc72fmv632LLB73CeiWBfDFvsrXo7Rg4iHJPYj1UnVOWI8/lBr0FgseyG8IHRm8UQg
         ISkS/TJuEOzhmmawRuRpgoPgDGtFmWR74xr9GO5ONkqyaNn0mxHa+0nPtPE21r/1BMx8
         F54w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780341999; x=1780946799;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y4hUHaRW2pF8Vn/XBhJ1vzt2YBnt21syoEVUODaCftU=;
        b=B1L0lsd+Lxx4py1zB5MhKhVXE63XQESOIXSl+KfYRv0AxMfxSbB2Edqy0wRnP3Z39a
         K4N/lNhXwdWfyfUlkM8hqxmnEcqeD2xQhVqPi02xp1kZDdglM24rTpMjNlPfpwEqd5Nn
         +Ybt9OaoUa2wADSSIrmkArnm/PGyrDoC/CBP28by5f7yi6wD6xtONyQvkqcN4QW6tZuP
         Ap9D3gJIKpOysCma9HZ+AMbwmCY+ZTOoLc0j2dtXB9CcYyQ5BPr91f/94PgQyBg2/OBw
         nFdv4t/j07fJ9+eEtj2oJUWKo5TInRDpouzUqcHIOhuxM2RSO0/6jOK3Ks1CVgPFptVd
         WoZg==
X-Gm-Message-State: AOJu0YwsJXfpHTLW3xrgw5wPElP8VQVWasA5r80gGzFbOkvo+fZ9Wr0i
	8Hxksb7DQLgP45W3ApKvkmF2nAPpBaZpGp8WZk0Eh5lBq3kXAxcHFKGG3GpFC3wtdrMquqSSQVt
	e5VhDQ2QzAP+fZDPnRqFXX7qzy65C0J0=
X-Gm-Gg: Acq92OE4qYk/sXXvnwwUIB5G7W3ckAXpmvdNnXOautrogHzT4Cv2rfI8BMei3ScWrwX
	3MrZVlsbkHrQ4ZK2e1k0J2lzXcq0uWeyVKzYUVi+aZu4v699ZsxxVfm0c4aVd8qIgi/BWaY4Rjf
	CvxdPbe9c8uj/qWp8H2ycXoJ5TFyNv/ffEBPuS5x1C4yTdmiNv/J62W7RbXh0QwtP4OB5GrEcrA
	AeVNjleDRPhPSFNzb135Vb4f/mZnLALjB7C/dPSqftmMqYbhw12s+f0lk11XCyJPPQ97XfOn9oN
	LlkraqeWzunptoq1hJqbnr75+2ymeMaoj+mfYfHXerx7jMY=
X-Received: by 2002:a17:907:3c8a:b0:bed:9a4f:a42e with SMTP id
 a640c23a62f3a-bed9a4fb3fcmr364036566b.17.1780341998944; Mon, 01 Jun 2026
 12:26:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260601152707.29039-1-l.scorcia@gmail.com> <CAD++jL=oF_43jwV830p42yOke_tZb-MKomp9fVoQ5EtnQHGzNA@mail.gmail.com>
In-Reply-To: <CAD++jL=oF_43jwV830p42yOke_tZb-MKomp9fVoQ5EtnQHGzNA@mail.gmail.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Mon, 1 Jun 2026 21:26:26 +0200
X-Gm-Features: AVHnY4JJrihr8pVvcJ1S75wZnre1x-GIaJ8orYAbpycsIER2tWpRasMInT2GVKk
Message-ID: <CAORyz2+YG4WsS1ay2UA_S-w1UGMe=yEbiz-FUnRPYR03xaikng@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: mediatek: mt6795: document the
 slew-rate property
To: Linus Walleij <linusw@kernel.org>
Cc: linux-mediatek@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_122641_546828_AB9B5AA8 
X-CRM114-Status: GOOD (  12.05  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi!

> Do you know that value for the SoC to you can express it like
> this and translate it in the driver?

Unfortunately the data sheet I have doesn't say anything more - just
"Normal slew" or "Slower slew", and I don't have a scope to measure
it. All I know is that it flips a single bit in a configuration
register.

I found this missing property while working on the Xiaomi Mi Smart
Clock x04g (mt8167). I ported the current pinctrl driver for
mt8516/mt8167 to the paris platform driver (adding support for slew
rate and r1r0 pullups in the process) but the stock device tree sets a
slower slew rate for the speaker amp. Without this patch it would
trigger a dts error.

Thanks!
-- 
Luca

