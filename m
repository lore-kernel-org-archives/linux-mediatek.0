Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 700AECA5FED
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Oct 2026 07:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GrOU85VuNZba3sZV48gSiTp6ifwgbG0aF11o1sJywTw=; b=zg/5zSlQzzpI4w3fYgL8QKUdPl
	MpLxkjXM+RzOyMbMyhVP/6DEYiWCgNmP5bIX8drW5WbqJSGem4xUIvxPk8pMnvK8+23R+gOpyCSh1
	C7jf6Me5xob+Oigs3F+oE1aTevuEUPvkOls/NrAHlfas6KlypS1m//UMTv4GJT/H7+ol5wkLP/Xfj
	UORfilRGJOqGpPe++yFlpQuhjd1mqgl8GyhPQqG2aexe1YnqpCK8XJAQSgVRG28Y8f0LWfqUwyRPT
	nXNoDezaWyFvXPfmCN3zH8negvZiOsAS8jvn1PIZmyMCKvFqW+QKWbaZirs5vkuzRvY1L+09s3YEA
	3jDK2vIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF4ll-00000005h8c-2OfO;
	Fri, 09 Oct 2026 07:11:53 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF4lg-00000005h6l-1bSJ
	for linux-mediatek@lists.infradead.org;
	Fri, 09 Oct 2026 07:11:51 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-6af9befd04cso7939174a12.2
        for <linux-mediatek@lists.infradead.org>; Fri, 09 Oct 2026 00:11:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791529906; cv=none;
        d=google.com; s=arc-20260327;
        b=O8d/sYroWfMHzINkI3cZDDgp9DPbtZxMBORR/TTOncriuReBCD9IPf+NNlj0Wf+zmU
         q1YpCWxncODbFQPm1wCMbl+0sQeM2NQf5p7RfsdhDJodL29C2yqhAPITIhB/AJBmthjy
         Ahp0YHnRUSUYTDv5+L7qBz4at/OgE5t4xhfHipRY51JElkiNZXkRxNWAMI7aMDDgebN9
         vv78L6t/TpLypjKJbgjxu0nJyqUS9OFqCGRhrKCZztMsLWQyIObDN78i9rkahC3br8YD
         9M90YTsvugzZhUaF5S3mO3f/AZg6dCka8f5QbyMXLUPOtI2z2iB51x0tVXFxukcmJNNs
         2Iqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GrOU85VuNZba3sZV48gSiTp6ifwgbG0aF11o1sJywTw=;
        fh=7OacyG2vk25O8iWzh9ahfu2GnzYxDDjYuIBZlV+fnZM=;
        b=MfxRE2EWvm42JAcWazuWbkLPz6ZtVYmwyruVZDbPBZxLHOw+b2w8/7joRbORGxWNkG
         Hw0UthQ3VBlxbszqyFzycl0i/KwXjckxeyEJ573dQ5sg+QTn6ooB3mqstb8BU6u/9GL/
         E+APCu/5D+9TCYSghDdjtJGAZfFbR2v8HBoA1e+TPY/QSE/g0fgWy++ACzOz3W7q6Mzx
         OOZ4r5gSgNU0ORqlngFOw73V7cfxlUjB3m6KXIRkdF3BX+t66RaN+A95f96LbeN1grEV
         +5Hli1LViIO2qFxteGshZRY9tjdKpSE7BMnLx7bc5/rK3F+W57B3m8+YBXjbwMD/m7Vq
         WQFw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791529906; x=1792134706; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GrOU85VuNZba3sZV48gSiTp6ifwgbG0aF11o1sJywTw=;
        b=TFoeP6z+Z8RPz6xd1rK4fbeVFWE+radxB7YnsP611HDJtED3ktr0YW/4nEr4ZLLe82
         96YZF2vNAC/DaygqcFS3/vPiDd+/qv3LPkXEZYab3aSNWyn+O9FSk8hQDoCsDP2VPAor
         qzfQ3l3tZ+HTIOZLLQNwQ1F+tXE7F4Vv3e0G2VCkkYJXA4SYTpCwQwb3DHk8i2kd0m9x
         p+9GG0p9ofwkhK+6HkBoY15cq+VwYY5sBtTR0uj0p0iDRCy/As1Ruw6kHMausfWTE7jT
         +fLGaLP5l3huTjAwY05NptbZDPF+ampCrg6v8QmOpnx/uaI7m8rcIUIFscy+uJL6uTAa
         Om9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791529906; x=1792134706;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GrOU85VuNZba3sZV48gSiTp6ifwgbG0aF11o1sJywTw=;
        b=H9mVD11lIXVhnC44ACfGc2ivyGtXgssIPdmHTgoqykQ9UjKbJjZb2AmS6jvyyldsGJ
         gDSO8JzQN7Nllki50uTr+8/Po8zvBSpeYEzJ+3rflaO5kIBK4pyT9/10kN4iqwqK9GFK
         gmGN1Vb/WMTP4NKM9diWYu3ZpjxFhvAGltfR2tsGTOEUqSeWPArcZPbbQQsCtrVdujZN
         DZNtXlKtyjxjn4C6HTCHJ0z0LzT9ruOAwBHmI0JuBJJiN707DW93EMT7iUzbAiwkjuqX
         3KDXVOMKT4wVmNq+3BvtUrTruwiJZ2H81Zlp5sFMPvMUZ/99RqM61j3LQE2jfWjUY5N0
         VK9Q==
