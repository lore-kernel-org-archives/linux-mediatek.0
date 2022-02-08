Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED76C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Feb 2022 05:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lpBE0CG1i7atvtGz+1R91ZtOeTJKMXT1KBgxE1uq2qI=; b=5FG9YXjqHN8s8w
	MQ5k/0EI/is00c0CRi9irCno/9zv+I1wbjwPCCVLUFlV8DuiZW9TydktCMmAkes5pUxbv78Kz9aRn
	CSTGPUYGhHSqKURkBGUj3WWpsn3rjYqg4tN6igOhly0pc0SXAaRDQNFCVmALfrlu4ztYxKHxF3RPk
	/5zM3V3CDPNiIK5OlCrBcIeT/0Jx8U54QpYkqQhqOLq99xaTuMq+mjZPAe2fC0wFNcLs48B6UlqL6
	rq/I0XVttVd/O659+pjNWj4JR0oLG4lUlVcpkVOS24wqdFbvXgOYfEiFtAOYjP/HFHzl/zfJx2vDv
	NCikG3WV1ufUI9W6aPeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHJQA-00CYtT-Sv; Tue, 08 Feb 2022 05:52:10 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHJPt-00CYmF-0z; Tue, 08 Feb 2022 05:51:58 +0000
Received: by mail-pf1-x436.google.com with SMTP id n32so17037267pfv.11;
 Mon, 07 Feb 2022 21:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=qPomn2aTiO/Wqql0j5UpXavLHxVxjTovhC2XCkgw4r8=;
 b=JF+6fUvAFE9hNgvPF9O092aY/u6NFl4UKjZIie/kuUdmWWpmAuTihMJ/vuFk7CV//9
 WfqwUgGUFBDA2INXy3l94V0BeoMahLk4ohguaYeVg4jk+LbrBwEHUKxEi79JBIZjeXZT
 vkpYq+dx4Zf0IiHoGhb4GxXoGmQ3b8NgCaUTS6W8s9yDtLo1IqcaQE8RpcIagNidBA8L
 b6bYkfw1KK/sKEAQcIV7tdF9V8loeFqfVSjD/rxRZuONBIM8GIZUsM2O0Mvwy4fZ2VPA
 elMCHSMr/pKihL/mFM64l7lAw0JDCNQ1gy9pw9+Ohbw8v6QgnuGLd5+P/B5jJpBBRF8S
 xWUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qPomn2aTiO/Wqql0j5UpXavLHxVxjTovhC2XCkgw4r8=;
 b=4WYB/L4vAAMUpwU89FWHW1drOQQcgB0C8LJ+b7jBW2ndQZOfGx1meb/3KCNZ41jHze
 +wr3d1lbEBRTwaKWc1LfRk2ffoaIeBaWQEyiH32cWLUFxmrFqZeOxHi00GmiIUlGtUb1
 4C/vtMGSlUClE+y5DWT8TMJCNV0oGK0/PJ5EuF9RZwTZTkewyDjW6IgNnD7wn08pRgxb
 PcTMjN9PN7Be9eStu31J3l95+Sg0Tbs3bVBMvVUp071dXOZ2uSBr38QTD78kCtJgw8SJ
 dJh12Bwg9O1upii3ZtFrJcUXkZUKjf7c4CIOMYEw55QcIW8yFQrEeXudSdzuY2OqNGd2
 kvAQ==
X-Gm-Message-State: AOAM532fnaRnEZhp4RayzRUnWZ0PCQs37Qrvf+5y90ibDoGiGx50tFwT
 y5mZ/x0dLXv5zM2HZLOlL7XQH8QiGLQ=
X-Google-Smtp-Source: ABdhPJxTi6c7zODiZt4BTMaMo4DcM8IRpV84XC6QGJ4NBxpob/G/3wllUDpw6QP+C11lZD20O8t6Xw==
X-Received: by 2002:a63:171a:: with SMTP id x26mr2265185pgl.447.1644299512234; 
 Mon, 07 Feb 2022 21:51:52 -0800 (PST)
Received: from google.com ([2620:15c:202:201:7164:d581:d7ee:53bb])
 by smtp.gmail.com with ESMTPSA id h15sm231154pgn.4.2022.02.07.21.51.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 21:51:51 -0800 (PST)
Date: Mon, 7 Feb 2022 21:51:48 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Fabien Parent <fparent@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 2/4] dt-bindings: input: mtk-pmic-keys: add MT6358
 binding definition
Message-ID: <YgIE9NjPGEPlwgtz@google.com>
References: <20220121140323.4080640-1-mkorpershoek@baylibre.com>
 <20220121140323.4080640-3-mkorpershoek@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220121140323.4080640-3-mkorpershoek@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220207_215153_087262_F1460DD6 
X-CRM114-Status: GOOD (  10.15  )
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

On Fri, Jan 21, 2022 at 03:03:21PM +0100, Mattijs Korpershoek wrote:
> Add the binding documentation of the mtk-pmic-keys for the MT6358 PMICs.
> 
> MT6358 is a little different since it used separate IRQs for the
> release key (_r) event
> 
> Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
> Acked-by: Rob Herring <robh@kernel.org>

Applied, thank you.

-- 
Dmitry

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
