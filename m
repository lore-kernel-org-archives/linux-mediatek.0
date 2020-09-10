Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D7C1C43461
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 05:34:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA1FB20719
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 05:34:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NWLjZweL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CAEWlx6I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA1FB20719
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ezlQQ1gvXnwv+oMWxW80Bv0btebjpaS+ZarFwomur+s=; b=NWLjZweLq/7zJweF9rAn+hlIK
	xA7NfBYpemLXqrSgOEcRNPu9g2UthgMIJaDzaNGMuJtdaGPZ4ApA4gurcjdtK8NvcAYZlCoHvSmOD
	6NlaDqeJd3l1aY5/0vXN6t0nrxtTfHsB+4+a9WgubwabM/lSL3nI5MPk72XjSfrbqxEenqvbVipc+
	xOObTJZlRbIsSkqNaI1V2vXdw+AqPJtN5K6exjIjlxXcrAtFin43xMW1obkeXYn7trDLDBW23D3Yb
	JbilBlu+td8FWJJOD0GonzfUd/3I3PzTIlXB4bd4snPGre3+k6+wsp0J+1mn0unQSYqQBDgH9TIb+
	IEJC+uGpQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGFE4-00057s-3R; Thu, 10 Sep 2020 05:34:28 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGFDx-00055K-DK
 for linux-mediatek@lists.infradead.org; Thu, 10 Sep 2020 05:34:22 +0000
Received: by mail-pj1-x1043.google.com with SMTP id kk9so2481575pjb.2
 for <linux-mediatek@lists.infradead.org>; Wed, 09 Sep 2020 22:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=5lEi/XoDUJ11Wa7F5s06RrCLa2hPWxpKnO1zR9YxyoY=;
 b=CAEWlx6IuBLlkVsW+lOwMOeCTijAw1MpiQ3Ubb2OiqpnJtMewM1XNtUAhSIg1ikgvE
 JpQ79qJ6W+TpKYmuBH7/eBcz5WKzj9GaDsUqhxos2YpwlQsr8aEn9N36PdsFS0hDWe6y
 cNhiV778PgC5as9xtK6R0NroTicROjr76SN0u0Pi4chuP8X3ibTcn/DO0e02C6/yTFtK
 q0uHIk25Jr73tNAPDUqN0E/KWZ2FKnNQcJBseJJm25c6Sm0RT8fYscQXhoYRyGZbGG83
 SI6aRY5TTQMwlVObPlooDffFy48lbHaXcaYOfHW0nENuCCHAJsdeecPwwCjiEoRllUoh
 P+xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5lEi/XoDUJ11Wa7F5s06RrCLa2hPWxpKnO1zR9YxyoY=;
 b=hVIPaDI6Pz7CD0+aCI0As+IfShuMWuifmiLTLogW5fwVYxDZFI03w2Z2qKnVhKaYHN
 1s1VbY7AcYg9y+lBDsnYkNk2dlyeg7l4vBlR/2Mgaiv8jpp5P2tmwqVDdUw+PGbXnSHO
 J9VtxgSl3pW5i3N4RezKIa7Pu2+AHY9EmRLe8LfujESnW9wwW27e7/Rq0ZqiTgQTEkh4
 Vo/9O2bl4z5JsLhFLLzjLiVVzhKua0s/epHmyFr+wTdg5Mh0WEA9q8RExglKWo8ISFgc
 R+QBFtvS42FASdtfODG4Ck1xvMGoWtrSd0OaDd979/hWaERbYFWTwJLpeZXyfMFbcTHg
 ZhAw==
X-Gm-Message-State: AOAM532/jV6Ob/n/ZKjG8CZa+/MmykGakRsBtjPyT1AD2nSmn+kNIRB3
 nIh4yNpGHM8oSqTxJB0TYTu0Yw==
X-Google-Smtp-Source: ABdhPJz3EgNE/dzdl1waBSoWGoWNzDHErjWDYYygsBmeO19Q5FRz5rTWYfVjdhPhDSbWLy3fyrzRsA==
X-Received: by 2002:a17:90a:d315:: with SMTP id
 p21mr3945874pju.88.1599716059106; 
 Wed, 09 Sep 2020 22:34:19 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id w203sm4575162pff.0.2020.09.09.22.34.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 09 Sep 2020 22:34:18 -0700 (PDT)
Date: Thu, 10 Sep 2020 11:04:06 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Hector Yuan <hector.yuan@mediatek.com>
Subject: Re: [PATCH v7] cpufreq: mediatek-hw: Add support for Mediatek
 cpufreq HW driver
Message-ID: <20200910053406.t37rgioykzvk3oem@vireshk-i7>
References: <1599712262-8819-1-git-send-email-hector.yuan@mediatek.com>
 <20200910050341.pgyieq3q7ijitosn@vireshk-i7>
 <1599715851.7042.9.camel@mtkswgap22>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1599715851.7042.9.camel@mtkswgap22>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_013421_750334_7A1E56AB 
X-CRM114-Status: GOOD (  18.74  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 10-09-20, 13:30, Hector Yuan wrote:
> On Thu, 2020-09-10 at 10:33 +0530, Viresh Kumar wrote:
> > On 10-09-20, 12:31, Hector Yuan wrote:
> > > The CPUfreq HW present in some Mediatek chipsets offloads the steps necessary for changing the frequency of CPUs. 
> > > The driver implements the cpufreq driver interface for this hardware engine. 
> > > 
> > > This patch depends on the MT6779 DTS patch submitted by Hanks Chen
> > >  https://lkml.org/lkml/2020/8/4/1094
> > 
> > Thanks for hanging there. Looks good to me. I will apply it once Rob
> > Ack's the binding patch.
> > 
> 
> Many thanks for your help. May I know if you can add Reviewed-by tag to
> this patch set.

Since this patchset is going to get merged via my tree (ARM cpufreq
tree), a reviewed-by isn't required here. I will queue it up for
5.10-rc1 after I receive an Ack from Rob.

> I would like to prepare some patches for more features
> based on this. Is that okay to you? Thanks again.

That should be fine.

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
