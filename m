Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E18C2C79FA0
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2026 09:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yG4Pnz01dW2S7kM9qcZcTMa47qByQxdGgpfF/vR9rUI=; b=ZUDs7Lax41MXhhf0R2v+AvRmZT
	xbdDuWwynh6WUMfTGAf1cAOaYMQE+P+a/H0cflRc9nVZbujFzZgjHwd4zIOMrMsVWJeF8TH8OPdZd
	qPblt0Km1OiZ+rbEY7Xc8gM/yVowFunk9ML6OfnIjGvVIMkEQ1IZA3z9XiiGIuMsHFdO/1nQmce0N
	d+OLHrvpXvExtXG6LxIcB4s3SRn55lGEC/O+1XoTQ/yWtxwim76yqHvjow1RnIrdvFVOi/zxXFpBb
	eBs6169CwIXonEd4CASZFQ1V5ZiwrGI8Q+R2TWQSEMGgX/vGin1gpSa5ipNDQXqcVHHE+90bTFp0o
	00F5hi7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3rzG-00000008Xul-29yZ;
	Tue, 08 Sep 2026 09:19:30 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3rzE-00000008XtT-08Mh
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Sep 2026 09:19:29 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2d944747d41so46193355ad.0
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Sep 2026 02:19:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788859167; cv=none;
        d=google.com; s=arc-20260327;
        b=kwQXaYLDLvdSClC/LDXmS8g+do7niopdzYCzwkcfFfUrODNBPQfIsogopk2HNcc0fk
         onuJhn3vQdaywLo3D56CpVCXo5cy+TZec1l60APMJcc7eL788bOCRDZZCo0qaZtQVTLR
         suA8ICWN+yklmG7YXvBqzoj5VJyN0iDrWGqLWTPqQKAJiKO9TAa7123B/oA/PyAa3mdW
         smMNvymR4KemlvRS5miGPBku0FzYfW8eIRFKh/9WgLQjX6FCuULl2DawrWs7InU3J1WE
         Fl1kXOc9gP5PKdCaWAmw5ZmkMumxmvMo8C7IHQlpOzvMXGxYAVYI8cTxEnNaEEXibWQX
         dz9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yG4Pnz01dW2S7kM9qcZcTMa47qByQxdGgpfF/vR9rUI=;
        fh=rUUBfRwi+OgJ1nmWmf52w6kFkVU0yzPzb2Rlezt15M4=;
        b=JuXYFZCHW/BAqXQbTKWRsEe4u2OrIgOubf7mEIXC6hEnrabWdywNR9ikrka+AvAINg
         vERj2UERzOuonABiuzrFZ1VWMBQg1ehywsSB7mmI3oLkxrUgRqguJFo8+MGpcgS+PTL7
         oxdl/Dvu3/YX1UT+9tEAZhxzDkKihG1Q5yK1VhEjX1JPR7zbjT9G9+HT7Ba/1f43mv/B
         Nr79oeoT5dPclW9X5T5Rowg3gifTdy+PrfWU5J6egvV2FfSsTwhlOeOZG9YIqjWmYMef
         JphZbqAahhvoiXvrU+Su5iegkqlky//6v7hTOefYH9OGF11VRkqEb60frXhqI0L/R2pn
         RW2Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788859167; x=1789463967; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yG4Pnz01dW2S7kM9qcZcTMa47qByQxdGgpfF/vR9rUI=;
        b=fML0MBGdGB/RDDug6JqYvI3nquhahldnpa64G6CphRUNbwXR2FJojVmRo48dtm9q5o
         HAP+75lgGmm4iwY4jASrGk0CuzUFAzZEqre0BtAgx1ap2XOFN8bCJK4XVGor9Do2R/5W
         VNfE2wQU7AjK/u8QVCgKsdFP3UbyftLalII4Bm06mrsCySKC5GZRK8rZwqg50QDdHotx
         2w0aERhUU7reyxQPiqb40eH5DaWvJfZNI7Wsf0iSOW3gqW6Ad/urI2QoChMTszbMkd+O
         AArPPuWYjPeEDTyrXW7zLmQwZQKWCA5jP93uE7tUslDtdVxwJjVKz0Dupk0IvY5CxDLx
         fafg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788859167; x=1789463967;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yG4Pnz01dW2S7kM9qcZcTMa47qByQxdGgpfF/vR9rUI=;
        b=ZUsk1voy3NoZZKFG/mDF9ccdDKo5ZdX1zwntdD9tFBbICrDUPRV2kKHKv9kn/6N4OL
         00jiq+vpCveGjUmSqJrz5X9azkQA3BVavZop0WvfGPpErLzeU7IzSuIcG6915RBrITdC
         hBdP01R+llaMwOsZvnMolqsnBmp+HsGgH1Cbj6/ZFZ1w0HH1d1mo0YSs6GuSr+M25Oci
         oo8n1u2o1uQ7DV0C3X38DlWhPCC0gT4O0/KgHeptC3Po+uEAF9mp4pfEBzqnMfH7JG3c
         14Uh3DZAKpAMcXXFHfRBiyxjuFixBR+NXdi5IZTncJHEwPPFPhPAgchdnsu1flKOD1ct
         IQcg==
