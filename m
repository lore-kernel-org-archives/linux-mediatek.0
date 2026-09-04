Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B69AC624DE
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2026 15:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7gNCncRwcYB9lWmv5bcgCTAj/WG9KBrvFMQ3voJc5e4=; b=tt1sFLOoIuWkzhyFO/N5XRNvxd
	aSt2BxSKRzmgQssSCn67sJxMxc8qtINS3ygJUUB9JzVen6RXnEwV61mKGjgpRRStdg1wf49tFwj6D
	Jp/SPPr40tBf9Zy90u27y5R0k8hJe1YZySTSHLNUxBTDN2rV/39f99/io7fvQVgNy4li1gG6u7J5/
	9bxRSVIDqFpw3M62j6C7Si+6juhIP81MB5Oib3uzUVyJetAeWX75qyOS44Ddk0j/Ax7GJM8VUILsc
	A3ZGHw88Jct38KMgGlaFX945iShnrqXca7hPZjGybeWffQJq7T9Bry3B8XEYtXnq0qEma4il3Um3g
	v9HJ3cBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2VUj-00000002TK1-40Nm;
	Fri, 04 Sep 2026 15:06:21 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2VUh-00000002TIU-2pgB
	for linux-mediatek@lists.infradead.org;
	Fri, 04 Sep 2026 15:06:20 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5b4afc8465eso1557298e87.2
        for <linux-mediatek@lists.infradead.org>; Fri, 04 Sep 2026 08:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788534377; x=1789139177; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7gNCncRwcYB9lWmv5bcgCTAj/WG9KBrvFMQ3voJc5e4=;
        b=AAubGdWJC4bFWw2S3bXMkFeNT9f0VYcvAhZUmfxj2pborv1QQO9grJjgltdh1o7wyo
         IZrK/+4H6tXbqaoH/m5qEx4swfdp2QL/HmRuFiZq7pVEkFKIDB7H0IChtgDgXihpWfG+
         VI5ZsheIPjkzJjhkeH+PPcL+ON8K1kuH3PhJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788534377; x=1789139177;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7gNCncRwcYB9lWmv5bcgCTAj/WG9KBrvFMQ3voJc5e4=;
        b=lyBY9u5S1eY0KTs2T8XCoI+LAtFMC1W0H2HQ3oZzUjb2dt67G5ANJG2RYE9pNGZ7jw
         pbddeMSGOaTB73swH2r8EGqufzTDT5RUZ0V+Yw3Z4JEQxtfhPB8boyrBbvjEHKKrHNvY
         bQ2uTQdPAZkIfEj+7O1/3a/Tdwda5qcDXf08Zfjyp8cAx7rGgDgrtlTdAK55MBZzVqBW
         uyF+/SixL+KaFxFSDCRgUq64GZGJq2NE69ZzJFHhjzf8YCcdLOsU3tVQpB7OJhVtbGDU
         JaeI0BpRvZnOv8DUaFo4brx9nthIVwDNi19mWKxTEbMD1yAs5X0uHB2qGCaGcdmL9cl0
         bpXw==
X-Forwarded-Encrypted: i=1; AKwUvBxtS1ZcwDPW+cgb2nDjxfvvDrE6qyQE/Nlz3docga1okKVR3GcPAnzYQ36IhTTUae2sAiXy4zdtonILu8nZQg==@lists.infradead.org
X-Gm-Message-State: AFuF++kqKF1+tPID9I4Nwiyj2Y+4IY8V1S5jeqhAUqdMWzubI6Qk4ln8
	bh/DxBERIWIiLCNkxtFkZok7wmBQcCK42M0JwmI0B2Tsyx+VVOcDDlCGHl5Xm6u55Sdnr4Bxo3y
	Xecs=
