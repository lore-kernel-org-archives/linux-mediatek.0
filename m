Return-Path: <SRS0=9GQg=CD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 855E5C433E1
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2020 09:21:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 539002068F
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2020 09:21:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KQCFVomQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AklZ0aZu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 539002068F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MVUGB6tk2dsdt3EO3itMrjLzrpleSpL5M5/OAddfpuY=; b=KQCFVomQ6qBHrWIjC+sw2XNmg
	lRpM+aB0WmX2NGmd5d4wNPga35+SIexAxrbB+TtSxeKAoT6q+k4H1xDTqeIpgFbWjfKBN+M7+uTRK
	nk6tUBCCoo+RV9d7dhrgAPrKD74onoZz0AcbJ1vvg1jIDsCdPcn0l9eOrK0OJ6MafQfasBBSLiVfh
	9UgmwYt6VZ3gFEFzS4HBuOkorzbq0pRcLmpLt5d7SVut3nnByl2U61Tt0QLLamPzfgdjCqIXcneIl
	6DcSrw+qxC4hKVw+1fCwefPmzvNPxdorA6M/SuXFDwlwrrQA3UbPsqMqm6DoPe3qvsY9PiqdLEJUx
	C/h+dJ7Ig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAV8t-0005eF-Ag; Tue, 25 Aug 2020 09:21:23 +0000
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAV8o-0005bB-LY; Tue, 25 Aug 2020 09:21:19 +0000
Received: by mail-il1-x142.google.com with SMTP id j9so9782570ilc.11;
 Tue, 25 Aug 2020 02:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=O5ZePddE7+2hNWWo8aSkH/TkS7aUaHrfFN3bU8JewnQ=;
 b=AklZ0aZuCA3+GJ0XJ+PRbCWWB0W1arHTu7OZqdh5V49EiqOpO0rOB/mGE7iOY1tLfb
 hoiKGScSflRxbFxkm4pzX7YttP3A7ZcwYsr2L0CB0foOE3EF0WoHGdj/ilpgJM2dnDOr
 ju1wdEHTC4t/lfElQ9XC2D6AP7CU0uJoXECSmqjfa7fyGiWm8UHHVCuGi9Mog6GRbzS3
 2UOPsIhvT2h8BykHwMAxlXr7cPoYsiUxyrWjbztXm+sHk/n8rO8W1MAyTaslSOO7oW/p
 +wPobgqN4vA5xD60ZVvrS19F2UkiDxFBZIqmPG9OPi7NpElliZpEK6ZGBEpdg8Icy7Q6
 A8hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=O5ZePddE7+2hNWWo8aSkH/TkS7aUaHrfFN3bU8JewnQ=;
 b=I/ZQaFIFpup0DSKOjqnbsqD1SkEIU7mDYBr0XaXDhFLhR7hexVa+P9hV+RQ4/OwXfG
 aAtqlGkftoT8LNu+FcNjtvBLyHE5wpFwbrpgbPQBG+GEQqDgNb6b9ykMFoVraoIIlg6d
 26e6foOxj+OHE0JYKvDHu3JjHRviEkvYMJ3WdFfP7uxoqJG2GgxwUX4BRee1ydokf/P4
 45CA9gYnkRRrzlcLMKbl+GRC7yjGmHs0ZxLmOVvHhxEDbhMTo4LVi+3g19p/a5sQTow8
 zU4omDpTPA5xMMCqvEI3LEXDInd4DksIJBubCFxCVuL3NMFWrX8xNJSxcCMNXMI3gcsE
 xSnA==
X-Gm-Message-State: AOAM531Ge15Uq3ZzZ+ui+4rbrg+8YXtMibmfxQmUoy/koWXY73gWKG6W
 3XufQvmyp/d3mtLqWdexgx8Lt86cfs8vscdZ8Bs=
