Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F36CE7A8E
	for <linux-mediatek@archiver.kernel.org>; Sun, 24 Sep 2023 19:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ADa9CTc7Mm0plkUbp7+s7MaEsuDZ1Hcc8R6xm7NWcuc=; b=nPAuiLREBBIvQ6NtUwUxWlNXvB
	0ce5J7Mxr+IMZwFqvWDLpu1ZBEs5My7gweCLF/uOJkYP/AT144MBCHzmn5XiiuVFcubToazGpcEUQ
	xlzTlJ0HDKNvVEniLK7UVVchZWOG9seBVYG6JVhLygis0ZsEo8BUTHWxzkj0bKfj5A+iAL3cMQbsI
	75rxdkeTcnBnFhO1EdJxUlR6wzEsRUbjXDZ9N1CgQ/gd2ax55hxt5uI7DQNigWkOF20pClAI+1/Ym
	36QTy1Nqqi3O03Rfv974HMr6Gzz5pwr5DY2TFEauL51bYRzMwAznf0+8bhHkrxD0d5uwwXkFcMiYc
	TSjVUIjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkUN4-00Cdnx-34;
	Sun, 24 Sep 2023 19:02:22 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkUMy-00CdkS-1Y
	for linux-mediatek@lists.infradead.org;
	Sun, 24 Sep 2023 19:02:19 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-401187f8071so35133695e9.0
        for <linux-mediatek@lists.infradead.org>; Sun, 24 Sep 2023 12:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695582134; x=1696186934; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ADa9CTc7Mm0plkUbp7+s7MaEsuDZ1Hcc8R6xm7NWcuc=;
        b=VqhTjgBm/PIP8LkCukrd3hIhiyz7J4dTCAeLoF0czLr4xSRONEA9zZiMe0eucqEN+b
         TNP8Me2DDRMQVsERNLC2P9LBuTh7yGmjwBVs5Afsp9MkxBfs/0TsyTYUEaNgoTWWgnN5
         Zb84Vzq5xAM5lKw9YOGclUF5FdVP1MEdooRfFg1zDgrXSywM8g2aEMIbCugNjd+nHK/x
         OAJPdZh/ZsRLuFLlTuOL/OxWJE2SWzMRnDaZXbfVdRpAvx/gtt4GRa4iqFaGHaCMKmpB
         mIyrJA8VZ53gQ5jxFBFtlSsCLOWXxWGGGGYF0CeogBQfhpgjFVv0NNRtykuGVn7F86Dn
         DfNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695582134; x=1696186934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ADa9CTc7Mm0plkUbp7+s7MaEsuDZ1Hcc8R6xm7NWcuc=;
        b=T9jX4CWVIG+GekRVGMnZGHEl5hRqiWgIGnR/neD+FWl4WGLbSwITuQoJ5GJaJnBpF9
         dDNZRvTM5Wz+C1g5RP+J1DnH5Qh56QaTjFxm/uV5IMzLiBzgQ0546MICKTTiwIMAAjvn
         0pQ+UctQf1IIgBCfkFFYq6Jsj+Zo7V25vftiwwr13SbCl8KhGAddnxj8voQ5xwiOqe0B
         qPDmJfyjKkRw9RMKXE4w+K27bNlFdFAZBK7CnVcF+30Xj157EI7fEoR+XAfFj3uGG3JE
         HwmmFJrZM3dFTFp8YNKeJFVwC9thN6i9WpjawmEpA99dsgI8n0FJa/gbzDgnTPcjZb71
         mlyw==
X-Gm-Message-State: AOJu0YxZ8+FWLCSrYPFAzR0/1c9IzXVcbwC8HpE+5aftrfWrG87JB0p+
	6gsq7zsoGPKdMiubkWeGLzgB3g==
X-Google-Smtp-Source: AGHT+IHnH8FwuVSfP4cEIj4663STrnMRTMgkALP6Q2CmPnysXrCog9SKo46U9k2ZhHyKdGLPvbOn0g==
X-Received: by 2002:a05:600c:22c9:b0:3fe:da37:d59 with SMTP id 9-20020a05600c22c900b003feda370d59mr3543430wmg.4.1695582134179;
        Sun, 24 Sep 2023 12:02:14 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.100])
        by smtp.gmail.com with ESMTPSA id v2-20020a1cf702000000b003feae747ff2sm12980507wmh.35.2023.09.24.12.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Sep 2023 12:02:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] ARM: dts: mediatek: add missing space before {
Date: Sun, 24 Sep 2023 21:02:01 +0200
Message-Id: <169558197844.54884.9059102157573367426.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230705150006.293690-1-krzysztof.kozlowski@linaro.org>
References: <20230705150006.293690-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230924_120216_570081_B808A016 
X-CRM114-Status: UNSURE (   9.33  )
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


On Wed, 05 Jul 2023 17:00:05 +0200, Krzysztof Kozlowski wrote:
> Add missing whitespace between node name/label and opening {.
> 
> 

Patches were waiting long enough on the lists. I assume there are no objections,
at least none were shared, and this just slipped through the cracks. I applied
to my tree for further soc pull request, but if anyone wants to take it
instead, let me know.

Applied, thanks!

[1/2] ARM: dts: mediatek: add missing space before {
      https://git.kernel.org/krzk/linux-dt/c/f673ab0ceb8dc8ccd291db9bbc200dbd8cd399f4
[2/2] arm64: dts: mediatek: add missing space before {
      https://git.kernel.org/krzk/linux-dt/c/a9c740c57f977deb41bc53c02d0dae3d0e2f191a

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

