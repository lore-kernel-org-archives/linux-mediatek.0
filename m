Return-Path: <SRS0=6pE3=3C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46835C33CA9
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jan 2020 19:11:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CF6821556
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jan 2020 19:11:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bO9f77mw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CF6821556
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	References:Subject:To:From:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=gq85vt3VC/Z0aHLyVjneESmhE4FN8Ia3vtB8rQW/qJs=; b=bO9f77mwlRwtyhOw1RpDVDz/ex
	wlwfNzKKUJaq7cvkgPycmJqUTpMbMmFhqxP4+gIkjkEcnh+rFLXtbJt0RzabU7lcp+NPzEdMGNwoX
	QM3wnN+rFHmi5BUWIAkjuVxTw4i2lW1agz6Iq3foJGlSbLqoPsoNCR1y2jSwfA8ofDhvmOgVyjXcd
	CQuqr9eWeMT/byivPb1aiFUJXeItp9h0Yy93DtO+0xvakXPZMLgaXgcbUjMCPHGnlw0azcJhiZugF
	RFauNXwRv11+x1dlnnmroI80az/00LlqFHWReTChwUrKs5yjx+o9T8Mlddp/CqeUiKp1o+eHuDCxT
	T4caHGbw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ir57F-00072m-4B; Mon, 13 Jan 2020 19:11:09 +0000
Received: from mail-pf1-f194.google.com ([209.85.210.194])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ir56w-0006ly-07; Mon, 13 Jan 2020 19:10:53 +0000
Received: by mail-pf1-f194.google.com with SMTP id x185so5321229pfc.5;
 Mon, 13 Jan 2020 11:10:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:from:to:cc:cc:cc:subject
 :references:in-reply-to;
 bh=TKkoejQV2c6zTi0Lk84zRP/sLh+dHPb6nJ3LQs91rO0=;
 b=qvWDRqgEuyO1vGHwEylGdjs0b+S9Z7w/wmDTvjCRa44D5rCp3W8J5yHftjVWmtZmRH
 KwN+gSNicb6yCw6hbuDM1gY3ukxaSmGWQmgs5SV/IObDdNa5lRhQ2+pGLc6k8+stjX1X
 A9rvxvPA59rOAdhVUmX0P2+lPE0QaLvL32G9SMEjTy+/slWylNPCO4+9bfmzobk+UlrG
 ern0Ld5KSzVdxicebnP5vw63zP2J34pCbfYNg/yzbogws+oCfZCfbm35RwR4WK+xwdbS
 JroW3hBBisGG35OsRqbmuu5fhHQf8FlXk77nRouivVSFIKAB2CwgZE8LoAbtdGABnwt5
 aCdg==
X-Gm-Message-State: APjAAAVJDp7uDI32YSNk9nM1Fk+KgZjwtQeFmTa/pm0m+JsopIE38xfV
 qiT6YlRWLMJSJrDFAMUzatA=
X-Google-Smtp-Source: APXvYqxpcMDnuAK6LNWLusoFsllAJWymSw/KyOmcfqBZ+FKSDh+VYiY8UaD3R5kny7v3CzIXMzUf6w==
X-Received: by 2002:a63:6b07:: with SMTP id g7mr21929891pgc.243.1578942648698; 
 Mon, 13 Jan 2020 11:10:48 -0800 (PST)
Received: from localhost (MIPS-TECHNO.ear1.SanJose1.Level3.net. [4.15.122.74])
 by smtp.gmail.com with ESMTPSA id
 y6sm14563154pgc.10.2020.01.13.11.10.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2020 11:10:47 -0800 (PST)
Message-ID: <5e1cc0b7.1c69fb81.c151b.187c@mx.google.com>
Date: Mon, 13 Jan 2020 11:10:47 -0800
From: Paul Burton <paulburton@kernel.org>
To: Yangtao Li <tiny.windzz@gmail.com>
Subject: Re: [PATCH 08/10] soc: lantiq: convert to
 devm_platform_ioremap_resource
References: <20191214175447.25482-8-tiny.windzz@gmail.com>
In-Reply-To: <20191214175447.25482-8-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200113_111050_052397_F211E6A0 
X-CRM114-Status: UNSURE (   4.14  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Yangtao Li <tiny.windzz@gmail.com>, john@phrozen.org,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 khilman@baylibre.com, krzk@kernel.org, wens@csie.org, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, mripard@kernel.org,
 linux-mediatek@lists.infradead.org, ssantosh@kernel.org,
 matthias.bgg@gmail.com, linux-amlogic@lists.infradead.org,
 bjorn.andersson@linaro.org, linux-arm-kernel@lists.infradead.org,
 shawnguo@kernel.org, linux-mips@vger.kernel.org, leoyang.li@nxp.com,
 kgene@kernel.org, khalasa@piap.pl, jun.nie@linaro.org,
 linuxppc-dev@lists.ozlabs.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello,

Yangtao Li wrote:
> Use devm_platform_ioremap_resource() to simplify code.

Applied to mips-next.

> commit 23c25c732530
> https://git.kernel.org/mips/c/23c25c732530
> 
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> Signed-off-by: Paul Burton <paulburton@kernel.org>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paulburton@kernel.org to report it. ]

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