X-Gm-Gg: AYBFou2NHCb+Q/9JruklKbMjsbq0vJiaj+8wZmjRx6FgVgLzaRE6VlPrBYe/Oyt29cv
	RlMAYbN6pB9HUQObNMckRj5godOYvkW3mtq/uTX9STo4XzwInszenaWQheHHmgZ1rPmmzs26QIW
	8rok+OjLVC4lnw0l4b80xzjbGGWwlcinoPtjUB4ctyWdB7QFRDIb8NdlGjaS17EXmISNOGT7sW1
	2PYWg3vVAy69DNRZsOwkk1dUlaEArKiv6j2lVOwZmW508AOcyFUuxoFBS7qd5EFIvHryKJTVK0O
	NcjaJBmbJtVUb3hE9uZ4eaM+VPo7a1rv/tc1TCfXLusRzPO3xoGhevLUHVW/noLvzaTjCawlk1y
	bJii+eSP9Ean4u2IYJLIyp8SWF32zoyGuA1OJiPaNKhd/Znju5ycbnOCPUUV7/L7DHfnpG9Aiu3
	Ugg4sdyq/aKmMTstdVRiH/FQ1XLT0P595Xo+ACmXgX3rPH7oZATUkmRqJpM/olKG+wJEi5rAS0G
	nRhox+nlQaaDV/98WBTK5GAZP8=
X-Received: by 2002:a05:6512:a356:b0:5b6:1a7c:fd97 with SMTP id 2adb3069b0e04-5b61a7cfe4fmr605144e87.61.1788534377155;
        Fri, 04 Sep 2026 08:06:17 -0700 (PDT)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com. [209.85.221.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b616700006sm559442e87.57.2026.09.04.08.06.08
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 08:06:11 -0700 (PDT)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-482e4998d28so827749f8f.2
        for <linux-mediatek@lists.infradead.org>; Fri, 04 Sep 2026 08:06:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxJen4RQUGJlKZIFndUQc1ViKqSLmSWfI7h1/jfTQSRuixPHyfTlTf8YQn2HIQ+iovws/tbzRbzC3X6J6W0kw==@lists.infradead.org
X-Received: by 2002:a05:6000:60e:b0:485:8c16:a355 with SMTP id
 ffacd0b85a97d-4858c16a6c2mr4328911f8f.45.1788534366728; Fri, 04 Sep 2026
 08:06:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260904035009.4114363-1-justin.yeh@mediatek.com>
In-Reply-To: <20260904035009.4114363-1-justin.yeh@mediatek.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 4 Sep 2026 08:05:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Us7FrQ2GYYSfm+freDNTWv8xd260kA2Z3B5jFzw5OBgw@mail.gmail.com>
X-Gm-Features: AcwNN1U5Q3Et8gbm1HfFEKvqA92RRKLIkp4skB9nrMClbBiYdjjt_11lut00YBI
Message-ID: <CAD=FV=Us7FrQ2GYYSfm+freDNTWv8xd260kA2Z3B5jFzw5OBgw@mail.gmail.com>
Subject: Re: [PATCH] HID: i2c-hid: Skip SET_POWER on shutdown for panel followers
To: Justin Yeh <justin.yeh@mediatek.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Maxime Ripard <mripard@kernel.org>, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_080619_728810_FA1C9C68 
X-CRM114-Status: GOOD (  14.45  )
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

Hi,

On Thu, Sep 3, 2026 at 8:50=E2=80=AFPM Justin Yeh <justin.yeh@mediatek.com>=
 wrote:
>
> When an i2c-hid device is a panel follower, drm_atomic_helper_shutdown()
> unprepares the panel before device_shutdown() gets around to the i2c
> client. The panel_unpreparing() callback already calls
> i2c_hid_core_suspend() with force_poweroff set, which sends
> SET_POWER(SLEEP) and then drops the device's regulators.
>
> So by the time i2c_hid_core_shutdown() runs, the controller is unpowered
> and can no longer complete a transfer. On MT8196 the SET_POWER(SLEEP)
> issued there burns the full i2c-mt65xx bus timeout before failing,
> adding two seconds to every reboot.

I don't think there is any guarantee here though, is there? In your
case the panel might have been powered off before
i2c_hid_core_shutdown(), but is there something that ensures that? I'm
not aware of it.

Would it be better to follow in the example of i2c_hid_core_remove()
and just remove ourselves as a panel follower? That would
automatically call the power-off functions if needed, right?

-Doug

