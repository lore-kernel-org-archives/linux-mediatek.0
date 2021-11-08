Return-Path: <SRS0=Hr4j=P3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF4E4C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Nov 2021 15:53:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A628361163
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Nov 2021 15:53:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A628361163
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aMgbPPYi4lbUvg98P9XRCe8Cr/kigk4QsIvtifeGvMU=; b=e42cu1CiV131QM
	VMCTuwiteE013KviwS4r8Lxrlq0oYHb2aKn1+1lqCTf0CcKe/jGsVUIVec0Gv4oxSOs4YI84+a8A3
	y1J7pwU3qA9w/v0wKwLt8lh9IrUQI97KKGmRuj8KWUbtextyn3XG+nytyq1H55H6gSFkN38lqqLxG
	mwXP0NmMG2cwPep9Qp2KvpaLy2qsnmEFuR09MObH/rz9PIdxlDlg/O2DaSXTyWfVA1mNziIBnoauo
	a3IktnrVqVS90dlYRehV1YaEnPYOGTAApDdaTZu/tVZiIHP7YDMiwcVcG0CMoRa+QFPKvLyYwhP9W
	fEQYpXkDhBXCOyIUtnjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mk6x5-00GtBV-3k; Mon, 08 Nov 2021 15:52:55 +0000
Received: from mail-lj1-f174.google.com ([209.85.208.174])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mk6x1-00Gt9N-LJ
 for linux-mediatek@lists.infradead.org; Mon, 08 Nov 2021 15:52:54 +0000
Received: by mail-lj1-f174.google.com with SMTP id 207so12178253ljf.10
 for <linux-mediatek@lists.infradead.org>; Mon, 08 Nov 2021 07:52:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=E0F5Onblgfh+hTQ7up79bIDtJeB0teDKjpuol7uq/EA=;
 b=A1y14POtouMEMYk5wjGlWNfEkK6lC98BeUu4bxqVXu/FN+5V/KktqHJ/Vs0RbzNlKX
 NwxRpDLmksQQwk0FxhoL7vB+R9xeA3C1DunzkxE1fuY8CywYy+qSWiad/g754IfDhpNo
 QvcWZweE2u7snI8HBF/GUVhbybCpwaCn8USHF+1BixZK78dK3UzkDOOouecazsh5DsXL
 X2wj4dFqVFwYtbnT4oIxUZ3c4DZw0O6PYABGhNG2VK8d/mob8b9B+KRG/e7H6JTYfwKw
 XdtPR605xuT0c1IHSC4aGmE+whyh5ZsUp+X7u0/jIDIsLkoadZpEh2NDqsEuYgvuyhyC
 LI6Q==
X-Gm-Message-State: AOAM5313rB1X72Oad2L8XpdPdUpSCMFWaNVrDIazKyHzsjutcfTgxzug
 9gY1bMQ14Fz0hBKudsWlrUM=
X-Google-Smtp-Source: ABdhPJxaKGQ6wmr7NL1saDbAGoy4zj7BN4FjL2UXNdC0ccOd+U/mL7ZTVymd8wV/GKj57dtUPdkUCg==
X-Received: by 2002:a2e:9dc8:: with SMTP id x8mr12607ljj.502.1636386765659;
 Mon, 08 Nov 2021 07:52:45 -0800 (PST)
Received: from rocinante ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id m8sm205531lfq.27.2021.11.08.07.52.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 07:52:45 -0800 (PST)
Date: Mon, 8 Nov 2021 16:52:44 +0100
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Jianjun Wang <jianjun.wang@mediatek.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Rob Herring <robh@kernel.org>, Fan Fei <ffclaire1224@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org
Subject: Re: Distinguish mediatek drivers
Message-ID: <YYlHzMGAdO1eOQLn@rocinante>
References: <20211105202913.GA944432@bhelgaas>
 <98d237693bc618cba62e93495b7b3379c18ac6b5.camel@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <98d237693bc618cba62e93495b7b3379c18ac6b5.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_075251_755640_CC01D526 
X-CRM114-Status: GOOD (  10.08  )
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

Hello,

[...]
> > Both drivers are also named "mtk-pcie" and use the same internal
> > "mtk_" prefix on structs and functions.  Not a *huge* problem, but
> > not really ideal either.
[...]
> Thanks for the reminder, I will send patches to update these entries.

Perhaps a silly question, but would it be possible to combine both drivers
into a single one that handless devices across all generations?

	Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
