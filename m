Return-Path: <SRS0=W1mV=QC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 785A6C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Nov 2021 14:11:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 417B761C4F
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Nov 2021 14:11:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 417B761C4F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uir3yIhQWcFba0k2gCD1tB/FN0/W9yWKZcawQSmZpy8=; b=iWNmHAHQVfWHyg
	n8CqJt9QxYymGVp1RYum+2yvsIxIlQWyKgQK7Sors3FVPaW8bMYlSf44eWuoE4J9zmy8gGEB9udX6
	HyhvOhcy1Ux3x3USjcA12Kdxs0gO2wYqeaX6s//tMCDecK4G0/B73y+I4Sor94nyWmEXrEH7tH/xd
	87pl0aCxQU3Ocfu56X4tBaQKtLvjoDwxuzTBIUULnpI35sWnJVR5deqj9VD1XvpNZYlCkj/aEXEUM
	aUSK4DDDcAgY/WoGW5DCse95CmUgQ9O8QE+u56shUlM3RNRlehNWz2yBwkIlni1ZwvEB3Ujiw8EW4
	M88fFvq6vZPn2ex9IT4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmchE-00Fp5y-VN; Mon, 15 Nov 2021 14:10:56 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmcgp-00Fovb-CQ
 for linux-mediatek@lists.infradead.org; Mon, 15 Nov 2021 14:10:32 +0000
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E29853F1CD
 for <linux-mediatek@lists.infradead.org>; Mon, 15 Nov 2021 14:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1636985429;
 bh=pfr1cDNzcAoQOpDJQS2N+lpkCMkGHO9LO6u1gxB8aGM=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=ctNqT7HEX4QQTepOUtE/pPA69s+PbJpIXCDGH07HxDEie0T5HH0oRzR8kidQ3M6Wq
 QxCzGr4xpdId0V5CgDg6TGaydn0dptwB8DWjy6W5aVaLN5kR9WxQOty5ZcNDDbrgdq
 i3nk7+kWfxr2kFTwHB11GU53AjxO+Jq/qugipgE7oEhVwF49j7NnamPisA1Ge6qq67
 i57xPXmHTVru/Y1jfHIubA08VuL8Z08SUbwZVZOgHn2UpZti79IKE6NR0JV9ZwHz/P
 Hkat6arT3SLctNw+X8tbt3sUktB0/wvZTyAC6PeGyNi69LJzLa+zo610LtnlDx+jib
 uWOtb8wIHVNdA==
Received: by mail-lf1-f69.google.com with SMTP id
 z1-20020a056512308100b003ff78e6402bso6766280lfd.4
 for <linux-mediatek@lists.infradead.org>; Mon, 15 Nov 2021 06:10:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pfr1cDNzcAoQOpDJQS2N+lpkCMkGHO9LO6u1gxB8aGM=;
 b=1PxL7Tgqdb7AkQOFtP/5EoLDvi2vNukfV1qO07lMxKR1y+LH9gwIOR6knAgqgnHXpn
 zy6RmRrkV7+u+KlK3C9j4Lt13zP7hErQexCzARabW6YfCmwumBHFVQmS9xVjG1wfC6vh
 GFFpqe1hwPbTAdu/49SETZ6qyI6kDyOmXaYlDzu+2QA31ZvFCB/Bc4o4NnpMgK2RIwJX
 MH9HviV13WdYJDAzZyq5Hb8fUCSIxLMjMKP9jzbqV3Yk/29UZwSqRNeTLmvWMK4g6Cr8
 HMEG+r4grfcP+hIkQRpclWyDDcozIBIBoeUX2g73h797l3yjR9N5qPcyTTzO/1quFNez
 qmMA==
X-Gm-Message-State: AOAM533kWtVjuhTWCMUS6WCQGXBFJFfLgPSBygZqy3wqoU5qyB+pn05u
 QZORBQByPt/FSvx0/Es2FX1HZAmWe5J6HYsmET1wL3J8M4HlXQ7tYPGsVcqAh2aEIgtcyCo9Y0m
 gIRHKJmXnL8UnJwWeGQyLmWoDRnj+F2qc94s7rL/rxygUnPowwQ==
X-Received: by 2002:a05:6512:20e:: with SMTP id
 a14mr18304390lfo.192.1636985429236; 
 Mon, 15 Nov 2021 06:10:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw+mI02/0nQEVJ716rf5CIjp6Bip28AWoCb8f30KO4Aj7CFe5qZ574+bCxyzb4bWi3fMN8Ywg==
X-Received: by 2002:a05:6512:20e:: with SMTP id
 a14mr18304343lfo.192.1636985428995; 
 Mon, 15 Nov 2021 06:10:28 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id p17sm1508215ljm.138.2021.11.15.06.10.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 06:10:28 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Yong Wu <yong.wu@mediatek.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 anan.sun@mediatek.com, youlin.pei@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, yi.kuo@mediatek.com,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Tomasz Figa <tfiga@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 iommu@lists.linux-foundation.org, anthony.huang@mediatek.com,
 Ikjoon Jang <ikjn@chromium.org>, Robin Murphy <robin.murphy@arm.com>,
 srv_heupstream@mediatek.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] memory: mtk-smi: Fix a null dereference for the ostd
Date: Mon, 15 Nov 2021 15:10:25 +0100
Message-Id: <163698542257.136651.14853548122836494400.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211108082429.15080-1-yong.wu@mediatek.com>
References: <20211108082429.15080-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_061031_570600_67EBED5F 
X-CRM114-Status: GOOD (  12.03  )
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

On Mon, 8 Nov 2021 16:24:29 +0800, Yong Wu wrote:
> We add the ostd setting for mt8195. It introduces a KE for the
> previous SoC which doesn't have ostd setting. This is the log:
> 
> Unable to handle kernel NULL pointer dereference at virtual address
> 0000000000000080
> ...
> pc : mtk_smi_larb_config_port_gen2_general+0x64/0x130
> lr : mtk_smi_larb_resume+0x54/0x98
> ...
> Call trace:
>  mtk_smi_larb_config_port_gen2_general+0x64/0x130
>  pm_generic_runtime_resume+0x2c/0x48
>  __genpd_runtime_resume+0x30/0xa8
>  genpd_runtime_resume+0x94/0x2c8
>  __rpm_callback+0x44/0x150
>  rpm_callback+0x6c/0x78
>  rpm_resume+0x310/0x558
>  __pm_runtime_resume+0x3c/0x88
> 
> [...]

Applied, thanks!

[1/1] memory: mtk-smi: Fix a null dereference for the ostd
      commit: 8c5ba21c16bd7f8e23b8740dead6eaf164b8caa0

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
