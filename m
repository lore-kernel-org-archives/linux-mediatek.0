Return-Path: <SRS0=j594=LR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03A57C4743C
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 05:03:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C71F16100A
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 05:03:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C71F16100A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ingics.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jbq/6TdKv3U0/WPWbTZDAdC7jl7MIKeZUnUMOZpngwU=; b=oD+/qhEqEThfAv
	N7qGRO65o5sZU1Iy7Szx/G8RQ75Qnbb9tOb/K1h/IebSJxPxSzT79hE0DsFMc3BaGdk4srttU3el2
	KFklWOmWzxHExIcruKZRCOWsTtj+/DeLb7HepdG5Cr3N7FpULP4S1vPTXp0SRJOCW783Trj9QEdU0
	NWWZLuivNakqKgmW65eEEkaFl609TQc9knG8g9MF2JKJyygyaStLPJa5SV0iS45Deh6oGPeaKJICm
	qa11Je93EFy9ZkLi5ChDvHaLASgOahXnonwdO2IX8etMqNvwsbi9vhPcTe/goNztqv7WrWCbINtLy
	nLi6BhOCRstURmj7EE/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvv2j-009LI6-En; Wed, 23 Jun 2021 05:03:17 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvv2W-009LFV-JO
 for linux-mediatek@lists.infradead.org; Wed, 23 Jun 2021 05:03:05 +0000
Received: by mail-ej1-x62b.google.com with SMTP id nd37so1949579ejc.3
 for <linux-mediatek@lists.infradead.org>; Tue, 22 Jun 2021 22:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ingics-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tAtp5Od/K+Ng7EzGisI/Fh2LgtQ1VXowqdQ9CgwHf+w=;
 b=VR5pJmCilDDWXmU2nYPb7/0eO2midGphauMyLokGgYk8xMFC3Up+Wv7ZEQhyWojEnc
 UOS+iK5tS22IysfewnWbmUz0wuEPH1CrAsl2AxrTyemsmls0SETIPGk4GJjb8LDTPhPN
 8QEeBbChtWNyHwkh3x7nQgQmX8SKjy1VRJJ9pa/I1Y+HpawphjDTLQet8s8v7bo/kxey
 ggUwe3xVySyYw5Vyli69GR2oIhELGfcE3JMAFbE2GTeBpM4nMxG5qfnHGKdYnaPZSSb5
 4wNoyxqB+bLPnFDr8Sbkoi0QCXXVFz/I1BFKMH3f1COF/+fpWck0Vo4kFKtW0uCxTjUz
 o5Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tAtp5Od/K+Ng7EzGisI/Fh2LgtQ1VXowqdQ9CgwHf+w=;
 b=n0GMe+fuBU6hU6dfbPUyVAferLZpzC02YkSw0Un5uDgbNr7il9rNru7s1z/H/kScER
 01UNzt5hsCMu1ZA48NzAAX5UlKCDyZPSAjoY9FyJqAvO2GVhgn1aVDJ9SpdhSEHseYRo
 Kwk4ClAfoIlLAkv2Ivbvz8aW31H5TC88aCYdKfVNu5AufQANB7/P8MzRkY+DwqmZYtdw
 TUQCnQaKZh6emE6C4VzlxPDttxe8SLe/1Hs9o9JU8RB3T34OWho+jA4xrx0bgtgS/AK0
 BNEnEGwggTVbDIzyWPfhhnhzgjYWGfsosgH1jjNhuanpj6LDrEgCqeDYvwF/xlewqxAD
 AXOQ==
X-Gm-Message-State: AOAM533e1pQAsfluNwb27U+wZBD89RPsWOaeH02maq/I04vyNq6ZGI/s
 vNoX5MWHyBaJxz0mjLOvVQbg9rzqpgK7+g8K/AJRYw==
X-Google-Smtp-Source: ABdhPJwXYAIL2/bjebELtCuyz1BTjVN7LNe1daHhaEHNKj6ZEN6Fir7f3Gbd8MJRZddT32XmP0ucl7LwSrRNlzcRTug=
X-Received: by 2002:a17:906:cc9b:: with SMTP id
 oq27mr7813116ejb.301.1624424582354; 
 Tue, 22 Jun 2021 22:03:02 -0700 (PDT)
MIME-Version: 1.0
References: <1624424169-510-1-git-send-email-hsin-hsiung.wang@mediatek.com>
In-Reply-To: <1624424169-510-1-git-send-email-hsin-hsiung.wang@mediatek.com>
From: Axel Lin <axel.lin@ingics.com>
Date: Wed, 23 Jun 2021 13:02:26 +0800
Message-ID: <CAFRkauCxghVbH1ek7U65oU+zqwAR3LY9M=Dp0H7qYqKyDPjk0g@mail.gmail.com>
Subject: Re: [PATCH] regulator: mt6358: Fix vdram2 .vsel_mask
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_220304_719135_6C514C0D 
X-CRM114-Status: UNSURE (   7.02  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SHNpbi1Ic2l1bmcgV2FuZyA8aHNpbi1oc2l1bmcud2FuZ0BtZWRpYXRlay5jb20+IOaWvCAyMDIx
5bm0NuaciDIz5pelIOmAseS4iSDkuIvljYgxMjo1NuWvq+mBk++8mgo+Cj4gVGhlIHZhbGlkIHZz
ZWwgdmFsdWUgYXJlIDAgYW5kIDEyLCBzbyB0aGUgLnZzZWxfbWFzayBzaG91bGQgYmUgMHhmLgo+
Cj4gU2lnbmVkLW9mZi1ieTogSHNpbi1Ic2l1bmcgV2FuZyA8aHNpbi1oc2l1bmcud2FuZ0BtZWRp
YXRlay5jb20+ClJldmlld2VkLWJ5OiBBeGVsIExpbiA8YXhlbC5saW5AaW5naWNzLmNvbT4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlh
dGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