X-Google-Smtp-Source: ABdhPJwUTHNJrsritlvIyqvwywRovUNlslidY5JbPeOUgN5sF/K+k8KoxiM3CYAkzCB6ZeH4UcpQc/ljrwCFnEkzwbA=
X-Received: by 2002:a92:d386:: with SMTP id o6mr8517221ilo.292.1598347277087; 
 Tue, 25 Aug 2020 02:21:17 -0700 (PDT)
MIME-Version: 1.0
References: <1597910022-22617-1-git-send-email-gene.chen.richtek@gmail.com>
 <1597910022-22617-3-git-send-email-gene.chen.richtek@gmail.com>
 <20200820113015.GB5854@sirena.org.uk>
 <CAE+NS36C0AwbrFJdYGY6_n_g3DVitp_e1GfZUxjMbKu1bJ_t4w@mail.gmail.com>
 <20200824194840.GF4676@sirena.org.uk>
In-Reply-To: <20200824194840.GF4676@sirena.org.uk>
From: Gene Chen <gene.chen.richtek@gmail.com>
Date: Tue, 25 Aug 2020 17:21:06 +0800
Message-ID: <CAE+NS37p38dAN1bAi_VvEYYGNiWDVFKrdHL-hTgi2nim_7Zvqw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] regulator: mt6360: Add DT binding documentation
To: Mark Brown <broonie@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_052118_748437_56EDE906 
X-CRM114-Status: GOOD (  12.28  )
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
Cc: Gene Chen <gene_chen@richtek.com>, devicetree@vger.kernel.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

TWFyayBCcm93biA8YnJvb25pZUBrZXJuZWwub3JnPiDmlrwgMjAyMOW5tDjmnIgyNeaXpSDpgLHk
uowg5LiK5Y2IMzo0OeWvq+mBk++8mgo+Cj4gT24gTW9uLCBBdWcgMjQsIDIwMjAgYXQgMDM6MjE6
NTdQTSArMDgwMCwgR2VuZSBDaGVuIHdyb3RlOgo+ID4gPiBPbiBUaHUsIEF1ZyAyMCwgMjAyMCBh
dCAwMzo1Mzo0MlBNICswODAwLCBHZW5lIENoZW4gd3JvdGU6Cj4KPiA+ID4gPiArICBMRE9fVklO
My1zdXBwbHk6Cj4gPiA+ID4gKyAgICBkZXNjcmlwdGlvbjogSW5wdXQgc3VwcGx5IHBoYW5kbGUo
cykgZm9yIExETzMKPgo+ID4gPiBPbmx5IExETzMgbmVlZHMgYSBzdXBwbHk/Cj4KPiA+IExET19W
SU4xL0xET19WSU4yIGlzIHJlYWwgTVQ2MzYwIHBpbiBzdXBwbHkgZnJvbSBWU1lTIHRvIExETzEv
Mi8zLzUKPiA+IExET19WSU4zIGlzIGFsc28gcmVhbCBwaW4gc3VwcGx5IGZyb20gQlVDSzIgdG8g
TERPNi83Cj4KPiBTbyBzaG91bGRuJ3QgdGhlcmUgYmUgYSBkb2N1bWVudGVkIExET19WSU4xLzIg
dGhlbj8KCkxET19WSU54IGlzIEhXIGRlc2lnbiBsYXlvdXQsIHNvIGFjdHVhbGx5IGl0IGNhbid0
IGJlIGNoYW5nZWQgYnkgZGV2aWNlIHRyZWUuCkxET19WSU4xL0xET19WSU4yIHN1cHBseSBmcm9t
IFZTWVMsIG5vdCByZWd1bGF0b3IsIHNvIEkgdGhpbmsgdXN1YWxseQpub3QgdG8gc2hvdyB0aGUg
c3VwcGx5IGZyb20gaW4gZGV2aWNlIHRyZWUuCm9yIEkgc2hvdWxkIGRlY2xhcmUgYSBkdW1teSBy
ZWZlcmVuY2UgdG8gc3lzdGVtIHBvd2VyIGxpa2UgIiotc3VwcGx5ID0KPCZzeXN0ZW1fcG93ZXI+
OyI/CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlh
dGVrCg==
