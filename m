Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE0B0C88E75
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2026 10:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WT2qHqDaqkWnFf8saA6OrL4B3kEyzcKEnsDM7DTCKVc=; b=s+u7RsuyjmQLi8Y3oRhJHVXvJX
	ZzV7NcxqQLbstDIOXMnxYHRYw+DuJf2Dm5Pk8AV+A2a6H6kJjBsKMQWzSq1MNNMj6OTrJnfzx97Qm
	YLkeU1DFafb8pvd5CB+6wURh/kfY2rQ8kYDmkC2z6Ml0kp6cXRbH81Xeulrnu5pHZ3TI8DllsL47W
	/wvLeM6Byj+74XkHPFw0AWEvAGzWzzviP84u8q6Cg5QzboXT+20WK/L3nu4kk9ErF1hZPw35WvfFT
	augI5UZei/tZWjphldvhg+WYVT6XkC9DYsF/Z37oQXg/74/zH1Moz06y7JiH//yNK7Hxh8UlPXW/H
	vAPP9MkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6QaO-00000005wv6-2m6i;
	Tue, 15 Sep 2026 10:40:24 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6QaM-00000005wtp-1M7p
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Sep 2026 10:40:23 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-86ec25cf7ecso752778b3a.1
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Sep 2026 03:40:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789468821; cv=none;
        d=google.com; s=arc-20260327;
        b=eEYBJ/+eenIRGgvoYArIFi/FcIaRkv9+Gb/DJ9nns4Qhkn4HH9lOMY5RLBoyNP5Awu
         z3gVMq6FXQ/xfqJejvIJYmGGWgFbEqf/7zU9UUTCzKkkSU+sWnOfoiWSGC7C1fB2/6KO
         JQ6x2x5mRyufwgcMNtxhNNyfII4mEdwdxJiwmT8PI7zntTCHhZQI0HGrNg2qA/X6F9j3
         oeaVEpG+ha+cbXgobIitYT4vEoOYh2xq7rtgytZtx9Uw6R5YFQkM1v/cBpGiIoQE9i32
         mpPOT2lavm1Z3LFGmeGfFbs7R1l4B24gYdSq6FIN3F1QP/UcRXW60ZxWjHCnE4lt0cP9
         wn1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WT2qHqDaqkWnFf8saA6OrL4B3kEyzcKEnsDM7DTCKVc=;
        fh=wdlWporDTth/USzLE3pO9mZFpONDkcQNt82nxKPSIAQ=;
        b=YbI4x5mYxYXfFc+VhqPv5nv1J4ont+7QyO4dIvPLd2tNxPvYOwYIG8H0VXN4uhUjjO
         2zYmFTgwQrW0NORuuIbtH1/1CyzwudL/Q8gMR9lUwTGCQTNKCzmgzVyooVOnL7+I1R9v
         0xNCi03e3pwDKaNxGWtC49mvN9F95Yfsb3t3UYYuXiH4Ppju2yhihxBrbPbPHn9pB8T5
         5798VPjjdxznI+705Gy/emdFUjr8E63QN+CYBcHMQ6+dEHVp8kD2p5N8cYLzntOEAoSc
         nQjueqKatMkE966dD/s3LyIl3ufccXsXiLcdUC2WgDqqh5KX392jTw4RQ9h1m3Tf2FUd
         ERqw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789468821; x=1790073621; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WT2qHqDaqkWnFf8saA6OrL4B3kEyzcKEnsDM7DTCKVc=;
        b=HWtTa66E9tDx91m8uC8qat2jFkQrEh6WMA8WzgAKx0gcftmF+fvaSSrRP+k2zzFgjv
         6mys6IPeoy6X8nni+hGVFe1/DI6Q8a2ALiPu3P53zqBSWWOnv6ZSUvQ3xsmf/qd34qCV
         vwKXhDxrwQ249cH0wLxHrxlVzBUQw9oU/f1LJjivERRWU5tFcINc2axVKLeOQqkVOF6D
         YM0mhA7UwBEKcDC9FBA1wv77mQXJFDhWOvgHRFfyqCZ/XWq0Y6Z1dzvDcR8ZSUoHOqPR
         qudJxXQYaXDNAMTv6SlXpCBFgiiazGjd4Bw0epmAtsbxQd2/CMmLMIfGnfnIQEKPPUcT
         PICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789468821; x=1790073621;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WT2qHqDaqkWnFf8saA6OrL4B3kEyzcKEnsDM7DTCKVc=;
        b=KHybHERjARP2SqUP68Eaxl75/Dvec6S+Ym/RcI0ItQ7JhKeVJeMRKUtCQbUvV33/Od
         t/G5SewPKyJ+gS6DfA5uYQLqkYaKSc2mooJ58JRTq6cNszwEcTZZiko1pINp9TVsIe8f
         Qg41a6H1Reh7FYAKMgFIFIXhYnf9ZGcXQX9KXvilnxpxdWs8hcmNWTemDqEsHxncxEXH
         qEPKI3l6lsJ+UoOtxxr5AUaQC2fwntqlZCN2jWxttyOXrWPiD5nqiqW050jF9yfH6G5c
         PKaaL3iBvP42l99YSdLhBcHifRw53RVT9yqCtA6l6wYRjIQ3RXWpawQ3g519vjUK4+wW
         4oUg==
