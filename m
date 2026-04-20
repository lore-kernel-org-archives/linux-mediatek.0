Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F80F5A8A3
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Apr 2026 17:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b8autXOz4+KZwRvZdblx2ysMt7DyheBXaGlu2LgBdpo=; b=aHeSc8rfrPyhhBI7n4Uno4HJc1
	c/EAzE/nQ8S4gDz+1rP7NUCsVHM60C9T6y3miNqpQ2NlPsBM3rYdv8ZMxCPBQ85m6btV4epr2vkEO
	bPIP/lslyD3kWpFsE2tc7bUK1Ck+ledrPaqRa5Nk3itSeStwwlZ6yHVTmfprrVRB10oyZqfIAuYJo
	luHRiED6hSqQMhrxYZFKQgNo0Bcftk17U9Js/7b/mnEKN6czb7KLNfbTw3tZngHy1Chx6GjLALZvj
	NMXyJMqt9IZhn5Ocu+gSmgDCNeTx5dRbXtejYDfVLRvR92JrGycCDGAHtVyyHygNF48V4bIZfFBnQ
	zVZk7nWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEsEF-00000007Tpo-0TOx;
	Mon, 20 Apr 2026 17:16:11 +0000
Received: from mail-dl1-x122a.google.com ([2607:f8b0:4864:20::122a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEsEC-00000007Tp5-17jX
	for linux-mediatek@lists.infradead.org;
	Mon, 20 Apr 2026 17:16:10 +0000
Received: by mail-dl1-x122a.google.com with SMTP id a92af1059eb24-12c565dd3a7so340427c88.1
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Apr 2026 10:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776705367; x=1777310167; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b8autXOz4+KZwRvZdblx2ysMt7DyheBXaGlu2LgBdpo=;
        b=aL7Ub/CMuaLxEhr5Hg6g0spAobTx7EOMF5+mJ4C9g/YovhzyT85/MAxPXBbVOSTgAe
         SQE2UxMhs4TE121NVNbgLk4ULk4OIpzw69E/M9qjbcLwF0H7kiodtuW4aB+W5/XJ+X6L
         3QICjBczOXk76G5c5cdj6RXbuSzqp1alrhEJz8HRgvv6awMeG1xs97vIHwA4637+9ioq
         VKXQ64wWcAP38aiV+oppzfKPZ971o7uFiiazAdqQ3qc6kOKE5fgfnfbiZEPVx37APrVL
         6jcKWffbprF+vUwpwO+2aplDKXbnl9Q0TNIz2IXCYo+xebi3dtTvJZ8A2QlO1a9FqA33
         iF3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776705367; x=1777310167;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b8autXOz4+KZwRvZdblx2ysMt7DyheBXaGlu2LgBdpo=;
        b=D08ocA+ZZvkcTdwJ+5FPHOjKsYvgbjUiQG1v5C0MONgZukl47SAadLQR7wjFCOefIR
         CfUnfdivCKXkS9eyUBYx1BhOB+Z25XuXcTZpTNMmEySWirLVgifs0xt0c2D05n+UcPmt
         jRbl3TIWXUGykJSDFb4Ymn1MsBgeVyO7j4HOslsNmtfr41N2GStaWhF+9fzYoxVketLs
         dx905LCc9mM28z/39mIVdJX2qWIUPIlrAm+2xbYayiAx5kGTlazl3TOd0JqNB44Jxl49
         9Nav1Ph7dD/A8gDnHJajucOl9UkwMt9UzSPn9U80zvS4d7SvLMdGB3lmeVb6n3+SaED8
         BsvQ==
X-Forwarded-Encrypted: i=1; AFNElJ/TU4nRnW37R8+6oBpyIUzPLFgldURbg4g1SuF4HVBecaCGkWNWL2FTPrUYxZSzQlu/dTEN7WWcXt07ZYzDVg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxwzlOFMvE/JMOdy/Lp6z5F39dPGDvidpoCU7JOAqVUBKSCIF89
	Rz4MgRKx+pzrbn49nHOUWpIrBSy8rVgrtOB+oOR6AdU8oZuXSlETOyKX
X-Gm-Gg: AeBDieuW8q1CdrFvTy/08h2R1IfvVNeuuM6RRmT7f54ZN6PQo8Wsq5rsSfGbVrGTPvo
	MrIHJlUFTyPUmLpPaozsw8Txv4WA7Y/7HCMXowHkVT+afOOImECgn/l6VBjKSbjeHuSE2VkuRz+
	B+iMKucCUFyjQaNUCK/5SKSSgJ0goxRCDdJsRpytG0Sa0KMXTyB6qKdXpCYXLQyzdLh2k6sLIMc
	5D4QzeHsAovQoDBJKdoVpqGJjDsVq6cmpQGOlxLLHJSX0bzyVv1FSYYLKwCiDxwGKzTJH1lA2gB
	7FZnCXVmT79x+d7doD2waw1SL8eTQyUrOV5qfQF5DFKAP4zrPW2QHpNMMRURVbjlfCNvMPq650L
	UXeV5Qlks1RymAqgnoXQY9C479mkUscetDtTCSf1eAwwu0/4DBp9rTjcupNrmUrUl5fwaT/0tWu
	Go/38i4J2juhS06/3qwNmHrdmsTI2MqBdWQ4R2o4QbLmZ/Q4xD5z/zNIzTBAaJt0T5X2pdEV7ql
	M4=
X-Received: by 2002:a05:7022:6627:b0:128:d362:31e8 with SMTP id a92af1059eb24-12c73f95c9bmr7706236c88.20.1776705367122;
        Mon, 20 Apr 2026 10:16:07 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:1a4e:4965:5dff:cdee])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e7025cf413sm9717145eec.15.2026.04.20.10.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 10:16:06 -0700 (PDT)
Date: Mon, 20 Apr 2026 10:16:02 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: robin@protonic.nl, andy@kernel.org, geert@linux-m68k.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	hvilleneuve@dimonoff.com, mkorpershoek@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, lee@kernel.org, alexander.sverdlin@gmail.com, 
	marek.vasut@gmail.com, akurz@blala.de, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v5 4/4] Input: charlieplex_keypad: add GPIO charlieplex
 keypad
Message-ID: <aeZe7XoDbOMqMG_c@google.com>
References: <20260312180304.3865850-1-hugo@hugovil.com>
 <20260312180304.3865850-5-hugo@hugovil.com>
 <aeWtDA7snjJmiF9K@google.com>
 <20260420110159.29ccb815eb584bca18a407ac@hugovil.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420110159.29ccb815eb584bca18a407ac@hugovil.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_101608_341674_CA928123 
X-CRM114-Status: GOOD (  10.56  )
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

On Mon, Apr 20, 2026 at 11:01:59AM -0400, Hugo Villeneuve wrote:
> I tested it on the real hardware and all is good.

Thank you for testing the changes.

> 
> So I imagine that it can still go into 7.1 since it is a new driver
> and not a modification of an existing one?

Yes, since this is a new driver I will include it in 7.1 pull request.

Thanks.

-- 
Dmitry

