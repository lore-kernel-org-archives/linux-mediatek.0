Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9261C3DA6E
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jan 2024 14:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sVMqThbVP0Q8RE+595KzEmSzoEzPpkpeb2mdqe/54Po=; b=aKB15tzrpS91KhlOtEpMuNIGgZ
	bdWk3H6fqMwxrCkheYFjF6FcbQ/gS571+10W8liOefSVSNeAKWFEkbSj31E0Yq6bPWw4bFvU42cjU
	2a78mooNAPHkq9QKkE5HNRaWn+HNU17hAb9kaRXJgvuLU56hFWA7e2IqaKfL8bW990UwnhOV+KBt+
	xK9+ZbGtmRE0Pu4jHVUrqEEe7ck3m3k1EytGE/wfVc//vyHiRxGb7g4bdp4Z9QE1hrwNJZ4yLVgYu
	r8jcDO7RHyQtwe6vtmKtsHo0FRpkbXyepu4jWCgXTSvaIuMhNHntqIIIDZ3Fl6LhZBfz8SbDilJbk
	NkS2YYyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMqdp-005Mpo-31;
	Mon, 08 Jan 2024 14:30:13 +0000
Received: from mail-pl1-f178.google.com ([209.85.214.178])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMqdm-005Mo8-2f;
	Mon, 08 Jan 2024 14:30:12 +0000
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1d3e2972f65so2808175ad.3;
        Mon, 08 Jan 2024 06:30:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704724209; x=1705329009;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sVMqThbVP0Q8RE+595KzEmSzoEzPpkpeb2mdqe/54Po=;
        b=iQP+cXWeI6Rsla/j0MstBMmavlZpx8zqi751cZHP636GQ4jMEv06jWbFVnlG3ThIe4
         LN9T7IomgLxH/zU7oYSfwxk0fOLOnNp058AQOSWgbdNLbGDk64gUL2afTJS29n7oXrLm
         3BO3JLO+w40DHn7Weyl0aazJTRQFZ3S6asmaLggoXd2rZpj82O8xNowZ6rKEPcNH5Rl4
         f82wC0dclCbucC1cMfcge7mvKW9DIvMLXg6EnPJkKc1GkpsMf1TINe1wbL0tqrnIf7Kv
         7mjvO8qDW5cLjXlUiZyXgz/Jg23ESB4nkhfZeAgrRHb2DtIalj0HzfH6zC1SyqNIypj9
         UT2Q==
X-Gm-Message-State: AOJu0Yz+Iv/lj6okIIo5wRjJ8k9arSZOf87z34DS8krqF2mPPbbb9CrS
	vum1gy9rgKKKt3cZ8Q5iXW8=
X-Google-Smtp-Source: AGHT+IE3fdqzVYISbL4ZtM/lxTCygtaE0GCar9x98h7e8R949MP4dVwbh+1fDeut8mKc+f/isMwbKQ==
X-Received: by 2002:a17:902:ce81:b0:1d5:2197:46e9 with SMTP id f1-20020a170902ce8100b001d5219746e9mr1033721plg.117.1704724208990;
        Mon, 08 Jan 2024 06:30:08 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id u13-20020a170902e5cd00b001d09c5424d4sm6321570plf.297.2024.01.08.06.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 06:30:08 -0800 (PST)
Date: Mon, 8 Jan 2024 23:30:06 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Jianjun Wang <jianjun.wang@mediatek.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>, linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, qizhong.cheng@mediatek.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v4] PCI: mediatek: Clear interrupt status before
 dispatching handler
Message-ID: <20240108143006.GA2602112@rocinante>
References: <20231211094923.31967-1-jianjun.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231211094923.31967-1-jianjun.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_063010_867230_57C2EBAA 
X-CRM114-Status: UNSURE (   9.40  )
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

Hello,

> We found a failure when used iperf tool for wifi performance testing,
> there are some MSIs received while clearing the interrupt status,
> these MSIs cannot be serviced.
> 
> The interrupt status can be cleared even the MSI status still remaining,
> as an edge-triggered interrupts, its interrupt status should be cleared
> before dispatching to the handler of device.

Applied to controller/mediatek, thank you!

[1/1] PCI: mediatek: Clear interrupt status before dispatching handler
      https://git.kernel.org/pci/pci/c/4fea201e110e

	Krzysztof

