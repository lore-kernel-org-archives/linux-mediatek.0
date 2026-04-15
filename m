Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF89AF41984
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Apr 2026 09:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IyJiLQD5TCPnlIsoP9sQ4nsBlHq4fhOleCfx0q9dKFo=; b=Ipit+iNtKcRh6YLr9/pogD/hfc
	QBGOPdTQ8YFL9VDlsic1rm3+cTmLTERry0yKUP92K/Q1AgL4Ay1Ab7oKrwx5eQzl4jF8Nic5/qhs9
	71o1zbS9fH8lgquEIWBuciuwnFy9CPgRVNjF8x0BNOa7yEOC64UkIdxOjWFOBCPc8TBfXFOg76A7o
	1pbaOrhUiw2rFMqD7kh5IkaLLKwwBujgN+JF6ABl0lU7poL7r29sMBpWUQ1edGWLcFbd+RoRaHGML
	9J3BIrd8kMkJAzXOsFhtu+lWA6TCAQ6TiYRGbUjXQPcItbX+EYv/4lE0WeZX6+mgp4dJ7BVtfSGGe
	gYsfVtbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCwqz-00000000veJ-3NpT;
	Wed, 15 Apr 2026 09:48:13 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCwqx-00000000vdL-32pp
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Apr 2026 09:48:13 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-8a093c784b0so80379516d6.3
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Apr 2026 02:48:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776246490; cv=none;
        d=google.com; s=arc-20240605;
        b=OY7yvWX1zgG+kKoHRXcZEqfCvI4N2lxCI6aLvzHk3i3RyOkJGvkUKJMy9AUYx/we46
         9MilOx7wRWBE/mFOh43EDuzfIUU6w751vzQELXnQDrIRG4WuN8nmNAkDQJrE4H8xd6VK
         3MBV2+FZRk8aH3jh/M41PrNV+cCv3ysE7Ossmpsm2tScwjwufVgbQo7I5SWjtRa7zGrc
         ptz6X/IhRqUC2uzgaTkxgagDB7YZn96sPMdRtCQF7TGRqJAd6zorrgDsjwjge5eCXIJe
         U/xvUONl38AMT7hzMgxmRuXtGZZ4RNE3rZfXn+gV2Ky17YJUp9yzc4phZQj+E4tMGbS6
         0yxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IyJiLQD5TCPnlIsoP9sQ4nsBlHq4fhOleCfx0q9dKFo=;
        fh=BUsKKEjAn/xNYdM1kdcNRwY4cam56QNL/1tVQJUxSYw=;
        b=GzAkRJRbhIc2PPUyhZJcs3G0nHEP2rO6q5zInjPJsIqeTn0hOlzxU7GK3Tm/QuXiLr
         EhKGy3mNRBTwAmtsdVxrjqRDb8aQCyxyPoeniS9URs3Iw/WNd3XfOV9ZE4QXZiePuhdh
         foz1vezmOzo0feQgyZY3Tr0YTL+Cm/qfq+FxF9IXmN1USGtjRkaJuU89GJ+nD3TcLah8
         IJSLdnKLymcQk+jlLn5KpHH2QSsyM+NXV6S0vTGaW9tCeVme63RyzGhwsd9OibUNTvPF
         bptpj4MZUYvA/T04WnGo8r5AQkd8Oh5HopMT4H1sFekh5+jvebwFl1kSC0WmW8x9DAOh
         tJHw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776246490; x=1776851290; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IyJiLQD5TCPnlIsoP9sQ4nsBlHq4fhOleCfx0q9dKFo=;
        b=soIz5LI2qdaTZL42YM8tKmPqIlihjZoqEntCimD2CbslqGrHJHd3go8YDFhrJnJVq4
         rtluUx/SPUutgyNRFcBHE7QhLRedrCHV4UHF3pGUrUDlxFLKbZC3eaV2S+ptoWYs2pZf
         eOIa5jJH9w+pBfVqlRSxbQ8SeZrgoQLbLAXa1ZUE1V0dRuOTICtA7MwW7C1Zfllt8fAf
         LAddbczIqmMORB0CIjJ5mvxmcjQPIYpv8wKMibE6Sx1nLubKw7Wl60yFCLiENRwe2IHm
         0xufsF7HaDA0ZR0bHb1/n0Y8NKCctY0tKEeIRwYz19YAZPGHRvAiSY9ofQztrkmYv3IW
         zqsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776246490; x=1776851290;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IyJiLQD5TCPnlIsoP9sQ4nsBlHq4fhOleCfx0q9dKFo=;
        b=PgrKbN4JRrNv7e+Bm6pcpeIMxxY6SEstR8hL23GaKQ1EP00Zj+WZJJG/9UzkqTuFI+
         zLJ74SBfqt7Yn9pulActG4ZufZrDf4Dqb7SdJeW9444hLNfcl91jmI5hdfGwxRAJGy1+
         THm9tbm1WcgYJNKdOiCy/tqvMvoHdSQs6TGsvMUhtQ1R5lRxUPhall+7jiFMSZY2Y67v
         fc+eyBkhhYgnbUuF/2ergvAwba1raGQnKJq+st+0IOOY3Nql51Y77+K/qpAwyt1KlPSS
         qKqswWSPRLalvjd5HU9tVMcZ1N9MAl2+BMRVp2Ih9pjm0DXuxT5AAImvkcufHkEiKMPA
         ji2Q==