X-Forwarded-Encrypted: i=1; AKwUvBzRGujOSfLdXgc2VUHwtjV/GJ3ydI6uyVVDVRqMD5E/GpzUhZSa954XAG7aDtK2J07mUAHRm2PRNhSQPQGL4A==@lists.infradead.org
X-Gm-Message-State: AFuF++nzvNn0rlCjcttTY0ri0zRxwzYhuIEPpD8ESK2McLTK8i13y3B2
	6eCNJJqvCIDbtTbyY7QD2WY737AV7iuGaXknbMYpfOyLjzKDBwkkxA7GPiei4jKMs0fnczR42KB
	YB+oYnsEo5fieAXczrtAyguUs2CWJIccx7dlf
X-Gm-Gg: AYBFou3jE+zccLTtTxAmE2CjB/zUQYIeMsfr48BK+nyMbOGLrsXOE6ZP4zBoDVfrM9x
	crenDPHYe2Xzv9rb73VSLsWybzOFZkHLEkb42ARxUWMUoj3ynIDoSxSTZ7xIzM6pTyYsyzuFSu8
	2C6VE3S7lQaUtsdsz9v0vMUO9GbMdncERqgwIJuwvCT3DNTj12rLYR1dqQNExeWDoh7lkDyj8RV
	3JH0lCiiL9l4Rc7pv0xyn95h23w1SSzRjdfCAx/iBgqE0MgzGoU378MJhoCZT+nMC98Wqp2yZ4G
	vSpdC+h+cESnNt+SgXSLf8qPG7+LcAv2gXTaiO6A1BQWPFVOwFqza611+UZtFTa5GKQqf98rAaa
	WzTZztk4dyY08DH5Q7PuGmZ0Qp43Bm/uzwE2NAFj2OjyFiAEeUj0jKCIbOlqbn6sAWeo=
X-Received: by 2002:aa7:888a:0:b0:857:73c3:4469 with SMTP id
 d2e1a72fcca58-8708c367516mr4031436b3a.24.1789468821304; Tue, 15 Sep 2026
 03:40:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260914072842.24420-1-phucduc.bui@gmail.com> <20260914072842.24420-3-phucduc.bui@gmail.com>
 <07add31d-5622-40eb-9bcf-f7cb2396fee3@collabora.com> <aqf7B_E7_Gv5iK2A@sirena.co.uk>
 <8f1ea5c4-d85a-43eb-8b10-3f80f8343b27@collabora.com> <aqf-pqvBNQ21EQZx@sirena.co.uk>
 <CAABR9nEB16gANTVf-B+sud0+11XhjCjqiCRY3hP_rnaFstB0tw@mail.gmail.com> <936fda6d-8e9e-41f1-b988-b2a4dcb4004d@collabora.com>
In-Reply-To: <936fda6d-8e9e-41f1-b988-b2a4dcb4004d@collabora.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 15 Sep 2026 17:40:08 +0700
X-Gm-Features: AcwNN1XiIsKmvO7R4Fhz5E7d9MTMT7jOpXuiLatg0K19TloBrHHj0Z2OJFenKUg
Message-ID: <CAABR9nGWG8hpkvQP_0d+JytRpW7oRYPDW8RvUOTxL9kuXyEN+Q@mail.gmail.com>
Subject: Re: [PATCH v2 02/13] ASoC: mediatek: mt8189: Propagate APLL enable errors
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Cyril Chao <Cyril.Chao@mediatek.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Dan Carpenter <error27@gmail.com>, 
	cassiogabrielcontato@gmail.com, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_034022_371065_BC536046 
X-CRM114-Status: GOOD (  22.97  )
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

> You have reasons, of course, but have a wider view and check the full picture:
> apll{1,2}_enable() is called only by mtk_apll_event(), which is a DAPM supply.
>
> That call can only happen if the device is not in suspended state, so can happen
> only after a call to
>
>         regcache_cache_only(afe->regmap, false);
>         regcache_sync(afe->regmap);
>
> is done in mt8189_afe_runtime_resume().
>

I don't think runtime resume always succeeds.
However, with the code as it is now, it can indeed return success as
you described.

> > If that assumption were ever violated by a bug elsewhere (
>
>
> > a PM race,
>
> That would have worst consequences, and your system won't be saved by this error
> check because it would crash way before reaching that...
>
> > wrong resume ordering,
>
> If limited to ASoC, that would break most (if not all) sound drivers, as that'd
> happen at the API level, and would get fixed immediately since that'd affect way
> too many platforms and architectures.
>
> > a register missing from readable_reg, etc.),
>
> ..and that would be a driver bug, which is not the case here: the error check
> though would be useful during development where you definitely want to paranoidly
> check for literally everything, even "useless" things... but this driver definitely
> is not in development stage, is it? :-)
>

Oh, being upstream means it's already past the development stage now? :-)

> > this is where it would
> > get caught and reported,
>
> ...but then you still wouldn't be able to do anything about it during runtime, as
> there would be no way to handle this and fix it: the driver would still act in a
> broken manner.
>

I agree it may not be recoverable at runtime, but returning the error prevents
the driver from continuing as if it succeeded and makes the failure
visible to the caller.

Best regards,
Phuc

