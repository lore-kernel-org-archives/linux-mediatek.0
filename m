Return-Path: <SRS0=lKUU=7K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F00AC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2020 14:49:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C1A420814
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2020 14:49:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KFYmXEch";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="K6fYhbLN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C1A420814
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b03fnDziU49Ju6nIh1kBBQAN/rLVdAyYFIgUSnc5nIY=; b=KFYmXEchR3V59s
	E7YlwOCDLUMl0gsieRN1cEx+PWVo3WeFGvfaIjD2A43KVsWCfy80oCzeHdN7ym/hhaf/6AapOdugY
	iw3FekCe/Cvo/f8dY0gopx0Cb2mPw0ZpVQsghr1CBX7K4i42Czo4DSdKJQANenhgq+SHru2njSils
	jG1jBHj9Q0Uu1OeDI58WKrtjBTXq1qAOptTjsJF0bxjcfIOkLNkG6Afcw94Zd3+Bo4Cu39IjkwLUK
	/IUaQoecTxdGf1E7xEmVLgkOg1r1Urk1wMB0q6lPU3ypZqWW6vH165C82bRQcYNsnnNN7CA39DKuq
	WkIBKT/j6sgcD9T2Z6WQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeJqc-0002IA-3Y; Thu, 28 May 2020 14:49:30 +0000
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeJqQ-00022d-Bx
 for linux-mediatek@lists.infradead.org; Thu, 28 May 2020 14:49:20 +0000
Received: by mail-qk1-x742.google.com with SMTP id n141so3340269qke.2
 for <linux-mediatek@lists.infradead.org>; Thu, 28 May 2020 07:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7bgiq+hLHRX0DJp5HGAPibY152zraWoS1bf1ZUi8yr0=;
 b=K6fYhbLNN80hW3Pf3S2Qo3jCZMiRm8Yyt2Z0WsGO9l1UOg9rbBt4EhiCgeduYh9v2J
 Cu+K0SqzPmLZEo0x+tipWKiL/HHRuemXF65qU7QlS++2O92h6Rtz1FBrTLKpQxSF65dv
 yiRzSumOTtlF5dDuF9zxCbR1UIzy1aAXD1FkiNwIYn2Wm0PiF4uKafoFpnA6QtXtWbyQ
 Lvs6IVTwvtYeO96emfrhmenqmqgc1PdidYI3hbgg1K3+lk99R+yYx2lFOhs45rHz9LTf
 jR/cMidGMOI0O4ABpSJmCcDzcW6V1cd69mNF9Unv6ByQxucGJBA1oELurTpg3ZrLS6xa
 qT5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7bgiq+hLHRX0DJp5HGAPibY152zraWoS1bf1ZUi8yr0=;
 b=HnRjGC0Oq5k9TEH7Fkxz1pqc8FCdWB7UkHd+dDEKBN0MIVmzkhnEEBhTbCACYt6QYq
 uMPN+CpCXWMVweGlWerL3LlK0Q2DQVgcy0EJpV9/uZ2wfT7OymRX4kGVra61iNLgNblV
 bIvBm1lHeqWTbrG09OuZt1gubuLIjahFcbdL/4fqTV+oLVIbRt9PGWDDaip5/Mjia6yC
 m5glrvgLvRH24z1vtGq/lqoWwXpjNSxpA5WemigIoZTRU1WCuTtnjPrQ7/38MCNwzf1t
 P00wzn+94tqF1ESE6UQP2pZOdRmByKfWozqPGpHQubNHK3IyERICbu6lC1N7rl16k4ba
 BBkQ==
X-Gm-Message-State: AOAM530gKoG7VOFqppmha93W0bg5bcv7Twdk34ZhhKJlrW/zrMAxP38e
 6337AoXkiZcs/iKj3N8rWLL/w9QgrsUE8FJyQ7fElw==
X-Google-Smtp-Source: ABdhPJwMqRBjwPsgwb2FUKECIe64ZjaPiVPeaWousPYaYOHlGL5MTRIVN7nLAwXJjVoc8/Otc86MvbDhvL+AxdAQhlE=
X-Received: by 2002:a37:dd6:: with SMTP id 205mr2993984qkn.323.1590677357382; 
 Thu, 28 May 2020 07:49:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200528142241.20466-1-brgl@bgdev.pl>
 <20200528142241.20466-2-brgl@bgdev.pl>
 <20200528144456.GG3606@sirena.org.uk>
In-Reply-To: <20200528144456.GG3606@sirena.org.uk>
From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Thu, 28 May 2020 16:49:06 +0200
Message-ID: <CAMpxmJVB_L+otX2u80qwGjw4TXCJtwOXe=t11O4Daq3miMVk6Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] regmap: provide helpers for simple bit operations
To: Mark Brown <broonie@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_074918_409781_25E7BAE7 
X-CRM114-Status: UNSURE (   6.86  )
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
Cc: Stephane Le Provost <stephane.leprovost@mediatek.com>,
 netdev <netdev@vger.kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Sean Wang <sean.wang@mediatek.com>, LKML <linux-kernel@vger.kernel.org>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, Fabien Parent <fparent@baylibre.com>,
 Pedro Tsai <pedro.tsai@mediatek.com>, linux-mediatek@lists.infradead.org,
 Andrew Perepech <andrew.perepech@mediatek.com>,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 arm-soc <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Y3p3LiwgMjggbWFqIDIwMjAgbyAxNjo0NSBNYXJrIEJyb3duIDxicm9vbmllQGtlcm5lbC5vcmc+
IG5hcGlzYcWCKGEpOgo+Cj4gT24gVGh1LCBNYXkgMjgsIDIwMjAgYXQgMDQ6MjI6NDBQTSArMDIw
MCwgQmFydG9zeiBHb2xhc3pld3NraSB3cm90ZToKPgo+ID4gKyAgICAgcmV0dXJuICh2YWwgJiBi
aXRzKSA9PSBiaXRzID8gMSA6IDA7Cj4KPiBUaGUgdGVuZXJ5IGhlcmUgaXMgcmVkdW5kYW50LCBp
dCdzIGNvbnZlcnRpbmcgYSBib29sZWFuIHZhbHVlIGludG8gYQo+IGJvb2xlYW4gdmFsdWUuICBP
dGhlcndpc2UgdGhpcyBsb29rcyBnb29kLgoKRG8geW91IG1pbmQgaWYgSSByZXNwaW4gaXQgcmln
aHQgYXdheT8gSSBkb24ndCB3YW50IHRvIHNwYW0gdGhlIGxpc3QuCgpCYXJ0b3N6CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBt
YWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