X-Forwarded-Encrypted: i=1; AKwUvBylvLsLZWZNoSwkxOLQkOH/TWBWKdkQht7Yc6K3ioCNnfrY7sshWGqDn590MYFb5HwUgN5FCY1fyh8lEimpEg==@lists.infradead.org
X-Gm-Message-State: AFuF++mb+Iq/Xuo7NKLntp0NOiHQ2W/K7TPSL4eIUoZYPdfzYfyS6L1W
	+Gsdg41CYbFfkieoQnsEuWWhZre698bvRaUow8WxmwojfcsaX5MtR5P9waonMg7Q9jWuQ4vzXqe
	NifV98+/lzp5m5Y5sGlLnhzAwvNV1ZHo=
X-Gm-Gg: AYBFou26TXv1ZJgJQ5jnctfDqb+byONph5a8F8EaR+ne9Xl+lIRqx8PYvdsbGrzvnBe
	S1zQBNpKuhrSau+jeL7X0nU8WGkovKJkz002ECyYuceeTqMLDaZMG5xFKDb7XWf0MD9YSoQfheX
	kjkXCuMKh4N4wl5QJYlV9V5Cw0uiMYHzBFly/0stwVNa1Ly+0n8CxV/9gRfBIrhb3KnvndvtD+J
	22rjjDTuRKViYdlSQzWMSOePESL0wqlts4hTuCkQzQAeINczx+758O/Pf996SQcw9BGK+tD2aF6
	b5RY1i/qc1yikEcb8Fu3GwS7OfQryoFwKWqDu5ZM0t4hvFuBoT2NSFn/NRjkfrlpepRk5oyzqB3
	WO8eqOUI2rOZ22LX5BoaPY7ZAvkC6ylSogdegV87uIGV4Q1Q1N9DXM5ar
X-Received: by 2002:a17:903:3c47:b0:2db:eb5:47ea with SMTP id
 d9443c01a7336-2db12106896mr426721305ad.0.1788859167169; Tue, 08 Sep 2026
 02:19:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260908090448.3332-1-ansuelsmth@gmail.com> <20260908090448.3332-5-ansuelsmth@gmail.com>
In-Reply-To: <20260908090448.3332-5-ansuelsmth@gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 8 Sep 2026 16:19:14 +0700
X-Gm-Features: AcwNN1VpPKN1gkIiS51yj4BLA5N52CV9eNK9WOCJ4im1zZlIaPxLmU_uBzBetZQ
Message-ID: <CAABR9nERV0bGkEQm=4kLNBZVfurr+6c-Q_to9=XixJV9CT=vyQ@mail.gmail.com>
Subject: Re: [PATCH v6 4/5] ASoC: airoha: Add AFE driver for Airoha AN7581
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Cyril Chao <Cyril.Chao@mediatek.com>, 
	Darren Ye <darren.ye@mediatek.com>, Rosen Penev <rosenp@gmail.com>, 
	Daniel Golle <daniel@makrotopia.org>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_021928_118310_B30C90FB 
X-CRM114-Status: UNSURE (   8.85  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> +       ret = devm_request_irq(dev, irq_id, an7581_afe_irq_handler,
> +                              IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "Failed to request irq for asys-isr\n");
> +

I think we can return the error directly here, as devm_request_irq()
already reports the error.
dev_err_probe() would result in a redundant error message.

