Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABEBCC3271E
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jul 2024 15:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rmMcWJDWddZ+picxfKjZFzOici3MGNiRa1gdBP04TCg=; b=R+8IzZyipZfsBMe6cbCTPJ2tG3
	SSrqy/T77h614Gdt63IajUXvmXZIIOHsLYiIgaEmZBk//+x7mGhfUnvrbRQ4cd6Au5BSuSv6FbAfO
	4kJmJBV7CJXPw4bXnkQAqBV6XjlgWAGMq8xyrx+gMjGb+9TE7C86OHeq9G2Hms/vf+g4Xva+f2v1Z
	rJUglT/AxDTTXOVBTJDZoPcDYFdEmfVa+VaIdxvl8bFv2BHLpvnBc0V9MbbDyWeOXENRLFdU8J1v2
	ZPTzXHOgxans0w36DvawmexTjwI6DXyZcop/yE3m+EDob2BbRM3on0sr8O190QV/GfYyYsMZ7M5eB
	4KPLprsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPkcu-0000000GIHs-29Zl;
	Fri, 05 Jul 2024 15:13:32 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPkce-0000000GIFB-3K1t;
	Fri, 05 Jul 2024 15:13:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1720192393;
	bh=oUmZVVTb1bwWD8rbWU2EmG9u4kNanX6k86LKJuHxGyk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BAxMFXhz5MxIpKg6E+aFOrU+Mj+VvauyZQMPEStRfvtovKB08cMy5rpEXNnqJ2uGh
	 fmojMWaeJ2pVnndolKNh64rKPLp49HkhxbHF9gQfMPLJ972q1e0tw9ysXl2X5acn3c
	 lUEPB6UaQY4AXahLbg8NrdqfZf4hG4efWrkp6vzsljjhqml9oyBEsD1vNHhp8/dybF
	 bcXfuJBS2fRvJKn15XIl0Y9w1khN+LeUVJczr0AlDJgovMTM58Eq+W5JFP6EvVXwLY
	 FeIH0b0w/uYYww9XHfdap09erVNzhVYh5Qz78r6N34RGidkekFfODpfkVchmqRaIB/
	 YGgQgsttnlJYw==
Received: from notapiano (tango.collaboradmins.com [167.235.144.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 66AAE37800C9;
	Fri,  5 Jul 2024 15:13:11 +0000 (UTC)
Date: Fri, 5 Jul 2024 11:13:09 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, kernel@collabora.com,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] cpufreq: mediatek: Use dev_err_probe in every error path
 in probe
Message-ID: <8602bf12-1b8d-4249-8814-52ecaa29d0ec@notapiano>
References: <20240628-mtk-cpufreq-dvfs-fail-init-err-v1-1-19c55db23011@collabora.com>
 <20240702055703.obendyy2ykbbutrz@vireshk-i7>
 <aa6e93bd-aba2-4e4d-bce9-04e818ac25ed@collabora.com>
 <20240702084307.wwvl5dchxa4frif3@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240702084307.wwvl5dchxa4frif3@vireshk-i7>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_081316_998424_C491C7FB 
X-CRM114-Status: GOOD (  22.12  )
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

On Tue, Jul 02, 2024 at 02:13:07PM +0530, Viresh Kumar wrote:
> On 02-07-24, 10:26, AngeloGioacchino Del Regno wrote:
> > Il 02/07/24 07:57, Viresh Kumar ha scritto:
> > > On 28-06-24, 15:48, Nícolas F. R. A. Prado wrote:
> > > > diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
> > > > @@ -629,11 +630,9 @@ static int mtk_cpufreq_probe(struct platform_device *pdev)
> > > >   	int cpu, ret;
> > > >   	data = dev_get_platdata(&pdev->dev);
> > > > -	if (!data) {
> > > > -		dev_err(&pdev->dev,
> > > > -			"failed to get mtk cpufreq platform data\n");
> > > > -		return -ENODEV;
> > > > -	}
> > > > +	if (!data)
> > > > +		return dev_err_probe(&pdev->dev, -ENODEV,
> > > 
> > > What's the point of calling dev_err_probe() when we know for sure that
> > > the error isn't EPROBE_DEFER ?
> > > 
> > 
> > Logging consistency, that's all; the alternative would be to rewrite the dev_err()
> > messages to be consistent with what dev_err_probe() says, so that'd be
> > dev_err("error %pe: (message)");
> 
> That would be better I guess. There is no point adding inefficient
> code.

Well, that would add duplication of the error format string, and make the error
message (the actual information here) less clear in the source code. Also,
dev_err doesn't return the error so it needs to be written in two lines, instead
of a single one.

Consider it's not just about consistency of the log messages, but consistency of
the source code as well: with so many drivers transitioning to the use of
`return dev_err_probe(...);` patterns, sticking to the pattern means it's
immediately clear what the code does. And it is a desirable pattern because it
removes all boilerplate and leaves just the real information (the error code and
the message).

Besides, the inneficient code amounts to an extra va_list usage and an int
comparison. That would only run once during boot and only in the error path...
I'm confident in saying this won't amount to any real performance gain. So the
usage of dev_err_probe() everywhere for log and source code standardization is
well worth it.

Thanks,
Nícolas