X-Forwarded-Encrypted: i=1; AKwUvBwOUo1/LcAA0mxHP+1dcnz7IOgMZRkmEtMxdqCm+Y6nE/WF+nVzCD7BxhMdTWtQqbG8hcmTqm+C1rPdrynBnw==@lists.infradead.org
X-Gm-Message-State: AFq9FYJ1sj7FZxP2qAs88AVZlamxmxzVhdR3+7CEYOTT/n4a8AgH3vmt
	RGw7i6FlRnNhDC5EpcUvApyER5HkQXu/w9hJFU4Pm2K9TGMQp2zlTWh/2feOIrkHrvihXbYGgO9
	1xzx8cfx5LgNM+agbk34gmxMymkDfCOo=
X-Gm-Gg: AYBFou2lg7hf/prPg5ye2lW685GC4uxbyoX0ltO4bSvZY4A0MrgnKRzAesurCcyT7bV
	KsyEOVyFAdbGTYdN5eBmdmHjrkJ+HDoOtQUnKD+WsUTYEtvR4B6NcVSQQZTzZUEndKgx6cFFy8K
	s5n9SG+GFaz7a3w11HytLdFu2sHu7QmI46Eo2N3Mxqt3BJfPDi1h40fUDFalM+JsyDzF2gG5Ro8
	neo5BWMXkY2rw/VqBte+QUMZqNlqHYO5ShOvzS4LZgjyFV+4LqR0hVV2cFd7F4u3c0gaF5J2Mcb
	GwFjLnJZzQA5XQbEs8MJNXp6F8sVwj58RZmr5k1on9sf+DaO9l9EZxilDfIapAS/HKOwvlcrfYV
	MTG1+KI4SCT+rENVxuktKeEniHsKHqSHoh4uC/JqB1M10rc8KFD0IfC4MKU3kJWsggps=
X-Received: by 2002:a05:6402:42c8:b0:6aa:9fef:641c with SMTP id
 4fb4d7f45d1cf-6b17c2cbe9emr672146a12.28.1791529906210; Fri, 09 Oct 2026
 00:11:46 -0700 (PDT)
MIME-Version: 1.0
References: <20261005110257.50145-1-phucduc.bui@gmail.com> <20261005110257.50145-6-phucduc.bui@gmail.com>
 <018b4233-8a2c-48b4-bbd6-4c471dd14568@oss.qualcomm.com>
In-Reply-To: <018b4233-8a2c-48b4-bbd6-4c471dd14568@oss.qualcomm.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 9 Oct 2026 14:11:32 +0700
X-Gm-Features: AclHuK-rdOMioEF7bIiE384aI3Wbo4oyl4-CcCkNK2w8cU-mlh0smKvKyqU9pyE
Message-ID: <CAABR9nHpfwZ3Ma9pOTiY5eMN01Exfez1YahdUL9g+HCq2gwDXA@mail.gmail.com>
Subject: Re: [PATCH v2 05/14] ASoC: mediatek: mt8195: Fix paired memif clock
 error handling
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Trevor Wu <trevor.wu@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, cassiogabrielcontato@gmail.com, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Haotian Zhang <vulab@iscas.ac.cn>, HariKrishna Sagala <hariconscious@gmail.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_001150_057371_8D4FCED0 
X-CRM114-Status: UNSURE (   8.06  )
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

>
> Should the START/RESUME path check this return value and unwind the
> trigger state if enabling the paired MEMIF clock fails?
>

Yes, I think it should. As mentioned in my reply to patch 1,  I'll
wait for feedback from the MediaTek side before sending the next
version.

Best regards,
Phuc

