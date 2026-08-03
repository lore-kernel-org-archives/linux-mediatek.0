Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1925CC55184
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2026 14:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VmoRzRSGaYrgmLSXQHd8nxnywAiGDAxo7QcVjOS8Dtk=; b=Bp9dGk5lACSiv2qHJldwzDIlum
	smvwtBBTRXIToF12+pRONYi3zB7UXyYw+p/J8UAOIK+gethwWZIc9zWk78ufPsIS5UxW9WFyCF7qu
	lmTi9CJ26p53cRMJPtINH24BRyA7rXi3XpY+BEqXSff8vV2nybdapRsF8GnkGxs1bTRJRa1A1rtnX
	kThV5/SeIVmjUxIzY+FEqDNGuX/ZWXjnHGZDaswt9fNRYI1+4qhivAFul++Z9HjMrS/5bUdOFaB8k
	hEoyKYas3VymfiS39kYscsdZy8kzklzl/wavBFp5Ado0drm3RRfbiJRzeltLzDRHqoSwQTVyCLhu4
	OqYGThxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtpw-0000000HPfU-0ZuN;
	Mon, 03 Aug 2026 14:40:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtpt-0000000HPe3-1EGr
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Aug 2026 14:40:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785768012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VmoRzRSGaYrgmLSXQHd8nxnywAiGDAxo7QcVjOS8Dtk=;
	b=Vd59kCVyh9AMk2fWhFJQPRZ6jnzTsVfI4pUeRdrPUxZbcl6VeSpKZIz+gOW6InDIcfL/5p
	laolMSpCF3+19kMI6Qaym32IraMqW2TcaKmQUPYR3PsvyDT5RAWGS3FvtVtubgFHdA+KVT
	+LSjid9lo38/JCnYWsLzI9ndt4XfsoM=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-Lh-m0Ls6Mu2b1URqhmSMfg-1; Mon, 03 Aug 2026 10:40:05 -0400
X-MC-Unique: Lh-m0Ls6Mu2b1URqhmSMfg-1
X-Mimecast-MFC-AGG-ID: Lh-m0Ls6Mu2b1URqhmSMfg_1785768005
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-81e7b95cd84so58249857b3.0
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Aug 2026 07:40:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785768005; x=1786372805;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VmoRzRSGaYrgmLSXQHd8nxnywAiGDAxo7QcVjOS8Dtk=;
        b=CcfLSWb41ckAS5NDqqeoePS497RlGbV+B31U2NSUVIIwt+uMEmP0KNBXikTyh9/5Oi
         /V3Us82IBHPFpR9ngqWzdrpMomJEJjBYJUkSqyW8J2alXODgyHxS4NjzeeEeDOc9u6lH
         ZluBAQ/PLfGlCGGsuZpbIf+cog8cepyFDIHhc1eqSzRNDxCT8rGwveWBtDMX9l39E9Yc
         iuyEAfsxzRnCArAZoRypadY3OxbBWGBT8XDrVT0o5RuYQNPDYWOaDhxTNY8Sk6hRiXM1
         4fa0yWeZtZLADRR1VAoevy0j5ZRIVAOla2FHIBpvA12b//UCr56gnUIWUxwxCPDbY4s6
         buew==
X-Forwarded-Encrypted: i=1; AHgh+RooAIxlyESdQSanG9IFpuL637XCbO4afCIGF38b/fLaHjFFLjV8NAHCAs02OqYR+WLn8ina2ibDyDsoSbZuYw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxwxlmQJ1ZnPi9ns38ckdr+xSzcTJ3aiQ33xpwO2o6JLK36Ac65
	an00dLc/guc3jziLe2NlrR/syi1Vu3mTFu7x2Zz3I5npSWUCKJ6XrhY6f89J2Rb78Mr5WDeN0qH
	bvR7E5fGgNQGy+X64vglsTaF58PWdg7c1FIYbY7NlRoItBSitck1unUXkG9bkuSKcULeeNQmWPg
	==
X-Gm-Gg: AR+sD11lBNxTTbLPfW2+U3vSJsGtW94Wcsgu2xt153LIcD7KhRV4akNtMYpxcoRWdIL
	gTSwY47lVZXoPZHSl0rPWZUBMX+3PwVDQ+0uzBJ7rpcJMbhrm031UnehO/GSJ7XV1LV5wWgQErH
	UDOxG4T91WHYU6fgfWeRj5r85OhUk0i/KekpHWPRn1KPYU5/Ylxo/Ynn5iEj27JprzRb1n+TqIG
	64vPqG6yCuQNmd7cGPZJKpzxhGJRl4fAw7J9w5wm6UVcsSC3Kw6yV1PzvUVhq9mdL6U+nHC2k8y
	bKVZQsEWb56G5OyPk40K1xKyJKufr8JVQzQtAL8Kri5evlPULjzXII9XurX+VNifLy2i5E3ja/g
	ixAjhYXehXLhlxVU2mR2gbdbS5Zvf7vqnijE=
X-Received: by 2002:a05:690c:6b0b:b0:81e:5a57:b8ad with SMTP id 00721157ae682-81fd4b51df0mr122408367b3.21.1785768005032;
        Mon, 03 Aug 2026 07:40:05 -0700 (PDT)
X-Received: by 2002:a05:690c:6b0b:b0:81e:5a57:b8ad with SMTP id 00721157ae682-81fd4b51df0mr122407797b3.21.1785768004486;
        Mon, 03 Aug 2026 07:40:04 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fcd0d6fbbsm55781147b3.25.2026.08.03.07.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:40:03 -0700 (PDT)
Date: Mon, 3 Aug 2026 10:40:01 -0400
From: Brian Masney <bmasney@redhat.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH v5 12/25] clk: mediatek: pll: Add PLL stabilization delay
 definition
Message-ID: <anCoQeS2OoucB0mO@redhat.com>
References: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
 <20260801-mt8189-clocks-system-base-v5-12-ac4410697cc2@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20260801-mt8189-clocks-system-base-v5-12-ac4410697cc2@collabora.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NI25muQlbIWA0_4m8Ob_qFwullrwQvIChEkDc9d1_pw_1785768005
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_074013_404436_A29FD62E 
X-CRM114-Status: UNSURE (   9.67  )
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

On Sat, Aug 01, 2026 at 01:20:58PM +0200, Louis-Alexis Eyraud wrote:
> Several functions uses a hardcoded value (20), to represent the
> needed delay to stabilize a PLL.
> Add a common define for this value.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