X-Forwarded-Encrypted: i=1; AFNElJ8U2rNP9tLRZyccb5aAzLyNeEmF0NDWwc5r5gc5DlgyIFhqAyI8n+O8LW9CpvOys/1VIROJqvw9oYnf+ZREhA==@lists.infradead.org
X-Gm-Message-State: AOJu0YynkAKyRHTx2z7sPPh6sD9aZHmIPTr0TdZRTKGz9dY4DIl9FB/K
	24NdSf2lig6T3ySzKiCuPCnhOkB9013dtvhrECNxXTbgfhasGNLWBhMUYA/YJQ6JcYNE/tDgRKL
	2ZiQm7QLx2xOhJ8YyNjZzh7imbduhIp/oVg==
X-Gm-Gg: AeBDieuHKfDqIEiidhKKIHlLBOglAp9YE2+TwXVVZgs6Zum0e/rQF2ayMn9v89wGq0d
	ZK5EXIP4ZmS6KG/QjnC8vnBa1IdimhrbvTIRduT2UQ6kC0dcK85oXyCl7e4BOpkpS1QYq0iPQyu
	nKHItvgcU1P3+3Ccx9izlL9G7JKiBfE0XLwEUOxUtE6kS36R/HqPuVBoMdBBbBH8yGX5FXVsafv
	ZeboIZTwujCtWsMPzpiQ34eXNbdkTVvnDEZVhJhZ1UzD12r695Pr5jTw0jgQ2PPjTCAhPQyT1S8
	Kkg7PdNMUxne00u51U7/17qlUiU=
X-Received: by 2002:a05:6214:2e48:b0:8ac:7616:569c with SMTP id
 6a1803df08f44-8ac861ad3aamr350240316d6.21.1776246489728; Wed, 15 Apr 2026
 02:48:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250225-en7581-snfi-probe-fix-v2-1-92e35add701b@kernel.org> <abBPufvrG8I8UP69@lore-desk>
In-Reply-To: <abBPufvrG8I8UP69@lore-desk>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Wed, 15 Apr 2026 11:47:54 +0200
X-Gm-Features: AQROBzC_3emuWl_zkXPyDwuBn-0k_x9_JCqk9UTd8pYkmyaVmNF-Oazonv_2HuA
Message-ID: <CA+_ehUyfP7bohsSZEbjp-KLxD084NcR+2SmhDNrpoKQE=BiHcQ@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: airoha: en7581: Enable spi nand controller
 for EN7581 EVB
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_024811_800919_0F98C7A9 
X-CRM114-Status: GOOD (  12.16  )
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

Il giorno mar 10 mar 2026 alle ore 18:07 Lorenzo Bianconi
<lorenzo@kernel.org> ha scritto:
>
> > Enable spi controller used for snand memory device for EN7581 evaluation
> > board.
> >
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
>
> Hi all,
>
> it seems this patch has been reviewed by AngeloGioacchino, but it has never
> been applied to linux-mediatek tree (or at least I can't find it). It is marked
> as 'New, archived' in patchwork [0]. Am I missing something?
>
> Regards,
> Lorenzo
>
> [0] https://patchwork.kernel.org/project/linux-mediatek/patch/20250225-en7581-snfi-probe-fix-v2-1-92e35add701b@kernel.org/
>

Hi,

friendly ping here. There are lots of patch with review tag and ACK
also for 7583.

Any chance someone can ping maintainers that take care of picking these patch?
Or someone that can reply on how to handle this? Maybe we need to sync with
them? Lorenzo (and also me) are fully maintaining the Airoha ARM target also on
U-Boot. Also on OpenWrt this target is starting to get traction and is
getting used
there, so Airoha is not considered an abandoned target anymore.

